Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825796B2E20
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWb-0003un-EM; Thu, 09 Mar 2023 15:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWZ-0003ok-Iw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:03 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWX-0000hp-8B
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:02 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so6378646pjn.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1o+KI5rDZ0dGO3mniJJMs2Kuchv6MQRtJUAUtqChZA=;
 b=dIvHYrrCxvIouUl9ZIBLVJYJdvANRfyBfOMRPepCHcZp5FqcXg+m/CQ/GRnqoqR8u8
 ln1ixlfuMVFmumEu/LIgWh4Vj5Hj887vjDuI8r1UDj02YxQf1C7OlZ1gt4CfT1rsFr+G
 EuJgVgwv7tNcdxaCNr84JTT7M04qf2nfslOTOPN+elotGm+Hu99/FsoHAiix9xwHYjND
 73UTL4lQVIQbKbfEe+yuTvPbus9w5Z5ezmsuMHiHLJxrP7WYJy01oUyQ4y13Dsn86Uw2
 3JdBFCQXDBFcWC/qByU5iiy47BywVvKl+vIoFmDPO0fu8/aLKV9tLXmahEb9+dZVYSad
 4FFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1o+KI5rDZ0dGO3mniJJMs2Kuchv6MQRtJUAUtqChZA=;
 b=EG//uA2wn+K6jT3pxeFRO8vQrjfFReB2Bo+Fb6VqGsvDuXL8rxNwcLkPZzyRRCe4to
 rqZFMSSBlw3BAmyogii7AiRPUkgag2z2oRXqO76jy5NECvTitRSREeAJDvsKrNuxiOXM
 phYC5BS2PBPW9LEI/Gbj4Ll0ybw9Vd37zgBS1zWJxrnlC6lnzQqBImQ7Xuqqt4BcMQq7
 wWVyN3h+5g6WuotlW6HdIRH2N3AjUH74g9A4NfY6P1HHOFr1oPTH9uiSZeoUj+ighFPP
 4IVJkXVxpHTss8MoEDOS8wT+uHjf9r8TajjCNsYC8C9HRE9J+0wLMIr/sLbi8B0cjhjc
 31Yw==
X-Gm-Message-State: AO0yUKXFBlCOiv/624d+WHwYaTnu/bWqtIkY4R3+5v6Zr9Zd6TUNr1GT
 gmQ1v1Fa+l0zpzFQ0mbqw5GL63fP+uBMYD0Ij2Q=
X-Google-Smtp-Source: AK7set+oh+hwq1U2ZwT8pSiuvQ0qihyas7KziBWgZRi0TRAST9yU53864MQml1Pn4UWyal7n4lf3AQ==
X-Received: by 2002:a17:90b:1b0c:b0:237:97a3:1479 with SMTP id
 nu12-20020a17090b1b0c00b0023797a31479mr24946849pjb.28.1678392359442; 
 Thu, 09 Mar 2023 12:05:59 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:05:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 08/91] target/mips: Drop tcg_temp_free from
 vr54xx_translate.c
Date: Thu,  9 Mar 2023 12:04:27 -0800
Message-Id: <20230309200550.3878088-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


