Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADADA310E1E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:48:32 +0100 (CET)
Received: from localhost ([::1]:59124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84HX-0001Pf-I2
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847B-0008Pe-PM; Fri, 05 Feb 2021 11:37:49 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:5345 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l8478-0002Zz-WA; Fri, 05 Feb 2021 11:37:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5kCtFj3/IrNYx32LuCNRQcM6nayOGmOzSZr5FAlUoqLo89yPB39jDB0ZjgAylJU91VUZtbJUybD9Qu7b6DTiBBXh+meWuk0hV16yzeTUIpaM2IeGBzd1dffW+bXtHIeZOhFjURuNfMp9H8gYiL/chzBMR9F+1fArWlv/qSw3erQSHOM0pnmFAi+YPhezGOROkMZ5SK9hvIWbbUGA7u1Ce7h/wc1T/FNv0FB6tCmf7GevcAQwmTvkkNhIO77BS+WJUQupDQoE4WK+WX+fMYSO6iV8Z9MsfpOVBwTG897cbYggSFQ8fwQXfzjHoljKnIu/Yn2JzWvXStsmuHK8DuyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0FAPQgjroab27p3N2HwWJ6KrUjx30ymQuCvO9s0/pw=;
 b=daJkz4SCZjp0mvQs09MNhm+VGHjVpIKClQufWR6VwjlRazx8eJ8oMzGYnd++PWrvIzjUvKktb7EN1J/IX9ZGinczkRoHA6IYQ4GC8MICqyS4qPRx0Nt17zvBZJvWSZwYia8WEKr7NpGYc/zSfjo540mRxFffdQOV0JAkO7gg45mBXWXZjBPYb7TwUQ0NLMC69HaK3jnTND6Ml5GuXi3IaPZrRwucrw12AGFrWYXvwCzhG488Q0w01B//gBYp64Jvc9wUllqd2EzltFSIvxsHfJ1CucYcjX1B1WxuncnQDsDMR2R41jCItM5c6iB2v/Z0v6c5SrkBIwdBp5yyandFww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0FAPQgjroab27p3N2HwWJ6KrUjx30ymQuCvO9s0/pw=;
 b=BknKBkMnIlAD4hbvbrUvgPSE5Tp0vX4ngXo+CQNgEfpEnTeFZhP6dTTrw0e9iiFRnMd3WQCMDvrlBHQCsykhrekyxenXpQ5oTocFOT28sG0n+Jc0LaXZ0HV9fj8NrhJw5Jo+5XgqLXb2eze5aN/9Vv8nBk78ZdQ8xcCpw9rzJZ0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6293.eurprd08.prod.outlook.com (2603:10a6:20b:23e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 5 Feb
 2021 16:37:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 10/10] iotests/264: add backup-cancel test-case
Date: Fri,  5 Feb 2021 19:37:20 +0300
Message-Id: <20210205163720.887197-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af24e4d1-83f0-4b27-470e-08d8c9f45c70
X-MS-TrafficTypeDiagnostic: AS8PR08MB6293:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62932E3E5AB6A19FD366C6B2C1B29@AS8PR08MB6293.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xvIBR44seC5Hv9LIGCpZm9/p6ygbWv636ouQRU7tePfPF+iOOfWmWpjf21CKl/ki1hiE0dAyiDaMiBn3nVIicCii2kEMDRYw9PAjUwLS+iSur1/LuD1HRl3pMdxVFMR2jPz0yC4J+EoOibye2mUwZ4ckUqtdokqS0w8mRdfwy6Iwiu0CaTxkMjG0Ap+uh9bM7L5JpQEUwEhmS6xw8aNLpq0bO+wNYFazXgqm3QcDhmlSm9eNA8Tbj1KMm9Tp2ydCLNJTTs1Sn/dfTz4dx32zE93FeTq0HRr3iadxNXgs4vft04yAs9HGsiTzD6M/NgvGu+4PmYG2srQeRotyCk5nShxKkMntaW3Qps11WIoOAi/yiaSpp9wGcM7AN9PAKQqDC3jYq0OQNHFSB+gyz/tGNiNMieHdNfTElUk/YaEGjbqBUHkDMnwIu4WS/7mh+KlfOUgf0WpJw4ztqNWILWiX9bfIq9aTwS20YvLBDz9OTr2fcXvLY1F+KcqvbbWdlo6jrngPCOBcUzlXzsnbWnQKsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(136003)(346002)(376002)(66556008)(86362001)(6916009)(2616005)(83380400001)(8936002)(8676002)(6512007)(186003)(4326008)(107886003)(6486002)(5660300002)(36756003)(26005)(52116002)(478600001)(6506007)(1076003)(66946007)(16526019)(956004)(2906002)(316002)(6666004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?X4pqKRc20Prrjc3nf2gEDJmD+NGxtdVUq8/HF2qcB+h5cpy+UKECd0HX7uB4?=
 =?us-ascii?Q?SqF3DBYG++FvJXWlKKsJGyNwEU5zz+Dd1QXXuwlY0FOzlc3nw0LdTayFQX1/?=
 =?us-ascii?Q?ONNCNrY2AduINLndlmBavs+nJHEzmXVrcc/G1tWKpcWXvi+pJ0bd4Pf3T8kg?=
 =?us-ascii?Q?ZK18NQ1oUusLwhTs29V9f/caydGr9ex0lVeVeSRrkD3A89h77Lxj+Rnnc//L?=
 =?us-ascii?Q?c4Ku/GZ3cfQSeq2ubQ9HUEXMCAFUgru6e60bOq12XPT4JHR+nSo+oSPhraNg?=
 =?us-ascii?Q?sWtyLEF2b8ciAVkrEQe0pH4Td1fyTfnZIxyRtaR06EjTwHrnkLw3xNWLTVgr?=
 =?us-ascii?Q?XkQ0cLrlPhBxAFmQZnO0AFVNQYNRVtNHsRjbw4S4TZFlIB57FVVBkdaT7CAP?=
 =?us-ascii?Q?0z99AL4gb1OXAL60IpO5p8yXlS8L/cYKgEzi/tBq5vG+6AlM8NxH1Bzq7z60?=
 =?us-ascii?Q?mpbJ1MlRNpIJ/WLckdwdSVktBX8z1lft6qg6vl4WhaLWuRGX+Xqjub7W6mVl?=
 =?us-ascii?Q?LkpGY4cdnV8VyPs8CHiqx1Lx4Euiq3DF2uJge9jO9cYXDi84LurBmae5SlVz?=
 =?us-ascii?Q?ct9pF3UoV+oxbKUPqhWIjcyqnUdqu5i/LssaJ395ZwOb1LWUWgo10reN4tuI?=
 =?us-ascii?Q?Ac8WgK7PYvAwqil07p2Rwi3Dwly7gSueIGA0eXXiHGLoHl6CDaHlWKl6bLnK?=
 =?us-ascii?Q?K8BnO5voC93BZEt8iF5/VucVeGXRXJ6blBHPfna88uaILEtyVYb7wLwYVXal?=
 =?us-ascii?Q?gMe+f18SA82rzndHKWL0p2foApvEv8COc1Aghn7cjuecgJF0HAl/NWUjtD2y?=
 =?us-ascii?Q?rMbPVSTG4362ASSFSxGtf7NdCrmGDojTfaShafLTzlmDFXnNERSPeJ6IpnLH?=
 =?us-ascii?Q?1u1svb5OIoh+nuJHMdIjJMqpeQ0kUs0+OH8cqL4lpqPusraxGrdGbSUTKqml?=
 =?us-ascii?Q?C8mfrBsw7HXfR+8yh6+OGaQLJpPEmx8Vkxwj9DJy680If3F8m7kETTfmMqUO?=
 =?us-ascii?Q?3/51XwxV2k7wOW2aH8RMvmvYfZB+z7EOfBxQRIukZvSby8yZmpMeqtc9r4+X?=
 =?us-ascii?Q?Qm6ShBY4DaPE9Hw9Vw8eYkHKl2xJIWG8EK9C9MoTAqq6yTvuPpLS18wvfwaF?=
 =?us-ascii?Q?Rj2R1FaJ+DPkv+yMIxbCcOgkDHDrQBV7ZAR6avsb2K6rysyPJSmqzvdWIcBe?=
 =?us-ascii?Q?BQDBKwcBFbNzmyhg70YK3a7mzAvpM6GCDUSILh2CuvPCork8ntZAB2AauvER?=
 =?us-ascii?Q?d6ZDEKpV4oUhHeCNfDE2kLPhYQRBg8jR0aSUFb0ropS0nM1ou4HoYTsee/3N?=
 =?us-ascii?Q?tPjHnj6t4Na0NLcYr2aGJuvQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af24e4d1-83f0-4b27-470e-08d8c9f45c70
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:43.5429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ivcusC0dE/NNWzU8l7LueWBGwVA/5wgroE3vzsrch53fnTaNRg57Y1p0Gyj7qdgG1FtAEdRE4BxXqlb6VV1OaVsfLXG0LRjgWMK83O0UXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6293
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Check that cancel doesn't wait for 10s of nbd reconnect timeout.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/264     | 21 ++++++++++++++-------
 tests/qemu-iotests/264.out |  4 ++--
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 347e53add5..4f96825a22 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -94,13 +94,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
             result = self.vm.qmp('blockdev-del', node_name='backup0')
             self.assert_qmp(result, 'return', {})
 
-    def test_mirror_cancel(self):
-        # Mirror speed limit doesn't work well enough, it seems that mirror
-        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
-        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
-        self.init_vm(20 * 1024 * 1024)
-        self.start_job('blockdev-mirror')
-
+    def cancel_job(self):
         result = self.vm.qmp('block-job-cancel', device='drive0')
         self.assert_qmp(result, 'return', {})
 
@@ -109,6 +103,19 @@ class TestNbdReconnect(iotests.QMPTestCase):
         delta_t = time.time() - start_t
         self.assertTrue(delta_t < 2.0)
 
+    def test_mirror_cancel(self):
+        # Mirror speed limit doesn't work well enough, it seems that mirror
+        # will run many parallel requests anyway. MAX_IN_FLIGHT is 16 and
+        # MAX_IO_BYTES is 1M in mirror.c, so let's use 20M disk.
+        self.init_vm(20 * 1024 * 1024)
+        self.start_job('blockdev-mirror')
+        self.cancel_job()
+
+    def test_backup_cancel(self):
+        self.init_vm(5 * 1024 * 1024)
+        self.start_job('blockdev-backup')
+        self.cancel_job()
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'])
diff --git a/tests/qemu-iotests/264.out b/tests/qemu-iotests/264.out
index fbc63e62f8..8d7e996700 100644
--- a/tests/qemu-iotests/264.out
+++ b/tests/qemu-iotests/264.out
@@ -1,5 +1,5 @@
-..
+...
 ----------------------------------------------------------------------
-Ran 2 tests
+Ran 3 tests
 
 OK
-- 
2.29.2


