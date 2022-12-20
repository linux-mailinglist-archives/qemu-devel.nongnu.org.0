Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDB6521CE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:54:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3b-0004GS-Re; Tue, 20 Dec 2022 08:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3V-0004D3-Rn; Tue, 20 Dec 2022 08:53:18 -0500
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3T-00012L-D9; Tue, 20 Dec 2022 08:53:16 -0500
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1442977d77dso15419977fac.6; 
 Tue, 20 Dec 2022 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y26umyxYZIQKbffD6hLBebjrxc3lj3DIY2bESqX+yW8=;
 b=N4X8/K/Bm9TSecU9vhuD2VVfE6LVb6VMRvVOWijsSRe8Z/N2hzMwTUI6GRAUdXv68G
 oq7333ThQd9FExBoH7r6rRLdYbx+gHkth9A2eqVwUeajiPCipj/WmgPpTWp7buVP5x05
 34qaMlTzExlBIDXp9g1TaeR4iEKAwYlOcOdRmsAUmjIZFeNDrOsISx09xbaIR26g1p5V
 5pMcWWfz5l0yeWBUmUvPSvOh7mioalzBzIo85wx71T9GCPdeah1i6Bspov6nopYTXRyQ
 1Na+X+vSgWuZ+5AvCIDp/joUFOZfX0/aiqWw+q2kaLT77M8Tt8ejGB3ER7PnuucVj3Vd
 9gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y26umyxYZIQKbffD6hLBebjrxc3lj3DIY2bESqX+yW8=;
 b=oowBvXCv4nQX5we2ogpsp6zIf5mBZhKxHrhIis9GS2q0phtJKUZT7AUkqWa0ZeCC6/
 rVAZ2H0KtkKXsiJnGzm2hDwKKnEpCDX17P3R4LUkyDLr2MZZ1RG9Hb9W6Ehnj1TUIMah
 AguQO843P5kmmjPAorqLnSqGj2wvQK5hfyh7mipMM7XWZqPKPaNZoog21W0tf9Ac8QoC
 vJny20Gi1k01HiZqi19uA4XRncYodXWIllENvEekx1yZZmd/eW3oO5TYb0Pv6LjUEnS/
 ItUJLxBZyQVv5ARgGuBtzx+fVJwC5cHCxxxBEfIr7aBXEO1usA612wHeP0uc2fTOP1hr
 bUZQ==
X-Gm-Message-State: ANoB5pkT3rcFBHgOiqMvLGqMOqXRGx+Uej98eJqTY31mdlpcjUZuiAYP
 Pv6EcJvZ04eIiaf0AbolCGr4FMErCJQ=
X-Google-Smtp-Source: AA0mqf737xJGwsBuDZfYzMGlTCByYFtx9aQMjU/8l1ht6pBGBfrDwLdFd49vxEd/QRSrPd1I1f84Hw==
X-Received: by 2002:a05:6870:a40a:b0:143:aebb:57d8 with SMTP id
 m10-20020a056870a40a00b00143aebb57d8mr23728428oal.49.1671544392212; 
 Tue, 20 Dec 2022 05:53:12 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:11 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/15] target/ppc/kvm: Add missing "cpu.h" and "exec/hwaddr.h"
Date: Tue, 20 Dec 2022 10:52:41 -0300
Message-Id: <20221220135251.155176-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

kvm_ppc.h is missing various declarations from "cpu.h":

  target/ppc/kvm_ppc.h:128:40: error: unknown type name 'CPUPPCState'; did you mean 'CPUState'?
  static inline int kvmppc_get_hypercall(CPUPPCState *env,
                                         ^~~~~~~~~~~
                                         CPUState
  include/qemu/typedefs.h:45:25: note: 'CPUState' declared here
  typedef struct CPUState CPUState;
                          ^
  target/ppc/kvm_ppc.h:134:40: error: unknown type name 'PowerPCCPU'
  static inline int kvmppc_set_interrupt(PowerPCCPU *cpu, int irq, int level)
                                         ^
  target/ppc/kvm_ppc.h:285:38: error: unknown type name 'hwaddr'
                                       hwaddr ptex, int n)
                                       ^
  target/ppc/kvm_ppc.h:220:15: error: unknown type name 'target_ulong'
  static inline target_ulong kvmppc_configure_v3_mmu(PowerPCCPU *cpu,
                ^
  target/ppc/kvm_ppc.h:286:38: error: unknown type name 'ppc_hash_pte64_t'
  static inline void kvmppc_read_hptes(ppc_hash_pte64_t *hptes,
                                       ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20221213123550.39302-2-philmd@linaro.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm_ppc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index ee9325bf9a..5fd9753953 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -9,6 +9,9 @@
 #ifndef KVM_PPC_H
 #define KVM_PPC_H
 
+#include "exec/hwaddr.h"
+#include "cpu.h"
+
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
 #ifdef CONFIG_KVM
-- 
2.38.1


