Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6516A7F8A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:05:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfne-0001NW-UZ; Thu, 02 Mar 2023 05:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pXfnc-0001Lg-S4
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:04:32 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clopez@suse.de>) id 1pXfnb-00061m-8H
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:04:32 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A862A21C21;
 Thu,  2 Mar 2023 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677751468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VTO3BcAxs4P15Fzo9ggfJBgWFTutsExgZVQDhnk1WCY=;
 b=WPJEMwyGKc89joWN85TLMMaDuP0cRUffGGaCZsZ3MhJ9DOm6a18nMFzsSA0pz0RqvlmhVO
 U/atQYMTGxTHBuut6Ddt8ElPWc/R//ZRqtKhrgGurJT7wZoABAkBsazzgj7ythGu99WiM9
 qZNS6GP7P/uT9pZtGJpFnIBw38lnxz8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677751468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VTO3BcAxs4P15Fzo9ggfJBgWFTutsExgZVQDhnk1WCY=;
 b=eQ3TigqEfrvA21H0QRlcM6flMg4BY7V/vQVi9iLFnt0aV3+05iA/Kxow0C1dOeHae/7Xou
 hy0QXhzffwbpwVBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5DFD413349;
 Thu,  2 Mar 2023 10:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5W5JFKx0AGRGTgAAMHmgww
 (envelope-from <clopez@suse.de>); Thu, 02 Mar 2023 10:04:28 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2] virtio: fix reachable assertion due to stale value of
 cached region size
Date: Thu,  2 Mar 2023 11:03:59 +0100
Message-Id: <20230302100358.3613-1-clopez@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=clopez@suse.de;
 helo=smtp-out1.suse.de
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
v2: simplify patch by removing variable cleanups

 hw/virtio/virtio.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f35178f5fc..98c4819fcc 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1069,7 +1069,7 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
                             VRingMemoryRegionCaches *caches)
 {
     VirtIODevice *vdev = vq->vdev;
-    unsigned int max, idx;
+    unsigned int idx;
     unsigned int total_bufs, in_total, out_total;
     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
     int64_t len = 0;
@@ -1078,13 +1078,12 @@ static void virtqueue_split_get_avail_bytes(VirtQueue *vq,
     idx = vq->last_avail_idx;
     total_bufs = in_total = out_total = 0;
 
-    max = vq->vring.num;
-
     while ((rc = virtqueue_num_heads(vq, idx)) > 0) {
         MemoryRegionCache *desc_cache = &caches->desc;
         unsigned int num_bufs;
         VRingDesc desc;
         unsigned int i;
+        unsigned int max = vq->vring.num;
 
         num_bufs = total_bufs;
 
@@ -1206,7 +1205,7 @@ static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
                                              VRingMemoryRegionCaches *caches)
 {
     VirtIODevice *vdev = vq->vdev;
-    unsigned int max, idx;
+    unsigned int idx;
     unsigned int total_bufs, in_total, out_total;
     MemoryRegionCache *desc_cache;
     MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
@@ -1218,14 +1217,14 @@ static void virtqueue_packed_get_avail_bytes(VirtQueue *vq,
     wrap_counter = vq->last_avail_wrap_counter;
     total_bufs = in_total = out_total = 0;
 
-    max = vq->vring.num;
-
     for (;;) {
         unsigned int num_bufs = total_bufs;
         unsigned int i = idx;
         int rc;
+        unsigned int max = vq->vring.num;
 
         desc_cache = &caches->desc;
+
         vring_packed_desc_read(vdev, &desc, desc_cache, idx, true);
         if (!is_desc_avail(desc.flags, wrap_counter)) {
             break;
-- 
2.35.3


