Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD7B5FA16B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:53:32 +0200 (CEST)
Received: from localhost ([::1]:37392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohv5u-0006KB-KP
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ohule-0007Ro-Gt
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:32:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ohulc-0007k7-WC
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:32:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a3so17642094wrt.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4752IJONL5xSCJN2+/Gu2cMcuMZkY4mGQ6IaZ7UWEw8=;
 b=VgZNIeqqgkG4+eHqHIQmofDjcSOpwB7ktfjSh+jypOX8mk1D/YJ2g9XQ9FqLyK2zrv
 jmw9PyLB3xIcYGSyeSaWqZO6hMo/5v/LYhVGO825iGfqCTYWzSnfLC8gTj4o6OIRr7ty
 W9vVgS3N43BlumgOo8T2Nfk910YL9fFm2yq6HV8AD4aogzMy6h5Ufm3tnc6AJAS8TcRm
 UdKqwf7VYZ6JVznGiGJlpo8MkySws142RyySHJsNk61p3SSg65BwOPl8MnYMRgMgOT9e
 BZj0h1wuYZNMnxblInDOukjCWr0TDcW5RwjSIRvQmERLZbYPkiX88AkQrX10TDNmZHnC
 35ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4752IJONL5xSCJN2+/Gu2cMcuMZkY4mGQ6IaZ7UWEw8=;
 b=W86TeYNu4SPeeSWKjzx5CJ6I7AFv7oO//GQ9EgIi/S+XvSwrmKXyh5MKR+sZmHAi23
 WgCg5CrSpfVVSlXseJKYZ5eM2QNDtxX0LJFOU87e01Qp8UZmjunQKX/qtysfDslMMbMp
 yxPKiWI4Ii99/Ui8BlBxfNGIC3L1PPzfYtRbOHZdsdHRaroGPZZ+p56o+kmZGVysF6V9
 isJZHXfCploZkpJ3+ReVW8iWsizWA7vqpNNz3ZIsuIMGPLCt9RshRizRgou6dTgm70Xa
 DIhqxOR+lgZYI8XucMd3SOek/SjcPBJZyhghJOSba5kfRxDSrsr4Fm6DrZuNeP3iluhm
 YEWw==
X-Gm-Message-State: ACrzQf3ueRfLB+IBWhFzBI+5gzirMyAMCqVfpFsVQAsOco3MIcPAHXIh
 SSuQNdgL0755xnnvjVC7WGoVxw==
X-Google-Smtp-Source: AMsMyM63OTinc8Oyc2jy+sviU3bt4cFwmSadMlSOWhKkAJq/X59bSt11rZke6vTXMYqvuiHVRf919A==
X-Received: by 2002:adf:ea08:0:b0:22e:46e9:2a8a with SMTP id
 q8-20020adfea08000000b0022e46e92a8amr12409212wrm.636.1665415951272; 
 Mon, 10 Oct 2022 08:32:31 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ck15-20020a5d5e8f000000b0022afe4fb459sm9399509wrb.51.2022.10.10.08.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 08:32:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF37A1FFB7;
 Mon, 10 Oct 2022 16:32:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Arnd Bergmann <arnd@linaro.org>, Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] target/arm: update the cortex-a15 MIDR to latest rev
Date: Mon, 10 Oct 2022 16:32:25 +0100
Message-Id: <20221010153225.506394-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU doesn't model micro-architectural details which includes most
chip errata. The ARM_ERRATA_798181 work around in the Linux
kernel (see erratum_a15_798181_init) currently detects QEMU's
cortex-a15 as broken and triggers additional expensive TLB flushes as
a result.

Change the MIDR to report what the latest silicon would (r4p0). We
explicitly set the IMPDEF revidr bits to 0 because we don't need to
set anything other than the silicon revision to indicate these flushes
are not needed. This cuts about 5s from my Debian kernel boot with the
latest 6.0rc1 kernel (29s->24s).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Arnd Bergmann <arnd@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Message-Id: <20220906172257.2776521-1-alex.bennee@linaro.org>

---
v2
  - set revdir=0 instead of 0x200, update commit message
---
 target/arm/cpu_tcg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 98b5ba2160..60ff539fa1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -592,7 +592,9 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
+    /* r4p0 cpu, not requiring expensive tlb flush errata */
+    cpu->midr = 0x414fc0f0;
+    cpu->revidr = 0x0;
     cpu->reset_fpsid = 0x410430f0;
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x11111111;
-- 
2.34.1


