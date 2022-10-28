Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF66117C2
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:42:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQN-0003Hg-Rd; Fri, 28 Oct 2022 12:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPP-0005IG-Iu; Fri, 28 Oct 2022 12:40:39 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPN-0007wS-Sl; Fri, 28 Oct 2022 12:40:39 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 w26-20020a056830061a00b0066c320f5b49so949489oti.5; 
 Fri, 28 Oct 2022 09:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iAJDHjENxE6N3mVj5DAcHwL5kqmsr6E5lHGXotCNVMk=;
 b=l9+kivMVacgwPZim+iIyA3MSEs/9zOPYgJXP2J3H7XjD9G7ZZrhDOvLlbSV48kW4ix
 bQGSDFEpTYKfDMxz85XqvOM+BSdoa2nIqBC7GOE8Cyzuiev5CdE34IoSN2EQc4alYSUi
 Em8KRxMqny3tFCFAeyqy2TKlBFyLS/8czm0kZlsTXhY2fYGMWxTiXx6vgTEJTKmUkFcS
 Aoj6ZcfLzP/6V9vAFSbzYkpWOo589V6orKe1IOfzzC53shq45crqllMwaoi4ACRS26pD
 ojXqXhSPKs9iWV6cY7bzxPgqSEOfIz4EcQfw6ef6W0PgKrjWAYvEOGr58lTWEx2CnTU4
 mqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iAJDHjENxE6N3mVj5DAcHwL5kqmsr6E5lHGXotCNVMk=;
 b=pyp+7+wCSpe0dhELvidc/ZrfS6eSbszz7GGj1txbSuIaM4LGfmIXXHa6csSu3GahL5
 pJE0atUBbcxUFFvHDNcUT/fGfRc6jW1+T9ft+SMMT747+eFsz/eTMSRZuRPWGzB42lzA
 Mcs4BGO2GvbVbyfRoOx4/3YsdE2DIP6v4WUcAOCi7n2KG0zLuDWQb/6giNDuyi8lhS14
 XqH1pJJIzvXqSugKKGH8iIaEVj/leeomrpGFo+HCroVeeCpDRt1UMpb2p8sEuR+SmLkc
 qnDiDnPkDdYRZDnJ6fEMTTRJxrGdDRrZgk0S3pn6vWDFk8007r3MO6VoR6FMR2uUzB7+
 Bv+A==
X-Gm-Message-State: ACrzQf0E1hEsYClO4AvOSUENoT/4+/0doQCnswfoP+GjGWHb4JSlDydy
 1GLmyRB03yL4NK++TJ5AFmn6I1wO4X5vlQ==
X-Google-Smtp-Source: AMsMyM7WqcYnV7Ew/CQtRW1f8VMzzKr7SWgy8vbMdzExER9S3P62IJ7DMkKChNj99o56lH81Ryy2JA==
X-Received: by 2002:a05:6830:438a:b0:661:d4ae:9dd6 with SMTP id
 s10-20020a056830438a00b00661d4ae9dd6mr122359otv.26.1666975235426; 
 Fri, 28 Oct 2022 09:40:35 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 08/62] target/ppc: Move VMH[R]ADDSHS instruction to decodetree
Date: Fri, 28 Oct 2022 13:38:57 -0300
Message-Id: <20221028163951.810456-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

This patch moves VMHADDSHS and VMHRADDSHS to decodetree I couldn't find
a satisfactory implementation with TCG inline.

vmhaddshs:
rept    loop    master             patch
8       12500   0,02983400         0,02648500 (-11.2%)
25      4000    0,02946000         0,02518000 (-14.5%)
100     1000    0,03104300         0,02638000 (-15.0%)
500     200     0,04002000         0,03502500 (-12.5%)
2500    40      0,08090100         0,07562200 (-6.5%)
8000    12      0,19242600         0,18626800 (-3.2%)

vmhraddshs:
rept    loop    master             patch
8       12500   0,03078600         0,02851000 (-7.4%)
25      4000    0,02793200         0,02746900 (-1.7%)
100     1000    0,02886000         0,02839900 (-1.6%)
500     200     0,03714700         0,03799200 (+2.3%)
2500    40      0,07948000         0,07852200 (-1.2%)
8000    12      0,19049800         0,18813900 (-1.2%)

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221019125040.48028-3-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 | 4 ++--
 target/ppc/insn32.decode            | 2 ++
 target/ppc/int_helper.c             | 4 ++--
 target/ppc/translate/vmx-impl.c.inc | 5 +++--
 target/ppc/translate/vmx-ops.c.inc  | 1 -
 5 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9c562ab00e..f02a9497b7 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -258,8 +258,8 @@ DEF_HELPER_4(vpkuhum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkuwum, void, env, avr, avr, avr)
 DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpkpx, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
+DEF_HELPER_5(VMHADDSHS, void, env, avr, avr, avr, avr)
+DEF_HELPER_5(VMHRADDSHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VMSUMSHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9ba1689230..4e142d5e23 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -694,6 +694,8 @@ VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
 
 VMLADDUHM       000100 ..... ..... ..... ..... 100010   @VA
+VMHADDSHS       000100 ..... ..... ..... ..... 100000   @VA
+VMHRADDSHS      000100 ..... ..... ..... ..... 100001   @VA
 
 ## Vector String Instructions
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 0d25000b2a..ae1ba8084d 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -939,7 +939,7 @@ target_ulong helper_vctzlsbb(ppc_avr_t *r)
     return count;
 }
 
-void helper_vmhaddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
+void helper_VMHADDSHS(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                       ppc_avr_t *b, ppc_avr_t *c)
 {
     int sat = 0;
@@ -957,7 +957,7 @@ void helper_vmhaddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmhraddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
+void helper_VMHRADDSHS(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                        ppc_avr_t *b, ppc_avr_t *c)
 {
     int sat = 0;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 9f18c6d4f2..3acd585a2f 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2521,7 +2521,7 @@ static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
         tcg_temp_free_ptr(rd);                                          \
     }
 
-GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16)
+GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
 static bool do_va_helper(DisasContext *ctx, arg_VA *a,
     void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
@@ -2620,7 +2620,8 @@ static bool do_va_env_helper(DisasContext *ctx, arg_VA *a,
 TRANS_FLAGS(ALTIVEC, VMSUMUHS, do_va_env_helper, gen_helper_VMSUMUHS)
 TRANS_FLAGS(ALTIVEC, VMSUMSHS, do_va_env_helper, gen_helper_VMSUMSHS)
 
-GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
+TRANS_FLAGS(ALTIVEC, VMHADDSHS, do_va_env_helper, gen_helper_VMHADDSHS)
+TRANS_FLAGS(ALTIVEC, VMHRADDSHS, do_va_env_helper, gen_helper_VMHRADDSHS)
 
 GEN_VXFORM_NOA(vclzb, 1, 28)
 GEN_VXFORM_NOA(vclzh, 1, 29)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index a3a0fd0650..7cd9d40e06 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -219,7 +219,6 @@ GEN_VXFORM_UIMM(vctsxs, 5, 15),
 
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
     GEN_HANDLER(name0##_##name1, 0x04, opc2, 0xFF, 0x00000000, PPC_ALTIVEC)
-GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
 
 GEN_VXFORM_DUAL(vclzb, vpopcntb, 1, 28, PPC_NONE, PPC2_ALTIVEC_207),
-- 
2.37.3


