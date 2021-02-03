Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D020430DC24
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:04:39 +0100 (CET)
Received: from localhost ([::1]:60892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ilq-00037V-Sf
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Ij4-0001nS-Bw; Wed, 03 Feb 2021 09:01:46 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Ij2-0006fn-5a; Wed, 03 Feb 2021 09:01:46 -0500
Received: by mail-ed1-x52e.google.com with SMTP id g10so8698951eds.2;
 Wed, 03 Feb 2021 06:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HylraCplKFi7oseZ+aY7IMW1PQ9unz50ipO8oFunAhw=;
 b=Gw0iyxMQbbtp1xW/JpCL8OXsk5hfkRClRH7ccT0r0b4qOJvdNxI7EjLN+j8QI2Y96n
 RnyF/xxoQiIRbW9LgSw3kMr4qfv97NOFF9PzfmTinGgUTBdF/Cd4YJJMdNwJjDOZg+w9
 ruFCH2EztqEAmqqFx844KD9CJ7F6zl+cph6P5gV++d24NMMtS8Q2zMZpXD5VDOVxsq+D
 ySURebBGu0wPOfYPh0Q2ik9TqBir7mwE3piKcuzlj6b6E43Ynb5qU26G4BYhpxTFM1Ta
 ecGT5JgEi1bQad2BDh06XcBV0vfHmtJEXs4SnOX6atlODOjuS0OPwz8LycX+SQjDlxRL
 T/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HylraCplKFi7oseZ+aY7IMW1PQ9unz50ipO8oFunAhw=;
 b=JhxhRE0uZHpv2DTQsGUTpRdtzmVJHYNcuBXKI5FE6sy5ZPEuedE6dUljpmyCys/RpB
 QglP/VJ5TATGvRdVTWCLQIsTnDTSZXOXvpCLBskBFUsvw5hJPEJ40m8DFGg+sYsoflJN
 PQXe871sWuuxkXeytUutkE5nc2oxPhnZdvF7t5kqJrowBWZV5utPex3ETZ8eHji7Cn4z
 Q+JrY6YkNdsc5Skj7mxk1MzcRvxXzuh85tfqSYDZTtqe6f7p2pg1XFsBTysT/9y9btxX
 6TfmpzrmfrAy7KYSHfU0L02RBgpzH+SLdHc/vMVrn1jNiKyiIC1zulBgPVAaMyIivKU3
 Y73A==
X-Gm-Message-State: AOAM531K3a34Exhg83+vdTQK4C+Shduelnb5RurWUQXWz2axfBaVbos6
 +xmXQ1LKzTY6cg0QbZ0CacE=
X-Google-Smtp-Source: ABdhPJw0beGVHuWeHCGjQwiJEWSVB3FZBRKotVb0rhFG/G02K1UdUnlphNvkaehV3ytRMNITDoqbXg==
X-Received: by 2002:a05:6402:28e:: with SMTP id
 l14mr3152432edv.19.1612360902268; 
 Wed, 03 Feb 2021 06:01:42 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id m10sm907980edi.54.2021.02.03.06.01.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:01:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH 1/2] hw/ppc: e500: Use a macro for the platform clock frequency
Date: Wed,  3 Feb 2021 22:01:32 +0800
Message-Id: <1612360893-4624-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the platform clock frequency is using a magic number.
Convert it to a macro and use it everywhere.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ppc/e500.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c64b5d0..672ccd5 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -74,6 +74,8 @@
 #define MPC8544_I2C_IRQ            43
 #define RTC_REGS_OFFSET            0x68
 
+#define PLATFORM_CLK_FREQ          400000000
+
 struct boot_info
 {
     uint32_t dt_base;
@@ -320,8 +322,8 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
     int fdt_size;
     void *fdt;
     uint8_t hypercall[16];
-    uint32_t clock_freq = 400000000;
-    uint32_t tb_freq = 400000000;
+    uint32_t clock_freq = PLATFORM_CLK_FREQ;
+    uint32_t tb_freq = PLATFORM_CLK_FREQ;
     int i;
     char compatible_sb[] = "fsl,mpc8544-immr\0simple-bus";
     char *soc;
@@ -890,7 +892,7 @@ void ppce500_init(MachineState *machine)
         env->spr_cb[SPR_BOOKE_PIR].default_value = cs->cpu_index = i;
         env->mpic_iack = pmc->ccsrbar_base + MPC8544_MPIC_REGS_OFFSET + 0xa0;
 
-        ppc_booke_timers_init(cpu, 400000000, PPC_TIMER_E500);
+        ppc_booke_timers_init(cpu, PLATFORM_CLK_FREQ, PPC_TIMER_E500);
 
         /* Register reset handler */
         if (!i) {
-- 
2.7.4


