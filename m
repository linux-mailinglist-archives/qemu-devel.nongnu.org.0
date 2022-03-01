Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF504C8843
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:43:06 +0100 (CET)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOz28-0004m4-1D
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:43:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOykT-0004NZ-2q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:24:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nOykN-0002Mg-BZ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:24:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646126682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=V35TrTmT4KMPMsAPx/5wSoa+znLjFAkhAS5Jn4lK5zQ=;
 b=TAW+8wR0V7jtj4eiTdMyjHFN+I/0mv2xs83KCnICFEkP56P4qgupgc/isoVaYrOdKAcNJt
 KDMXmfGyVUV7YpQQKJ/D8S5vkjcAiAaC/Yhw1ARsCLsId6qhz3oHgWkgxmfeHLqyKIndDz
 nGwAVsPr/mEvat3QYhOcAtVIaIBPYiU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-Ttyf3HWMNdyYZW2w4bpJ4A-1; Tue, 01 Mar 2022 04:24:39 -0500
X-MC-Unique: Ttyf3HWMNdyYZW2w4bpJ4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49A521006AA6;
 Tue,  1 Mar 2022 09:24:38 +0000 (UTC)
Received: from thuth.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04A671F460;
 Tue,  1 Mar 2022 09:24:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] tests/tcg/s390x: Fix the exrl-trt* tests with Clang
Date: Tue,  1 Mar 2022 10:24:31 +0100
Message-Id: <20220301092431.1448419-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The exrl-trt* tests use two pre-initialized variables for the
results of the assembly code:

    uint64_t r1 = 0xffffffffffffffffull;
    uint64_t r2 = 0xffffffffffffffffull;

But then the assembly code copies over the full contents
of the register into the output variable, without taking
care of this pre-initialized values:

        "    lgr %[r1],%%r1\n"
        "    lgr %[r2],%%r2\n"

The code then finally compares the register contents to
a value that apparently depends on the pre-initialized values:

    if (r2 != 0xffffffffffffffaaull) {
        write(1, "bad r2\n", 7);
        return 1;
    }

This all works with GCC, since the 0xffffffffffffffff got into
the r2 register there by accident, but it fails completely with
Clang.

Let's fix this by declaring the r1 and r2 variables as proper
register variables instead, so the pre-initialized values get
correctly passed into the inline assembly code.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/exrl-trt.c  | 8 +++-----
 tests/tcg/s390x/exrl-trtr.c | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/tcg/s390x/exrl-trt.c b/tests/tcg/s390x/exrl-trt.c
index 16711a3181..451f777b9d 100644
--- a/tests/tcg/s390x/exrl-trt.c
+++ b/tests/tcg/s390x/exrl-trt.c
@@ -5,8 +5,8 @@ int main(void)
 {
     char op1[] = "hello";
     char op2[256];
-    uint64_t r1 = 0xffffffffffffffffull;
-    uint64_t r2 = 0xffffffffffffffffull;
+    register uint64_t r1 asm("r1") = 0xffffffffffffffffull;
+    register uint64_t r2 asm("r2") = 0xffffffffffffffffull;
     uint64_t cc;
     int i;
 
@@ -21,8 +21,6 @@ int main(void)
         "    j 2f\n"
         "1:  trt 0(1,%[op1]),%[op2]\n"
         "2:  exrl %[op1_len],1b\n"
-        "    lgr %[r1],%%r1\n"
-        "    lgr %[r2],%%r2\n"
         "    ipm %[cc]\n"
         : [r1] "+r" (r1),
           [r2] "+r" (r2),
@@ -30,7 +28,7 @@ int main(void)
         : [op1] "a" (&op1),
           [op1_len] "a" (5),
           [op2] "Q" (op2)
-        : "r1", "r2", "cc");
+        : "cc");
     cc = (cc >> 28) & 3;
     if (cc != 2) {
         write(1, "bad cc\n", 7);
diff --git a/tests/tcg/s390x/exrl-trtr.c b/tests/tcg/s390x/exrl-trtr.c
index 5f30cda6bd..422f7f385a 100644
--- a/tests/tcg/s390x/exrl-trtr.c
+++ b/tests/tcg/s390x/exrl-trtr.c
@@ -5,8 +5,8 @@ int main(void)
 {
     char op1[] = {0, 1, 2, 3};
     char op2[256];
-    uint64_t r1 = 0xffffffffffffffffull;
-    uint64_t r2 = 0xffffffffffffffffull;
+    register uint64_t r1 asm("r1") = 0xffffffffffffffffull;
+    register uint64_t r2 asm("r2") = 0xffffffffffffffffull;
     uint64_t cc;
     int i;
 
@@ -21,8 +21,6 @@ int main(void)
         "    j 2f\n"
         "1:  trtr 3(1,%[op1]),%[op2]\n"
         "2:  exrl %[op1_len],1b\n"
-        "    lgr %[r1],%%r1\n"
-        "    lgr %[r2],%%r2\n"
         "    ipm %[cc]\n"
         : [r1] "+r" (r1),
           [r2] "+r" (r2),
@@ -30,7 +28,7 @@ int main(void)
         : [op1] "a" (&op1),
           [op1_len] "a" (3),
           [op2] "Q" (op2)
-        : "r1", "r2", "cc");
+        : "cc");
     cc = (cc >> 28) & 3;
     if (cc != 1) {
         write(1, "bad cc\n", 7);
-- 
2.27.0


