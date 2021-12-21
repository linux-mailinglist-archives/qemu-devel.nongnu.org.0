Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785547C4AC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:06:17 +0100 (CET)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziad-0004cH-VQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:06:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ9-0000y4-SD
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:12 -0500
Received: from [2607:f8b0:4864:20::633] (port=46944
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ1-0007fM-U8
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:11 -0500
Received: by mail-pl1-x633.google.com with SMTP id p18so11172045pld.13
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WO96uXzs2VxZy6qk1muZlkJ5WfUhWuzvPvum8pCRR/k=;
 b=os88VotlpOqV+XS2P8fKZEB81adjI1fTOCkStvCG1wvTDLD5O+l/wW5srrnm2WDimR
 AYW9IF70w3KB57xFuBs8X99v/EmedGpKujuxuPEGv/AWAfLgcfMd4kdgDEAGVIpJE4K4
 qqCLdJnIkkJZtg1z4LxRSa06HP23oW3W7dsOA/y4rKzlYEqnRgjGWi6ZeOwYHp06tVX5
 cLdh1vTW8PWYTBJGf4rpriR6ABaJoGDNJYtePdoupTOwPL/jFrtu8d6HURz/KEHZ/NB5
 dz+qL9Z9LnYZtvd9M1DY22m3KN+B0N+fovXqk/fDeMvwpdLhizZVNg+isTBc3Lu8K4I/
 J6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WO96uXzs2VxZy6qk1muZlkJ5WfUhWuzvPvum8pCRR/k=;
 b=y92qWHYfTOrFPcBv3rhsfdgUzERkpyayW0qfIOn/zDmf1Y988Om7rW/npLmA6a6XDb
 JO5kdUzMVNf07BMmkxBexdPlMuTLRNjaet73iAQFVFKduDT94c/w8Y9z5pNwpPeK0Tp5
 AR0Byj5Kt7Oy64FPKnuk1EviSWAK1Xbfm9Y5xXEh0i0O9ADPu38l+94ur7/rS9yUYy67
 Qm1Li/kB05m4fQyMaR6YQXVsU7OELWVSkWmn/YNQ3evNTbiI6giAle+R9otThcaGv0uk
 zlT3Bou3XJHdN9XUZVsaqlGF4wMNpRxupX5u3IAwGSBwvE3cCT2rBNDhTSAsEnM/3dTC
 D9dQ==
X-Gm-Message-State: AOAM531vriuogoKFfjJnoclEElsZy52+EfJ5JTwubHUj7A+k11+2rwKu
 kcPwVq4EX51ndpyIg+bdCjEIotL8+llerA==
X-Google-Smtp-Source: ABdhPJxYAw10LT8Y4jXW8+NWZ3U0B6qSeIiiFwdySPSjrcnRKOy7lDunj+p9YPmCw30FUVn5DOb/nQ==
X-Received: by 2002:a17:90a:fd95:: with SMTP id
 cx21mr5096720pjb.54.1640105282693; 
 Tue, 21 Dec 2021 08:48:02 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/31] tcg/loongarch64: Implement tcg_target_init
Date: Tue, 21 Dec 2021 08:47:32 -0800
Message-Id: <20211221164737.1076007-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_SPACE_RATIO=0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211221054105.178795-27-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 92a30b791a..19bfc135f6 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -1604,3 +1604,30 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_opc_addi_d(s, TCG_REG_SP, TCG_REG_SP, FRAME_SIZE);
     tcg_out_opc_jirl(s, TCG_REG_ZERO, TCG_REG_RA, 0);
 }
+
+static void tcg_target_init(TCGContext *s)
+{
+    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
+    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
+
+    tcg_target_call_clobber_regs = ALL_GENERAL_REGS;
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S0);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S1);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S2);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S3);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S4);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S5);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S6);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S7);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S8);
+    tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_S9);
+
+    s->reserved_regs = 0;
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_ZERO);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TP);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_RESERVED);
+}
-- 
2.25.1


