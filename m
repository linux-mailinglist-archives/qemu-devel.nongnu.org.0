Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3334402A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:50:10 +0100 (CET)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJ4T-0007pG-MG
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOJ35-0006bk-0I
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOJ32-0001jz-77
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616413718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ko9zM2jAY2fH+UULMVv8FsbZM7/HnoIPRNffQ+seJ6Y=;
 b=cgD44a9piuv0BDUGH8K9nS7UF0L5VJf45Jn2OlYcDppHV5imajze2b0DXldwRdMIEOKHXT
 Y+0JI/D43Rlu9V6RmWNBs/g3RcRLfrcy1BVrw0VMFiUqe+6pEoCH29oaq8pt/NHdklV6nF
 HLnbD43iovxN47nby1+6JSE9zrw5smQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-xI4w9c0ANKeVk5sSHO2RWg-1; Mon, 22 Mar 2021 07:48:37 -0400
X-MC-Unique: xI4w9c0ANKeVk5sSHO2RWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4496C10082E1
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:48:36 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-157.ams2.redhat.com
 [10.36.114.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53D225D742;
 Mon, 22 Mar 2021 11:48:35 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] optionrom/pvh: use memcmp() to find the RSDP signature
Date: Mon, 22 Mar 2021 12:48:34 +0100
Message-Id: <20210322114834.166798-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New versions of gcc report a potential error and there may be alignment
issues using uint64_t pointer to check the RSDP signature:

    gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:

    pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
    pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
    due to limited range of data type [-Wtype-limits]
       61 |         if (*rsdp_p == RSDP_SIGNATURE) {
          |                     ^~

Let's use memcmp() to get more readable code and avoid these issues.
Since pvh optionrom is baremetal, we use the compiler's __builtin_memcmp.

Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 pc-bios/optionrom/pvh_main.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/pc-bios/optionrom/pvh_main.c b/pc-bios/optionrom/pvh_main.c
index 28e79d7fc4..12202e38c2 100644
--- a/pc-bios/optionrom/pvh_main.c
+++ b/pc-bios/optionrom/pvh_main.c
@@ -27,7 +27,8 @@ asm (".code32"); /* this code will be executed in protected mode */
 #include "optrom_fw_cfg.h"
 #include "../../include/hw/xen/start_info.h"
 
-#define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
+#define RSDP_SIGNATURE          "RSD PTR "
+#define RSDP_SIGNATURE_SIZE     8
 #define RSDP_AREA_ADDR          0x000E0000
 #define RSDP_AREA_SIZE          0x00020000
 #define EBDA_BASE_ADDR          0x0000040E
@@ -53,12 +54,14 @@ static uint8_t cmdline_buffer[CMDLINE_BUFSIZE];
 /* Search RSDP signature. */
 static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
 {
-    uint64_t *rsdp_p;
+    char rsdp_signature[RSDP_SIGNATURE_SIZE] = RSDP_SIGNATURE;
+    char *rsdp_p;
 
     /* RSDP signature is always on a 16 byte boundary */
-    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
-         rsdp_p += 2) {
-        if (*rsdp_p == RSDP_SIGNATURE) {
+    for (rsdp_p = (char *)start_addr; rsdp_p < (char *)end_addr;
+         rsdp_p += 16) {
+        if (__builtin_memcmp(rsdp_p, rsdp_signature,
+                             RSDP_SIGNATURE_SIZE) == 0) {
             return (uintptr_t)rsdp_p;
         }
     }
-- 
2.30.2


