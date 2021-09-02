Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF303FF14D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:24:40 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpW2-0005Ci-A1
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOW-0008Pf-IS; Thu, 02 Sep 2021 12:16:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOU-0001F4-Tr; Thu, 02 Sep 2021 12:16:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u26-20020a05600c441a00b002f66b2d8603so1868501wmn.4; 
 Thu, 02 Sep 2021 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1uiIX4B4XnBDTSuiPfQ6TXqVM80IFaG7yss59sugPek=;
 b=KqzWIKJ7D2fRmpGndmFmFNuwslKTxikjGxDMGA2xsPlBUegPAHynuzDusdrr5XjA+x
 UCJbwBQeZPJQtXG0Xtu7RxwzPdlThK6RVv2DMQ/DDE16jxbu2MLTQ+EKf6s/CZXPXeN6
 nzJIGn8UESvClj1N6xIA9j+rSpvqLJiMXVoYewPiMa355LZW9o2GW/afajWJc0/NEar0
 Q8DpjYGYUJuF0UC+706nFPlDCV62j7IN2KHM9wzg02+ZUE7+nf9cE7ogevav/S8CwMh4
 Jx4C3Bwaygo71B9Uga55OA34fqh3F6hfjdQCFZRtq0AWQ50+fnYTHxBfr074WpLdgF+1
 YThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1uiIX4B4XnBDTSuiPfQ6TXqVM80IFaG7yss59sugPek=;
 b=aP22Ld+08SAFKLPOjV09lUZB2N6FKuAWCgBmSO0Xs/GNSyFElWDflRRKPGxmqD1Ltf
 PRT0vRXn3exwUIm0CcrNzjEE7haUdXhEsS1n/PqlQo3ru+/+E4+thcS0HYJP5jeKXPrK
 ziWgHLMa2Y7mOHQwhlpO1mlDc9Y7eDjpYQB4ZUt/iuu4GexuSx1wq+wSmMuW5Uw363J+
 rFnMYEb0wXf0wRmQL3Tc4eOAGCkqNuziv1Ogb5vwvhfa939YVxfHpQ5vbsEbaclk5zKP
 Zz0BH4NbE7V765dVYEETmsVMFZDHE45LW0CN/KEDb5x+MAyU7c+L16/R3HTeb8TM0Gj4
 3jyA==
X-Gm-Message-State: AOAM533JGK5H159CoqAYya7UxJ0MpqvPDKzO8lZO3hotUDrO+gv/2a7T
 hLpeGxeiez+ERq2tmANatNzzzd9r2w4=
X-Google-Smtp-Source: ABdhPJw3pSsMq4kZKK4hbVaJZjnjyoQFK4vJQiZ4XHFwYg2jDsiLD33cM2YA1HEu8cnvL7L44Mu7XQ==
X-Received: by 2002:a1c:44c5:: with SMTP id r188mr4089427wma.9.1630599407288; 
 Thu, 02 Sep 2021 09:16:47 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 y24sm2479386wma.9.2021.09.02.09.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/30] target/avr: Restrict has_work() handler to sysemu
 and TCG
Date: Thu,  2 Sep 2021 18:15:23 +0200
Message-Id: <20210902161543.417092-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index e9fa54c9777..6267cc6d530 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -32,6 +32,7 @@ static void avr_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc_w = value / 2; /* internally PC points to words */
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool avr_cpu_has_work(CPUState *cs)
 {
     AVRCPU *cpu = AVR_CPU(cs);
@@ -40,6 +41,7 @@ static bool avr_cpu_has_work(CPUState *cs)
     return (cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_RESET))
             && cpu_interrupts_enabled(env);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void avr_cpu_synchronize_from_tb(CPUState *cs,
                                         const TranslationBlock *tb)
@@ -198,6 +200,7 @@ static const struct TCGCPUOps avr_tcg_ops = {
     .tlb_fill = avr_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = avr_cpu_has_work,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .do_interrupt = avr_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -214,7 +217,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-- 
2.31.1


