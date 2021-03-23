Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FF346068
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:56:45 +0100 (CET)
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOhWW-0002wa-4Q
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhOW-0007FZ-9s; Tue, 23 Mar 2021 09:48:28 -0400
Received: from mail-eopbgr80091.outbound.protection.outlook.com
 ([40.107.8.91]:12455 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOhON-0001uO-6J; Tue, 23 Mar 2021 09:48:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCtmFQr2vBClVYuaGrbcaCRKyrm2i8dthrxCryxzrorAw7dDuXtb9Ynz+CHHXja6Ntt4XCABc7gS/BgXaNZ3Ey70sXUi95Vykd6VjyIJd7UATGsDnZ/yJ9SI2h+U7W25ZOklXGXuxWPCGu+bTpZLCU5iqqgtU8qTTsgt7sNW0lEx5rG1CEXLEvM9pXmQCBYlVWD5GiIOkSOIkK324CoNScLmiflDUrtfaYrs2Dgj+eLXqobOvwmc0osW8PunPJiggYNIRHlwpPWJgmI4sWr+SI6RSrhWKhUe0g+pMJj0QDHbYXAxLsGPr/rD5ld53MgBrI7K+K65HxxPLJzVzJoXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RyRQFw5v74uPq4ZCyAOAp31ONUEtdss7wRp6d0Tm6g=;
 b=cqf4tugznhi7/swRShkiAZgi39g7aG/gcMcUv0KGMpv7wgabIWQoRh6UWPKMIxIijiTjcqHBDdFpbgWG9YAr9ch9xFf2s2QrmQKd2XiHzKNunyb/SmsNzi/5jn5Ga085xvCS6A/xu+En1FWEDq0joWSYqGq6zRrFsT9ibVPQ3XSII52FOFQhCeWA/R+G8adN45V7ENQeMqE+MfGNG7atjGkadwRaxj/hetzsEyu8xClOvy6Nu2WAluTg2pN3BjcbezqO54cHIJbA/5HIk7Ywd3+wurVZ/ZR6PKbg02MZ323UI9j2IqHJbY8x12nVNFMM1+fkkNB+DhoqOijmJ1A9Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RyRQFw5v74uPq4ZCyAOAp31ONUEtdss7wRp6d0Tm6g=;
 b=HeoAEdWOM/Lhqkfqm8xnEwk+7S8mk+3bKZxNnA0PkqFbzeeQhz9RtBWRtbmZtbEo+EyIe33OiyehlArpu6oNWFj9Jk72po0HDlLDfJ/R7KQ70qkPKAwcLwGemZSgE9TG5Jf62pzKFCRAWLERd2hvwQrFvoQcrOuJfBuNv3gdxlA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 13:48:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:48:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, vsementsov@virtuozzo.com,
 mreitz@redhat.com, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 6/9] simplebench/bench-backup: support qcow2 source files
Date: Tue, 23 Mar 2021 16:47:31 +0300
Message-Id: <20210323134734.72930-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323134734.72930-1-vsementsov@virtuozzo.com>
References: <20210323134734.72930-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR05CA0184.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR05CA0184.eurprd05.prod.outlook.com (2603:10a6:3:f8::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:48:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4939aff-4bf8-483e-ccd5-08d8ee02490e
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203404917CF24C77B04C39E9C1649@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOfsQtfPoZs1Mk3TnuVBGaPr6Q6gsK0DsjtOgjAWJafQ00ZPnMJzj51OJD9NrYw4R2wI9FZ3MoylgitimhMHkcWlDdW6uqjgo0xxUzDUW9YQGv+XFrhP5FdX/B/D9YZ8bZGIETS8ldzL7AxFGsmBzj5S3t1QpPnNe2NKziS4RNU4aX/l0gKhXEmyVpl+4sXjXOTDsZWrK/ZEf5KIYsixqjPKBRcSD/G8kwlb5qsoB2nvY7ndxg0hPkrdu14Hw4WJ0CUBuRQ8TAlX0HjXbhidvMQxmGIhw+jhQwTQ5jdjzVf551PAZfRF3o/Ztn3201NUewDa1V++SygXMfcIoCHBoJGR3uFL9oX765iSbGQ3V4SvfRuM+s8eNFsZp5B+yB9yDP1ga0pw8/ueNUR9hUHIxtZHXvYUUa4bnnTBh8x5fXH/CyYmcvna+mPm3MnXBjhtfBolKiNDuwnDf6cjNs3OLlt5V7+8xCrQ1oDvxm/GWeReH1Sehz/Vo0WxE4LViqJfvjASe86U877SBJILQCCgM2cC4XW9/KrqDPs7Ru02/ESW/3SxHkThgleT2Ow8mS8oGXiAS01E6nt4pa31PDEr5JAcSjiMnN0mhx4up0ZH+iEa2GznOrhYFKIAFrTEJegQIvMvQnnThRMSLk+OCfpnL+PtTZAjh6am9DlObvkRNTV1AfeRe5XqWbsBsaQwOoNb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39830400003)(396003)(376002)(4326008)(186003)(1076003)(6506007)(52116002)(16526019)(66946007)(316002)(26005)(83380400001)(6512007)(6666004)(8936002)(2616005)(38100700001)(956004)(2906002)(8676002)(86362001)(66556008)(66476007)(36756003)(6916009)(69590400012)(6486002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0iRpa0D7o8Vox7GaVclYz5d/5yF91/ZnHz1j/4ZPPiDmXAPfebhJyXv9+gXN?=
 =?us-ascii?Q?puPjOuZywmDSEzr8jGjF9FSGTwsjhaOGXpxAylnIw8Z913X5GapIao7Fb6qa?=
 =?us-ascii?Q?chysRd6plzL+lPjIkuIcTlHDXQ1anxXFEttt7VCAhGJkAdP4ep1Qkfzx3vDI?=
 =?us-ascii?Q?ILyvx0fwQaaINyG6D23aeCJ34umeIxhQeGA/CGV3K73KN7z4fOH5eSPi3ouH?=
 =?us-ascii?Q?SEQ8uuBtsjA+sGf708T2geqxkcufp/RHkfKRJPELoNJmiaU0PrY6gbHBckyO?=
 =?us-ascii?Q?W6isu0T6enh4qzyaRSWjacrCOUqmnD8ujBNdJEgiQQyE7WuvevdqbKJLhFj4?=
 =?us-ascii?Q?2u/Sfu0oSKpLNvNx1J58Z2O17oCyrWoUWsU6qCqZwFDOl1bOpwRZ9uBqlZPV?=
 =?us-ascii?Q?nKTzAl0PsSfREY3tzSVA5DUlKsPP1wczr/2KXQMOQ+hkIXcvoZ/C0YK4Q51p?=
 =?us-ascii?Q?JHMaUbOPop75Z1gbj4bK6FwcUR/1afWSCC/5xkrJmLYxqnsGc5eBYQlx15qx?=
 =?us-ascii?Q?Vhm2y+ALcSEvouIda5Dlr/l0muRFkuqv+7NXkvmG+OWlW/Du8iDsjBUXsIJY?=
 =?us-ascii?Q?SxuIhkbU/5btLqPPSTby6xvyuiszs70o/TIa3Yh6yMBJ+HuRk3dquSnYQ/HY?=
 =?us-ascii?Q?KAwBW9Bh2rFR1tEDxvgzZNIwaDMovspjcVn5GJRxPP0PuhnDDQ01NWXy5bV6?=
 =?us-ascii?Q?WuFfar0LW9V7TpCFdYUQjfhTttcKxqfJlDdXDBsGx6dPHU8vd+IptrgGIZSu?=
 =?us-ascii?Q?F5KIt/WoBeu0xVyO3RG1Q7NZxTULONNJTGn4i4+0Bcmhaxv5wWaVuI5BRDKu?=
 =?us-ascii?Q?H5zeo1ts4rRwhfv+epkBgo/LJYNVYKIMXYlHte5RgCnKhnkahe/+pjX9lgLx?=
 =?us-ascii?Q?mkbhqX8l1OWiRmdMiljF2BOxcKkViBQd9huM9LW7j64U71J6WzY67rNL2MwE?=
 =?us-ascii?Q?L1gznU4aFeV03BSIatsiJ+gTC9gaoffXhCkhfLHNFbpY2m42kobJC5a9+E3X?=
 =?us-ascii?Q?yx0XQTYaItLzITPUZaXkF7q/JOAvbV5WZ6ArBm2dPkHC7Wn+cTtSDaprjAZ9?=
 =?us-ascii?Q?kpyyVLH4XiTr3kMcW/85QrpC/Utd1aWBblMkf26KZkdaRy+YmvCzqLGHS3QL?=
 =?us-ascii?Q?2Jwl/Y2+QVJB3D/JT5NNoWHr48g2JYoYkGGv95zZHFLnHbx31gjYvi5GdliY?=
 =?us-ascii?Q?dAMv5+LaOLKAVhspCKclOwkyb9a1O+KVOOeT4XrA8Ov2aZnGUp8uTI8R3hEN?=
 =?us-ascii?Q?wEMAINzpVxVSbyg+fahKSsQjx2fA8D2h+PVpnGdb5FYPZ7bJla72zy6s2L+1?=
 =?us-ascii?Q?VZbcXwsmtekx/G7bXTMzymgp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4939aff-4bf8-483e-ccd5-08d8ee02490e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:48:05.7709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4+AXmCQ4HMtiPl7zbnbRPrws69Q+k4hbC7cs5hpwXjN290QPP68oJJ8wgovpXRM79TSRX2utJq6KfUrd8KSA3l6Q6m+tky8UIt/A6cYloU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.8.91;
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
X-Mailman-Version: 2.1.23
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

Add support for qcow2 source. New option says to use test-source.qcow2
instead of test-source. Of course, test-source.qcow2 should be
precreated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 scripts/simplebench/bench-backup.py    | 5 +++++
 scripts/simplebench/bench_block_job.py | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
index fbc85f266f..a2120fcbf0 100755
--- a/scripts/simplebench/bench-backup.py
+++ b/scripts/simplebench/bench-backup.py
@@ -58,6 +58,8 @@ def bench(args):
 
         if src == 'nbd':
             source = nbd_drv
+        elif args.qcow2_sources:
+            source = drv_qcow2(drv_file(dirs[src] + '/test-source.qcow2'))
         else:
             source = drv_file(dirs[src] + '/test-source')
 
@@ -199,6 +201,9 @@ def __call__(self, parser, namespace, values, option_string=None):
 Use compressed backup. It automatically means
 automatically creating qcow2 target with
 lazy_refcounts for each test run''', action='store_true')
+    p.add_argument('--qcow2-sources', help='''\
+Use test-source.qcow2 images as sources instead of
+test-source raw images''', action='store_true')
     p.add_argument('--target-cache', help='''\
 Setup cache for target nodes. Options:
    direct: default, use O_DIRECT and aio=native
diff --git a/scripts/simplebench/bench_block_job.py b/scripts/simplebench/bench_block_job.py
index 71d2e489c8..4f03c12169 100755
--- a/scripts/simplebench/bench_block_job.py
+++ b/scripts/simplebench/bench_block_job.py
@@ -88,6 +88,11 @@ def get_image_size(path):
     return json.loads(out)['virtual-size']
 
 
+def get_blockdev_size(obj):
+    img = obj['filename'] if 'filename' in obj else obj['file']['filename']
+    return get_image_size(img)
+
+
 # Bench backup or mirror
 def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
     """Helper to run bench_block_job() for mirror or backup"""
@@ -101,7 +106,7 @@ def bench_block_copy(qemu_binary, cmd, cmd_options, source, target):
 
         subprocess.run(['qemu-img', 'create', '-f', 'qcow2',
                         target['file']['filename'],
-                        str(get_image_size(source['filename']))],
+                        str(get_blockdev_size(source))],
                        stdout=subprocess.DEVNULL,
                        stderr=subprocess.DEVNULL, check=True)
 
-- 
2.29.2


