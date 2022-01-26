Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EBE49CF82
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:21:38 +0100 (CET)
Received: from localhost ([::1]:44016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCl3B-0003Po-8p
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:21:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktr-0001wa-Qw
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:00 -0500
Received: from [2a01:111:f400:7d00::72c] (port=31064
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktp-0000NT-1S
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:11:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tzwy6/jxxHTX+TXk6juIx8oDcPv4arIhiRvaCREYURZxsJNmfqOIxw0MopfStmqhMnWY4T3kgCdgDy1p74+lj/5ClTYD5DqPTaCE+cXRb+MWs/q9lSIihAzrhBUjq9kjzI45k4VunwOmYwZ2eyXCN+v/2Mm6HDfluKAm4/xEAjQAs6pWGWCGrb2xMGH7kjqQ85PkInghaF8G+Nmy6rrDXrFVHbg9Uda/cLQf5yp0YssHBEx2urLOIqRdnzQ3TMrFlRIu2Xtd5bk/qdS0jsXYXOR4XZ9mFX2uN+eoRTaXqzZhwAOhO3xV70lQIQoW6dUGy+GhMQWRe1Nve7L2U39AOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1OF+ppfUJ6vJ0xZ1mqacMZbELYjIcho6rXeCpsPMH0=;
 b=MAysYXmz8WG4UiytRzKhXtE/+UFrYfNDUNvOrDPLqEaHMGRATwovF7uHCMiJUhtKDCQ7x2ITJK2hQXThIiXEW4bi5gV8s4ommCxXT1ejYxnnzbOsdr3nve/GccwmpVYNwnAkdstHLI1/71yjnNiVVrvooyn6ATiA1mZemyT+CN3PdDUtSeCbxlbLWHxndP4O5z0fKYYhH5nAqUhJpalvUWjpLXy50rty2tzWAaxEhI5BFHn47+nyZeBlF56+wEsKAOqiUT853Ea9+Gfjp6YMWyIATtT7Ub1wojwTcY86/tD0mvCJlzjkBWxPAyoSEdOOy7Bj9l3GVr//eBlA8gyZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1OF+ppfUJ6vJ0xZ1mqacMZbELYjIcho6rXeCpsPMH0=;
 b=V4EYDqiBIqUUjVa01y7zhgUXonVrlqYvVfFnpLU4UnrKbOKLisSdT/U674y0LSo0hy+60omydjKAHrtCEcV3TnAHMeAeTxrXRRqUbnT1ur9lsVKhJAUR9ys4LnsTaimXL+wB49vk/PBOl2wtsOm1ySV6m0OsHbm5I+nGPCQKA7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PAXPR08MB7366.eurprd08.prod.outlook.com (2603:10a6:102:227::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 26 Jan
 2022 16:11:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 7/7] qapi: generate trace events by default
Date: Wed, 26 Jan 2022 17:11:30 +0100
Message-Id: <20220126161130.3240892-8-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: c927580b-aeca-4ea7-d744-08d9e0e68bd5
X-MS-TrafficTypeDiagnostic: PAXPR08MB7366:EE_
X-Microsoft-Antispam-PRVS: <PAXPR08MB7366D01B3E1E17BB6F9EE2ECC1209@PAXPR08MB7366.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6cxXkoT60cWRoeOlbDosh/TptApWwdsrtSashuQzItSGwzrL1XYRbXws6lm5vHQs/Zc4MLPItclUBnUsBbMQGytkpAwpTOI+/MJjChxkyI84VJy6qTk5HDi4Av9VuSSMsNf5okielbATtaf2iIg1YDQAYj3XleC0ZuINvxWnI6gWtt/XMDh7eIhhrymPssvylqmd82MSKbjxnn5/u5cm4expQscLLWFvGod51p31nO+2I2E2vs4xsA9aUo9MocYYukTxgkB6+zI+45coMU17HsmYGRIPIZaDqjxW4ZCuYpp0qeXC7VbHBJss7p1DZEqgnEf6mBSn+CUuepY3/3y/lCxMEQ0JLfuHdOzw9QDw0SRr69MAeiULuL0XndEODksW9EY2NHsvaoT/vxS3llbACZY973/DBR5alFkuBtzOy8sX5/xDhx/65G7tJmuGii+PC1YecBti7deFDTN3WA4tCB2+q99ioalb4zhBz+pWj7rrhE2codq8QYYiUT1sstueRpSyVZtEUDAWGF2S7BJBIL9JziMKH8oOyBpEMMMdlCznCK6JySEWT51PvpMDKbOK+Hkl/GmOEfmwZ2gTUsNAdc819bpOTFFRa+YCMneHL0WnU6FzO2bWd02A1CNzXqy+2l3KmaNDtJQvfwy6URLdWgGMBXrCbsjDsSNtItxZNV1ndZuYWw3dzz81krLwG/YNQ/U1U0cY/2ek4deFIYfAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(8936002)(66476007)(8676002)(4326008)(6512007)(5660300002)(26005)(6506007)(52116002)(1076003)(186003)(66946007)(83380400001)(86362001)(66556008)(6666004)(38350700002)(508600001)(38100700002)(2906002)(6916009)(36756003)(2616005)(6486002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qcekY6AmrEAJ/ZHqIUMImDDkmT76AGpFhXvUSU8OXOHAfpB8lR1Z5d4025X7?=
 =?us-ascii?Q?6b19FZaQo1uUDD/cWGFQchGowJJM9pIgCProYh5eRCBXJNFlc3ir4hhwUZde?=
 =?us-ascii?Q?jFxSm7ueZahq/hsl12tVlakJkAabPUV0XCvNL4uzg6KV0M5Eiby+X8Dl2107?=
 =?us-ascii?Q?W3lgVUwKOUXidhliBzpK0FqWnQyhH8zn0/v/glw8Ox7pougIBHhNeW4dsPkZ?=
 =?us-ascii?Q?5RDeVsaI6n5/8K9EZUYZhcTRmEC/F33mtyCB37VeWAGkKwlQzFCmmM9bngeW?=
 =?us-ascii?Q?bXIIXS+whMCSAmM+Af6kfodAZD97QR+jjbzhQgTRwMbZ4PXdeYSo2UMIiQcN?=
 =?us-ascii?Q?vH+p+6NStNTH/OrDYneqMC+KMJzrIOHAUZ4qay3SyRtzIpZWqvEDuEnwnSZg?=
 =?us-ascii?Q?Yhaqp0wrVmnpOJtDUrF0yDCM/syuxY99GpefL9Xhe3o6kUYaSIJ6gcFrwta2?=
 =?us-ascii?Q?DrDpAVStD1Ra8K6J8JiM4aYblFOf/lRD/SZLt7BH/yOXA3SRhUCezBNpnnuo?=
 =?us-ascii?Q?c7pqLg46rUNxpgx/XDKiEwikyg5w0CBUAArkH7oXs9pnw/+8KNrtmIQbTjEW?=
 =?us-ascii?Q?WzfAOkMq0mrvgOsRPpEZq/x4BB4OS8SeYBvkqRNXnwm3nHp0bssO9EyZbSir?=
 =?us-ascii?Q?r+mw0QQw9BBCo3lvZb/xA5y+iT7+/i5CXi06wIYFDjMLInnRHRbrAm9qj4BB?=
 =?us-ascii?Q?q0DLogJ6PaOPFyOfV45NQwbOgaEgzEKGEqGRknlqs54oEkO+40vvIlVyEnD8?=
 =?us-ascii?Q?xhZA7nAT0jnLWJk95BsGvC4F0OYGT4as/V46W4o4Gi4ECm2WT5VyQWw7VXXR?=
 =?us-ascii?Q?lXdyd1UAA9q7zNjrzq2E9dHGs9gfocZsdE3FA0PE/uL5zI/7YROsoSElDKA0?=
 =?us-ascii?Q?hz4XH6rwwOljvUFsST+XgKriBbBiqFPXo39LfQVs6PAYlqbIw76dLRtU/ibl?=
 =?us-ascii?Q?O3XPwvW653V5lr3lQ5FrmhBuklWOeRuwG7P8plwfNnnWSTHMpSkajhA6Ktxb?=
 =?us-ascii?Q?lKPO0DPYS3jYJ218c3/lOcDyTTkMLFbvOveeSa6WxGUXiN71JgtUzoDcli2U?=
 =?us-ascii?Q?+bICp7/FxyCb6IXr/kGIKPQmgwHyLkBhSn++SINZ0LcqelOKTQmRs+Zpc/bZ?=
 =?us-ascii?Q?0p1XIJ8HNE5O8OZoGjS0KuFPMGp0OTqo2zPXV1MIAh7a1HCLW7Ce7yfI7LXP?=
 =?us-ascii?Q?8cxVvJlEYn7QK4A9i12Ljz3S4FE1enuukylJlBVOGwGUEC2i6B3+gZ1xoKTp?=
 =?us-ascii?Q?JFocBa55KO7xf+7C+spoRbLvo+46Cv9z/K+hiPx+O6VpWxQQue/5utZp4Rfs?=
 =?us-ascii?Q?s2fCJyaCjYbD1TEFJP/ATemf9Y/Rfy6nfFUaqwW9cFVe1XLYEKht7vHo13bu?=
 =?us-ascii?Q?h2+gctadBAOrK90kvR11+7ANcuw2JwRUtOJSiqTFFK8a9Tx8V9wdg0MZL6DF?=
 =?us-ascii?Q?iBcQ3I5GZKQ1EdxBIAwL0ZJql1jrgJUMTef+qxbJxy0fSrBjqqGiWPkYAXOL?=
 =?us-ascii?Q?HYBi+keSnrgozADARQNQ+kd+XNteXUxBuWjCAu8ErIweybhfd1Nnqn1SOPsX?=
 =?us-ascii?Q?KqhAlQt9ETukJyQlbE+IZukc7R5XADjbowUHSb9TE+HVOrfcOYl3/eWgCLCQ?=
 =?us-ascii?Q?FyDmCZV1nXmaSWI1xJGGZstd9kkwnjbRLjgAlPmBj2wG20OWMH5AQ5iMPTdz?=
 =?us-ascii?Q?wKcZ2XrpXmc+wzEfbwDUxkTFQZs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c927580b-aeca-4ea7-d744-08d9e0e68bd5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:44.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoiaqXZ168G2HfJtGBHJxDTV47g88QyffGyhPrXzZLWLKU52N70MxXgyNFJqI1vQhBCgcHGwJiw9CjEqbjySNyOThO8VIi798lK/TM3sx1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7366
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/meson.build     | 2 +-
 qga/meson.build      | 3 ++-
 scripts/qapi/main.py | 8 ++++----
 tests/meson.build    | 3 ++-
 4 files changed, 9 insertions(+), 7 deletions(-)

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
index 724d5a667b..f06b726ad3 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -25,7 +25,8 @@ qga_qapi_outputs = [
 qga_qapi_files = custom_target('QGA QAPI files',
                                output: qga_qapi_outputs,
                                input: 'qapi-schema.json',
-                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@' ],
+                               command: [ qapi_gen, '-o', 'qga', '-p', 'qga-', '@INPUT0@',
+                                          '--suppress-tracing' ],
                                depend_files: qapi_gen_depends)
 
 qga_ss = ss.source_set()
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 687d408aba..fc216a53d3 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -76,10 +76,10 @@ def main() -> int:
                         dest='unmask',
                         help="expose non-ABI names in introspection")
 
-    # Option --gen-trace exists so we can avoid solving build system
+    # Option --suppress-tracing exists so we can avoid solving build system
     # problems.  TODO Drop it when we no longer need it.
-    parser.add_argument('--gen-trace', action='store_true',
-                        help="add trace events to qmp marshals")
+    parser.add_argument('--suppress-tracing', action='store_true',
+                        help="suppress adding trace events to qmp marshals")
 
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
@@ -96,7 +96,7 @@ def main() -> int:
                  prefix=args.prefix,
                  unmask=args.unmask,
                  builtins=args.builtins,
-                 gen_tracing=args.gen_trace)
+                 gen_tracing=not args.suppress_tracing)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
diff --git a/tests/meson.build b/tests/meson.build
index af8f5b1746..6d11dd436e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -44,7 +44,8 @@ test_qapi_files = custom_target('Test QAPI files',
                                              'qapi-schema/include/sub-module.json',
                                              'qapi-schema/sub-sub-module.json'),
                                 command: [ qapi_gen, '-o', meson.current_build_dir(),
-                                           '-b', '-p', 'test-', '@INPUT0@' ],
+                                           '-b', '-p', 'test-', '@INPUT0@',
+                                           '--suppress-tracing' ],
                                 depend_files: qapi_gen_depends)
 
 # meson doesn't like generated output in other directories
-- 
2.31.1


