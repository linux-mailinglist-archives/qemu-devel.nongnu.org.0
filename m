Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14111420099
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:58:47 +0200 (CEST)
Received: from localhost ([::1]:60592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwOT-00043E-Kz
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9L-0003c4-3T
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9I-0000sN-Fu
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id v18so50891982edc.11
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+vOdH4m3hrFvFRhYahy/3RG4y7EYfgtFN7DPdj5//eE=;
 b=Rv/erQvzX9HHDoRn1wGUCp7OxBIeny23YgRp9UV3fPt+L7FkdvC+CtIc2GXikaT68D
 pIjvrGs874cZ2Sa/bOBMocn8tJEIUgxZrchRAsVeGNxnZGwGi6L9Gu1FOoknex7wVh2j
 glk1ifS4RH4lR8eXq3ZjQU9S706rUZ7Jak4IsWsF9RFrcE61hWr0Z9s1EZwYQVcE29Ig
 p7/7FGNcIgs8/12SA/CXWs+jB1urFSIOm8jRfh/OpTRqT8miwcrZ91ksNUkNU7KYyhmj
 XyOrorgP2JH9v0YJXhjjAmm3CXYbPWoAFMdCaIvKfE/tAtGy4QLBvtMxQ2KUdtBBflGH
 ENbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+vOdH4m3hrFvFRhYahy/3RG4y7EYfgtFN7DPdj5//eE=;
 b=QYraf0+XYj6cMU/zX6ByCT5wxMp6y++MN1V+0J61ltO3RKfWbqxaRnPqyjNhW566St
 i+4axaIVoMJ+OSnkzGOXsiWcT8AANWCf+lYqJrbpwv+F7aNtbTch9ZKsSY8rbPdZpLIK
 cekWF71Dh33jDcRQSekuK0kifagDaG2b0/50UWfm8vyoO1jpk7oeMX0PvbcQ3J1CmJUA
 xuGrTIL9k0bc3PwfyoWe/sOMPTQYTzEM5fVJw0SqzIY+Z2aO9aUbCFonWW15vT6OC+ST
 L21l8yY2Dn1JEgvDNHmFpiU83QAEieTfIeuHYTFp43LUY4PqRt56LfR1VjGF9NTXOwfI
 QiBg==
X-Gm-Message-State: AOAM5319BpKE+IugLxJEAORl2GLwNm//i654wVEvppoiksOxe2Sbt9SI
 v+n0oIvpHMGpbTFPoyRxJFKBp9XJeLQ=
X-Google-Smtp-Source: ABdhPJxd6gCMGv87Gx/gCOOx4UvxVZ+LnTq4ws7nXtJYcLbCbl24XM1a++AOVbiYkIRP5x7cb4xNrA==
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr8921694ejk.481.1633246983135; 
 Sun, 03 Oct 2021 00:43:03 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] machine: Move smp_prefer_sockets to struct SMPCompatProps
Date: Sun,  3 Oct 2021 09:42:34 +0200
Message-Id: <20211003074250.60869-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Now we have a common structure SMPCompatProps used to store information
about SMP compatibility stuff, so we can also move smp_prefer_sockets
there for cleaner code.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210929025816.21076-15-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/virt.c              | 2 +-
 hw/core/machine.c          | 2 +-
 hw/i386/pc_piix.c          | 2 +-
 hw/i386/pc_q35.c           | 2 +-
 hw/ppc/spapr.c             | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 include/hw/boards.h        | 3 ++-
 7 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8c13deb5db..7170aaacd5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2815,7 +2815,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 
     /* qemu ITS was introduced with 6.2 */
     vmc->no_tcg_its = true;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8b0f1aed83..54f04a5ac6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -817,7 +817,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (mc->smp_prefer_sockets) {
+        if (mc->smp_props.prefer_sockets) {
             /* prefer sockets over cores before 6.2 */
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 932e6e2cfe..6ad0d763c5 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -432,7 +432,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_prefer_sockets = true;
+    m->smp_props.prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 57ab07e5b7..fcc6e4eb2b 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -372,7 +372,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_prefer_sockets = true;
+    m->smp_props.prefer_sockets = true;
 }
 
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2986108b5a..163c90388a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4685,7 +4685,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     smc->pre_6_2_numa_affinity = true;
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 5401c985cf..653587ea62 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -814,7 +814,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
     ccw_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_prefer_sockets = true;
+    mc->smp_props.prefer_sockets = true;
 }
 DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index fa284e01e9..5adbcbb99b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -110,9 +110,11 @@ typedef struct {
 
 /**
  * SMPCompatProps:
+ * @prefer_sockets - whether sockets are preferred over cores in smp parsing
  * @dies_supported - whether dies are supported by the machine
  */
 typedef struct {
+    bool prefer_sockets;
     bool dies_supported;
 } SMPCompatProps;
 
@@ -250,7 +252,6 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
-    bool smp_prefer_sockets;
     SMPCompatProps smp_props;
     const char *default_ram_id;
 
-- 
2.31.1



