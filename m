Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBD94677E1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:12:10 +0100 (CET)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8MB-0004XU-6J
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:12:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IO-0001cL-M6; Fri, 03 Dec 2021 08:08:13 -0500
Received: from mail-eopbgr80099.outbound.protection.outlook.com
 ([40.107.8.99]:31910 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt8IM-000700-Fx; Fri, 03 Dec 2021 08:08:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XF9UzAhaopVNjRUsQ8jGcGT1qKTfLg2Nzsm4MmmDZbIDc2bK7S8nFGX1mkd3iBTYwJ9/oMpTzXKzVax6geHGTJ0PkZ7l1za9SbKhgizwp28IZCqPli2zr3Kn3OdBo2apyNV99LDB6ulfJnxhR5WEmEtJxEhgvDa+J0Do5PsLBJG9rWurLBbJAE5r6ATEiY11qWExY1Bk4JDI326i83MBbNQ6kb5Xqo95Yb7JXV5qqHrLyXsM5pFEMAeJbMjHu2JMQrikkGKmcuC12fnUBMV9iP1E6iPHQhIuzuXHPzOBF7hkPYq8rfuCm9VDlT8LSBtCIAbKLi4tLol9A21gD2MpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7jb+Hnr7c7FY98JcEnssW8iqYViDxTBPiIOgje+bxE=;
 b=QxUH3/QkjX2Jv+U4fx3Jqdbjlnr4IepWUFOB5k4tfDqH7/BykjOERW0ya98nxbWEjGrKvvIOgP6ZKkfVIk7IGfXbO33ZoPR/qqLNYuNVhJm3KE80VpSDetXNS7gOjvSb7CmOfVpC4UbPTGqRcPOYPs8lkuEZMXC0OIXVi9+t6OBTGSPBkGGDd94npNq9MDgMsY+ilmYwSfqRPjzpJxJQNlfO951kw2e6SdR1D4C9Y7TPoeF0P35tcT3zJEePAHe/Ys1xjANaE545jHXeaXU5OGgvsa/pF3UA8FJIOD0i+1WMdsdv1qhuPyI+2Z3AsywbjQpdDfNASGus53ekjZQhWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7jb+Hnr7c7FY98JcEnssW8iqYViDxTBPiIOgje+bxE=;
 b=DLxZdeiA8efEyxRmy311agtjf1ZNgFuLsikqe/aAcVtKEt3x2BUR4kLRpdVUsy96FoPj49OsTLYf9G/K6B6Vauz1h3ByDbzrMC5G0pSTxrplWWoPQNIKMG+wUuOC2KcrtF5zuvEbkNyx69gGu/yAEx2+oMCoI+iTlbS4CWNNRJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4515.eurprd08.prod.outlook.com (2603:10a6:208:148::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:08:03 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 13:08:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 02/19] iotests.py: qemu_img*("create"): support
 IMGOPTS='compression_type=zstd'
Date: Fri,  3 Dec 2021 14:07:20 +0100
Message-Id: <20211203130737.2924594-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
References: <20211203130737.2924594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0095.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::36) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 13:08:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd36399-660c-437a-f8f7-08d9b65df1ae
X-MS-TrafficTypeDiagnostic: AM0PR08MB4515:
X-Microsoft-Antispam-PRVS: <AM0PR08MB45153891D0A22E2929BE91C1C16A9@AM0PR08MB4515.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zcyWXcZIbYeNtIgUAp7w/WB84WbhJRNPgqHxq2zvh1XfnNKYnyQKLTWDWnmUIXhIbVbSDxD9uR+mMq2E3kQWMe7Bxmqldc1DvWcOoWwZeAdzW7I9zarnfaIb5jwl48+0F0TQDjOS1DE6yHnyS6Ne/cg+wkyLv36oIrxBr6OYDlirwYtu7XIcVzp2md6uLO7Cqh3k9kPVtgop/AZ3lsQk4sGtTccGcvf4j2+sKvubBoLc/D63fv8sOpmxRXxjhRK6VAdFOuWH/QbfGQuVkEh6Ux0ZOnDHYAgG8wKDhdnvcW2HpUCZjVYcImVQ/cePKO7N2cctNdNcXL5LE0v2stKRj9sFOmso4BnALLEvoa8gGcueHL1QmM5WjlRZ1xOU9OpJu7gd7vspXAXnocyFnWkme/wzs3BaMYiTeTw5E20RlOrGDDHIAmCiYS8wpWDEjUN10vTE8ekEDWfOj+569DDDLhL02FHJ4RUrDmC/AQVTXBllHyVtu8XESeM2zKwzZGsWQSev/1oC+0AdXiIQpus8Qt+JowVy+3o39iALt8AtajpC86ZG/vBeBDOJaCfqnR6teKHTAwnNwzV5uFJgUl5UFmgnj0jvhvDzmgt/SPZjYvLMasoANSN0aM0HTR5reF5PvSuLtOvW54ez6biVMwbBXQPHBHSohktij/14jOUEQ2EnoSmiEShFYt2YCZ6pd7HRdTO2BXcuA9SFqu+Zg2BHrKlNW8PxQunwHDqRs+SQ61MDlQK8iy+vh0wZnNWWOhTAASItrECDRG1KKH4SlSxjigyjj+LOXzGKhtgOgDeREUA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(4326008)(186003)(6512007)(52116002)(6506007)(1076003)(5660300002)(36756003)(86362001)(38100700002)(26005)(956004)(508600001)(2616005)(8676002)(316002)(6486002)(66476007)(8936002)(66946007)(66556008)(6666004)(83380400001)(38350700002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZM/CRrT1Q+BCoVyHUUIApaHRlqz4Yey5c48NaF1n+cipzvqqozbcE8rUUG2F?=
 =?us-ascii?Q?SQEBuOS8ZwIeJ7yTB1fug9uoJgxi1nU1p0SUHXl5txw/yWaQ83HmRLUgVcgQ?=
 =?us-ascii?Q?ITg8C/XvzFewjE4jEOJbvSkafJguehTIX2tI/LmYCurCHDOZb9UJ1BpBBU+E?=
 =?us-ascii?Q?4OfWGG3ZL8LxLHyuaCGmaO0KRTVu8lNvZfmOYhm8hP7SqlwJ9ncuP7j70GXl?=
 =?us-ascii?Q?HKF+rT8niMC4taXGmsRUfESOQ1QfLwUNQ8we8Kqn2yJnZkAJh0eunFYTmtzC?=
 =?us-ascii?Q?3KDbkXyMjQ+AeSG/fbjatldF+4HsLfVO9amf4BIVX1v7WZ+4Qhe+tCF+i+3h?=
 =?us-ascii?Q?sjDLLr927p85kkybrALECvmmZlmVUdyamLl8q9AICZ8/9thFDQ8S882+U4KT?=
 =?us-ascii?Q?3oCRu0/vsQa54/4d5yXf4kybng3SqGt1D1kgKYLhBW7j8ZlJjMAf1KJAw1Rb?=
 =?us-ascii?Q?ctnYZIrKpMxKk4JWlkkljM4+CglST+CcqbaNv/DY/8V126j79pxZbIMQLkjh?=
 =?us-ascii?Q?AD+4H62oNXOXI8H6Q/o5cxCFXv+BnTG1FvR81VSyneh4iY+60ghYD1+xGLTO?=
 =?us-ascii?Q?s4vMHFuTh/nMM4gijdv6HYSp4q+C1rL3tTlMDengscdOy9e1Xj9Mrp/jC7tV?=
 =?us-ascii?Q?mnTvM7ZVgfYWoFXkxAZ+s40jwbuHgZYZOI+KWVldxHy2XQwfz97QcvdPhv8s?=
 =?us-ascii?Q?5mcQyM+EhYOM5Y0DbjAEDZ1NxOyGo1ep+a6q6qXZfA+42/aiFjuWkslZpZvd?=
 =?us-ascii?Q?/MszsRrFOV+8a+s0XCQqnHqEhIpEzfn9snbLCFmvY/i9bVFvpxbPKvA7OlVS?=
 =?us-ascii?Q?SxzbFY1zc2I4p3M6R1aJYg2qXYX8wfhj0sVTWovODYdT7zWZIFEQQU7mPaQg?=
 =?us-ascii?Q?hV/92lK3gbSokgHvLZbEMGxaHt8DD/SuuEASNn1uMBpEWDRkUEc1WlU52Tv9?=
 =?us-ascii?Q?k4e2rwxHapkqLnEPbDePSDiN+4STuIUsyTar4VuW1ftT+LeCpQLdY8ml/vFD?=
 =?us-ascii?Q?K10ja33XTOjfQExJqXeOn5u38b3dKJKM1Puxl+z33uvE0wxPvhh8cHe9E9HP?=
 =?us-ascii?Q?gYRvfdFayJfv/lmiHnnmek3TqT7JY8sPPoFGCBPIWDWHCsVnDPoFRV0NXaz2?=
 =?us-ascii?Q?5uJLsF5nX24y4Q3rRES3VpeiyZ4rqyRb+QYI8OeWvyiEm83R1wZ1tZCzdHdQ?=
 =?us-ascii?Q?LpOOrLjtmueBibNfmrHliRupP3mtfP6XKkP85VpTADc8BRR6CSWa5z8kQB3K?=
 =?us-ascii?Q?t7lG2uVKFUb087wfmN3jBerQsKUSc58q/UicUqNgE0vH//G8rghz7a5QmPms?=
 =?us-ascii?Q?LsQ5RS3Oiw6taWd25utM2FC0HhDXXfhL/3i/JzBs7cSDKZMcaWkCXPLBALJC?=
 =?us-ascii?Q?CLHIIuwMCIrtEAcrnSdrT/7vlY8Bw3II9970nvBFobevc4NoAGr8lo19DtmZ?=
 =?us-ascii?Q?zdNGxaBiqFITHxViDVm2DuxB4506/RlcnhdWsq7vOloPww5N4lXN/l2ZXVkT?=
 =?us-ascii?Q?BXdSNUoz1lt+3Fe5ibxCNpWHTMY46o63n09kwjCYbV1mGf/Ny/u16rsN83j9?=
 =?us-ascii?Q?Y+p8G1Y/dG2pzcqTyuNVQ9CT/00octFg8t67oc+0zv7KHqjduJ4+fo7geBpx?=
 =?us-ascii?Q?SXU5HlVt4F0qgvheUPoAhSg/+phpBWvOrTtM6jam7nqPNCJckDiu9TLgEPhS?=
 =?us-ascii?Q?G8pu7g=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd36399-660c-437a-f8f7-08d9b65df1ae
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:08:06.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QB8Lr/TkOOAiwDaYV+SFjc6CxRzfZewd0+qUVzKnVIsZYN3CWU9vgmwkovYJtXTLq6Vz/SvW/6HeSo0WfNEyNLzMnZs/FN8OgqR8eA2+tyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4515
Received-SPF: pass client-ip=40.107.8.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Adding support of IMGOPTS (like in bash tests) allows user to pass a
lot of different options. Still, some may require additional logic.

Now we want compression_type option, so add some smart logic around it:
ignore compression_type=zstd in IMGOPTS, if test want qcow2 in
compatibility mode. As well, ignore compression_type for non-qcow2
formats.

Note that we may instead add support only to qemu_img_create(), but
that works bad:

1. We'll have to update a lot of tests to use qemu_img_create instead
   of qemu_img('create'). (still, we may want do it anyway, but no
   reason to create a dependancy between task of supporting IMGOPTS and
   updating a lot of tests)

2. Some tests use qemu_img_pipe('create', ..) - even more work on
   updating

3. Even if we update all tests to go through qemu_img_create, we'll
   need a way to avoid creating new tests using qemu_img*('create') -
   add assertions.. That doesn't seem good.

So, let's add support of IMGOPTS to most generic
qemu_img_pipe_and_status().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 9b374dad3d..a7a257ee2f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -16,6 +16,7 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import argparse
 import atexit
 import bz2
 from collections import OrderedDict
@@ -153,11 +154,35 @@ def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                                {-subp.returncode}: {cmd}\n')
         return (output, subp.returncode)
 
+def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
+    if not args or args[0] != 'create':
+        return list(args)
+    args = args[1:]
+
+    p = argparse.ArgumentParser(allow_abbrev=False)
+    p.add_argument('-f')
+    parsed, remaining = p.parse_known_args(args)
+
+    result = ['create']
+    if parsed.f is not None:
+        result += ['-f', parsed.f]
+
+    # IMGOPTS most probably contain options specific for the selected format,
+    # like extended_l2 or compression_type for qcow2. Test may want to create
+    # additional images in other formats that doesn't support these options.
+    # So, use IMGOPTS only for images created in imgfmt format.
+    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
+        result += ['-o', os.environ['IMGOPTS']]
+
+    result += remaining
+
+    return result
+
 def qemu_img_pipe_and_status(*args: str) -> Tuple[str, int]:
     """
     Run qemu-img and return both its output and its exit code
     """
-    full_args = qemu_img_args + list(args)
+    full_args = qemu_img_args + qemu_img_create_prepare_args(list(args))
     return qemu_tool_pipe_and_status('qemu-img', full_args)
 
 def qemu_img(*args: str) -> int:
-- 
2.31.1


