Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11474EC605
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 15:52:53 +0200 (CEST)
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZYki-0004qY-AZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 09:52:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtE-0008GG-4A; Wed, 30 Mar 2022 08:57:32 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:41276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZXtC-0004bf-BD; Wed, 30 Mar 2022 08:57:31 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 3F4B321EDD;
 Wed, 30 Mar 2022 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648645017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEeV3pdJjggFAgny3pSiPS5I29jbbs1q3Rp1FOMlriU=;
 b=fxJqFatKOJHc36kZtOyuEeFeIyYA3RKJqT30O49+s/4Y/q90h48PLenwDNPQ7ohljjHR51
 w7v70xdZ+A3+RpFy+J+K0vG3/BoTfFHfTUXh1FUS2NN4MsaejBsNVNUbw8Z1RipjqC7AIH
 KpdHBDYcVp0hSC9v1JsahcuR65OutIo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 17/18] hw/riscv/riscv_hart: remove temporary features
Date: Wed, 30 Mar 2022 14:56:38 +0200
Message-Id: <20220330125639.201937-18-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 mark.burton@greensocs.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Vijai Kumar K <vijai@behindbytes.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we updated all riscv machines, we can remove
the temporary realize helper and the alias property.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/riscv/riscv_hart.h |  3 ---
 hw/riscv/riscv_hart.c         | 14 --------------
 2 files changed, 17 deletions(-)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 65ac0d2bc4..acf5ee8575 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -56,7 +56,4 @@ static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *s)
     return CPUS(s)->topology.cpus;
 }
 
-/* Temporary function until we migrated the riscv hart array to simple device */
-void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp);
-
 #endif
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 1b4ff7e3c6..ea798de5d5 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -27,13 +27,6 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/cpu/cpus.h"
 
-void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp)
-{
-    /* disable the clustering */
-    cpus_disable_clustering(CPUS(state));
-    qdev_realize(DEVICE(state), NULL, errp);
-}
-
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
     DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
@@ -52,12 +45,6 @@ static void riscv_harts_configure_cpu(CpusState *base, CPUState *cpu,
     cpuenv->mhartid = s->hartid_base + i;
 }
 
-static void riscv_harts_init(Object *obj)
-{
-    /* add a temporary property to keep num-harts */
-    object_property_add_alias(obj, "num-harts", obj, "num-cpus");
-}
-
 static void riscv_harts_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -73,7 +60,6 @@ static const TypeInfo riscv_harts_info = {
     .name          = TYPE_RISCV_HART_ARRAY,
     .parent        = TYPE_CPUS,
     .instance_size = sizeof(RISCVHartArrayState),
-    .instance_init = riscv_harts_init,
     .class_init    = riscv_harts_class_init,
 };
 
-- 
2.35.1


