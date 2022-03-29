Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F85F4EADA6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:48:44 +0200 (CEST)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBH7-0004F9-PJ
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:48:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZBEY-0001Sw-Jo; Tue, 29 Mar 2022 08:46:02 -0400
Received: from [2001:4860:4864:20::2e] (port=46560
 helo=mail-oa1-x2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nZBEV-0005RF-VA; Tue, 29 Mar 2022 08:46:01 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-d39f741ba0so18528945fac.13; 
 Tue, 29 Mar 2022 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JsD74S2UuJ9uVdAEe9TNk08qfZJANQpaxZJTx+XPstY=;
 b=j0jh+YfoU5wwuUGsFrlgNkeQb9H6l7at8r7lpYe7FMDPzv2+gU+UFBlr6fyEYUeJy2
 tua9T/cOdcusmHawRjyyCMnNzD/KYFDtPbjMjvgxSCggGY1ZmgpHX1j7VUq8tt5kDJ+R
 4ZbO3Wd3IT8tYjOHQrUrPSP/fLG3U0iKnr6DYs2KedqSNgnu1uMBVRWTeD096smopJyP
 dOdtRnUMoq6Da5L4+7IJc5xK654TquXMb93ItVplFmKCdnQpIQnYzkqEUCE0FZrqPm6E
 QAn3ts6Zg2uNxFmK7Ge4ODa9Y5Gmp5VyD3Kf9TlAM54Wxf/gENOGGrlIBgItMr9SY2gC
 JxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsD74S2UuJ9uVdAEe9TNk08qfZJANQpaxZJTx+XPstY=;
 b=ZV+Of4dU2PqubqJv+B4VNr5Wu7fDrTlc9pNLDQmiZ3tc3sO0Ktk2fe170JblgLRJGM
 g5Svze5ludCjptfhlzPcneh3dDSts2S9xzn/btGOQNNZ2LXNMKAKfQX9JFvEK4cQziFd
 KIqswuQCLSA/jvf5Ozy1+bdTe1kJSjwwD2Vzo5Auju674l+4zh7MP0Ol3oJFgwb07Y9T
 DbQEGmTpwlozMJoxzXprk+qESPD37ChXd7ybngS3q/glOAWdoFi5JbNsJhuPPh1a69HZ
 4unHkpZhcJG1+pLU6Do7lZwQ+njweZSRrGuIm006V/Ryc9ByyLc5+DRjMFVKB/YPwSmk
 6tuQ==
X-Gm-Message-State: AOAM5333agA4pgoNqJjpnpDl6U43rOzkptp6+fR/Dw/WuDHfm3A/Hrhn
 8hPvUuPKmFE7j5kCBr0AJXNK0U2JVCM=
X-Google-Smtp-Source: ABdhPJzJPnMekvCAv2i3vQ8lqpTt+p2Yy2Moo0HIEeK8C7+t/hdrlPUdvE8TOSr5rYFwYsxhJfqZCg==
X-Received: by 2002:a05:6870:d354:b0:dd:d425:d4de with SMTP id
 h20-20020a056870d35400b000ddd425d4demr2195187oag.210.1648557956948; 
 Tue, 29 Mar 2022 05:45:56 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:abe8:ed:2c78:ab0c:7946])
 by smtp.gmail.com with ESMTPSA id
 bm51-20020a0568081ab300b002da5c44e0bdsm8586630oib.28.2022.03.29.05.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 05:45:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] hw/ppc: free env->tb_env in spapr_unrealize_vcpu()
Date: Tue, 29 Mar 2022 09:45:45 -0300
Message-Id: <20220329124545.529145-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329124545.529145-1-danielhb413@gmail.com>
References: <20220329124545.529145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2e
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timebase is allocated during spapr_realize_vcpu() and it's not
freed. This results in memory leaks when doing vcpu unplugs:

==636935==
==636935== 144 (96 direct, 48 indirect) bytes in 1 blocks are definitely lost in loss record 6
,461 of 8,135
==636935==    at 0x4897468: calloc (vg_replace_malloc.c:760)
==636935==    by 0x5077213: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.6400.4)
==636935==    by 0x507757F: g_malloc0_n (in /usr/lib64/libglib-2.0.so.0.6400.4)
==636935==    by 0x93C3FB: cpu_ppc_tb_init (ppc.c:1066)
==636935==    by 0x97BC2B: spapr_realize_vcpu (spapr_cpu_core.c:268)
==636935==    by 0x97C01F: spapr_cpu_core_realize (spapr_cpu_core.c:337)
==636935==    by 0xD4626F: device_set_realized (qdev.c:531)
==636935==    by 0xD55273: property_set_bool (object.c:2273)
==636935==    by 0xD523DF: object_property_set (object.c:1408)
==636935==    by 0xD588B7: object_property_set_qobject (qom-qobject.c:28)
==636935==    by 0xD52897: object_property_set_bool (object.c:1477)
==636935==    by 0xD4579B: qdev_realize (qdev.c:333)
==636935==

This patch adds a cpu_ppc_tb_free() helper in hw/ppc/ppc.c to allow us
to free the timebase. This leak is then solved by calling
cpu_ppc_tb_free() in spapr_unrealize_vcpu().

Fixes: 6f4b5c3ec590 ("spapr: CPU hot unplug support")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc.c            | 7 +++++++
 hw/ppc/spapr_cpu_core.c | 3 +++
 include/hw/ppc/ppc.h    | 1 +
 3 files changed, 11 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index faa02d6710..fea70df45e 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,6 +1083,13 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
 
+void cpu_ppc_tb_free(CPUPPCState *env)
+{
+    timer_free(env->tb_env->decr_timer);
+    timer_free(env->tb_env->hdecr_timer);
+    g_free(env->tb_env);
+}
+
 /* cpu_ppc_hdecr_init may be used if the timer is not used by HDEC emulation */
 void cpu_ppc_hdecr_init(CPUPPCState *env)
 {
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index ed84713960..8a4861f45a 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -189,10 +189,13 @@ static const VMStateDescription vmstate_spapr_cpu_state = {
 
 static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
 {
+    CPUPPCState *env = &cpu->env;
+
     if (!sc->pre_3_0_migration) {
         vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_data);
     }
     spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
+    cpu_ppc_tb_free(env);
     qdev_unrealize(DEVICE(cpu));
 }
 
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index b0ba4bd6b9..364f165b4b 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -54,6 +54,7 @@ struct ppc_tb_t {
 
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
 clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
+void cpu_ppc_tb_free(CPUPPCState *env);
 void cpu_ppc_hdecr_init(CPUPPCState *env);
 void cpu_ppc_hdecr_exit(CPUPPCState *env);
 
-- 
2.35.1


