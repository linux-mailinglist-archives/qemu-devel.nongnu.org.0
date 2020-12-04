Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9782CF6AE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:20:16 +0100 (CET)
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJR1-0005Io-Jz
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFx-0003hy-Jy; Fri, 04 Dec 2020 17:08:49 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:46336 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFq-00029T-0j; Fri, 04 Dec 2020 17:08:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnKFeHQo8NBZWDin0U5ZDR+fZvofVDj0LPNU6kLze4GsZGIS6nHieuqL03z3Ehv/FgUNRMpHlB+4lMm18/3HDBBQuxuAV5YyKbs7pgEB2n2TiVnazUWpkvU5JH/i6rVOvAPp+sL4eTSvgjqiCRn/ZRlJZhemASTxJZd6F6a10ed5AyYwFCJxJ9rFX0n5OXuOeuzssZe/ySlYZKqyiQtmbdmsK5GN6rFiZkmg+4t6S8V48h9wXjKxgdI75ev6bcpor3BHq+mq6aHbjO/zJPOhZqbU0RKsVoTMBdRhJYdZdudlBjXDGXjGfClvczBQq7MlRCFPo6nyByvRdAaYAqmkNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tjK3JSdiSjsBAe3ia9duAfjjtr3RGC//MCeqzMaexE=;
 b=gAvrdx386km6ItiopI53pnAMLOSAub8RU67R4hamwwfFaNllaJM4d4YxHElQPtOZzd/6hCGc2DlmbUYdhdhqCX6PvNLxtbScf7KHr7rS3Q5hxhYZ2eY2/AKXNHzDOhui9Z3xFYWYTiJY0d4Bj1w7CSHe0P8WI6GcisFuWSjXRnwXDtQIxDRDLNB57eVE5QuUWQ6XbAaNuy52LqL5Uzr/djSZHT/jAY/W4yhGjNPlRxWe1CHnWN7i72ZlWNh99PegVOO6FSNCcRktOUXrXzL+s/kCCQgStVyg0HYKIEyc/h3NMcXufHI4We/RG+MNUd1jeX9qGmB8OGf+U48mTEtmMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tjK3JSdiSjsBAe3ia9duAfjjtr3RGC//MCeqzMaexE=;
 b=FASq8uqp8UMNRtO+csF8cXNX6o9jAd+K4KtpzD4NEoFqFnFrA+Tr4YjoiK4QgzSv4ujvE6bzrfigl3OSCdtUgDHyxOeZo2PgZNocX2B0ejlMLl+DTuv76Ua1333PKRWkIgMKylgXNeGhssDoEJ9ylFjag+SYiGNVp0Z7QCXHzqg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 11/13] iotests: 30: prepare to COR filter insertion by
 stream job
Date: Sat,  5 Dec 2020 01:07:56 +0300
Message-Id: <20201204220758.2879-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98b06fae-76e6-4c90-91a4-08d898a11e7d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB407254CA54FE5E41C433488DC1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RhZ5QyyzgbJT2p+LaFDYIo110Kc6feOnAPPYChfeymkAI70oRMJSueSE4Op2kpfG6CnXE+R9k5o1jAMscNMfopWkqKKW/l5IdTU8YzTC4qqgj+zha7xb0Ep/lcCuGtpKBjFfhG49Zf8JGxyyAA/Gs2XdkRWqt3URaGgNolspOXtH0DeYzOOFRLBSk+6/lTUU+5DuWbxYiA+cy8Z5IGK7CrFPLgN4On4IrvI5nvEd0Kkjc/0bm5+YrsAoSOf9Ngc0kYk3BImh9o/D6GY5trDE5Pis879j8AYVZmdrfayCn0OssUMIedH/nOxhcPrZsHyD/7+QxVtNys4GLdEPGR2KVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(376002)(346002)(366004)(66946007)(66556008)(1076003)(5660300002)(956004)(107886003)(6666004)(16526019)(26005)(66476007)(4326008)(36756003)(186003)(86362001)(6506007)(8936002)(2906002)(6916009)(52116002)(478600001)(6512007)(316002)(83380400001)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9tfU/n0Vs5Pg+rbO4Agdp2T9+GVYUZL9pYHUPPvs1TtdZMwcco18sQn54AhU?=
 =?us-ascii?Q?813k/Q0Iu8BGHO/zLYn5F34TQDpKNRfEIHDJeTgAGDmJW+0bTWwar4nc6Bns?=
 =?us-ascii?Q?ODE+RTxf1Vqx6+7ujHTa+MOw/2sa7eG6JfS2OYM13RxHSC5Gu0eIBINXtn5x?=
 =?us-ascii?Q?SQ17MBOWjb1BhQQNNmplv3oDAkV+LLYtBXMCNxTzCbjKfmKaTWKnt10PNB1V?=
 =?us-ascii?Q?WOosCrxh995/2w7d3jF0qwf354ybAPIUYwdaEar53Lsud+TKQaevQjIG6w+d?=
 =?us-ascii?Q?kefKQ3jWx7qGwK/n0ThHY532NZVLlEzPfHYHFA12fFmgtBsTlblukDXLwN1J?=
 =?us-ascii?Q?Bd702X6JWXHi41I8YeUqYinKs2dryPgqCNGyQs9LVLXzzkuCIXse1k+nzl0x?=
 =?us-ascii?Q?LjiLNCVrv12tm2Dy+/yJRJtw5p4J3A7SatjYFz8W9gs5pT+LGZlSUKKabQpc?=
 =?us-ascii?Q?SO19rlvqj1EV6ASCVvH4+Axk2QZ2tO/04rQy+l/x+K9TTWnerDJ1yrq6gEKK?=
 =?us-ascii?Q?AYbsKd+Z27v+Zy1p3bz9yS/OEsDrDpSfEL+FskScNa1cHFG9qUtpnBV/e/Tr?=
 =?us-ascii?Q?5kxlp9fbY8AC+ChjuEUGS1/etAoM8+/gx52cQfvjcdzvMsltliMNF19FDqCv?=
 =?us-ascii?Q?+OieynA6syrfzUG198VPfW1hhN2C31gxZn95b8TtN0c9sqkiD7EfjWA3yDV5?=
 =?us-ascii?Q?MlP3LYWo2RlEUT3D8V8IbGiGLabL+P1K4rQLST5jAtvjJ974Y7W6HJRMMaQ2?=
 =?us-ascii?Q?rPJVIwO8DiFggpdcWqK07wWLm8HbexRuHn6EpbWMenmUTzs1+tOyJJnMU/pQ?=
 =?us-ascii?Q?N9hPqRW2hFZeQaMbahPDvUozItK0ixW5AW5igtiebiorhDFZypQNSFq7aHNP?=
 =?us-ascii?Q?hkC7AUYL10+x6ulG0phb4W6ea8RzTLlIR/pN8lLbLVF9pHQOv9dQctIKvyiO?=
 =?us-ascii?Q?/h9M88RL+C2Xzbcbc1nOLaKl256VCzPbu2rlXiNPP+CvADvzm65LwMKox267?=
 =?us-ascii?Q?9HFL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b06fae-76e6-4c90-91a4-08d898a11e7d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:24.3210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFhM/Rr1ReK+DdQ02GeM6qB6vYY3F508jt4VV9vCcfnlFqcb/kLsMLzQzTDHTu7PJzJGLhnZXIzU5cOTtpYj4ELe6gAabz0Zu+zme+chtso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

test_stream_parallel run parallel stream jobs, intersecting so that top
of one is base of another. It's OK now, but it would be a problem if
insert the filter, as one job will want to use another job's filter as
above_base node.

Correct thing to do is move to new interface: "bottom" argument instead
of base. This guarantees that jobs don't intersect by their actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/030 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index dcb4b5d6a6..bd8cf9cff7 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -245,7 +245,9 @@ class TestParallelOps(iotests.QMPTestCase):
             node_name = 'node%d' % i
             job_id = 'stream-%s' % node_name
             pending_jobs.append(job_id)
-            result = self.vm.qmp('block-stream', device=node_name, job_id=job_id, base=self.imgs[i-2], speed=1024)
+            result = self.vm.qmp('block-stream', device=node_name,
+                                 job_id=job_id, bottom=f'node{i-1}',
+                                 speed=1024)
             self.assert_qmp(result, 'return', {})
 
         for job in pending_jobs:
-- 
2.21.3


