Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0C491100
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:38:07 +0100 (CET)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9YlS-0006HQ-4Z
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9YiW-0003d3-1j
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:35:04 -0500
Received: from [2a01:111:f400:fe0e::704] (port=61063
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9YiU-0005Zt-6P
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 15:35:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJMpMAgpOKIaeaeqsB96K/0TQEnLAoUKwS+EPVmvPahZ/GQ1FxhizN3LWQ/b9BYzAKL7Q7sp20HV1Ti9q1biagkLokAZVZS4Z9v4QIqvUln2Wfbrm3Pp8Oj6h+qTaTsJFy1+AIfzqhYV11RHezjyYNpYNW5AnccANsRX456V3C2jYJk1PT6rPc7ciYQw+te5E4r0R/If+ZMzb9H/3f39bUdlXULAgTSbQnZUFcXSNeuFcO4ec9wrVN/9SXOorBxK2tb/cpO9IVIs3lzo6QhFjs8cAUbltllzu7dSmnohkWygd4GdSqTOR5uBOyXPjdT7W+4AGQLj4ua8Tz55AAfZXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jTc/7mJSdZVPAuLLC348SLvGQUGauCNUGCG99EW2y8=;
 b=NGoU8rF3Rai2cGDHmUqIWIrii7KRyzl+pVdjQO8qRIF/twbeQ+FdAyNItHf26fMK2CS+XGbF84dEhYNCcrU4Oc85voagPN9nZ1JjiBBvax/ThTaquHZaYLn/OWh+jFbLUemSi/RwfrrFHzF5psvd3suIq0y0w+V+kjm/RGhUjyBqR3epsTx3oPeNENc8WNomXMwBeC8Ln0yPxB0aOVlzqgzVFdE/yWmzm+fTm1SfKT9mMZ1OKTh6P2TqwfAaVuk2EgVS1bompRcKZ8Epvvey90wdOFLL6FFnFRHOHlO9XfiaINixoa8kncA3MofxSN908An8e69Rvm8SbW0SDk799A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jTc/7mJSdZVPAuLLC348SLvGQUGauCNUGCG99EW2y8=;
 b=frG9h3vuldg5LyTy8rip/67MixwfaZ7PWPUlyQLpDaHZkXa7g1Qw8tbrQGNY0vfE3M0bEXJa0IvfLIs2sfg3x6djbr1/Y22R4OcDcarjXa3DGzmp/c6NxMdhOAEvLcJQaxBcGgb+f4XfEjNaicOR46R9Bshfybqm/AurCn4s/sU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB2957.eurprd08.prod.outlook.com (2603:10a6:803:43::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 20:19:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 20:19:04 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 3/3] meson: generate trace events for qmp commands
Date: Mon, 17 Jan 2022 21:18:45 +0100
Message-Id: <20220117201845.2438382-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
References: <20220117201845.2438382-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0069.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::46) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ab9714f-b9f0-4aa3-eebe-08d9d9f69b6b
X-MS-TrafficTypeDiagnostic: VI1PR08MB2957:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB2957124B037D665D60A64960C1579@VI1PR08MB2957.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUKni86sdW8wJxAYt8/uYezRQz1KKrEiLXMZ1pqjtQpeMRtL7/2AMZaptDnYGkNYEaIGketFB3yZHn+pdpxs13dKgqISq1UtVIW9+k8ltucME4QdXnf+1HI/Z13aGDGKOCM82SBz9XXTP+24pLZwkBFmgN5TarmBM954LPjV5YIIJ0k/uBtTmb2GmUXtCTqkowD+tHsBGpIlUxz8VcXkb0/CKxRYAgIYWZwa/rIDcj6mQUAX0BgEW+dy3L2Uga3+5SgKKHH/mZgP4gBTwAXV+HzX4HB/uyAj1+m4h2umqvIIV1YULGw6kfW59+Qk8IXAJMcs+DHqEDT1BenZpL+PPcGKrMus7aOb1lg7FuivXblBeKXRqcajHqRSSbGjxev67FLN0NxaJqmx9OH6WTgfFZzrBr1EeICtQBdmjAMyQl/PD7DX4J7rhZlhOEU2DE+RD1b2n7gNEFRJM1MfX7RkfPHL234wnKvnEPdgP6EdvH/EFc8CAur1AJ35izTALwrn+HZsGn1gIiajmRxL/fx4hiM/P1a7FFdIvzW9o6A/pxEB3TNjep8FTqN+vBJHE4DPbgpZUD7cWyfMbZFpafrZcRC4+B3NH47/mVqlEuMP0jszbKFHkQtKvNEYvNmGQFa2NXaKXgI7don1FLHYsdoaBzuEOqbpcpQH4nODbgy/2HmEV1yiL+P1YWfSpjd/3OvwcPd9Oh5ZhpjNO2g1N5rG0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(8936002)(4326008)(86362001)(66946007)(508600001)(26005)(6512007)(6486002)(66476007)(66556008)(52116002)(6916009)(2616005)(186003)(38100700002)(38350700002)(2906002)(6506007)(5660300002)(316002)(8676002)(1076003)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3lsijqrqnb57mexNssBOiRVUFLkypruNPU2HvRja9FO9SYjTDvOBF8d0scwf?=
 =?us-ascii?Q?2SxtwjbiG8TaD9Qh78cN4TAnJRetsDdLHQig3mUiTl7wRgtgFGs2+3OrhCMm?=
 =?us-ascii?Q?1tbW5LaoKSKd6o5Dl9BrMIkvpcpM2Y6i+vsKq7/GkdeKO3SQcbwYi7tpILEG?=
 =?us-ascii?Q?2O6UBEqsHiKZgdnAgumT0zjprk9pgKNDETXvexJrovYScvY9i+TbtUSCTLFg?=
 =?us-ascii?Q?xdjjMsz+ezG7fVGD9k93Ge1rJLLvqe+znlq3qlMJ7M4DtqOVXWR0tHwZUFhz?=
 =?us-ascii?Q?oxgh7S6X9Cp2KotNxktOeZs1rJ/2gwLCqyt7Iszr4+hw9LAwkIQELYpkySWQ?=
 =?us-ascii?Q?0Dm/YUrerv3rStDXEI9dJBINW4nIhjl9aNc1o25brqVlXxASzbDSmD63Gbon?=
 =?us-ascii?Q?wmLhU8rLpDFVu+wXvxnBgOVAchwBDCBLTw6izPZgVRkTblWATbQVxaQYfi5X?=
 =?us-ascii?Q?Fk8DnezvctEcIMT58c6Lr4vePpVMmXd++QukX37gZq38j9wJ1UsG1I3Kt3v+?=
 =?us-ascii?Q?DWy18HPSw3hJpppi6Izc9NDX0TjPg+BKCSgTscV50QWb2FGorPZkhQfOuF3G?=
 =?us-ascii?Q?4T79bOhAsVVeme8F9YhI074WLMv5SHKbdm45SUZayjoskKN7KOtMtTADXVcG?=
 =?us-ascii?Q?CkSSaECKuiir7hCqbCHEbZl27SrwLi0sCt7/M/TBS3d4OunZvZsDUg9L6FuQ?=
 =?us-ascii?Q?vNn3wQQd2Bvs/SqyAacJSHnCuw6XXxgLZpa74zHEtk3qSJHtnv6+JWOXd5EI?=
 =?us-ascii?Q?JLAvIbovKdFo3QY356PB69S7NIoxTTL2/Yut8xoc/uCYPttaPAKyD6ll2Cx5?=
 =?us-ascii?Q?rDy3HeJUfWukEDJwjk/wLQ5JHg1IPPobMxgfGQdpPTkh4VB9DV+ao4OGjrUG?=
 =?us-ascii?Q?Blu8IFStrl4rB3RnMWEky43SJk1XNZLEwjOKu0wCV3T8r+G6nusHMsErXum8?=
 =?us-ascii?Q?0QfPj86SEmmiq/kVwujPKZT3SW9v54IPfTcWhoPPOJgo7Dx9atkdntsgZnbt?=
 =?us-ascii?Q?0NKA8CUAgvk04uSIH2R8M5ZemRPCwMjboTZWdSwPRwy13GzlndmEcWC6qcbd?=
 =?us-ascii?Q?rxS2b9m0Ui9QJt/XDPTQJZr/tz0gviMgdtVcJ+Cr8t6/pRr+dTNzxBepFoib?=
 =?us-ascii?Q?pjW0CSL10j6YNzh4ORSZTy+ASH+gnwwwOaP30CD2yuxmKsqoYtq2g2RSowtJ?=
 =?us-ascii?Q?2oEYaYcTgESedMsTGN+hTDjC3Y3lMRWjwf+DRzgW5eu2105xGsXEgOWI7pGs?=
 =?us-ascii?Q?ddh9mKh9cwcbBJKB2JbXvwAEjdQ9VWgC/Ik91mpTo0tFuiHmFwV09n6ILJiJ?=
 =?us-ascii?Q?GRcCRyHAa/yjblA0R9NlVwGXWuQdihnr82JFVswjqjLvniouVLnAy8npzyDF?=
 =?us-ascii?Q?8laEyULUb0FB4rTxPF0TbS/ts6vatQy8y5k9E8gTdwg8CEh9LMtBtMRNxdL3?=
 =?us-ascii?Q?nEyR/Tu0ROta1xcvhyZbbVe5dPInAFCJ6j5p6Agxm5fk+dECenHVV7hsF6+H?=
 =?us-ascii?Q?DpCVhefHMUj/GmO8/e/135NTizi5QE4KpmHSY1UsP3I9VnYp8bNdsXp75Fno?=
 =?us-ascii?Q?Pi/eJKMg9RiwN8G0nj3u0llxFK7PUehxgfMZ03YxyVf4vRj1IVC5zCbe6EJc?=
 =?us-ascii?Q?7D7PTOIorSHYvhEXKohT01JDwgyzS3tGkTawEcxbVxvtnc3NDkmzCjBB+BQM?=
 =?us-ascii?Q?DJi+Fw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab9714f-b9f0-4aa3-eebe-08d9d9f69b6b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 20:19:04.6252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVHenCp3fwEz0cpXfKPfxAzauq5bolg7hT6hJuwZKYgbPPROiKgdfq53je3h5gMxGvC3SNyFPMUH1CKg97OeatDyQjF7eX7Kl2jiIx3VMx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2957
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::704
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::704;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

1. Use --add-trace-events when generate qmp commands
2. Add corresponding .trace-events files as outputs in qapi_files
   custom target
3. Define global qapi_trace_events list of .trace-events file targets,
   to fill in trace/qapi.build and to use in trace/meson.build
4. In trace/meson.build use the new array as an additional source of
   .trace_events files to be processed

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 meson.build       |  5 +++++
 qapi/meson.build  |  9 ++++++++-
 trace/meson.build | 11 ++++++++---
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 762d7cee85..effd66e4c2 100644
--- a/meson.build
+++ b/meson.build
@@ -41,6 +41,7 @@ qemu_icondir = get_option('datadir') / 'icons'
 
 config_host_data = configuration_data()
 genh = []
+qapi_trace_events = []
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_linux_user = false
@@ -2554,6 +2555,10 @@ if 'CONFIG_VHOST_USER' in config_host
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
 
+# Please keep ordering between 'qapi' and 'trace' subdirs:
+# We should first handle 'qapi' subdir, so that all
+# generated trace events be generated prior handling 'trace'
+# subdir.
 subdir('qapi')
 subdir('qobject')
 subdir('stubs')
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c15e4..b48125f8da 100644
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
@@ -126,7 +127,7 @@ endforeach
 qapi_files = custom_target('shared QAPI source files',
   output: qapi_util_outputs + qapi_specific_outputs + qapi_nonmodule_outputs,
   input: [ files('qapi-schema.json') ],
-  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@' ],
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '--add-trace-events' ],
   depend_files: [ qapi_inputs, qapi_gen_depends ])
 
 # Now go through all the outputs and add them to the right sourceset.
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


