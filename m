Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78925EAF73
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:18:17 +0200 (CEST)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsgK-0007sQ-OX
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrai-0005fi-Er
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrae-0005Lm-DN
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpc1sdNh9GtSDlVFILenva8+Qkf7guHwER+evmK5eME=;
 b=GQ3m68QeL2hln4f9sp4LSUGk1+bcIBl4T2yWp5igEB4rGfhZRCtZgKn3yvFoLXnXZFfeeh
 5nQu+M2DPGdrIYyYUtQISyefiP2KVZqpKCOD4sn31X5Y5esalzfqo/0FXVAoB4N06mkXVY
 6uR6fC3jDpQGYY65dfcWFxhR5v4SeRo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-QjZK7DYBOJqNC77G_iP1BQ-1; Mon, 26 Sep 2022 13:08:14 -0400
X-MC-Unique: QjZK7DYBOJqNC77G_iP1BQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E44EE855306;
 Mon, 26 Sep 2022 17:08:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E1F5140EBF4;
 Mon, 26 Sep 2022 17:08:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 02/14] linux-user/host/s390: Add vector instructions to
 host_signal_write()
Date: Mon, 26 Sep 2022 19:07:52 +0200
Message-Id: <20220926170804.453855-3-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

The new noexec test fails on s390x with "unexpected SEGV". This test
overwrites code using libc's memcpy(), which uses VSTL instruction.
host_signal_write() does not recognize it, which causes SEGV to be
incorrectly forwarded to the test.

Add all vector instructions that write to memory to
host_signal_write().

Fixes: ab12c95d3f19 ("target/s390x: Make translator stop before the end of a page")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220920113907.334144-1-iii@linux.ibm.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/include/host/s390/host-signal.h | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/linux-user/include/host/s390/host-signal.h b/linux-user/include/host/s390/host-signal.h
index 25fefa00bd..e6d3ec26dc 100644
--- a/linux-user/include/host/s390/host-signal.h
+++ b/linux-user/include/host/s390/host-signal.h
@@ -87,6 +87,31 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
             return true;
         }
         break;
+    case 0xe6:
+        switch (pinsn[2] & 0xff) {
+        case 0x09: /* VSTEBRH */
+        case 0x0a: /* VSTEBRG */
+        case 0x0b: /* VSTEBRF */
+        case 0x0e: /* VSTBR */
+        case 0x0f: /* VSTER */
+        case 0x3f: /* VSTRLR */
+            return true;
+        }
+        break;
+    case 0xe7:
+        switch (pinsn[2] & 0xff) {
+        case 0x08: /* VSTEB */
+        case 0x09: /* VSTEH */
+        case 0x0a: /* VSTEG */
+        case 0x0b: /* VSTEF */
+        case 0x0e: /* VST */
+        case 0x1a: /* VSCEG */
+        case 0x1b: /* VSCEF */
+        case 0x3e: /* VSTM */
+        case 0x3f: /* VSTL */
+            return true;
+        }
+        break;
     case 0xeb: /* RSY format insns */
         switch (pinsn[2] & 0xff) {
         case 0x14: /* CSY */
-- 
2.31.1


