Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D853FF1A7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:40:28 +0200 (CEST)
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLplL-0003Rw-Ly
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpPd-0001w0-VM; Thu, 02 Sep 2021 12:18:03 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpPZ-0002ND-FM; Thu, 02 Sep 2021 12:18:00 -0400
Received: by mail-wm1-x329.google.com with SMTP id u15so1677768wmj.1;
 Thu, 02 Sep 2021 09:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KB6w4zAa3ScKbWvcSeRs6nml5mmvjgABbPo/s2Hl9mE=;
 b=KudZd4akeMvkEQWUbX6szQOXRBHrwcFxsejJsDwXAwrTkhmJGlULM7aiBntpU6DlLD
 x1G792oH76CFsyLlbuYcUF0GY8rXRo+VR9Hu/GBgHJyiVzTP3OvIC53DxbyFxm7deDsy
 jywij08/HNg0mFST30fvOpvMZOkJgu6uZtVjcnTVWcKz4cejoxRKoHPRUUanT/GYimTW
 BuEEvjzL5rlc0uwntqWn8CT2tidHHSSa+1LvLL/36Uq3AShOfMPK6XKiF4/niGHWKMJq
 4jkolFQjzFn6TC5LBuIhdKNpLtstdk7EfVBatQiEEjt66rdtDDU/Oqn47gGLe726oHXk
 a0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KB6w4zAa3ScKbWvcSeRs6nml5mmvjgABbPo/s2Hl9mE=;
 b=AFT1uE8sm/TqXJMdgQzHb8JUswj/uML29c0GNcJHcRbi/V01pCt7lUDwkOnDPP2aHc
 GoUYIBXBlSUpADW97w3HiqINNe9bCUeArd9TlPT178AnbfiwVl33HKDTZYOqxgE9uKV3
 9mFWY68fpZQvy/hLI7/LSfM3XPFtD8Hb40mb8B/ZnfyiB5VWnPrEwqBDYAk+vV8EijtF
 5qQ44ZAcVKybpYjLuJDSpUE58UcX4ldMnUI75axPNr00Lml04ynvlPAwqyqcxPw1jAXG
 v/g2PIbW4ZsnJ8Uf5fYbiLbew3SfdlpKfJ0biigMxLFqY1HGOkH6kKx1UdgrrpduQpXA
 GwPg==
X-Gm-Message-State: AOAM532pTVHyQYDiWaaOsjX3TF43QLaer6oTLcdd0vtcTAFAJNYhstY0
 VY2G8frlZlZuyxFTiLsoWE7/p150zIE=
X-Google-Smtp-Source: ABdhPJx3cFt1jrbYXnlPCjqrJf+8cwfXAXn4EeP6vsDC0dCbWo+FdkLPkzBtWW3nLTZkBTFw2ib2sw==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr3994398wmh.8.1630599474350;
 Thu, 02 Sep 2021 09:17:54 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f7sm2089431wmh.20.2021.09.02.09.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:17:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/30] target/ppc: Restrict has_work() handler to sysemu
 and TCG
Date: Thu,  2 Sep 2021 18:15:33 +0200
Message-Id: <20210902161543.417092-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
 target/ppc/cpu_init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6aad01d1d3a..e2e721c2b81 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -8790,6 +8790,7 @@ static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.nip = value;
 }
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static bool ppc_cpu_has_work(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -8797,6 +8798,7 @@ static bool ppc_cpu_has_work(CPUState *cs)
 
     return msr_ee && (cs->interrupt_request & CPU_INTERRUPT_HARD);
 }
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
 static void ppc_cpu_reset(DeviceState *dev)
 {
@@ -9017,6 +9019,7 @@ static const struct TCGCPUOps ppc_tcg_ops = {
   .tlb_fill = ppc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+  .has_work = ppc_cpu_has_work,
   .cpu_exec_interrupt = ppc_cpu_exec_interrupt,
   .do_interrupt = ppc_cpu_do_interrupt,
   .cpu_exec_enter = ppc_cpu_exec_enter,
@@ -9042,7 +9045,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
 
     cc->class_by_name = ppc_cpu_class_by_name;
-    cc->has_work = ppc_cpu_has_work;
     cc->dump_state = ppc_cpu_dump_state;
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
-- 
2.31.1


