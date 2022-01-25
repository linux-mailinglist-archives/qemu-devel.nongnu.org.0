Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05FD49BE36
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:09:35 +0100 (CET)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCU0N-0004hc-1f
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:09:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToW-0000R7-O5
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:20 -0500
Received: from mail-vi1eur05on2093.outbound.protection.outlook.com
 ([40.107.21.93]:28729 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToU-0002I2-PB
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLYD/D5pE8TcUAhw4HQuhqe6Xqrir9iayS0FQmI170Oc9c3P7PeX5Qf9G2cnaaYmksdv5rzRU1a/jKrVXmYNkDu+wtLDCI8NBXqbIDmFydmdM21/hYAJJBhybTXCe/LW1iiMLBBUgZDKPAJw5sEVFUK0E56mZ817Qyzwqrkd5hMx+ACmWrGEV9QTede9PQs2A6MCoie1PlTxuqYdjz3QPeA6GJ0a0YnNwbXoo4s+3L3EDc8g/hiuYSqDFPqCahof2mBFcou6600fwHftR0qwlshVL4pMA82wF6/jn+R0xh8h74A6zCT1vRWnooKDJF1Mj/Xz8/KM1tI5HOqAqXAHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytXxYm9ovkhSqtigacldQNz/bonN4YOUbPxQnBeJaOg=;
 b=nZafROPqpo4sLzGf7fxvdq3udf/tcN8C2iGJrErsWNKZoZkCKPD773yWQ53M4bJsfR1SqqPAYWI7wTAC5JnP+X4/XAlGKsVcWqidxYdi2PBV5mTkmVJ186y943sNM/KIrjxfYAuWRBIj0pBUK3/WvfjBvlhi9TW4aX/08exxoFdlo08CaFc4frfvFjZcGMU0I0foUrKos4zhCbCATI8Du0B4yNn1jpsauQFSurbOcMJ8XmT0ag4bJ9sa307EWaIln87VqXns6PAg97yMKTHIfWvNPDn/ooxdBaacoL2SOdDZheUQlF2VYJKbGtBv0ruN8dCK2xFzvexSHQebtMmYXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytXxYm9ovkhSqtigacldQNz/bonN4YOUbPxQnBeJaOg=;
 b=LW3ZVY2+j4vz6hc9IHycX1/tRBDHZVYaEibIYu+ruptdNlTjKGV2NmBvbBRJX4mrWF+iQf4twNd7f8bL8wr2+7ZlH2vrNUprIPIRmym5VohpfbTSAUnPrerSuPBwseIQ91tBkWIJKbQCvvnNUYG4VVoQ8ZMar2YMcDrxhbfARP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB2946.eurprd08.prod.outlook.com (2603:10a6:208:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 21:57:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 7/7] qapi: generate trace events by default
Date: Tue, 25 Jan 2022 22:56:55 +0100
Message-Id: <20220125215655.3111881-8-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 11d8f37f-00a5-4474-0ea0-08d9e04da414
X-MS-TrafficTypeDiagnostic: AM0PR08MB2946:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB29462E7FFE96010F91FBDDE5C15F9@AM0PR08MB2946.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:785;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fJRktqpwyixVi54Jndy+c+wf9OSZpaBbEFnnbQW1c2+WaSiVAb8sSNcs3Klx8jH2FiYwwOBH8SZlNjzKgqnu02hHy2vbqM0+FYN4bYRx8MHE0vhCQcBMn9EyhctAr9WaaBCavxf28sFaLtN/oFkPvth7jjWNkxh073oCAUZ6qhoutABP1+pWutg7Xf95bUnlIkgI2apNkdcMTRHA8WpXNTR+vV5zKcKXIu+AOaI6nyJrIheERYmP2QEsC+yaDJGAP1lyJUp7e0Rj+pT/jvveLdOE/8GlBJaHIvOXt+jv82VQ1/EyQgO9i28iDqLaQCOvt5zWDWHfCCNgHJBEwxjY+Usw6fvsut/OHeYuwlz9zFfPnQdebzO77q2PylkU8lr7tnSx8+4SyEFQ2mH8VxBrOSYc0V2yuonwNEAgpbENh5VZnDmD7DqSXE/rVVZRcea4M7J3GgZ4KMTQhcsJw2/CqIPLXQglQ4n2yKQllnDT7O89OvGGKFHmoLYNhj/y7ihzpAqp8MaNUXclF2aUhsk1kKR2GZpdieGA8aNfsV87F3JQzGjBSvupbApuqYZBrwFCTtJ8V6Et2KGk77h1KKafOErnvvQkeagn0lW8CFzud1cqTCEpbea/uHiwQnR3A666GrbnohDzYDMQWvcis70wM45/i0PW2IA1aL8RpxqbMwKue+R4chnUcLQMvoK7aixxsQ1+kEie3z2hdocKLHCf+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(508600001)(6916009)(66556008)(6506007)(66476007)(8936002)(186003)(36756003)(2616005)(52116002)(4326008)(83380400001)(6512007)(1076003)(38350700002)(5660300002)(6486002)(8676002)(38100700002)(316002)(86362001)(6666004)(2906002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DPSqspuXMOo2IAMZjfjErG1k1UwoP1C2Jl+SBVQQoqWUq5nGIPu4HS4abZ+L?=
 =?us-ascii?Q?L427G/YdJlS2KabftTXWdqX4qwEVUoCYJP1VZh4mC+Kj6xT6aqNwRJ7k3E+I?=
 =?us-ascii?Q?GRGz+mfV8gSTydN0ELQiAHjmGb7Vl674kHCcR8N1kKfUINTEJk+m9HomQVYu?=
 =?us-ascii?Q?1qkKq+sQwPk0dU2mfTa0PW2m6nkN9RA/Ckk4veXI97KG92uAfVRAUexSMpGQ?=
 =?us-ascii?Q?49C13NcNx6EnsCneDvopZej+f0hGKxKS0Fq+lTj3MttXLslvGKs1yNJ49r6M?=
 =?us-ascii?Q?BB9Q2X4sPXWDqtGh1V69T2ej1f+UYvZvmHAr3Uwo1RrgJzW9SZzyrj0BI7m+?=
 =?us-ascii?Q?otfC8uZmh4nlYuZQjrCl4PhThBs2wMEY6Av/0TSS9qntkArHa/nEHmSNtNel?=
 =?us-ascii?Q?CIyC7VyVfFUaYmAuy33M1DPSWB1AaZoPdRJNv/RNRTLwrWBRPP6BSHLagT/F?=
 =?us-ascii?Q?MWuHO5OC0ydUZVOsOB83LxaZYNVQbcOvwV8oeHtC3T5LDIKeqx1WEhY/9wMj?=
 =?us-ascii?Q?q3x9NAJnabc74XSkJJcI6N5l5JDK+oQN3rnQgtYh1Vrdr4MRitJc8WD9SQ0Q?=
 =?us-ascii?Q?jYUcTcQNtb3f3wlBF/19ohz8rMREZqRY186LJrMufioKiZgU6tuQWwq57rAK?=
 =?us-ascii?Q?QA/ouWIFg5B18TbyDD+jcw3ohXwDhXcDskluMI8BM9k+BS5KQ5gl8Coy3aIZ?=
 =?us-ascii?Q?X6x5skVWpEIhEFnarnuwr3TwreYXYB7o6EUfVjtM6CwHhJOWUqlYW9FOj0A+?=
 =?us-ascii?Q?zGQkLI4bKBiJOpO1qVyqTsj66fMcxMdXc5mnrfLFWXlE5Ft6qe/Vz7Z2uhV5?=
 =?us-ascii?Q?YpKsHp14Wta0hn0OkqQp8NeqUXC/SS03JX3ryIlWlMeWjLLDzROE6rWac8c2?=
 =?us-ascii?Q?OG3yq2Hbgmb9ZDOcrETjFcDQLAQAjnBg9Nm611seMttvha1UA6kSCbmLfNXH?=
 =?us-ascii?Q?QaJ17mkBZR0Q6AdNv8t6YQrdugRCmalp/lqaAwZ5ZWWjvfOqVBMgYuQ+y4hy?=
 =?us-ascii?Q?iiFV61jeC+3dsTe9Io5zb1aHtCqQ5SrwgFasuv2o5zHSU+OSqKdOH/kOBlEJ?=
 =?us-ascii?Q?5sh3fnDNeFyE/Kz6CnhjAPdjTT71P8sd3fkcPglhLTT5WCOFpu6kA7YYCz54?=
 =?us-ascii?Q?q3TKSN+sb30Yh+Y3O58UXTvIM5nj9nYsvqFihr/+yspvAzcdOq3F6cmhgL/y?=
 =?us-ascii?Q?M9p6/coKuC2eniSqKm7bElMxVc0e9Sq+HEdzgzRJPJ2/+2qUGQsTqtjmxIp0?=
 =?us-ascii?Q?7h7H2R3/um+PUUyH5PY4v1//oNXa9BX9911VH2rawL3ZHAmOLwPR4ClARJjs?=
 =?us-ascii?Q?ccWfxnkut1LKLb3lXIoLucP5Lks5t2QoRLTVy1h7HiIVLfyNIoWZvKINbMXT?=
 =?us-ascii?Q?FQ5WcZ6IUIXnzvi5A4EnFIftN5OSkOfqvvAXIRqcWr12wGlSCIYMvqaXNyA+?=
 =?us-ascii?Q?MQeN3azAhuBO/LUxYr84sxlt6JRLUDZBXoYXYr9XxguImLpL1smdmwlhh3OQ?=
 =?us-ascii?Q?v+KnUTU7pRQymnwX1Th9bpd4OMn1qBJ3WHZfEzNWEzd5nXCH5+q6Qc2Vkg3b?=
 =?us-ascii?Q?yJQ3pYhdUve6+zTV3Zn3AZNv5GnNWp/l5PtBQ5tWlu7NxPkgMlCHqAexxi/I?=
 =?us-ascii?Q?71+HwouQqRqgqXAEjbjy96IGZXeq+ygQv6Ndv+AXSH6tiRSiUaa+G4VhPxOw?=
 =?us-ascii?Q?eHfWiQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d8f37f-00a5-4474-0ea0-08d9e04da414
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:12.0610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yQ7BcYlGJqiXR0ydfV2QROKKvMPmnQiFUNhYmvhQjvxvQdNlvTSufemThcCE+m8VnNRngbcfJMgeO8p+rx7ZA4nMvx77wAXfMWUBJzAjlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2946
Received-SPF: pass client-ip=40.107.21.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

We don't generate trace events for tests/ and qga/ because that it is
not simple and not necessary. We have corresponding comments in both
tests/meson.build and qga/meson.build.

Still to not miss possible future qapi code generation call, and not to
forget to enable trace events generation, let's enable it by default.
So, turn option --gen-trace into opposite --no-trace-events and use new
option only in tests/ and qga/ where we already have good comments why
we don't generate trace events code.

Note that this commit enables trace-events generation for qapi-gen.py
call from tests/qapi-schema/meson.build and storage-daemon/meson.build.
Still, both are kind of noop: tests/qapi-schema/ doesn't seem to
generate any QMP command code and no .trace-events files anyway,
storage-daemon/ uses common QMP command implementations and just
generate empty .trace-events

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/meson.build     | 2 +-
 qga/meson.build      | 3 ++-
 scripts/qapi/main.py | 6 +++---
 tests/meson.build    | 3 ++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index b22558ca73..656ef0e039 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -127,7 +127,7 @@ endforeach
 qapi_files = custom_target('shared QAPI source files',
   output: qapi_util_outputs + qapi_specific_outputs + qapi_nonmodule_outputs,
   input: [ files('qapi-schema.json') ],
-  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@', '--gen-trace' ],
+  command: [ qapi_gen, '-o', 'qapi', '-b', '@INPUT0@' ],
   depend_files: [ qapi_inputs, qapi_gen_depends ])
 
 # Now go through all the outputs and add them to the right sourceset.
diff --git a/qga/meson.build b/qga/meson.build
index 79fcf91751..1f2818a1b9 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -26,7 +26,8 @@ qga_qapi_outputs = [
 qga_qapi_files = custom_target('QGA QAPI files',
                                output: qga_qapi_outputs,
                                input: 'qapi-schema.json',
-                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@' ],
+                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@',
+                                          '--no-trace-events' ],
                                depend_files: qapi_gen_depends)
 
 qga_ss = ss.source_set()
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index ecff41910c..ca1737aa2b 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -75,8 +75,8 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
-    parser.add_argument('--gen-trace', action='store_true',
-                        help="add trace events to qmp marshals")
+    parser.add_argument('--no-trace-events', action='store_true',
+                        help="suppress adding trace events to qmp marshals")
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -92,7 +92,7 @@ def main() -> int:
                  prefix=args.prefix,
                  unmask=args.unmask,
                  builtins=args.builtins,
-                 gen_trace_events=args.gen_trace)
+                 gen_trace_events=not args.no_trace_events)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
diff --git a/tests/meson.build b/tests/meson.build
index 21857d8b01..b4b95cc198 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -45,7 +45,8 @@ test_qapi_files = custom_target('Test QAPI files',
                                              'qapi-schema/include/sub-module.json',
                                              'qapi-schema/sub-sub-module.json'),
                                 command: [ qapi_gen, '-o', meson.current_build_dir(),
-                                           '-b', '-p', 'test-', '@INPUT0@' ],
+                                           '-b', '-p', 'test-', '@INPUT0@',
+                                           '--no-trace-events' ],
                                 depend_files: qapi_gen_depends)
 
 # meson doesn't like generated output in other directories
-- 
2.31.1


