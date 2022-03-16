Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B944DAA4B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:04:06 +0100 (CET)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMlR-0002lz-5d
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:04:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgT-0002du-5k
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:57 -0400
Received: from [2607:f8b0:4864:20::435] (port=34533
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgR-0006Tp-Km
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:56 -0400
Received: by mail-pf1-x435.google.com with SMTP id l8so2578037pfu.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35HcCby7Mn+2agrxKO46W+juCyRSjYj+577YArHBs58=;
 b=u3853nR5m3h08NFrm+m8GrNNpyssPJswQilEpY7ypVFnuwdyXi2i5FmumaFNqV7mz5
 mCBVPJrCRHWN7T6ii/nxxro9s/ElVqZ4EzLnpsmDEXphsiwYYLatRTR84NouhMsmZvCW
 18hHfJpkaWwQE7Feobco8SuH91hpfoJ/9uQTjTTzNGblhvJla6m+eWYRut/oCRwe0nNJ
 X7f43wnKPGVp1MKp78CzhfRonBF1JAGjJI7NfdgdFSVIIMV0CTFR11AQ0vJmTezwWmOP
 q7YemvdVJEV/LAPiSSWhTjfz7+eTNvVFWGe2d3E2uQ4QuNL10awy1v2v71vvDYXlfa3v
 Iazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35HcCby7Mn+2agrxKO46W+juCyRSjYj+577YArHBs58=;
 b=k6lmnmX+XJNL+0biEF+mnnl5MOo0Q25byU1SMgA0j6BFvkIF3PdcJVGY0lXRxXLGyX
 DfGNM0TxM0gU0f/YbYiuv/HdHsbhmNvu2c+Q2dUjZALzxUbpjPitdFLNRNKCxfLj6s1l
 dQw6KySU7p1oVVag4bMKhif4gDZhmflt3OdLBgqRPf7S1CBu+wtzxYp75DVDnu0Y7PAJ
 UidzTnXBAHr5gcnKx/xd4hDXsAxQQA+jlamnoV8PB2GkgLOLpCnOfYuokJG5opzwrrP7
 +LhGpd5VNFXjSlFtDhk3q0aMCD2ccnKONXwAnY+i8ZgNC36g2nASvcnYN98ZJel1Bb89
 /ZdQ==
X-Gm-Message-State: AOAM530k0QJ6cC7CHRni3JkIGOTKoejabWrC7u0InFEUGtdL8MFsB3oX
 +ULiVcc50btbaEras72frapBRAt9KaHHqw==
X-Google-Smtp-Source: ABdhPJy4Z+biTvhoNSW8wete4ipw0rl9aCcclMTeVwBDk7WOFKuN2zxKpVABcwq3LzPJRLv3jhRwRA==
X-Received: by 2002:a63:df58:0:b0:381:6713:6a49 with SMTP id
 h24-20020a63df58000000b0038167136a49mr5352058pgj.198.1647410334158; 
 Tue, 15 Mar 2022 22:58:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/17] target/m68k: Implement FTRAPcc
Date: Tue, 15 Mar 2022 22:58:36 -0700
Message-Id: <20220316055840.727571-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 6118f9fcfb..14f8c702c1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5567,6 +5567,35 @@ DISAS_INSN(fscc)
     tcg_temp_free(tmp);
 }
 
+DISAS_INSN(ftrapcc)
+{
+    DisasCompare c;
+    uint16_t ext;
+    int cond;
+
+    ext = read_im16(env, s);
+    cond = ext & 0x3f;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* ftrapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* ftrapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* ftrapcc (no operand) */
+        break;
+    default:
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+
+    gen_fcc_cond(&c, s, cond);
+    do_trapcc(s, &c);
+}
+
 #if defined(CONFIG_SOFTMMU)
 DISAS_INSN(frestore)
 {
@@ -6190,6 +6219,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(fbcc,      f280, ffc0, CF_FPU);
     INSN(fpu,       f200, ffc0, FPU);
     INSN(fscc,      f240, ffc0, FPU);
+    INSN(ftrapcc,   f278, fff8, FPU);
     INSN(fbcc,      f280, ff80, FPU);
 #if defined(CONFIG_SOFTMMU)
     INSN(frestore,  f340, ffc0, CF_FPU);
-- 
2.25.1


