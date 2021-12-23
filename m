Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D18147E630
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:12:37 +0100 (CET)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Qho-0003ZY-EC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:12:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXk-00058H-A8; Thu, 23 Dec 2021 11:02:12 -0500
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:61158 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXd-0005KZ-NI; Thu, 23 Dec 2021 11:02:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPxy/z1dHNjIsmxVXhXi1YMKUjQ28t8SGIOsTopTbsjbSeHeMNwws8a4Vq+R9tE3FJKLnNmRIRr1/ssCp4pvEgmtPhitPkS1/pUS3Ke3Y6SuX1T10rfDF//Ip2/i3yvbEjB5YChBPtHC5K8Qu/1xpEaFuyOU7wWCVVMuYN4hMdzfyi8sGUgYGx2soifDevJsehfFkTIeUlAulWp+Ev740GX1tZbAiqANkUm3ZZ50s9Hb7ojzG53ZGLWJpxL+9zp3OqUFGsEmfnJ3WCDBna8n/FqO3gneM1ANm6Oyxn6QQ1NQP6/EJwFE0PDiBmhBu/8t3ERwwoNS/rITRNSDgc1M3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l1S80L/AtuBK8VfJ1S7eelDCqYxyEhXzR8yV4w0eTs=;
 b=XvYwfB8fQQ16MxO+Xvf93LnIK46RvKG5GlPCSvanrj8rs2fQTmmoAYVIyY5EkVEwtyNOukxns9womYKg6KvNrQp0+F59mDfJQoVyBZaNostVSBjdX8NVRQIiEuCxROQN0rr8gvCmCkuPToD1r3OCETWwb00MFxaRiT+Ljg7O12s6/mvUwnOK3DHuLyCbi/1cceN3e2mvJmKrJCJqRhvi4U7sYp5IyJ0QjI7PqXqVy7hHm9liVtQ204nDOY8G2CQ2vopcP8zT987npeL+mb6+MO5l+S2defwKnAlBYSl4D6AR0NPNC0KkSVCSXtM8h1sQOLvWmzi8S1WRnzwXFATiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l1S80L/AtuBK8VfJ1S7eelDCqYxyEhXzR8yV4w0eTs=;
 b=dhOP6JAhQd6VENrFEX5Gqy012r+qV48QVWEee61/rYT3TSjf1Dff++UiYWpDt7Vr+xHSd3ygdvqV8WoeJ0rifHpReNJFawQOks7KeYY0if0210AIFvjtGiFpGtshlrWWxu0LuUlmQWj8XXXb/0eCgG3SgnDtMNXrgvnR3mWvQAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 16:01:55 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Thu, 23 Dec 2021
 16:01:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v5 03/19] iotests: specify some unsupported_imgopts for python
 iotests
Date: Thu, 23 Dec 2021 17:01:28 +0100
Message-Id: <20211223160144.1097696-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR0301CA0001.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17034d0e-d8d2-47b5-ff37-08d9c62d8ad5
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB614860184B743C31D756EAB0C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W1BCfEUUSPa3fur/ZIwNkpYOxaBbjzd7wlWcr7LBWwJuIRUX1CfWzr+gg9YJFaSTrJ8EepkOVKjaHTIApHJy6Pk2Ah4IyMHRRhlRyOMSNGfdFeQkuOrNpk38LJZioqJPmqv5a/yMdS3+DXQKugkhbBb6BVt7n2w5nQI5SxGPRqVgCCaIyreXi0M6u+ztD9yKVePQAHKzWQXFUmd44GkZbG2YNxGmkXGRv4JSgmB23cXv67GqKaUQlxPP/6PSfgsPJ5dBa9tQU/s/JRm+YCJd01OvEnEhWu9jcvQMeMK2sgaHcUvZhPIaQumDcGGuE8zHhqJqQI1h4ryuMoVy9KoR3OdK74Vq/O1a2H/rrpTXw/piz9dHDlr8UQgyTNx6e0dJFvoi1sW/2T3gGrfc3KQsCm9BonhLl5z18Tz9JjG1iW8pU1Tx6Aq8Ds1G2DHJ/bhpJTPSNLHUUYZZe06BQiXfMlVqLx1nIjysgV5Wu4JqN0t3gZGq6gXos0jHzaVOTBs/hieaAyL4SkVXw/kMtkJtMH3xLXRWP4Fb83tpFaDU+eFvEA/7nreNN4HW3ntH6z6ZEFusNaff60P1wj45kZqTkqxPTA+on/NTc6/e7fRssVpC5EETRmqG+PL3IB0A+0LOclKRz5anHWGhOSbW2vwtxQOrhv+kp/HjqNnwaPSiJZWPZdGquyT3lI5IFF94l1AYubOtKRfxh1Gjw0HTfKLqtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9QVRQEEcsv2TE4XmkLomPMPJzncuHSJpnMtN0C2971b/C76WdjJEDgWecPVX?=
 =?us-ascii?Q?k9nQnhORkx+3/qgGQw5woAQ4Bi7ixcpwcZVmxLxyXixwRLZwRbBJsR+cKpnd?=
 =?us-ascii?Q?3RHdF7XrOl4kGZNUNIWlYyOBqCEIxDK3oWnfYAjlhnjRmAI5WjzCD+BoAcXe?=
 =?us-ascii?Q?LabaolulyrypRVIoIPMskBkrMBd9dZoFp5bZMK/oYhjQsiLI5j+35H3nBB+D?=
 =?us-ascii?Q?nAwwHZuyinb5zwMM7dVOdef20IWsb4cGf0Ky/3eqybD/hlGrfZaMrMlF4Eay?=
 =?us-ascii?Q?+vRsqUIkIRyH+4HHRZpPpdnn6S9CIwZl+G95oT1XoFBF10g0FeBTj1i+t8f2?=
 =?us-ascii?Q?vo9ID6r8EoQ9nbAYFZQsEZmH1icvs6KCxrr/QaasmfJgkxg2U8/JQpDlxeNk?=
 =?us-ascii?Q?Ww/P/YBXQHHmvVQYo+ocImirsR39eEB54YrVG9bQmGiQWfvomlIsebpW9SCE?=
 =?us-ascii?Q?en99ZCiIqsX5kwws2vxUpk3I+P5OK/wq1SSqOErFJbM+cl9tObaUoW8HD6OL?=
 =?us-ascii?Q?l+u0616pvLAsjZDI0SeElaUS/KI/bA1B5QWpyNBA6ta2m30qkxHHEsWJevDU?=
 =?us-ascii?Q?eu6Px3XQObbJWLKOgjE+0zx+ijbXhEBzPt5dhD9QpvFocWyvXqZCXCgs1rpo?=
 =?us-ascii?Q?zD/HRewZwiv5SuvjT08JpfOIgfzCb602xqWsHwAZsn0sm1WVBNO3Z2aOPIfF?=
 =?us-ascii?Q?xh8Bj5YInURkT2CcMNNLyKgIlvV2j8i9F2YnhF/Bl+0nNFEYm3/UhV8pXMie?=
 =?us-ascii?Q?ED9YMgFhxRUIjQ6iZXLFCKfIn/YUtW8bzsIDDm874mxD/RQ91N1ZcuXlOeny?=
 =?us-ascii?Q?4kMikRSe4C9M3dw5GnVM2CzQ/8IlgduR3mtHmy/94h5CTQLD33F0k7G6mu5n?=
 =?us-ascii?Q?JthjNcTNL/WDjS/weR+MIxIrnWHNBKjElBGORFHXnU4p9RWPZ4xAtoLM6Ur0?=
 =?us-ascii?Q?dQNGXbFqnIJi8PsvMCXJgl7dWinbRWJR0Z5vuA+wlWOPAjfUbTI4+PVEE9s0?=
 =?us-ascii?Q?55WFI713bXpuDckOhJdUcyiCgjZWaRDZBIebrD7Qn81EMumzRmpT9APVeLer?=
 =?us-ascii?Q?fMg1+Pfryg44Q3JodfFmhgduDDiBPUgdMHjFzT9SdMif2+WvcF7YhrHAZaKD?=
 =?us-ascii?Q?Fkviu/CdWrCLGfsr5SaVeukM0NfLrCT64lNZGM1TokL+IDi5k8TXzHrpgf2S?=
 =?us-ascii?Q?NCwzSIL40DOgkcKT5QIt0S8Hz9VDB3YfCvr1yxC7V9+6eoq3MK5RISoHxrqF?=
 =?us-ascii?Q?zsiNbGHxyZCgk9BmDkm6zBA0Magg8JSnKmOZ92GajtaOFkasZoQceZXqFe4T?=
 =?us-ascii?Q?40OZv506QIHKun/xpFxR5rfAe46SkuyKeDgEfZSxWtnJESNQQFj7qjTrgwGI?=
 =?us-ascii?Q?NVAcYxPwWsUEqeSOjRMWTzzdNYsCIrIy89WVhrpDahHKWdlGQwm3HJR2QRnt?=
 =?us-ascii?Q?Ltrvr0JRhPvTw04qHEFh+5CqMTuaMEvak+/VDee9ru3hD8CAgsmH9KRLy42o?=
 =?us-ascii?Q?bLhr5gMPpLj0tHIOlQe6V/xS4V7jvLpA5MpsxTLDU2AJONP1nYBxdG4crKJG?=
 =?us-ascii?Q?AEJlD39Pe9Y6qUQ65gZ0ypzUZgqLtdG2PUycAIxK9Eia0uE0Dgy+eQVom0BQ?=
 =?us-ascii?Q?B2fuEwGk1HojHrn1JREP19m5Kc4P4p3emL9eLLFltSCVS/1ZBaJI0+zSxLby?=
 =?us-ascii?Q?mfd0tEe5bmg3pHjKU7GScQaD7bU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17034d0e-d8d2-47b5-ff37-08d9c62d8ad5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:55.5837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hVWJdodWju7LHwYn5HrOmbFfD83cq8l6InHvGhfQHzGVU9GHP8KuNvVYbsA6vhRM03mD4gVhNKFM9P1YMQuiDWCxWT3BXlV/DNBocOqxCEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.94;
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

We are going to support IMGOPTS for python iotests. Still some iotests
will not work with common IMGOPTS used with bash iotests like
specifying refcount_bits and compat qcow2 options. So we
should define corresponding unsupported_imgopts for now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/044                                 | 3 ++-
 tests/qemu-iotests/065                                 | 3 ++-
 tests/qemu-iotests/163                                 | 3 ++-
 tests/qemu-iotests/165                                 | 3 ++-
 tests/qemu-iotests/196                                 | 3 ++-
 tests/qemu-iotests/242                                 | 3 ++-
 tests/qemu-iotests/246                                 | 3 ++-
 tests/qemu-iotests/254                                 | 3 ++-
 tests/qemu-iotests/260                                 | 3 ++-
 tests/qemu-iotests/274                                 | 3 ++-
 tests/qemu-iotests/281                                 | 3 ++-
 tests/qemu-iotests/303                                 | 3 ++-
 tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 3 ++-
 tests/qemu-iotests/tests/migrate-bitmaps-test          | 3 ++-
 tests/qemu-iotests/tests/remove-bitmap-from-backing    | 3 ++-
 15 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
index 64b18eb7c8..d696e6442a 100755
--- a/tests/qemu-iotests/044
+++ b/tests/qemu-iotests/044
@@ -117,4 +117,5 @@ class TestRefcountTableGrowth(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['refcount_bits'])
diff --git a/tests/qemu-iotests/065 b/tests/qemu-iotests/065
index 3c2ca27627..dc7716275f 100755
--- a/tests/qemu-iotests/065
+++ b/tests/qemu-iotests/065
@@ -139,4 +139,5 @@ TestQMP = None
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['refcount_bits'])
diff --git a/tests/qemu-iotests/163 b/tests/qemu-iotests/163
index dedce8ef43..b8bfc95358 100755
--- a/tests/qemu-iotests/163
+++ b/tests/qemu-iotests/163
@@ -169,4 +169,5 @@ ShrinkBaseClass = None
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['raw', 'qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index ce499946b8..e3ef28e2ee 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -157,4 +157,5 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index 2451515094..76509a5ad1 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -65,4 +65,5 @@ class TestInvalidateAutoclear(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index a9b27668c2..96a30152b0 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -26,7 +26,8 @@ from iotests import qemu_img_create, qemu_io, qemu_img_pipe, \
     file_path, img_info_log, log, filter_qemu_io
 
 iotests.script_initialize(supported_fmts=['qcow2'],
-                          supported_protocols=['file'])
+                          supported_protocols=['file'],
+                          unsupported_imgopts=['refcount_bits', 'compat'])
 
 disk = file_path('disk')
 chunk = 256 * 1024
diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
index 5932a0e8a9..b009a78397 100755
--- a/tests/qemu-iotests/246
+++ b/tests/qemu-iotests/246
@@ -23,7 +23,8 @@
 import iotests
 from iotests import log
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat'])
 size = 64 * 1024 * 1024 * 1024
 gran_small = 32 * 1024
 gran_large = 128 * 1024
diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 108bf5f894..7ea098818c 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -22,7 +22,8 @@
 import iotests
 from iotests import qemu_img_create, file_path, log
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat'])
 
 disk, top = file_path('disk', 'top')
 size = 1024 * 1024
diff --git a/tests/qemu-iotests/260 b/tests/qemu-iotests/260
index 2ec64a9b99..c2133f9980 100755
--- a/tests/qemu-iotests/260
+++ b/tests/qemu-iotests/260
@@ -23,7 +23,8 @@ import iotests
 from iotests import qemu_img_create, file_path, log, filter_qmp_event
 
 iotests.script_initialize(
-    supported_fmts=['qcow2']
+    supported_fmts=['qcow2'],
+    unsupported_imgopts=['compat']
 )
 
 base, top = file_path('base', 'top')
diff --git a/tests/qemu-iotests/274 b/tests/qemu-iotests/274
index caab008e07..080a90f10f 100755
--- a/tests/qemu-iotests/274
+++ b/tests/qemu-iotests/274
@@ -23,7 +23,8 @@
 import iotests
 
 iotests.script_initialize(supported_fmts=['qcow2'],
-                          supported_platforms=['linux'])
+                          supported_platforms=['linux'],
+                          unsupported_imgopts=['refcount_bits', 'compat'])
 
 size_short = 1 * 1024 * 1024
 size_long = 2 * 1024 * 1024
diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 956698083f..318e333939 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -245,4 +245,5 @@ class TestBlockdevBackupAbort(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 425544c064..475cb5428d 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -23,7 +23,8 @@ import iotests
 import subprocess
 from iotests import qemu_img_create, qemu_io, file_path, log, filter_qemu_io
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['refcount_bits', 'compat'])
 
 disk = file_path('disk')
 chunk = 1024 * 1024
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index 00ebb5c251..fc9c4b4ef4 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -272,4 +272,5 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
 
 
 if __name__ == '__main__':
-    iotests.main(supported_fmts=['qcow2'])
+    iotests.main(supported_fmts=['qcow2'],
+                 unsupported_imgopts=['compat'])
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index c23df3d75c..59f3357580 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -307,7 +307,8 @@ def main() -> None:
 
     iotests.main(
         supported_fmts=['qcow2'],
-        supported_protocols=['file']
+        supported_protocols=['file'],
+        unsupported_imgopts=['compat']
     )
 
 
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
index 8d48fc0f3c..3c397b08ea 100755
--- a/tests/qemu-iotests/tests/remove-bitmap-from-backing
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -21,7 +21,8 @@
 import iotests
 from iotests import log, qemu_img_create, qemu_img, qemu_img_pipe
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          unsupported_imgopts=['compat'])
 
 top, base = iotests.file_path('top', 'base')
 size = '1M'
-- 
2.31.1


