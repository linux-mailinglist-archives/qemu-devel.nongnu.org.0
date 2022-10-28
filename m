Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21146117D3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:44:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRJ-0003Rp-20; Fri, 28 Oct 2022 12:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQX-000529-9Y; Fri, 28 Oct 2022 12:41:50 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQV-00008V-J9; Fri, 28 Oct 2022 12:41:49 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-13c569e5ff5so6495136fac.6; 
 Fri, 28 Oct 2022 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCiYxYGyadO9LoYU4Gl96bRgSZ9v9BV4bKo5zyEXk2g=;
 b=WD4Kreld1TTybKEuksb/mvly2tw0K5Tm1D030Ly5FTxw8xcErrdNUicHtPe7yBl1HU
 JfYMyT/s/FveVhjp1ZxQKKx5w94OwPQ/35WLE2RpAVed+g0yE4ITwzngmFPwfGghQm0/
 JR056nwTdhPvOYM/3lerKhLetoUfOE03kUXuf32xqjfW6bAKoQZYLVxgr0mQBAlFscBw
 mPzZVHOsldUqGMh1r51O/zXfIEkk5TxPEpkcKlWIy+hnw4ITjip9PZKYSRpcTaYY8009
 6n8cYP5mp/JPNNoT3xiubO34uvoLc80TNfFTbXOKFWworsuVTxT+PwwvtaToSy0m45JQ
 DKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCiYxYGyadO9LoYU4Gl96bRgSZ9v9BV4bKo5zyEXk2g=;
 b=F3YvHD2q+Oqh40AlXEyu3KwxW88ukBhD+BQaxDnb09KpCBrnyIz/OMoAM0u7UD/XbW
 RMZB2pAGx9UA6jFIo/JSHNxmEsNmy8Gq0xfgXsxooebCDJyWUMK98E/4L4m2d8bI6tiI
 VcrDxGWIbhqZRqStmPyRfRChWn2MpC75+my5vRejruOuJqrEi4nwkLNJt5ZqlPPp00e5
 Sapb+OkC0D3HnVUStHTEHW2VziI+MIEeblyNGMggPKBbX0AvGlEu/gf799T+KRS+RXNI
 hQ73g9rOyB+qCS2rIPhpvOYLIYJjwLIS8z/cmeEz/r/ylO1X6PUPbyubF+slULSPFHqV
 g/iA==
X-Gm-Message-State: ACrzQf2cYeMpOOTq7e4/2WHUC/sgqOOXzJmU0GlEM9An5PP8H2XSCnek
 4vt4P7axyIO9Mw8B9pfQ/RdgwwQz/Aylgg==
X-Google-Smtp-Source: AMsMyM7vwYwCkmCUOPSP5KHrco9tavf9wDzsJb5gTnzhF9Ga+vtH+7XwxIJzgqznWmy/J591f1MJLA==
X-Received: by 2002:a05:6870:1712:b0:13a:bc2d:ac3e with SMTP id
 h18-20020a056870171200b0013abc2dac3emr5936oae.207.1666975304708; 
 Fri, 28 Oct 2022 09:41:44 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:42 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 24/62] target/ppc: remove unused interrupts from
 p9_next_unmasked_interrupt
Date: Fri, 28 Oct 2022 13:39:13 -0300
Message-Id: <20221028163951.810456-25-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Remove the following unused interrupts from the POWER9 interrupt masking
method:
- PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970 and POWER5p;
- Debug Interrupt: removed in Power ISA v2.07;
- Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
  for embedded CPUs;
- Critical Doorbell Interrupt: removed in Power ISA v3.0;
- Programmable Interval Timer: 40x-only.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-7-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 36 +++++++-----------------------------
 1 file changed, 7 insertions(+), 29 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4d2fb2ebd1..740a5618b9 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1685,14 +1685,17 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 }
 
 #if defined(TARGET_PPC64)
+#define P9_UNUSED_INTERRUPTS \
+    (PPC_INTERRUPT_RESET | PPC_INTERRUPT_DEBUG | PPC_INTERRUPT_CEXT |   \
+     PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL | PPC_INTERRUPT_FIT |  \
+     PPC_INTERRUPT_PIT | PPC_INTERRUPT_THERM)
+
 static int p9_next_unmasked_interrupt(CPUPPCState *env)
 {
     bool async_deliver;
 
-    /* External reset */
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
+    assert((env->pending_interrupts & P9_UNUSED_INTERRUPTS) == 0);
+
     /* Machine check exception */
     if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
         return PPC_INTERRUPT_MCK;
@@ -1736,28 +1739,7 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
             return PPC_INTERRUPT_EXT;
         }
     }
-    if (FIELD_EX64(env->msr, MSR, CE)) {
-        /* External critical interrupt */
-        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
-            return PPC_INTERRUPT_CEXT;
-        }
-    }
     if (async_deliver != 0) {
-        /* Watchdog timer on embedded PowerPC */
-        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
-            return PPC_INTERRUPT_WDT;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
-            return PPC_INTERRUPT_CDOORBELL;
-        }
-        /* Fixed interval timer on embedded PowerPC */
-        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
-            return PPC_INTERRUPT_FIT;
-        }
-        /* Programmable interval timer on embedded PowerPC */
-        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
-            return PPC_INTERRUPT_PIT;
-        }
         /* Decrementer exception */
         if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
             return PPC_INTERRUPT_DECR;
@@ -1771,10 +1753,6 @@ static int p9_next_unmasked_interrupt(CPUPPCState *env)
         if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
             return PPC_INTERRUPT_PERFM;
         }
-        /* Thermal interrupt */
-        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
-            return PPC_INTERRUPT_THERM;
-        }
         /* EBB exception */
         if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
             /*
-- 
2.37.3


