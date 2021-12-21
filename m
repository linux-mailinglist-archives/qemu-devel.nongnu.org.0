Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB04D47C7A8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:42:20 +0100 (CET)
Received: from localhost ([::1]:38352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzl1f-0003gx-I0
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzkvX-00015C-I1
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:35:59 -0500
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com
 ([40.107.21.99]:22497 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzkvS-0004At-CF
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:35:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4YpI5wuBsz4P4df1dvJdbxYIskJSbI1PGhYr7UY4P++TQWtLH8OszPSjbOSthgvHNWvwh5ynjnM0gYo11m8bGPZDutPa7rJPx2lTvrz2kdriGpAb199HeAUu10PAwying+COs4IarXfKjpOLVsEJXJMZ155u3JVhe/ZB28ym6Oqecut9Qac5dSjE2Lez8PfTgRctdVinnu61dWEasiEMUy43i6t0rHN5lXDp391r6JsUN2JfUtqVHBPkI7th1SpWdkM8Y71jIGmV04+uYYNQDOelNZ7DBIxYqaCTIbE9xfLXnJP5lHI2sYvepd9NziQk49cKBUox0R0fz44fRSUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgxUkeFo+74cIaNpDd2ONDxizJpRhU+Hx3FyhxoqNgU=;
 b=d8HWBeJB7D78/Plv0Pnn/P9rI0P3Flq7DlwdKTqe3Tf/jP6vCWwcUXJd8kvhkzq5cSozPrLHP1zSumkObq78GqvYRc8dZOe1E0JqAWtMuSJVOkKUA3skd9xqn1vZpKWxaJQFpyBvvBPe9byhpmgb3lp4zQg6il/TzasUe7bWXsNBE82Aw46gYNhIMGY6RasEeAsTVFivUDT2uIgHzjHeww6Vi/t6OPS/U9unHchPBW/pQi1Xf6MOyhWmelkmeYsrzmBGEMTYOTV2C+N33Y/M63FlDGEGTBS5AG0j5al0U+XPxANbGaW6IugcEirCTQLLc7QEjq5yIE0LJz/DV8yR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgxUkeFo+74cIaNpDd2ONDxizJpRhU+Hx3FyhxoqNgU=;
 b=rzxK9xVY5f1LR1Rtk2ygB2LFwr/jPJVHjdl8jHoNb0F82dUMStHIBOVl/Moi55/zmDBPHejQkf4NlikVv0s5GODFRK4BQ6UIKJ3KAYuI+rZnL1YTkKS1AJXE0aSHJYwTwnBMSEwPSyE2r+gfxR97Z/lqB1nCjGdsx8M7fK55Vug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4964.eurprd08.prod.outlook.com (2603:10a6:208:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 19:35:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Tue, 21 Dec 2021
 19:35:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH 3/3] meson: generate trace points for qmp commands
Date: Tue, 21 Dec 2021 20:35:02 +0100
Message-Id: <20211221193502.114296-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221193502.114296-1-vsementsov@virtuozzo.com>
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0014.eurprd04.prod.outlook.com
 (2603:10a6:203:90::24) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cfef31b-bac2-49cb-9419-08d9c4b902e6
X-MS-TrafficTypeDiagnostic: AM0PR08MB4964:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB49640B4EBE52F54487CEE8D6C17C9@AM0PR08MB4964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +3Ywr1gLeZEroKhLRN/CC0HipFoCnJPmnATtCx8wyAVbWhMSuvgbN54iN+vqVLDQOQMDNjFDiw/Zp8PJlC3KGlN3NT5kh4hdNR/hD2rVmK6Mmt/Njek1MWI8LuLcVtSDl6TtlE8/sH6sYU16Lw8uTGfhGfaSdcnTksGT46iMxGleZat8QP4Q/zYjmmuYteCJjJLWctY7j6ltZV/cgdJBNiYYFE28kwqvfwmBq7hbmHNWZSCNV5uFBunO/jooyvtDo9Aebm3XAwz3ZK4eiGhnNqMa0C3MEBAXaXhNPKKBFggZUYOHULb9SX4Q1Fr6EZIU624m4QMz40WlcI3iixdmG0lSm5dvcvF3+OBSa9SQAs5a831SsdnYq/bTRkKGW4JwJ4kAk6UOHpZJ1gTgLAxoUVvBOsHxzfnGhLPypdtHHrugdu2/NTNQPUfIXM82uzLij37NyrpzLuJdP5KI/Zfq9VLZuy106HEDOMbGF3szG2RatiO4AAs9IujGe0crl2wDGA8z2rrCh9oDX2MyWES460zYpBdKx1o5CQDDjPysVkkPKeReqf7GVuGB78GUX3M9qjSFoYhmVKplxb5Ol+dsw5YGjYr7poEJRL7RYlA9w6k1MHwiW9g5jg+timWrD3OGxs8nac6M5rcmq/qgVaTBG4KyNqJt8DrX6BBjhiGWdOXAq8xgeqDtI3/0Q2W4FOggOfde9ogDj05nZ6kn6cM5qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(186003)(36756003)(6486002)(38350700002)(6666004)(26005)(66476007)(66556008)(38100700002)(52116002)(86362001)(4326008)(6506007)(83380400001)(107886003)(8676002)(5660300002)(66946007)(2616005)(2906002)(1076003)(6916009)(6512007)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wk/XpaZWrJ4by1bwTtOeB+qmgg6I4feptf9gp5dqyQm8tFN1xRjduqmScJV0?=
 =?us-ascii?Q?Y+A3ukpFOcWSD6KniQcJb7Zc4Ktm+WplZM9RbThQU1I5MIl16XpSzIfWhBz6?=
 =?us-ascii?Q?1xnkbUN0VdeYiuELBg0HwW/0ZacxpcyqXg8vSRdWXrCeaUeZ3ebGJcr5H934?=
 =?us-ascii?Q?yz/bUZ22HKPeDbIjieq1gKE/f+b05v55/SW/VeQPFejH7PB1lKp9kZUyQi6K?=
 =?us-ascii?Q?xpN0difkrwCIGt++cwXC3+Qr8hI1b/nA+ETPi0ShOCmKUX0VwdJl4wJ7bbwr?=
 =?us-ascii?Q?TcempD/rIDFlD8baDHEYpn04n7GdrPpotMfkiYaCZNXlTmjEXUftiuMnBgGo?=
 =?us-ascii?Q?NupqUWsTMcTpg4tLAmqc1n55fl/Tc35LrPNumPbqRYjYzEDaBoq9/slSglPb?=
 =?us-ascii?Q?S2Lqlcu9ts6UxIEwBOnTWtbYQIvuDUI48ajLLKHtdZNcgH+NLGfEHf8Avm+N?=
 =?us-ascii?Q?x4QnfNKWGOrdUic1+P/pM84NOKfZy20+DYk5vF/SDODXigTon0pjSG7XwHEP?=
 =?us-ascii?Q?9sG9UF9l99rW7INPlNw6gL45waG1wxtVKUqI2HhaFQOW4zeDDuR2o7Rl09ZD?=
 =?us-ascii?Q?Uqp40tAXABxbH6oGIAaxachwKcWnkc1eGawutS7Ec2jqw6EZcmCRWqZQULJa?=
 =?us-ascii?Q?jGfbSsntgRUXhyF6x5N8sudseJWxRsBB9ESDxKaF/nleyuopb8A0UlGK9FkD?=
 =?us-ascii?Q?RGXVFX30I/1Vwo3NB4XSph72g9iclTvAsU0faKMIHETeBKUbeUvFTELlX6dn?=
 =?us-ascii?Q?UAZaYd4frIiNEKbeNQTIlWGP5XKP6G6Az+vHpLLuhrnv/UaZ2aGIgORh2HDk?=
 =?us-ascii?Q?95EmQglG64dTy4eqX7/nOoXo3JEnN+Vwk/RgicQ98U6+ow3Cd/0dud3KVWzL?=
 =?us-ascii?Q?bSwii9nJ1N1eiQctIVoAmMu1du1XYNrtndyazgB0L8SvBfzxb3+87wq9QZ6G?=
 =?us-ascii?Q?pT2PI472MRWMq6fqFXkm+2YTCOkcFniBDJQAmsJu1/lU3kyOg+sLqLrPWoGz?=
 =?us-ascii?Q?S7Eb5iHi75k4Kcbtcy4idROEQEnZJd2UGY5X0R4u6OeGgwAubYn0XSx9x4hS?=
 =?us-ascii?Q?HIopoYThaVE6Puihs+QnzNLRjIIzRssOOXyu1nz4AqznAJx++RDgfb2NZdfy?=
 =?us-ascii?Q?T9fPYyr8VITJfTRbHMnr3ceRP8rc/JE/XaWQL4zmn1/5XMJzJsoEpNA3yJ4W?=
 =?us-ascii?Q?OyRsD4bqqrUWCfI+IpdxEFw4d8st1B4SNMJTROTsJ1wllHPynFdjlGrfDeww?=
 =?us-ascii?Q?Ll6rvrpcLzmJQBRhE81skPmMfYtF4EANT4rm0IPeNww5Yz1JpFgqIboVAX14?=
 =?us-ascii?Q?WR1lqMSuwY7VtsrqeeSsTYMkJ0BDpBfv1YKsZOmTmco1iqARWQ/bfHWWk6hU?=
 =?us-ascii?Q?EucdUfbvATgEsiKP4vWwJcRvjmyyX3FCcel7WCOmifYd6Ts8aiWUGuT/aefk?=
 =?us-ascii?Q?g63p+I+lBotWivf999c5MZrMR/HXleQVvvohQJ5QOJhi79gLkzsX1+fmmXsO?=
 =?us-ascii?Q?hp2D2or0yaEGLJymhVim5rPK2/FtxlFkoq6Dn0IRo8lDdX1c3XQmWHxLw/ic?=
 =?us-ascii?Q?ixzIEGcA2WJ+/K1YdRHv3PwrQ8cUxFV3A/OaEOJ6KUONOaAH5ffeZulYy4x6?=
 =?us-ascii?Q?a8bg1VEtiN6obON2wFO9/mq0ScNqhUo63aVH6X1OlZOgaa0LUPkrsMfqBghT?=
 =?us-ascii?Q?sGUYv3jznsP/ufLdEx3i8zQjFwc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfef31b-bac2-49cb-9419-08d9c4b902e6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:35:14.7545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zK+dxRSqUtOn6eP0LuqUawg5kOHjluNn36hCv7kSzAKVvhV0/bT1o7W2h8Wf5vaxO65fHNemckzumQU2F3g02yDDPpggdXEjeprabfd1Kf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4964
Received-SPF: pass client-ip=40.107.21.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

I need help with this thing. Now it works like this:

make -j9
ninja: error: '/work/src/qemu/up/up-trace-qmp-commands/build/qapi/qapi-commands-authz.trace-events', needed by 'trace/trace-events-all', missing and no known rule to make it
make[1]: *** [Makefile:162: run-ninja] Error 1
make[1]: Leaving directory '/work/src/qemu/up/up-trace-qmp-commands/build'
make: *** [GNUmakefile:11: all] Error 2

OK, let's try to make it by hand:

make qapi/qapi-commands-authz.trace-events
changing dir to build for make "qapi/qapi-commands-authz.trace-events"...
make[1]: Entering directory '/work/src/qemu/up/up-trace-qmp-commands/build'
  GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc capstone slirp
[1/1] Generating shared QAPI source files with a custom command
make[1]: Leaving directory '/work/src/qemu/up/up-trace-qmp-commands/build'

It works! So meson doesn't understand that absolute path is the same
as relative.. But I failed to make it the correct way :(

And after it, just run "make" again and it build the whole project.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 meson.build       |  1 +
 qapi/meson.build  |  4 +++-
 trace/meson.build | 10 +++++++---
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index f45ecf31bd..20d32fd20d 100644
--- a/meson.build
+++ b/meson.build
@@ -38,6 +38,7 @@ qemu_icondir = get_option('datadir') / 'icons'
 
 config_host_data = configuration_data()
 genh = []
+qapi_trace_events = []
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_linux_user = false
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c15e4..333ca60583 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -114,7 +114,9 @@ foreach module : qapi_all_modules
       'qapi-events-@0@.h'.format(module),
       'qapi-commands-@0@.c'.format(module),
       'qapi-commands-@0@.h'.format(module),
+      'qapi-commands-@0@.trace-events'.format(module),
     ]
+    qapi_trace_events += ['qapi-commands-@0@.trace-events'.format(module)]
   endif
   if module.endswith('-target')
     qapi_specific_outputs += qapi_module_outputs
@@ -126,7 +128,7 @@ endforeach
 qapi_files = custom_target('shared QAPI source files',
   output: qapi_util_outputs + qapi_specific_outputs + qapi_nonmodule_outputs,
   input: [ files('qapi-schema.json') ],
-  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@' ],
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '--add-trace-points' ],
   depend_files: [ qapi_inputs, qapi_gen_depends ])
 
 # Now go through all the outputs and add them to the right sourceset.
diff --git a/trace/meson.build b/trace/meson.build
index 573dd699c6..77e44fa68d 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -2,10 +2,14 @@
 specific_ss.add(files('control-target.c'))
 
 trace_events_files = []
-foreach dir : [ '.' ] + trace_events_subdirs
-  trace_events_file = meson.project_source_root() / dir / 'trace-events'
+foreach path : [ '.' ] + trace_events_subdirs + qapi_trace_events
+  if path.contains('trace-events')
+    trace_events_file = meson.project_build_root() / 'qapi' / path
+  else
+    trace_events_file = meson.project_source_root() / path / 'trace-events'
+  endif
   trace_events_files += [ trace_events_file ]
-  group_name = dir == '.' ? 'root' : dir.underscorify()
+  group_name = path == '.' ? 'root' : path.underscorify()
   group = '--group=' + group_name
   fmt = '@0@-' + group_name + '.@1@'
 
-- 
2.31.1


