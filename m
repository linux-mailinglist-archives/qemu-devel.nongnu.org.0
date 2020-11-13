Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FE22B1A3E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:45:59 +0100 (CET)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXWg-0006uI-3z
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUX-0005cP-B1
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUU-0002K8-Hj
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605267821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRVRcNv4+tjFJhFzhewOUlt0bAvmgJWDDBDw40oPn9M=;
 b=HWb2HZTnF9co92jGpr6eUyQ4f6/5SB5hwXyJqu24A6rigf9v0c/qZwYbZDqwS5gBD7PJKB
 7LEWZ7ZkgIbYJkjmpEwv6qhTpZx2gDLOHr7aRrfqROLdQVGfKdbuDwVcezn/E7zmmoxYes
 /HFnavNcHJU01g6uXF5ZjZj2pm9FwnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-YRtXoD-BMqmPIeSnoE9RRg-1; Fri, 13 Nov 2020 06:43:40 -0500
X-MC-Unique: YRtXoD-BMqmPIeSnoE9RRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3755F100854A;
 Fri, 13 Nov 2020 11:43:39 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1065B19C66;
 Fri, 13 Nov 2020 11:43:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 2/3] hmp: Pass monitor to MonitorDef.get_value()
Date: Fri, 13 Nov 2020 12:43:25 +0100
Message-Id: <20201113114326.97663-3-kwolf@redhat.com>
In-Reply-To: <20201113114326.97663-1-kwolf@redhat.com>
References: <20201113114326.97663-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, lichun@ruijie.com.cn, dgilbert@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of these callbacks use mon_get_cpu_env(). Pass the Monitor
pointer to them it in preparation for adding a monitor argument to
mon_get_cpu_env().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


