Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC11608D1C
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 14:08:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omD7S-0003Bq-O2; Sat, 22 Oct 2022 07:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD76-00033E-5M
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1omD74-0006iB-3x
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 07:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666439785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myzg5aKN1qvz+RXQu6Cn+Ajo7dzQv92bv+8d9HRZ2Gk=;
 b=UlTVpEAru2lzQc/fM7VGrC4P/sXvorVIEf/vvFqQf5hy0HikiYiPuXizTOA7uAJAa7M46/
 HJX+dyh9dMf6gU+gFySZyntjyEjp/rYpviGMs1ooRhD4DuPIOSxQfTAMuBmNfhQM4gAk06
 jB6Z+4Ad0WUPpcd63vrd1mJVXxwqrHM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-ay8YM4qpM9ezUlTO0wNBnQ-1; Sat, 22 Oct 2022 07:56:24 -0400
X-MC-Unique: ay8YM4qpM9ezUlTO0wNBnQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v13-20020a056402348d00b0045d36615696so5128300edc.14
 for <qemu-devel@nongnu.org>; Sat, 22 Oct 2022 04:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myzg5aKN1qvz+RXQu6Cn+Ajo7dzQv92bv+8d9HRZ2Gk=;
 b=Eotuu/pqOqEoF1JB+3TGBbwKtCiX+PSjoYwYck6ji758CtopATm9juBcpzt3wrw4Wd
 xcCe0tGMr60qzQ6RXD0ZqhSlcx0/wqhbk4Jrfa3al9tg0kE7Q4lAcd1TJC/ZVUD1ohsC
 0HCbivZnJ7Tr5Ja6EDgwsGQyL3oyFWn6gv7vVavgDZmwGXFrW4AlsX9DBlnjGzpT2gqi
 B391+xEmP6W2rsvOFurvwSPqDBNuyDhNUTC+bd685MZMoB2m1+3LYeyk2vKg0+7KtOS1
 kUfkBihQIHaJ5wNRLNatCn/BTduGDtdo0A1r+5iWbGV9sap17S1ga/WdFeSPWcpdlfVf
 JcLw==
X-Gm-Message-State: ACrzQf110e/M5EEyYZSRQdGBmqU33+/1vI4+QQBdRewNY9JG5LnewOze
 iFPM5qn4K/LWUEKMj2qjrLq9Eixcpc0MVsa1TFiw99ZUgtOVyT1rP4VUWDYeBIUM99jJ7fzrKNQ
 IAmelEpAYHIyuj/FKbzGos+refxpDyJn2fYA59N6DB67WXXpRlMnv0JJpURK2FOTdwJM=
X-Received: by 2002:a17:907:3da2:b0:78d:3b45:11d9 with SMTP id
 he34-20020a1709073da200b0078d3b4511d9mr19785192ejc.87.1666439781585; 
 Sat, 22 Oct 2022 04:56:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM68S6wg42OFHisw0KdttjF9TtBrlYy+TZ0PyMJoAYE3xbAZyhflB+fjpfTiWp/9L3vTcU4xPQ==
X-Received: by 2002:a17:907:3da2:b0:78d:3b45:11d9 with SMTP id
 he34-20020a1709073da200b0078d3b4511d9mr19785177ejc.87.1666439781166; 
 Sat, 22 Oct 2022 04:56:21 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00458b41d9460sm14833666edh.92.2022.10.22.04.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 04:56:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 4/4] target/i386: implement FMA instructions
Date: Sat, 22 Oct 2022 13:56:08 +0200
Message-Id: <20221022115608.152853-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022115608.152853-1-pbonzini@redhat.com>
References: <20221022115608.152853-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only issue with FMA instructions is that there are _a lot_ of them (30
opcodes, each of which comes in up to 4 versions depending on VEX.W and
VEX.L; a total of 96 possibilities).  However, they can be implement with
only 6 helpers, two for scalar operations and four for packed operations.
(Scalar versions do not do any merging; they only affect the bottom 32
or 64 bits of the output operand.  Therefore, there is no separate XMM
and YMM of the scalar helpers).

First, we can reduce the number of helpers to one third by passing four
operands (one output and three inputs); the reordering of which operands
go to the multiply and which go to the add is done in emit.c.

Second, the different instructions also dispatch to the same softfloat
function, so the flags for float32_muladd and float64_muladd are passed
in the helper as int arguments, with a little extra complication to
handle FMADDSUB and FMSUBADD.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c                |  5 ++--
 target/i386/ops_sse.h            | 27 +++++++++++++++++
 target/i386/ops_sse_header.h     | 11 +++++++
 target/i386/tcg/decode-new.c.inc | 40 +++++++++++++++++++++++++
 target/i386/tcg/decode-new.h     |  1 +
 target/i386/tcg/emit.c.inc       | 51 ++++++++++++++++++++++++++++++++
 target/i386/tcg/translate.c      |  1 +
 tests/tcg/i386/test-avx.py       |  2 +-
 8 files changed, 135 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6292b7e12f..22b681ca37 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -625,10 +625,11 @@ void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
           CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
-          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C)
+          CPUID_EXT_RDRAND | CPUID_EXT_AVX | CPUID_EXT_F16C | \
+          CPUID_EXT_FMA)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
-          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
+          CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
           CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER */
 
diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 33c61896ee..3cbc36a59d 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2522,6 +2522,33 @@ void helper_vpermd_ymm(Reg *d, Reg *v, Reg *s)
 }
 #endif
 
+/* FMA3 op helpers */
+#if SHIFT == 1
+#define SSE_HELPER_FMAS(name, elem, F)                                         \
+    void name(CPUX86State *env, Reg *d, Reg *a, Reg *b, Reg *c, int flags)     \
+    {                                                                          \
+        d->elem(0) = F(a->elem(0), b->elem(0), c->elem(0), flags, &env->sse_status); \
+    }
+#define SSE_HELPER_FMAP(name, elem, num, F)                                    \
+    void glue(name, SUFFIX)(CPUX86State *env, Reg *d, Reg *a, Reg *b, Reg *c,  \
+                            int flags, int flip)                               \
+    {                                                                          \
+        int i;                                                                 \
+        for (i = 0; i < num; i++) {                                            \
+            d->elem(i) = F(a->elem(i), b->elem(i), c->elem(i), flags, &env->sse_status); \
+            flags ^= flip;                                                     \
+        }                                                                      \
+    }
+
+SSE_HELPER_FMAS(helper_fma4ss,  ZMM_S, float32_muladd)
+SSE_HELPER_FMAS(helper_fma4sd,  ZMM_D, float64_muladd)
+#endif
+
+#if SHIFT >= 1
+SSE_HELPER_FMAP(helper_fma4ps,  ZMM_S, 2 << SHIFT, float32_muladd)
+SSE_HELPER_FMAP(helper_fma4pd,  ZMM_D, 1 << SHIFT, float64_muladd)
+#endif
+
 #undef SSE_HELPER_S
 
 #undef LANE_WIDTH
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index c4c41976c0..8a7b2f4e2f 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -359,6 +359,17 @@ DEF_HELPER_3(glue(cvtph2ps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(cvtps2ph, SUFFIX), void, env, Reg, Reg, int)
 #endif
 
+/* FMA3 helpers */
+#if SHIFT == 1
+DEF_HELPER_6(fma4ss, void, env, Reg, Reg, Reg, Reg, int)
+DEF_HELPER_6(fma4sd, void, env, Reg, Reg, Reg, Reg, int)
+#endif
+
+#if SHIFT >= 1
+DEF_HELPER_7(glue(fma4ps, SUFFIX), void, env, Reg, Reg, Reg, Reg, int, int)
+DEF_HELPER_7(glue(fma4pd, SUFFIX), void, env, Reg, Reg, Reg, Reg, int, int)
+#endif
+
 /* AVX helpers */
 #if SHIFT >= 1
 DEF_HELPER_4(glue(vpermilpd, SUFFIX), void, env, Reg, Reg, Reg)
diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 8baee9018a..e4878b967f 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -376,6 +376,16 @@ static const X86OpEntry opcodes_0F38_00toEF[240] = {
     [0x92] = X86_OP_ENTRY3(VPGATHERD, V,x,  H,x,  M,d,  vex12 cpuid(AVX2) p_66), /* vgatherdps/d */
     [0x93] = X86_OP_ENTRY3(VPGATHERQ, V,x,  H,x,  M,q,  vex12 cpuid(AVX2) p_66), /* vgatherqps/d */
 
+    /* Should be exception type 2 but they do not have legacy SSE equivalents? */
+    [0x96] = X86_OP_ENTRY3(VFMADDSUB132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x97] = X86_OP_ENTRY3(VFMSUBADD132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xa6] = X86_OP_ENTRY3(VFMADDSUB213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xa7] = X86_OP_ENTRY3(VFMSUBADD213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xb6] = X86_OP_ENTRY3(VFMADDSUB231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xb7] = X86_OP_ENTRY3(VFMSUBADD231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
     [0x08] = X86_OP_ENTRY3(PSIGNB,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
     [0x09] = X86_OP_ENTRY3(PSIGNW,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
     [0x0a] = X86_OP_ENTRY3(PSIGND,    V,x,        H,x,  W,x,  vex4 cpuid(SSSE3) mmx avx2_256 p_00_66),
@@ -421,6 +431,34 @@ static const X86OpEntry opcodes_0F38_00toEF[240] = {
     [0x8c] = X86_OP_ENTRY3(VPMASKMOV,    V,x,  H,x, WM,x, vex6 cpuid(AVX2) p_66),
     [0x8e] = X86_OP_ENTRY3(VPMASKMOV_st, M,x,  V,x, H,x,  vex6 cpuid(AVX2) p_66),
 
+    /* Should be exception type 2 or 3 but they do not have legacy SSE equivalents? */
+    [0x98] = X86_OP_ENTRY3(VFMADD132Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x99] = X86_OP_ENTRY3(VFMADD132Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9a] = X86_OP_ENTRY3(VFMSUB132Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9b] = X86_OP_ENTRY3(VFMSUB132Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9c] = X86_OP_ENTRY3(VFNMADD132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9d] = X86_OP_ENTRY3(VFNMADD132Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9e] = X86_OP_ENTRY3(VFNMSUB132Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0x9f] = X86_OP_ENTRY3(VFNMSUB132Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xa8] = X86_OP_ENTRY3(VFMADD213Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xa9] = X86_OP_ENTRY3(VFMADD213Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xaa] = X86_OP_ENTRY3(VFMSUB213Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xab] = X86_OP_ENTRY3(VFMSUB213Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xac] = X86_OP_ENTRY3(VFNMADD213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xad] = X86_OP_ENTRY3(VFNMADD213Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xae] = X86_OP_ENTRY3(VFNMSUB213Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xaf] = X86_OP_ENTRY3(VFNMSUB213Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
+    [0xb8] = X86_OP_ENTRY3(VFMADD231Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xb9] = X86_OP_ENTRY3(VFMADD231Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xba] = X86_OP_ENTRY3(VFMSUB231Px,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbb] = X86_OP_ENTRY3(VFMSUB231Sx,  V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbc] = X86_OP_ENTRY3(VFNMADD231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbd] = X86_OP_ENTRY3(VFNMADD231Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbe] = X86_OP_ENTRY3(VFNMSUB231Px, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+    [0xbf] = X86_OP_ENTRY3(VFNMSUB231Sx, V,x,  H,x, W,x,  vex6 cpuid(FMA) p_66),
+
     [0xdb] = X86_OP_ENTRY3(VAESIMC,     V,dq, None,None, W,dq, vex4 cpuid(AES) p_66),
     [0xdc] = X86_OP_ENTRY3(VAESENC,     V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
     [0xdd] = X86_OP_ENTRY3(VAESENCLAST, V,x,  H,x,       W,x,  vex4 cpuid(AES) p_66),
@@ -1350,6 +1388,8 @@ static bool has_cpuid_feature(DisasContext *s, X86CPUIDFeature cpuid)
         return true;
     case X86_FEAT_F16C:
         return (s->cpuid_ext_features & CPUID_EXT_F16C);
+    case X86_FEAT_FMA:
+        return (s->cpuid_ext_features & CPUID_EXT_FMA);
     case X86_FEAT_MOVBE:
         return (s->cpuid_ext_features & CPUID_EXT_MOVBE);
     case X86_FEAT_PCLMULQDQ:
diff --git a/target/i386/tcg/decode-new.h b/target/i386/tcg/decode-new.h
index 0ef54628ee..cb6b8bcf67 100644
--- a/target/i386/tcg/decode-new.h
+++ b/target/i386/tcg/decode-new.h
@@ -105,6 +105,7 @@ typedef enum X86CPUIDFeature {
     X86_FEAT_BMI1,
     X86_FEAT_BMI2,
     X86_FEAT_F16C,
+    X86_FEAT_FMA,
     X86_FEAT_MOVBE,
     X86_FEAT_PCLMULQDQ,
     X86_FEAT_SSE,
diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
index 9334f0939d..7037ff91c6 100644
--- a/target/i386/tcg/emit.c.inc
+++ b/target/i386/tcg/emit.c.inc
@@ -39,6 +39,11 @@ typedef void (*SSEFunc_0_eppt)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                TCGv val);
 typedef void (*SSEFunc_0_epppti)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
                                  TCGv_ptr reg_c, TCGv a0, TCGv_i32 scale);
+typedef void (*SSEFunc_0_eppppi)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                  TCGv_ptr reg_c, TCGv_ptr reg_d, TCGv_i32 flags);
+typedef void (*SSEFunc_0_eppppii)(TCGv_ptr env, TCGv_ptr reg_a, TCGv_ptr reg_b,
+                                  TCGv_ptr reg_c, TCGv_ptr reg_d, TCGv_i32 even,
+                                  TCGv_i32 odd);
 
 static inline TCGv_i32 tcg_constant8u_i32(uint8_t val)
 {
@@ -491,6 +496,52 @@ FP_SSE(VMIN, min)
 FP_SSE(VDIV, div)
 FP_SSE(VMAX, max)
 
+#define FMA_SSE_PACKED(uname, ptr0, ptr1, ptr2, even, odd)                         \
+static void gen_##uname##Px(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    SSEFunc_0_eppppii xmm = s->vex_w ? gen_helper_fma4pd_xmm : gen_helper_fma4ps_xmm; \
+    SSEFunc_0_eppppii ymm = s->vex_w ? gen_helper_fma4pd_ymm : gen_helper_fma4ps_ymm; \
+    SSEFunc_0_eppppii fn = s->vex_l ? ymm : xmm;                                   \
+                                                                                   \
+    fn(cpu_env, OP_PTR0, ptr0, ptr1, ptr2,                                         \
+       tcg_constant_i32(even),                                                     \
+       tcg_constant_i32((even) ^ (odd)));                                          \
+}
+
+#define FMA_SSE(uname, ptr0, ptr1, ptr2, flags)                                    \
+FMA_SSE_PACKED(uname, ptr0, ptr1, ptr2, flags, flags)                              \
+static void gen_##uname##Sx(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
+{                                                                                  \
+    SSEFunc_0_eppppi fn = s->vex_w ? gen_helper_fma4sd : gen_helper_fma4ss;        \
+                                                                                   \
+    fn(cpu_env, OP_PTR0, ptr0, ptr1, ptr2,                                         \
+       tcg_constant_i32(flags));                                                   \
+}                                                                                  \
+
+FMA_SSE(VFMADD231,  OP_PTR1, OP_PTR2, OP_PTR0, 0)
+FMA_SSE(VFMADD213,  OP_PTR1, OP_PTR0, OP_PTR2, 0)
+FMA_SSE(VFMADD132,  OP_PTR0, OP_PTR2, OP_PTR1, 0)
+
+FMA_SSE(VFNMADD231, OP_PTR1, OP_PTR2, OP_PTR0, float_muladd_negate_product)
+FMA_SSE(VFNMADD213, OP_PTR1, OP_PTR0, OP_PTR2, float_muladd_negate_product)
+FMA_SSE(VFNMADD132, OP_PTR0, OP_PTR2, OP_PTR1, float_muladd_negate_product)
+
+FMA_SSE(VFMSUB231,  OP_PTR1, OP_PTR2, OP_PTR0, float_muladd_negate_c)
+FMA_SSE(VFMSUB213,  OP_PTR1, OP_PTR0, OP_PTR2, float_muladd_negate_c)
+FMA_SSE(VFMSUB132,  OP_PTR0, OP_PTR2, OP_PTR1, float_muladd_negate_c)
+
+FMA_SSE(VFNMSUB231, OP_PTR1, OP_PTR2, OP_PTR0, float_muladd_negate_c|float_muladd_negate_product)
+FMA_SSE(VFNMSUB213, OP_PTR1, OP_PTR0, OP_PTR2, float_muladd_negate_c|float_muladd_negate_product)
+FMA_SSE(VFNMSUB132, OP_PTR0, OP_PTR2, OP_PTR1, float_muladd_negate_c|float_muladd_negate_product)
+
+FMA_SSE_PACKED(VFMADDSUB231, OP_PTR1, OP_PTR2, OP_PTR0, float_muladd_negate_c, 0)
+FMA_SSE_PACKED(VFMADDSUB213, OP_PTR1, OP_PTR0, OP_PTR2, float_muladd_negate_c, 0)
+FMA_SSE_PACKED(VFMADDSUB132, OP_PTR0, OP_PTR2, OP_PTR1, float_muladd_negate_c, 0)
+
+FMA_SSE_PACKED(VFMSUBADD231, OP_PTR1, OP_PTR2, OP_PTR0, 0, float_muladd_negate_c)
+FMA_SSE_PACKED(VFMSUBADD213, OP_PTR1, OP_PTR0, OP_PTR2, 0, float_muladd_negate_c)
+FMA_SSE_PACKED(VFMSUBADD132, OP_PTR0, OP_PTR2, OP_PTR1, 0, float_muladd_negate_c)
+
 #define FP_UNPACK_SSE(uname, lname)                                                \
 static void gen_##uname(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode) \
 {                                                                                  \
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index e19d5c1c64..85be2e58c2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -26,6 +26,7 @@
 #include "tcg/tcg-op-gvec.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
+#include "fpu/softfloat.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/tests/tcg/i386/test-avx.py b/tests/tcg/i386/test-avx.py
index ebb1d99c5e..d9ca00a49e 100755
--- a/tests/tcg/i386/test-avx.py
+++ b/tests/tcg/i386/test-avx.py
@@ -9,7 +9,7 @@
 archs = [
     "SSE", "SSE2", "SSE3", "SSSE3", "SSE4_1", "SSE4_2",
     "AES", "AVX", "AVX2", "AES+AVX", "VAES+AVX",
-    "F16C",
+    "F16C", "FMA",
 ]
 
 ignore = set(["FISTTP",
-- 
2.37.3


