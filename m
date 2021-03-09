Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5D5332A82
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:33:12 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeMB-000547-Qz
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnS-0004iE-Ra
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:18 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdnR-0002TQ-CX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:57:18 -0500
Received: by mail-ej1-x62a.google.com with SMTP id p8so28460124ejb.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSauL6XiWqe7pdli7sYj4+exNHtcFAP8QrNM1PNuIkg=;
 b=GpM9heVTQTGztz17jWx41Vtlhym5ZfHrYB0PYnftarbK3kcn1wMXkGFDx/a4u5GGAB
 VFcTWn92TL8+xh28Za5CXZdzOEAWF213QCN1Gs8v5vRH7/W7VADFF2jpartAy+FrvDz3
 ohFOIOKz+MwA0VgAxMy8mlor39Ta4nk1pc+cNlMLvlAifLhVpPbxCYZEyTMPQ9/piDSm
 MkfmK/mbdYTIw0FiQ6pkr9/a/sWKdfsMBi4vjB72jMKH1hWkHUxhsAeTiamBMPz/tcZt
 aTfpvEPSPiwGyJpaiIOc+MWFXDqb8jzqDzSpo3CKTpUWcKuVE7RXLcdgmiv8qI3bko0l
 mLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MSauL6XiWqe7pdli7sYj4+exNHtcFAP8QrNM1PNuIkg=;
 b=Xc778k41I9TUkldRjAFvH+NUdjEtjSW0OiQIQcvtgnG0CuVIGwrjslfynoorQnuWiD
 Kfhn6uN3/fRJHrbHc1HIcfq2pjQm4HDIPYOl0XpOjWIieub2BfFR/0wz6c8SSf+e5LZt
 yCypd73K0vbwruW/9nojng7jKh1qDb7ZeImjBdyxr27e4NBxrN8a8dftaw3vjY0vYuFN
 5kY5wNspp6f9IHix5HqRmnZWF9GFeMV1yZzu68QzGCDe/LabR0DAwYznC7SLZEDNLJfG
 KR894cKpVh8SxS6wX0DhXTyZcbh6UO9mK6f58uBZz9Jin4Ol2XI2UchSjWA/+CQwDdl7
 w0xg==
X-Gm-Message-State: AOAM532bUtojyHVFtFZcbyVg7N2+uQpNImFcP+vxV1dycZm2cBCfg7ZT
 yA+NE6iZ25Pery6Bv+ZDAUtDmi3LyWI=
X-Google-Smtp-Source: ABdhPJwg4QWEP05kqjQoXKYj1sy7kGmiJuTvmvz291ryVJ58QQKGiyNivHboB1T9T/OmkSs8Sztw5g==
X-Received: by 2002:a17:906:7150:: with SMTP id
 z16mr20294605ejj.103.1615301835750; 
 Tue, 09 Mar 2021 06:57:15 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bt14sm9410462edb.92.2021.03.09.06.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 04/22] target/mips/translate: Simplify PCPYH using
 deposit_i64()
Date: Tue,  9 Mar 2021 15:56:35 +0100
Message-Id: <20210309145653.743937-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the PCPYH (Parallel Copy Halfword) instruction by using
multiple calls to deposit_i64() which can be optimized by some
TCG backends.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-11-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 34 ++++------------------------------
 1 file changed, 4 insertions(+), 30 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0f77c0ebc57..9de81b08665 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24091,36 +24091,10 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         tcg_gen_movi_i64(cpu_gpr[rd], 0);
         tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
     } else {
-        TCGv_i64 t0 = tcg_temp_new();
-        TCGv_i64 t1 = tcg_temp_new();
-        uint64_t mask = (1ULL << 16) - 1;
-
-        tcg_gen_andi_i64(t0, cpu_gpr[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_gpr[rd], t1);
-
-        tcg_gen_andi_i64(t0, cpu_gpr_hi[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_gpr_hi[rd], t1);
-
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
+        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rt], cpu_gpr[rt], 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rd], cpu_gpr[rd], 32, 32);
+        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt], cpu_gpr_hi[rt], 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rd], cpu_gpr_hi[rd], 32, 32);
     }
 }
 
-- 
2.26.2


