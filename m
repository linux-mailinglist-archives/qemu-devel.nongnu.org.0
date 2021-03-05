Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A190032F289
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:29:47 +0100 (CET)
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFCs-0000IO-Iz
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3q-0007PP-Ui
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:32 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3H-0007hy-79
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:21 -0500
Received: by mail-wm1-x32b.google.com with SMTP id m1so2110990wml.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+ePC5MrRsVUEVhaE0qNz69qfHz3Jx96PkbzZ+pkdYA8=;
 b=zovA1/vN/PSyzFDhK2x8LY/G44r5Og4vHdvdVbINlCnRilFZ1QSFtKh8og9qEHb7tA
 EefnufftoL1M5qNxsCs/WTdGsc1ZUs5jfZlt890X51TkSIe2nEUTvISL7k6xaaRYx6j7
 oM8VYazl66iLn/1eD9XQgpaHT1aGlHr/PWEizdX1ZBjxT8DWoQHWwQk3uUhfGTh8jb+J
 ZzozdsYj4QN6nobS+6QN+5atir549vTb4NRLero2NbDoedNl4uFVvkJ10xvifKWtNhU1
 7YJ4Oe4EdvejnimMwkRfeu0V/C85QD6gHBkg08vBfr9Q1v1Y4/fvFXXcvmdCrVePSmHe
 06GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ePC5MrRsVUEVhaE0qNz69qfHz3Jx96PkbzZ+pkdYA8=;
 b=IsrLNS7y1ZIIHZ9IgpEgi6pbffH5bTZW+TAg1qvCIVilz3fYXFBKc1G9xvmcwOB4+k
 jwOAxWNl8pzr4kk/gOKwzo7wAxC1olTNZCtudvpgT8ie5vvaLVZ8gDpen3aWKNvMdo2w
 emlMQ2q69XJBQ5Hf5d9TnhysGkaoncCNifyQ4ATJQrkqFaY9U8HL8ub9walKpNkmZ5oE
 8CLdZyARwUPTCEIKMKKmQYDxSrN/WaXzdgL4kqIL6w1PyDfgDtFiNUW87SgDPOTbi90z
 tUixB71Gh4gd1qd9e76kSx3j5fVAcVzmzRmsEJ2dPRx3PQrTyj39yjH8IitP0P97sgqX
 7rVg==
X-Gm-Message-State: AOAM532KdaiQCslCsLjM1DDN42hBwpE2ekCkBfNrDU6DmOpjue2bABH5
 1dH535YE58ubLafwXe/DrosMc5Fe6WI0vQ==
X-Google-Smtp-Source: ABdhPJzKQc4xWBUsmj447nJUrPTtXEE9YkvZWavXEK9jrILmL/XL01CQ0hzMPWhQkDZiCtdp5TcMjg==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr9646614wmh.131.1614964545240; 
 Fri, 05 Mar 2021 09:15:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/49] hw/arm/mps2-tz: Allow boards to have different PPCInfo
 data
Date: Fri,  5 Mar 2021 17:15:06 +0000
Message-Id: <20210305171515.1038-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The AN505 and AN521 have the same device layout, but the AN524 is
somewhat different.  Allow for more than one PPCInfo array, which can
be selected based on the board type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-16-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 1c1fc34dd53..d20b2068868 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -423,6 +423,8 @@ static void mps2tz_common_init(MachineState *machine)
     MemoryRegion *system_memory = get_system_memory();
     DeviceState *iotkitdev;
     DeviceState *dev_splitter;
+    const PPCInfo *ppcs;
+    int num_ppcs;
     int i;
 
     if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
@@ -544,7 +546,7 @@ static void mps2tz_common_init(MachineState *machine)
      *  + wire up the PPC's control lines to the IoTKit object
      */
 
-    const PPCInfo ppcs[] = { {
+    const PPCInfo an505_ppcs[] = { {
             .name = "apb_ppcexp0",
             .ports = {
                 { "ssram-0", make_mpc, &mms->ssram_mpc[0], 0x58007000, 0x1000 },
@@ -598,7 +600,17 @@ static void mps2tz_common_init(MachineState *machine)
         },
     };
 
-    for (i = 0; i < ARRAY_SIZE(ppcs); i++) {
+    switch (mmc->fpga_type) {
+    case FPGA_AN505:
+    case FPGA_AN521:
+        ppcs = an505_ppcs;
+        num_ppcs = ARRAY_SIZE(an505_ppcs);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    for (i = 0; i < num_ppcs; i++) {
         const PPCInfo *ppcinfo = &ppcs[i];
         TZPPC *ppc = &mms->ppc[i];
         DeviceState *ppcdev;
-- 
2.20.1


