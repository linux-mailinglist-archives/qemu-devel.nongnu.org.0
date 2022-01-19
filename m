Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE00493727
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:23:08 +0100 (CET)
Received: from localhost ([::1]:52512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7BK-0004JM-KU
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6Px-0006wC-56
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:34:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6PZ-00073N-Q1
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:33:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2bbzNpojd/qoHnFGenWLoFCTAmJUAIIwchPZ9W0zLk=;
 b=FrxAvpw3+txDvfLGFxe8FyyfFd1hyg2qBs/HkrriNrS+wM8+G26nRnDNrF8qyoFnWbrfVy
 CQmqeuIWQcrLgmE91IZ7hbTl/mK17rIzNg2QMQav5Lnv57P/kTgKG3FKUNfISRidgPRTxI
 W4A1lMDssdSVCM21mOXnUOuX+C08i4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-WeiieBCjPyKYyyDurA5-DQ-1; Wed, 19 Jan 2022 03:33:42 -0500
X-MC-Unique: WeiieBCjPyKYyyDurA5-DQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0599C1F2DA;
 Wed, 19 Jan 2022 08:33:41 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 286C84F858;
 Wed, 19 Jan 2022 08:33:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] s390x/ipl: support extended kernel command line size
Date: Wed, 19 Jan 2022 09:32:14 +0100
Message-Id: <20220119083215.120911-10-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
References: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Viktor Mihajlovski <mihajlov@de.ibm.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc Hartmayer <mhartmay@linux.ibm.com>

In the past s390 used a fixed command line length of 896 bytes. This has changed
with the Linux commit 5ecb2da660ab ("s390: support command lines longer than 896
bytes"). There is now a parm area indicating the maximum command line size. This
parm area has always been initialized to zero, so with older kernels this field
would read zero and we must then assume that only 896 bytes are available.

Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Viktor Mihajlovski <mihajlov@de.ibm.com>
Message-Id: <20211122112909.18138-1-mhartmay@linux.ibm.com>
[thuth: Cosmetic fixes, and use PRIu64 instead of %lu]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/ipl.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 7ddca0127f..eb7fc4c4ae 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -37,8 +37,9 @@
 
 #define KERN_IMAGE_START                0x010000UL
 #define LINUX_MAGIC_ADDR                0x010008UL
+#define KERN_PARM_AREA_SIZE_ADDR        0x010430UL
 #define KERN_PARM_AREA                  0x010480UL
-#define KERN_PARM_AREA_SIZE             0x000380UL
+#define LEGACY_KERN_PARM_AREA_SIZE      0x000380UL
 #define INITRD_START                    0x800000UL
 #define INITRD_PARM_START               0x010408UL
 #define PARMFILE_START                  0x001000UL
@@ -110,6 +111,21 @@ static uint64_t bios_translate_addr(void *opaque, uint64_t srcaddr)
     return srcaddr + dstaddr;
 }
 
+static uint64_t get_max_kernel_cmdline_size(void)
+{
+    uint64_t *size_ptr = rom_ptr(KERN_PARM_AREA_SIZE_ADDR, sizeof(*size_ptr));
+
+    if (size_ptr) {
+        uint64_t size;
+
+        size = be64_to_cpu(*size_ptr);
+        if (size) {
+            return size;
+        }
+    }
+    return LEGACY_KERN_PARM_AREA_SIZE;
+}
+
 static void s390_ipl_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -197,10 +213,13 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
             ipl->start_addr = KERN_IMAGE_START;
             /* Overwrite parameters in the kernel image, which are "rom" */
             if (parm_area) {
-                if (cmdline_size > KERN_PARM_AREA_SIZE) {
+                uint64_t max_cmdline_size = get_max_kernel_cmdline_size();
+
+                if (cmdline_size > max_cmdline_size) {
                     error_setg(errp,
-                               "kernel command line exceeds maximum size: %zu > %lu",
-                               cmdline_size, KERN_PARM_AREA_SIZE);
+                               "kernel command line exceeds maximum size:"
+                               " %zu > %" PRIu64,
+                               cmdline_size, max_cmdline_size);
                     return;
                 }
 
-- 
2.27.0


