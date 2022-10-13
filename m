Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04225FE54F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:33:12 +0200 (CEST)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6lL-0001tu-P0
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj64F-0002ui-RI
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj648-0005NO-U7
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 17:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665697712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+ejBRt0mE7OFKY0qV7RwIYNK6gjjdwQfuVTwdsT9r8=;
 b=TlFsRWw4NCr40eStvlzPxjbpSZMe4H22aa9f1CrvdjTf0gC7GQvtz6J1u6TNclJGHKy6rF
 ZeBusBHpS9Lsy8xY86AKuNYJWHGAbzFLqFn0N7FWNlJS1CDz8NRAsMlyQTUVx0SS2ws8z3
 ib4mFVANqrJBJwo5SBNUqUdubpVt+/o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-TU7pAF42OuufitnMAYalxw-1; Thu, 13 Oct 2022 17:48:31 -0400
X-MC-Unique: TU7pAF42OuufitnMAYalxw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m10-20020a056402430a00b0045968bb0874so2330008edc.10
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 14:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U+ejBRt0mE7OFKY0qV7RwIYNK6gjjdwQfuVTwdsT9r8=;
 b=LW8/dkHerP3p5Weji/brdpNED8ldAUlG9loSEvqdE0Ltdx3zPDWeu8IFA6GRigzHJ/
 ZNUEURSquCpGRiUKOBT81zsMp/zIqiPtAgZzg5h9UvBCak1rjgDYZ9yN1Hxfg5DT1wEE
 XHT6OQ70bssh6yC0g0nqcSewySQprs41YQUhOqWGqXrLWesZDn4CpfvbFg+x4Q+k0jk+
 0/vwKsEgzqQBJEGyFUXMfARwYIyy0vFVpuaSyNv2h07vMWbWx9UJM4CvYta+3lP98UvK
 QDwKwmQaDjYXSyfobA3k1OkpBDDaLrT/nexPqkfTiw9cX9axBez+iM1ii+I39iKGaGRL
 FBpg==
X-Gm-Message-State: ACrzQf1zFCdFtoHF1kFldVjBzHS+97OLKoOCOB5ylu7PNqbfKa4StsuH
 ilppmWbZW1wg7s583iK9+CINnfAxg+VDV/m/6ZqRq8tttmuQKu3bbJSKvJQC1hYq5NkY/3rA/dk
 /Xr+kBjpsZPf1AoTIOwMNIpL7crRIMBAcflQ0RIVwVdivekYbnxBEcxMgs6JF4P+ZLWQ=
X-Received: by 2002:a17:907:724d:b0:78d:acf4:4c57 with SMTP id
 ds13-20020a170907724d00b0078dacf44c57mr1303744ejc.516.1665697709243; 
 Thu, 13 Oct 2022 14:48:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fdIVuDs9lpAxb9cXFKIEFE+ShzPOn/7bAbxWVi1aPYizJFsCBYGfcAIiIfOc6qXtiDpXfSg==
X-Received: by 2002:a17:907:724d:b0:78d:acf4:4c57 with SMTP id
 ds13-20020a170907724d00b0078dacf44c57mr1303721ejc.516.1665697708811; 
 Thu, 13 Oct 2022 14:48:28 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a170906498500b0078b83968ad4sm482942eju.24.2022.10.13.14.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 14:48:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: paul@nowt.org,
	richard.henderson@linaro.org
Subject: [PATCH 33/35] tests/tcg: extend SSE tests to AVX
Date: Thu, 13 Oct 2022 23:46:49 +0200
Message-Id: <20221013214651.672114-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013214651.672114-1-pbonzini@redhat.com>
References: <20221013214651.672114-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extracted from a patch by Paul Brook <paul@nowt.org>.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/i386/Makefile.target |   2 +-
 tests/tcg/i386/test-avx.c      | 201 ++++++++++++++++++---------------
 tests/tcg/i386/test-avx.py     |   5 +-
 3 files changed, 113 insertions(+), 95 deletions(-)

diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 3273aa8061..81831cafbc 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -107,7 +107,7 @@ run-test-mmx: QEMU_OPTS += -cpu max
 run-plugin-test-mmx: QEMU_OPTS += -cpu max
 test-mmx: test-mmx.h
 
-test-avx: CFLAGS += -masm=intel -O -I.
+test-avx: CFLAGS += -mavx -masm=intel -O -I.
 run-test-avx: QEMU_OPTS += -cpu max
 run-plugin-test-avx: QEMU_OPTS += -cpu max
 test-avx: test-avx.h
diff --git a/tests/tcg/i386/test-avx.c b/tests/tcg/i386/test-avx.c
index 23c170dd79..953e2906fe 100644
--- a/tests/tcg/i386/test-avx.c
+++ b/tests/tcg/i386/test-avx.c
@@ -6,18 +6,18 @@
 typedef void (*testfn)(void);
 
 typedef struct {
-    uint64_t q0, q1;
-} __attribute__((aligned(16))) v2di;
+    uint64_t q0, q1, q2, q3;
+} __attribute__((aligned(32))) v4di;
 
 typedef struct {
     uint64_t mm[8];
-    v2di xmm[16];
+    v4di ymm[16];
     uint64_t r[16];
     uint64_t flags;
     uint32_t ff;
     uint64_t pad;
-    v2di mem[4];
-    v2di mem0[4];
+    v4di mem[4];
+    v4di mem0[4];
 } reg_state;
 
 typedef struct {
@@ -31,20 +31,20 @@ reg_state initI;
 reg_state initF32;
 reg_state initF64;
 
-static void dump_xmm(const char *name, int n, const v2di *r, int ff)
+static void dump_ymm(const char *name, int n, const v4di *r, int ff)
 {
-    printf("%s%d = %016lx %016lx\n",
-           name, n, r->q1, r->q0);
+    printf("%s%d = %016lx %016lx %016lx %016lx\n",
+           name, n, r->q3, r->q2, r->q1, r->q0);
     if (ff == 64) {
-        double v[2];
+        double v[4];
         memcpy(v, r, sizeof(v));
-        printf("        %16g %16g\n",
-                v[1], v[0]);
-    } else if (ff == 32) {
-        float v[4];
-        memcpy(v, r, sizeof(v));
-        printf(" %8g %8g %8g %8g\n",
+        printf("        %16g %16g %16g %16g\n",
                 v[3], v[2], v[1], v[0]);
+    } else if (ff == 32) {
+        float v[8];
+        memcpy(v, r, sizeof(v));
+        printf(" %8g %8g %8g %8g %8g %8g %8g %8g\n",
+                v[7], v[6], v[5], v[4], v[3], v[2], v[1], v[0]);
     }
 }
 
@@ -53,10 +53,10 @@ static void dump_regs(reg_state *s)
     int i;
 
     for (i = 0; i < 16; i++) {
-        dump_xmm("xmm", i, &s->xmm[i], 0);
+        dump_ymm("ymm", i, &s->ymm[i], 0);
     }
     for (i = 0; i < 4; i++) {
-        dump_xmm("mem", i, &s->mem0[i], 0);
+        dump_ymm("mem", i, &s->mem0[i], 0);
     }
 }
 
@@ -74,13 +74,13 @@ static void compare_state(const reg_state *a, const reg_state *b)
         }
     }
     for (i = 0; i < 16; i++) {
-        if (memcmp(&a->xmm[i], &b->xmm[i], 16)) {
-            dump_xmm("xmm", i, &b->xmm[i], a->ff);
+        if (memcmp(&a->ymm[i], &b->ymm[i], 32)) {
+            dump_ymm("ymm", i, &b->ymm[i], a->ff);
         }
     }
     for (i = 0; i < 4; i++) {
-        if (memcmp(&a->mem0[i], &a->mem[i], 16)) {
-            dump_xmm("mem", i, &a->mem[i], a->ff);
+        if (memcmp(&a->mem0[i], &a->mem[i], 32)) {
+            dump_ymm("mem", i, &a->mem[i], a->ff);
         }
     }
     if (a->flags != b->flags) {
@@ -89,9 +89,9 @@ static void compare_state(const reg_state *a, const reg_state *b)
 }
 
 #define LOADMM(r, o) "movq " #r ", " #o "[%0]\n\t"
-#define LOADXMM(r, o) "movdqa " #r ", " #o "[%0]\n\t"
+#define LOADYMM(r, o) "vmovdqa " #r ", " #o "[%0]\n\t"
 #define STOREMM(r, o) "movq " #o "[%1], " #r "\n\t"
-#define STOREXMM(r, o) "movdqa " #o "[%1], " #r "\n\t"
+#define STOREYMM(r, o) "vmovdqa " #o "[%1], " #r "\n\t"
 #define MMREG(F) \
     F(mm0, 0x00) \
     F(mm1, 0x08) \
@@ -101,39 +101,39 @@ static void compare_state(const reg_state *a, const reg_state *b)
     F(mm5, 0x28) \
     F(mm6, 0x30) \
     F(mm7, 0x38)
-#define XMMREG(F) \
-    F(xmm0, 0x040) \
-    F(xmm1, 0x050) \
-    F(xmm2, 0x060) \
-    F(xmm3, 0x070) \
-    F(xmm4, 0x080) \
-    F(xmm5, 0x090) \
-    F(xmm6, 0x0a0) \
-    F(xmm7, 0x0b0) \
-    F(xmm8, 0x0c0) \
-    F(xmm9, 0x0d0) \
-    F(xmm10, 0x0e0) \
-    F(xmm11, 0x0f0) \
-    F(xmm12, 0x100) \
-    F(xmm13, 0x110) \
-    F(xmm14, 0x120) \
-    F(xmm15, 0x130)
+#define YMMREG(F) \
+    F(ymm0, 0x040) \
+    F(ymm1, 0x060) \
+    F(ymm2, 0x080) \
+    F(ymm3, 0x0a0) \
+    F(ymm4, 0x0c0) \
+    F(ymm5, 0x0e0) \
+    F(ymm6, 0x100) \
+    F(ymm7, 0x120) \
+    F(ymm8, 0x140) \
+    F(ymm9, 0x160) \
+    F(ymm10, 0x180) \
+    F(ymm11, 0x1a0) \
+    F(ymm12, 0x1c0) \
+    F(ymm13, 0x1e0) \
+    F(ymm14, 0x200) \
+    F(ymm15, 0x220)
 #define LOADREG(r, o) "mov " #r ", " #o "[rax]\n\t"
 #define STOREREG(r, o) "mov " #o "[rax], " #r "\n\t"
 #define REG(F) \
-    F(rbx, 0x148) \
-    F(rcx, 0x150) \
-    F(rdx, 0x158) \
-    F(rsi, 0x160) \
-    F(rdi, 0x168) \
-    F(r8, 0x180) \
-    F(r9, 0x188) \
-    F(r10, 0x190) \
-    F(r11, 0x198) \
-    F(r12, 0x1a0) \
-    F(r13, 0x1a8) \
-    F(r14, 0x1b0) \
-    F(r15, 0x1b8) \
+    F(rbx, 0x248) \
+    F(rcx, 0x250) \
+    F(rdx, 0x258) \
+    F(rsi, 0x260) \
+    F(rdi, 0x268) \
+    F(r8, 0x280) \
+    F(r9, 0x288) \
+    F(r10, 0x290) \
+    F(r11, 0x298) \
+    F(r12, 0x2a0) \
+    F(r13, 0x2a8) \
+    F(r14, 0x2b0) \
+    F(r15, 0x2b8) \
 
 static void run_test(const TestDef *t)
 {
@@ -143,7 +143,7 @@ static void run_test(const TestDef *t)
     printf("%5d %s\n", t->n, t->s);
     asm volatile(
             MMREG(LOADMM)
-            XMMREG(LOADXMM)
+            YMMREG(LOADYMM)
             "sub rsp, 128\n\t"
             "push rax\n\t"
             "push rbx\n\t"
@@ -156,26 +156,26 @@ static void run_test(const TestDef *t)
             "pop rbx\n\t"
             "shr rbx, 8\n\t"
             "shl rbx, 8\n\t"
-            "mov rcx, 0x1c0[rax]\n\t"
+            "mov rcx, 0x2c0[rax]\n\t"
             "and rcx, 0xff\n\t"
             "or rbx, rcx\n\t"
             "push rbx\n\t"
             "popf\n\t"
             REG(LOADREG)
-            "mov rax, 0x140[rax]\n\t"
+            "mov rax, 0x240[rax]\n\t"
             "call [rsp]\n\t"
             "mov [rsp], rax\n\t"
             "mov rax, 8[rsp]\n\t"
             REG(STOREREG)
             "mov rbx, [rsp]\n\t"
-            "mov 0x140[rax], rbx\n\t"
+            "mov 0x240[rax], rbx\n\t"
             "mov rbx, 0\n\t"
-            "mov 0x170[rax], rbx\n\t"
-            "mov 0x178[rax], rbx\n\t"
+            "mov 0x270[rax], rbx\n\t"
+            "mov 0x278[rax], rbx\n\t"
             "pushf\n\t"
             "pop rbx\n\t"
             "and rbx, 0xff\n\t"
-            "mov 0x1c0[rax], rbx\n\t"
+            "mov 0x2c0[rax], rbx\n\t"
             "add rsp, 16\n\t"
             "pop rdx\n\t"
             "pop rcx\n\t"
@@ -183,15 +183,15 @@ static void run_test(const TestDef *t)
             "pop rax\n\t"
             "add rsp, 128\n\t"
             MMREG(STOREMM)
-            XMMREG(STOREXMM)
+            YMMREG(STOREYMM)
             : : "r"(init), "r"(&result), "r"(t->fn)
             : "memory", "cc",
             "rsi", "rdi",
             "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",
             "mm0", "mm1", "mm2", "mm3", "mm4", "mm5", "mm6", "mm7",
-            "xmm0", "xmm1", "xmm2", "xmm3", "xmm4", "xmm5",
-            "xmm6", "xmm7", "xmm8", "xmm9", "xmm10", "xmm11",
-            "xmm12", "xmm13", "xmm14", "xmm15"
+            "ymm0", "ymm1", "ymm2", "ymm3", "ymm4", "ymm5",
+            "ymm6", "ymm7", "ymm8", "ymm9", "ymm10", "ymm11",
+            "ymm12", "ymm13", "ymm14", "ymm15"
             );
     compare_state(init, &result);
 }
@@ -223,22 +223,30 @@ static void run_all(void)
 
 float val_f32[] = {2.0, -1.0, 4.8, 0.8, 3, -42.0, 5e6, 7.5, 8.3};
 double val_f64[] = {2.0, -1.0, 4.8, 0.8, 3, -42.0, 5e6, 7.5};
-v2di val_i64[] = {
-    {0x3d6b3b6a9e4118f2lu, 0x355ae76d2774d78clu},
-    {0xd851c54a56bf1f29lu, 0x4a84d1d50bf4c4fflu},
-    {0x5826475e2c5fd799lu, 0xfd32edc01243f5e9lu},
+v4di val_i64[] = {
+    {0x3d6b3b6a9e4118f2lu, 0x355ae76d2774d78clu,
+     0xac3ff76c4daa4b28lu, 0xe7fabd204cb54083lu},
+    {0xd851c54a56bf1f29lu, 0x4a84d1d50bf4c4fflu,
+     0x56621e553d52b56clu, 0xd0069553da8f584alu},
+    {0x5826475e2c5fd799lu, 0xfd32edc01243f5e9lu,
+     0x738ba2c66d3fe126lu, 0x5707219c6e6c26b4lu},
 };
 
-v2di deadbeef = {0xa5a5a5a5deadbeefull, 0xa5a5a5a5deadbeefull};
-v2di indexq = {0x000000000000001full, 0x000000000000008full};
-v2di indexd = {0x00000002000000efull, 0xfffffff500000010ull};
+v4di deadbeef = {0xa5a5a5a5deadbeefull, 0xa5a5a5a5deadbeefull,
+                 0xa5a5a5a5deadbeefull, 0xa5a5a5a5deadbeefull};
+v4di indexq = {0x000000000000001full, 0x000000000000008full,
+               0xffffffffffffffffull, 0xffffffffffffff5full};
+v4di indexd = {0x00000002000000efull, 0xfffffff500000010ull,
+               0x0000000afffffff0ull, 0x000000000000000eull};
 
-void init_f32reg(v2di *r)
+v4di gather_mem[0x20];
+
+void init_f32reg(v4di *r)
 {
     static int n;
-    float v[4];
+    float v[8];
     int i;
-    for (i = 0; i < 4; i++) {
+    for (i = 0; i < 8; i++) {
         v[i] = val_f32[n++];
         if (n == ARRAY_LEN(val_f32)) {
             n = 0;
@@ -247,12 +255,12 @@ void init_f32reg(v2di *r)
     memcpy(r, v, sizeof(*r));
 }
 
-void init_f64reg(v2di *r)
+void init_f64reg(v4di *r)
 {
     static int n;
-    double v[2];
+    double v[4];
     int i;
-    for (i = 0; i < 2; i++) {
+    for (i = 0; i < 4; i++) {
         v[i] = val_f64[n++];
         if (n == ARRAY_LEN(val_f64)) {
             n = 0;
@@ -261,13 +269,15 @@ void init_f64reg(v2di *r)
     memcpy(r, v, sizeof(*r));
 }
 
-void init_intreg(v2di *r)
+void init_intreg(v4di *r)
 {
     static uint64_t mask;
     static int n;
 
     r->q0 = val_i64[n].q0 ^ mask;
     r->q1 = val_i64[n].q1 ^ mask;
+    r->q2 = val_i64[n].q2 ^ mask;
+    r->q3 = val_i64[n].q3 ^ mask;
     n++;
     if (n == ARRAY_LEN(val_i64)) {
         n = 0;
@@ -280,46 +290,53 @@ static void init_all(reg_state *s)
     int i;
 
     s->r[3] = (uint64_t)&s->mem[0]; /* rdx */
+    s->r[4] = (uint64_t)&gather_mem[ARRAY_LEN(gather_mem) / 2]; /* rsi */
     s->r[5] = (uint64_t)&s->mem[2]; /* rdi */
     s->flags = 2;
-    for (i = 0; i < 8; i++) {
-        s->xmm[i] = deadbeef;
+    for (i = 0; i < 16; i++) {
+        s->ymm[i] = deadbeef;
     }
-    s->xmm[13] = indexd;
-    s->xmm[14] = indexq;
-    for (i = 0; i < 2; i++) {
+    s->ymm[13] = indexd;
+    s->ymm[14] = indexq;
+    for (i = 0; i < 4; i++) {
         s->mem0[i] = deadbeef;
     }
 }
 
 int main(int argc, char *argv[])
 {
+    int i;
+
     init_all(&initI);
-    init_intreg(&initI.xmm[10]);
-    init_intreg(&initI.xmm[11]);
-    init_intreg(&initI.xmm[12]);
+    init_intreg(&initI.ymm[10]);
+    init_intreg(&initI.ymm[11]);
+    init_intreg(&initI.ymm[12]);
     init_intreg(&initI.mem0[1]);
     printf("Int:\n");
     dump_regs(&initI);
 
     init_all(&initF32);
-    init_f32reg(&initF32.xmm[10]);
-    init_f32reg(&initF32.xmm[11]);
-    init_f32reg(&initF32.xmm[12]);
+    init_f32reg(&initF32.ymm[10]);
+    init_f32reg(&initF32.ymm[11]);
+    init_f32reg(&initF32.ymm[12]);
     init_f32reg(&initF32.mem0[1]);
     initF32.ff = 32;
     printf("F32:\n");
     dump_regs(&initF32);
 
     init_all(&initF64);
-    init_f64reg(&initF64.xmm[10]);
-    init_f64reg(&initF64.xmm[11]);
-    init_f64reg(&initF64.xmm[12]);
+    init_f64reg(&initF64.ymm[10]);
+    init_f64reg(&initF64.ymm[11]);
+    init_f64reg(&initF64.ymm[12]);
     init_f64reg(&initF64.mem0[1]);
     initF64.ff = 64;
     printf("F64:\n");
     dump_regs(&initF64);
 
+    for (i = 0; i < ARRAY_LEN(gather_mem); i++) {
+        init_intreg(&gather_mem[i]);
+    }
+
     if (argc > 1) {
         int n = atoi(argv[1]);
         run_test(&test_table[n]);
diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index e16a3d8bee..02982329f1 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -8,6 +8,7 @@
 
 archs = [
     "SSE", "SSE2", "SSE3", "SSSE3", "SSE4_1", "SSE4_2",
+    "AES", "AVX", "AVX2", "AES+AVX", "VAES+AVX",
 ]
 
 ignore = set(["FISTTP",
@@ -42,7 +43,7 @@
     'vROUND[PS][SD]': 0x7,
     'vSHUFPD': 0x0f,
     'vSHUFPS': 0xff,
-    'vAESKEYGENASSIST': 0,
+    'vAESKEYGENASSIST': 0xff,
     'VEXTRACT[FI]128': 0x01,
     'VINSERT[FI]128': 0x01,
     'VPBLENDD': 0xff,
@@ -85,7 +86,7 @@ def mem_w(w):
     else:
         raise Exception()
 
-    return t + " PTR 16[rdx]"
+    return t + " PTR 32[rdx]"
 
 class XMMArg():
     isxmm = True
-- 
2.37.3


