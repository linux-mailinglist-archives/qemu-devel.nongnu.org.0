Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A132F65B8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:26:03 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05Ri-0005al-GC
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05MR-0003X3-5p
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:36 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l05MP-0000L3-OG
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:20:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id h17so4842459wmq.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBqX1clbYKt9R+SX61mxukew3gcbpBwk2CU6RWzKp/Q=;
 b=ZJtr0PFqf4dMma/ZBf6xbTexslNIumhMC1tA9lJvtc3RXaK/U5uUslWvaVv6OkmYq/
 cmafK9E+3IE3pekGsnCMLncCISKlgAQDUU6AtumIcs/j8PW5ujH3GJ19nU0GuWXjUMFW
 rA+05P9ldfJGgviLgMwfiu3xCTsNVRfnIte5lpKULRPpK+CdIbrZPTZVidbSL2LKf0Xd
 owWYphJPiyfOvYGSSkuCDddXud4s3E1WF03MlbZ6JV8k7IbFpZG0pah1LV3D6bKwnUUC
 kq4+IkZ/kH5nU9BKhIQAnSzzDC6ExKSvXIGkll16Le7zPsCjiJOiFEMTsy1XmdR3sgHA
 WIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tBqX1clbYKt9R+SX61mxukew3gcbpBwk2CU6RWzKp/Q=;
 b=Di4gbL1hfymqFtLAKJ/UjSD/Tgw0w8a/TFad/zL88J9qRFkbwe5U9rdjcYYwdBanvh
 vtMG/b97NGo9SnwaJXyDNMmAkrvcvMT2qP0CyW3neUTSi62K8rK+FT+Dn1DI3mY5eCBV
 4O3iPjvJl0LvLgA7LBQPkc3CfFl9WlaXwypG/IsKtvgggPp/qnK20Gejrd0x1wl28uGy
 MqUQcDQei9HCJS1UKSt8owfpB4NlJBvD5o1Z+udgn2lQuQO4EkL5EzwuTxvIuqOm7y1n
 +0EhFSrECxZTSHjgMmahBGrZAJJuXDnAT87r1esZFuZUhBWYSUI79+3iqIQVxnHAVkZL
 2qcw==
X-Gm-Message-State: AOAM530+C9G1FRrf1A04Muy16beJwIJxN4/67Zu81T8m7vQJwN8j6F8B
 atOuMjJWXprFJ6W65jRydt3WwcuT1hQ=
X-Google-Smtp-Source: ABdhPJwClUK0+1aDEn3FkxnnQpLobQlL8rciiCXqHEXceIj+19fFdaoeV9VAu0QD2L+Xm/6pCM+Plg==
X-Received: by 2002:a1c:2c83:: with SMTP id s125mr4622432wms.161.1610641230229; 
 Thu, 14 Jan 2021 08:20:30 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 125sm9249706wmc.27.2021.01.14.08.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:20:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Subject: [PULL v2 30/69] target/mips: Replace gen_exception_err(err=0) by
 gen_exception_end()
Date: Thu, 14 Jan 2021 17:20:01 +0100
Message-Id: <20210114162016.2901557-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114162016.2901557-1-f4bug@amsat.org>
References: <20210114162016.2901557-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

generate_exception_err(err=0) is simply generate_exception_end().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214183739.500368-11-f4bug@amsat.org>
---
 target/mips/translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 72cbf604ac3..fa11c8ffe0c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2897,7 +2897,7 @@ void gen_move_high32(TCGv ret, TCGv_i64 arg)
 static inline void check_cp0_enabled(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
-        generate_exception_err(ctx, EXCP_CpU, 0);
+        generate_exception_end(ctx, EXCP_CpU);
     }
 }
 
@@ -3103,10 +3103,10 @@ static inline void check_mt(DisasContext *ctx)
 static inline void check_cp0_mt(DisasContext *ctx)
 {
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_CP0))) {
-        generate_exception_err(ctx, EXCP_CpU, 0);
+        generate_exception_end(ctx, EXCP_CpU);
     } else {
         if (unlikely(!(ctx->CP0_Config3 & (1 << CP0C3_MT)))) {
-            generate_exception_err(ctx, EXCP_RI, 0);
+            generate_exception_end(ctx, EXCP_RI);
         }
     }
 }
-- 
2.26.2


