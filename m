Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B043D0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:24:10 +0200 (CEST)
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnar-0001uO-Ax
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnKz-0003Tt-Ia
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:07:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnKy-0003v4-0c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:07:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id b71so2654185wmd.0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8jf+7unp+HAJCVd0e1nDlJt/bt1yvln0F8p9tQcrpo=;
 b=ndQBQeH+vkF5ygESN1CgBCosqJaV34DQjmd/e/cAzoJBqClCblRD6B0QrsxAe9lG5F
 AXxX0uWT0lfs+PyDlp71i5HfJdixhPP7NAFktEysqN++jbhDLQiVsTGK3/IzSRFtXJFr
 GgJXjC+cKyLEaimZVmfgxUfPLfm/Ojvx6P+3JTP69vdMHQaH6MM+hGO5MfrlFUdeWPXn
 xHW1s78jWtIxbiMc08od4Sr4bWYpyzIr27s2HDO8zsRtz72uaXSjf5fkm7zPjBLh8URx
 fMTvYDihj8PN5Ui34EdGFvt2TfrywJpg4RvU2a12xDdHthHUa2JLgYtGEKJfeh6qLWe9
 k0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K8jf+7unp+HAJCVd0e1nDlJt/bt1yvln0F8p9tQcrpo=;
 b=bzqPQBvgwgfhlxM365+qcmIHjHk2taElBPx0MQx3072g0JEe0u+EAKc/BSi5cyIiI+
 XWtgY2+UG45WblNSnQff8Ig0EqEYJWnRMe2dh+LrytYQssSShrqvb37Nu0ZxghPCgfKI
 U7EbWxNrqId7F11Sec9bJ+orLnqeUMstykyoy9P46y4dDThq8avBfBLVe1CN+EQNuDxK
 E3TKbW0LB1Enq228JYG2HW/njz6qJ586Fht1wjZkwuk1iIP4HnSrkbUamIIiXUTul+oj
 YP9VG1CodOdjoNodumTIkUNbNIEXN6PKSn0XOD67U3wzJ+XCXvdcPniKIAw4sFYN6yja
 hGYg==
X-Gm-Message-State: AOAM530vQLesKAo/lKMrnxDcIrYeJ3BHHkQ3EYRUnn2Lm6/ZJbrtnk3b
 SIXoZz1wVodrX/lmxQ8Ef4z7P7aqbds=
X-Google-Smtp-Source: ABdhPJyAAQGrS8Aul1wD9Gs1TxlTizmLpHDdtPZAcdXeWi0TAf0QzS1dJNe+z6E4t2Wup34eHQDsjA==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr1428924wmg.101.1635358062394; 
 Wed, 27 Oct 2021 11:07:42 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a26sm411452wmm.46.2021.10.27.11.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:07:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/32] target/mips: Fix MSA MSUBV.B opcode
Date: Wed, 27 Oct 2021 20:07:00 +0200
Message-Id: <20211027180730.1551932-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result of the 'Vector Multiply and Subtract' opcode is
incorrect with Byte vectors. Probably due to a copy/paste error,
commit 5f148a02327 mistakenly used the $wt (target register)
instead  of $wd (destination register) as first operand. Fix that.

Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Fixes: 5f148a02327 ("target/mips: msa: Split helpers for MSUBV.<B|H|W|D>")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
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


