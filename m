Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8883FD876
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:11:04 +0200 (CEST)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLO91-00042Q-9H
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:11:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcW-0007Ci-G8
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcO-0005ur-9r
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:27 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1564472wmi.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wWVJBXgzRhaVQ69jIiCGvMtiBVCp4jd/hsLtG4YGx/E=;
 b=rMYUJ461OP7Y+AcLpJcQ07ECw4eJf7zKEsycfmRC0e1WS8xgwlKSTP2qKvqFltPUtp
 Q9F3P/f4AtTsU9echBMCQlYLA81XjZFrFW2hVtHr7fxKjHuBt61AhWGaRtGiSittHXMz
 90nGzCfXKqZLUOMlHCZ2Fzdn3ZDjw1BFJQ0p/p8E5pAKp9pLC9VKlDIHcJNdTTccUVGL
 ZC4Z1WowDCckwlFe0cDGKvahnlwEPjebLpiTuw2aysQynmZDHJ/GSqQOZQ8F+z4//tdh
 71IajVE0mF9Jt3oQSV0pDvphydmUzLDSKwSm9Sd0ykD42f/LAThkdS8TGhV2RmJN6VJ9
 RRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wWVJBXgzRhaVQ69jIiCGvMtiBVCp4jd/hsLtG4YGx/E=;
 b=FvjrWNzkJE4P7NQDlb6gVkScZa/mPfwI4e65QeHr79Ub+GqJM2RsyVhloxfruGD/8X
 vXXPPwqGYTUomRHFuZbEID6G4t/siWFxPMrkiq0/3dFo8PX+hxohODNBL9ZxozBDEsH4
 INt9XtPMXwSPfWPUcAa4KwozChU00sv2rw9H7NQ431P1FI9FNXeYn/rX3h8Rdg9mOxyD
 WuhNbA1lWDNhqe0FakNCqthmOAJ03Yqcnjhs7DwrW+/PsqvIJFtZEGfFXi29lGBsA97X
 OBGaPySQkrffBt1E0xolumwdJU0JF8fh77wY8FnItNd9ehAE6k1Gx6f9l+IDMOkmZ1o5
 g/mg==
X-Gm-Message-State: AOAM5309Kf5JYvKO1l6xnAgWB9PWjLKO3oX3EuADNAgrEUirjfngeLSZ
 ASvi9oYzn63hw0I+eqiLXX4GX2X7LNkBBw==
X-Google-Smtp-Source: ABdhPJxdP7v2SCW37/ygPU+bMfYKXbX/D3vmk7A13BLcm7NZ9W42NcQRHApRq9Dx8Ac67gI3vTm0vw==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr8822616wme.90.1630492638571; 
 Wed, 01 Sep 2021 03:37:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/51] hw/arm/mps2.c: Connect up armv7m clocks
Date: Wed,  1 Sep 2021 11:36:36 +0100
Message-Id: <20210901103653.13435-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Connect up the armv7m clocks on the mps2-an385/386/500/511.

Connect up the armv7m object's clocks on the MPS boards defined in
mps2.c.  The documentation for these FPGA images doesn't specify what
systick reference clock is used (if any), so for the moment we
provide a 1MHz refclock, which will result in no behavioural change
from the current hardwired 1MHz clock implemented in
armv7m_systick.c:systick_scale().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-9-peter.maydell@linaro.org
---
 hw/arm/mps2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 81413b7133e..3671f49ad7b 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -86,6 +86,7 @@ struct MPS2MachineState {
     CMSDKAPBWatchdog watchdog;
     CMSDKAPBTimer timer[2];
     Clock *sysclk;
+    Clock *refclk;
 };
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -99,6 +100,15 @@ OBJECT_DECLARE_TYPE(MPS2MachineState, MPS2MachineClass, MPS2_MACHINE)
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 25000000
 
+/*
+ * The Application Notes don't say anything about how the
+ * systick reference clock is configured. (Quite possibly
+ * they don't have one at all.) This 1MHz clock matches the
+ * pre-existing behaviour that used to be hardcoded in the
+ * armv7m_systick implementation.
+ */
+#define REFCLK_FRQ (1 * 1000 * 1000)
+
 /* Initialize the auxiliary RAM region @mr and map it into
  * the memory map at @base.
  */
@@ -146,6 +156,9 @@ static void mps2_common_init(MachineState *machine)
     mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(mms->sysclk, SYSCLK_FRQ);
 
+    mms->refclk = clock_new(OBJECT(machine), "REFCLK");
+    clock_set_hz(mms->refclk, REFCLK_FRQ);
+
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -223,6 +236,8 @@ static void mps2_common_init(MachineState *machine)
     default:
         g_assert_not_reached();
     }
+    qdev_connect_clock_in(armv7m, "cpuclk", mms->sysclk);
+    qdev_connect_clock_in(armv7m, "refclk", mms->refclk);
     qdev_prop_set_string(armv7m, "cpu-type", machine->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&mms->armv7m), "memory",
-- 
2.20.1


