Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2E441664F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:01:42 +0200 (CEST)
Received: from localhost ([::1]:40718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTUub-0001p8-VN
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoe-0003vp-Kr
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:33 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:59503 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTUoc-0002vM-Qu
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 15:55:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMTQ6vqowlxoYooeEU0+aE38PHer4xuLhH+RGR/OYv7ipyGidSf98YVmOBinOiRU4nwHq5aTcKmOoupStQ7WUezrFxLfu++3J3B3LKQQEjQ4OPPHs76cy9ayPNL/zwF7VcCuCQ2K/Cu39PdQmlXvfNsGk5GNlZR2WsjF1x1JctMMTuUpUwFR1nMw5mbJWPlW7aOmHX6rUbkA3Yd3Z9athp0c9FODcWA+AQLRUnLOXoi3hjx7OOAQ7LgIqz053M3sd8thmyX0jae9TrwzKK5HidVo0Uu0GCv1+jo3DsEhVMaJ3l3MXn3/fJE/A/2zyfi+elbnrGB/36+NCofHxttI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=n5xHLu+cS5BgP1nfi59gq5iLHT6CRaFYZdUlZjcyW4I=;
 b=Z5kyWKGSX118aqtHaREmMH0nj1bua743fCklA94jUpOiZyCSPsRiQaNq5snR1BCAJ6efSPpyAUsd01l3FZ529ECF0opfhkpPPdLV1pisW+Ct8oC14a+Wy4VNSvJYQddEw2WRDlAfPD7urYn3wu0j5WAv9M3xsKA9FFp5LIqT1jTmzbgWPlWMFek+QLWomw6u62mhVdeqQGoVAXYp9xIsMnNgX4Cb39GPx7rwg2j8AWOKIK0kANlXVsuYZeeFf6QdO+PbgeJ5tX9DspJJpmuoore+lyhATr0BDREyYGMIZSB4U8LEG8jJITsjHKGVXXMOAlvCDldc2Z2wg7Bk8Ex9tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5xHLu+cS5BgP1nfi59gq5iLHT6CRaFYZdUlZjcyW4I=;
 b=va6XH52DkRifXjxvPgnxhXhaIu5lH84N8txVQFNuW9kH7AIXrYiel8aYrDp9WlxJqs4aqAaSV+3TTltHKiu+4jjOxW4hwyXEny6ikkKZ+gDGGaOq1+/kOi3La9HLAZCEyJB9XV3bZ6tZh/EDJaxzBT7jlPfXZ0JV3dJw1EUreU4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3224.eurprd08.prod.outlook.com (2603:10a6:209:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 19:55:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 19:55:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, pbonzini@redhat.com, michael.roth@amd.com,
 armbru@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 5/5] trace: add qmp trace event namespace
Date: Thu, 23 Sep 2021 22:54:51 +0300
Message-Id: <20210923195451.714796-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210923195451.714796-1-vsementsov@virtuozzo.com>
References: <20210923195451.714796-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from localhost.localdomain (185.215.60.205) by
 HE1P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:3:8b::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Thu, 23 Sep 2021 19:55:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ede4b29-5e63-4cc3-c034-08d97ecc0d90
X-MS-TrafficTypeDiagnostic: AM6PR08MB3224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3224C956BA40B43266A9B542C1A39@AM6PR08MB3224.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZVQrVXvD5MgJXfz01688y7GLuw9LXHsWh1l5eZ7Vug7ffdrBWtkO+wRSfE7p9L5HS6DKUZuM55YbzTFPetC2TNTQHCgtDBGZGRzwruH5pg8DrWk7AEYjjiC7jcn/Bl9lC3VG55A4pqiAHV08YGlF+RaWbCBp6Q1pqtiLpxN+SOyqe41zDSRRErxDrWYbwW6x1UXd9cYbRCAK7vC7ynpJAgEVE/c8ZRdW8yfoygJuSJoaTZRFrBsRHmdeFUu3bPYMsozK1U4d7CnL9pXODsEw5z+wHSbDJ/Z1EMz4ajuGTQodnUkP6XCVfjnPjgrpGepkMuboCrTgZAoEIVMmnVWyIAz6buvgsma3XiUmZt6pZrxXVbLVvCfE7mduuqN4K4QLNNL+HNJX1Na4VNwNn6w2QUmv7OOhaooRr/0jmyMLClxtuy86b0Vj6z81tZ8829VT5yl2IL/HtR8pqwf8sZVrSmreTeIyj7TOGBKu1MmQjgI3sqnUCqB6Xj5n2j3a1nRk0zwF8gx2WG5lqzC9LzPxQAmlea6m6nyn6rad76DwpixuSCpFqv41a3R0nJsEl2Awt2OEwOI+f53G9aP6OV2IGHV/t0eJXvlLA3aOrWXFad4WzzxTjMdh5QyMwZSusSVE7C/9AQNv0Eu7ajgm3aQVqluGdOkD82b8tC1NUh3XMonECiP1E+1iAfUcQMu4EVaZ1r/vOJcgjSiGjFLOLJefw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(508600001)(6486002)(5660300002)(38350700002)(38100700002)(86362001)(52116002)(36756003)(6666004)(66476007)(186003)(66946007)(66556008)(316002)(8676002)(8936002)(107886003)(956004)(2616005)(26005)(83380400001)(1076003)(6512007)(2906002)(4326008)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZuV51D3If6TUIa3xFdsoetekmAXuO24IVKQtsLDZkppz8MTGSH3SGVf/JSDO?=
 =?us-ascii?Q?b0MPFK2x/06rImtQhWVbV4h9vL0jRGyuO4/iv8pCe5WBvT1v8GYAKZeAtf1J?=
 =?us-ascii?Q?0cXZ5WuBaRmL94fC+MdadgIcIx8EiQWXYyivVrZi44niTBiOviPBSeJ+35+H?=
 =?us-ascii?Q?7L/aUENui4rbfzHhXwEVHM2Mf1PRHILd3l1y9P4g5xhlUFGnPpiElbM698NK?=
 =?us-ascii?Q?Zc8kMOgQtz/W7KMyHzGfMgFCo7BJVo57wHEWuvmFM6Ez1HGjjlj7ddSJnowI?=
 =?us-ascii?Q?bj+7Z+dONArm2PqxnCQzmhIuGUI347SlgTMDL99oUorAy7VBIpy0m+WCSsFE?=
 =?us-ascii?Q?2OU90kPi5Xxl+h0/FF9Yt4ghOUH4b5iQHFBrAU3vWA0FNjfG5BpC9gIAuHBW?=
 =?us-ascii?Q?zZfvzgibmJQK1k/nsyMYuEL+9fnA8r4sCeNQ/sDN5DmewGxXKMxCcBtE1dYU?=
 =?us-ascii?Q?Q3VPcYvLeanJSptU/0ltC34zLMMNB1hbWR30plY+tAwi4hnzExD/rBEdrRaR?=
 =?us-ascii?Q?Ak+c2mJb5l5HYSDoatxrHbHe7NxbT1ub4i8QoMVmsyRfqbvbmIDc/8LgFOaJ?=
 =?us-ascii?Q?wc4KkBRQeOlBfE1/WUP8Z9BDVUq0j4WS+n9YEK5qWsxIfmTdM2QG53+GN8x/?=
 =?us-ascii?Q?0Stc7XBwgsXjQHhicfvL8aaarJOD3KTOEszNzEQxkE51xJjP7j8AAbf8w1AL?=
 =?us-ascii?Q?n95N1zqso+FWueOQHQgr3Jyv97chadosb0EyPhdZGuAzsglQ2WJ8hp4GobIf?=
 =?us-ascii?Q?WQA+7xH1QCXOLHPLRJnYTNcKneAlZt+jZgvhxAjJn5XwrU36bVghBPiLxgIq?=
 =?us-ascii?Q?j7xNbnoKJITOPQj2Uc1q19Y0G1V/g54lmtnF2C6twsfIuRnrbzTbYSQy/JG1?=
 =?us-ascii?Q?vvXb528MCDbU80uPRALrb8quvh1FdXopZTwl3o8etOGrZYpOl1Hn5vEPIJei?=
 =?us-ascii?Q?ecIiV70NJygqHMe7FwNCwPLthJHSAfqC4W+QI2b+N9R3MgGVW4crOnMbBmVZ?=
 =?us-ascii?Q?GJhRLA5Bsh5JJSbthTdNjO4YxiyqybqdB9+7+cuvK6n4k5DLTX3qsP3iRzir?=
 =?us-ascii?Q?W+4OW0+AuHFXH/d5aw5ZWRtOSgTHv+JhHCLxnLJWB3OOapCUv4Fj8vdrZc5i?=
 =?us-ascii?Q?9AXbMg/+tp/TiqdRq+cu0/WAaV9egLDkp3ojY6E5s69CKPkWV5UKdAFY/IPN?=
 =?us-ascii?Q?9xjEsOQ06Z4GjsZYia1IarFWqX3Cnf/ztqVdaZ+K49vclB+Zk5xK9OQKWD/L?=
 =?us-ascii?Q?fXXDn0hUF8Nc1iSWXZwgl78wQFbDFAKDhJ2NIvnf/0FzETr6g9VYc01J0SEc?=
 =?us-ascii?Q?oW6M9NJP5qnye98/J2b4qTdq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ede4b29-5e63-4cc3-c034-08d97ecc0d90
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 19:55:11.7555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCb1P/1lOqWcvm3R0RdvtvCX1MnC2lcBMTtsnUxeL3y3n1CFixZsAbPvPCz0xm7FIdIRGYXa1qEKmCsm+88er7q88yTKtLdjvkQocG3+Ar0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3224
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a possibility to trace some qmp commands by user selection.

User API is simple: it looks like after this patch we have trace-points
for all qmp commands, in format "qmp:<qmp-command>". So user may do

  --trace qmp:drive-backup

or run qmp command trace-event-set-state with arguments

  name="qmp:drive-backup", enable=true

Patterns are supported in the same way as for general trace events, for
example:

  --trace "qmp:query-*"

to cover query-block, query-block-jobs, and a lot of other query-
commands

or

  --trace "qmp:job-*" --trace "qmp:block-job-*"

to cover job manipulation commands.

Trace event qmp covers both qmp command call and its respond.

Implementation details:

In qmp_dispatch() we add two trace points, similar to
trace_handle_qmp_command. We also check for cmd->tracking field being
set, and for handle-qmp-command/monitor-qmp-respond trace points being
disabled, to not print same information twice.

For qmp trace-event-{get,set}-state and for command line
parse additionally new "qmp:" namespace

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/qmp-dispatch.c | 20 ++++++++++++++++++++
 softmmu/vl.c        | 21 ++++++++++++++++++++-
 trace/qmp.c         | 20 ++++++++++++++++++++
 qapi/trace-events   |  2 ++
 4 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 59600210ce..40fd008fa8 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -26,6 +26,9 @@
 #include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 
+#include "trace.h"
+#include "trace/trace-monitor.h"
+
 CompatPolicy compat_policy;
 
 Visitor *qobject_input_visitor_new_qmp(QObject *obj)
@@ -133,6 +136,12 @@ static void do_qmp_dispatch_bh(void *opaque)
     aio_co_wake(data->co);
 }
 
+static void do_trace_qmp(const char *what, QObject *obj)
+{
+    g_autoptr(GString) req_json = qobject_to_json(obj);
+    trace_qmp(what, req_json->str);
+}
+
 /*
  * Runs outside of coroutine context for OOB commands, but in coroutine
  * context for everything else.
@@ -176,6 +185,11 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
                   "The command %s has not been found", command);
         goto out;
     }
+    if (!trace_event_get_state_backends(TRACE_HANDLE_QMP_COMMAND) &&
+        trace_event_get_state_backends(TRACE_QMP) && cmd->tracing)
+    {
+        do_trace_qmp(">>", request);
+    }
     if (cmd->options & QCO_DEPRECATED) {
         switch (compat_policy.deprecated_input) {
         case COMPAT_POLICY_INPUT_ACCEPT:
@@ -282,5 +296,11 @@ out:
         qdict_put_obj(rsp, "id", qobject_ref(id));
     }
 
+    if (!trace_event_get_state_backends(TRACE_MONITOR_QMP_RESPOND) &&
+        trace_event_get_state_backends(TRACE_QMP) && cmd->tracing)
+    {
+        do_trace_qmp("<<", QOBJECT(rsp));
+    }
+
     return rsp;
 }
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 55ab70eb97..fd452b7013 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2722,6 +2722,25 @@ void qmp_x_exit_preconfig(Error **errp)
     }
 }
 
+static void trace_opt_parse_with_qmp(const char *optarg)
+{
+    const char *pattern;
+    QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("trace"),
+                                             optarg, true);
+    if (!opts) {
+        exit(1);
+    }
+
+    pattern = qemu_opt_get(opts, "enable");
+    if (pattern && !strncmp(pattern, "qmp:", 4)) {
+        monitor_qmp_set_tracing(pattern + 4, true);
+        qemu_opt_del_all(opts, "enable");
+        qemu_opt_set(opts, "enable", "qmp", &error_abort);
+    }
+
+    trace_opt_parse_opts(opts);
+}
+
 void qemu_init(int argc, char **argv, char **envp)
 {
     QemuOpts *opts;
@@ -3480,7 +3499,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 xen_domid_restrict = true;
                 break;
             case QEMU_OPTION_trace:
-                trace_opt_parse(optarg);
+                trace_opt_parse_with_qmp(optarg);
                 break;
             case QEMU_OPTION_plugin:
                 qemu_plugin_opt_parse(optarg, &plugin_list);
diff --git a/trace/qmp.c b/trace/qmp.c
index 3b4f4702b4..87766422d9 100644
--- a/trace/qmp.c
+++ b/trace/qmp.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-trace.h"
 #include "control-vcpu.h"
+#include "monitor/monitor.h"
 
 
 static CPUState *get_cpu(bool has_vcpu, int vcpu, Error **errp)
@@ -77,6 +78,14 @@ TraceEventInfoList *qmp_trace_event_get_state(const char *name,
     bool is_pattern = trace_event_is_pattern(name);
     CPUState *cpu;
 
+    if (!strncmp(name, "qmp:", 4)) {
+        if (!monitor_qmp_is_tracing_enabled(name + 4)) {
+            return NULL;
+        }
+
+        return qmp_trace_event_get_state("qmp", has_vcpu, vcpu, errp);
+    }
+
     /* Check provided vcpu */
     cpu = get_cpu(has_vcpu, vcpu, &err);
     if (err) {
@@ -139,6 +148,17 @@ void qmp_trace_event_set_state(const char *name, bool enable,
     bool is_pattern = trace_event_is_pattern(name);
     CPUState *cpu;
 
+    if (!strncmp(name, "qmp:", 4)) {
+        monitor_qmp_set_tracing(name + 4, enable);
+
+        if (enable || !monitor_qmp_is_tracing_enabled(NULL)) {
+            qmp_trace_event_set_state("qmp", enable, has_ignore_unavailable,
+                                      ignore_unavailable, has_vcpu, vcpu, errp);
+        }
+
+        return;
+    }
+
     /* Check provided vcpu */
     cpu = get_cpu(has_vcpu, vcpu, &err);
     if (err) {
diff --git a/qapi/trace-events b/qapi/trace-events
index cccafc07e5..753433856c 100644
--- a/qapi/trace-events
+++ b/qapi/trace-events
@@ -36,3 +36,5 @@ visit_type_str(void *v, const char *name, char **obj) "v=%p name=%s obj=%p"
 visit_type_number(void *v, const char *name, void *obj) "v=%p name=%s obj=%p"
 visit_type_any(void *v, const char *name, void *obj) "v=%p name=%s obj=%p"
 visit_type_null(void *v, const char *name, void *obj) "v=%p name=%s obj=%p"
+
+qmp(const char *what, const char *json) "%s %s"
-- 
2.29.2


