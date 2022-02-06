Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984974AAEAD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:51:47 +0100 (CET)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeCw-0008L5-7f
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:51:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzx-0000Ec-L7
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdzu-0003gv-Gs
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGPknzL0C8w670Ju8z58GoLCBmhEaNx8SyVY6OxEVhw=;
 b=LL20BMpES7bsXWxWihO/9+e3Bu5FgZx1IUwixTXbm5dEaQbS/C9msMFh6tht5b83azqYaH
 PM/ZmMbfzsxmQbONAC4FArzDHf6NC9ahOCwCjW4bmI20YgqGNadQQXFmt9S93hkEMKHkHK
 GT8Y+UfdKOWvkXWsKAlg7h4zkaxMKoc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-9uWwqGg0PN2dcMm3UD0P3Q-1; Sun, 06 Feb 2022 04:38:16 -0500
X-MC-Unique: 9uWwqGg0PN2dcMm3UD0P3Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 z2-20020a05600c220200b0034d2eb95f27so3956583wml.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MGPknzL0C8w670Ju8z58GoLCBmhEaNx8SyVY6OxEVhw=;
 b=4c1+p1Aken0E4NEr5wyqeNlvKDv1wuwZj+n9zTPmPoMnED3PsAUP8WH26dhN/MxVol
 plYHBFzL7NhkpOe/uIot/FPBTPO5xQ9gWb1S3zcxdY6PoqMAmKowmy+TIzb4axvHDtyM
 K5aB7A8ThHmgqqD5Gti+rIQ+ydEt9AnUSW2/cAIOV0CO0waAHJKkqcu+DyxUHUKfk8kW
 5LAEgQAPc2LgSAPbzI9PnR0EwBLyWNMPXtHdeWsCcYCOE9ylxxY2hqQrDDy7mp5LhtdK
 lVdeoVyiQ03TAKIq3tRXonmXJXvlXEa0D5M2NSoRaonMOb7PMRxwuVf7wIhMg4bF7BWM
 mb7w==
X-Gm-Message-State: AOAM530wiFXzI3wJTr72gd/xN+QQXxtXzF193sgZ3lhOgftNwIMahfgz
 DB8tfUHnG3c5HO9qVkRcd7GIZXtlCPRc98ST+9ow6/kL2FWjn1VwWoRcrSW4ZkyoOPCwpvaLlDB
 BNaz2HFPsfvIRLH1RiX9QBbLhcy9H+6dwIIKw5YIgdWHhFX6aIMd65979dc1A
X-Received: by 2002:adf:e4cb:: with SMTP id v11mr5661467wrm.139.1644140294657; 
 Sun, 06 Feb 2022 01:38:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNgornKFIbhYZFT/bGGH9SDF8qgMvgwKL5rn41Hb18hFqNTkC6Xq1eq6XjAJbcAs2GNz+QqQ==
X-Received: by 2002:adf:e4cb:: with SMTP id v11mr5661452wrm.139.1644140294462; 
 Sun, 06 Feb 2022 01:38:14 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id h8sm6627057wre.89.2022.02.06.01.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:14 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/24] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Message-ID: <20220206093702.1282676-11-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's avoid having to manually copy all elements. Copy only the ones
necessary to close the hole and perform the operation in-place without
a second array.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220117041050.19718-4-raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 30 +++++++++++------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 1a8fc9d600..7dd8e918b4 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -811,10 +811,8 @@ static inline bool reg_equal(VuDevRegion *vudev_reg,
 
 static bool
 vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
-    int i, j;
-    bool found = false;
-    VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
     VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
+    int i;
 
     if (vmsg->fd_num != 1) {
         vmsg_close_fds(vmsg);
@@ -841,28 +839,28 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
     DPRINT("    mmap_offset      0x%016"PRIx64"\n",
            msg_region->mmap_offset);
 
-    for (i = 0, j = 0; i < dev->nregions; i++) {
-        if (!reg_equal(&dev->regions[i], msg_region)) {
-            shadow_regions[j].gpa = dev->regions[i].gpa;
-            shadow_regions[j].size = dev->regions[i].size;
-            shadow_regions[j].qva = dev->regions[i].qva;
-            shadow_regions[j].mmap_addr = dev->regions[i].mmap_addr;
-            shadow_regions[j].mmap_offset = dev->regions[i].mmap_offset;
-            j++;
-        } else {
-            found = true;
+    for (i = 0; i < dev->nregions; i++) {
+        if (reg_equal(&dev->regions[i], msg_region)) {
             VuDevRegion *r = &dev->regions[i];
             void *m = (void *) (uintptr_t) r->mmap_addr;
 
             if (m) {
                 munmap(m, r->size + r->mmap_offset);
             }
+
+            break;
         }
     }
 
-    if (found) {
-        memcpy(dev->regions, shadow_regions,
-               sizeof(VuDevRegion) * VHOST_USER_MAX_RAM_SLOTS);
+    if (i < dev->nregions) {
+        /*
+         * Shift all affected entries by 1 to close the hole at index i and
+         * zero out the last entry.
+         */
+        memmove(dev->regions + i, dev->regions + i + 1,
+               sizeof(VuDevRegion) * (dev->nregions - i - 1));
+        memset(dev->regions + dev->nregions - 1, 0,
+               sizeof(VuDevRegion));
         DPRINT("Successfully removed a region\n");
         dev->nregions--;
         vmsg_set_reply_u64(vmsg, 0);
-- 
MST


