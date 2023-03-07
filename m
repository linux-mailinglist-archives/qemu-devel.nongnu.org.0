Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74F96AFAC0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:50:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh3h-0006aE-D3; Tue, 07 Mar 2023 18:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh3T-0005iF-Ar
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:49:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh3R-0002zt-Qm
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:49:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id p16so8812174wmq.5
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0Gy8m0zmWanKLNg2VIR8nQ763VWzHqeUnDf/g3Wq6E=;
 b=vuJNZ/X+9ojDW1SIMtn46t1c6WH2DNyBAUD9PRXM7JxBq3m0+BwP0X5l0wQUWxzWiM
 CqxtYJsNUyLzmi8N3UFPIARnsBLclzAydq+9RsIx7Abv98FXKlXeQj4SR2siSErVI0iI
 bJfKJKjpH8xqaV56wmEEK+pk7H9iQ+j0BJ3ozXaXTiSOh/u69XIKoJTA2T/RR8L5ObZU
 dEcNkjU1Fj0mdJkqeFQQPxtW4wB6qamNXCa5vUo8tNeoiWYcbE1TMXLIUgoUAwt8Lvrh
 mp57DT2ekTmqxAkJH+8+5nbKzyfNjQmwenrlE+p7Q2bW7+9UFpb8aplzT5TlXqVxciWP
 biYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0Gy8m0zmWanKLNg2VIR8nQ763VWzHqeUnDf/g3Wq6E=;
 b=KuxJFfnWxKQ773NWzQcaR2kJHtg4CxvFpFZ5/HjuQIiYTLrfOaLTnbJfmNa8OCRiM/
 GAfs35F+za48rPAerxQzptW4yN1mtjpsgHFRF/KqGef7MQOIGNjP/esjSNNxpHqRAy0y
 OSifBJusGTIR06WrjkU/DY1681wQ3cCoPv/5EuYvPpN/I2HQmhRxo+YcfO/moHvGXTZJ
 ToYKnJttVqtwHFp2Bxjr2n0cE+pQjw9PEQ/Fhge7022hCLQF+LXkoEejF+cOwd911UF2
 6P/CZpWO/h+O6agBcZc4Q6s57pr79qP4gC6Q1UKdGLac+xZTKRGR/9sWvpMkAnJMPWiT
 tXZg==
X-Gm-Message-State: AO0yUKXm0lsO+k6UPOp+YqX3j2lltJrDO0TBhAsVjabTBgOdM5JPD7Yd
 TwPIqidQ3+Rkc69HGKXkD2V81TUvWAtzprYzh3k=
X-Google-Smtp-Source: AK7set+QspUI4ObReOZirHw1ZLkfU/EqeEZRwbncv13zWZUj523L1Iopd8RG6TJ7ZA1slXJoTNUz2g==
X-Received: by 2002:a05:600c:3502:b0:3e1:e149:b67b with SMTP id
 h2-20020a05600c350200b003e1e149b67bmr14360113wmq.18.1678232952221; 
 Tue, 07 Mar 2023 15:49:12 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 bg17-20020a05600c3c9100b003eb5a531232sm2986669wmb.38.2023.03.07.15.49.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:49:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 20/20] log: Remove unneeded new line
Date: Wed,  8 Mar 2023 00:47:11 +0100
Message-Id: <20230307234711.55375-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: BALATON Zoltan <balaton@eik.bme.hu>

The help text of the -d plugin option has a new line at the end which
is not needed as one is added automatically. Fixing it removes the
unexpected empty line in -d help output.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230119214033.600FB74645F@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 util/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/log.c b/util/log.c
index 7837ff9917..53b4f6c58e 100644
--- a/util/log.c
+++ b/util/log.c
@@ -489,7 +489,7 @@ const QEMULogItem qemu_log_items[] = {
       "do not chain compiled TBs so that \"exec\" and \"cpu\" show\n"
       "complete traces" },
 #ifdef CONFIG_PLUGIN
-    { CPU_LOG_PLUGIN, "plugin", "output from TCG plugins\n"},
+    { CPU_LOG_PLUGIN, "plugin", "output from TCG plugins"},
 #endif
     { LOG_STRACE, "strace",
       "log every user-mode syscall, its input, and its result" },
-- 
2.38.1


