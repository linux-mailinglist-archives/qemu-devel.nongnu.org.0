Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358166797E7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:25:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKILT-0004wH-UE; Tue, 24 Jan 2023 07:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHd-00024W-Ja
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pKIHN-0006Sa-Ax
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674562795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mBnxRdikimEViOMsZDCD4ZdXoeBVO5zZwlfSxnM5OEw=;
 b=TIiLC9lwr7K3P8yUjen19o/3FFxqBoByJOoNa2YNjPV7FU4peNvs8Im3XRfRZzdRJ1SG6h
 xb+wxx/ygY81YbgJBEtLuZbpbrVQeO7H0QlnWsPE84kkravlkMthVjUpkJfW8tk6BHUu+3
 xS/A30coLIzKklokEsEqqPUL4nvaQj8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-AhyXXLwEO1SlhSbXiHKAXw-1; Tue, 24 Jan 2023 07:19:51 -0500
X-MC-Unique: AhyXXLwEO1SlhSbXiHKAXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 199E080D0E3;
 Tue, 24 Jan 2023 12:19:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD36C14171B6;
 Tue, 24 Jan 2023 12:19:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DF27821E6884; Tue, 24 Jan 2023 13:19:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, kraxel@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, marcandre.lureau@redhat.com, dgilbert@redhat.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 jasowang@redhat.com, jiri@resnulli.us, berrange@redhat.com,
 thuth@redhat.com, quintela@redhat.com, stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com, kvm@vger.kernel.org, qemu-block@nongnu.org
Subject: [PATCH 31/32] monitor: Loosen coupling between misc.c and monitor.c
 slightly
Date: Tue, 24 Jan 2023 13:19:45 +0100
Message-Id: <20230124121946.1139465-32-armbru@redhat.com>
In-Reply-To: <20230124121946.1139465-1-armbru@redhat.com>
References: <20230124121946.1139465-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/misc.c                       | 8 +-------
 monitor/monitor.c                    | 2 +-
 storage-daemon/qemu-storage-daemon.c | 4 ++--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/monitor/misc.c b/monitor/misc.c
index 9ddf32da97..99317a8ff4 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -135,7 +135,7 @@ compare_mon_cmd(const void *a, const void *b)
             ((const HMPCommand *)b)->name);
 }
 
-static void sortcmdlist(void)
+static void __attribute__((__constructor__)) sortcmdlist(void)
 {
     qsort(hmp_cmds, ARRAY_SIZE(hmp_cmds) - 1,
           sizeof(*hmp_cmds),
@@ -176,9 +176,3 @@ void monitor_register_hmp_info_hrt(const char *name,
     }
     g_assert_not_reached();
 }
-
-void monitor_init_globals(void)
-{
-    monitor_init_globals_core();
-    sortcmdlist();
-}
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 0a990633d8..ca233ab80f 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -719,7 +719,7 @@ static void monitor_qapi_event_init(void)
                                                 qapi_event_throttle_equal);
 }
 
-void monitor_init_globals_core(void)
+void monitor_init_globals(void)
 {
     monitor_qapi_event_init();
     qemu_mutex_init(&monitor_lock);
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index da19498c66..0e9354faa6 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -299,7 +299,7 @@ static void process_options(int argc, char *argv[], bool pre_init_pass)
         case OPTION_DAEMONIZE:
             if (os_set_daemonize(true) < 0) {
                 /*
-                 * --daemonize is parsed before monitor_init_globals_core(), so
+                 * --daemonize is parsed before monitor_init_globals(), so
                  * error_report() does not work yet
                  */
                 fprintf(stderr, "--daemonize not supported in this build\n");
@@ -411,7 +411,7 @@ int main(int argc, char *argv[])
     qemu_add_opts(&qemu_trace_opts);
     qcrypto_init(&error_fatal);
     bdrv_init();
-    monitor_init_globals_core();
+    monitor_init_globals();
     init_qmp_commands();
 
     if (!trace_init_backends()) {
-- 
2.39.0


