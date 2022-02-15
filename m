Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807AC4B7020
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:29:40 +0100 (CET)
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0hv-0006ME-60
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0fG-0003iz-2s
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0fD-0001bH-N0
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644942410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jI9pWeGRC+NCecONkAqQzwBbY8Az7U40BhcS6Z4hps=;
 b=Kig3tMwPplQBhSuOwC6IKe53ese38xIRvAfabuiO36C1mhq6gt+GXSDu8OBy9r3OOjjiOu
 SjJCpvxUIizWWz9963oJRA+gpp6c7rqAJmRGuBzIIteo5oJEMW0wKvT0snc7wd+GQZwzWC
 19C9TyF2h2krZwU7CZTdMeVKJVrFqmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-Hq07yqdNPLubMouiUB3pHQ-1; Tue, 15 Feb 2022 11:26:46 -0500
X-MC-Unique: Hq07yqdNPLubMouiUB3pHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A307E1091DA0;
 Tue, 15 Feb 2022 16:26:45 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F86510A48D8;
 Tue, 15 Feb 2022 16:26:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 mst@redhat.com, thuth@redhat.com, berrange@redhat.com, quintela@redhat.com
Subject: [PATCH 3/3] x86: Switch to q35 as the default machine type
Date: Tue, 15 Feb 2022 16:25:33 +0000
Message-Id: <20220215162537.605030-4-dgilbert@redhat.com>
In-Reply-To: <20220215162537.605030-1-dgilbert@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The 'q35' machine type series has been around for a few years now, and
is getting heavily used downstream without many problems;  lets flip
to using it as the default.

While it is of course newer and shinier than it's old i440fx cousin,
the main reasons are:
  * PCIe support
  * No default floppy or IDE
  * More modern defaults for NIC
  * Better OVMF support

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/i386/pc_piix.c | 12 +-----------
 hw/i386/pc_q35.c  |  2 ++
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d9b344248d..50c7e6c2c0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -420,7 +420,7 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
     m->alias = "pc";
-    m->is_default = true;
+    m->is_default = false;
     pcmc->default_cpu_version = 1;
 }
 
@@ -431,7 +431,6 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
     pc_i440fx_7_0_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
@@ -443,7 +442,6 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
 {
     pc_i440fx_6_2_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
     m->smp_props.prefer_sockets = true;
@@ -456,7 +454,6 @@ static void pc_i440fx_6_0_machine_options(MachineClass *m)
 {
     pc_i440fx_6_1_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
     compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
 }
@@ -468,7 +465,6 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
 {
     pc_i440fx_6_0_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
     compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
 }
@@ -482,7 +478,6 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
 
     pc_i440fx_5_2_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
     pcmc->kvmclock_create_always = false;
@@ -496,7 +491,6 @@ static void pc_i440fx_5_0_machine_options(MachineClass *m)
 {
     pc_i440fx_5_1_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
@@ -510,7 +504,6 @@ static void pc_i440fx_4_2_machine_options(MachineClass *m)
 {
     pc_i440fx_5_0_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
@@ -522,7 +515,6 @@ static void pc_i440fx_4_1_machine_options(MachineClass *m)
 {
     pc_i440fx_4_2_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     compat_props_add(m->compat_props, pc_compat_4_1, pc_compat_4_1_len);
 }
@@ -535,7 +527,6 @@ static void pc_i440fx_4_0_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_4_1_machine_options(m);
     m->alias = NULL;
-    m->is_default = false;
     pcmc->default_cpu_version = CPU_VERSION_LEGACY;
     compat_props_add(m->compat_props, hw_compat_4_0, hw_compat_4_0_len);
     compat_props_add(m->compat_props, pc_compat_4_0, pc_compat_4_0_len);
@@ -549,7 +540,6 @@ static void pc_i440fx_3_1_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
 
     pc_i440fx_4_0_machine_options(m);
-    m->is_default = false;
     pcmc->do_not_add_smb_acpi = true;
     m->smbus_no_migration_support = true;
     m->alias = NULL;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1780f79bc1..aec4e09c9f 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -365,6 +365,7 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
     m->alias = "q35";
+    m->is_default = true;
     pcmc->default_cpu_version = 1;
 }
 
@@ -375,6 +376,7 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
 {
     pc_q35_7_0_machine_options(m);
     m->alias = NULL;
+    m->is_default = false;
     compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
     compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
 }
-- 
2.35.1


