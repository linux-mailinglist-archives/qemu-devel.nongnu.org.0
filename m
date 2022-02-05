Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358B24AA599
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:18:08 +0100 (CET)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAeN-00031B-Aj
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA7F-0003sP-Iu
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6q-0003JV-Ap
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MGPknzL0C8w670Ju8z58GoLCBmhEaNx8SyVY6OxEVhw=;
 b=fKtrpHfFvgt3dMsol8AdmJnHnM/ySZGM+ee9hbLBfhktFVp8nsFVBp8d5LL2VrwWas00l7
 pgw1YlYo6jieX1rQ7MrjYWcgTC4OAb9Oywdo47ujT86btHiqL48mOLZUAPsvwpAcO4o/9d
 q4GnjPWgq0wOYqk2SEqgYIlYn3vTn4Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631--Bg2VqJENT6s9hpRLtbVcg-1; Fri, 04 Feb 2022 20:43:07 -0500
X-MC-Unique: -Bg2VqJENT6s9hpRLtbVcg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso2770158wra.14
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MGPknzL0C8w670Ju8z58GoLCBmhEaNx8SyVY6OxEVhw=;
 b=vqtitpRQjYCOYXW28syVv385lba+w1wS4CTUqI6ip3aq9IXcuWY/6TxVV0HwZMW3rG
 roQZXy87FxKces2Sh+Nou1ppHn/qOBbKelE+d1d8yN7MeBJ4ogvXNcnasgWnIc1dT6Me
 vEJnKP0qUorVba6Auai2JawyBkiCUSEI+5VRDOQ/t8Ayy617L3d6Fqu0CMHwQt9jaTTt
 wI1qFTXUOzRs58XVVXyWwXvauivPsBIijerRMH0A1fJiR2frDmsnzil/IlC2Wz7yWhAs
 DSRS+mkNSDS7coDT/yFVXgUwOdZWkRj6iocQgad2dVRzoUW6gY/6EpDI4qIeZApACQdz
 cnsw==
X-Gm-Message-State: AOAM5338ReWjsCqSxBDhKF1XY2MC5ZORFvOiRfEMKP4jaGrZwQ6oQFsR
 o5K6QECMPoggfm7fvfzs32aoDWqzLtQ4KEDleQVypNfH9OW+CJDLcRCAsZcmDxtdbQC2yd9Ll3Y
 YxQz++1RWQuKtyjJvRVNgNNkQ/YrYvuMl2bXWeOo+5pAQlsrmI/6G1wU2BNMC
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr1252031wrq.685.1644025385410; 
 Fri, 04 Feb 2022 17:43:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwGvfTiwErsbgaRe3zqgqTtpMcwa94u5vY+LvSfeUowogalK9Yua33I45obgANer4OVislbQ==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr1252009wrq.685.1644025385101; 
 Fri, 04 Feb 2022 17:43:05 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id v5sm3974909wrx.114.2022.02.04.17.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:04 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/32] libvhost-user: Simplify VHOST_USER_REM_MEM_REG
Message-ID: <20220205014149.1189026-11-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, David Hildenbrand <david@redhat.com>
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


