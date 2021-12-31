Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32903482422
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 14:13:27 +0100 (CET)
Received: from localhost ([::1]:52496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Hio-0007Jm-Bf
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 08:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HL5-0006dv-A8
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HL3-0000mQ-K2
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsVRkZQQlYo23KD5v3C/Ge6K5dTEdtnnVoVPT34mCE4=;
 b=XRg5555KL3mJN8P7EXKHxqqqPfwXEB6El61resA6pIdMhoRyg4Nvp9nNGTfyhdW9oo/55c
 GF23gSDUsHrtVU+l/tOLwvABL+kg8Pd2T/L2ctX6AEJ7SYn4ERXNr1k6A68WxVKhKzFmTT
 hrrfsGXMACeYlPdU0A130tlRI/MaqKw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-72V_Ud6KPriyDUZ-vRfgTQ-1; Fri, 31 Dec 2021 07:48:49 -0500
X-MC-Unique: 72V_Ud6KPriyDUZ-vRfgTQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so7495399wrm.8
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hsVRkZQQlYo23KD5v3C/Ge6K5dTEdtnnVoVPT34mCE4=;
 b=c0AVyJ09s81CRfignbEmZnvKvyABrIOTsAhZfr/zZfefHWpA66JIdm+7rNrm/4ldbO
 kSu3AJlmNxJPnzsS9ZLqsUeEE9myOxRg73qQCcnrOrMo8FW6tW1C2ibuxUK6lWSu7iy7
 FxnJQHub+6XB52WDpXXMwjToZ10N3rE2fczHtuDU7hdDaVD4D/invLzEcbwJ7IO+GU5j
 FHYfiLxg9V0v8KpoQuUD43Ygi5DwD+CcARZB3N0ABmWFC4PfQHEalWgpksYbTT2s5GzU
 IJ9Z3brBpk56noZMMDrOZVbYsWfY6GK0vgKFC9MJoYJ3TYVOESOJIfMD9GyWnv3eILb9
 zTUg==
X-Gm-Message-State: AOAM533lBj3pHbd8/2ogx6ZRxIauVAymNU078SZdfBwLe6AiGs/oeHid
 wEbSuJP+9uiV0v/G1LSYMKxOiRgLjJdoM7PddPr1SWKPqwFwRG5VROYLoYInZHQiPk0gg4b0jsx
 x//Q4PMiwnx4YTaF4gjHpiUTRSslN4+JKKSqAUexviHITxkMQ8sU32XQkBBz21Kn4
X-Received: by 2002:a5d:5610:: with SMTP id l16mr6398378wrv.418.1640954928346; 
 Fri, 31 Dec 2021 04:48:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyieMidFLfH0xBtqYWhHJ0rm5v6YpWRS1mJ4KxW21ZPG/WM6HPzrQIEfgaoZwPKPzPnbCpaUQ==
X-Received: by 2002:a5d:5610:: with SMTP id l16mr6398363wrv.418.1640954928129; 
 Fri, 31 Dec 2021 04:48:48 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id y8sm29630532wrd.10.2021.12.31.04.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] hw/core: Rename smp_parse() -> machine_parse_smp_config()
Date: Fri, 31 Dec 2021 13:47:46 +0100
Message-Id: <20211231124754.1005747-13-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
Message-Id: <20211216132015.815493-9-philmd@redhat.com>
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
index 0f98c9509ee..b6df8137fcc 100644
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


