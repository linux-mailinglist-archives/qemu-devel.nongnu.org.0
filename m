Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28049457107
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:47:37 +0100 (CET)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5Au-0004ls-0G
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:47:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo59A-0002hU-6N
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:48 -0500
Received: from [2a00:1450:4864:20::533] (port=47062
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo597-0003a2-Bb
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:46 -0500
Received: by mail-ed1-x533.google.com with SMTP id y13so43518417edd.13
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNmgxkki39VS/5cKODPLgvf7JSDULcUYXDW8fN8IF6A=;
 b=dyX+mNcvQJmdq3ND7VG6ovtHF8sblfcA57xMEPoj9x5DhAYFxfqOLEXlNWkweOruq1
 SzCTro9MVm21zTBT3kc3VNy7Plhs3KighM1BPyCWVl/WFa2OIfM+ao3n+U/8u1NF1qk0
 4PFdrzNdg04GVB0cWkswIKFneDkGw7jDeScaq58LqJ2X8r8tJ0Vo7T9l9Dkk/qHVWb+g
 GKbk5Nl+4R9jlZidxiVG4agTles9RlVCyA5YlBhWbTWJ7/CPunP+d3XeqgmbtUK97qoD
 vQmf3+kdhmXBe6Ral6zRLGbYOzWR+M7X3aRdM9wRK3BTbDzlq4dXGKb4aae7XqrMg7ox
 Yz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LNmgxkki39VS/5cKODPLgvf7JSDULcUYXDW8fN8IF6A=;
 b=JX42wiSJlFEaOOlJ2HMNZQ/CVGSHIGvf6KvyL+JlGa67i3wLrNpALB5UsweDMhQ/aa
 alWf9eLlT3S+5eJ5R4yy0T+7fxD5yjlrFr1KLfRgcV9+MhZyymjaMGzq1y+996TIDdwf
 171plpJmSRPSzbOs+sHl57iN9ghgoBs/lcMy8RyKr6aouo50PEB6eyOH5LgPvVErdGx3
 ak3mY5Oaov3ImEsMlVCBciLeKU3dLhiaZpxtMmQzbzdSQpNSpmFjUdWFod4mTH074MCx
 PUsY0ciHT85icXsfbqxTRIaeL6RRdU+mn1V3Ut3Ya9HtQf4zYV4R7O7QA2EK+0tE0aRv
 OYoA==
X-Gm-Message-State: AOAM5321ghUpRBIIV2kRih6lV4GQFS+eBF9bXIPCtCHwAsaqw20imEID
 l1a0FHt1sBZ69HancoXGhdcDmPprz1o=
X-Google-Smtp-Source: ABdhPJxU2z2PX18hL95TBW5k/aUxxI+q4ViLgiy1yMPi/S69HO4x+na9XaV55HctNYLlwgf6s6fH7A==
X-Received: by 2002:a17:907:7e91:: with SMTP id
 qb17mr8745049ejc.449.1637333141877; 
 Fri, 19 Nov 2021 06:45:41 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:41 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] nvmm: Fix support for stable version
Date: Fri, 19 Nov 2021 15:45:34 +0100
Message-Id: <20211119144539.285740-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
References: <20211119144539.285740-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: nia <nia@NetBSD.org>, Kamil Rytarowski <kamil@netbsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: nia <nia@NetBSD.org>

NVMM user version 1 is the version being shipped with netbsd-9,
which is the most recent stable branch of NetBSD. This makes it
possible to use the NVMM accelerator on the most recent NetBSD
release, 9.2, which lacks nvmm_cpu_stop.

(CC'ing maintainers)

Signed-off-by: Nia Alarie <nia@NetBSD.org>
Reviewed-by: Kamil Rytarowski <kamil@netbsd.org>
Message-Id: <YWblCe2J8GwCaV9U@homeworld.netbsd.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                 |  4 +---
 target/i386/nvmm/nvmm-all.c | 10 ++++++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 93a5e50a16..582f356209 100644
--- a/meson.build
+++ b/meson.build
@@ -323,9 +323,7 @@ if not get_option('hax').disabled()
   endif
 endif
 if targetos == 'netbsd'
-  if cc.has_header_symbol('nvmm.h', 'nvmm_cpu_stop', required: get_option('nvmm'))
-    nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
-  endif
+  nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
   if nvmm.found()
     accelerators += 'CONFIG_NVMM'
   endif
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 14c996f968..9af261eea3 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -750,7 +750,11 @@ nvmm_vcpu_loop(CPUState *cpu)
         nvmm_vcpu_pre_run(cpu);
 
         if (qatomic_read(&cpu->exit_request)) {
+#if NVMM_USER_VERSION >= 2
             nvmm_vcpu_stop(vcpu);
+#else
+            qemu_cpu_kick_self();
+#endif
         }
 
         /* Read exit_request before the kernel reads the immediate exit flag */
@@ -767,6 +771,7 @@ nvmm_vcpu_loop(CPUState *cpu)
         switch (exit->reason) {
         case NVMM_VCPU_EXIT_NONE:
             break;
+#if NVMM_USER_VERSION >= 2
         case NVMM_VCPU_EXIT_STOPPED:
             /*
              * The kernel cleared the immediate exit flag; cpu->exit_request
@@ -775,6 +780,7 @@ nvmm_vcpu_loop(CPUState *cpu)
             smp_wmb();
             qcpu->stop = true;
             break;
+#endif
         case NVMM_VCPU_EXIT_MEMORY:
             ret = nvmm_handle_mem(mach, vcpu);
             break;
@@ -888,8 +894,12 @@ nvmm_ipi_signal(int sigcpu)
 {
     if (current_cpu) {
         struct qemu_vcpu *qcpu = get_qemu_vcpu(current_cpu);
+#if NVMM_USER_VERSION >= 2
         struct nvmm_vcpu *vcpu = &qcpu->vcpu;
         nvmm_vcpu_stop(vcpu);
+#else
+        qcpu->stop = true;
+#endif
     }
 }
 
-- 
2.33.1



