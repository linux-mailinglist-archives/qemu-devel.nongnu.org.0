Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B6F32F203
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:59:16 +0100 (CET)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEjL-0001QW-HT
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3T-00079g-Rk
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3B-0007fb-JC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:59 -0500
Received: by mail-wm1-x331.google.com with SMTP id m1so2110731wml.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iowJEKOBN33+1rcKLKFC1h8QoZFtmtNQLiGPglcUyOY=;
 b=cfGCq1PSLd+WDf34fUrWSQbw/iX9HtcZENWC/U0/Cqku4geXhT6p2mbBFm8icb7Y3N
 dWUY374hW03aaw6jN9ZKathCegRQXTn6ha1nAGRF5irz0jgojuWSlGwhfSPzufvg3jfP
 H4IiuaYRijuWkIjh6Z67dOwz7rXwp1x/jPvOtYcoS3eORd9Iwx3trRE5JKxBzC5px4mN
 p61Nx/VMJsBY0dphNXbu6FEHPJZrFZfjvo+zUD5mxdmi42yeLd4B3dal7GRlbqeHdZea
 YbLAR6/IlGQ3pX9cJo4DwJKGKXD8nYDLHP5MWfy0rVy/cwzBp8rH7ipLyGTRz1UN3DwC
 170Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iowJEKOBN33+1rcKLKFC1h8QoZFtmtNQLiGPglcUyOY=;
 b=lwSN+WBvWYuaDJoAlblnq7OvEcmlmIvvq69W9B3u890cg4POH2+d2l+w9M89vWFziD
 iX3LACWCxHvGTpL0mCM4JLDSl8DXYtWJvSFu8xKfDlIV0vQx2eNJ2s81AtBnrN3oXXjH
 tPIlN2DqU37p1APQbOp61gkt9Nzfjv26sX/VhJT+Hgc8IIpPc+OkbWN3ldaZAQfta3Ab
 8153hjqcT3NfecF3oYmPMFkRbza9hjMAJBsVI8nniCfbc6KztsmWecXSJgTYaqtR+HWN
 mgwrvK/yq2CPbu4GAI7PkU/vVOtbvWMSeZSCzfofNNy65Ef+33+M4rIvEFdj59cERDM7
 JqYA==
X-Gm-Message-State: AOAM530TR0BAV1GOQCwXBPJ0ta5QmuMr466+G/0lMsDoFWniOBUxiuwy
 wphCPj7vmBCJy83QbpyGr/JJu4yf/DyRiA==
X-Google-Smtp-Source: ABdhPJzQchPOKPUgvEElAjZww+HRPf8Nm3zLY9N0sZ933MxorTU5kYOUPuuB7+bJeVmmne0chl8xmw==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr9823851wmc.103.1614964539909; 
 Fri, 05 Mar 2021 09:15:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/49] hw/arm/mps2-tz: Make FPGAIO switch and LED config
 per-board
Date: Fri,  5 Mar 2021 17:14:58 +0000
Message-Id: <20210305171515.1038-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set the FPGAIO num-leds and have-switches properties explicitly
per-board, rather than relying on the defaults.  The AN505 and AN521
both have the same settings as the default values, but the AN524 will
be different.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-8-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 0fce4f9395c..87a05d2c19d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -79,6 +79,8 @@ struct MPS2TZMachineClass {
     uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
     uint32_t len_oscclk;
     const uint32_t *oscclk;
+    uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
+    bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     const char *armsse_type;
 };
 
@@ -241,8 +243,11 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
                                  const char *name, hwaddr size)
 {
     MPS2FPGAIO *fpgaio = opaque;
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
     object_initialize_child(OBJECT(mms), "fpgaio", fpgaio, TYPE_MPS2_FPGAIO);
+    qdev_prop_set_uint32(DEVICE(fpgaio), "num-leds", mmc->fpgaio_num_leds);
+    qdev_prop_set_bit(DEVICE(fpgaio), "has-switches", mmc->fpgaio_has_switches);
     sysbus_realize(SYS_BUS_DEVICE(fpgaio), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -687,6 +692,8 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->oscclk = an505_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
+    mmc->fpgaio_num_leds = 2;
+    mmc->fpgaio_has_switches = false;
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -705,6 +712,8 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
+    mmc->fpgaio_num_leds = 2;
+    mmc->fpgaio_has_switches = false;
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


