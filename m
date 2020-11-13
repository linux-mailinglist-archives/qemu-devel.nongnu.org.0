Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D22B1A44
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:47:27 +0100 (CET)
Received: from localhost ([::1]:52770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXY6-0000U3-K8
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUZ-0005dJ-Ar
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUX-0002KS-3j
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605267823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5OYhOc5ppiWBoPI3JSw5pDI4RwPxTFJaUZCuI4Ayw8=;
 b=LoAR/9Ohp7EFl6zZh00p+037U60hslqH3nl7+rJSMQARxLtgMz3l3mXGVYlX+y9pGq6p9t
 +D8T7czd+cYqeGhI27iGRi7Foep1zmge++edUYdiHAFncI4zMBfx2A9YtD78qZ7bM+qf4P
 nUQuTpGv9CdWI1fbJSCKzxqpcMrH6Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-K_VUgIR6N_SgLVzY5kjkLQ-1; Fri, 13 Nov 2020 06:43:41 -0500
X-MC-Unique: K_VUgIR6N_SgLVzY5kjkLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82951008542;
 Fri, 13 Nov 2020 11:43:40 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80EB619C66;
 Fri, 13 Nov 2020 11:43:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 3/3] hmp: Pass monitor to mon_get_cpu_env()
Date: Fri, 13 Nov 2020 12:43:26 +0100
Message-Id: <20201113114326.97663-4-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

mon_get_cpu_env() is indirectly called monitor_parse_arguments() where
the current monitor isn't set yet. Instead of using monitor_cur_env(),
explicitly pass the Monitor pointer to the function.

Without this fix, an HMP command like "x $pc" crashes like this:

  #0  0x0000555555caa01f in mon_get_cpu_sync (mon=0x0, synchronize=true) at ../monitor/misc.c:270
  #1  0x0000555555caa141 in mon_get_cpu (mon=0x0) at ../monitor/misc.c:294
  #2  0x0000555555caa158 in mon_get_cpu_env () at ../monitor/misc.c:299
  #3  0x0000555555b19739 in monitor_get_pc (mon=0x555556ad2de0, md=0x5555565d2d40 <monitor_defs+1152>, val=0) at ../target/i386/monitor.c:607
  #4  0x0000555555cadbec in get_monitor_def (mon=0x555556ad2de0, pval=0x7fffffffc208, name=0x7fffffffc220 "pc") at ../monitor/misc.c:1681
  #5  0x000055555582ec4f in expr_unary (mon=0x555556ad2de0) at ../monitor/hmp.c:387
  #6  0x000055555582edbb in expr_prod (mon=0x555556ad2de0) at ../monitor/hmp.c:421
  #7  0x000055555582ee79 in expr_logic (mon=0x555556ad2de0) at ../monitor/hmp.c:455
  #8  0x000055555582eefe in expr_sum (mon=0x555556ad2de0) at ../monitor/hmp.c:484
  #9  0x000055555582efe8 in get_expr (mon=0x555556ad2de0, pval=0x7fffffffc418, pp=0x7fffffffc408) at ../monitor/hmp.c:511
  #10 0x000055555582fcd4 in monitor_parse_arguments (mon=0x555556ad2de0, endp=0x7fffffffc890, cmd=0x555556675b50 <hmp_cmds+7920>) at ../monitor/hmp.c:876
  #11 0x00005555558306a8 in handle_hmp_command (mon=0x555556ad2de0, cmdline=0x555556ada452 "$pc") at ../monitor/hmp.c:1087
  #12 0x000055555582df14 in monitor_command_cb (opaque=0x555556ad2de0, cmdline=0x555556ada450 "x $pc", readline_opaque=0x0) at ../monitor/hmp.c:47

After this fix, nothing is left in monitor_parse_arguments() that can
indirectly call monitor_cur(), so the fix is complete.

Fixes: ff04108a0e36e822519c517bd3bddbc1c7747c18
Reported-by: lichun <lichun@ruijie.com.cn>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/monitor/hmp-target.h |  2 +-
 monitor/misc.c               |  6 +++---
 target/i386/monitor.c        |  6 +++---
 target/m68k/monitor.c        |  2 +-
 target/nios2/monitor.c       |  2 +-
 target/ppc/monitor.c         | 10 +++++-----
 target/riscv/monitor.c       |  2 +-
 target/sh4/monitor.c         |  2 +-
 target/sparc/monitor.c       |  6 +++---
 target/xtensa/monitor.c      |  2 +-
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 385fb18664..60fc92722a 100644
--- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -41,7 +41,7 @@ struct MonitorDef {
 const MonitorDef *target_monitor_defs(void);
 int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval);
 
-CPUArchState *mon_get_cpu_env(void);
+CPUArchState *mon_get_cpu_env(Monitor *mon);
 CPUState *mon_get_cpu(Monitor *mon);
 
 void hmp_info_mem(Monitor *mon, const QDict *qdict);
diff --git a/monitor/misc.c b/monitor/misc.c
index f566e28174..398211a034 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -294,9 +294,9 @@ CPUState *mon_get_cpu(Monitor *mon)
     return mon_get_cpu_sync(mon, true);
 }
 
-CPUArchState *mon_get_cpu_env(void)
+CPUArchState *mon_get_cpu_env(Monitor *mon)
 {
-    CPUState *cs = mon_get_cpu(monitor_cur());
+    CPUState *cs = mon_get_cpu(mon);
 
     return cs ? cs->env_ptr : NULL;
 }
@@ -1680,7 +1680,7 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name)
             if (md->get_value) {
                 *pval = md->get_value(mon, md, md->offset);
             } else {
-                CPUArchState *env = mon_get_cpu_env();
+                CPUArchState *env = mon_get_cpu_env(mon);
                 ptr = (uint8_t *)env + md->offset;
                 switch(md->type) {
                 case MD_I32:
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index fed4606aeb..9f9e1c42f4 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -222,7 +222,7 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env;
 
-    env = mon_get_cpu_env();
+    env = mon_get_cpu_env(mon);
     if (!env) {
         monitor_printf(mon, "No CPU available\n");
         return;
@@ -550,7 +550,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env;
 
-    env = mon_get_cpu_env();
+    env = mon_get_cpu_env(mon);
     if (!env) {
         monitor_printf(mon, "No CPU available\n");
         return;
@@ -604,7 +604,7 @@ void hmp_mce(Monitor *mon, const QDict *qdict)
 static target_long monitor_get_pc(Monitor *mon, const struct MonitorDef *md,
                                   int val)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
     return env->eip + env->segs[R_CS].base;
 }
 
diff --git a/target/m68k/monitor.c b/target/m68k/monitor.c
index 2055fe8a00..2bdf6acae0 100644
--- a/target/m68k/monitor.c
+++ b/target/m68k/monitor.c
@@ -12,7 +12,7 @@
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env();
+    CPUArchState *env1 = mon_get_cpu_env(mon);
 
     if (!env1) {
         monitor_printf(mon, "No CPU available\n");
diff --git a/target/nios2/monitor.c b/target/nios2/monitor.c
index 6646836df5..0152dec3fa 100644
--- a/target/nios2/monitor.c
+++ b/target/nios2/monitor.c
@@ -29,7 +29,7 @@
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env();
+    CPUArchState *env1 = mon_get_cpu_env(mon);
 
     dump_mmu(env1);
 }
diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
index 9c0fc2b8c3..a475108b2d 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/monitor.c
@@ -32,7 +32,7 @@
 static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
     unsigned int u;
     int i;
 
@@ -47,27 +47,27 @@ static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
 static target_long monitor_get_decr(Monitor *mon, const struct MonitorDef *md,
                                     int val)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
     return cpu_ppc_load_decr(env);
 }
 
 static target_long monitor_get_tbu(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
     return cpu_ppc_load_tbu(env);
 }
 
 static target_long monitor_get_tbl(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
     return cpu_ppc_load_tbl(env);
 }
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env();
+    CPUArchState *env1 = mon_get_cpu_env(mon);
 
     if (!env1) {
         monitor_printf(mon, "No CPU available\n");
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index b569f08387..e51188f919 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -204,7 +204,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
 {
     CPUArchState *env;
 
-    env = mon_get_cpu_env();
+    env = mon_get_cpu_env(mon);
     if (!env) {
         monitor_printf(mon, "No CPU available\n");
         return;
diff --git a/target/sh4/monitor.c b/target/sh4/monitor.c
index 918a5ccfc6..2da6a5426e 100644
--- a/target/sh4/monitor.c
+++ b/target/sh4/monitor.c
@@ -41,7 +41,7 @@ static void print_tlb(Monitor *mon, int idx, tlb_t *tlb)
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
     int i;
 
     if (!env) {
diff --git a/target/sparc/monitor.c b/target/sparc/monitor.c
index bf979d6520..318413686a 100644
--- a/target/sparc/monitor.c
+++ b/target/sparc/monitor.c
@@ -30,7 +30,7 @@
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env();
+    CPUArchState *env1 = mon_get_cpu_env(mon);
 
     if (!env1) {
         monitor_printf(mon, "No CPU available\n");
@@ -43,7 +43,7 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 static target_long monitor_get_psr(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
 
     return cpu_get_psr(env);
 }
@@ -52,7 +52,7 @@ static target_long monitor_get_psr(Monitor *mon, const struct MonitorDef *md,
 static target_long monitor_get_reg(Monitor *mon, const struct MonitorDef *md,
                                    int val)
 {
-    CPUArchState *env = mon_get_cpu_env();
+    CPUArchState *env = mon_get_cpu_env(mon);
     return env->regwptr[val];
 }
 
diff --git a/target/xtensa/monitor.c b/target/xtensa/monitor.c
index 608173c238..fbf60d5553 100644
--- a/target/xtensa/monitor.c
+++ b/target/xtensa/monitor.c
@@ -29,7 +29,7 @@
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env1 = mon_get_cpu_env();
+    CPUArchState *env1 = mon_get_cpu_env(mon);
 
     if (!env1) {
         monitor_printf(mon, "No CPU available\n");
-- 
2.28.0


