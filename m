Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C0686332
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 10:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN9ok-0004b0-8F; Wed, 01 Feb 2023 04:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pN9oi-0004aB-4t
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:54:12 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pN9oe-0003Gt-2p
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 04:54:10 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N9M1q-1oc0hE2P2a-015JvE; Wed, 01
 Feb 2023 10:54:04 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/1] m68k: fix 'bkpt' instruction in softmmu mode
Date: Wed,  1 Feb 2023 10:54:02 +0100
Message-Id: <20230201095402.1002350-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201095402.1002350-1-laurent@vivier.eu>
References: <20230201095402.1002350-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EsEgyQ/ip/1Kjz6inX7yNt6f2OURHY/XMoNa+ct/ki9WZC1zv5j
 KbGfqryDRXlfJ2CFpNflnrQ57dHNc35kJkOf0vydwhoQ5lcehIS6Y0Sugfp9XHYZgwqj49O
 1BU9YggRPa+NV2pJ3qR5Mp77Ijbo2SiQBqiVTZvvGdYQJcnWnujFiWU8fpsObDStG7K3LHe
 VkRQP05khAGoDvxru8n9g==
UI-OutboundReport: notjunk:1;M01:P0:D/xjjhEM55Y=;Xb6mRpkVzBIvLrXUDUDzvAl525E
 OQ++s5levic7V8Z+YJlzZgoInti+Xx5gbCAraNLLDis3TnYnT4EFVc1h5LvKN6G+CD5aV9dj4
 x5Qzd9AqwAau32tXlb+IdjLmfiwT3fFQL9FWcGE8LlKX3QIKkPkZre7FygKL61GIMaqUBitUF
 B6hy77DovS4EEwKPQz7Ulhp9jvvgVfTkYokvEXAstH0nwWgd+0+UsItRk6/UNVpKIUKPNwPSL
 NfmZBUHV6AbEGHgvE4WvWM/QECV1OTUsiXpdVJRY0IUIsdOUU/aP/UuD96q6DKvr6Jru0Ka5I
 tKGTmxeVIRciDv8uaehRL0y1kSXzxSz+2TGTRYNQaithCkpAMaLMrkEgjPc0s2s7Ej+rVmGTj
 5JaDQIrtXjtHcfzM2T1vRLu1/obUKn1W014GTeWRp81XMvnYgO5iBDV0iJH/YTmfz62x2chPh
 Qe3saOAe6KtCuuWvAjH3lred5XgERKrDs0QwO9HUdng5W7HepXNYSyP1C8R2TqQ0W0cRNXaNA
 /bsK1H90TCIgzh+uPBvaaBlAbmLd8ji++jCsoO/qh8M61+5tJSscUDo7KMmijBpMAYfxGh2BB
 uczljwaWs+ddJmXTqEIWb3POsNV55sZSVBbatcfO8Ww+qZoQj6E5zlhTth46YBgUlxoHe4Xt3
 ihbCtMqTIS+yhbkB/25EAeC1t5PHj/PcaSfsf+aEOA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

In linux-user mode, 'bkpt' generates an EXP_DEBUG exception to allow
QEMU gdb server to intercept and manage the operation with an external
debugger.

In softmmu mode, the instruction must generate an illegal instruction
exception as it is on real hardware to be managed by the kernel.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1462
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230126125234.3186042-1-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 18418312b14b..31178c3b1d17 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2774,7 +2774,11 @@ DISAS_INSN(swap)
 
 DISAS_INSN(bkpt)
 {
+#if defined(CONFIG_SOFTMMU)
+    gen_exception(s, s->base.pc_next, EXCP_ILLEGAL);
+#else
     gen_exception(s, s->base.pc_next, EXCP_DEBUG);
+#endif
 }
 
 DISAS_INSN(pea)
-- 
2.39.1


