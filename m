Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 814503FF160
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:28:40 +0200 (CEST)
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpZv-0004xw-Ff
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpPB-00013t-5E; Thu, 02 Sep 2021 12:17:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpP9-0001xn-IJ; Thu, 02 Sep 2021 12:17:32 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1746327wml.3; 
 Thu, 02 Sep 2021 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DdBo63POokH5fIMDIDGd3vZfaCJQwybOZKNS3BGh4nM=;
 b=SdUILgJd3l3KkosL5d+GJCCbjxa1kuvIi2eQH+QhbRZsxGZZeyT8B45EfAvb4vDqID
 Hvz12f+uLhG2sxeYjZh1eHobRoGFGmx8Vwc0IlXnnkf2IX5bx+BVhSr1cY3Ej8rlB7KC
 YO8ak4ncoqL6BecyY/e6YiTBs4ooYjlzwmmJGuU0TYXlpRik+gmohfcoQGfINeBVNh7H
 gfydQO5CesTCgYv9jzBSAmfhKaEn9YTmVKuXA9R7D2QLLI+i2p5DKESCrSigkULnbdYP
 q+rTwC0UOLH6fDszBS6ixFPljdENz9/dOQt5v2rlttm82OpvBLF+yYDt5s7Pj/jtLcYS
 Xgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DdBo63POokH5fIMDIDGd3vZfaCJQwybOZKNS3BGh4nM=;
 b=uDdKFqHeoGxl3aqN4ptgMORFXpR81d+C4bk65WAyOOYFDLYrRgfBIXedODy2kspwTL
 t8CMt81xTtCTw85Jr+MM7kZWIRag/aUfYqHU6oqJELeokkY7JnJ+U7MVgoOQv1QJd703
 JGx5DMdAfd304Ycmk6LIeCl1fnoZqGUhZDnmFigZrKlUgSXcNAYjWK1TL3HARzYHjyZz
 jYehs9jf2YSNJ95bBlBUwDBWfrwfPRU/p4TnNCFDKBZ1yh+zrSmbx39uRwPq3F1qO/pl
 oyZONHDZAZVuOe+uDwa/L9MGhySXTobwl4I2pyNEpQGmGEHh9h13caM4LNxnGo8mZHLt
 aOug==
X-Gm-Message-State: AOAM531uVrOtBQyuY0EEXeOSHJC35oMX+n2ygupYQLDcqnUgBgAIx4L9
 YqrFdOwNMTRMqUXEEZSnh4EYJWnbLbI=
X-Google-Smtp-Source: ABdhPJxeXOWsxsq5sHAGX+bjrNwp1kbgUUARJY9Fvv8rdRD0ZNZFO5Z6zZ0qv0LrIPXbrhuPF3RRHw==
X-Received: by 2002:a1c:a50c:: with SMTP id o12mr4082621wme.4.1630599447661;
 Thu, 02 Sep 2021 09:17:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f18sm2080257wmc.6.2021.09.02.09.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/30] target/microblaze: Restrict has_work() handler to
 sysemu and TCG
Date: Thu,  2 Sep 2021 18:15:29 +0200
Message-Id: <20210902161543.417092-17-f4bug@amsat.org>
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
 target/microblaze/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925f..74fbb5d201a 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -92,12 +92,15 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+
+#ifdef CONFIG_TCG
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* CONFIG_TCG */
 
-#ifndef CONFIG_USER_ONLY
 static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -142,7 +145,7 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
         cpu_reset_interrupt(cs, type);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 static void mb_cpu_reset(DeviceState *dev)
 {
@@ -368,6 +371,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = mb_cpu_has_work,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
@@ -386,8 +390,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
-
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
-- 
2.31.1


