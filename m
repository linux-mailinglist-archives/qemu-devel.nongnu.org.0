Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4924507E9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:10:36 +0100 (CET)
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdcy-0001sy-0o
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:10:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSj-00085s-9j
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:00:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmdSg-00009c-Tw
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 10:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yztInNsLIu7QfwRSSpxpOx1pYZAWme74L6OF+WOPa2U=;
 b=czzeCmOYeZgVB+OIteWAilpYgM2dwifo6SNZKC6X4d/l6DSEo0s5Kislst+F/4zFk18uxs
 UpuzEuTgRtxqxFnF5PhXXog+AZH53fXPEkF71LG8UT3u3vDQGEhb+J6KBMXas7jKCxYqOD
 Wo0Qh2HYIUKYDq/vYERgWRQoq7V0dmk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-A1KH5rYPNdy6oxzC31rLGg-1; Mon, 15 Nov 2021 09:59:53 -0500
X-MC-Unique: A1KH5rYPNdy6oxzC31rLGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so15104wmb.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yztInNsLIu7QfwRSSpxpOx1pYZAWme74L6OF+WOPa2U=;
 b=WeBOc3m2/MztOeCmD5+paVgv9gyBfDeFOmlj5TH05ZUIyuUnNMUT1Na2Rtk+TSG2oY
 nAlozcVGraS/wv4DZLKGlZda13mqIlsGodOhkjETP3kHgpV+DJUpLm0E6EYKSOL7LppU
 VKJdmdORApbHNRKJgwOXKegrtd3of+6IUA/lBFUdgdAOrYEzLQHnxLLaesvr2e5bZNp4
 yhWe1QaTRs0yxHF4RPafp2LxTiFaSeHuhPPCO9PkZC/8l3QhDe1XEsvLGW8ASlmcR2Mh
 GpqAPglgPiYXbI7t4FOp6a9ogrt/499irXdfi9xxXPsaIUO8x++ZrS5RqhnJ0hPLebUY
 kCcQ==
X-Gm-Message-State: AOAM533frKDEGJwrRTBBhINvJvWYRAO25OCn0ZAkfRhpws1pK07aZD03
 LMLvympUTRxEqJMqi6u3ImN0My68yvKJ5RCyIPDSHAN8ULTU8KhmcQyRS7BSFYSMU3ev/cecWsa
 VDdUM0lIeyBkuVKHh5TlYBim5M3XNdzUIISBTwgMMcDCCEEgbEFi/PJaA1wqgnRd9
X-Received: by 2002:a5d:4582:: with SMTP id p2mr48488339wrq.364.1636988390728; 
 Mon, 15 Nov 2021 06:59:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIoKRUnjRgOgfAroUSLRHpDuDgLBussq3AjSBId67KMcnGz8tMSA1Y3CIZq7AyxOb0lKUIOw==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr48488287wrq.364.1636988390476; 
 Mon, 15 Nov 2021 06:59:50 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l8sm22753146wmc.40.2021.11.15.06.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:59:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 v4 11/11] hw/core: Rename smp_parse() ->
 machine_parse_smp_config()
Date: Mon, 15 Nov 2021 15:59:00 +0100
Message-Id: <20211115145900.2531865-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115145900.2531865-1-philmd@redhat.com>
References: <20211115145900.2531865-1-philmd@redhat.com>
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All methods related to MachineState are prefixed with "machine_".
smp_parse() does not need to be an exception. Rename it and
const'ify the SMPConfiguration argument, since it doesn't need
to be modified.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
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
index 8f47a2e65f6..8e488e95145 100644
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


