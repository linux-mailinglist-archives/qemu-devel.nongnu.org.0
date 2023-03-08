Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1F6AFBE9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiOK-0005c8-HS; Tue, 07 Mar 2023 20:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiO1-0005YO-Ge
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNz-00025R-K6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFOs7K/mMfl02ujCfNEGSvBgQGYosRoiMqAddvEZMgQ=;
 b=Q4IUKVO4vU7kCmFbQhVpUWip1bMqoZSzklTP6G/osjkLok12phGi4TyoY6efrQY7FOzR1F
 2qMVLZ8UjUBjQTIEO02szb6t89h15CjiY9GZl1jmpummTSKLMgi/poGGOobe8V8xcVQXvO
 6KTxuIAv0NZkO1K/gKrfOUXPoGJnaNM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-SCydqCeuPSeVUl9hNVEoAA-1; Tue, 07 Mar 2023 20:14:30 -0500
X-MC-Unique: SCydqCeuPSeVUl9hNVEoAA-1
Received: by mail-ed1-f72.google.com with SMTP id
 z14-20020a05640235ce00b004e07ddbc2f8so12721673edc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:14:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238068;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SFOs7K/mMfl02ujCfNEGSvBgQGYosRoiMqAddvEZMgQ=;
 b=7BWY+8ruWRN4e+pr9aT6FwAPLwtjVYn8Rr/oEyO9YpTyTzZfsIylOa35w9bLqo9Xa6
 OBS9Zh6VRPpK+CPsbR95gR2P0XcHAOAZL6j5tGckfdxqx+lyHb7hLcPrw5rYiJllU88E
 2ukEiVUr5CmxFcP9XapiuX3jIyDEy5M+4NjTalhrOs0E7rZezJdMaKZapgtPBPk8eWUk
 xqMfjVVTo1RYHMBTJxtu4YHl9wBnP9rGUnyyMGRdp3waVPec+nQd/Ubey7rRZ/V+//6+
 VlrQtW5c6j2bSsBS9iRUjcQCb1hbiaXeb4lv27ApkQJY7avUL4QGm0hSDy2IBXyrR4qQ
 8gWw==
X-Gm-Message-State: AO0yUKXSOdZMFoTL1wKn75pMy0+cxj2brp4R50miy7fRJ81VHetqbJ88
 gSFoIUvjdEPIZD+83aCuspIKDnMSOm563nW9SLvhEwTeu3IG7eJQEpnPFtw7oTjc8k9uOW/mOH2
 wt9yCtTR0fjyq9Is7rHCT2ejYyouBPjL0SlgZG2qQLn0Yu0lX7QhTXo6MSwrYP4Sjh/lE
X-Received: by 2002:a17:907:16a4:b0:8af:3fcc:2b05 with SMTP id
 hc36-20020a17090716a400b008af3fcc2b05mr21136735ejc.12.1678238068333; 
 Tue, 07 Mar 2023 17:14:28 -0800 (PST)
X-Google-Smtp-Source: AK7set9FbARJHgyg/sD6/KkR2AOIZPKg5zzZrGV9Cz1YkU0p8F4NL0Z7DEd/2t2iDIqHNuIf9ozCEg==
X-Received: by 2002:a17:907:16a4:b0:8af:3fcc:2b05 with SMTP id
 hc36-20020a17090716a400b008af3fcc2b05mr21136725ejc.12.1678238068122; 
 Tue, 07 Mar 2023 17:14:28 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 gu21-20020a170906f29500b008e8e9859905sm6729328ejb.184.2023.03.07.17.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:14:27 -0800 (PST)
Date: Tue, 7 Mar 2023 20:14:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Subject: [PULL 72/73] virtio: fix reachable assertion due to stale value of
 cached region size
Message-ID: <bbc1c327d7974261c61566cdb950cc5fa0196b41.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Carlos López <clopez@suse.de>

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
Message-Id: <20230302100358.3613-1-clopez@suse.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
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
MST


