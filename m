Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE27475E42
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:11:46 +0100 (CET)
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXof-0008Ta-GU
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:11:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTO-0004f8-Jx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXTM-00021i-Hl
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639586984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmkMZOil0JU/xcw7wrU9Zc8Yh5vuQbVB83QLL1RhrjI=;
 b=SOtPnPmRvs4JVJrgkZAnotADK8idA307F/quyMNF5BvBg2sW91ioL4/z4TBzcfq42usOPM
 YhYqGR6xQik7x2o0tvzGID1eK+AeNxP5afkHn1JanOIh9S20jKEQ/Dafa3Wf0yz6zxNGEB
 QaQ3hgCDQDVAwqpkNt52MJgHQpe/Iq8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-SV9IztkVPd6RO8KCZHTGTQ-1; Wed, 15 Dec 2021 11:49:43 -0500
X-MC-Unique: SV9IztkVPd6RO8KCZHTGTQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n31-20020a05600c3b9f00b0034440f99123so2290248wms.7
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BmkMZOil0JU/xcw7wrU9Zc8Yh5vuQbVB83QLL1RhrjI=;
 b=MTjI+W1aDcDylvU6OE2PFcJK57A1SojQB9yOhpUFgz7DQwvzin0ATDPZm15IJL7tSy
 6ReXszt2mIZHkd3u2JsAB/jkxo9AMmuAbxaKRSH1Vg+YFZ4uNyNXZMMN2RqwqghCkTuA
 QmR/rc38GiunE8ATUdZ2UCt9aWdg5gO/0ESRl6GY78yUa6LvbOF4ZWuy54eqIZs5+Hgo
 XXN+KNnW4j9cOAGDUW+qOHbgM5IMa2zvMemzgswp1K6NqN3wzlwIJcM8CVkqsmAehPkl
 tUkASIsYNOFD8VsZgwv107EJNWHS77lBH0oAkTVCwgGiSJfBCrJI8D3OkGnOfXmvznhY
 f3Rw==
X-Gm-Message-State: AOAM530p5IkLaMdSQiFgbzMhBpLdE/MOZo17bWSeA2Hev5uh5fO9Af2J
 ngp0uh33ApnS4CfQZ3BlPBwlDlOPi++W6efsYp0nZZBMugYDkHPuth9+tjE9A0fRWiX7jjKqMmd
 ao+veQtYvVvJTWAC0uqhQ4vkMIMd3NnOeCx9W/bNWtUbYIfeWsd+h4czqd6gKb267
X-Received: by 2002:a1c:9dd4:: with SMTP id g203mr756594wme.114.1639586981631; 
 Wed, 15 Dec 2021 08:49:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlZgpxaYpwpnsenpIfwM7p0/811ln/m4JkvZxNNTIz/Wk3OCTK6xU55UsUS3mTrunITmJACQ==
X-Received: by 2002:a1c:9dd4:: with SMTP id g203mr756569wme.114.1639586981270; 
 Wed, 15 Dec 2021 08:49:41 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w17sm2605539wmc.14.2021.12.15.08.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:49:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 8/8] hw/core: Rename smp_parse() ->
 machine_parse_smp_config()
Date: Wed, 15 Dec 2021 17:48:56 +0100
Message-Id: <20211215164856.381990-9-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215164856.381990-1-philmd@redhat.com>
References: <20211215164856.381990-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
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
index 53a99abc560..3993c534b90 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -761,7 +761,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    smp_parse(ms, config, errp);
+    machine_parse_smp_config(ms, config, errp);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 1f26edc5f82..7f5c4ad222f 100644
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
2.33.1


