Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1259E33A0DC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:04:14 +0100 (CET)
Received: from localhost ([::1]:42990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAUf-0006xH-2m
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGA-00074g-AX
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:14 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAG8-000729-Vk
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:14 -0500
Received: by mail-wr1-x431.google.com with SMTP id u16so6626185wrt.1
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QT135G9+ZflxNaE9JXFsl2Girh95rzMzYvPq1Qqa2Qk=;
 b=MmuGRmy8UhezppiyA4ChcDyh8ZlcDuabjxgQ5ugaWA3gBqJAUIrYBNFpgF2zCvYW8I
 ERM8xhsF2SA4cysQQETsNhBgfnKcrqqUCo4u13EQXxq0Da0Xf3bq/CXBhGEiO5iBYguG
 hrvrROm/qQYsNQzqueDmhC2okfj4nBve6uKz7PyKN37t/jX3IWIB8vW9FodOdxhJyNad
 T9nD88cpnAIl66cE8dF7YQ7xoho4KL1q40RVUWk1ezWB1CvKjwRmo90/YaSXAVBXRmcH
 AflXAGQqid+KmOkDINo5HFOLtsskNsbg/v9sNcwhihPd7NcPJU5SC5rQziIDrCGe64Uj
 QBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QT135G9+ZflxNaE9JXFsl2Girh95rzMzYvPq1Qqa2Qk=;
 b=B+WRWyoNyrzifzBYYmygAcV+2Yx6n4qrum86+5qgUb2GFL+WFBCMMU1Uy7jhezzuOE
 7+iCl90qLITZm6nKQjDr4Gp6iq353XfHjMq3PbyHkd/FGFV0EDn8rq5TrY8ClEuz3G3u
 /zvavUZ04WCedlplrDLWcU65NIlPyiIiEv0WMbpoY4lJebFCW+mcfXH8clQDwGgF3vg1
 h0uTRSi5Sx7Sn+FW0/PjE8q7girpQsZxh7MMRR6aISN7E8G6MpttoDn+ib4jvYsYACeB
 +JRy/wa5glZNSoBzChd2ELRKBJmS+rGiyZ6ANFS39AYb14TORP1elO7FfBuVWCIh6WP6
 cZIA==
X-Gm-Message-State: AOAM5335MOGz6MwC7BLXCaKyJMZ9MNgj/S336j0xMUroXOKIyqj6mGkr
 cqouyM8pTOvFRAgf8pcmovrKvaoCGm5cpg==
X-Google-Smtp-Source: ABdhPJx6cfM6335gPZTv6t+xPo0V2/oMCq6Ub2BmeIqV1vo6y/LXbm7j5FFmQ82sTp8Qyt7CvmY9jw==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr19987184wrd.126.1615664951444; 
 Sat, 13 Mar 2021 11:49:11 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x11sm8409619wme.9.2021.03.13.11.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/27] target/mips: Rewrite complex ifdef'ry
Date: Sat, 13 Mar 2021 20:48:10 +0100
Message-Id: <20210313194829.2193621-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need for this obfuscated ifdef'ry, KISS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0b6d82d228e..ceb77a3a7ca 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28276,13 +28276,16 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
         if ((ctx->insn_flags & INSN_R5900) && (ctx->insn_flags & ASE_MMI)) {
             decode_mmi(env, ctx);
-#else
+            break;
+        }
+#endif
+#if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
             decode_opc_mxu(env, ctx);
-#endif
-        } else {
-            decode_opc_special2_legacy(env, ctx);
+            break;
         }
+#endif
+        decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
 #if defined(TARGET_MIPS64)
-- 
2.26.2


