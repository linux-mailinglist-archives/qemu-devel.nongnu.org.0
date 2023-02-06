Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A753568BCAD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0RZ-00082H-GC; Mon, 06 Feb 2023 07:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RO-0007of-TG
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:47 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RM-0005pv-0B
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:17:46 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h3so2332586wrp.10
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzCkZaPJCZSEraFSTj2+J2muivnIDDfC7A8FV2foZu4=;
 b=zMt8DT/yCGraGKiJNUu6Ja5sm1HGACvgwj4q3t32FCZA+gqQTv32PUp9cSYtWWrFEM
 YtRBh91QTzdcWPENJZRTo01TTNlHdjjOiwd56oxtzC1X04vZOKt4Xx56dycApS+PvmMB
 bbn/oHwp6RoTaNdLynV2R0Gm3EfPqzMsRZwhnnL4tX9LcOHCDk1RZaaqlVNCC7+T7Mt4
 MsR4Y/lCfigbqwLFGxcSPDvinl5Djzi1NRPTRKxS2Z0819HeF1y4qv67I0BWbORJlXF4
 Se36U6uu/EM8yXXeG53w2q1NfVrucl2qnfA+Z02Tw0XT3t5cl+v/weyr0yapVXHtDPTO
 4hrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzCkZaPJCZSEraFSTj2+J2muivnIDDfC7A8FV2foZu4=;
 b=fSruWVnWny9IUb395RLDsbL0qgt4EzxT6mVRRCZWkWKaGGAUf1YFX2xiILK4sGZfJA
 q39J/PQsh1y1o+hZMjFQ3HO0XorUp7/U2NnAsdM+F8TguPrvV0KiHbjiaq48dhw9ooIT
 TM+RNZBorh6KE7XKhbTV2JJHNoLx0lhgBRXKpKFcwSNDwPtIQa16VItwOjQsrA103Yj4
 WSGtDdnxlcDb7KM0cSKn5HGAhrEaSUvUbH80VwsfRRioT2zO9wb8TSO2T+ozEPUN06Ss
 eEMJfShol5LDSOXyxuDPCGVWJIh+DAmUsSuc4W7M9pQ8Hw4+QxzcZfvpfAYqWha1HxNF
 bLpg==
X-Gm-Message-State: AO0yUKUIjp+i6d/YXTlwkgPnWrVDKxp4GwOSvIVgC5nPOPWR02t1xFiV
 BYlReGmAJt5yVtgy9YsJay1mf3MBlRHa0sdO
X-Google-Smtp-Source: AK7set8KAKNjVLT6KXfOfR3qYmPU8/jC3NJwwYpYP5FTKb8TREMNKj2o5mjlqzG0uRm81Q9PazbOhw==
X-Received: by 2002:a05:6000:10c2:b0:2c3:dd96:d5f2 with SMTP id
 b2-20020a05600010c200b002c3dd96d5f2mr7598691wrx.35.1675685862491; 
 Mon, 06 Feb 2023 04:17:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfdb91000000b002bdd96d88b4sm8815797wri.75.2023.02.06.04.17.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/9] target/arm: Restrict CPUARMState::gicv3state to sysemu
Date: Mon,  6 Feb 2023 13:17:10 +0100
Message-Id: <20230206121714.85084-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 01d478e9ce..61681101a5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -772,10 +772,10 @@ typedef struct CPUArchState {
     int eabi;
 #else
     const struct arm_boot_info *boot_info;
-#endif
-    void *nvic;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+#endif
+    void *nvic;
 
 #ifdef TARGET_TAGGED_ADDRESSES
     /* Linux syscall tagged address support */
-- 
2.38.1


