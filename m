Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AF2CF48A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 20:09:27 +0100 (CET)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klGSH-0001LV-Dj
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 14:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEcf-0007T2-Uo
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1klEbJ-0006hc-G7
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 12:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607101799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbPKOJFLjelxVZRXIiuFYnqLQBRH5A40D62dQ0hRETY=;
 b=SfGLUit7MYjUcSZK0DIYddkpeLXt4uYnq7HiNBXn/Wm7lMsep1FVaxSi5YK2dgybnZyW9Y
 AfI+6Decw34ZTZeVShV/nN+ULP2XtzRc6pUCrBe1HOHi7vrdKsV3z1sshYxkeRZodlVrld
 4TuAp0mhUeBRjrTs871B9P0qXIDmFow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-sitmlEVNNOmRApR390Z48w-1; Fri, 04 Dec 2020 12:09:57 -0500
X-MC-Unique: sitmlEVNNOmRApR390Z48w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84092C7401;
 Fri,  4 Dec 2020 17:09:56 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89BC119630;
 Fri,  4 Dec 2020 17:09:55 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] x86: ich9: let firmware negotiate 'CPU hot-unplug with
 SMI' feature
Date: Fri,  4 Dec 2020 12:09:39 -0500
Message-Id: <20201204170939.1815522-9-imammedo@redhat.com>
In-Reply-To: <20201204170939.1815522-1-imammedo@redhat.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep CPU hotunplug with SMI disabled on 5.2 and older and enable
it by default on newer machine types.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v1:
  - ensure that unplug can't be enabled without hotplug (Laszlo)
---
 hw/i386/pc.c      | 4 +++-
 hw/isa/lpc_ich9.c | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 781523684c..6476d8d853 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -97,7 +97,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_5_2[] = {};
+GlobalProperty pc_compat_5_2[] = {
+    { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
+};
 const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
 
 GlobalProperty pc_compat_5_1[] = {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index da80430144..d3145bf014 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -392,6 +392,12 @@ static void smi_features_ok_callback(void *opaque)
         return;
     }
 
+    if (guest_cpu_hotplug_features ==
+        BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) {
+        /* cpu hot-unplug is unsupported without cpu-hotplug */
+        return;
+    }
+
     /* valid feature subset requested, lock it down, report success */
     lpc->smi_negotiated_features = guest_features;
     lpc->smi_features_ok = 1;
@@ -774,7 +780,7 @@ static Property ich9_lpc_properties[] = {
     DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT, true),
     DEFINE_PROP_BIT64("x-smi-cpu-hotunplug", ICH9LPCState, smi_host_features,
-                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, false),
+                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.27.0


