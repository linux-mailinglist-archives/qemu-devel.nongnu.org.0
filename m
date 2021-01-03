Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9732E8E43
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:05:34 +0100 (CET)
Received: from localhost ([::1]:45616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAZB-0001TC-4k
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMo-0004gU-Pa
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAMn-0006Ox-7P
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:52:46 -0500
Received: by mail-wr1-x429.google.com with SMTP id r3so29501056wrt.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wl6SwD6rhHXZkyr+JvQ9IE37tD/v6VssJI8HTk5wOP0=;
 b=g55UkzV3Y/lYN54ws1yacJxa7HfsyjtRj3eIJBCYzHCbTA3Zm5LAUo67rp5VTzjJkh
 8WVuEvn4O0ZYsxpZy9aq6ydGxPrNByMAVJxUnNlEoa3XRZMNQEonIYCBSLl7ZY6Y8392
 MKMOH4/znsEYrFE8hEYD3bfScyqaLzM2OMLPdBjWFBFZDEWsIEE7tSv7ykl9T55WjP4d
 1QmnJbo2PLtcO/zKQreQEIyTfRpxwd7c8jkYbPfOVx67H0ZlNCvi07f5z9TthiMBA82k
 rKcEZy2Vaqjgc3p+Il+cgDQHGxrDFtrtQhqKHGRorb+sWyxGUvQNSdvTbqlVEQrzg00P
 oHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wl6SwD6rhHXZkyr+JvQ9IE37tD/v6VssJI8HTk5wOP0=;
 b=pA0yWFkJMKl5bmJs9HfWQYkZp5wafX0ZOLtnrkgciHAXW/ZSDCDi45aL/YWAE+muhf
 5ReMbboXxYliaxWJh3cwp4Hx/59Cgv9Uhd582l4IJYJ8+vwauB/m8gNKbJ2MeM5rTGiD
 DEgpj/XW51rM4JkzcrmxMSwNMJWsCqNcKwOQhAg1Bza1DF2TfO+nbWswfexofaovEggf
 GVsP8DvY42K0IdsCin9dftmZ+4ysag9r4pP7Khsb27oJ7fFoeoOBAAnA5cVNnSQFUR4R
 CDFK4/EoCoHQBGDVdVJy0pUQMxcaPAugw31Yymj06Dp83i+MrCkVzVBXJ6VLw6uAoI8z
 GV7g==
X-Gm-Message-State: AOAM530W44mNf66xbwffukdy8sl/7kKimI84gJwSywG0dPVZj7pltf7m
 BRJHxECDObwzRZKm4o0hOyrQsrQ5Dpk=
X-Google-Smtp-Source: ABdhPJzXGaXrdGPC+3cvkxXcPfxQek+zImMW4gFYHCImDgoiJbafi9FAheWVnzr47Vr5heFXpHODng==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr77876460wrn.23.1609707163837; 
 Sun, 03 Jan 2021 12:52:43 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id k128sm30374711wma.43.2021.01.03.12.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/35] hw/mips/malta: Use address translation helper to
 calculate bootloader_run_addr
Date: Sun,  3 Jan 2021 21:50:15 +0100
Message-Id: <20210103205021.2837760-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

So it will sign extend adresses properly.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215064200.28751-3-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/malta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 7db009a3e96..1fbb8a32207 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1302,9 +1302,9 @@ void mips_malta_init(MachineState *machine)
         /* For KVM we reserve 1MB of RAM for running bootloader */
         if (kvm_enabled()) {
             ram_low_size -= 0x100000;
-            bootloader_run_addr = 0x40000000 + ram_low_size;
+            bootloader_run_addr = cpu_mips_kvm_um_phys_to_kseg0(NULL, ram_low_size);
         } else {
-            bootloader_run_addr = 0xbfc00000;
+            bootloader_run_addr = cpu_mips_phys_to_kseg0(NULL, RESET_ADDRESS);
         }
 
         /* Write a small bootloader to the flash location. */
-- 
2.26.2


