Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD5310EE9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:42:27 +0100 (CET)
Received: from localhost ([::1]:37172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l857i-0005Zy-DJ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:42:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Td-0006m0-G1
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-000439-OP
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:01 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so8485577wry.2
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RMlSEt6PiH0qMk4plcisXlg9m+5b90Bk6CfkYCOT5n0=;
 b=vbfFqhNMDID3Tq4WnXtj/B2iEi46MaVQecWXaH7uv2XJgxqARyIf5WxSSqr0B7ztvN
 5RrNU0VUzhQoONZoL1y/nlsbqoa6wk2WPggrN3M54QuThfzix8HxJK+0WkVRFIOqqVWS
 rgqT0ajJASPdK38jXZyCgGB0NIdycmNQ0IFV6vz8SKl13Uq2wtC4W/dq9aJGUpkCJTWd
 JaNmGSX30keRBld/wiL5BRKlCndatLB7U/BVtT6ac7EALdMrvf5rsP7cZ+YTi78JhbGD
 w3v3tjo1r84jOn0IWYNhzffncSoqfFrJAJIorGwUCk/bREBPwClANSjaxYnPf8yv9lTF
 OgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RMlSEt6PiH0qMk4plcisXlg9m+5b90Bk6CfkYCOT5n0=;
 b=KxWJE1z0oO3bpXzqeqqBEpmptzUuNl3RjYPKbtpLUmcm84PUOI6rQNoLL240CTPGFu
 N4WLwgd32e+MDtyjTepOC37pOd669pjxF+QpJWpvuGc8RYii6rqtVHk8h0qbRvKNFIkE
 w0oSLxyO8jRc9yv82HUXLjNfo+EuuSS/W0OsvMOnutMJC4ceRwmwo3ineJCsz+1Vx9aD
 O36STaQEuXx9ymCblbPBqvzasQ44f/ffPt17jfIf8/oMQC2OVdLDVg8u2LNic7aGKgGU
 7wfwH3NpvMef8uf+DwGW3TAxqn57JoJVtH8UthzTQeptNgV03SdsiiN7XojGofV/C8jt
 QATQ==
X-Gm-Message-State: AOAM530ElhbHOhk5qY9e09rj2k4ci4gdcxK9+BKLhrT1wLxDXTeEMWbp
 JgWEA493apQLdVwfNl286N4v876Xm4j4DA==
X-Google-Smtp-Source: ABdhPJyTBeVt0JOPV+n4JwGZLwSJArPUngUMEK/PxchKlLXawU2q7EpDp8NEJ/VqfZBRZFWs95PiXg==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr6334526wrt.338.1612544427436; 
 Fri, 05 Feb 2021 09:00:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/24] hw/arm/mps2-tz: Make FPGAIO switch and LED config
 per-board
Date: Fri,  5 Feb 2021 17:00:02 +0000
Message-Id: <20210205170019.25319-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
---
 hw/arm/mps2-tz.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 9add1453cc2..94618ae54d2 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -79,6 +79,8 @@ struct MPS2TZMachineClass {
     uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
     uint32_t len_oscclk;
     const uint32_t *oscclk;
+    uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
+    bool fpgaio_switches; /* Does FPGAIO have SWITCH register? */
     const char *armsse_type;
 };
 
@@ -241,8 +243,11 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
                                  const char *name, hwaddr size)
 {
     MPS2FPGAIO *fpgaio = opaque;
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
     object_initialize_child(OBJECT(mms), "fpgaio", fpgaio, TYPE_MPS2_FPGAIO);
+    qdev_prop_set_uint32(DEVICE(fpgaio), "num-leds", mmc->fpgaio_num_leds);
+    qdev_prop_set_bit(DEVICE(fpgaio), "have-switches", mmc->fpgaio_switches);
     sysbus_realize(SYS_BUS_DEVICE(fpgaio), &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -687,6 +692,8 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->oscclk = an505_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
+    mmc->fpgaio_num_leds = 2;
+    mmc->fpgaio_switches = false;
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -705,6 +712,8 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
     mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
+    mmc->fpgaio_num_leds = 2;
+    mmc->fpgaio_switches = false;
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


