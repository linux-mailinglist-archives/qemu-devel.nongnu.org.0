Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C2359963
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:38:15 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnag-00016H-63
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZC-0007yn-Dx
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:43 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUnZ9-0002g8-8I
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:36:41 -0400
Received: by mail-ed1-x530.google.com with SMTP id ba6so5781490edb.1
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxBTXyvbAaGxN3p2AS1o7HgTWI8VLAUHNHXBSFX2Z74=;
 b=SsXF+UgIizRJlNFOQ2H+y4CGGoClAglnEgI3y/MrRXtsJbHBTLEZrjaWO43gBHPVNh
 2+Ir3rN2K10FfnemQBcBxXRK5JeHOoJ+4pBTearUlvZwXZ9HcKDWPB/rUOAc79SWckV9
 msJzmfzkRtmbT3Hm339M0gRNN489Gga2K48ygWGKDPtX+tYTqukI+L2BntqNNL3IKwUK
 Gsd+i0nU/GFOX/vLHOXFyJR94HFx99yOqLdzEVuR4SfP9iXghRObnyc9r3sp5oMxYeLN
 ZZvy7/q2L5PH/QVFTsuoG5LG2n8qxEuueEmXsIbbbE1tHv2bYzd+kdbwfahYIxPxf8mP
 bUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lxBTXyvbAaGxN3p2AS1o7HgTWI8VLAUHNHXBSFX2Z74=;
 b=IedF7ZsrZ8kEvuKBAo4gVywTw8/1GjGMhkACnacJnSgsT6CHnu/fiRzmT8vZWCMV28
 DjcSb9ijXXW0WbNRSPbwer0NacDIiNsCiaZX/qe4qumzvGVm0H1E3/4sbvdVXROs4zVv
 4v5OlAqnXsGeaY97Zngivf1Ui+rH9RcO2TCShu0YAIOAAzL+UHGTNRtCkd9CVo/rweeH
 Nzb/b+RUsWp+Kk783qHKlt+xbOV0nazdCGeR+Pn9HEC7hw5avpsuXV8nzJasK/Y73S4K
 Tousf7+fyUPqYrCmo2GKlK27PGIDxfpp6TqH192Zz5gRXH1X67FkjJ4qVnejRZycIb0F
 H4iw==
X-Gm-Message-State: AOAM5302n1hpBeOa1/qzBcn9nXbAq903zl7ptoLl+5R8Dc5VDCvoXplq
 z3bHgC1uj065h4nXLbtXPgZeccE2TpRAnA==
X-Google-Smtp-Source: ABdhPJwSBS3RTHQYhNdbckVP0XM2zHcgPpKtPxo7Znz1G/19SoBlSGgXKGTKiKsHUmhhmJdwNq1Y6w==
X-Received: by 2002:a05:6402:51d4:: with SMTP id
 r20mr16676168edd.112.1617960996372; 
 Fri, 09 Apr 2021 02:36:36 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t1sm1070337eds.53.2021.04.09.02.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 02:36:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 v2 2/6] target/mips/cpu: Update CP0 clock when CPU
 clock is propagated
Date: Fri,  9 Apr 2021 11:36:19 +0200
Message-Id: <20210409093623.2402750-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409093623.2402750-1-f4bug@amsat.org>
References: <20210409093623.2402750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hao Wu <wuhaotsh@google.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting the CP0 clock simply on CPU init is incorrect. First
because the clock can not be yet propagated. Second because
we aimed to support dynamic frequencies in commit a0713e85bfa,
so the CPU frequency can be changed *after* init time.

The correct way is to register a ClockCallback, which will
update the CP0 period when the clock changes.

Fixes: a0713e85bfa ("target/mips/cpu: Allow the CPU to use dynamic frequencies")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index aa0b00256e6..db93d19c49a 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -604,6 +604,13 @@ static void mips_cp0_period_set(MIPSCPU *cpu)
     assert(env->cp0_count_ns);
 }
 
+static void mips_cpu_clk_update(void *opaque, ClockEvent event)
+{
+    MIPSCPU *cpu = opaque;
+
+    mips_cp0_period_set(cpu);
+}
+
 static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -624,7 +631,6 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
         /* Initialize the frequency in case the clock remains unconnected. */
         clock_set_hz(cpu->clock, CPU_FREQ_HZ_DEFAULT);
     }
-    mips_cp0_period_set(cpu);
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -653,7 +659,8 @@ static void mips_cpu_initfn(Object *obj)
     MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(obj);
 
     cpu_set_cpustate_pointers(cpu);
-    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in", NULL, cpu, 0);
+    cpu->clock = qdev_init_clock_in(DEVICE(obj), "clk-in",
+                                    mips_cpu_clk_update, cpu, ClockUpdate);
     env->cpu_model = mcc->cpu_def;
 }
 
-- 
2.26.3


