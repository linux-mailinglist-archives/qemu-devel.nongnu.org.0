Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645BA65315C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ym6-00045D-Tk; Wed, 21 Dec 2022 08:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ym5-00043b-4k
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ym3-0003wJ-33
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kBbRLv4t3tnTq4KChg7tIVoKfnTKg+o2KXAUGR2e7iY=;
 b=KovSKX/pO5sAqdkyHa1YeghKS3QcSd0rhzSovSd0TDAvDT+rogIsX4jnXPY+DnkBxWc7N7
 VAOpP5qUxHYMCNQ9eK2XAiO++GkRL5V83I6C3DZHWIe4lwiNWTCDb5RcOdYaviVL31p43C
 iyGSpTm1uVVUw5BI+8JHbyyvJgNOdaU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-ze0EM024P1S4IfE6mD8EqQ-1; Wed, 21 Dec 2022 08:04:41 -0500
X-MC-Unique: ze0EM024P1S4IfE6mD8EqQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso662089wml.9
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kBbRLv4t3tnTq4KChg7tIVoKfnTKg+o2KXAUGR2e7iY=;
 b=qNJqUe7JZsgXpVqI53VKsFVk3PcoNatjow1NZz+WojNISz+lxJ200CiaBlR4ncvGby
 BzbciBQi1/5fw6bgKelV/VtapIbkQ/wrrH6MPEVYhoY0mL4LBpMyUxfekernPFFb+zhW
 Lw7pbVX3KvcWsQ3zvZcHCKoU46kFNowx8UiHdCMi3bAI1YRzR/nLshO5utVCBVGwODvN
 XS+QfXivm5Moa0mQMiH8Ea2HNwFYq/x3bjJFcCCTJYFiuKXQFb87dYpSm61Cnu0V6eyu
 TTe5xxhb220+daumLBwyMSGoKztWJ+PdP/BvnoiyGBR59qlPs+1CzVF8jTEL6M2uk9Hu
 05eQ==
X-Gm-Message-State: AFqh2krWvuXNJuTKgAQTZaISHtvR0pF7rrFHda1EaYL8pv2728IAnjTu
 4wa44D93UuKpqYuNeDQXU1J7iZjqq56TpRElztIB/kMAHag2X+RD2jiEULV31kmwAbHvq5dL92o
 LOt64Qkc8DhmYFQmoe1Y76O810wW4HJpP2cDAoHqQfKwzz687qizRyankSjtF
X-Received: by 2002:a05:600c:250:b0:3d2:2830:b8bb with SMTP id
 16-20020a05600c025000b003d22830b8bbmr4304108wmj.34.1671627878889; 
 Wed, 21 Dec 2022 05:04:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvXTWhkQr2lo8OVSUmwWytQ59zQllOcrmLsy8oF5M+JOZfsY13lejdtB3Uu6YtjFqrvXZnxHQ==
X-Received: by 2002:a05:600c:250:b0:3d2:2830:b8bb with SMTP id
 16-20020a05600c025000b003d22830b8bbmr4304087wmj.34.1671627878603; 
 Wed, 21 Dec 2022 05:04:38 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 bd25-20020a05600c1f1900b003cfd4cf0761sm2277812wmb.1.2022.12.21.05.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:04:37 -0800 (PST)
Date: Wed, 21 Dec 2022 08:04:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 05/41] pc: clean up compat machines
Message-ID: <20221221130339.1234592-6-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Cornelia Huck <cohuck@redhat.com>

We can move setting default_cpu_version into the base machine options,
and we need to unset alias and is_default only once.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20221212152145.124317-3-cohuck@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_piix.c | 27 +--------------------------
 hw/i386/pc_q35.c  | 16 +---------------
 2 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1c0a7b83b5..b48047f50c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -426,6 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000";
     pcmc->pci_root_uid = 0;
+    pcmc->default_cpu_version = 1;
 
     m->family = "pc_piix";
     m->desc = "Standard PC (i440FX + PIIX, 1996)";
@@ -437,11 +438,9 @@ static void pc_i440fx_machine_options(MachineClass *m)
 
 static void pc_i440fx_8_0_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
     m->alias = "pc";
     m->is_default = true;
-    pcmc->default_cpu_version = 1;
 }
 
 DEFINE_I440FX_MACHINE(v8_0, "pc-i440fx-8.0", NULL,
@@ -463,8 +462,6 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
@@ -477,8 +474,6 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_7_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
@@ -490,8 +485,6 @@ DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
 static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
     pc_i440fx_7_0_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
@@ -502,8 +495,6 @@ DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
 static void pc_i440fx_6_1_machine_options(MachineClass *m)
 {
     pc_i440fx_6_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
     m->smp_props.prefer_sockets = true;
@@ -515,8 +506,6 @@ DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
 static void pc_i440fx_6_0_machine_options(MachineClass *m)
 {
     pc_i440fx_6_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
     compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
 }
@@ -527,8 +516,6 @@ DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
 static void pc_i440fx_5_2_machine_options(MachineClass *m)
 {
     pc_i440fx_6_0_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
 }
@@ -541,8 +528,6 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_5_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
@@ -555,8 +540,6 @@ DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
 static void pc_i440fx_5_0_machine_options(MachineClass *m)
 {
     pc_i440fx_5_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
@@ -569,8 +552,6 @@ DEFINE_I440FX_MACHINE(v5_0, "pc-i440fx-5.0", NULL,
 static void pc_i440fx_4_2_machine_options(MachineClass *m)
 {
     pc_i440fx_5_0_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
@@ -581,8 +562,6 @@ DEFINE_I440FX_MACHINE(v4_2, "pc-i440fx-4.2", NULL,
 static void pc_i440fx_4_1_machine_options(MachineClass *m)
 {
     pc_i440fx_4_2_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     compat_props_add(m->compat_props, pc_compat_4_1, pc_compat_4_1_len);
 }
@@ -594,8 +573,6 @@ static void pc_i440fx_4_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_4_1_machine_options(m);
-    m->alias = NULL;
-    m->is_default = false;
     pcmc->default_cpu_version = CPU_VERSION_LEGACY;
     compat_props_add(m->compat_props, hw_compat_4_0, hw_compat_4_0_len);
     compat_props_add(m->compat_props, pc_compat_4_0, pc_compat_4_0_len);
@@ -609,9 +586,7 @@ static void pc_i440fx_3_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_4_0_machine_options(m);
-    m->is_default = false;
     m->smbus_no_migration_support = true;
-    m->alias = NULL;
     pcmc->pvh_enabled = false;
     compat_props_add(m->compat_props, hw_compat_3_1, hw_compat_3_1_len);
     compat_props_add(m->compat_props, pc_compat_3_1, pc_compat_3_1_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 10bb49f679..67ceb04bcc 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -355,6 +355,7 @@ static void pc_q35_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pcmc->default_nic_model = "e1000e";
     pcmc->pci_root_uid = 0;
+    pcmc->default_cpu_version = 1;
 
     m->family = "pc_q35";
     m->desc = "Standard PC (Q35 + ICH9, 2009)";
@@ -372,10 +373,8 @@ static void pc_q35_machine_options(MachineClass *m)
 
 static void pc_q35_8_0_machine_options(MachineClass *m)
 {
-    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
     m->alias = "q35";
-    pcmc->default_cpu_version = 1;
 }
 
 DEFINE_Q35_MACHINE(v8_0, "pc-q35-8.0", NULL,
@@ -396,7 +395,6 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_2_machine_options(m);
-    m->alias = NULL;
     pcmc->legacy_no_rng_seed = true;
     compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
@@ -409,7 +407,6 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_7_1_machine_options(m);
-    m->alias = NULL;
     pcmc->enforce_amd_1tb_hole = false;
     compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
     compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
@@ -421,7 +418,6 @@ DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
 static void pc_q35_6_2_machine_options(MachineClass *m)
 {
     pc_q35_7_0_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
@@ -432,7 +428,6 @@ DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
 static void pc_q35_6_1_machine_options(MachineClass *m)
 {
     pc_q35_6_2_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
     m->smp_props.prefer_sockets = true;
@@ -444,7 +439,6 @@ DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
 static void pc_q35_6_0_machine_options(MachineClass *m)
 {
     pc_q35_6_1_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
     compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
 }
@@ -455,7 +449,6 @@ DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
 static void pc_q35_5_2_machine_options(MachineClass *m)
 {
     pc_q35_6_0_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
 }
@@ -468,7 +461,6 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_q35_5_2_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
@@ -481,7 +473,6 @@ DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
 static void pc_q35_5_0_machine_options(MachineClass *m)
 {
     pc_q35_5_1_machine_options(m);
-    m->alias = NULL;
     m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
@@ -494,7 +485,6 @@ DEFINE_Q35_MACHINE(v5_0, "pc-q35-5.0", NULL,
 static void pc_q35_4_2_machine_options(MachineClass *m)
 {
     pc_q35_5_0_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
@@ -505,7 +495,6 @@ DEFINE_Q35_MACHINE(v4_2, "pc-q35-4.2", NULL,
 static void pc_q35_4_1_machine_options(MachineClass *m)
 {
     pc_q35_4_2_machine_options(m);
-    m->alias = NULL;
     compat_props_add(m->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     compat_props_add(m->compat_props, pc_compat_4_1, pc_compat_4_1_len);
 }
@@ -517,7 +506,6 @@ static void pc_q35_4_0_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_4_1_machine_options(m);
-    m->alias = NULL;
     pcmc->default_cpu_version = CPU_VERSION_LEGACY;
     /*
      * This is the default machine for the 4.0-stable branch. It is basically
@@ -535,7 +523,6 @@ static void pc_q35_4_0_machine_options(MachineClass *m)
 {
     pc_q35_4_0_1_machine_options(m);
     m->default_kernel_irqchip_split = true;
-    m->alias = NULL;
     /* Compat props are applied by the 4.0.1 machine */
 }
 
@@ -549,7 +536,6 @@ static void pc_q35_3_1_machine_options(MachineClass *m)
     pc_q35_4_0_machine_options(m);
     m->default_kernel_irqchip_split = false;
     m->smbus_no_migration_support = true;
-    m->alias = NULL;
     pcmc->pvh_enabled = false;
     compat_props_add(m->compat_props, hw_compat_3_1, hw_compat_3_1_len);
     compat_props_add(m->compat_props, pc_compat_3_1, pc_compat_3_1_len);
-- 
MST


