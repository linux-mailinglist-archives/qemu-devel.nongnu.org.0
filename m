Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223F43859B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:54:05 +0200 (CEST)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meOxo-0002GF-BA
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsJ-0003Rk-Pi
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:43977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsH-00059g-Qm
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r7so2756389wrc.10
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESYS0poMleep1azLgDHGVOnLpU3H0aYnUxu4xqbADAE=;
 b=eeRGTvYiLVUQBQwaBsv1nwKirk4JApCJTeOI0Vy9NkMURsFjlup8/ddm/qTId6g89u
 PBtFAx17IpO9VOSvOVQcLulTx+zmKaA6Kf4H1JwKd3S0MQxu/NxXLJK28B6CgEqeKfov
 DuQqmuaiMx99iAZbd2eG/i5L94z1yvvltvJBVCMOTyleCl6LDCBBPlDECyenE5LpRf5t
 Sw2ZW0iSaQayWSdnxIesFfMO82EE7qS9qQyyRnLhbh/xdTiNC0Wws+aumZx8i/n0/asV
 EHifblfNJRf0DYl3IRY45gifdoBn+1bIUa9Jsxq2tNNBzPhuqv6a9qhcgYKZph4/5e2C
 WCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ESYS0poMleep1azLgDHGVOnLpU3H0aYnUxu4xqbADAE=;
 b=iW6hZqo7NY3OeOguYGNIQBjGesacAOs9uDjh6++z2BqZfw+0A5/4nXIcASKPV5Ep6L
 qz2/Eh2iqwgEEX2l0DJsL/qSDH5BMHTc+zFo5Vg1af2NNyYJCyazGT5w0n0K6vAPQej9
 RirkJGxDBuJ+BwL/fJc/9xZLwXUHSbRM9PuCjTj5dxexKRaKmgx3TJSpIeWcAUu8UOxR
 wTqNuPtiOH4QocSIxyQI4uOSCAHEjTGWUt7GUKt4IMwJAW/75fUwkShaCqJ46MMeqddq
 SkCbDXdDUvoH6eWtHfAxjsXd+coqROS3haewHDeaMwuekceQgC9NJkBDXU0BCNFrpFF0
 x3vw==
X-Gm-Message-State: AOAM531Cz1gviuT02cTZXqA0tyvJPHgw5qfDjamCASTQaG8B2DoiJs/o
 Wl+3gixKyudRMEhC1LuO6Y+HqShK/cc=
X-Google-Smtp-Source: ABdhPJxMLb0bk8X7vnDJil1qbPe8qpNDynHZc/eUU65lvlfe8OPIFZ0v2mKSv1cWr12YTZGS/ykpZg==
X-Received: by 2002:a5d:514c:: with SMTP id u12mr103304wrt.144.1635025700209; 
 Sat, 23 Oct 2021 14:48:20 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 i24sm12149284wml.26.2021.10.23.14.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/33] target/mips: Fix MSA MSUBV.B opcode
Date: Sat, 23 Oct 2021 23:47:33 +0200
Message-Id: <20211023214803.522078-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result of the 'Vector Multiply and Subtract' opcode is
incorrect with Byte vectors. Probably due to a copy/paste error,
commit 5f148a02327 mistakenly used the $wt (target register)
instead  of $wd (destination register) as first operand. Fix that.

Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Fixes: 5f148a02327 ("target/mips: msa: Split helpers for MSUBV.<B|H|W|D>")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_helper.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index d978909527f..5667b1f0a15 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -3303,22 +3303,22 @@ void helper_msa_msubv_b(CPUMIPSState *env,
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
 
-    pwd->b[0]  = msa_msubv_df(DF_BYTE, pwt->b[0],  pws->b[0],  pwt->b[0]);
-    pwd->b[1]  = msa_msubv_df(DF_BYTE, pwt->b[1],  pws->b[1],  pwt->b[1]);
-    pwd->b[2]  = msa_msubv_df(DF_BYTE, pwt->b[2],  pws->b[2],  pwt->b[2]);
-    pwd->b[3]  = msa_msubv_df(DF_BYTE, pwt->b[3],  pws->b[3],  pwt->b[3]);
-    pwd->b[4]  = msa_msubv_df(DF_BYTE, pwt->b[4],  pws->b[4],  pwt->b[4]);
-    pwd->b[5]  = msa_msubv_df(DF_BYTE, pwt->b[5],  pws->b[5],  pwt->b[5]);
-    pwd->b[6]  = msa_msubv_df(DF_BYTE, pwt->b[6],  pws->b[6],  pwt->b[6]);
-    pwd->b[7]  = msa_msubv_df(DF_BYTE, pwt->b[7],  pws->b[7],  pwt->b[7]);
-    pwd->b[8]  = msa_msubv_df(DF_BYTE, pwt->b[8],  pws->b[8],  pwt->b[8]);
-    pwd->b[9]  = msa_msubv_df(DF_BYTE, pwt->b[9],  pws->b[9],  pwt->b[9]);
-    pwd->b[10] = msa_msubv_df(DF_BYTE, pwt->b[10], pws->b[10], pwt->b[10]);
-    pwd->b[11] = msa_msubv_df(DF_BYTE, pwt->b[11], pws->b[11], pwt->b[11]);
-    pwd->b[12] = msa_msubv_df(DF_BYTE, pwt->b[12], pws->b[12], pwt->b[12]);
-    pwd->b[13] = msa_msubv_df(DF_BYTE, pwt->b[13], pws->b[13], pwt->b[13]);
-    pwd->b[14] = msa_msubv_df(DF_BYTE, pwt->b[14], pws->b[14], pwt->b[14]);
-    pwd->b[15] = msa_msubv_df(DF_BYTE, pwt->b[15], pws->b[15], pwt->b[15]);
+    pwd->b[0]  = msa_msubv_df(DF_BYTE, pwd->b[0],  pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_msubv_df(DF_BYTE, pwd->b[1],  pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_msubv_df(DF_BYTE, pwd->b[2],  pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_msubv_df(DF_BYTE, pwd->b[3],  pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_msubv_df(DF_BYTE, pwd->b[4],  pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_msubv_df(DF_BYTE, pwd->b[5],  pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_msubv_df(DF_BYTE, pwd->b[6],  pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_msubv_df(DF_BYTE, pwd->b[7],  pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_msubv_df(DF_BYTE, pwd->b[8],  pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_msubv_df(DF_BYTE, pwd->b[9],  pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_msubv_df(DF_BYTE, pwd->b[10], pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_msubv_df(DF_BYTE, pwd->b[11], pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_msubv_df(DF_BYTE, pwd->b[12], pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_msubv_df(DF_BYTE, pwd->b[13], pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_msubv_df(DF_BYTE, pwd->b[14], pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_msubv_df(DF_BYTE, pwd->b[15], pws->b[15], pwt->b[15]);
 }
 
 void helper_msa_msubv_h(CPUMIPSState *env,
-- 
2.31.1


