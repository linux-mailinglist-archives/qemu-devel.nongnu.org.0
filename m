Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E694E8142
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:00:00 +0100 (CET)
Received: from localhost ([::1]:44530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6xT-0002aW-7D
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:59:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qw-0007VS-Fe
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:24 -0400
Received: from [2607:f8b0:4864:20::22d] (port=36803
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qt-0005VE-0b
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:22 -0400
Received: by mail-oi1-x22d.google.com with SMTP id z8so11090882oix.3
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KChjyOMgpewWdFnPU3AHhb0wY0pkdi2s50pAiOY+Ng8=;
 b=HHH80PaAu3a6VUCSwDDLdmgo42fE5cIr7+YVCinZmBjrGUnOJq6A1KkI2zXZaRshTR
 QpkNbAx+01RauFbeL9Cx/7buc9S7BHxPgJZs4YBJjanz84ci/65XBXArDdHBY5N9egD7
 pAZOKFBjpsflIa20pOhiXe18prOWj5tXfTQ2nZ9zGmJuSQFw94ZQaYZ0UDjAYe4rMNwd
 PvrQCtjgAoK8dgwGcDoJ0YItOGak/Xf/+HBPnZGVlVItMCq4PTQUcNoT2yYv7sSJkyfI
 f1FUKTDnHVkjAD8xfqllRsX3dtvSmAyBvI/WEE7Gt7PqvwX/ilQCBH7s85OlPStl5PLB
 51XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KChjyOMgpewWdFnPU3AHhb0wY0pkdi2s50pAiOY+Ng8=;
 b=7iFIeQtdWgWNPqNeDH1sMCSmAS2PMisSn7eLSvvYAtp1YFgSpbM8xRXts/on9TG3Tb
 oRAp/5j98jI4S36543VS5tF4SGmYA+9+6SNJJ8NRPD2ULSGF8TijaosA7wzYI6ml5Iuz
 YAGi5/OSbHsIFAG5bSSpJ7PI/Sub/SpX0ukJT4dwgQJW3RejH7w1UyG/ogwxkgkP2bep
 kqCN250eZT9j5o0FZvbpg5YHv+JQITbz1lh01DQtGWFIT6tCIfvICmORXowRva3+1D3U
 YEyZ6wgrCqrSe9UBcbCkShJZkwYMYhxPmCynl04RIusnAiu3bJy66Cv50if/Mkq8YRkN
 4DCQ==
X-Gm-Message-State: AOAM531VCuPTFy4Hn28F9m43mejw6xBZS4sC0dsSpAIkc25XTaV5WZs2
 HtozD0L8BqP+zOVixfmjAkPJ/gI7w6XK5NsU
X-Google-Smtp-Source: ABdhPJyUQplKUtGJBAE/ibRLhEiJ4QfQMZvMINLA2SnIptEn2yAg1heHC1rwVjM2T9nLO3B7XLj2cA==
X-Received: by 2002:aca:ad15:0:b0:2da:692e:fe97 with SMTP id
 w21-20020acaad15000000b002da692efe97mr12464292oie.26.1648301174616; 
 Sat, 26 Mar 2022 06:26:14 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/39] target/nios2: Remove log_cpu_state from reset
Date: Sat, 26 Mar 2022 07:25:10 -0600
Message-Id: <20220326132534.543738-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is redundant with the logging done in cpu_common_reset.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 6975ae4bdb..b0877cb39e 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -46,11 +46,6 @@ static void nios2_cpu_reset(DeviceState *dev)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(cpu);
     CPUNios2State *env = &cpu->env;
 
-    if (qemu_loglevel_mask(CPU_LOG_RESET)) {
-        qemu_log("CPU Reset (CPU %d)\n", cs->cpu_index);
-        log_cpu_state(cs, 0);
-    }
-
     ncc->parent_reset(dev);
 
     memset(env->regs, 0, sizeof(uint32_t) * NUM_CORE_REGS);
-- 
2.25.1


