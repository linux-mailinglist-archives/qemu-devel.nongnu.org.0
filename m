Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F005F49BE44
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:13:20 +0100 (CET)
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCU3z-0000Yl-N4
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:13:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToY-0000Xb-GY
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:22 -0500
Received: from [2a01:111:f400:fe0e::730] (port=45285
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToW-0002Hu-K7
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhwJNAU4tt00Z/ghWtUs6PHohDtlr82o9uIO1ElvmkI2vluC5z9MIy6Ny9KL/X8IP4Rfk90njUqveDE5jcCFZ3Y9GUWNDW71bhH/phELCNWczmul7nu46GCjb/pXhEdG/OgGP2xvWWeRAhTi7xpseowHUhH726ZiYdXZJOQaBoF1+oTuiSjrCzxQPRPeMWq4vQuebgNWzFDt/jRvIfWx5j6QnZQr30FnQ8l4EeCBhjTD1okLOTz6mFoRfK5UisjwctNzRul5nsFeIYlI+3E+rd+7O5rvyUREJBK7oqpbkrfZ5MopxZrJnsL2o4XFYUmZagpTnL/hZzBbxxJNEbO28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjrzWS3F+KmQWW0jiwNbgkSHwFbDoFobFwg2Ef0pAkA=;
 b=K8c1PEre+z2u5Tnd36I4BPzoIgvO2+uySUF51znW11ytsVS/JKStV7PGF2xuLu6ekYY4Xb8yGzgNHlGuICthJNjKMwbSJVKZuC8D70SjtnLoiSNruitQyj755BKdSjpAQrZINR0ln8OxkWL4iFJ04gMeSZaPCp+P6Wr9BG23iMXpPQQV2aa+/Ssef7v8+BWuTYisTbPa/lckKk8v4/t2MzWj4C6wjWTnzr2+Bmrn9xhsKcvvUGxsE/JBdyAQ31h44RdMeBsrZEkM1Ltm2thdCcnYM2Zi+e/Ice2InZM4LyBN63tMeg6Li4LWR+cBaCjd3EL+6GKOky+FC2FtKWaRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjrzWS3F+KmQWW0jiwNbgkSHwFbDoFobFwg2Ef0pAkA=;
 b=pChsrKmaGDmQNXBqhH1py+bWSXIobeaAZjnSq/cSdc7254ivRKAtBuPvpXZb3sFOIF4XM4tMiUbSctNhMQcL1ow9L0XDWTv5un9goBiRTdWy9iC3TEfOEravhqzaiA/QeecYEUdw4BRlER+4pfwuONjGXr3R2J5NgwfzUrPyzjA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 21:57:10 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 4/7] meson: generate trace events for qmp commands
Date: Tue, 25 Jan 2022 22:56:52 +0100
Message-Id: <20220125215655.3111881-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9af8c2b0-ebda-4adc-d42b-08d9e04da2d6
X-MS-TrafficTypeDiagnostic: DB7PR08MB3082:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB3082800AB707AF454C95A4F8C15F9@DB7PR08MB3082.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NyBWizf9fpQm7ox2abWGnkm6LWClPZsonamU2Ax3UXNKV9YA51A08utXDVi58VmhmF2YFLZf9O3AZRyOGJl4/zEaVttovzDaT/aFmkVe8BZp+sRmv2QyxfHwjQTd8cuJXSgfiXLLVd7cSqtmWHFhORXhqpFSJpWqZ8xHwpFiQ95Kyt06DVkweT6WAGQwu8B0x/8kWR5lVSPsraVyw69GnwnqoLoFrJNOpOUf8ffn6T99LfGbeF+CsiNVO8NrKhci915LXfsdk9VY55NA1IF/0WMWK10Je/o1f8aUuyne9FCRqqleRHxzlZtVWeRox+BQoGIBYNEFHQVJDyB/oeEO09YI4hIuQwbaalyy/57l19kte212Nwh1g14wUhWz+9rwVWvpMwBIH/F4uQxMzKXF/oO9AMTDuHiN1EDcFd3LxmXsLwyuqh2Qp/aESTZEEdYBnvYQRWziu6aOjXh6GCFE4BgaYgvK5Xg50yzL1cVxfOg+tQNMGFo1abrmWc9GJ5pqtx3banJejrYKuskj5sUrjKECo7fD8HZnzBTlOw+q12ZuaF0WJ5jZep6tQiD4M2+oBgyBRDI3y/fPXdK02p0/rFeDfgDIQ8BwiWPZl+dy4/gghq3izBwRRffw3WqvEfok7TPIW6Tu7ZdUEdNtHGkxYd9Bdir1zgGBS/vMl+js6135W9IQvv3uF45pGqiiDwImJ5plYYiYPK2AxTMfxig+8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(6916009)(86362001)(66946007)(186003)(36756003)(8676002)(38100700002)(8936002)(38350700002)(508600001)(66556008)(66476007)(5660300002)(52116002)(6512007)(6666004)(2906002)(83380400001)(6506007)(316002)(6486002)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EJYKsw04mrqxq+N5dPnV0t0mwfTBk9F4bApFZlB+tt+xOYObGXCw+Y6eE+Ls?=
 =?us-ascii?Q?kUkI4CGz9Tnbht2Komv4R1911Lj5gyCWtHVmRDOZ/RR5z3djsIuHr2pHwiAj?=
 =?us-ascii?Q?BcaxX55tS5AusMjhmvJpHWdzPgqCNLGrMSAZ4Cb8XR0EXlpFV83rOFo3Kogl?=
 =?us-ascii?Q?KWL2YU+FuEc3fastUi4JeruP0vfdAJGSObwuhyOuFx29Qd6BeQnaDj48EG5f?=
 =?us-ascii?Q?fHkfwL2NgCwdOwoz3Ox5rBT75nWxwXLoC04bbQFre7fcyCLeZQBaCvouXjcE?=
 =?us-ascii?Q?QEZw4BEhOug1xo7/fkexEYNko9zClkCxylfwmB2ieFYn8ZzeUrviqzv7FvxQ?=
 =?us-ascii?Q?2bJSiKIkf4hVo8TJX4cw0NMNjnfyWQrxxzzrCKWs1h4SGoyMF3HXJkti4k97?=
 =?us-ascii?Q?3XZ4rqBkadICVtfVm86AIFgw7Pf9b5dtSAFAoFKufnEuT3e+O+XqZ7J6KzKn?=
 =?us-ascii?Q?FktVEZe10UooJxWtQBI+oYZdGVWs6GHiEb6qKX3/oBggR3ctGLbax9grxMxv?=
 =?us-ascii?Q?xdV88KrLMnwyS1a8QcbBUjlq+gq7jdXkQlyUwqSLlPPPjVqceuyKhpKEKu1K?=
 =?us-ascii?Q?h3os9mLz0Lb11FythRHUW9viNJOZpCiNI9SRkWLdEARU2WdLDvN9pkmswQL4?=
 =?us-ascii?Q?buzJtTpDF5jCaKOWBCo91hfUOfmaB+QeohalQ+yA8CbIiCh9CIapxzLF+USe?=
 =?us-ascii?Q?s9RJ4Xp7DvYkEcZzIGVfXbHXkVPDeI18rvKsVhKYRtAq3ceok97jd6z2cGb4?=
 =?us-ascii?Q?QhTYdPj7JMotJJE7jkk/ZbkifUmIlMu7Q9RiXtcf69cwogXj+hcWg9kuzj7O?=
 =?us-ascii?Q?5PZ6Mvh1xvfNsFT1x40EYxbhHcC5xPI7Ha4rZQbV8Euyz1CcY2DKH68Kl/ss?=
 =?us-ascii?Q?T7h3JJ8A2G0PpEC29UpriIg0ZaMQQM9j4bV07t1soHCdOxNJqnjuWpC3e7lp?=
 =?us-ascii?Q?qOW7zW8JaSAafPzODZp1SfMPQGHJzJlHNKTsGlTUbkNBvc6QWzvkbKT7QUir?=
 =?us-ascii?Q?Y7fcb9kRyPTJ7Q0VYHWNN8TpWuIgQyeizJrIm95yvUy5ZYrdjeQiGve+NadN?=
 =?us-ascii?Q?xIBPBEL3gNeveNGWB84A2vBB/X5dYxg/fm6Hs7KQWK0WX9vm8OpP4QIpATe6?=
 =?us-ascii?Q?tRIs68OLRJ3Zqhvl6msNdzBeBJ2tNlIKCMXoUr6a3Z1zYEnmnfvPnTEz+S/p?=
 =?us-ascii?Q?8keLOeFJaK5ICXpzKMHCC2oY9aCKdNdZHGmzZ1zJ/I7iVB4CqZ4gKt5tm91o?=
 =?us-ascii?Q?y/CN4jUE9HfrRBD/YZdOZEN6m6xPWFdqH6ON1hrVJGz231EvMao0ENhrnRmn?=
 =?us-ascii?Q?6LgPTSKGcIRPCuFqHI1Gdwaw4+qUXvaLz8FBE3ZJRCmfUFzvVVUOEhOjANWw?=
 =?us-ascii?Q?AmEc0u6Xi7Qn1CkNDBuEwB6BTP9EkT+IJrTduIIl4sRYCYzB5sZ2kUsgZn0Q?=
 =?us-ascii?Q?j8Duls+y3XVT+p/orO3OkSXn6s4L1I4CQx86oyfWI9DhZhz+2edplia2C9A1?=
 =?us-ascii?Q?KXRIcjQtglU94D0EcPtcd6UgyeA6ursJzZs4+f3fXq6lQaUrTF4poEGOlBiH?=
 =?us-ascii?Q?tIp5UMaKDs9lJyXXog5HwHeKPk1irhFs6RalpV6/Kl2uU2LrWimDW+5TUQNa?=
 =?us-ascii?Q?Zg13kJB2lYfkx+h8/JJUen6I5Fgc3dwpy4CHTV+PBLZ8mZYLe0BAHow+9MM0?=
 =?us-ascii?Q?JCV++g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af8c2b0-ebda-4adc-d42b-08d9e04da2d6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:10.3114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcqX2QyUGcSuq5NDgMAV7967WXpd0QA6Q1YKsoD7FSP5lcs309VmjuffWZusfQh3Y8BI9xMs+EQ4qfMxk461IewS5ay57YG9KZLDHuQW9A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3082
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::730;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build       |  3 +++
 qapi/meson.build  |  9 ++++++++-
 trace/meson.build | 11 ++++++++---
 3 files changed, 19 insertions(+), 4 deletions(-)

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
index c0c49c15e4..b22558ca73 100644
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
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '--gen-trace' ],
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


