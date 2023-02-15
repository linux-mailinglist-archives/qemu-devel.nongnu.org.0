Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E06987C3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 23:23:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSQAv-0001sL-Ml; Wed, 15 Feb 2023 17:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pSQAu-0001rx-06
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:22:52 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pSQAn-00084m-Kx
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 17:22:51 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 686E21F747;
 Wed, 15 Feb 2023 22:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676499762; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oei9/dbvon+nXdOHRSGD99PR4PflPF2gFJGCrx6aKus=;
 b=C7xcY34LtLHlhD+wUlMniJrnF70SdhxjgzYK8il7vEcFWzwhbsJn90zSHGVACi4zTipokk
 Gym4tVaN2kp8oTMdyWwKegQgBce+nMCqWcTIcXcHlDxGSqCcOT4H2Yl3itECPVGKTLStNQ
 QKhrv4kxdbKEIqFv9fvbAoBCz13e/6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676499762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Oei9/dbvon+nXdOHRSGD99PR4PflPF2gFJGCrx6aKus=;
 b=m/q9emG+pgySS5QEguK0+5nW4lojOYGrkUN3kGaL/CMuy5zVSbmbWrMMk3UF2j5GMMXKzX
 qHpVqXAZjXIYZdDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BCB3134BA;
 Wed, 15 Feb 2023 22:22:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TydWAzJb7WPsRAAAMHmgww
 (envelope-from <clopez@suse.de>); Wed, 15 Feb 2023 22:22:42 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] virtio: fix reachable assertion due to stale value of cached
 region size
Date: Wed, 15 Feb 2023 23:14:46 +0100
Message-Id: <20230215221444.29845-1-clopez@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=clopez@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In virtqueue_{split,packed}_get_avail_bytes() descriptors are read
in a loop via MemoryRegionCache regions and calls to
vring_{split,packed}_desc_read() - these take a region cache and the
index of the descriptor to be read.

For direct descriptors we use a cache provided by the caller, whose
size matches that of the virtqueue vring. We limit the number of
descriptors we can read by the size of that vring:

    max = vq->vring.num;
    ...
    MemoryRegionCache *desc_cache = &caches->desc;

For indirect descriptors, we initialize a new cache and limit the
number of descriptors by the size of the intermediate descriptor:

    len = address_space_cache_init(&indirect_desc_cache,
                                   vdev->dma_as,
                                   desc.addr, desc.len, false);
    desc_cache = &indirect_desc_cache;
    ...
    max = desc.len / sizeof(VRingDesc);

However, the first initialization of `max` is done outside the loop
where we process guest descriptors, while the second one is done
inside. This means that a sequence of an indirect descriptor followed
by a direct one will leave a stale value in `max`. If the second
descriptor's `next` field is smaller than the stale value, but
greater than the size of the virtqueue ring (and thus the cached
region), a failed assertion will be triggered in
address_space_read_cached() down the call chain.

Fix this by initializing `max` inside the loop in both functions.

Fixes: 9796d0ac8fb0 ("virtio: use address_space_map/unmap to access descriptors")
Signed-off-by: Carlos López <clopez@suse.de>
---
 hw/virtio/virtio.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f35178f5fc..db70c4976e 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1071,6 +1071,7 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
     VirtIODevice *vdev = vq->vdev;
     unsigned int max, idx;
     unsigned int total_bufs, in_total, out_total;
+    MemoryRegionCache *desc_cache;
     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
     int64_t len = 0;
     int rc;
@@ -1078,15 +1079,13 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
     idx = vq->last_avail_idx;
     total_bufs = in_total = out_total = 0;
 
-    max = vq->vring.num;
-
     while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
-        MemoryRegionCache *desc_cache = &caches->desc;
-        unsigned int num_bufs;
+        unsigned int num_bufs = total_bufs;
         VRingDesc desc;
         unsigned int i;
 
-        num_bufs = total_bufs;
+        desc_cache = &caches->desc;
+        max = vq->vring.num;
 
         if (!virtqueue_get_head(vq, idx++, &i)) {
             goto err;
@@ -1218,14 +1217,14 @@ static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
     wrap_counter = vq->last_avail_wrap_counter;
     total_bufs = in_total = out_total = 0;
 
-    max = vq->vring.num;
-
     for (;;) {
         unsigned int num_bufs = total_bufs;
         unsigned int i = idx;
         int rc;
 
         desc_cache = &caches->desc;
+        max = vq->vring.num;
+
         vring_packed_desc_read(vdev, &desc, desc_cache, idx, true);
         if (!is_desc_avail(desc.flags, wrap_counter)) {
             break;
-- 
2.35.3


