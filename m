Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3EE4962C9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:29:52 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwnP-0006hj-2n
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwi8-0000tv-G5
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:24:24 -0500
Received: from mail-eopbgr50098.outbound.protection.outlook.com
 ([40.107.5.98]:38734 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nAwi1-0007rD-Gc
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:24:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaWQBBo6rWhEHFpt0aOZptfXgYqlYuPnG3BUfDZpHpGK1+/xdC7GsOqknDfpbMVS0U3zyfASsp9BsePkynb7558feJKNazQ3t78ZlUGYbgOMf7HE/jt78dWe23iKKjYvusvTzGarlhso8RWBnYFMMyt14QmBTAEvkLNWoLimL8S+3Gbu8l68Vx1gS2SXS+dohwKKcLhie+d0yIMIZrHkTmDzv0OqiCS7VQBnIRUk+t7YmEradBpT45d7QC4XioTsTGUZCSOdrA0q0tdm8FafWb452orkJUZZp5e66R9D5stxzaq9TDyk7lqtMXz/7tlJXcUdu6bVkgPwd2B6sQeuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1S1zeiQ1YayZ59HwuJKdygmzD0H0zpAnUGGEopecOg=;
 b=H90y6DJUKJ7b21FJZ6UVFcHce+AYe6MqRwDHollKAO7OTIaXvOr0Icl4OVx0Y9kYL/drxMpM3QO56ELL71tIp4AjR5t4DwvLPLI3//j6zwq+Lp+h5EPuf8AshNLYm2KZinP2gb6JRCcO6Zo/glc7G5aBBvoSCT/JDlD9KhFl3w3/oEA3mit0xnqvVhqj7kIemxjHolD/pDTXS73KIYvXOqUM11N0XKdbXdvlO+WOSBI1jKNu0lGoNcKH3jxADu2WnauaySFHMvJEtwR4PvXNu4atmaXttGxrz1abPml6oD/2r5E4ARSYTH9m12mqbXcIEwNEgHioK/bT2ifU4MUzlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1S1zeiQ1YayZ59HwuJKdygmzD0H0zpAnUGGEopecOg=;
 b=iZZBFq3nbuZlLxgFjam0kdWlNIRzruxMy8lKbLHx65sikq4+a8ltcA/QsCUgC0ZrKpTuQwGzXNGXEU0pnR6Omuhz/Njj2CTPzRU2H1mkTrKOKf4i2uy+ScYqoMX2QBRjlLnx7wV94AcLVXKWtjIujguAP/BYL9zwMoEkBGrPz0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM6PR08MB4006.eurprd08.prod.outlook.com (2603:10a6:20b:a9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 16:22:47 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 16:22:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 3/3] meson: generate trace events for qmp commands
Date: Fri, 21 Jan 2022 17:22:34 +0100
Message-Id: <20220121162234.2707906-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
References: <20220121162234.2707906-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0016.eurprd04.prod.outlook.com
 (2603:10a6:203:90::26) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e456217c-884e-4a8c-b5b0-08d9dcfa4315
X-MS-TrafficTypeDiagnostic: AM6PR08MB4006:EE_
X-Microsoft-Antispam-PRVS: <AM6PR08MB4006FA084FA73A858CED14B9C15B9@AM6PR08MB4006.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUrBv1bsx96WUnNEB5WreL9zXWaiqwOyPF1z/j54Xq1GDhe5NkI0FC4H916dbNQmdM4PUXyKKMKLNOLQ92NOVYQmRLnDWGRwRY6+BZi52Z5yrjL1JIEKbq5lx+tMHncSk+30hgLH0T2fJsbploZTaDfQDocMwNgTtKvAIhuGK9ZtuTCok0O8mcdDIs5fDScnA2pb6z2nEMs5gbfB2YZ4mYV7WnbREWhLYxfJaW4186VeQdVFbTfBnzCcmYTZtruzgxD4L412AfYBvJ7jv7LP1H1gXxY1Q5XAcXPbURk/jOs7oBb0Fi1LtHsQ2J3Bay0B+pTxszCHWrVL6PuSNoaHYnx73SXOKEasrRr4DDohoUELJIwSoY6Mwm8jEFTcq/FbD9G40xSqU29FRgVIEgo+h6qvaqLoHgk1Ip4WMPeXBYjYFIoI4y9zAiCcCxKGw+6Sgg+4oq60vOOV+434UekI64MlmfM5n0Bc+azDeC1AA05k8Jh5DketqG+HY356aAKwEgFLeJEeFAvJS3GiKGs2bCYPjW7zHZV4yajDyRmyGw5a1hE7rXPRAobPMhKp9oSCHmZHo6fgEHotVX9kYjC/BE50r1DEoS0fuyGMo7iUEft0emPoyUlifuXCC1q4NAcf9SAiYRPigsQDs/UiK36qbD8R8gY8QwHaauqJST46M89SNvokpMVBVsUadJwow4uK6WI77nu9lUId/PTxrVKdcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6916009)(2616005)(2906002)(6486002)(6512007)(316002)(8676002)(186003)(8936002)(26005)(508600001)(66946007)(66556008)(66476007)(4326008)(83380400001)(6666004)(5660300002)(38100700002)(38350700002)(86362001)(6506007)(1076003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DI4tZght3DiNmdzVyeqojZaZMjDpSAAeqdA2G9ZYeupoXgbiZd2C51obZNow?=
 =?us-ascii?Q?63jQnnaqzrZ8vNBYDn1O1vzb4k1QPz3heM6o3uCs5PhrNMMWf2I9gs4iA7yv?=
 =?us-ascii?Q?2iArSz+yEgEj5NDNH9Eq4s0XasYQRiOy7BzlISsLTjBcHgAbW8PtzgELMMu8?=
 =?us-ascii?Q?NK+KkREUw8GoAI2/5XYkS66DVF5ge4SIgEC1vcoi3p8Dc8zmR2r12WP9rMPu?=
 =?us-ascii?Q?OKJRyECg99c4RvUQh1Y15oNiJhNzBUScG8VXUoYLXso5gs+fdZuawhiwXPIS?=
 =?us-ascii?Q?Vr/WnwknlbsVs4Aidgz4faYshInsPETIrThIdsIdD/smZKIS4Cm9+DiAPKA7?=
 =?us-ascii?Q?F2pA+50wV8XYgVMA0POR7mqTqlmsc83m2Iy7ZgTTqm10Oqq2x8VF3R63Ewbs?=
 =?us-ascii?Q?kYreCuivGSCYCdWBdmA3drzuq1B4wzlmER8IAS+0zxtDUBNonG6ZJCzUOHwH?=
 =?us-ascii?Q?iu7t0Cw0Ux4cqzPHyy0m44MvYoiLhM86QFb1Ppfmf4+9kzd5lyqseRO7q1ms?=
 =?us-ascii?Q?IMx51m3MZdvuR2NYFXJNPcKk/pqlKWN49xw84Yn21u1Mqhha2mAh2AM+i8zf?=
 =?us-ascii?Q?ec/HJiKclW2EMJfryvnKW6kJK0Z2PHs+tpXG8K7nYfCn8y83NsSyrWzOFXw2?=
 =?us-ascii?Q?LeUiA2rPy1mieW7xgFvcl5ds4Pzmf/Imoi2I7+Ye/GCKW9s74x+t7+iG1IGD?=
 =?us-ascii?Q?xmIVlxCJIoOto1nOLST/n1wOqZYYb0G0WW8pIeWPcUJpI3z0dnX1iCBP2+EB?=
 =?us-ascii?Q?aXeH7SCo80ci2oAjoKeS4beguJFxzq23bGApWaszxLKLZzICAfvSsqkIK5ZL?=
 =?us-ascii?Q?BgREH1BsTM07RkOLDK2umV88/X2oTNXcRbzTMYnshyePYe9RGtEh2RDbV6sJ?=
 =?us-ascii?Q?O+CmlmsBNfPF9bnkkLXyRTn1lZdiY2csvq4XlgnWQ2uaHwk3YekVI7L5SvuV?=
 =?us-ascii?Q?KvXx4TOAlQ31bPlT4/jcIUHooFtpWmgJZ7PHipsAc6ndhHi5oj9cq7k8LcIO?=
 =?us-ascii?Q?ONborl+d7OmqaMRSNI4b9UJnGi4r/qzPmFb8B7L/S0PCsqhT4pH2WMw5AdAn?=
 =?us-ascii?Q?Bes30Rgxprb2NMCuJtPEfJ/UZr1bScXz0LJRwK0m6mIG2XNywCjW+VVVbo/A?=
 =?us-ascii?Q?EPKxbkDP6wXrtEigUoDCvB2tcmiWbjuU9MdxT4RXZSFnEp+5D8hUuSkJunv5?=
 =?us-ascii?Q?P2Wcdctt/xYBd29LVKkF9FkcvZsi5b8okMF3HJDLImjTXsaiQa8As7S8Zumb?=
 =?us-ascii?Q?MhjvAPp4mVtbHv02vHcUXGb5KRjlmvdz+PJKK8dAfadLu0ZDNfOHuQpJ9HK4?=
 =?us-ascii?Q?SOUJRvnkJWHDyM4aY0T8cmBYKRfFKG1fI0HWiG525JI7PhJMu4Dqq5TuplQd?=
 =?us-ascii?Q?PbL9BszgRyI6tXSxokwZGUvJ5KN6LK1uWHTNqQ9RJIhk4VWmKAnVN8f7D0b4?=
 =?us-ascii?Q?zqM1eCr9x29bWJQuyZyZKpPkH6LWT6dZwCey3vBbb3n6QR5nKg+S4Ve+m6lH?=
 =?us-ascii?Q?gV6chLhdJbsAU3OrojSYvpmxzqUJgc1JCWZKulHhYXTXhiRw19HQN50tLdeg?=
 =?us-ascii?Q?wUm/VsHH1TQEDgCdOmYhNfuSfLDLMueu9o4/hvv0Pdmjq40n2Ef7Gm5rkQzZ?=
 =?us-ascii?Q?6daqzenxMGKzP8nHojwf3tdmyOS0iTrC3mOJIvCSVlja15aqxeVnUXig/SS2?=
 =?us-ascii?Q?LOfNEDRkvjgiHob6lNhJ3urri8g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e456217c-884e-4a8c-b5b0-08d9dcfa4315
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:22:47.6316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoLd1rN9QLB+F+jDu4prMnB8DpFZpOqZZEkr005zVqfiivT5hPzA/ThUNzQbDZTTun+f6FrTrknH9yNThdbcr7LoGK8xeuzEwr6Eq4A+LvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4006
Received-SPF: pass client-ip=40.107.5.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

1. Add --no-trace-events to suppress trace events generation in some
   cases, and make trace events be generated by default.
2. Add corresponding .trace-events files as outputs in qapi_files
   custom target
3. Define global qapi_trace_events list of .trace-events file targets,
   to fill in trace/qapi.build and to use in trace/meson.build
4. In trace/meson.build use the new array as an additional source of
   .trace_events files to be processed

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/devel/qapi-code-gen.rst | 23 +++++++++++++++++++++--
 meson.build                  |  3 +++
 qapi/meson.build             |  7 +++++++
 qga/meson.build              | 11 ++++++++++-
 scripts/qapi/main.py         | 10 +++++++---
 tests/meson.build            | 11 ++++++++++-
 trace/meson.build            | 11 ++++++++---
 7 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index a3b5473089..a3430740bd 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1619,7 +1619,10 @@ Code generated for commands
 
 These are the marshaling/dispatch functions for the commands defined
 in the schema.  The generated code provides qmp_marshal_COMMAND(), and
-declares qmp_COMMAND() that the user must implement.
+declares qmp_COMMAND() that the user must implement.  The generated code
+contains trace events code.  Corresponding .trace-events file with list
+of trace events is generated too, and should be parsed by trace generator
+later to generate trace event code, see `tracing <tracing.html>`.
 
 The following files are generated:
 
@@ -1630,6 +1633,9 @@ The following files are generated:
  ``$(prefix)qapi-commands.h``
      Function prototypes for the QMP commands specified in the schema
 
+ ``$(prefix)qapi-commands.trace-events``
+     Trace events file for trace generator, see `tracing <tracing.html>`.
+
  ``$(prefix)qapi-init-commands.h``
      Command initialization prototype
 
@@ -1689,14 +1695,27 @@ Example::
             goto out;
         }
 
+        if (trace_event_get_state_backends(TRACE_QMP_ENTER_MY_COMMAND)) {
+            g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
+
+            trace_qmp_enter_my_command(req_json->str);
+        }
+
         retval = qmp_my_command(arg.arg1, &err);
-        error_propagate(errp, err);
         if (err) {
+            trace_qmp_exit_my_command(error_get_pretty(err), false);
+            error_propagate(errp, err);
             goto out;
         }
 
         qmp_marshal_output_UserDefOne(retval, ret, errp);
 
+        if (trace_event_get_state_backends(TRACE_QMP_EXIT_MY_COMMAND)) {
+            g_autoptr(GString) ret_json = qobject_to_json(*ret);
+
+            trace_qmp_exit_my_command(ret_json->str, true);
+        }
+
     out:
         visit_free(v);
         v = qapi_dealloc_visitor_new();
diff --git a/meson.build b/meson.build
index 833fd6bc4c..e0cfafe8d9 100644
--- a/meson.build
+++ b/meson.build
@@ -41,6 +41,7 @@ qemu_icondir = get_option('datadir') / 'icons'
 
 config_host_data = configuration_data()
 genh = []
+qapi_trace_events = []
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_linux_user = false
@@ -2557,6 +2558,8 @@ if 'CONFIG_VHOST_USER' in config_host
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
 
+# NOTE: the trace/ subdirectory needs the qapi_trace_events variable
+# that is filled in by qapi/.
 subdir('qapi')
 subdir('qobject')
 subdir('stubs')
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c15e4..656ef0e039 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -114,6 +114,7 @@ foreach module : qapi_all_modules
       'qapi-events-@0@.h'.format(module),
       'qapi-commands-@0@.c'.format(module),
       'qapi-commands-@0@.h'.format(module),
+      'qapi-commands-@0@.trace-events'.format(module),
     ]
   endif
   if module.endswith('-target')
@@ -137,6 +138,9 @@ foreach output : qapi_util_outputs
   if output.endswith('.h')
     genh += qapi_files[i]
   endif
+  if output.endswith('.trace-events')
+    qapi_trace_events += qapi_files[i]
+  endif
   util_ss.add(qapi_files[i])
   i = i + 1
 endforeach
@@ -145,6 +149,9 @@ foreach output : qapi_specific_outputs + qapi_nonmodule_outputs
   if output.endswith('.h')
     genh += qapi_files[i]
   endif
+  if output.endswith('.trace-events')
+    qapi_trace_events += qapi_files[i]
+  endif
   specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: qapi_files[i])
   i = i + 1
 endforeach
diff --git a/qga/meson.build b/qga/meson.build
index cfb1fbc085..1f2818a1b9 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -15,10 +15,19 @@ qga_qapi_outputs = [
   'qga-qapi-visit.h',
 ]
 
+# We don't generate trace-events, just because it's not simple. For do it,
+# we also should add .trace-events file into qga_qapi_outputs, and than
+# add corresponding element of qga_qapi_files into qapi_trace_events
+# global list, which is processed than in trace/meson.build.
+# This means, that we'll have to move subdir('qga') above subdir('trace')
+# in root meson.build. But that in turn will break the dependency of
+# qga on qemuutil (which depends on trace_ss).
+# So, resolving these dependencies and drop --no-trace-events is a TODO.
 qga_qapi_files = custom_target('QGA QAPI files',
                                output: qga_qapi_outputs,
                                input: 'qapi-schema.json',
-                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@' ],
+                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@',
+                                          '--no-trace-events' ],
                                depend_files: qapi_gen_depends)
 
 qga_ss = ss.source_set()
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 2e61409f04..d53e5b800c 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -32,7 +32,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             add_trace_events: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -49,7 +50,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix, False)
+    gen_commands(schema, output_dir, prefix, add_trace_events)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
@@ -74,6 +75,8 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+    parser.add_argument('--no-trace-events', action='store_true',
+                        help="suppress adding trace events to qmp marshals")
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +91,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 add_trace_events=not args.no_trace_events)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
diff --git a/tests/meson.build b/tests/meson.build
index 3f3882748a..b4b95cc198 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -31,13 +31,22 @@ test_qapi_outputs = [
   'test-qapi-visit.h',
 ]
 
+# We don't generate trace-events, just because it's not simple. For do it,
+# we also should add .trace-events file into test_qapi_outputs, and than
+# add corresponding element of test_qapi_files into qapi_trace_events
+# global list, which is processed than in trace/meson.build.
+# This means, that we'll have to move subdir('tests') above subdir('trace')
+# in root meson.build. But that in turn will break the dependency of
+# tests on qemuutil (which depends on trace_ss).
+# So, resolving these dependencies and drop --no-trace-events is a TODO.
 test_qapi_files = custom_target('Test QAPI files',
                                 output: test_qapi_outputs,
                                 input: files('qapi-schema/qapi-schema-test.json',
                                              'qapi-schema/include/sub-module.json',
                                              'qapi-schema/sub-sub-module.json'),
                                 command: [ qapi_gen, '-o', meson.current_build_dir(),
-                                           '-b', '-p', 'test-', '@INPUT0@' ],
+                                           '-b', '-p', 'test-', '@INPUT0@',
+                                           '--no-trace-events' ],
                                 depend_files: qapi_gen_depends)
 
 # meson doesn't like generated output in other directories
diff --git a/trace/meson.build b/trace/meson.build
index 573dd699c6..c4794a1f2a 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,10 +2,15 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
-foreach dir : [ '.' ] + trace_events_subdirs
-  trace_events_file = meson.project_source_root() / dir / 'trace-events'
+foreach item : [ '.' ] + trace_events_subdirs + qapi_trace_events
+  if item in qapi_trace_events
+    trace_events_file = item
+    group_name = item.full_path().split('/')[-1].underscorify()
+  else
+    trace_events_file = meson.project_source_root() / item / 'trace-events'
+    group_name = item == '.' ? 'root' : item.underscorify()
+  endif
   trace_events_files += [ trace_events_file ]
-  group_name = dir == '.' ? 'root' : dir.underscorify()
   group = '--group=' + group_name
   fmt = '@0@-' + group_name + '.@1@'
 
-- 
2.31.1


