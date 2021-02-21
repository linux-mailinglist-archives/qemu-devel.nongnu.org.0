Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE5320B02
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:42:52 +0100 (CET)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpwh-00064h-1M
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpp1-0005mZ-OH
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:55 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpp0-0002Ph-5G
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:55 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h98so11531007wrh.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SMk/f13/82FH+4mZ3X6jV05kfzCIC4xjh/U9w/KcQk4=;
 b=fDIWa8vSDQOqJQF3A64csXV9w8NMpyRXy4TP5VOUZG8RwQ63JRHOYAEOS7hClZ7R19
 3n6yelh1RE4q6D8rNgxjjGCyDN+1vMGDE1Rkcczf2z9z2s+MTAGepA/TrxRq4DD8yx+b
 slBdTGvIvXsZh8jNCo0LXbEOL3ZbLclbhhGxgU69Xj79ErUKOHZ3UjtCPlFB5KIIoFMT
 YVERB2H8azWTVto50GHF6cSQ4hXRBJ24vCwk+ZdWPUUz9SBtreKsI/BBRj/nqoE9ghLp
 Zg6dR4UfEhvXagMuTulnJRdEQiISpv6OnIz2BmJDUGYobz92vj/KcwsN5yuzp/DZM6FE
 +fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SMk/f13/82FH+4mZ3X6jV05kfzCIC4xjh/U9w/KcQk4=;
 b=h5AN5Web1E+tZ1eukBGJXeUt1l+g4m0MzRcmtqXGdTd9V0BR5SK1CtfQnxiZskjpog
 1JjrAYKrK8j4rk7KT8+RB/0NgfNtxJ7/2B3l0ZHVjBhohmIByLYVzei9ifJvjY5bHNUH
 DJekqrY/le5pNMDNo791OK0aNeLI+ONCTmDxUlY+vEixPG3H3CGcd3r7lThguAaLjj4/
 TCxe09lePm5IbuCpviy6qi4fBd+ZQxbUQM7N4x3VRguTKTdsga6tM9+38lLpB6ANcCuz
 fg8o4BdBp75ADLFTKI+0ausf68mJfpN2IuBNd9HwtIZcnOOuo5NRjg5xat+8mboN26by
 G8BA==
X-Gm-Message-State: AOAM531bDZNcAn//sB0IuwtuxBFmdDcFm2Fy6sbMWunwu3uibQKzs0YP
 /MLQ0WZzMPuvFEqNikHCEzg7ri0wh+w=
X-Google-Smtp-Source: ABdhPJzm146o5gtgca9hGSvQTMycm1s6b9oJanHG3C1MGga1NcECk3tWUZqJU+KEP4uC2kxHTmiWzA==
X-Received: by 2002:adf:92c4:: with SMTP id 62mr17707227wrn.245.1613918089800; 
 Sun, 21 Feb 2021 06:34:49 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q140sm27543553wme.0.2021.02.21.06.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:34:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/43] hw/mips/fuloong2e: Use bl_gen_kernel_jump to generate
 bootloaders
Date: Sun, 21 Feb 2021 15:33:52 +0100
Message-Id: <20210221143432.2468220-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Replace embedded binary with generated code.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201215064507.30148-2-jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Split original patch as one for each machine (here fuloong2e)]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index bac2adbd5ae..1f3680fda3e 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -33,6 +33,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
+#include "hw/mips/bootloader.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "qemu/log.h"
@@ -185,30 +186,8 @@ static void write_bootloader(CPUMIPSState *env, uint8_t *base,
     /* Second part of the bootloader */
     p = (uint32_t *)(base + 0x040);
 
-    /* lui a0, 0 */
-    stl_p(p++, 0x3c040000);
-    /* ori a0, a0, 2 */
-    stl_p(p++, 0x34840002);
-    /* lui a1, high(ENVP_VADDR) */
-    stl_p(p++, 0x3c050000 | ((ENVP_VADDR >> 16) & 0xffff));
-    /* ori a1, a0, low(ENVP_VADDR) */
-    stl_p(p++, 0x34a50000 | (ENVP_VADDR & 0xffff));
-    /* lui a2, high(ENVP_VADDR + 8) */
-    stl_p(p++, 0x3c060000 | (((ENVP_VADDR + 8) >> 16) & 0xffff));
-    /* ori a2, a2, low(ENVP_VADDR + 8) */
-    stl_p(p++, 0x34c60000 | ((ENVP_VADDR + 8) & 0xffff));
-    /* lui a3, high(env->ram_size) */
-    stl_p(p++, 0x3c070000 | (loaderparams.ram_size >> 16));
-    /* ori a3, a3, low(env->ram_size) */
-    stl_p(p++, 0x34e70000 | (loaderparams.ram_size & 0xffff));
-    /* lui ra, high(kernel_addr) */
-    stl_p(p++, 0x3c1f0000 | ((kernel_addr >> 16) & 0xffff));
-    /* ori ra, ra, low(kernel_addr) */
-    stl_p(p++, 0x37ff0000 | (kernel_addr & 0xffff));
-    /* jr ra */
-    stl_p(p++, 0x03e00008);
-    /* nop */
-    stl_p(p++, 0x00000000);
+    bl_gen_jump_kernel(&p, ENVP_VADDR - 64, 2, ENVP_VADDR, ENVP_VADDR + 8,
+                       loaderparams.ram_size, kernel_addr);
 }
 
 static void main_cpu_reset(void *opaque)
-- 
2.26.2


