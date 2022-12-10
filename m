Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558C648F8B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42CP-0003Vl-QV; Sat, 10 Dec 2022 10:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CF-0003Q2-GJ
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:27 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CC-0004MY-2f
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:26 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so1889565wmh.0
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPsrEY4rtblWI0rx96iiEsOKP/PxGkNW2C7Zi9iNKyM=;
 b=cvgb+jTT3FrxLB3+OhGSyWxqMuJeO8bIlY/Mlnfo+ZjoS6zhlYyAuJlOpY6OuygkaS
 lSQ0S+rbIpZnog5gc4WcfKELUwiM0Ze891IYhl53KMmNZhNYnUoBBdzGQtzdVXJzQWjn
 5OZ7xvkLJfZLwt3jk5cgOjJ8wqyep6kPnf4HfpLmmNBM68OQclmi28KimfpWQIVdblUn
 VjL/VEwxlCnKUwmQ9bn5Eb3XAwQVPtkA25J2mKDixfc6KuN/Ytv2b5mUbyDJZIuqbTt7
 GpUvgG0ZdgxiISog3K7+Dj3MIvxpRD1OMNVQjFMugVh7Tu72mr7DLfur5DHa1BTEZvYt
 aGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPsrEY4rtblWI0rx96iiEsOKP/PxGkNW2C7Zi9iNKyM=;
 b=l73AL2M9W7E6Esk1ts4ZZ+6DiPZ1qVlM84d+fFYRnI+w/mnBNDdpRR2WkteqFR2Lr0
 XNLw8WZr+I3CAHz8Ea+YTt3H2UhCHpL8hD7XO62dSS19ikR7xgvrSd8v24IEorctfHJu
 0kpv2SKz6uqEOJ8ienvBrXBf8GaYdWTjxaxpcBlBJ3Ibql8ShVt356wA09QesLnCX79S
 T3nRkNH8Jr4xdeRTPNQYiWhN4LVx5sQTT93H+Sup7kwBBatJ7pYC04+TmoFZfFnRy+QD
 FSPouQAmp7DS5lOFXfpkWy3ow+6Jf3dYT9GCMConCToqxdTkXe9QGlvSRGZ5AQ2SvwnM
 vymQ==
X-Gm-Message-State: ANoB5plj3+/4OteOtk+dlYfJKn0L1lOaeFiLERfqYB9o+KzlVOe7RsN7
 ecxgMYA2S7K7LRnN8xfdx7+m0rFn7LZWEmH3mHQ=
X-Google-Smtp-Source: AA0mqf7G5VNuJde/fiFLjg1YX6rNtfLMR6Hxr5Krr8Fjs0lWXw6Ym5nzg2rJ4qAl+pN+1T5eMYypsg==
X-Received: by 2002:a05:600c:a10:b0:3cf:ca4c:1e29 with SMTP id
 z16-20020a05600c0a1000b003cfca4c1e29mr7709916wmp.41.1670687722384; 
 Sat, 10 Dec 2022 07:55:22 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003c6bd91caa5sm3260782wmb.17.2022.12.10.07.55.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 3/7] hw/mips/bootloader: Implement nanoMIPS NOP opcode
Date: Sat, 10 Dec 2022 16:54:58 +0100
Message-Id: <20221210155502.74609-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210155502.74609-1-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/bootloader.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 3a4573118c..7f7d938f2e 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -59,7 +59,11 @@ static void bl_gen_nop(void **ptr)
 {
     uint32_t *p = (uint32_t *)*ptr;
 
-    stl_p(p, 0);
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        stl_p(p, 0x8000c000);
+    } else {
+        stl_p(p, 0);
+    }
     p++;
     *ptr = p;
 }
-- 
2.38.1


