Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C392FB19D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:41:05 +0100 (CET)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1khL-0001wE-LJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQo-0001R4-BA; Tue, 19 Jan 2021 01:23:59 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33937 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQi-0000X4-SM; Tue, 19 Jan 2021 01:23:58 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrY0Bt0z9sXH; Tue, 19 Jan 2021 17:23:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037405;
 bh=79shwS2+CEPG3Z5H/OohnnLYmOtj+JqZfXPV/12nFDk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nXY6sgIw+zDxBNldGA1jNWl5HHtFMhCheYDrESlRNjK/ESlWxCnWDX2Xnt+CwtNtX
 ejYPLMe5DUn8Q+a+qTaLGKv5f1EUyuHETWd9TgszqumnUdlIi4BJUfxgMNsG1FALBR
 ZZnnIlvRHLCepVtPfvEG/vyRx+xyt5XImRXrJBw4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 13/13] spapr_cpu_core.c: use g_auto* in spapr_create_vcpu()
Date: Tue, 19 Jan 2021 17:23:18 +1100
Message-Id: <20210119062318.13857-14-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Use g_autoptr() with Object and g_autofree with the string to
avoid the need of a cleanup path.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210114180628.1675603-6-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_cpu_core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 2f7dc3c23d..4f316a6f9d 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -277,8 +277,8 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
 {
     SpaprCpuCoreClass *scc = SPAPR_CPU_CORE_GET_CLASS(sc);
     CPUCore *cc = CPU_CORE(sc);
-    Object *obj;
-    char *id;
+    g_autoptr(Object) obj = NULL;
+    g_autofree char *id = NULL;
     CPUState *cs;
     PowerPCCPU *cpu;
 
@@ -293,23 +293,17 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
     cs->start_powered_off = true;
     cs->cpu_index = cc->core_id + i;
     if (!spapr_set_vcpu_id(cpu, cs->cpu_index, errp)) {
-        goto err;
+        return NULL;
     }
 
     cpu->node_id = sc->node_id;
 
     id = g_strdup_printf("thread[%d]", i);
     object_property_add_child(OBJECT(sc), id, obj);
-    g_free(id);
 
     cpu->machine_data = g_new0(SpaprCpuState, 1);
 
-    object_unref(obj);
     return cpu;
-
-err:
-    object_unref(obj);
-    return NULL;
 }
 
 static void spapr_cpu_core_realize(DeviceState *dev, Error **errp)
-- 
2.29.2


