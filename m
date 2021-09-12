Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A42407F09
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:45:55 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTYA-0004Ky-Vu
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHs-00008W-R9
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHq-00055l-Tc
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id u15so4874057wru.6
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=Y3+w31yHrTenzLWkTfrN3luY2rECDEEg/t13NreMfe+1kJl3SbBfwyuCW2l+GAaVGG
 HGylMB2vfBqFFaeuBzQBhH9RWFVOQn8EJcZKT/mnmYJKIiQj4TewevcqQMkpfEJ4CdS7
 53lkNBhAGli4nQ6ltfk+oN7NOpv2/HQv6QFHlzk0eaWErBRZZ3egExFt5Yg/Qa2LVN5a
 nMFrD3PPw4mZGl40qPmDvlN0mCoER0k/0UD3irS4DsgaSRR+s8HDIZrMjUtIHwRrXDBd
 ll6JRiPVu2wLoYONBaISBsVL9vptdybgZGl79U2RducWojeOlSxmB8jELbLNKRm377Rv
 mUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=acgjCaHCdDvDEO6aQNdNA165wsQFWfR3HbCbuPW+vnw=;
 b=QFJJPG1x+UqXU1JKiQGH39I149ViMadmglt/L1W+bCF0V2MojtY/OaryYUsH74sAMq
 FQo+Vk4XI16waYUWUdfnqJWACizHuF7jA5SvQTmEpaHfYWLjIm4xiPb6fwimrZuSNA2u
 3yQEZxgALEIpx3atzLfWKFc8wzwbTHvwmDli8cdqcYarQwHryopZnrH2br/ZJgkgwLIC
 /NX/JreRQJewkg9s8F9s9G6n4fy92lWHDusXzmHRwdOSHksIpy6F2l7WloI8inffIEpE
 HvEp2k6GRXElk4Sj+uXeHd+GS/q6RS/CEzFfsMJ86ANLI6XzncqOGR7iQJc0PjxobiSf
 G+HQ==
X-Gm-Message-State: AOAM531VYWrylEQORSJVaU7/PuY27YhAKACCPCZa3KaAAq7wRIkyL3IU
 3MqhVHF6+yQJSaKij87ettIhktokLCU=
X-Google-Smtp-Source: ABdhPJzejN2PigR55IH52e9DXq8XfcxZok4TpeaB4wUDIQwf7FhtCHMvYc14Ur+plnXWt+5B00AUWg==
X-Received: by 2002:adf:914a:: with SMTP id j68mr8503405wrj.73.1631467740908; 
 Sun, 12 Sep 2021 10:29:00 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z12sm2404wro.75.2021.09.12.10.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/30] target/nios2: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:19 +0200
Message-Id: <20210912172731.789788-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1e..9938d7c2919 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     env->regs[R_PC] = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_reset(DeviceState *dev)
 {
@@ -223,6 +225,7 @@ static const struct TCGCPUOps nios2_tcg_ops = {
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = nios2_cpu_has_work,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
@@ -241,7 +244,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
-    cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-- 
2.31.1


