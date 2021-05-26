Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41344392191
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:40:17 +0200 (CEST)
Received: from localhost ([::1]:39446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0K8-0005gY-7c
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02f-0007lE-HB; Wed, 26 May 2021 16:22:13 -0400
Received: from [201.28.113.2] (port=2123 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lm02d-00019i-Uo; Wed, 26 May 2021 16:22:13 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 26 May 2021 17:21:07 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id CD40E8013CA;
 Wed, 26 May 2021 17:21:07 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] monitor: removed cpustats command
Date: Wed, 26 May 2021 17:21:03 -0300
Message-Id: <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 26 May 2021 20:21:07.0963 (UTC)
 FILETIME=[A9372CB0:01D7526C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, Markus Armbruster <armbru@redhat.com>,
 richard.henderson@linaro.org, luis.pires@eldorado.org.br,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since ppc was the last architecture to collect these statistics and
it is currently phasing this collection out, the command that would query
this information is being removed.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 hmp-commands-info.hx | 13 -------------
 monitor/misc.c       | 11 -----------
 2 files changed, 24 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ab0c7aa5ee..b2347a6aea 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -500,19 +500,6 @@ SRST
     Show the current VM UUID.
 ERST
 
-    {
-        .name       = "cpustats",
-        .args_type  = "",
-        .params     = "",
-        .help       = "show CPU statistics",
-        .cmd        = hmp_info_cpustats,
-    },
-
-SRST
-  ``info cpustats``
-    Show CPU statistics.
-ERST
-
 #if defined(CONFIG_SLIRP)
     {
         .name       = "usernet",
diff --git a/monitor/misc.c b/monitor/misc.c
index f3a393ea59..1539e18557 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
-{
-    CPUState *cs = mon_get_cpu(mon);
-
-    if (!cs) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-    cpu_dump_statistics(cs, 0);
-}
-
 static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_try_str(qdict, "name");
-- 
2.17.1


