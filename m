Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C4A1F6EB7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:27:13 +0200 (CEST)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTn6-0007xS-9E
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT92-000860-64
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44893
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8y-00017q-Hk
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PixQXutwcGEY5jlx8dUr7LAWNxKmNvIVWkqYGwJzOgI=;
 b=KW3y33LL9Yodz1KZb/Ks+Cjwft9TZ95PWZmoWDHUL8EPK3n3KoSSVDzLqoj8naT8lCHWSN
 pNT47L1M3crl/bKnbseOYTX9XbX7mkAPJY4xTkjD0mwD4i0x4Szn7C4Q4aPjS+wgfoF5Gr
 T2RNoKopQxtZ27PuQJbMz3hqFaS7imU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-AUEd9WlAOrWLVLnWeRo31Q-1; Thu, 11 Jun 2020 15:45:41 -0400
X-MC-Unique: AUEd9WlAOrWLVLnWeRo31Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CB191800D41;
 Thu, 11 Jun 2020 19:45:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FCDB61169;
 Thu, 11 Jun 2020 19:45:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 062/115] target/i386: fix fbstp handling of negative zero
Date: Thu, 11 Jun 2020 15:43:56 -0400
Message-Id: <20200611194449.31468-63-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

The fbstp implementation stores +0 when the rounded result should be
-0 because it compares an integer value with 0 to determine the sign.
Fix this by checking the sign bit of the operand instead.

Signed-off-by: Joseph Myers <joseph@codesourcery.com>
Message-Id: <alpine.DEB.2.21.2005132350230.11687@digraph.polyomino.org.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/fpu_helper.c         |  5 ++++-
 tests/tcg/i386/test-i386-fbstp.c | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/i386/test-i386-fbstp.c

diff --git a/target/i386/fpu_helper.c b/target/i386/fpu_helper.c
index 185493db8e..f0a57099ca 100644
--- a/target/i386/fpu_helper.c
+++ b/target/i386/fpu_helper.c
@@ -726,11 +726,14 @@ void helper_fbst_ST0(CPUX86State *env, target_ulong ptr)
     int v;
     target_ulong mem_ref, mem_end;
     int64_t val;
+    CPU_LDoubleU temp;
+
+    temp.d = ST0;
 
     val = floatx80_to_int64(ST0, &env->fp_status);
     mem_ref = ptr;
     mem_end = mem_ref + 9;
-    if (val < 0) {
+    if (SIGND(temp)) {
         cpu_stb_data_ra(env, mem_end, 0x80, GETPC());
         val = -val;
     } else {
diff --git a/tests/tcg/i386/test-i386-fbstp.c b/tests/tcg/i386/test-i386-fbstp.c
new file mode 100644
index 0000000000..d368949188
--- /dev/null
+++ b/tests/tcg/i386/test-i386-fbstp.c
@@ -0,0 +1,25 @@
+/* Test fbstp instruction.  */
+
+#include <stdio.h>
+#include <string.h>
+
+int main(void)
+{
+    int ret = 0;
+    unsigned char out[10];
+    memset(out, 0xfe, sizeof out);
+    __asm__ volatile ("fbstp %0" : "=m" (out) : "t" (-0.0L) : "st");
+    out[9] &= 0x80;
+    if (memcmp(out, "\0\0\0\0\0\0\0\0\0\x80", sizeof out) != 0) {
+        printf("FAIL: fbstp -0\n");
+        ret = 1;
+    }
+    memset(out, 0x12, sizeof out);
+    __asm__ volatile ("fbstp %0" : "=m" (out) : "t" (-0.1L) : "st");
+    out[9] &= 0x80;
+    if (memcmp(out, "\0\0\0\0\0\0\0\0\0\x80", sizeof out) != 0) {
+        printf("FAIL: fbstp -0.1\n");
+        ret = 1;
+    }
+    return ret;
+}
-- 
2.26.2



