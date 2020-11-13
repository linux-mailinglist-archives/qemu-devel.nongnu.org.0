Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678442B1BA5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:12:54 +0100 (CET)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdYsn-0000Xb-Fr
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdYmB-0003Dh-SL
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:06:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdYm6-0006Hj-Ri
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605272758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wi1gCER/sMXrpOUUt52ziLtoq642D4Mj1o4pyeBFpvs=;
 b=Z3iciUikoAILD6eDU2dp3Jj3OLKLTySuGSVJT28RDU1zVGyn3t+1hC+95ZnKr99zO1H0Di
 L3sc+Y1CH/TwOIinUVbLDgUHo+Z9AarfEzMFi43BD12VjtquvAS5tnPZA7OaPlvBf/m6Ye
 wrKKQ+650JNcVbukTFsMKS/MwL4PeCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-HS_gNCouMOSnBHgx6JZPlQ-1; Fri, 13 Nov 2020 08:05:56 -0500
X-MC-Unique: HS_gNCouMOSnBHgx6JZPlQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0489D8030D9;
 Fri, 13 Nov 2020 13:05:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E815C1C7;
 Fri, 13 Nov 2020 13:05:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	kwolf@redhat.com,
	lichun@ruijie.com.cn
Subject: [PULL 2/3] hmp: Pass monitor to MonitorDef.get_value()
Date: Fri, 13 Nov 2020 13:05:47 +0000
Message-Id: <20201113130548.127093-3-dgilbert@redhat.com>
In-Reply-To: <20201113130548.127093-1-dgilbert@redhat.com>
References: <20201113130548.127093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

All of these callbacks use mon_get_cpu_env(). Pass the Monitor
pointer to them it in preparation for adding a monitor argument to
mon_get_cpu_env().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201113114326.97663-3-kwolf@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/monitor/hmp-target.h |  3 ++-
 monitor/misc.c               |  2 +-
 target/i386/monitor.c        |  3 ++-
 target/ppc/monitor.c         | 12 ++++++++----
 target/sparc/monitor.c       |  6 ++++--
 5 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 519616d1fb..385fb18664 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -33,7 +33,8 @@
 struct MonitorDef {
     const char *name;
     int offset;
-    target_long (*get_value)(const struct MonitorDef *md, int val);
+    target_long (*get_value)(Monitor *mon, const struct MonitorDef *md,
+                             int val);
     int type;
 };
 
diff --git a/monitor/misc.c b/monitor/misc.c
index c918d6bd08..f566e28174 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1678,7 +1678,7 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name)
     for(; md->name != NULL; md++) {
         if (hmp_compare_cmd(name, md->name)) {
             if (md->get_value) {
-                *pval = md->get_value(md, md->offset);
+                *pval = md->get_value(mon, md, md->offset);
             } else {
                 CPUArchState *env = mon_get_cpu_env();
                 ptr = (uint8_t *)env + md->offset;
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 5ca3cab4ec..fed4606aeb 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -601,7 +601,8 @@ void hmp_mce(Monitor *mon, const QDict *qdict)
     }
 }
 
-static target_long monitor_get_pc(const struct MonitorDef *md, int val)
+static target_long monitor_get_pc(Monitor *mon, const struct MonitorDef *md,
+                                  int val)
 {
     CPUArchState *env = mon_get_cpu_env();
     return env->eip + env->segs[R_CS].base;
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index a5a177d717..9c0fc2b8c3 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -29,7 +29,8 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 
-static target_long monitor_get_ccr(const struct MonitorDef *md, int val)
+static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
+                                   int val)
 {
     CPUArchState *env = mon_get_cpu_env();
     unsigned int u;
@@ -43,19 +44,22 @@ static target_long monitor_get_ccr(const struct MonitorDef *md, int val)
     return u;
 }
 
-static target_long monitor_get_decr(const struct MonitorDef *md, int val)
+static target_long monitor_get_decr(Monitor *mon, const struct MonitorDef *md,
+                                    int val)
 {
     CPUArchState *env = mon_get_cpu_env();
     return cpu_ppc_load_decr(env);
 }
 
-static target_long monitor_get_tbu(const struct MonitorDef *md, int val)
+static target_long monitor_get_tbu(Monitor *mon, const struct MonitorDef *md,
+                                   int val)
 {
     CPUArchState *env = mon_get_cpu_env();
     return cpu_ppc_load_tbu(env);
 }
 
-static target_long monitor_get_tbl(const struct MonitorDef *md, int val)
+static target_long monitor_get_tbl(Monitor *mon, const struct MonitorDef *md,
+                                   int val)
 {
     CPUArchState *env = mon_get_cpu_env();
     return cpu_ppc_load_tbl(env);
diff --git a/target/sparc/monitor.c b/target/sparc/monitor.c
index a7ea287cbc..bf979d6520 100644
--- a/target/sparc/monitor.c
+++ b/target/sparc/monitor.c
@@ -40,7 +40,8 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 }
 
 #ifndef TARGET_SPARC64
-static target_long monitor_get_psr (const struct MonitorDef *md, int val)
+static target_long monitor_get_psr(Monitor *mon, const struct MonitorDef *md,
+                                   int val)
 {
     CPUArchState *env = mon_get_cpu_env();
 
@@ -48,7 +49,8 @@ static target_long monitor_get_psr (const struct MonitorDef *md, int val)
 }
 #endif
 
-static target_long monitor_get_reg(const struct MonitorDef *md, int val)
+static target_long monitor_get_reg(Monitor *mon, const struct MonitorDef *md,
+                                   int val)
 {
     CPUArchState *env = mon_get_cpu_env();
     return env->regwptr[val];
-- 
2.28.0


