Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF342008C
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:53:50 +0200 (CEST)
Received: from localhost ([::1]:45860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwJh-0002Vl-NJ
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9G-0003Lz-U1
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9E-0000p1-Oe
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:02 -0400
Received: by mail-ed1-x535.google.com with SMTP id z20so466919edc.13
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DN0tulJi69ThOUd7hhj1vMp2XEuspWIX9kmvQJNwQXc=;
 b=OhEjPNTqf2GD2odGw5F8W8FRAH+bqEHD3QMHfV8jYcoZSJ5jCvloGphV0Ji72/2t87
 4CILEZZXc2cPBHfV235yfLLm1Oi4azAcsDAofCoUQAVYK3b+ZUlzATRKrKKLOtkmUxko
 8kV9QfZA7qwSuTPcHOezJBlz+Xc4bd5z8QPGY52gjjkrx56ZEIZqPu8Y0vPmgQ2nsGxf
 Q1axW+d3rZ8oK0evTe7Oe7tXcHFspLPI03N35x/D6aGmm0rAWH405TGQnNniQiPJCV6O
 rA8RTA3pM/6JrBX6edYTI7pD3Zs5Zgo8fqTIVPqHq0g4ed74GhIMJRl9QP3KsCrxkNLm
 VF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DN0tulJi69ThOUd7hhj1vMp2XEuspWIX9kmvQJNwQXc=;
 b=1x58qQX7xc7+w7pY85F5z6lnvpa5oCdUvO6FiYeigYFgi+ADkJUr5qpVaMKdhEwFX1
 8D2L91cipHmMfeLJK2Zb6MqzUFUAI2WrGaMFOBmRl3Dz8ELQI3JaIo44pj4un6CUxMxm
 FdpJsm3ZXy9kC9ePYVlV6HgCz3okXhtpBRWtemJKsw/AEKLfXeFQgxxLUjhveAvhPSwS
 obAntdQtgJ1dwVBtQHN6Vib5DIEY5zmXxoV0TOUJZZSj0EMdCFJ+CUX+aG+IKR7RJQsp
 fYYsji9OstJE8Od1SQ3mzP5keNwtEb+WNDkkg+OKpEZCY+EhNCpgdzNgttpDEpwLTiSy
 oBHQ==
X-Gm-Message-State: AOAM5310qu6uTiXkAqQ5hvNeoXngh2nr5UD2ynTBPRDYlLr0EhqA1wo1
 /6y/S2tDpMvkbkbgq5AAXPfWIh7TyI4=
X-Google-Smtp-Source: ABdhPJxN0U/i+z0JUzHajVml4WxKMkzTKTjM51IxLGT4kZ5mR0P567IpdFyUdEG+8E2d1y7cBTME8A==
X-Received: by 2002:a17:906:6b0c:: with SMTP id
 q12mr9233839ejr.0.1633246979400; 
 Sun, 03 Oct 2021 00:42:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] machine: Prefer cores over sockets in smp parsing since
 6.2
Date: Sun,  3 Oct 2021 09:42:29 +0200
Message-Id: <20211003074250.60869-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

In the real SMP hardware topology world, it's much more likely that
we have high cores-per-socket counts and few sockets totally. While
the current preference of sockets over cores in smp parsing results
in a virtual cpu topology with low cores-per-sockets counts and a
large number of sockets, which is just contrary to the real world.

Given that it is better to make the virtual cpu topology be more
reflective of the real world and also for the sake of compatibility,
we start to prefer cores over sockets over threads in smp parsing
since machine type 6.2 for different arches.

In this patch, a boolean "smp_prefer_sockets" is added, and we only
enable the old preference on older machines and enable the new one
since type 6.2 for all arches by using the machine compat mechanism.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-10-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/virt.c              |  1 +
 hw/core/machine.c          | 35 ++++++++++++++++++++++++++---------
 hw/i386/pc.c               | 35 ++++++++++++++++++++++++++---------
 hw/i386/pc_piix.c          |  1 +
 hw/i386/pc_q35.c           |  1 +
 hw/ppc/spapr.c             |  1 +
 hw/s390x/s390-virtio-ccw.c |  1 +
 include/hw/boards.h        |  1 +
 qemu-options.hx            |  3 ++-
 9 files changed, 60 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1d59f0e59f..8c13deb5db 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2815,6 +2815,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 
     /* qemu ITS was introduced with 6.2 */
     vmc->no_tcg_its = true;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index e38ab760e6..f2a34d98c0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -748,6 +748,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
 
 static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
@@ -759,7 +760,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -767,14 +768,30 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            sockets = maxcpus / (cores * threads);
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = maxcpus / (sockets * threads);
-        } else if (threads == 0) {
+        if (mc->smp_prefer_sockets) {
+            /* prefer sockets over cores before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            }
+        } else {
+            /* prefer cores over sockets since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (cores * threads);
+            }
+        }
+
+        /* try to calculate omitted threads at last */
+        if (threads == 0) {
             threads = maxcpus / (sockets * cores);
         }
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9216ad163d..6cc32f4048 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -716,6 +716,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level)
  */
 static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned dies    = config->has_dies ? config->dies : 0;
@@ -726,7 +727,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     /* directly default dies to 1 if it's omitted */
     dies = dies > 0 ? dies : 1;
 
-    /* compute missing values, prefer sockets over cores over threads */
+    /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
@@ -734,14 +735,30 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (sockets == 0) {
-            cores = cores > 0 ? cores : 1;
-            threads = threads > 0 ? threads : 1;
-            sockets = maxcpus / (dies * cores * threads);
-        } else if (cores == 0) {
-            threads = threads > 0 ? threads : 1;
-            cores = maxcpus / (sockets * dies * threads);
-        } else if (threads == 0) {
+        if (mc->smp_prefer_sockets) {
+            /* prefer sockets over cores before 6.2 */
+            if (sockets == 0) {
+                cores = cores > 0 ? cores : 1;
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            } else if (cores == 0) {
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            }
+        } else {
+            /* prefer cores over sockets since 6.2 */
+            if (cores == 0) {
+                sockets = sockets > 0 ? sockets : 1;
+                threads = threads > 0 ? threads : 1;
+                cores = maxcpus / (sockets * dies * threads);
+            } else if (sockets == 0) {
+                threads = threads > 0 ? threads : 1;
+                sockets = maxcpus / (dies * cores * threads);
+            }
+        }
+
+        /* try to calculate omitted threads at last */
+        if (threads == 0) {
             threads = maxcpus / (sockets * dies * cores);
         }
     }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6cc834aff6..932e6e2cfe 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -432,6 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+    m->smp_prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 5481d5c965..57ab07e5b7 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -372,6 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+    m->smp_prefer_sockets = true;
 }
 
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b7bee5f4ff..2986108b5a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4685,6 +4685,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     smc->pre_6_2_numa_affinity = true;
+    mc->smp_prefer_sockets = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 61aeccb163..5401c985cf 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -814,6 +814,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
     ccw_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    mc->smp_prefer_sockets = true;
 }
 DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 463a5514f9..2ae039b74f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -247,6 +247,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
+    bool smp_prefer_sockets;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
diff --git a/qemu-options.hx b/qemu-options.hx
index 2eac830fdb..8ef178180d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -244,7 +244,8 @@ SRST
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
-    liable to change.
+    liable to change. Prior to 6.2 the preference was sockets over cores
+    over threads. Since 6.2 the preference is cores over sockets over threads.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.31.1



