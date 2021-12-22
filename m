Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F63447D73B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:55:10 +0100 (CET)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06lZ-0002ys-3g
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:55:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jj-0008F9-7R; Wed, 22 Dec 2021 13:53:15 -0500
Received: from mail-vi1eur05on2113.outbound.protection.outlook.com
 ([40.107.21.113]:12544 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jh-0004aJ-IB; Wed, 22 Dec 2021 13:53:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nb/o5n0Qe068G2iS0ut7V7PlzAwQ4lpQ50T2KqzYQxp+DEZIpMHYdVOKIvZIMfbGrzRaA8qvsDw9E+JixrpKgymDeRg/v9/o9ew+0shnPh+gwkzqr0vPiwuZRbRl6mMobwS/fgoJi2f6cF1MDLJXLwjqnaL3LYCG8h+eKsSpOvgKt1qtM9ilLyN8hRYkKFKMRxINd6BX1MBM4nwDu3zaFq5m9t6NPimX7vT/tkxTuAGeCmO0YH1RebktoOnW7VsaSSSP7GuzSs4CQa32y2euALkhFSqkQQGZ/M71DSyeC6bMpnIqQJKYSYugiHhUxicG1xGcvkjgZFL0GZMv77Qg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7lErLU3850fVriRjv2MT7Ght4Xs/vqrXSLU61tmF+s=;
 b=n5YhXIwhWCQw33rXe4XDFBA4g4CM8cfzl9YAv3JOCc35PrbOTLl6RUi89A338/LmYtuh1rN9rGi/HcaOOXhncnM3knO9nn1YoQBc+K9Sd/AFR20/rmSyk/zt0VYJhHw0K0VHYtvKdSI6nIp+Fnab7vChBLyHrDud/8hWWhSUIe60ucetg5Ry0R7ucK8GoAS/uRwKcX5jSItG6wBIhNGM85rnFoMMZL6BYAt58/eo6yYKpDwjE/1h9Ymbly1pyHbKdvN3GUwjwbpkcPiL+XmFKltJDm8nBwvuMRK4pWzTODA0EYrj/S7vOX1FhimyJ79j6N3EfNHQwdl2y+Sf79pSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7lErLU3850fVriRjv2MT7Ght4Xs/vqrXSLU61tmF+s=;
 b=DrThLZB11m+kCvgMSU/E73BREpccONkzreu0X/cCwki1wPj2DSTnl8OOU9Cv/63ikFDZLFWCeLG+v8SEYYYmd5YyOQCslrc+1iHVFXaLd11yDBvkpgw4ICqzDWiJZKqEEyxIoYdyrjDgX20PBG7d1rFAUcHakxHPkl3GhhBJOPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 18:53:02 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 18:53:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 4/7] iotests.py: add qemu_tool_popen()
Date: Wed, 22 Dec 2021 19:52:45 +0100
Message-Id: <20211222185248.466010-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222185248.466010-1-vsementsov@virtuozzo.com>
References: <20211222185248.466010-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0118895f-43a0-4e94-5607-08d9c57c4805
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5857E6D1F46CDDE1D41AE532C17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6CROpMkpraHWBwQD54g/hDoWF7P2X9nBitx0qVbrqJpEMhHP2nm5mtqd69RgANXNA7240FQvkMvlQxAKAW7TNIWHm26DNRkit7ygBtQZnQQx1PZ7IXonW72bwrp79PGaBDdYpIe3aVhBG2dn0iXBmDip512Txuj9dFObfePwUw5Z/315cRyyu6pztZ9TazGC7v6x2tYsZlJI4iPy6UXViz8V3WP2Dt4vi9kwMmU4zmIerlXFcPVxBBg+qDEykGHE+bBH6zkTrFF/60/eNqX8YxjMxBU/oTLJ3fhkByo9iJ6vd0hzgnq2V3gKTbjjmfj4oRtB5tawxKMLOg9OmpQU2DpwVUOteE2qNpMvELsZtANvyPpbYtB3YfUc0zUeFdqVs261wPI8Ud84G4VRP3SSGMy3pjXn9bStXn0kW9qrwtmFafVN0rI387DRFmrscrbO76bHw06R4aIcw15fJp4d29Hu4DFBPTqLeL8qf5ePj1+MmW6WCx8XvX7ZUxYLM6QBDzFk9S6BEvOiQkqO8cfdEmZuYNrB/dldxeU2HioWIRf0ZelmuiFCYOufkP1rYAM+CnAxQ7fwdppEka8ITthB/F1XeTrOKVU1+LL9qi/SVNvi7dDwa02LrevsySAS9U87iRBW++cFL33UvwSeue1szVcfQD0pupYL5vNcyosBRBbXY9uDXKJapNH/4K48mvrbhC3nQnofaZ8LKw6oLdbyiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(2616005)(6512007)(4326008)(6486002)(38350700002)(38100700002)(6506007)(83380400001)(66556008)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XCz4c3QuOQDOhznYjVp9GyCmsFpXj7ircutSsAusrsuAENt4oN0200cDRxKN?=
 =?us-ascii?Q?NyrGGEKFpuSklyFdKrhJyEPt1D/iG8NlfN1Ypay48jOzqb/cIeqedSFNPmIV?=
 =?us-ascii?Q?+HgWCgjbV3Q7/cRLNtHCGIkgCmFQqpmhXnOADfzL5/ibrAmD8iO7VWKr8uxH?=
 =?us-ascii?Q?KGIITeJmFcBnRRJociwxIe/y2ERWAmDfDuh5fXordlGXU2yngVxpkLEYn60h?=
 =?us-ascii?Q?QGWaeChVZh2UvWt28ukPDJdGGXRuT6IwWE3w4IKiA0wlFz0g5xvihDU5Hf7L?=
 =?us-ascii?Q?HBBr62rfv+JzNp94P4tWXE4Uzj7QBCRqdkyg0QOIO+xr5noKD+gxIUzEwb2T?=
 =?us-ascii?Q?IS0iqiAaOV3evAIp3mh0/mYwEClu8oBJzQCEaxJGNJm9M6tKZZNWtEAigRCw?=
 =?us-ascii?Q?hUjulT5MlqhAC75YvtJOw/ImAFtdwX9k8AJlXay0BVB4AuDbOsMH/CYprgEy?=
 =?us-ascii?Q?x6X6oeMCXB5UrTMZBl4lrRvec9DFM/KCGlOtaV3T1VWbLkzmpWoXIz9IaA/e?=
 =?us-ascii?Q?HGeoklRCzelusS5vJN9ojWWt+FAZD74KuLwZjFpWGUAZZf/xX4nO+vE2KMKD?=
 =?us-ascii?Q?bGrHOyzSBBZ4xu1K7ixu0CjWXfmfUc7Ms5Y54XquwcjbQAVhwP/welgPMTZf?=
 =?us-ascii?Q?PoKWJpIiCG2JFusyfhYnO+JHT7K/vbuguvq5ttKFmzfiuIYkmOlRSHf4wDe8?=
 =?us-ascii?Q?WWUded5tIu7xk9/Ta0hnnU5NAKWUJqPMyaAvEecqbMxGDp3qiUc8UoXVgWtI?=
 =?us-ascii?Q?lUNdG+vbYmAtz7Up06v1K/rqRPJHRuzAqXQKImOIGvgOPiKo9cCDPwwcgikG?=
 =?us-ascii?Q?I0lYAALTA4AOUOgoVvl22b9EnqRUMbjsa3Yja+jL7AOZ8PMrp/dEn/cWR9DD?=
 =?us-ascii?Q?n7kVCEdQRzlAQsdzENwLQXmgXKF7iqhRu6y2IilAK1xokZ0SsdRVcqLTFb0X?=
 =?us-ascii?Q?qvtpqFupzqqCHBStX0/l4Mn4lTww5+lyLD6h2iNOwNtiYiKOAvdMmB3MUXkX?=
 =?us-ascii?Q?yIRp2XLFBVjAE1ajuze3zKLTyyDAaXnq6oJQTY7TV2Ly8mMx2N9rYE1NVkX/?=
 =?us-ascii?Q?mm/NzubNjN3mRt1eQh29ubkUsz9Snsn7yJquNxBjBWY2JjlQGERQu8oXW7tX?=
 =?us-ascii?Q?6oQqnzNXzpu4xzyCu+NxtLSjJD5GAvnN2xJ0QEhL+pS0w6oIepzotkHLtrHV?=
 =?us-ascii?Q?OreSxDXcPlHNrq4nF+jVN3hiAmiH/Dd5iCKISM/4V66784piWY0rX+iqPyyW?=
 =?us-ascii?Q?CyjsV//SrTwHJO1CGSvUr+lARolAT2WWMoog9eRd/duqHFcQNvnw5T8XGFtM?=
 =?us-ascii?Q?YzuFfwb0IPxs/Sg3ca9zUdFwSfLr7ILzG5uU3EnSrAWlky8BxUvoh0pbpvnK?=
 =?us-ascii?Q?f4S6k6Oe2rQQm8oe+fTYvX+p7tlK2lHsgjipSPMKraNCrJR62ar4Za27KfI0?=
 =?us-ascii?Q?6iCC2jpxJXhFxN7nJxFLnFNDW6rGI4Sn6dz9uDF+ZpEqc6zwggeTOyV59zrq?=
 =?us-ascii?Q?MKpiI0hzLmzPcbH8Ky2KdOdXWDDGwlM6HMVlgSNWp6NlKPByK5eLekXrQst1?=
 =?us-ascii?Q?oOV8B4Furcdvn7VSzXV/fsUrS3L6M7ljQE+uSyBNzAFMYSfEGgq+edoc3HPG?=
 =?us-ascii?Q?Q04WkPt1/d9kx3+TXJiCqFjLH2U209a5N1g434tQ/cR1KcN+VFb/a5nlgWwF?=
 =?us-ascii?Q?5GRUjTsmlMITcEj2I0hqPprF6zk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0118895f-43a0-4e94-5607-08d9c57c4805
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:02.6436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlO7Ry1/M6bqw4d+TcyKU+9yxm3XF0jUtpnx8SXfXYG3GMGnZW50eX4hN1WnF74tUWAOBhDPKnclM1QV27nD0wUBf65g/GyvpIKNfADSFH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.113;
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

Split qemu_tool_popen() from qemu_tool_pipe_and_status() to be used
separately.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 83bfedb902..7f9a8bf012 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -138,14 +138,21 @@ def unarchive_sample_image(sample, fname):
         shutil.copyfileobj(f_in, f_out)
 
 
+def qemu_tool_popen(args: Sequence[str],
+                    connect_stderr: bool = True) -> subprocess.Popen:
+    stderr = subprocess.STDOUT if connect_stderr else None
+    return subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=stderr,
+                            universal_newlines=True)
+
+
 def qemu_tool_pipe_and_status(tool: str, args: Sequence[str],
                               connect_stderr: bool = True) -> Tuple[str, int]:
     """
     Run a tool and return both its output and its exit code
     """
-    stderr = subprocess.STDOUT if connect_stderr else None
-    with subprocess.Popen(args, stdout=subprocess.PIPE,
-                          stderr=stderr, universal_newlines=True) as subp:
+    with qemu_tool_popen(args, connect_stderr) as subp:
         output = subp.communicate()[0]
         if subp.returncode < 0:
             cmd = ' '.join(args)
-- 
2.31.1


