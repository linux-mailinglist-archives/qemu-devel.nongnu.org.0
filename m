Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2F6E8F58
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:08:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAL-0000kl-Kz; Thu, 20 Apr 2023 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA8-0000Yw-NG
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:13 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA3-0003r3-Cv
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:12 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso3699425e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985105; x=1684577105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gk+qtdkGjNiXdrXuOW9NlMvlVmOSEkalFiEAMg6KIvw=;
 b=kC3QU6Thgwo5+hIwmZtFxIQ4SFfW49ICeguvPbYSmbnpVtqV1ynIQXTDrAptejiWAs
 kQAGR4W74GIOyFXTE2Wuqq7uH6dE5ZH/Vji/I8fvywRn3evEMGDEUGUxyiXeGWIpkdZ8
 5pjJfKXsxTNfJO/Zy7cTkrVAUzw3H7rMHojnd7hqh5nbi6lEMIsU2oqdOOHnO+kD9UYB
 XAsIljjrPXJ/Ma6xWoK8cPCcmgGCj9Sd1+I7BYc61gmURpiIHW8EQJo3fpCoxgy1pnmL
 vGY6YAVFGAGltn+B58LY8nHd8LsAjsqSsF0ls+I5EDvYKRTbk3DYEsQD35m2uuh1BUtC
 E05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985105; x=1684577105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gk+qtdkGjNiXdrXuOW9NlMvlVmOSEkalFiEAMg6KIvw=;
 b=TuU+XtOFa8ekUJ+MaxHF217KF1Ta6MtVhC5ejeYa6O83RReS5E9i6YFR/tx+bugaiu
 H8PaKJ6ZPeHiAxrEoLDBs59unojSXZmSCQIYvih7PpkEGXLDSxtxW1yfZA1Pt9YtoTqH
 aHfRR9bEyLsGp1YO9okMHP/39V/r+LUDksOH1T+8wIF5TxcWRCY/w0f/C7OtiGIgBZPq
 UYS8TFy0bVEk0BsUgmW3ZrKlmhA4FF0obSFX5GozTZBkMGM99I1pxdIzUHyavyc8KiRY
 uwmlNiOi+Of1f4XxoMeGdl4k+ThoLynZnRm0nu0ua6CW5UFGGYSTIoRFowr+Jkwwk4AJ
 ebVQ==
X-Gm-Message-State: AAQBX9fNB/3NiLxH5L52fEgzIL1AHAIJe9PwOh4iIVNdls1guws+SuDK
 rcwROk7yUsI0NK4DR+DCc+s+rBcxIopf5kjgwNE=
X-Google-Smtp-Source: AKy350ZyJ6kgu4G40s9kB/9yF+cZ0I3HeNFrbJR4x4FVTmLxhMS0K6ig7yAaS0IhkXCf4aGCED/elg==
X-Received: by 2002:adf:ef51:0:b0:2f6:b273:a2fa with SMTP id
 c17-20020adfef51000000b002f6b273a2famr865486wrp.34.1681985105289; 
 Thu, 20 Apr 2023 03:05:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] hw/arm/virt: Restrict Cortex-A7 check to TCG
Date: Thu, 20 Apr 2023 11:04:45 +0100
Message-Id: <20230420100456.944969-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The Cortex-A7 core is only available when TCG is enabled (see
commit 80485d88f9 "target/arm: Restrict v7A TCG cpus to TCG accel").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230405100848.76145-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4983f5fc93a..bdf3d76cc43 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,7 +204,9 @@ static const int a15irqmap[] = {
 };
 
 static const char *valid_cpus[] = {
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
+#endif
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
-- 
2.34.1


