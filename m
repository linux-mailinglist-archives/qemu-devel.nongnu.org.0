Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663285F1CDD
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:36:21 +0200 (CEST)
Received: from localhost ([::1]:47954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedbI-00022w-GV
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCS-0003Lc-H6
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:41 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCQ-0004HF-Pc
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:40 -0400
Received: by mail-qt1-x82a.google.com with SMTP id a20so4215019qtw.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vnymagiJD2n7qCI9WcNoObzz8HpNhsV/41YONJ+Aql4=;
 b=L4uSt0qi+qMPa48RKpeyS8iWs5RUY/lr8btYIUV14ulszIm7appvsF+r70OVa/58tu
 zmAxae7dsxCYT/QHHxsQ8bHxhgXh4Yo7ofB3QMuXdpTFcpaNOVBmuFmds4jyPjPwg+0g
 yWEBqfWcz1b0lCv14W32e3JqmS22WHoYnDFg1+CzKrNOAdZeKemNY+U9Kazur31GJgSm
 S45DJMMIxnhbBQcoB2RIlDwu/AqDqVjJrkw0DfkD0cgG03SAmseJG2WC4rWWLk4H3sXp
 puRHVvLZ8/pvFRiIRuJAafIhV+sDeecW49R8FBlCzZGPsVNMDaTrl1BGQdFNKYITR7HE
 nbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vnymagiJD2n7qCI9WcNoObzz8HpNhsV/41YONJ+Aql4=;
 b=XL2lCjQV1yucFJ3ZBFKaYR8kTds+OlrwFgOgv0Zuh3wbLURNPSvN0umQtPVj8R/L7G
 sWIn+ceizocXxbZoRREM2+CP79FAQqlOebQXtDWruXFVAdh88PGw/KXFl0oeaf/mdTFC
 ElcdxNKTsGRef0t0YxJe2C4/0SYkGa7cafZ0XM/WFAPwPHy2CeaPTv1TDs8BUI5mNUtA
 9D1209LmVixd2bjn/Q3EAdkrQRW6CMG6DcyfNA/C1d6D91wtWvdDCIFOwxFX99o+1qIF
 b647bwY3T0DhDtjhgyYkENSgxHkYJTS7dOpnrbO6Dj7bbwKEeDwVZlH9lRKbmLiSGoQr
 t7GA==
X-Gm-Message-State: ACrzQf1xcHzzvwoau3yL9iBRTwmFtieL2czOF9Xew8RYyEz0jkSAcQia
 D16hlQnOMRm4eEZfxZrwQtGNED7MJ5JyDUPT
X-Google-Smtp-Source: AMsMyM6XwumyJrpivSPPzgHuUOchyFxbTut1hDhMJD2e41T5Mcst1+kJAnMjYBwxbr7IGEeinIPc2w==
X-Received: by 2002:a05:622a:14cc:b0:35d:1214:99e8 with SMTP id
 u12-20020a05622a14cc00b0035d121499e8mr10545271qtx.205.1664633437279; 
 Sat, 01 Oct 2022 07:10:37 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 24/26] target/i386: Add cpu_eip
Date: Sat,  1 Oct 2022 07:09:33 -0700
Message-Id: <20221001140935.465607-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Create a tcg global temp for this, and use it instead of explicit stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 5b0dab8633..f08fa060c4 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -64,6 +64,7 @@
 
 /* global register indexes */
 static TCGv cpu_cc_dst, cpu_cc_src, cpu_cc_src2;
+static TCGv cpu_eip;
 static TCGv_i32 cpu_cc_op;
 static TCGv cpu_regs[CPU_NB_REGS];
 static TCGv cpu_seg_base[6];
@@ -481,7 +482,7 @@ static void gen_add_A0_im(DisasContext *s, int val)
 
 static inline void gen_op_jmp_v(TCGv dest)
 {
-    tcg_gen_st_tl(dest, cpu_env, offsetof(CPUX86State, eip));
+    tcg_gen_mov_tl(cpu_eip, dest);
 }
 
 static inline
@@ -518,7 +519,7 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
 
 static void gen_jmp_im(DisasContext *s, target_ulong pc)
 {
-    gen_op_jmp_v(tcg_constant_tl(pc));
+    tcg_gen_movi_tl(cpu_eip, pc);
 }
 
 static void gen_update_eip_cur(DisasContext *s)
@@ -8614,6 +8615,13 @@ void tcg_x86_init(void)
         [R_EDI] = "edi",
         [R_EBP] = "ebp",
         [R_ESP] = "esp",
+#endif
+    };
+    static const char eip_name[] = {
+#ifdef TARGET_X86_64
+        "rip"
+#else
+        "eip"
 #endif
     };
     static const char seg_base_names[6][8] = {
@@ -8640,6 +8648,7 @@ void tcg_x86_init(void)
                                     "cc_src");
     cpu_cc_src2 = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, cc_src2),
                                      "cc_src2");
+    cpu_eip = tcg_global_mem_new(cpu_env, offsetof(CPUX86State, eip), eip_name);
 
     for (i = 0; i < CPU_NB_REGS; ++i) {
         cpu_regs[i] = tcg_global_mem_new(cpu_env,
-- 
2.34.1


