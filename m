Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78723FF1B5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:41:57 +0200 (CEST)
Received: from localhost ([::1]:39328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpmm-0006PJ-Tb
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpPP-0001eB-Ji; Thu, 02 Sep 2021 12:17:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpPH-00025c-5d; Thu, 02 Sep 2021 12:17:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so1426051wmh.1; 
 Thu, 02 Sep 2021 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNTRH1yoq5af/chfn9I/5bXkTQKwubTn8iozem9IGSY=;
 b=PGBnfVPTt2uYSxX6RQU1qsSKDWiS62QWAFvPTZETHVyL2OfFEKZZM3g5e9WJ1/HCKp
 vwU/HD/XAeJVS5v2+My/H3taQ/5KpM2mCEqjy9lZxh2Z/pp5+KxKPIJb09S1d7E1zVbI
 3ZIcYz0tlufyP3eqE0RuxgxTothAxpq4vYSqZmx2K/VGuOwYk4ulhhYY34CvxwPWhOkc
 X6DZRjwitqLAQZOFu87Nxe9lRc1tqhLGZ8hROluYOSSfODd35hNP9l0+ra9n37CT0CeZ
 tWoQvZtrbSLJKAVJXRMVVda3fXJ9XRtlNf90jVOb68ZvlGwL1VX/T67Jlue0hgDZL0Fm
 SNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oNTRH1yoq5af/chfn9I/5bXkTQKwubTn8iozem9IGSY=;
 b=jsH8qUw5KCvNY95M0o8mpIusTf6IaVYfkIAqJqd1pyuw+flPHgJ5mBqQZrUeASQt96
 v9nyc0//CSci55x1eECTYOH82AkJzwHREJdZvMyH69Iq2aKECGQAMb7bCj0mtuEIWSjd
 N4nTGA566folz+zORryA+khM2Ru963GrdwrEen3dKhgqT9bwgC/LROyD0HL6ZEkmRQhX
 27+CCQV3eFMK5TX2PoEP0dMrcVO4zONfMIVbUKq+9K7iYuHUzMW1VcMSJ5A4/kmM9ZZ2
 crwNpnY0gFLbLoBknN0/7eVh54ITmaKX48P0mjhXnlYxBnP743kJdKrY/nhuFLAeiSrX
 C4JA==
X-Gm-Message-State: AOAM530dPCn2miS/c+dHWyxlOqEFDGsANNUKRtJqtMzV47jLCZcejpyX
 apm80MO/hAPIZP140AKWxygvHQUoVmA=
X-Google-Smtp-Source: ABdhPJxVc9r0FTKCTOqW8xIIldm9t05NRFuFTf+Kzcn3sLsTdbmtacHYR3pfbO5B7AXHWSOEzXQpFQ==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr3821810wmq.178.1630599453691; 
 Thu, 02 Sep 2021 09:17:33 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z17sm2350022wrh.66.2021.09.02.09.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/30] target/mips: Restrict has_work() handler to sysemu
 and TCG
Date: Thu,  2 Sep 2021 18:15:30 +0200
Message-Id: <20210902161543.417092-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
 target/mips/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 00e0c55d0e4..3639c03f8ea 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -128,6 +128,7 @@ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
     mips_env_set_pc(&cpu->env, value);
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool mips_cpu_has_work(CPUState *cs)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -172,6 +173,7 @@ static bool mips_cpu_has_work(CPUState *cs)
     }
     return has_work;
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 #include "cpu-defs.c.inc"
 
@@ -542,6 +544,7 @@ static const struct TCGCPUOps mips_tcg_ops = {
     .tlb_fill = mips_cpu_tlb_fill,
 
 #if !defined(CONFIG_USER_ONLY)
+    .has_work = mips_cpu_has_work,
     .cpu_exec_interrupt = mips_cpu_exec_interrupt,
     .do_interrupt = mips_cpu_do_interrupt,
     .do_transaction_failed = mips_cpu_do_transaction_failed,
@@ -563,7 +566,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, mips_cpu_properties);
 
     cc->class_by_name = mips_cpu_class_by_name;
-    cc->has_work = mips_cpu_has_work;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->gdb_read_register = mips_cpu_gdb_read_register;
-- 
2.31.1


