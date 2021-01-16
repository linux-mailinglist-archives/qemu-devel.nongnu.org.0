Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBA2F8F8B
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 22:58:04 +0100 (CET)
Received: from localhost ([::1]:32826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0ta7-0002L5-E5
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 16:58:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQR-0005Hs-C0; Sat, 16 Jan 2021 16:48:03 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:54721 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQP-0007Dt-CF; Sat, 16 Jan 2021 16:48:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRjzBAcEH08L8FaU/P9RKO04OJNjcNWx1KugKkJbHVS07fs1u29KN7hG64RZQP9+r3lZ2ypGbw7Ucdrf83Z8CsSWPfZ5Ag3em0BGTFGjCTtSrA9Pmnq2tHfICDnl0/NuidzQbBL+97PKYAlkSzKMlsJ+7Swu9s2SBZYEXn8MgFgqVLb2cNJegUPcxxaFV6i51I7NIwIwMku6pinwykV2uSd3KDGg9N+QR5oqaTFWecGynlVFZWrhJOZcPpYOoYdKKB8yjdBN/IuEJphFcla4KjmA0M1aHwY8s/wMq99EkBW9sHUWb3BSgdwExgzRqdt/TLfDQJBh1u6Uth7Uq4XrWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z79wFWVDKhSDw3zCimccdk4BeG/2y0er0ZNrDMlTVaU=;
 b=MLTttppa+2Yb8CPETPg9euZRoFpSEEQ5Q20oec7k6ReC6VKAJyLzgCeBX7usShU9wtg6q+qksgHsHyfvpBD5Vz+1YZLjQ9iTJYeGcTBq71NTl1Kc5pj72hXxCDe2MH2VM25Rszejc1oADQL/2wmufw5X4u0v3B4IHq5HuEsjv4376h6R0duSHywt6gHM4U1d02Al6Q9V4kFGUFBPnyiJkfFpJK37qT3efCqgsSjC86TxOb34gKYOKFCOyg+3zxJoCoIO8N2EzywLuMPfIXOp6sbZrQSCYtmLsbzjIbgrmuVFfcmOG3I3A7CkJNry6qF1EEVq5xGYOgSTgw93MKw0fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z79wFWVDKhSDw3zCimccdk4BeG/2y0er0ZNrDMlTVaU=;
 b=EVabPoalXQ8MJSdwIsXoosOZrfyQbcyBd8E7K3TAlxvUANM9MojE+YsNCB5jVnGK6aiBMl87qprCjYBZJl7iJSCZdG18cwP7JcFdbuVOOfjVMAiGa220M9p0VFLCwxea7fMG7tyh9qR9OzTpeht7sRMz8CrvdZq3FvgXPaDWM/g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 11/23] iotests: 56: prepare for backup over block-copy
Date: Sun, 17 Jan 2021 00:46:53 +0300
Message-Id: <20210116214705.822267-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8829584-a67e-41cb-d725-08d8ba685fbf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35420EF58B60083469C0284AC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v9o+EamXTbbu8nyv97WinKEDpVxG2j8KHxc8XfDjn0dNlh8WF4DXqJW5unzYWWMZrm+MMMq4pjhWS1Or7GKZxUEZNcEuzDOa1v60UCe+ijECK6aTCa7xw/5dYSl2S77K48o69/Vv0h8jNLMlKtEizAQQnha/n+g4GkFy8RgXbUXU1N24tumniIYEfrnqOhXyVIcm/ymlvRC9oyBMP5M6wsK1LZ8cutVoHqHgqS3w7OM45NFSsA4KxFamjjMck/FTNzMyjgBErf+w46anCvgjLEFdS2+29boyWLOOnHqQID5ZBewixFArC0WRUZn42NdI2EctFU0lGltyp7g+BbL9AETULr0HEZzC8mB+Q8iXef3ZoURWhF4pSlJJSr9cAS/N9k/6YLfdCvFHWLcSwEYTZMvqku9E4adSCLcxsWcrCrl03fpTTpHAGmIK8qAD/+cs7RHdUt3Cx+YdKGu7wiARLdlSF+eMwXmVQiq5PxKB2sEzZhdUNaNtkLf8gwdo7mOCrvDj/cAmigqR6rqwmbcvsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?97wtY9FHlfXpCQn7rhOIRdj8gfhaxa7YybqlNf1/ir9qJbJm9IbCsNozo/3z?=
 =?us-ascii?Q?THZn28J+rmcXh5Sde2sTimmV8xRwyFoBZ9l1QdhXTTnfmRcX7FNSqSf9rHfV?=
 =?us-ascii?Q?4nm8n/7Jow35pDrDqRWJD0llRQ3vq8/hAbjkXWyT0cF33Fsk340GMSjrpEK+?=
 =?us-ascii?Q?DGM84I8qAlUgZP5LOUKwfs9ZUq+UpGqs6xfODUdLN/Uke6xlLs+BtbXlKGMN?=
 =?us-ascii?Q?AgbM4lJArUtiMhiR49DDfFWf3x1tncvmT+uOqMsxfJPn4Vz8wwUMgQ3Ap5ru?=
 =?us-ascii?Q?Jl3zyApnedNXt3MLRcQxhRa8gFKvmksfz6QddjqMFre19MODB5i4XKhiOmxo?=
 =?us-ascii?Q?Q5JQphac24aDOMmMWJBMaP47RFNG0c/ouiNIj80Bq9DXFQvG4R0DoPMi80Nq?=
 =?us-ascii?Q?/iojEMknRJb153RHPZ1G48YaGentxCqpjT5pMdtVtgUk0whrgmU4dDru1S2e?=
 =?us-ascii?Q?UoZ9S5FgH/17q7SfIIdWypYljI4yWuhqc1u9De9kc58dHAaDpfHs2PIjNTpy?=
 =?us-ascii?Q?gWaL1Y8tep9mMkFJUq/R03KgTOVpb5eNXpJmN9+37lOio21lnhMwvnSokzy1?=
 =?us-ascii?Q?uWF8jc/2Q7VPWy5CtSYnC9o1tj41h5ehQ09CvmV4EfZ6RIyXg3uygal3d7uR?=
 =?us-ascii?Q?PisRw5llCqyu2VpPJwWtL1W7x1RHAzIULL0/rNKTQtcSJUOYRGsF3Y3sVdQh?=
 =?us-ascii?Q?dON/9Y0hqpn7ViqBi1bDkOqyIwdrpiSQBYnoKC2Nuit4NATEAEq0niXi8w6b?=
 =?us-ascii?Q?BwHsESnUUVM968wg8tp4PZxySf0eztfgeZNBbI/QhkBRF2QTqncTFIFIwA3C?=
 =?us-ascii?Q?IiIdWn8r5fvPDgqRsU0XLRwEPQ7VmrBi0OOFqgjqR82NvUxlcervHRQX80yU?=
 =?us-ascii?Q?PvqEf8C7mnZsDp2t0da+FasJ/tIcN/0gC+fCsS2zuwp2rfr6jW08Mj3numC0?=
 =?us-ascii?Q?5MMa5yABA8Ru2E0Fs/12e31iLNVznWe8HNDp5nuj3fasGleObwiezIVsswQL?=
 =?us-ascii?Q?FhYn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8829584-a67e-41cb-d725-08d8ba685fbf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:52.1023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wza2oOB/T5gXBlhQ4QtHyw4/lJ4qjusg9qtq2+CSYG4y7p7/odDVisf/VsB0ig/CeH2gb9mzl1ZNH93IuowgZ6SH9ceQJOomauguUMVpfxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After introducing parallel async copy requests instead of plain
cluster-by-cluster copying loop, we'll have to wait for paused status,
as we need to wait for several parallel request. So, let's gently wait
instead of just asserting that job already paused.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/056 | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/056 b/tests/qemu-iotests/056
index 052456aa00..e2978ba019 100755
--- a/tests/qemu-iotests/056
+++ b/tests/qemu-iotests/056
@@ -307,8 +307,13 @@ class BackupTest(iotests.QMPTestCase):
         event = self.vm.event_wait(name="BLOCK_JOB_ERROR",
                                    match={'data': {'device': 'drive0'}})
         self.assertNotEqual(event, None)
-        # OK, job should be wedged
-        res = self.vm.qmp('query-block-jobs')
+        # OK, job should pause, but it can't do it immediately, as it can't
+        # cancel other parallel requests (which didn't fail)
+        with iotests.Timeout(60, "Timeout waiting for backup actually paused"):
+            while True:
+                res = self.vm.qmp('query-block-jobs')
+                if res['return'][0]['status'] == 'paused':
+                    break
         self.assert_qmp(res, 'return[0]/status', 'paused')
         res = self.vm.qmp('block-job-dismiss', id='drive0')
         self.assert_qmp(res, 'error/desc',
-- 
2.29.2


