Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DAB47E623
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 17:06:07 +0100 (CET)
Received: from localhost ([::1]:49222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0QbW-0000QQ-K5
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 11:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXf-00050h-37; Thu, 23 Dec 2021 11:02:07 -0500
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:2176 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n0QXd-0005Js-AB; Thu, 23 Dec 2021 11:02:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FncI+TVvHhfHKUmtg0bOE8IKqWMVHRx0jocxuH8/PoUz/lLKk1NOjhvlOLsoBjz/wg0eletcTSidIJdzcsE1jAj9SPwgGsMr4Ex4eWAVUO2/VefDD5qsX/KNZctMgZDQG5mXcfOH9j/EW+xJZLuK08k27AqAda6xsmHYDoRHO+ubzElMGZcBn8mZtQdxTMsBSYak+4rmWh1UelvU3bzgM+WmeRh7iICkCFuOTdiasnmR+fVSEIUVPWAZI0WgxUjG+DF0ipl6Wq5QWLe9IfA08c2cGBwmobtWYIoZ2RnKkGX7O87RrrKOij1kY/wZLVV7I2fkz3aXF+SZAuhp9I35sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugNx8pTaVX6K2FBKmoeNPtVML04sAuUp1rkZwwvlW9k=;
 b=iLJbnBpOb2hcoaEL/alF6zmdJ+ghrF9LRSSmti37aZl7d0d+ErslIxLrW1VLmI6f9tYu+EIm+WG+sVJG4fg2Lf+91CEcfVUq6wcG1DxBuKfIsTixxyH2FPLov5r+InFlXpEu6OQwgZEHvsEj5anlzTYfL7GkAla0ZON+M+fBw81ESKGSeV9jSaLRZVsHxaBc/oIIl3eEuHFLwXWy3rGkw0pqsFLUFnmJYgYzLqnJS1rgBdLdxvjLuSpKJeIiLSOKF3lyYTbYUXSjJLOTVtwTsyNPwRzXSvD3UEvscS1iZQkVRnTvuHghm+FqJKIU5dtOMliValET5YSbVl4o+03vqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugNx8pTaVX6K2FBKmoeNPtVML04sAuUp1rkZwwvlW9k=;
 b=FOYVQEJaKOBqzqC6Ki3ld8NOACJrK8jwPT2YmWYFZ6swxgPtBYk8onJdHetG3YppwRr1y5xohN/5XwL0PZ98Z+hypWT/akdQpMwBd66F4ULkFzbD0f9R6zCVTCqCSDfXhAIBkVZ701kuJCeKo3p9+Ahrt7/zZjuEynjjKxfF6No=
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
Subject: [PATCH v5 02/19] iotests.py: implement unsupported_imgopts
Date: Thu, 23 Dec 2021 17:01:27 +0100
Message-Id: <20211223160144.1097696-3-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: f4e7d21e-ceb7-49c6-6720-08d9c62d8a9a
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB61481B4A3575C5B2DCA41FD3C17E9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THMcqs8kULanLxcBWR6jyo+xj/HZhcXE4bO0MMxKyiIYOT1dKJCMP6e/tayhlJ1ASAQ2N6O/g3qTYSjyzmv51gtixAEKnpDO007+2ujRw8SiGJDag7LoHhctCVLoGWU/jjEDQBoQxzpSqx0QbIQgAcsLH0szkjVIKUtrqoyPFGiHFWBfEaCRHgujZPwvI3SmuJvYrjn2eg4/TIK9nElIazIisWMYlg8yvBebHKzL/8P4g13sN0UJuK28Vo4h/t9naqNIAgoQxsiaytUsgb7OYcfi4UgY+lLBuyL/VpNzzdpxwoqPlFqR8rJJ/lt9yTOOGU0ls35cClgRh2j0QDQuh0q9AlQh2puugDgkBGkxA20bCnPSXV4igDXf27mO/SsBDa5bsyuhqAPxJzECoe1dJwH2DykUPbBhTJoxlNP0RWiMoTXFvLx0nbFbixMGTktXId7/pXUq5ns8gMhHjwwZEKsQv7dzshpV9YIVADKcc9OpVBo0xK817pv27mFWh4gw/mxC1myycsLCqOGdaps0A+FYsdJVG6Vr9WRzjKNMLMTZjz49jfgBM3MyZbHB1dX3XyPT0+WYHqsZDcVE7GXz95EC2i4yZ3Bjy7BHQRdPu3rAkVR2bEyLY8TP6P+hKHnj+PRlohkjZVaH3IYmaO1EHwbbz84Bh090Tw6Dk7h4ecxOxM/qDc+2zHeEhyeCRhFVn5uiIgDyH+ri/0pFM1GjXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(8936002)(508600001)(38100700002)(66946007)(316002)(38350700002)(66476007)(66556008)(1076003)(2906002)(4326008)(6666004)(83380400001)(6506007)(2616005)(6916009)(26005)(6486002)(6512007)(86362001)(8676002)(52116002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TKaLx3xa6hu9sB3kWpO4nKfnOZKUB5Ce5EBCoSzxvZyCYFvnqWc9kFABozkz?=
 =?us-ascii?Q?Px+Q8jgmNnZtoLd6B4BwX5kDnXdHyxsTHVTio/LjDMJ/SQ4NE13bzBqxFyGK?=
 =?us-ascii?Q?k0m69WloSNiDNsVLRZF1/ak/StuRUBq/Y33B4kXPwvrxALd/wXAfQDonDtic?=
 =?us-ascii?Q?P8EwiUk6C0bNdtq3sPNIUZsPP0fPSfg1Gp6kt/Z7FB/2j4k8crxYszQpFf0U?=
 =?us-ascii?Q?idyAKBJH/hPNmRC/oJduxHfLoU2Oc0YMn73R7GjEpAQz0aAaGUuY8nxtHsO/?=
 =?us-ascii?Q?AJo3v03U4SngIKsRek5Rcdc/gfGZJcA/o70ezSH+t7lJfbOS+Nz+CM4H2Z1o?=
 =?us-ascii?Q?tKD+STw6+8hvin/3pk73ISvjzKtZ1RzaylIqE9n0EiBJ7ZLUXYJRj4Txm0Uq?=
 =?us-ascii?Q?F13GEYSs3KexK7zAmHwasR8mRniuIcCi2189NIKHh0m7J2NxVk2JrC6F1ZiZ?=
 =?us-ascii?Q?s/hmSQhS6/JUJ9EpeaYbyu4nTO51xlHEEwAbTNpS2D8IXBqGM3j53a+LaDep?=
 =?us-ascii?Q?llQ/nvs5rBQxWshuN8jRob7VwiMe/4FB6dB8Af8gX4g26/Sv9Y/m0GfHJ3HZ?=
 =?us-ascii?Q?S3zFK93ohWDwYF8fFZCxeF80YEQdzWOkw+q3Pa5rwMQFHUjO3y9bsmrqjjGg?=
 =?us-ascii?Q?qaKEHclldaVorED6HOoSymuujA02tHguTWEVWVElIIbmYBiPV6a84VAmhRzb?=
 =?us-ascii?Q?ftcFv6cjaWhKnaZXjWi/7UHpvQnVOl9bXb1Ay5BX8GjJuZ9UOt0jLsj0ICdl?=
 =?us-ascii?Q?+sklXtt0Wk2KqzYu+H7MrwvHxiDjdVEgfa9GEJu9ldtr9q1T/wRxzb1vaHQ1?=
 =?us-ascii?Q?plZY/tUrBy8EBwUq/1kuBAUhIuhKSbz3RhlD8h/6Q1O1PCFnN9kNdLNfTOPv?=
 =?us-ascii?Q?Z/BOtUHPQtjmZZGjG8Km/R00vlrWLWzzqrXDUdoRqDiAnW4YMVy0Xukabgs7?=
 =?us-ascii?Q?ypDKSrPH8PUWNGaTMRU3RUKwuwPZfmJJhn2xDYeGBeW5jqc+m6CekI6fUxe2?=
 =?us-ascii?Q?vN0+wvgGMsfkcK0YxD3NcOMVtUwPTxSey/V84j5nz+1Age89Or/W4g8I3FhW?=
 =?us-ascii?Q?VXXpWXgQng5hxBWeq8W+K3sgVqfOHJdcNL93aEro+LZ5bh3ZCC9KIwiHZTPr?=
 =?us-ascii?Q?hDFST4qb67ldvIscFBzyoK50rou6wJgr298DoQ8z1l0UBqODP8mJZ/sl1Tbl?=
 =?us-ascii?Q?EMKrnOlgF34fXF70oeJjv+Sg/zlj83S2XF8qleUOTfq0HIyi1I9v+c7+aBnE?=
 =?us-ascii?Q?qkGy7P1nGA1ocvC4Xt/bv0PHCzl/Ks6s/2Wm4e2tJ6f648NsJGq/hlGI42d0?=
 =?us-ascii?Q?8ZJENOjUMRLSObNId417z1LbS3hzr+2XvZr19J+Z4x7QHua25WnYJQUs5P0+?=
 =?us-ascii?Q?x778ZeTEH54KZJi1+LWZq8i28/8ntuQxYzfxQX0myaZ8Stem1ieiX5LfCtSD?=
 =?us-ascii?Q?H2rheZis16XKMuPEjzK6sHkfK2nBZvk5PhIB59dTHe7gCv2IzHxyEgV8qS8M?=
 =?us-ascii?Q?A0E8zPZMo8RkUgINmioEsM2AULtZDi+8Frluz2077QsUkO03rvDpTwYAP59h?=
 =?us-ascii?Q?CtGGNgcUph2quewe/UglsOW6fgOFh3oBQGyrBUhpOv0GO2gd7Fm3D3dsSG0s?=
 =?us-ascii?Q?ZCMyxR+19IlNIWHpeluQLbZNOliLlDo12/xAgnONu0ol5Rc5fDc36yTo8fWY?=
 =?us-ascii?Q?OrtSJ+mfnSoHn5C7hgqvubmNhvg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e7d21e-ceb7-49c6-6720-08d9c62d8a9a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 16:01:55.2088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LY5BRlojcE++duPMNdOaxqPinQsCW0KwOG7pS4vsOFwwPbyLjCQVNDL7ev0a1rUPkdj/fVd6fBWgKr52XRKbpNBBKm1VShg5pzIVvjudDtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.15.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

We are going to support some addition IMGOPTS in python iotests like
in bash iotests. Similarly to bash iotests, we want a way to skip some
tests which can't work with specific IMGOPTS.

Globally for python iotests we will not support things like
'data_file=$TEST_IMG.ext_data_file' in IMGOPTS, so, forbid this
globally in iotests.py.

Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 9b374dad3d..35d92715cc 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1215,6 +1215,17 @@ def _verify_virtio_scsi_pci_or_ccw() -> None:
         notrun('Missing virtio-scsi-pci or virtio-scsi-ccw in QEMU binary')
 
 
+def _verify_imgopts(unsupported: Sequence[str] = ()) -> None:
+    imgopts = os.environ.get('IMGOPTS')
+    # One of usage examples for IMGOPTS is "data_file=$TEST_IMG.ext_data_file"
+    # but it supported only for bash tests. We don't have a concept of global
+    # TEST_IMG in iotests.py, not saying about somehow parsing $variables.
+    # So, for simplicity let's just not support any IMGOPTS with '$' inside.
+    unsup = list(unsupported) + ['$']
+    if imgopts and any(x in imgopts for x in unsup):
+        notrun(f'not suitable for this imgopts: {imgopts}')
+
+
 def supports_quorum():
     return 'quorum' in qemu_img_pipe('--help')
 
@@ -1391,7 +1402,8 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
                          unsupported_fmts: Sequence[str] = (),
                          supported_protocols: Sequence[str] = (),
                          unsupported_protocols: Sequence[str] = (),
-                         required_fmts: Sequence[str] = ()) -> bool:
+                         required_fmts: Sequence[str] = (),
+                         unsupported_imgopts: Sequence[str] = ()) -> bool:
     """
     Perform necessary setup for either script-style or unittest-style tests.
 
@@ -1411,6 +1423,7 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
     _verify_aio_mode(supported_aio_modes)
     _verify_formats(required_fmts)
     _verify_virtio_blk()
+    _verify_imgopts(unsupported_imgopts)
 
     return debug
 
-- 
2.31.1


