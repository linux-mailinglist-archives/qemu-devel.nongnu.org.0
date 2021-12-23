Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7822847E21C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 12:15:24 +0100 (CET)
Received: from localhost ([::1]:56746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0M4B-00030l-Je
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 06:15:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxN-0000cw-1i; Thu, 23 Dec 2021 06:08:22 -0500
Received: from mail-eopbgr50093.outbound.protection.outlook.com
 ([40.107.5.93]:38670 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0LxL-0003iq-Bp; Thu, 23 Dec 2021 06:08:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8jqBztjURjmcR7MhR/uYfFNIbVsmcermqy19NOCb5FOmsvzYVMH1kfjMbxnZWbklCxQ6xZsJcwvRddwRcppiolzkeY6n+zM0Uv/5Gc16rNfqqJI1efpDU+2cbRhYcXeXb+FNrM2xxZGKAHoi/PBmQPcWtHY/jAKF8UueIg+HJxUmF7wsVKUBF7aY4Rq9Vx77eqf7puUi3VGXIWb1L6/tRc9tn202BvdwY3V5t5oKoZzBclgc7uYWCjDfEsRkd9DDrzaDX8Nx9lU+NM94aIsD2qIv7ZcvgVma9mUXpvc0dOLI72UgvcuePlkll1Ua8TYvbiQyjukNkws4Sfh9xtWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ClSq4V4URK3cLfgjYqlGp9XRSmGRnwp0cdFihGfuRTU=;
 b=doMIrFpMkmnwmoZ65zJXryBw4vszdOaaKSnCU6DzG6d9puqIeV8Oplg9JtUsmuYi4c4li6WDZ2wZ3+2+jfLaHwfGjecqHw+lUqzUZWvFw3TY+ZpwkEuePAWbXOIcuR3BYqWrpR61MvbhjOrACWmjpTGG4RcoPqwIxzwlYxqOzu2StzkW2JK3AIfXqwL8dnebfBDJLCRL3Go24dk7cqaFOoD9asMst8zgiCuQ5D/33qarBB4c1xQv86ZBQUw90LIy5+Xr+POdcjTstTYoltSvzUm2mXl6GYw7v/K2ISo2oSAyR1IWGcBOTq4kjz1vcMyCrWY5Nqn76AGD15KZVLTieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ClSq4V4URK3cLfgjYqlGp9XRSmGRnwp0cdFihGfuRTU=;
 b=qXkLp4kn2enWlQNVBX+A3+WfS/AjQGMJbP+WnTtWF7NCJQzjZRY+GDeLSwOeyS+6f1ddC5oWxQ9W25dqeibFOBmV+jofj7WQhAxUyvxyzNvkChPudVY2ZUAnuKMszVF52+ZP2ToZMoSiUQD1Z71wMW0k0LgaZL/AFLxKxe50MAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5393.eurprd08.prod.outlook.com (2603:10a6:208:18c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 11:08:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 11:08:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, michael.roth@amd.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Subject: [PATCH v2 4/4] meson: generate trace points for qmp commands
Date: Thu, 23 Dec 2021 12:07:56 +0100
Message-Id: <20211223110756.699148-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223110756.699148-1-vsementsov@virtuozzo.com>
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1db8ee25-4080-4ab1-6455-08d9c6047fa4
X-MS-TrafficTypeDiagnostic: AM0PR08MB5393:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB539306933C53CA98BB6A7FD8C17E9@AM0PR08MB5393.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7L/2i3waU4XrKnZB2KrpJgLO4kmbpAObVnll4m8DBwm/IQiwNq2JHClXnFVhpLfqNSlb6JbqRX5ILR0yV3X+LNHi5oGiKKlcnGw2NGGi814UPmJLGeBgFz9uz29xTzK8gdJIVjy6qZ8btGry1bGCNAxp/or0q+e/YqBx0XUjQojWrdOZcEy1IZI67dvTRixmV5SARyL+M/rkqzKaCSDNMz3hrB5B6P5NLPQL4ksfVCo2jF3OaZO3826gZP7iYyuBHlTa1uyN4BS6MZ667KGIXWpto+zshFFq5rMauBa6oRZzpsvoZ9gfKlqwd5b3I63SVh357Ox1mpqzmJr0w34txXCjU2j/WEGVKyYnnxnIndblqq6a6E7hpJTKEgRYjDmQqzXpxXtZV2WSPOC0di0xcuY6+JrmtXJhkNmCwu9sJJ+grAbbkxPRmkXHqtIk2CCduNayCsw5DFtX2Ui00jkmMWQ3MsEGzg0DerzLrsAOgo9XhkQ81P0ofa+RKhcjEhoia7ijTyyr3+xP2i+pv7u8KzJtFeodKNnIo6KAJ26NoqLj2mUNnCYUEk8soz5HqyfmP7YQELYDOOPqVWSyPSv/Ro2upLdtWo9v+5E7zkARm9SdSeJHWmW7MreDv0oe8rjBkUmLYsu9HpHg6oIuA2ksevoGReFaZTQpE6qfl6EDkLKR34nTN4WQ62DUjK8Vjj3HdCr41LxvgMgsjEPiAJs34wglkIO2oUthsyWzkBDx45K7IVbfpjAtV4saEXHi/zRn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(8936002)(26005)(6506007)(52116002)(6916009)(36756003)(8676002)(316002)(508600001)(6512007)(38350700002)(5660300002)(4326008)(38100700002)(7416002)(2616005)(1076003)(6666004)(6486002)(83380400001)(86362001)(66556008)(66476007)(2906002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k4jUrucusE+1P5D7bnCw5A7SssO8fiDn2YkMusF2JeULsNSW55Yh/756i79P?=
 =?us-ascii?Q?kwUvhadRBrzcXpS/zZVAYueGho5FjxTzZ+DH9dh1QFeTwLphe1ZP5Sbo+b+6?=
 =?us-ascii?Q?l/dVD443DW2QfTE9LpVmbNBOEcRyW0RUf0hW1GMNGBigPyALSlL9QYC1qUcX?=
 =?us-ascii?Q?WiCr/CXY3ngxaAKhucNxtPfqlfszAtv8Yo9/TLuBH4RexEKLGSnp9k2mbOsy?=
 =?us-ascii?Q?iTpthVS7XumbyeaHM91OpjwkVfKYuUgRLG2lnw4klwaNekfS9CX2nZfrI39n?=
 =?us-ascii?Q?V5JeDu24b+okK6k/Cq2GvT5SRRlC1odraYrzRNIqhQe3aKNNT3W/pJI1tCFt?=
 =?us-ascii?Q?9F3wKzKtwQytc6DJWwBpJosgEE2a6cfXY3Ptr8yzUlCxoTRaPVEEQGtgh37n?=
 =?us-ascii?Q?IENiM/YMxfWXkM0vQJyFO3Vt1qWPywnWm3Fhm+yneDwGg/jEQ1hDD6EWfscJ?=
 =?us-ascii?Q?R/yjDQH/lbMmsr0px8/wziD2slfgWCkAuD05R6v+MQg/rxN4fhrKy4IPE+Rc?=
 =?us-ascii?Q?KXCQc/l7nfbJlzVqH/3CONY+0aVvAYT5QyatBHPy7gTUHiRkyuuXGdpPgLE0?=
 =?us-ascii?Q?+Q7c4wgFjNQlhwFPxix/bcwvVeugGBClob7tCArdMLwjwIDMqCQD8dGKtGBe?=
 =?us-ascii?Q?axwIpuqAvVekuFIjAB/ArHO3jpcghGR10oIb+aYhF2jLKu0KJeJe4FpEpRMo?=
 =?us-ascii?Q?NBJJxp+aHbVg5lPWGMY9pqahttlXrt75JjkON2ur6H5jAnyDa8pwfVGCS51p?=
 =?us-ascii?Q?HTo+TresqMBTZNUtedbrb7nBfjKj6zJvLksXm+HJWjFL/2LD/q0NmEjAewY/?=
 =?us-ascii?Q?8WggQZH4+3fgIT+ReH2Ew9aHE6592EpryXapOHkFlup7VzhxI954Y/3bF+Fd?=
 =?us-ascii?Q?wJpYlwpI+JvwRstG4HQPb2b60h4djcXOeH43TgpNeMvTeuphZwsAi944qxcd?=
 =?us-ascii?Q?81ErioqB6HUXEZJ8hToLu3lMmgPLh5jxbRSxPoZ00A9sdcDU9zXGA+Qkxhbx?=
 =?us-ascii?Q?V3uZ4VL7vhqtM9inQG7Awibcqus8v4H4pnSqNeA9txIu5kpLKW3fxRIOSD/U?=
 =?us-ascii?Q?das+CM4aKporavDLiRfXPgM7PXEWCbbZM2IWSeAEazu6coecJdYPrGAlHcq5?=
 =?us-ascii?Q?8HjjCVHhZEj02jUytYhVh1RdvnH/WVhnFCMdQtrWbScuNGi7MiaVEz8lr6R7?=
 =?us-ascii?Q?zzAgf1EZ26U1zHkhFjKZC+y+gigc/cziWgapiymtjZwYy9vEYMQ65RMHpgvx?=
 =?us-ascii?Q?Bvu7Oqn+vdwus/ImCgV3Z1aGxAOz739Sq2tWub0i5eXCIalSf8mYdHXWP/d3?=
 =?us-ascii?Q?yacbluWr1x7YPP+DXA52+vdQ+maFtnUaPi56KrFADsxiL0Etk/1EJ4l0rZjc?=
 =?us-ascii?Q?5NRf6AFzrtVbyDLDHHwSyDex3I/tKNhc+K4KYzlCaH2PjT0FIeSLsB9Rl12C?=
 =?us-ascii?Q?t1NkstcZNxksXNJFRboytInII84L1puVFUucPnxx16AIuM2zsHWEJfduDs8I?=
 =?us-ascii?Q?kACS3moJqIVZH0Oc/tEdcUJcw34+LVPOUt6W20Ity0Tjd6Iv6PJY4zhAlRLX?=
 =?us-ascii?Q?NJy6hYUVoiwwn357+B2pHrtLuJLGGdBIOt93mfybezDc7OrcKXYvAw7y9GPc?=
 =?us-ascii?Q?SfqNVPtCEMVQfft47uGEE3nYTMCy1fam3LqM42RGNl1AAhra/kIoblLwYsQo?=
 =?us-ascii?Q?+RmUKZRb0F+r866szARtEDy44vs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db8ee25-4080-4ab1-6455-08d9c6047fa4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:08:07.5159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1P52gn9dLqw7CsBqHkFSWNs/GQIi7osAjgs1iIvvx+utvXwK2eMJHKJgNOILxHKCIzSOR6pboHXIMPO808DDt7t724mQHJLsgSVq8Sa93E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393
Received-SPF: pass client-ip=40.107.5.93;
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

1. Use --add-trace-points when generate qmp commands
2. Add corresponding .trace-events files as outputs in qapi_files
   custom target
3. Define global qapi_trace_events list of .trace-events file targets,
   to fill in trace/qapi.build and to use in trace/meson.build
4. In trace/meson.build use the new array as an additional source of
   .trace_events files to be processed

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 meson.build       |  1 +
 qapi/meson.build  |  9 ++++++++-
 trace/meson.build | 11 ++++++++---
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index 17c7280f78..fcb130f163 100644
--- a/meson.build
+++ b/meson.build
@@ -38,6 +38,7 @@ qemu_icondir = get_option('datadir') / 'icons'
 
 config_host_data = configuration_data()
 genh = []
+qapi_trace_events = []
 
 target_dirs = config_host['TARGET_DIRS'].split()
 have_linux_user = false
diff --git a/qapi/meson.build b/qapi/meson.build
index c0c49c15e4..826e6c2a0a 100644
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
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '--add-trace-points' ],
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


