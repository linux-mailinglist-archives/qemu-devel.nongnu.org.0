Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE6597446
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:40:15 +0200 (CEST)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM5X-0006DR-0T
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLmz-0006N1-GH
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLmw-0005TS-Eh
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660753261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k2ZpeeYKQErXhazsoSi6NbKbSpJUbceXzvANU3WD8iY=;
 b=Xfz6XTswuwv4CH04aYzROToap1HStUuF/uvdy/rMF0ycvh7rIljZ5GIhCXm6ilWDweEXuw
 0e4QIlXz1KW06geqqtx7A8dgpzkq11Nwxg1liQE47OQxPy1te+IS4btnG3Fgfyz+og50dg
 tvNE2aN98ctU3KeHlvwbf5d91+2vVF8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-HqPrCmflMUS02vgPRigHmw-1; Wed, 17 Aug 2022 12:14:54 -0400
X-MC-Unique: HqPrCmflMUS02vgPRigHmw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c64-20020a1c3543000000b003a61987ffb3so556447wma.6
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=k2ZpeeYKQErXhazsoSi6NbKbSpJUbceXzvANU3WD8iY=;
 b=UzU5YPfhjvfTv5fzXmE0dJny5l1cl9kPaQWy1x7lqvs4FHLOEAGUxDofBy2TblXhMi
 DhKcLEsozvLlNRk7zkr1PMIgsKXJ7kHWI77YreqjKnBz0VQhh7DJyPYABrLisWjnxy5h
 nN0Xbj7cAUeHMuzZZjjFL4yZYLWt1sLKWkrtaJPKOimJtBAO+bkdPGUsKWZNIb/MlcwT
 P/X1QFEGiyAdSrEw/F5lv4C65HRhvGdRv/7uFlz84IOX0tOuk3C5x40KMwCtyqK9CVqE
 iqZEJcug4WNF/JFTi+ElSTfCSSKC3qS8XomjXB4HXOvUdyYReJcERUAvoSyeurBpPkVg
 jFMQ==
X-Gm-Message-State: ACgBeo2EAHC/9oZc432j/WpjOFqShus/fSICq0Z+ydkRTk6YC1jEWCN5
 kA0RvdxXB67egp3lBLrfbqsVUWnUGWe6CSqGcXySi2wtNwRBJ+R/KuAH0IGJH84UCu1Wr7XhZ7p
 jfQhBioBbCaIyExsUuvAZheL9C85lL6/2l/TEWwk/sc/C00a0c3+Josbzahc6
X-Received: by 2002:a5d:4407:0:b0:222:cd99:3f0 with SMTP id
 z7-20020a5d4407000000b00222cd9903f0mr14416545wrq.44.1660752893105; 
 Wed, 17 Aug 2022 09:14:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5z8UvQ2kNCwTfyDBH5EXNFtTaEIigbriRsC+9iN2s+TL03e13pODDfRlIVkkIqIy1mpE/odA==
X-Received: by 2002:a5d:4407:0:b0:222:cd99:3f0 with SMTP id
 z7-20020a5d4407000000b00222cd9903f0mr14416526wrq.44.1660752892733; 
 Wed, 17 Aug 2022 09:14:52 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 r12-20020a5d498c000000b0022520aba90asm3177097wrq.107.2022.08.17.09.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:52 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bobo WL <lmw.bobo@gmail.com>, Ben Widawsky <ben.widawsky@intel.com>
Subject: [PULL 06/10] hw/cxl: Add stub write function for RO MemoryRegionOps
 entries.
Message-ID: <20220817161342.240674-7-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

There is no checking on the availability of a write callback.
Hence QEMU crashes if a write does occur to one of these regions.

Discovered whilst chasing a Linux kernel bug that incorrectly
wrote into one of these regions.

Fixes: 6364adacdf ("hw/cxl/device: Implement the CAP array (8.2.8.1-2)")
Reported-by: Bobo WL <lmw.bobo@gmail.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220817145759.32603-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-device-utils.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/cxl/cxl-device-utils.c b/hw/cxl/cxl-device-utils.c
index 687759b301..83ce7a8270 100644
--- a/hw/cxl/cxl-device-utils.c
+++ b/hw/cxl/cxl-device-utils.c
@@ -141,9 +141,15 @@ static uint64_t mdev_reg_read(void *opaque, hwaddr offset, unsigned size)
     return retval;
 }
 
+static void ro_reg_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    /* Many register sets are read only */
+}
+
 static const MemoryRegionOps mdev_ops = {
     .read = mdev_reg_read,
-    .write = NULL, /* memory device register is read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -173,7 +179,7 @@ static const MemoryRegionOps mailbox_ops = {
 
 static const MemoryRegionOps dev_ops = {
     .read = dev_reg_read,
-    .write = NULL, /* status register is read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
@@ -188,7 +194,7 @@ static const MemoryRegionOps dev_ops = {
 
 static const MemoryRegionOps caps_ops = {
     .read = caps_reg_read,
-    .write = NULL, /* caps registers are read only */
+    .write = ro_reg_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
-- 
MST


