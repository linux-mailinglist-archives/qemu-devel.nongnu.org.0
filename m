Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA532F286
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:29:28 +0100 (CET)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFCZ-00085N-MH
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:29:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE40-0007R5-Cr
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3M-0007jZ-FI
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id k66so2114618wmf.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aFknsSA98SRLzdL3tZ2HL5mJV7033TpNawxHLDY/8NA=;
 b=C+Z4WaR+3jK7zLp724X0Yqt6PFuE3wlIN4FzUEzM8GW+sa2ycbeG3Bb7GTOkL6ws9W
 7eODq7MQ0ggLQtDvHCXlu/4qLDnKETEA1SrWcrSTCXlLrP8nqfKrgsbenk4RnWiURurq
 22QtjV3S6W9AelSQa6cR7q0y6cLjY7Doy62qrdyh3wjdP4a09vR4WE3Kb4AXfHjI8/be
 hmuxw9Mx1TUBqenyIN7Z/71rhMtkYnwRA0pWICTkqohpfi6YMXK8gqkMeTbC0O2L3hJA
 N2YgWGMiiHkqdGgVXJOUSSabU+cygsQRPPLVVQoKYeq59Lse4VGaFYNphjNNREhcwWr9
 mZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFknsSA98SRLzdL3tZ2HL5mJV7033TpNawxHLDY/8NA=;
 b=uTt6ZoKsLoAqIB7zmaEqXh3DLwYWI5GEfaxbw706Gdpb0hhDLaaP5Za3plEmiQfypC
 5LJTGpneKB77geOUqEw+X8caKxOyYOh8qk2NLR7EKOix7rXw+8djvdDmNhPmO1ue8SKM
 B02znU/0K/76Z8UbxZD6yDFMVSe5mm+siDw6p+NPxGe5q3ozB7DstnKC2rrYKVZNclfI
 YtjQLsV5L+uy0dWuuSa4IOATgNHsFQYFxXeNs8j3ma76g2Hx+1Le4p4GWy5e59dhQDwe
 ZkpanfL7gsyeHKl681nnmhEVW/3x/+gNDn+G6WH2abh9BUaBPx3WbzTxpbes7/NG49/G
 RsaQ==
X-Gm-Message-State: AOAM531OM4Jg0MVwH34HCpDsH5rvy1w3p95Ejfqs2x0+7mbsMOqWQtGq
 HM33oZO575vE3UboX/DFpQ4sLTNMgGtB2g==
X-Google-Smtp-Source: ABdhPJw0sSfQZofl2MyoXvW8XzZi9OseD2rcWhtXMKm1++szDrCr/p61RRwveHuXkWMr3qw7AZ4RjA==
X-Received: by 2002:a1c:ddc6:: with SMTP id
 u189mr10051679wmg.171.1614964547712; 
 Fri, 05 Mar 2021 09:15:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/49] hw/arm/mps2-tz: Get armv7m_load_kernel() size argument
 from RAMInfo
Date: Fri,  5 Mar 2021 17:15:10 +0000
Message-Id: <20210305171515.1038-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

The armv7m_load_kernel() function takes a mem_size argument which it
expects to be the size of the memory region at guest address 0.  (It
uses this argument only as a limit on how large a raw image file it
can load at address zero).

Instead of hardcoding this value, find the RAMInfo corresponding to
the 0 address and extract its size.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-20-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 333795b029c..4dfd9a3aa52 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -525,6 +525,20 @@ static void create_non_mpc_ram(MPS2TZMachineState *mms)
     }
 }
 
+static uint32_t boot_ram_size(MPS2TZMachineState *mms)
+{
+    /* Return the size of the RAM block at guest address zero */
+    const RAMInfo *p;
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+
+    for (p = mmc->raminfo; p->name; p++) {
+        if (p->base == 0) {
+            return p->size;
+        }
+    }
+    g_assert_not_reached();
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -789,7 +803,8 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_non_mpc_ram(mms);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       boot_ram_size(mms));
 }
 
 static void mps2_tz_idau_check(IDAUInterface *ii, uint32_t address,
-- 
2.20.1


