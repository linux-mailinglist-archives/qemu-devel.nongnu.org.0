Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557605191F6
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:59:05 +0200 (CEST)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1U0-0002QQ-BF
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nm0ZR-0001ie-6P
 for qemu-devel@nongnu.org; Tue, 03 May 2022 18:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nm0ZP-0003n5-EH
 for qemu-devel@nongnu.org; Tue, 03 May 2022 18:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651615234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRRBSuZMlS0NuMI/73XgyFnKvZLkb8oTAQ6CRh93DEU=;
 b=YM6bPOeUrgx9rditDNvoHLrjHGjHef6lLZIw16SFjg5S1TCds/C/TGLpElu7qJHNytiBvA
 eCUkf/5SlwweL/5aHKAGN0n6SnY4gtQ6MyT1X8LNO2ntmWmZZFNWIoMQC7CpM6k6xq+40S
 kZBaD3eGLOqg2L2uzrXRz7JdLC8YHUo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-VAeflOJkPlS2jXJcm5AQzQ-1; Tue, 03 May 2022 10:10:40 -0400
X-MC-Unique: VAeflOJkPlS2jXJcm5AQzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F367F1487994;
 Tue,  3 May 2022 14:03:56 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-47.pek2.redhat.com [10.72.12.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29FA0153AD00;
 Tue,  3 May 2022 14:03:47 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, Jonathan.Cameron@Huawei.com,
 drjones@redhat.com, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v9 4/6] qtest/numa-test: Correct CPU and NUMA association in
 aarch64_numa_cpu()
Date: Tue,  3 May 2022 22:03:02 +0800
Message-Id: <20220503140304.855514-5-gshan@redhat.com>
In-Reply-To: <20220503140304.855514-1-gshan@redhat.com>
References: <20220503140304.855514-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In aarch64_numa_cpu(), the CPU and NUMA association is something
like below. Two threads in the same core/cluster/socket are
associated with two individual NUMA nodes, which is unreal as
Igor Mammedov mentioned. We don't expect the association to break
NUMA-to-socket boundary, which matches with the real world.

    NUMA-node  socket  cluster   core   thread
    ------------------------------------------
        0       0        0        0      0
        1       0        0        0      1

This corrects the topology for CPUs and their association with
NUMA nodes. After this patch is applied, the CPU and NUMA
association becomes something like below, which looks real.
Besides, socket/cluster/core/thread IDs are all checked when
the NUMA node IDs are verified. It helps to check if the CPU
topology is properly populated or not.

    NUMA-node  socket  cluster   core   thread
    ------------------------------------------
       0        1        0        0       0
       1        0        0        0       0

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 tests/qtest/numa-test.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index aeda8c774c..32e35daaae 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -224,17 +224,17 @@ static void aarch64_numa_cpu(const void *data)
     g_autofree char *cli = NULL;
 
     cli = make_cli(data, "-machine "
-        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
+        "smp.cpus=2,smp.sockets=2,smp.clusters=1,smp.cores=1,smp.threads=1 "
         "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
-        "-numa cpu,node-id=1,thread-id=0 "
-        "-numa cpu,node-id=0,thread-id=1");
+        "-numa cpu,node-id=0,socket-id=1,cluster-id=0,core-id=0,thread-id=0 "
+        "-numa cpu,node-id=1,socket-id=0,cluster-id=0,core-id=0,thread-id=0");
     qts = qtest_init(cli);
     cpus = get_cpus(qts, &resp);
     g_assert(cpus);
 
     while ((e = qlist_pop(cpus))) {
         QDict *cpu, *props;
-        int64_t thread, node;
+        int64_t socket, cluster, core, thread, node;
 
         cpu = qobject_to(QDict, e);
         g_assert(qdict_haskey(cpu, "props"));
@@ -242,12 +242,18 @@ static void aarch64_numa_cpu(const void *data)
 
         g_assert(qdict_haskey(props, "node-id"));
         node = qdict_get_int(props, "node-id");
+        g_assert(qdict_haskey(props, "socket-id"));
+        socket = qdict_get_int(props, "socket-id");
+        g_assert(qdict_haskey(props, "cluster-id"));
+        cluster = qdict_get_int(props, "cluster-id");
+        g_assert(qdict_haskey(props, "core-id"));
+        core = qdict_get_int(props, "core-id");
         g_assert(qdict_haskey(props, "thread-id"));
         thread = qdict_get_int(props, "thread-id");
 
-        if (thread == 0) {
+        if (socket == 0 && cluster == 0 && core == 0 && thread == 0) {
             g_assert_cmpint(node, ==, 1);
-        } else if (thread == 1) {
+        } else if (socket == 1 && cluster == 0 && core == 0 && thread == 0) {
             g_assert_cmpint(node, ==, 0);
         } else {
             g_assert(false);
-- 
2.23.0


