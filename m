Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42595B9F35
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:53:27 +0200 (CEST)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYrB7-0005EY-VG
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYr4J-00071Z-RE
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYr4G-0008Vm-QS
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663256779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LxQewR1hp0sGEmZIwN4/53x7yQJkqndktd3+rpDkPXo=;
 b=NV6zrvwmgwlIyoY8Zxb6sjdXz6nQqy58OXu0/rHHfwPdWPdgR645sMOnby2C4TVkT0vbrN
 SOrhBUwi+4BcTOQ9giklNABvMt5CgsOyll8nZY8KiAAv64k4A9ioHXmiPinUVivuhOowQ8
 VSDRoEE9E8b0uLXLtnNxaPda3M63MuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-gEkpduqvOV6cB52zUNcu3Q-1; Thu, 15 Sep 2022 11:46:16 -0400
X-MC-Unique: gEkpduqvOV6cB52zUNcu3Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B0B188B7A8;
 Thu, 15 Sep 2022 15:46:16 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E6F492B04;
 Thu, 15 Sep 2022 15:46:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pizhenwei@bytedance.com,
	dongli.zhang@oracle.com
Cc: armbru@redhat.com
Subject: [PULL 1/3] monitor: Support specified vCPU registers
Date: Thu, 15 Sep 2022 16:46:04 +0100
Message-Id: <20220915154606.124713-2-dgilbert@redhat.com>
In-Reply-To: <20220915154606.124713-1-dgilbert@redhat.com>
References: <20220915154606.124713-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhenwei pi <pizhenwei@bytedance.com>

Originally we have to get all the vCPU registers and parse the
specified one. To improve the performance of this usage, allow user
specified vCPU id to query registers.

Run a VM with 16 vCPU, use bcc tool to track the latency of
'hmp_info_registers':
'info registers -a' uses about 3ms;
'info registers 12' uses about 150us.

Cc: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Message-Id: <20220802073720.1236988-2-pizhenwei@bytedance.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp-commands-info.hx |  8 +++++---
 monitor/misc.c       | 10 ++++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 188d9ece3b..e012035541 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -100,9 +100,11 @@ ERST
 
     {
         .name       = "registers",
-        .args_type  = "cpustate_all:-a",
-        .params     = "[-a]",
-        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
+        .args_type  = "cpustate_all:-a,vcpu:i?",
+        .params     = "[-a|vcpu]",
+        .help       = "show the cpu registers (-a: show register info for all cpus;"
+                      " vcpu: specific vCPU to query; show the current CPU's registers if"
+                      " no argument is specified)",
         .cmd        = hmp_info_registers,
     },
 
diff --git a/monitor/misc.c b/monitor/misc.c
index 3d2312ba8d..6436a8786b 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
 static void hmp_info_registers(Monitor *mon, const QDict *qdict)
 {
     bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
+    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
     CPUState *cs;
 
     if (all_cpus) {
@@ -315,13 +316,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
             cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
         }
     } else {
-        cs = mon_get_cpu(mon);
+        cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);
 
         if (!cs) {
-            monitor_printf(mon, "No CPU available\n");
+            if (vcpu >= 0) {
+                monitor_printf(mon, "CPU#%d not available\n", vcpu);
+            } else {
+                monitor_printf(mon, "No CPU available\n");
+            }
             return;
         }
 
+        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
         cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
     }
 }
-- 
2.37.3


