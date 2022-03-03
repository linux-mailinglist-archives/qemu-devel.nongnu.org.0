Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAAA4CC6A2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:57:53 +0100 (CET)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPraC-0004D3-Jf
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:57:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNE-00045r-PR; Thu, 03 Mar 2022 14:44:29 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNC-0004Wu-Vz; Thu, 03 Mar 2022 14:44:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lg00l2rU6dShmaEj3zR6udgfWJ3FE4TAidXwHD/kwQLPYXa1NXhGiVsSQtaWJ/yMxiw6chHd5IxW5jQKf0eOsSn6IbP/FooAPb0Eg+szeDj02FBkFao572Tcmfv/wNyF5s0+BBSzajn8BJ/51emqX17Q0I4Gul0VlwtLf6grw87l37b7I4LjZk3fc44XMJHXIW/YQTVR5rWUh9IEmVvn237rzR6qeMN/DllqVWM956pXAoRHGsOmcspzE3F8vjl028ZtV72JSwOx8guRySz1vCsqfgSzonbr0iwLqECI2aMStrBaDAKGEerMnGGTgM1hczDCb9NlAzVz0JaffWr4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEpH+HIzXiDTHUzHBNTB3tdUmabNgivX1ETxG6gdcEw=;
 b=VQsMDkUmeYLFXQBlNmvk6W94XGJv0D2QZ2V7rAfE+SCs0sq2Qs34MKEFY6LQsmOi5UsNQ8zNlQ2yW8ZFr56k8cSI8KYxtXj1NAj9wNdWEVQJrXL7i+qUsWJyJefTnz8dD1ETojsfyip1KtUP0F2yW4fhA4LT6oyWx6yT3L/dr2R5FdD74ezsfMHj26uJmwFRSk/eO1QjpFZC3rky69C4PRvJbAR7aUOmiH6I22rJ0t3AJ7DLJBgeSZVIoPDXFt/ydIbKsmBSXvAcdmL4PXSo2LAdnUbSrdLoO/1i2+RrivZC1HL4kOOtusDqn4Uax1kSQwwORpTzgxmrVtPjw/BCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEpH+HIzXiDTHUzHBNTB3tdUmabNgivX1ETxG6gdcEw=;
 b=TMcyXtT4uIUgrpxlY0heRqVZWTmMJPpU6oYHnT395cqIj8q/hQhZ76rWfRp1WV95EZqooYQAQQwzlzxnjlrqWBy06VDgiIM5ivj2PNNatB9pU9OYr+huncY/FXqHFe41pBtn+xAI6O5QDjBDTDxUEqJjBLRRqfVJ1+LfnVKNVhI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 13/16] iotests/image-fleecing: add test-case for fleecing
 format node
Date: Thu,  3 Mar 2022 20:43:46 +0100
Message-Id: <20220303194349.2304213-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a97ebf38-da6c-40f1-db17-08d9fd4e327e
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736454C3124B1E92E9E3695C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sZLUEyyfKP0Vjf1gozzwe2uSrjRA4Zl/mao1AqMis4tum5PttQMw0vqK4Rf4SPwoM3cQWwdoLgrvobrWeGO3gqu3GZuxjQ2c9iHzzL1U5S3Wf6QIAFiAhA9GmKik4PHLNHUmRS+FIrhI7TLTnJxu9tbntGqa6Q6Nv4GOF8DuaBQKcsCRWzoCwSvhFuYJOkeLdkB9FJ+HCcHNxQS4TrVhXVtCeqOXLqSwxweeJ33BdJGI2LaitbPTyhQVWkgj/hbXqJ6x9GCbwp5MdP9yzJkBQRNJBYVkJBaZRrmGkCf4QZjcOOAJT+C3SFG2KOjlY2Q+5enr9x4f5I6Khz2ZUXBQ1nJxTjrHIFcc+W3XFrfxovPLje1mafrXGvFdQgpen/i2ePiKY2oUAR8fgt2SqhS5gopLjKhuYwTvwESacM+Hj7pEZi69eTSenBlCTATVHUxcXF/OUrQ2VA4w2e3bje5ohjbFwAoILfWu2Nr66GMuSxU9X/yziQnR8o5DAcDaZaVKslDT1YgrXMt4+Pxe/CoTRQO2uAG+2SeSyGtSNYGwNL89vjTYU8aniiBrQLqkGMAVUP8BQ+nFlFGFpkagDoxrlodd7Jgqql8o0YuoHncINs8oyP8D4ZnWKy55XmN1RXTW5qTpgPL3VU8qjPmRvc6lg0GE3LK+G37v0VvbDcYhB58E2CnZBRBoy663/Czk6eZbktwi5pjBpaZk3QBGAIGew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LK5TLASZgIuXbfI0bt1pO3qflLj3U0WH99RHqQX4YItGC/orXCMqAz6cG2ta?=
 =?us-ascii?Q?R7pX88yfyeCKNW9GgJ9Zn1Xe47NRU9/e0ZnkQ9/9a0mn753DAkhTj6bAYYOO?=
 =?us-ascii?Q?XDsPSmFr8nOulcqdcjh2u2OQxiwf5PrbtW/O7b7QiFKYwrwgT/yKGgu98RGg?=
 =?us-ascii?Q?fsI09AQjUQUYgxtJOR1iKqo504aBpH6JejyIhD9Dti0FiBKCitMna1SOWCfP?=
 =?us-ascii?Q?yA4YPDfHf0f2rJ7rYzekz6UeGRv1C6NtEEVLGpu71oM87Fylby1IA7EJvkC8?=
 =?us-ascii?Q?cnzZMPXXXk7HOTOG/tBEnAAJNI8IcSSrMi0PHo8TQyI30Pnooq8WoCtCr/QU?=
 =?us-ascii?Q?ch8SaZAARBhzlJXtDzWqKqLjR3P4btHBaPSQ4YdFjynXtVijC4FRIq9gJF70?=
 =?us-ascii?Q?lKBonqdmj6BGC1ywpl0YJ6FruNxIElW15mWWdakAmWwjAsip2Hx9cA1ryz/U?=
 =?us-ascii?Q?vBy9gKYTQu/Pw2nJDcM/UitZtCS6qVGr3jiJLHoj0epODrceWwSWhaYg8HGl?=
 =?us-ascii?Q?THig9y3SFtRBgYHVszravjvkPaRGnGpSMWwbda8BZH37PrNhwfgQ9WGG+Vbg?=
 =?us-ascii?Q?79KKEtinvJgIyorl7BPciHhvqPCZrpJ3rJAFsCr0w3UJs6hY8mdGA7AXTRxR?=
 =?us-ascii?Q?oQCLuBhSqtmKYGqSmEBMOlo2LCRkcBIt3TuYsUA1f4cQGRs9ZsuYXNgwi2Uz?=
 =?us-ascii?Q?v+ygs7KFMSNpqRH4iZlU1qsVjFuRqBJrg+R0Lzx1OjTLrXBf5PfU6DFkmnCh?=
 =?us-ascii?Q?eMEwRVRnnIHEE0GQSjzXj5SpIGDxcicvQGyVTB3QekDJXUW0mCFMwWeXjKFN?=
 =?us-ascii?Q?w3FBXvif5vtQLbbJ9BZRQ8uDzxZZxJzNpxoH3K+IjRPD6ZPomhF3NH3Gy0X3?=
 =?us-ascii?Q?mDJlcbmtQwEnQpVT9RYOEBhbvHHihWqQx9OJGQ+q+DtP04vhJRP9rjm4D24L?=
 =?us-ascii?Q?VV+ocGzWRZExXoxwFLY42Fhfr/9zDfPyue9NqAdocshrJRW3PQpIUDzY8SO5?=
 =?us-ascii?Q?vHEpW3eTIieb4Xn1liqCgxQvQMKE9+pILRlOF9S2omi15PSnIRtu3onRoWv4?=
 =?us-ascii?Q?fF/nWm6lZVHjKOFv9j/gtSzVcPdz+RYU1klwPXWKioOtye+x80ss/MKisGPW?=
 =?us-ascii?Q?o3ybv9FBnbqgfpL0g0j+H4/+McLUQ2MAtEtuOP7uRVJ6gB1aOlbHJl5b/NXU?=
 =?us-ascii?Q?sjxbnADSbmCLLz0fKhnhd1Mb5Yc7yqIlnSNekJd37OIjYoKCjqoEtm957ZdN?=
 =?us-ascii?Q?cfC+PCXZqEjtVmH32vRttPYFeD5NLGPxNclwwAdzGpWMGoIvbrk8+E4Clnzp?=
 =?us-ascii?Q?llTY5CUZV0Aev8rY7xIfN1ci0hFjsOYWWreoU2i2cSu6ZVl7x9OYF/Hq+3RI?=
 =?us-ascii?Q?Fw88prMkiLinms/1IBQ1k0GvKgNz3h2jPyS/KyAiIlt6Hsd01//goFDz+nCb?=
 =?us-ascii?Q?y1wZ/bG8HcuIQfG7T9NyVajSFnBK3MtetzgHoCat+26ew6mi6vY2RelMP7C8?=
 =?us-ascii?Q?Jw2YdHZjRGrZpeKOCTSRJOnje7Bg42XVHiGth4WibxV3g3Vp16XlaxPv8qVI?=
 =?us-ascii?Q?X1JYemmpI+oLqiLGQvyAHWupj6KGsCrqmkPsia7kiSaEMjkuoTkMI3z/ky1Y?=
 =?us-ascii?Q?A7KiAZCmvNcwLPWPeySS/0h9i/Tc+zDpga6Kd1sBj5TSLkbNMZ468578SeC8?=
 =?us-ascii?Q?m5NvOA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97ebf38-da6c-40f1-db17-08d9fd4e327e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:14.7180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bn0YEreYc0i6abfXFK/E0ElAjq3FEHj1VCdUyUq5LeCdwA4dHOEwgtcynRj/quldjr3u4QRu99xkCqRZ1Z4aMzASw6bhL92Y1tVEi41MPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing     | 64 ++++++++++++-----
 tests/qemu-iotests/tests/image-fleecing.out | 76 ++++++++++++++++++++-
 2 files changed, 120 insertions(+), 20 deletions(-)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index a58b5a1781..909fc0a7ad 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -49,12 +49,17 @@ remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
 
-def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
+def do_test(use_cbw, use_snapshot_access_filter, base_img_path,
+            fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
     log('')
 
     assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
-    assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
+    if use_snapshot_access_filter:
+        assert use_cbw
+        assert qemu_img('create', '-f', 'raw', fleece_img_path, '64M') == 0
+    else:
+        assert qemu_img('create', '-f', 'qcow2', fleece_img_path, '64M') == 0
 
     for p in patterns:
         qemu_io('-f', iotests.imgfmt,
@@ -81,16 +86,23 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('')
 
 
-    # create tmp_node backed by src_node
-    log(vm.qmp('blockdev-add', {
-        'driver': 'qcow2',
-        'node-name': tmp_node,
-        'file': {
+    if use_snapshot_access_filter:
+        log(vm.qmp('blockdev-add', {
+            'node-name': tmp_node,
             'driver': 'file',
             'filename': fleece_img_path,
-        },
-        'backing': src_node,
-    }))
+        }))
+    else:
+        # create tmp_node backed by src_node
+        log(vm.qmp('blockdev-add', {
+            'driver': 'qcow2',
+            'node-name': tmp_node,
+            'file': {
+                'driver': 'file',
+                'filename': fleece_img_path,
+            },
+            'backing': src_node,
+        }))
 
     # Establish CBW from source to fleecing node
     if use_cbw:
@@ -102,6 +114,13 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
         }))
 
         log(vm.qmp('qom-set', path=qom_path, property='drive', value='fl-cbw'))
+
+        if use_snapshot_access_filter:
+            log(vm.qmp('blockdev-add', {
+                'driver': 'snapshot-access',
+                'node-name': 'fl-access',
+                'file': 'fl-cbw',
+            }))
     else:
         log(vm.qmp('blockdev-backup',
                    job_id='fleecing',
@@ -109,16 +128,18 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
                    target=tmp_node,
                    sync='none'))
 
+    export_node = 'fl-access' if use_snapshot_access_filter else tmp_node
+
     log('')
     log('--- Setting up NBD Export ---')
     log('')
 
-    nbd_uri = 'nbd+unix:///%s?socket=%s' % (tmp_node, nbd_sock_path)
+    nbd_uri = 'nbd+unix:///%s?socket=%s' % (export_node, nbd_sock_path)
     log(vm.qmp('nbd-server-start',
                {'addr': {'type': 'unix',
                          'data': {'path': nbd_sock_path}}}))
 
-    log(vm.qmp('nbd-server-add', device=tmp_node))
+    log(vm.qmp('nbd-server-add', device=export_node))
 
     log('')
     log('--- Sanity Check ---')
@@ -151,7 +172,11 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Cleanup ---')
     log('')
 
+    log(vm.qmp('nbd-server-stop'))
+
     if use_cbw:
+        if use_snapshot_access_filter:
+            log(vm.qmp('blockdev-del', node_name='fl-access'))
         log(vm.qmp('qom-set', path=qom_path, property='drive', value=src_node))
         log(vm.qmp('blockdev-del', node_name='fl-cbw'))
     else:
@@ -160,7 +185,6 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
         assert e is not None
         log(e, filters=[iotests.filter_qmp_event])
 
-    log(vm.qmp('nbd-server-stop'))
     log(vm.qmp('blockdev-del', node_name=tmp_node))
     vm.shutdown()
 
@@ -177,17 +201,21 @@ def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('Done')
 
 
-def test(use_cbw):
+def test(use_cbw, use_snapshot_access_filter):
     with iotests.FilePath('base.img') as base_img_path, \
          iotests.FilePath('fleece.img') as fleece_img_path, \
          iotests.FilePath('nbd.sock',
                           base_dir=iotests.sock_dir) as nbd_sock_path, \
          iotests.VM() as vm:
-        do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm)
+        do_test(use_cbw, use_snapshot_access_filter, base_img_path,
+                fleece_img_path, nbd_sock_path, vm)
 
 
 log('=== Test backup(sync=none) based fleecing ===\n')
-test(False)
+test(False, False)
 
-log('=== Test filter based fleecing ===\n')
-test(True)
+log('=== Test cbw-filter based fleecing ===\n')
+test(True, False)
+
+log('=== Test fleecing-format based fleecing ===\n')
+test(True, True)
diff --git a/tests/qemu-iotests/tests/image-fleecing.out b/tests/qemu-iotests/tests/image-fleecing.out
index e96d122a8b..da0af93388 100644
--- a/tests/qemu-iotests/tests/image-fleecing.out
+++ b/tests/qemu-iotests/tests/image-fleecing.out
@@ -52,8 +52,8 @@ read -P0 0x3fe0000 64k
 --- Cleanup ---
 
 {"return": {}}
-{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
+{"data": {"device": "fleecing", "len": 67108864, "offset": 393216, "speed": 0, "type": "backup"}, "event": "BLOCK_JOB_CANCELLED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 {"return": {}}
 
 --- Confirming writes ---
@@ -67,7 +67,7 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
-=== Test filter based fleecing ===
+=== Test cbw-filter based fleecing ===
 
 --- Setting up images ---
 
@@ -137,3 +137,75 @@ read -P0xdc 32M 32k
 read -P0xcd 0x3ff0000 64k
 
 Done
+=== Test fleecing-format based fleecing ===
+
+--- Setting up images ---
+
+Done
+
+--- Launching VM ---
+
+Done
+
+--- Setting up Fleecing Graph ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Setting up NBD Export ---
+
+{"return": {}}
+{"return": {}}
+
+--- Sanity Check ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Testing COW ---
+
+write -P0xab 0 64k
+{"return": ""}
+write -P0xad 0x00f8000 64k
+{"return": ""}
+write -P0x1d 0x2008000 64k
+{"return": ""}
+write -P0xea 0x3fe0000 64k
+{"return": ""}
+
+--- Verifying Data ---
+
+read -P0x5d 0 64k
+read -P0xd5 1M 64k
+read -P0xdc 32M 64k
+read -P0xcd 0x3ff0000 64k
+read -P0 0x00f8000 32k
+read -P0 0x2010000 32k
+read -P0 0x3fe0000 64k
+
+--- Cleanup ---
+
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+
+--- Confirming writes ---
+
+read -P0xab 0 64k
+read -P0xad 0x00f8000 64k
+read -P0x1d 0x2008000 64k
+read -P0xea 0x3fe0000 64k
+read -P0xd5 0x108000 32k
+read -P0xdc 32M 32k
+read -P0xcd 0x3ff0000 64k
+
+Done
-- 
2.31.1


