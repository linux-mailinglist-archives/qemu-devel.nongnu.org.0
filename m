Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87749CF85
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:21:48 +0100 (CET)
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCl3L-0003nA-88
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:21:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCkuB-00022j-AW
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:19 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:37041 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktu-0000NX-1f
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8DOuLQ0jVJmymJZYPvTT1fWRb3LB3cLGUIBdABDcg9cHd/zs/D5uCDMiOK8pdMg3MzxE0hYlIHDTb1rtNGeG9ElNaqNmltNetTWyhoTuVcc5hSVBGy95ORZLCjiLYIMM1vVKmu9jEX9Z7+9cji5+VPkuG+dP9vy9UeqPb3sV1KzJ1r0g+Aj4/cEv+YoqeezWV4ruMUOm6KtDdxl4tpLBOhK/KyQr07HtmlOYBvPzI48Nq//y3oKzo93+jqJxJ6k3IZNTU6IZszn76EAi39djtl160iji6q0liWyPc4TCJHNYfujO9ntXgSyv6Mghftvd5ZamfJjdi2KB/Z1B4gP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bcr5Gd9r3NWBqGA9jnh0Ag1jKdsIxaXHxo6E8UDRRk=;
 b=nciRpHEiqjKfyuUzISjvNjQ8GlX//mzJb+gaOXfRxuHqj9W2V+7ievSI2S/YzZRjFvgL7d+pQXhofPGGZdfhNOGhdm8sWpx5v2fimtKwjQLYuvBFNPv3/PncD8+KCY1Nye/BSgvfImzQOwOwbO6MikK/2wnxjdtJhBr4QiDPy7unZWOGxi9ZewhTrVTPHk1hPHiobehVFqLxO9osHpT2MRP/qDPViwuouDOZfzIGE7r+SR9Fxkq3oFnEnoozDnp+FXXaw053EpuOIDYV4WReZx5Zla+k2klJlvEA6ZuW5bxVWIrX6+CqZwRYF8WfoZr97GgE9lpIXbTL3w4Do92rZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bcr5Gd9r3NWBqGA9jnh0Ag1jKdsIxaXHxo6E8UDRRk=;
 b=BJh8PMzWGJpOhQD3sCx6FzQPiLcB87aN51awfCEYYFS3NrqQx16u8lUaLgNLghdvyd90o2cRxE9BJngeLXT6oqdmMqGOCHwFlFOd7dqWiG4GYW86CJTwokYwO80jil6BMn6Qn/vB8PdD6OAIQMhWdLXds48dPh5t+eDDZ7lkq98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:11:42 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 4/7] meson: generate trace events for qmp commands
Date: Wed, 26 Jan 2022 17:11:27 +0100
Message-Id: <20220126161130.3240892-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad1772f3-f439-44ef-5b7f-08d9e0e68a6d
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB58680E649263535767A8C18FC1209@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 52ylbriSlW3QedZmti78EdFEA3somT23rATcSRDIFgZBt+bJGuO6BCRnpGnkq09ivFKIQG31X9T7prAbMixtp0kMid+jQ9QQEzI6z22iJoZRXzr0uwxK0oTDf3cH2R7M2C03Wm6I1LFEOu9x8fhiD1M72VeMKmYfym79jcrwfOFz9pNGBPh+z97oWanP4aQQV0qukyE7lvZ522MupWxEnHCWExiXvy6Gjsc2fnuOf4XClgVR+1c5BRyborl4T1TQpxFa/N/NKtH5ZoO0gn74lWlWP7CxVhlIjAF0gnWjLk7hZBoTHdjdQ3uAB8WkMjhVSaBHpdFLGKIHbOmcteVfNKJC0rzFh04TXiZkCMPQmbszH6qWkd1Pq/IuTsupDS+psGTgR2RJESi5nblXxBQkHG/dtqE5CQ/pfbZKFB7HhH27HO5vqnwL6HRL6l5Qevo749vq0ywDfeq1kmj5KIB0bWFjo09GbeqL5B2+Z7bFLMVADzXi1do9cFnqqm8IPJUJCNuvHeJYvzH6ZM1tTwwBf5GOFMA6SYfRAKO/wXUEuT3fG+knc+4EN3n1bF71QQ0acMC2fxiJJJTww8t7jp/IVA8TpLOOOCRitEfmpNKV0W7kQrF8YvCB4YANu/1AWdmx2yRGvYs5vQ2qAn7T86Up1Gh76hA9HDEkdTH9IBvwBA6b3x7N6fq6/A/879WiSM936h7xK59/MLw11KypKXUtPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(83380400001)(8936002)(6916009)(4326008)(8676002)(26005)(38350700002)(86362001)(186003)(38100700002)(1076003)(36756003)(2616005)(6486002)(2906002)(66946007)(6512007)(66556008)(508600001)(6506007)(52116002)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FO2TyQoNh6Lvi6Kbj6R6nMpj3yhmKByLJ/lJx/cSdZXwm3gi+YACVEnvn5G3?=
 =?us-ascii?Q?Kn+bywwZ5RUwtR5BS7enVa2ezACZN8L164GtiY5zNUGofbze80VSJfhFvhDE?=
 =?us-ascii?Q?IyNuwNlDB0+/B4/OYEvsEu7BkQKGaKEf2I7SJ7TOMjhSzFhJD02HDy6IWxhN?=
 =?us-ascii?Q?WAvVxDAnfR3lHToQIZVcKzWa0TRYu7Vm1SY5CQoKSHaEJO7cVFHOiHdKA+Je?=
 =?us-ascii?Q?AQenDgIT7AlgesYzcfJ+WjRIlqP/Y68Vjfc6koIelPz1aJYzuHtmo8ot0y1w?=
 =?us-ascii?Q?QEzRXikEnyil4FyHppXTeImB1J5gKB8Vv1Ym8rXP9yeQ5G1YRbXxH6e8SMvt?=
 =?us-ascii?Q?+HGxNJ1jxbINcv+yGsEx4LT6Bka+g5tdXThKNWuE36Y3/wddUCYZB2GgSCpO?=
 =?us-ascii?Q?XecMN45clJUveKvHxGDWfyMPauZOfbxGpz91lFsrDMaCXCcJLfr9JX9JkUpr?=
 =?us-ascii?Q?SSi3hXMQZUQU2QgMY0n89mfgId3DSgvwA6tXX8ZvXwayoGF4p9+kyLaWbzo0?=
 =?us-ascii?Q?fB5HB6ft2zmpF5vokSw/VRjfd7i1bkCtDx5wll8NHERDfx9nKi/RWLAfcXum?=
 =?us-ascii?Q?o4HTGvvH+ieSvOWVwbq5rJYX9uNPaqeL5gsp5yyHyXPQ8NQcA5erhY0ux7yK?=
 =?us-ascii?Q?BJGmRZjqIbtF8Np83YN8m8D2S+RUysXqlRJZVjvQ/xM+3IIf/1Ibt78Oipxb?=
 =?us-ascii?Q?vTiERrfuq1u1wg/V55XEGJ68E7D7bzVqKsjHqMnrszeoUnl44a/8xdFW/AeT?=
 =?us-ascii?Q?sOd9DRZZdB4RUC4FaR1cpBhFyyvQ5YxbKMsIXl8hdpQBVzM2pW9CgXKLMdTk?=
 =?us-ascii?Q?tNtvT2EMGxdaI9arKuPeAwPOMpHcd+usX9PiuNd5oHnvtonZHGzR8NBbSLL3?=
 =?us-ascii?Q?pi2mc94ik/NKvbTxMpgpvjzjo5Wm7AcE7rhFzWqIy+a+gVZzG/eIU/hpdmZD?=
 =?us-ascii?Q?nIVuUQGLD2H5zIdQGOGw/6ax5fXxeCe29wLwI1a6wiqIpYnTzpKwxm57cONb?=
 =?us-ascii?Q?SxLexcrSEewhdvBsbmUxUwEnlt0mWrEyi8LEvKD7NNLX4v1ydI5KJ0a/g4Gh?=
 =?us-ascii?Q?1MgC2qijpYQJOtOkAmnIalCDsffuw9sC3FTtTUfb7C06eChts/9Rwu0G7iUl?=
 =?us-ascii?Q?EjHvCf1hVG1Qkki0VvqbsfL0VcBsceBFqCe6YylgauTxa/Eiek2Tc5rA4P4A?=
 =?us-ascii?Q?qc/HCu3VsHURHh6c2oyRP8t7yoarUzvsm0D0lPA0OXjJgpebBIYtZu39iN4P?=
 =?us-ascii?Q?XfMwBcc+eyR9Tik4ekudGPjZL7bvEKYHWAKMzQw82u5BE8I94UEooY2UJKfu?=
 =?us-ascii?Q?ncEZ+zCL7eYC1wczqZHKzZ4ND+8h/RRbeRwM6v0Wu4Iukt0/DZ5U9EwXmS2l?=
 =?us-ascii?Q?6eP2QU+SexqSGL1YPfXl6/xQibkmvUEz7Rc/qTKyMiy0dIufGHw5CUkeOe4U?=
 =?us-ascii?Q?PvAJBSQ4tjywxgTriluVe7E+XJRkC9voPjslQx1dePDvq5daDel0pBf4QmC1?=
 =?us-ascii?Q?mCnSJ6zu6YRfuV0eDMbAP/0eGgxXeFyc7fK7ihtemNooqdakH4S+8hA4Pw+L?=
 =?us-ascii?Q?73t41fipnCztODhoxehsoQ+KJEShZY2WzGkIHCpQfaI4re+ZYvf0hFApSwlf?=
 =?us-ascii?Q?Rn38r9v6pWsHXGmG/tHGl56hEooq1BKdl3wQicQZgH3IqqSC7wuHvLk0t7GH?=
 =?us-ascii?Q?RRFaTWLW78q5Yt5EK3P8KPn84oU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1772f3-f439-44ef-5b7f-08d9e0e68a6d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:42.4960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkX0/YUFSksHYwlb1LUykpuh/yq0S0ozsj1xZooFaXIQViZIA3i+kYWZwOfHc97PKPdw8dZW8nDTX+Z9ZZpE3JOdYeWMktL5nrQkEoaP0u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

1. Use --gen-trace when generate qmp commands
2. Add corresponding .trace-events files as outputs in qapi_files
   custom target
3. Define global qapi_trace_events list of .trace-events file targets,
   to fill in trace/qapi.build and to use in trace/meson.build
4. In trace/meson.build use the new array as an additional source of
   .trace_events files to be processed

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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


