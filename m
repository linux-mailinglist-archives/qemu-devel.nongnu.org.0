Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03240310F21
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:52:27 +0100 (CET)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85HO-0005Fy-1a
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:52:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tl-0006t0-K6
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:09 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TO-00045G-Io
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:09 -0500
Received: by mail-wr1-x42e.google.com with SMTP id m13so8408654wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jBPg420nC8pQh3qALQMd4OOROzhv7e66E6mvu1AgKfg=;
 b=aMO9rVa9eBZJ7k5HnfJuACbVQZpsAuYiABnsXFmGortX5AI9bs82hCReJ0hhSOAdRx
 srhrMiEcByg14dQdRlXIzSx1j40I0sYlNuhski9P+/3rfOraUEY3R7UWhyRxhhYs1usT
 Fm3j1cDH9WueZwN0FSNHp6mfQNTV1SWogaWyg0QQaIBInMo0osQrI3SPqoVcKhsYYUd3
 JFiwVicvLvDSdzVczd/zWEfXCKJ547wUDgcFFL9yzNXU53IFh7FiX1a/vxfnaY1EaVfm
 ZWMl7tQK/b/6cmPBqJw0URU+d7FfFNQ0Ujy4llfPx5OLRH/L8QDHiWzh8hd3C9DZqctp
 +XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jBPg420nC8pQh3qALQMd4OOROzhv7e66E6mvu1AgKfg=;
 b=Fo7ZnpyGmJe6nSrYs5FfYNgTgTkWevfTBpm6OvE3h3nrzs0zssjxfm0YN0yaXW9ITY
 bHk4m3VIjylUpEYxLNB7VeST1jBrKN4U5n7zQkTla3SU8d0mxHab/IBxZ0mFr/q0xPvO
 GijEI5Re47QO+PwBhudJxmbmKfln+GhEkVCT56lF0BIJMedmWFYCPyfX6Cbt1z340yuq
 KjZNMk3was8pZe60FRfT1qsTU+Nm1qqfWGpOJxeQjqI2Y2yL7bJ9CFYK+3sAM93UM100
 vQPKkyMwIacocy/f1MGHYy8XzWMmDBBwv3LErLml7NzmUdMuCSDulQEGYcZ+hZ6FjGDl
 ms9w==
X-Gm-Message-State: AOAM531JLioNWUzGgMKuElbEE0jgXpVTpG6LCxl2jGXQrbJLEONESnQo
 FxQL8I8bKGkod2BlOebvc+Usu419kkp+Uw==
X-Google-Smtp-Source: ABdhPJy4IPIoOQkF8FHSSyctkzQH0xJ3BZf5j/SDCXLJPwSnfwg3OTv9M1bPEQn+JkpF0LiPLafj0Q==
X-Received: by 2002:a5d:6842:: with SMTP id o2mr6221786wrw.310.1612544437055; 
 Fri, 05 Feb 2021 09:00:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/24] hw/arm/mps2-tz: Get armv7m_load_kernel() size argument
 from RAMInfo
Date: Fri,  5 Feb 2021 17:00:14 +0000
Message-Id: <20210205170019.25319-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

The armv7m_load_kernel() function takes a mem_size argument which it
expects to be the size of the memory region at guest address 0.  (It
uses this argument only as a limit on how large a raw image file it
can load at address zero).

Instead of hardcoding this value, find the RAMInfo corresponding to
the 0 address and extract its size.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index ce5e804c734..17173057af2 100644
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


