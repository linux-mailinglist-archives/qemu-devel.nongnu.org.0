Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE536AED16
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaX-00063L-I1; Tue, 07 Mar 2023 12:59:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaU-00060l-QG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:58 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaT-0000DP-5A
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:58:58 -0500
Received: by mail-pl1-x630.google.com with SMTP id x11so10473038pln.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1o+KI5rDZ0dGO3mniJJMs2Kuchv6MQRtJUAUtqChZA=;
 b=WOV3FWyI2zkmFXDrWX+6eOVbuWbTUCHuRzic9yMjAe4chkCnu4SXk0wSSBmstnTlf2
 2hHxZcoyYF1fg+HD4IEun4YI9GhnnyBnKXdwsCS/mgqkK1tA7c3VgVNQRCdOYSYZITmX
 QZ+nXuec4tgNygxbw03Wkr9U2ifAyV/EM3afI8pe7tasKWuIMdtIk3TfWcAnbvH9QqMC
 fQDoP/uhUTx+MD9Mfh4wtTxrmMEbJPUGozWGI3NievIkV92F+4zkJvOELQ/gW9nu+kPt
 6YzlV9OKS9aVMNnEok3BfBeWPJVdvbImmaeDDLptqxcFre3oWMeTnzzB8bFrWT5ucpwB
 fv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1o+KI5rDZ0dGO3mniJJMs2Kuchv6MQRtJUAUtqChZA=;
 b=qUrDLNqvJWJVYApxTq1Jrl8sZlosa2D1vE8bqRF7wTBkMh7JEYnA9VgCM+3OGhtNtu
 cw1LGT9QW9SFXIpIDN9AUWPjg4fh7CpDuSAtSF8M03+4Y4iaXJ/R4hLaFwOfo1qCxJXT
 +bZdxWorwYBbbi9AfGgzjOC9tEvOdcC/zetQqwFf1glDZIwHMpim5vi7R6/Lp+po+nbZ
 nbUQEJBy8ilMsDuhIgW/+Q8QIBF086N6yTwAbmekOsV69THGaGRUO1WuA0kT2aUbc9i+
 En7KnMfunRyn7q4uc2U2v0awVSKwuB+skC6A1Gc+mc2Y0FL87aNarxs/1L8Q3C3Zw7fc
 aXaw==
X-Gm-Message-State: AO0yUKWYov5wws3/BOC5bnhXQs4WHF7/dys53vPxaZ6QWWttOWnP6Jr6
 kFopMYnQ5w64Hrf5JqYEggQBUBKN/kaND9b5wm8=
X-Google-Smtp-Source: AK7set9l1EaiOZFjNDyLQ4Xn+G8bDGLWgReGUFRR5H3voueiUMaBoe3xFz7R80zMD/SemdJE6SYv9Q==
X-Received: by 2002:a17:902:c407:b0:19e:21d0:5b90 with SMTP id
 k7-20020a170902c40700b0019e21d05b90mr22470130plk.4.1678211935933; 
 Tue, 07 Mar 2023 09:58:55 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/67] target/mips: Drop tcg_temp_free from vr54xx_translate.c
Date: Tue,  7 Mar 2023 09:57:49 -0800
Message-Id: <20230307175848.2508955-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index a7d241e4e7..804672f84c 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -49,10 +49,6 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     gen_helper_mult_acc(t0, cpu_env, t0, t1);
 
     gen_store_gpr(t0, a->rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
-- 
2.34.1


