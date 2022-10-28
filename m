Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6E611823
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:52:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRM-0004UX-PV; Fri, 28 Oct 2022 12:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQj-0006XS-3B; Fri, 28 Oct 2022 12:42:01 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQh-0000Ei-Eb; Fri, 28 Oct 2022 12:42:00 -0400
Received: by mail-oi1-x235.google.com with SMTP id o64so6663235oib.12;
 Fri, 28 Oct 2022 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmZyKQt5wyLEKZsYZcqrmba4nFk6zhV+64M78BnCRMU=;
 b=mi5w5MyHJHjQJL9AF4CenDsNABjd1LvjuQvFfgaGkoUyaBdJfgX9DPTw3KT0gKlH0e
 1o8zxSB5Y++g2PWfaRRzvej1xoW2JvckUG4l43NFINvhLt0faCYmC7kdV5CfiDEmmbsH
 FrIHYw3vvY4gMraW0NoK7iYoZw7h/ypyobaZA3wRU5xugABIzBSpBXuYtfjZO8AcSRIO
 qtN2PpHnvpfc2t8w0NuLJuC5QeJn/FFKzZP/m3v+/j3gIMJaBl9Wu8dBDuRSiXaDaneh
 VCuCqAltXpb09xMwv0ULI3jTEYX3KbdOZU6qtMBMcQpimbQ8E7BJ38Ai5O2e2ZOkE0mO
 A8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RmZyKQt5wyLEKZsYZcqrmba4nFk6zhV+64M78BnCRMU=;
 b=upvLqIMKAtHjAxzwAnkVZFdG77XssTCiCCrHFEIusxn5+2+DBwC7ATOg+VtEcWcYIq
 P4N3z3UT7VPOnXVYB1BjU2TYmOu/DEfg75lWS0M5VtZOLtp6OUXBZ0npQmeHONvTjI02
 D4fv/61Q57MlIpPVkSWodEDhb7kGsKU2et8b+TzjTQEYZlhHueW0Ng8B31HagRVs+t0g
 P4z+k2HhQOVUPSl3UlXc1yaiK+TLmCNbBfDN+IbE7wbgovns/g85WOTX42pZjAQgD/A4
 8c757CQQZpCJWHrMzUol35CommtZZzW55Fcm4cTyxi3Dm2Tns/nTqrX2q35iDK5rjF93
 ctHw==
X-Gm-Message-State: ACrzQf2JA3LozI5pqIBe4gmafck43HSd6n9IQa1EqhB+oe2idVUQuN/D
 2cYb0Kr4x1OAoRYBRGXX3yGYgKvShZFdrA==
X-Google-Smtp-Source: AMsMyM5Jaca5wRLLMa+3STKqwKssQk8NOs1tZFioGlTLtoI6cNfW0T0DCK35qaJL1cYJTlxpCw0rxg==
X-Received: by 2002:a05:6808:14c1:b0:354:d3bf:67b with SMTP id
 f1-20020a05680814c100b00354d3bf067bmr8820456oiw.160.1666975317727; 
 Fri, 28 Oct 2022 09:41:57 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 27/62] target/ppc: remove generic architecture checks from
 p9_deliver_interrupt
Date: Fri, 28 Oct 2022 13:39:16 -0300
Message-Id: <20221028163951.810456-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-10-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 288bb20deb..238ce78235 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1925,18 +1925,11 @@ static void p9_deliver_interrupt(CPUPPCState *env, int interrupt)
         break;
 
     case PPC_INTERRUPT_DECR: /* Decrementer exception */
-        if (ppc_decr_clear_on_delivery(env)) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
-        }
         powerpc_excp(cpu, POWERPC_EXCP_DECR);
         break;
     case PPC_INTERRUPT_DOORBELL:
         env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
-        if (is_book3s_arch2x(env)) {
-            powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
-        } else {
-            powerpc_excp(cpu, POWERPC_EXCP_DOORI);
-        }
+        powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
         break;
     case PPC_INTERRUPT_HDOORBELL:
         env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
-- 
2.37.3


