Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4A1F7B79
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 18:11:17 +0200 (CEST)
Received: from localhost ([::1]:58674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjmGy-0000XY-12
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 12:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjmE3-0005d3-56
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 12:08:15 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32188
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjmE1-00014S-4D
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 12:08:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591978092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5szLHKv698yoeNiyz5zZ4JBYKq/JLP6VyGAvk8fDs2E=;
 b=MFLUjr+WbT1KmkITPAHRGNgw3HYNcTUS8uV/EBtuRVePRNx57WL3gwgycXHh4uswHBkRHg
 BSxLUpl4Hde2n1Z94pTxVTqFZiSog3QTMYf324mUI3qcUP2+fdgDXhSoLi1KG71Q9amQPS
 XBMS46+eYu6LWThRCZpjr6Cf0jLgGPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-xQmIyfblN2iTKGrIWMA3yg-1; Fri, 12 Jun 2020 12:07:59 -0400
X-MC-Unique: xQmIyfblN2iTKGrIWMA3yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 628B0464;
 Fri, 12 Jun 2020 16:07:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 887BB8FF91;
 Fri, 12 Jun 2020 16:07:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 082/116] target/i386: correct fix for pcmpxstrx substring search
Date: Fri, 12 Jun 2020 12:07:52 -0400
Message-Id: <20200612160755.9597-2-pbonzini@redhat.com>
In-Reply-To: <20200612160755.9597-1-pbonzini@redhat.com>
References: <20200612160755.9597-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 08:07:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Joseph Myers <joseph@codesourcery.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joseph Myers <joseph@codesourcery.com>

This corrects a bug introduced in my previous fix for SSE4.2 pcmpestri
/ pcmpestrm / pcmpistri / pcmpistrm substring search, commit
ae35eea7e4a9f21dd147406dfbcd0c4c6aaf2a60.

That commit fixed a bug that showed up in four GCC tests with one libc
implementation.  The tests in question generate random inputs to the
intrinsics and compare results to a C implementation, but they only
test 1024 possible random inputs, and when the tests use the cases of
those instructions that work with word rather than byte inputs, it's
easy to have problematic cases that show up much less frequently than
that.  Thus, testing with a different libc implementation, and so a
different random number generator, showed up a problem with the
previous patch.

When investigating the previous test failures, I found the description
of these instructions in the Intel manuals (starting from computing a
16x16 or 8x8 set of comparison results) confusing and hard to match up
with the more optimized implementation in QEMU, and referred to AMD
manuals which described the instructions in a different way.  Those
AMD descriptions are very explicit that the whole of the string being
searched for must be found in the other operand, not running off the
end of that operand; they say "If the prototype and the SUT are equal
in length, the two strings must be identical for the comparison to be
TRUE.".  However, that statement is incorrect.

In my previous commit message, I noted:

  The operation in this case is a search for a string (argument d to
  the helper) in another string (argument s to the helper); if a copy
  of d at a particular position would run off the end of s, the
  resulting output bit should be 0 whether or not the strings match in
  the region where they overlap, but the QEMU implementation was
  wrongly comparing only up to the point where s ends and counting it
  as a match if an initial segment of d matched a terminal segment of
  s.  Here, "run off the end of s" means that some byte of d would
  overlap some byte outside of s; thus, if d has zero length, it is
  considered to match everywhere, including after the end of s.

The description "some byte of d would overlap some byte outside of s"
is accurate only when understood to refer to overlapping some byte
*within the 16-byte operand* but at or after the zero terminator; it
is valid to run over the end of s if the end of s is the end of the
16-byte operand.  So the fix in the previous patch for the case of d
being empty was correct, but the other part of that patch was not
correct (as it never allowed partial matches even at the end of the
16-byte operand).  Nor was the code before the previous patch correct
for the case of d nonempty, as it would always have allowed partial
matches at the end of s.

Fix with a partial revert of my previous change, combined with
inserting a check for the special case of s having maximum length to
determine where it is necessary to check for matches.

In the added test, test 1 is for the case of empty strings, which
failed before my 2017 patch, test 2 is for the bug introduced by my
2017 patch and test 3 deals with the case where a match of an initial
segment at the end of the string is not valid when the string ends
before the end of the 16-byte operand (that is, the case that would be
broken by a simple revert of the non-empty-string part of my 2017
patch).

Signed-off-by: Joseph Myers <joseph@codesourcery.com>
Message-Id: <alpine.DEB.2.21.2006121344290.9881@digraph.polyomino.org.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/ops_sse.h                |  4 ++--
 tests/tcg/i386/Makefile.target       |  3 +++
 tests/tcg/i386/test-i386-pcmpistri.c | 33 ++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/i386/test-i386-pcmpistri.c

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 01d6017412..14f2b16abd 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2089,10 +2089,10 @@ static inline unsigned pcmpxstrx(CPUX86State *env, Reg *d, Reg *s,
             res = (2 << upper) - 1;
             break;
         }
-        for (j = valids - validd; j >= 0; j--) {
+        for (j = valids == upper ? valids : valids - validd; j >= 0; j--) {
             res <<= 1;
             v = 1;
-            for (i = validd; i >= 0; i--) {
+            for (i = MIN(valids - j, validd); i >= 0; i--) {
                 v &= (pcmp_val(s, ctrl, i + j) == pcmp_val(d, ctrl, i));
             }
             res |= v;
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 43ee2e181e..53efec0668 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -10,6 +10,9 @@ ALL_X86_TESTS=$(I386_SRCS:.c=)
 SKIP_I386_TESTS=test-i386-ssse3
 X86_64_TESTS:=$(filter test-i386-ssse3, $(ALL_X86_TESTS))
 
+test-i386-pcmpistri: CFLAGS += -msse4.2
+run-test-i386-pcmpistri: QEMU_OPTS += -cpu max
+
 #
 # hello-i386 is a barebones app
 #
diff --git a/tests/tcg/i386/test-i386-pcmpistri.c b/tests/tcg/i386/test-i386-pcmpistri.c
new file mode 100644
index 0000000000..1e81ae611a
--- /dev/null
+++ b/tests/tcg/i386/test-i386-pcmpistri.c
@@ -0,0 +1,33 @@
+/* Test pcmpistri instruction.  */
+
+#include <nmmintrin.h>
+#include <stdio.h>
+
+union u {
+    __m128i x;
+    unsigned char uc[16];
+};
+
+union u s0 = { .uc = { 0 } };
+union u s1 = { .uc = "abcdefghijklmnop" };
+union u s2 = { .uc = "bcdefghijklmnopa" };
+union u s3 = { .uc = "bcdefghijklmnab" };
+
+int
+main(void)
+{
+    int ret = 0;
+    if (_mm_cmpistri(s0.x, s0.x, 0x4c) != 15) {
+        printf("FAIL: pcmpistri test 1\n");
+        ret = 1;
+    }
+    if (_mm_cmpistri(s1.x, s2.x, 0x4c) != 15) {
+        printf("FAIL: pcmpistri test 2\n");
+        ret = 1;
+    }
+    if (_mm_cmpistri(s1.x, s3.x, 0x4c) != 16) {
+        printf("FAIL: pcmpistri test 3\n");
+        ret = 1;
+    }
+    return ret;
+}
-- 
2.26.2



