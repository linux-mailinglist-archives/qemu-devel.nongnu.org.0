Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C264B545
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54W9-0001Io-V2; Tue, 13 Dec 2022 07:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54Vv-0001F4-A4
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:04 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54Vt-00062e-Q1
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m14so15438287wrh.7
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfoDaqyDi5g2SMMUF24M2o5M/2GLRFzHx+wauvWPlgQ=;
 b=RUnAyaXz2JFQXkf5dgXKJV9M0oDJESZyYkFT7wF9FlwaBHuPbbwscXuYCr6iatV0EW
 0cjPST/WmAs7jL+Ku7Sko0l9gWGIYm355S1wXkBrPAZYT6VwWBwwUaMRf8xwcTQqlpqW
 U6UKWAnIIPFnBTGoinUsbrcRFZQUKyLsjiSVAM2N10/nxVCUf6B5zLf23hI8I9ncKm9R
 A0QiEcXFmDIxm2/7EeZ7z3jN680gJMZPvbhKcbkbPnIt3csmMUvDIKym/FV6RlanBanf
 yVbX17Ng5k7SkpPfXSLjuh+Y0NI+2lpL7wGIDMgFGXx8X6fd6L7Cpf+/hhgxmZFSySuc
 YJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfoDaqyDi5g2SMMUF24M2o5M/2GLRFzHx+wauvWPlgQ=;
 b=hAETGM2NZAJyWHGcvC27lYiIiGa5nL8MyNGoXwcdlZgehJ2cKco+MKH/+nx27lf1Rm
 nNVHzTshR5Rp7KTAHQwZpg2q7Mx/FoRvPc0eBvd3qbOMG04JNlLIa3oKn2m7MfcAaYbO
 6Z654WpP7Z0IyWALvw3FNVHSlVMpsLQHek+/wKu8zlV1GmEFMi/j9DxXHx584oW8yJFn
 aYwDQWA6s5meccWBWiOPP3JMvhJ1edDUcQZeU4catcIevB1/NMC1QSvoYGHEC2aw2Snf
 D94tMP9UJbTI8BL+mKszw9wuxWxm5kzQ6rSYnf5lRp44F4VbniNNUeb4AHRfqmXAOIEK
 ln8w==
X-Gm-Message-State: ANoB5pkjoGD3iXLc0QSCtMsypurhoSuYMUfKtwVpUfSNEjQ11dLFOCDK
 9InqzakzyO3ex11wLny0RT/xiaXyj8QwSTzg2fc=
X-Google-Smtp-Source: AA0mqf52yKem59QUTfrTjSFYRE9vr+JRXVc9MtIQxCiGer8yhcYzjgGgqwCKdD/1loTBA7u52JhqOQ==
X-Received: by 2002:a5d:6045:0:b0:242:24a7:c7f2 with SMTP id
 j5-20020a5d6045000000b0024224a7c7f2mr11925721wrt.58.1670934959132; 
 Tue, 13 Dec 2022 04:35:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e3-20020a5d5303000000b002366dd0e030sm11671653wrv.68.2022.12.13.04.35.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:35:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 1/4] target/ppc/kvm: Add missing "cpu.h" and
 "exec/hwaddr.h"
Date: Tue, 13 Dec 2022 13:35:47 +0100
Message-Id: <20221213123550.39302-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213123550.39302-1-philmd@linaro.org>
References: <20221213123550.39302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


