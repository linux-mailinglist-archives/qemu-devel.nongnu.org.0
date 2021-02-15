Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE531B8B9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:08:07 +0100 (CET)
Received: from localhost ([::1]:48752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcfe-0000sx-Ex
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQm-0008HJ-DQ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:44 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQk-00047s-TU
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id x4so9061647wmi.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mn7Me6K3TMP27APgbQca833jRzvfQ06ASXws5mXDtM8=;
 b=WyVCAR8ecScqsmMGiwfNYiOumxkC4CgzOB8y+dwap4B/2EYXyvkO2Q0crANWuMuWHl
 S7AyxohBdLMq6uKROhWeFqRSjn0+U2nR5jLNfLEW8PFdDgQQksdUWQj428TZixroiThM
 jFZRQYMtn0IYVLFw99pVLB+TJnupkWk1tdeSlbwc9zLEMlRfTb3T7F2hjB9PT7syBSbE
 0s25InGYqyXSVVftaIa27P53HcZ9w49hb0tnVigazAwpjPdUT4nv9QCz1W4IYDgWyLWf
 kOK2RqkncMf/ccMS7Jv84HZP2Pc8A0y8y4Z8bmGp9aanNdcpyPkH3f+Bc0tIbeURu6Hb
 rdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mn7Me6K3TMP27APgbQca833jRzvfQ06ASXws5mXDtM8=;
 b=gM8bS6asQmi9UOO3vebnTKWqSwhidXo314YR3ovHJ9A+z9Zd1h6H/ADcucXouBofFW
 Fo9s8H0x77QQGfSUzZ5FZC1NrkM6X0sfFnsjUdfafaixdH/c51nL1Q85Z3+jneKOMelu
 BfJahU4yr3FUP7v7Zfm/vz9xxijDH5IIo+djtMyRgP07NHrG/iy4YSNPp87FsqBtI9qj
 GJxIk6EDhK6XqVyoOMRlThfaM2JNQRnvur7rag8np1Pj710ywSTvEcxe0EhGfLyor8kx
 y7YGGH6/rLU574TGoBRbk5Lo+yhwYwjS0qZ9TcKxxwO9jErC2TDSu6F0UmVjOriA7byv
 FKmw==
X-Gm-Message-State: AOAM531d4CC/X/tRpQzQXoQgMKa5Ck9eBiyZ+DzijmIpIx21O3QQ2Xmi
 z3wEUfxuMNenHV0lPlyqJ26TUQ==
X-Google-Smtp-Source: ABdhPJz9+BXOne7oQGV/Dfdu5woogGLeqWuWV8q431IINfGVJ8gCdVAankiqS+BmeYALfbPh1mcebw==
X-Received: by 2002:a1c:107:: with SMTP id 7mr13885028wmb.28.1613389961694;
 Mon, 15 Feb 2021 03:52:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/24] hw/arm/mps2-tz: Allow boards to have different
 PPCInfo data
Date: Mon, 15 Feb 2021 11:51:29 +0000
Message-Id: <20210215115138.20465-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index f1a9c5f65a5..a79966a7187 100644
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


