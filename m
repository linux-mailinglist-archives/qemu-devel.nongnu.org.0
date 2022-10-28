Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B407A6117C3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:42:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRC-0002MZ-Pc; Fri, 28 Oct 2022 12:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQK-0003Gx-OW; Fri, 28 Oct 2022 12:41:36 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQJ-0008TR-4C; Fri, 28 Oct 2022 12:41:36 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso3301154otn.0; 
 Fri, 28 Oct 2022 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0p/bdDLpqZSATFpFwneoMhlaXwAv9HtYRC1j37CbzY=;
 b=E83k5bkPgruvAQgB11cKBp6ccivw5rKUaOQm0OT8rj6ytRAOH2PryG6lvy6vDW8cNS
 U4/9HvYwsC/a8ha1YLlNPykvd5oSWd2876H280S8FkXojJDOpj5BQQJqxrPYVV5vdaZO
 o7ED7CnRbWqvF2M7wdt0HHsPGoz/pdgY6MFFv/aNZedyb8W8JbY+mwcsVoOKV2pGNY7Q
 xPjcAng1CY9CQjlQxGomq5zXS8MhvdDpFg2jXk7ZBDWlzU4t9Z0Mgo2D2QZTwkcQAZi2
 HNkGYx6ZczZewswvMI2MN+P8/NzFLhCAjxCXCxdmICfojjO4d3SCWrgSn9IR7IN7pe7C
 sDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0p/bdDLpqZSATFpFwneoMhlaXwAv9HtYRC1j37CbzY=;
 b=wwkrIkObx3os1OdzMfCY2m9ZbP2XOKvBgwpPzEpnJ8VUC5oBzWjY/xFN8gDGyRtEjy
 M+hCAaRiDuvS/B830iPJ+Kvqae+hjrfV9zr4PvlXK66rFsqJ64zxga16zqPniS3RxIdF
 I1n69w5GvNaKN/jjv1tfz7W0WisEetBlQUCSASPW5F3PUzRwZtqfzJAHe0bxftNFEfHG
 vxldjZFLZ7SPBhk37MgJo/RwoXAV5D5acWJhBli1kDn+CEvalp2GuaU5BzYHLGFh4nzo
 KhImzIZ65SrF2Fdozs3hbApfkr75/2kbeMrod/mlXDP4lM68PNsI8ZjQehrKwMqECwf3
 wJlQ==
X-Gm-Message-State: ACrzQf09ZUFbhQBOMQhizvhMJ4pImRVNDfSCecM6gPvgZOzNxmidSEoC
 krI/OGrMt0/9Are3BxOiIvbOGjCemXgoFA==
X-Google-Smtp-Source: AMsMyM7EqAy5z12fT/0x+l3ZjzSwdZD53phg4OkOx34wGoSFcEMJOb7HJ6MzcZ6kTpubULXJmxAOEg==
X-Received: by 2002:a9d:4812:0:b0:66a:992e:676a with SMTP id
 c18-20020a9d4812000000b0066a992e676amr126565otf.86.1666975293518; 
 Fri, 28 Oct 2022 09:41:33 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 22/62] target/ppc: prepare to split interrupt masking and
 delivery by excp_model
Date: Fri, 28 Oct 2022 13:39:11 -0300
Message-Id: <20221028163951.810456-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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
Message-Id: <20221011204829.1641124-5-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 759bad582d..0e89d2e15b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1684,7 +1684,7 @@ void ppc_cpu_do_interrupt(CPUState *cs)
     powerpc_excp(cpu, cs->exception_index);
 }
 
-static int ppc_next_unmasked_interrupt(CPUPPCState *env)
+static int ppc_next_unmasked_interrupt_generic(CPUPPCState *env)
 {
     bool async_deliver;
 
@@ -1796,7 +1796,15 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
     return 0;
 }
 
-static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
+static int ppc_next_unmasked_interrupt(CPUPPCState *env)
+{
+    switch (env->excp_model) {
+    default:
+        return ppc_next_unmasked_interrupt_generic(env);
+    }
+}
+
+static void ppc_deliver_interrupt_generic(CPUPPCState *env, int interrupt)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     CPUState *cs = env_cpu(env);
@@ -1900,6 +1908,14 @@ static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
     }
 }
 
+static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
+{
+    switch (env->excp_model) {
+    default:
+        ppc_deliver_interrupt_generic(env, interrupt);
+    }
+}
+
 void ppc_cpu_do_system_reset(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
-- 
2.37.3


