Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B407B44D4DB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:13:23 +0100 (CET)
Received: from localhost ([::1]:56286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml758-0005GP-Sw
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:13:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wW-0007PH-30
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ml6wQ-00012L-Ra
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636625062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K6REFy2Z9s6d+bG385Dx3esh0VGm1oiX7Asv3HUk+NQ=;
 b=F9WnHv8hcnxkLzf3SaxS2iGgfPB29oyJniWaO6aO6jEzXrzpLH6B3faainV1b723LK0zIY
 7nDl+HOhQYoVUH59UtQLJaAa7CN+DqAbyPQYTDbWo6XkDfhBo94BfG24A+29mKQ/wP6lut
 rV2i+6S7pgHyxqcVBZ+OY7xYqgZBC4Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-jtOGQFFiMymdqmZN19T_Vw-1; Thu, 11 Nov 2021 05:04:20 -0500
X-MC-Unique: jtOGQFFiMymdqmZN19T_Vw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so938036wrj.0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 02:04:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6REFy2Z9s6d+bG385Dx3esh0VGm1oiX7Asv3HUk+NQ=;
 b=sISoAugcLWcT2iwGUgrJAeVclX7X210wHhTrcL8nywMivM7lobASFGuMGcFwHCzbZx
 UMXYT/HiK3L4SnLZQElhj0qK0H1k0k+U1DGHzPbWsX3FlErH9xAKTLHV4fcNRhZNhtBP
 0d5ACFVAjhsEhF5tLZ1+b7hzNJ6TvN7KoNFtw4kEUgkjI0jGTdGIJnhiIkyVuYR7Q8Pz
 lzBqWQ0xiFWtDK7i+pxOfp49LogztmQD2+e0ksIrxDezIUDaf96Fw+Pn/3BoHuUK+kWC
 Rb8jnVrjNWBBT8S5Z3XKwn2ttu4HL2qVbt3+LpqA407QQ1QIdsXr3esVal7EwDj2kv4y
 DaRw==
X-Gm-Message-State: AOAM531re3bJA95aB7hl2sfpptcNNaINdkAcMzcAl51E+AcENDrINc+g
 XYsu97NegUFIJSpiidS0cZDYATzK55kvGsC59hIcDOupCAViIbQFajilPUmAhx/8ql9KqFroDNJ
 oN8j38x8wMHqgXNkAf3WSS3Zh9OkDlVcWt4PjlzZ+FWpUt/YHiSqFTI6dzQeGwIg0
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr7402559wrt.31.1636625059454; 
 Thu, 11 Nov 2021 02:04:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYPottiScYoGYWMuBHI1kt1CFDM3B+TKHa93TDks3lkapvWVBg4p8N7CqCNRRw0CvNn/bbEQ==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr7402513wrt.31.1636625059207; 
 Thu, 11 Nov 2021 02:04:19 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 c1sm2499021wrt.14.2021.11.11.02.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 02:04:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v3 6/6] hw/core: Rename smp_parse() ->
 machine_parse_smp_config()
Date: Thu, 11 Nov 2021 11:03:51 +0100
Message-Id: <20211111100351.2153662-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111100351.2153662-1-philmd@redhat.com>
References: <20211111100351.2153662-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All methods related to MachineState are prefixed with "machine_".
smp_parse() does not need to be an exception. Rename it and
const'ify the SMPConfiguration argument, since it doesn't need
to be modified.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h         | 3 ++-
 hw/core/machine-smp.c       | 6 ++++--
 hw/core/machine.c           | 2 +-
 tests/unit/test-smp-parse.c | 8 ++++----
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9c1c1901046..7597cec4400 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -34,7 +34,8 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine);
 void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
-void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
+void machine_parse_smp_config(MachineState *ms,
+                              const SMPConfiguration *config, Error **errp);
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 116a0cbbfab..2cbfd574293 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -44,7 +44,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
 }
 
 /*
- * smp_parse - Generic function used to parse the given SMP configuration
+ * machine_parse_smp_config: Generic function used to parse the given
+ *                           SMP configuration
  *
  * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
  * automatically computed based on the provided ones.
@@ -63,7 +64,8 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
  * introduced topology members which are likely to be target specific should
  * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
  */
-void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
+void machine_parse_smp_config(MachineState *ms,
+                              const SMPConfiguration *config, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 26ec54e7261..a2d3c9969d9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -760,7 +760,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    smp_parse(ms, config, errp);
+    machine_parse_smp_config(ms, config, errp);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 11109752799..b158ebb16b1 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -337,7 +337,7 @@ static const struct SMPTestData data_with_dies_invalid[] = {
     },
 };
 
-static char *smp_config_to_string(SMPConfiguration *config)
+static char *smp_config_to_string(const SMPConfiguration *config)
 {
     return g_strdup_printf(
         "(SMPConfiguration) {\n"
@@ -371,7 +371,7 @@ static char *cpu_topology_to_string(const CpuTopology *topo)
         topo->cores, topo->threads, topo->max_cpus);
 }
 
-static void check_parse(MachineState *ms, SMPConfiguration *config,
+static void check_parse(MachineState *ms, const SMPConfiguration *config,
                         const CpuTopology *expect_topo, const char *expect_err,
                         bool is_valid)
 {
@@ -380,8 +380,8 @@ static void check_parse(MachineState *ms, SMPConfiguration *config,
     g_autofree char *output_topo_str = NULL;
     Error *err = NULL;
 
-    /* call the generic parser smp_parse() */
-    smp_parse(ms, config, &err);
+    /* call the generic parser */
+    machine_parse_smp_config(ms, config, &err);
 
     output_topo_str = cpu_topology_to_string(&ms->smp);
 
-- 
2.31.1


