Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB912310F22
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:53:31 +0100 (CET)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85IQ-0006su-RT
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tz-0007AH-Ry
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:23 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TZ-00047s-Kn
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q7so8392874wre.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VpEyWn0wqUXodQwTIXDgKgRTk0zKQyW4b0d+sVm3VCI=;
 b=BIWjCI6jjc9x3sWh6SqmHD9A8PEP7h0E2sRv2/o8FaPShO94KenudQn1oWedpfXuiM
 uS+57m9l++0oKZy2vc1bETlm2d5JJLSQKD5lbWzqVgKcWys/Y20kaayvFudBhYejesMi
 m1RBVzWcRINj6B0LDwpU0XNFMoVW/e0j4uUpb4VMb+jDwMEorzudgdZKA9uDjitWRTzm
 NaTLEEriRVT0Zep+K3aPv9hdiD+rV6U+XJVAExN0sdng3LyM/nIX/FLs7QTY70C4PmwS
 NIIWYfPGKHvKMvIxFD2conrnpQi+5pRwJgWXyu+J4cRxHG+i2zLjUpv9MG1yL1LHqKLv
 lHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VpEyWn0wqUXodQwTIXDgKgRTk0zKQyW4b0d+sVm3VCI=;
 b=o3ymgmDUrWMG0Q1qQ+/LZbL6ZGqIXM4WBMIX9tVvpOxnoIRp6wIKj7EWUfX39Hw8g+
 YnE7XCNQ1zqI81tLfxMWUzCSxeFfKNhA183jdFiOpMyjavI3rATjqa2nHTFCLkrj04N5
 /9MNhm2x5Oo1mhF/7pNwTfVo2iBEgeXykNCRJo5O9vkB378AbIMY1hBLuVnIKn3EksL/
 Rr07/yYPXjvnSlkYJfm81gDmHAnGV8sraUZ+TDsuhCNAE3Lj3QBliWo1xT8KUK6FQ20p
 gHJs5it4Q//hdqJ7hmrC9dxPuFiMusEaEQaGPJ20LT49EIRfsLRF0O3pGITDF0+Kr/2c
 Fw2Q==
X-Gm-Message-State: AOAM533KvlddLMCuvDII7UM2vsBoiOupSdpXQAWHIRzMnWmNmGoVIFlu
 yKYvzuRXAjkjW5tbZAUk6j5u+w==
X-Google-Smtp-Source: ABdhPJydTQuNg01KxrLG39GEjwVVBm5joB+EmSl+mlWuV/H0Amvtf8D8CZ8+E2vvxdmwLjjqZAHktg==
X-Received: by 2002:a5d:6712:: with SMTP id o18mr5863434wru.375.1612544433926; 
 Fri, 05 Feb 2021 09:00:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/24] hw/arm/mps2-tz: Allow boards to have different PPCInfo
 data
Date: Fri,  5 Feb 2021 17:00:10 +0000
Message-Id: <20210205170019.25319-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
---
We can't just put the arrays at file-scope and set up pointers
to them in the MPS2TZMachineClass struct, because the array
members include entries like "&mms->uart[0]" which is only valid
inside the mps2tz_common_init() function.
---
 hw/arm/mps2-tz.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 87993516816..721ac444920 100644
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


