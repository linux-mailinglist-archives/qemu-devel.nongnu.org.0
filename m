Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD29942EDA7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:28:49 +0200 (CEST)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJWC-0006YJ-PU
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKL-00034P-5H
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKI-0001cy-Sx
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634289390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IMpikbvibHCoHfsJwBh9eCRo0oTJaZmHrv2ZLTTBWTU=;
 b=NLKeFKPbfszWqUXXBl8cXLiPABVJAt5IKf6WL5nHakfnv99q4/99Bjucdbe/qswBVal9iE
 kPXz87hhUh/lLdHq15armfWZJJv+G0Zv6wFB834I8ZqEaPKJ+XzGCNd0aN7y/DT2tpwFc9
 Oj2WeyaxnLEJmTIbYCXWjqED8k6CPns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-F1tvL_tfN2-kvRaLdPuvJw-1; Fri, 15 Oct 2021 05:16:26 -0400
X-MC-Unique: F1tvL_tfN2-kvRaLdPuvJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E255619057A0;
 Fri, 15 Oct 2021 09:16:25 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D09B51B5C0;
 Fri, 15 Oct 2021 09:16:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/6] s390x/ipl: check kernel command line size
Date: Fri, 15 Oct 2021 11:16:17 +0200
Message-Id: <20211015091622.1302433-2-thuth@redhat.com>
In-Reply-To: <20211015091622.1302433-1-thuth@redhat.com>
References: <20211015091622.1302433-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc Hartmayer <mhartmay@linux.ibm.com>

Check if the provided kernel command line exceeds the maximum size of the s390x
Linux kernel command line size, which is 896 bytes.

Reported-by: Sven Schnelle <svens@linux.ibm.com>
Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Message-Id: <20211006092631.20732-1-mhartmay@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[thuth: Adjusted format specifier for size_t]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/ipl.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 1821c6faee..7ddca0127f 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -38,6 +38,7 @@
 #define KERN_IMAGE_START                0x010000UL
 #define LINUX_MAGIC_ADDR                0x010008UL
 #define KERN_PARM_AREA                  0x010480UL
+#define KERN_PARM_AREA_SIZE             0x000380UL
 #define INITRD_START                    0x800000UL
 #define INITRD_PARM_START               0x010408UL
 #define PARMFILE_START                  0x001000UL
@@ -190,10 +191,19 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
          * loader) and it won't work. For this case we force it to 0x10000, too.
          */
         if (pentry == KERN_IMAGE_START || pentry == 0x800) {
-            char *parm_area = rom_ptr(KERN_PARM_AREA, strlen(ipl->cmdline) + 1);
+            size_t cmdline_size = strlen(ipl->cmdline) + 1;
+            char *parm_area = rom_ptr(KERN_PARM_AREA, cmdline_size);
+
             ipl->start_addr = KERN_IMAGE_START;
             /* Overwrite parameters in the kernel image, which are "rom" */
             if (parm_area) {
+                if (cmdline_size > KERN_PARM_AREA_SIZE) {
+                    error_setg(errp,
+                               "kernel command line exceeds maximum size: %zu > %lu",
+                               cmdline_size, KERN_PARM_AREA_SIZE);
+                    return;
+                }
+
                 strcpy(parm_area, ipl->cmdline);
             }
         } else {
-- 
2.27.0


