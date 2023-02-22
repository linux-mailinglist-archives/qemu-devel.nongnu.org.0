Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82269F6D6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:42:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqJ5-0003i6-OD; Wed, 22 Feb 2023 09:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJ2-0003dS-0t
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqJ0-00023S-BP
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0tX8VBgYcGXBq1dpKE2ZApE6KKmq6gbbOOdDD68uRU=;
 b=FJsbJZp1FbsV59H8/+to0fuGdkRv0P4CZI1j/KuVt9DR6EGmYplGRYFm0MimoJmC+5KLq8
 k608LQlUGdPACGwlDdPWDxiShCw54ViAbpAreN+2pcv5mddDTEGJp7YvQTUVBMu5DffCiF
 8r1952pb+QXkSoDZ/A0KWG2ixZwFIZo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-dPJKC2EQPoCZ5WfvzybFxA-1; Wed, 22 Feb 2023 09:41:11 -0500
X-MC-Unique: dPJKC2EQPoCZ5WfvzybFxA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h13-20020a0564020e8d00b004a26ef05c34so10637352eda.16
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:41:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s0tX8VBgYcGXBq1dpKE2ZApE6KKmq6gbbOOdDD68uRU=;
 b=QfWJaFazGX7hDkO2T82Ek2OGrnACLO52yKhboumhvMQ4yon/wID+SduKHHbN70/9lu
 2D6d+BavhWlohVBSKupat3xaL0ZLkvjjVfJKD0zvIbuNa2AbNaVom4z4kKACAv+KURnx
 PyQSHk2X5g1w5K2urdkF1dPjwzYk1V5kxPPFw+AjWBRPLEW2gtiwFUM0meJDSIEDIQ+1
 AHXjKi3Yqi4D3oL1pHfM5YDkGQYc7mZ9DHahAR13aYZNqF0hWW54EsZKL+/ffBf7gh6g
 0YFwEDFXsyNHabSBTA0wF7ErY9aFD84zJOcQzkILzme+AmpPGg3AxUzR/nXiEVWY34MP
 C/lQ==
X-Gm-Message-State: AO0yUKXhW/1aZMCLSbJJ/Zom3z5cC3oK016uQlxRrnRtS9V4lj10Xwf3
 MmkZJKRHqtEG6az1mJLYXCajmkAr/Js9uMAO+TLK1IbYiZ2fcKA7PrVe5j47hRsG5KLBRcyqIs3
 yzJTyJf9MTiqylgotHlnyn368lGSj4oB7mR4/bw2n9Kfb8z2ezlFZpPN8Hky1VKdKmskd8CiY
X-Received: by 2002:a17:907:94c5:b0:8b1:319c:c29c with SMTP id
 dn5-20020a17090794c500b008b1319cc29cmr21998022ejc.70.1677076869787; 
 Wed, 22 Feb 2023 06:41:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/egbJstapyDNVUNYj7JrluUEwqd2Y4JjGTdIhnsuiwm09Ok6kJihPzwx6pNYQnXaVMHytPwQ==
X-Received: by 2002:a17:907:94c5:b0:8b1:319c:c29c with SMTP id
 dn5-20020a17090794c500b008b1319cc29cmr21997995ejc.70.1677076869448; 
 Wed, 22 Feb 2023 06:41:09 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 um17-20020a170907cb1100b008e076ae6783sm2032696ejc.14.2023.02.22.06.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:41:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 1/4] target/i386: Fix 32-bit AD[CO]X insns in 64-bit mode
Date: Wed, 22 Feb 2023 15:41:00 +0100
Message-Id: <20230222144103.467002-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222144103.467002-1-pbonzini@redhat.com>
References: <20230222144103.467002-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Failure to truncate the inputs results in garbage for the carry-out.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1373
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230115012103.3131796-1-richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/emit.c.inc       |  2 +
 tests/tcg/x86_64/Makefile.target |  3 ++
 tests/tcg/x86_64/adox.c          | 69 ++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 tests/tcg/x86_64/adox.c

diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 0d7c6e80ae87..e61ae9a2e92d 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -1037,6 +1037,8 @@ static void gen_ADCOX(DisasContext *s, CPUX86State *env, MemOp ot, int cc_op)
 #ifdef TARGET_X86_64
     case MO_32:
         /* If TL is 64-bit just do everything in 64-bit arithmetic.  */
+        tcg_gen_ext32u_tl(s->T0, s->T0);
+        tcg_gen_ext32u_tl(s->T1, s->T1);
         tcg_gen_add_i64(s->T0, s->T0, s->T1);
         tcg_gen_add_i64(s->T0, s->T0, carry_in);
         tcg_gen_shri_i64(carry_out, s->T0, 32);
diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 4eac78293f2e..e64aab1b81c6 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -12,11 +12,14 @@ ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
 X86_64_TESTS += vsyscall
 X86_64_TESTS += noexec
 X86_64_TESTS += cmpxchg
+X86_64_TESTS += adox
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 else
 TESTS=$(MULTIARCH_TESTS)
 endif
 
+adox: CFLAGS=-O2
+
 run-test-i386-ssse3: QEMU_OPTS += -cpu max
 run-plugin-test-i386-ssse3-%: QEMU_OPTS += -cpu max
 
diff --git a/tests/tcg/x86_64/adox.c b/tests/tcg/x86_64/adox.c
new file mode 100644
index 000000000000..36be644c8bc5
--- /dev/null
+++ b/tests/tcg/x86_64/adox.c
@@ -0,0 +1,69 @@
+/* See if ADOX give expected results */
+
+#include <assert.h>
+#include <stdint.h>
+#include <stdbool.h>
+
+static uint64_t adoxq(bool *c_out, uint64_t a, uint64_t b, bool c)
+{
+    asm ("addl $0x7fffffff, %k1\n\t"
+         "adoxq %2, %0\n\t"
+         "seto %b1"
+         : "+r"(a), "=&r"(c) : "r"(b), "1"((int)c));
+    *c_out = c;
+    return a;
+}
+
+static uint64_t adoxl(bool *c_out, uint64_t a, uint64_t b, bool c)
+{
+    asm ("addl $0x7fffffff, %k1\n\t"
+         "adoxl %k2, %k0\n\t"
+         "seto %b1"
+         : "+r"(a), "=&r"(c) : "r"(b), "1"((int)c));
+    *c_out = c;
+    return a;
+}
+
+int main()
+{
+    uint64_t r;
+    bool c;
+
+    r = adoxq(&c, 0, 0, 0);
+    assert(r == 0);
+    assert(c == 0);
+
+    r = adoxl(&c, 0, 0, 0);
+    assert(r == 0);
+    assert(c == 0);
+
+    r = adoxl(&c, 0x100000000, 0, 0);
+    assert(r == 0);
+    assert(c == 0);
+
+    r = adoxq(&c, 0, 0, 1);
+    assert(r == 1);
+    assert(c == 0);
+
+    r = adoxl(&c, 0, 0, 1);
+    assert(r == 1);
+    assert(c == 0);
+
+    r = adoxq(&c, -1, -1, 0);
+    assert(r == -2);
+    assert(c == 1);
+
+    r = adoxl(&c, -1, -1, 0);
+    assert(r == 0xfffffffe);
+    assert(c == 1);
+
+    r = adoxq(&c, -1, -1, 1);
+    assert(r == -1);
+    assert(c == 1);
+
+    r = adoxl(&c, -1, -1, 1);
+    assert(r == 0xffffffff);
+    assert(c == 1);
+
+    return 0;
+}
-- 
2.39.1


