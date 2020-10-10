Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D6328A14C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 22:39:21 +0200 (CEST)
Received: from localhost ([::1]:48706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRLeC-0003Qf-1l
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 16:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLcD-0001yQ-R7; Sat, 10 Oct 2020 16:37:19 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRLcC-0006cg-C9; Sat, 10 Oct 2020 16:37:17 -0400
Received: by mail-wr1-x443.google.com with SMTP id n6so13848123wrm.13;
 Sat, 10 Oct 2020 13:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HRSGmrYnnb9+rYcfBphplSLFyvNnU1n2aTvVy4tkoQk=;
 b=AQPjHzCQ9eYQLNhcqsEpJp6x5aySMkiGwDEvehmpJnB419NuoXmOpNsHPHDiqavGZK
 rQze6IB4wNaa5T+hvXVQLhhxCXha75N738nulRJ68NuWzwdoTRo1ysPYBXZgI+pBMw6O
 l1NPVJ4+V7jVtrcvVbsmmXkYzFNvbNoubSyHYOK1GcO0ioxJeKEBsOm0ujQQsRUxAEs/
 Pesl9BCyVQxK5BNhccyrRyROfIgH4/KSlIN7qqLGlnOApPSfIeRYJFzvQs5N2YaYohYF
 6YMQRtbFks8magkICPJubgVLXPDc2ogtCRF1iz0k8FnCyY2pKsErMDuSWx+1tXLbXCwG
 i2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HRSGmrYnnb9+rYcfBphplSLFyvNnU1n2aTvVy4tkoQk=;
 b=KqJYuzLLDHjz7Z0uV5fctkCk9qh9fcEoghHr3AalsfagpFszA99lgIWyDmlmrcSGm6
 HiHoZBI2He7GZJnHZOdtSBuip949Ip4qgpKfVGWqqFXpy/MuRjA6uGlsQeLztQJpV2sJ
 92dE7dwrSfe3+l2vy4RkqpL9Z6fNuHUE598yqAWOx6jsQzCXDiP4W72ocyTkqLMOyQUN
 /WtKbpQFCZ1yxIuptVc4N+edU5dT1FofXcSf5upMfWfu1R4dgzQ9T3IM+31kzmOa6ZX/
 C7VZUmjZwFZxNCNq8+QWTDXqQCUyOUVnJ6ssJQtei1+J9gGLRSjABKtlVfmiLTlpxmkc
 EqAQ==
X-Gm-Message-State: AOAM5303Sekj06MJpkrvRrZnSTk+77roEiEnhWcCn7d9V99+F2dINDPX
 d/ugL3jMoNHB7NfpYrbzLmreJEefTJw=
X-Google-Smtp-Source: ABdhPJxaOS1cD0Ioe79XsULoiz9TChDxZxZhKjs5684x2JYTmcT8xzlNcRTbYQih+v+gWfB1kqDrhA==
X-Received: by 2002:adf:f548:: with SMTP id j8mr22324272wrp.114.1602362233277; 
 Sat, 10 Oct 2020 13:37:13 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id v17sm5661341wru.44.2020.10.10.13.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2020 13:37:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT
 definition
Date: Sat, 10 Oct 2020 22:37:06 +0200
Message-Id: <20201010203709.3116542-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201010203709.3116542-1-f4bug@amsat.org>
References: <20201010203709.3116542-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the BCM2835_SYSTIMER_COUNT definition instead of the
magic '4' value.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/bcm2835_systmr.h | 4 +++-
 hw/timer/bcm2835_systmr.c         | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index 7ce8f6ef4d8..43df7ee488c 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -16,6 +16,8 @@
 #define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
 OBJECT_DECLARE_SIMPLE_TYPE(BCM2835SystemTimerState, BCM2835_SYSTIMER)
 
+#define BCM2835_SYSTIMER_COUNT 4
+
 struct BCM2835SystemTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -26,7 +28,7 @@ struct BCM2835SystemTimerState {
 
     struct {
         uint32_t status;
-        uint32_t compare[4];
+        uint32_t compare[BCM2835_SYSTIMER_COUNT];
     } reg;
 };
 
diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
index 3387a6214a2..ff8c5536610 100644
--- a/hw/timer/bcm2835_systmr.c
+++ b/hw/timer/bcm2835_systmr.c
@@ -134,7 +134,8 @@ static const VMStateDescription bcm2835_systmr_vmstate = {
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(reg.status, BCM2835SystemTimerState),
-        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState, 4),
+        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState,
+                             BCM2835_SYSTIMER_COUNT),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2


