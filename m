Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E348492B4C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 17:34:18 +0100 (CET)
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rR3-0007CH-LH
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 11:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r39-0003a4-Da
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:35 -0500
Received: from mail-vi1eur05on2134.outbound.protection.outlook.com
 ([40.107.21.134]:20257 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9r36-0000R9-QL
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:09:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9vxuDS5x1xsqCZivqNzvjdRWNOzfNishKhteipOVOFzbFOm+UvLvrKg3SWuSaLtkLcXaOp4xeZo4rBI0aWre1KP1A64IVxdkybRR2lEeyeJR+yTiCy2tKScjf792LVSjfCw/nmV1MF/x+ePpGF4hIKjsCxRIVfmKVp/jmhkecOdtTwpbMTZc4Fg6ORxE2gKMWPbb1HGd6fOylZns32jRt6IjPjkyQJDJmzgqmtE4WbGy0dundcUBDgE5467Rgri9yJXodkLb7AHH+RR+BBm6gvCnCkIlIlmyOCoVXNXu0ghrEb2sohiCfb9heRR/v1lOGHpzj+yYo5MHJzwHJ3a8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o73IuOANFqReNKaxuOQ+RIejmRgosbACCyK8Qf2V4sE=;
 b=io9H0Bcl+vGPHMkEg4Irm44506c7jUbRKcZKNoM21YXACZMloclx7fQK2gO0r6Hc7V9JCkMCYn8hrSgH8SpkIXVyYwmHjkZbFXAqAZFAX5eng4ESRsNbXSERS3fpSv+dN1K+gTcCBaFgqSF5R7NPqnfSj5A96LyNj5lFanomdiqWYhx/0aLYN8U/cYnNhfUOH9pRxsDDXXYrBGXxlEImY5XztanhsUWYHUVO0M0Z0u/+OmMuGq9Og4v3CPl1/NcS+nS57Up5WfhfoimseZbvpm3J+6VFCSZVx1GE4z25hZ1soinQ1fLbRGmXWEyVdwBe22op/op+KJb6mOdoPhpVsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o73IuOANFqReNKaxuOQ+RIejmRgosbACCyK8Qf2V4sE=;
 b=oVMHNkbl227mWRd74VRlXKmXFsJ7hzAh/m4R6PpRuk88TJHHAE9w3XdhyAwq+idGB3n7WTMaRLed+BM4QfG9TcS4TvwyVROpJYfnKPkMk9IzgBn0KBJ7/bhF/tedoXXCoggYpyWQfQfhK2Rzw6INLkwAZA3/h1IK32t621l9jak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4964.eurprd08.prod.outlook.com (2603:10a6:208:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 16:09:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 16:09:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: bleal@redhat.com, wainersm@redhat.com, f4bug@amsat.org, crosa@redhat.com,
 eblake@redhat.com, armbru@redhat.com, kraxel@redhat.com,
 berrange@redhat.com, vsementsov@virtuozzo.com, marcandre.lureau@redhat.com
Subject: [PATCH v3 3/3] avocado/vnc: add test_change_listen
Date: Tue, 18 Jan 2022 17:09:09 +0100
Message-Id: <20220118160909.2502374-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM7PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::16) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a023954c-19da-441e-43ec-08d9da9ce6ee
X-MS-TrafficTypeDiagnostic: AM0PR08MB4964:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4964A993868CFC02A37E806DC1589@AM0PR08MB4964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AfizWjWQuJJdfeWcCVTUp32un8zd5fGG1hXb3VeuQzgoCSR5UFGP1wqprZstQR1pMh2Rsutc7tSBqUXutm5C/+fLw91jv81GjPizcBOLTvS3KzyyQoXPuoIkWQ+q7+mkD5Hy2U6p3gCt4n8VLsV7U89n6IqR3cSyqo5B50FVrtqX8WK1edPWd2FyT4Gvib8CPp7wxDS0/S2pB8FQzpqC5/qqYh5KDVodJ0NHN4ZtZVehyd8QRJuwRA7FMRKfvEgGxMdjaMWwsVMq6llSJX6E+4e9bb61hYa2F6DXtha0UMr+MBT6aUqh0st1Yim04GV3hLrDdBFpcxy3q9iONzV6XAW0kRa2lossNocwrB3zYOLTvpDllYRwsCvLfIbGl/bPifK9D6CdNrh6WAs/6Y8tFMDxM7GSu4rlQJRO+mYRAaQxsQ1VG/S/eitzRUttU4xf8YeBVAeq8w/fn+rckpGZs2DlqfHIi4W5Rcj2aGbGVgX9LesBQw6wDOQ0tUB0UtNIIO3EYmGkUw2Dq4TkSN12qBJF/yRf/5k94lZaLIQTbZDNJFm72SQJHazkj3G2AB+tlMU7M3QRUAc20WQcBpgNJi/5YAWOrr0SGnK1Mt6UIJbJlHtKd9La5lywtlY91INtaFh3/A3CImhGQHX60pzjx7pRquQI1dCpc8DDYKRAmBBxL3+c7cfcAtCgxmwq3XjUtX2aDLO7hk66oFt0Wy5Z/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(6506007)(4744005)(52116002)(38350700002)(5660300002)(86362001)(36756003)(508600001)(316002)(38100700002)(2906002)(26005)(1076003)(6512007)(83380400001)(2616005)(8936002)(186003)(66946007)(66476007)(6486002)(66556008)(4326008)(7416002)(6666004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P9sfLxefeTJ3b2v3ABblibma++JKiEn9UG29sSk2Npuj9r5EJHvkqzPpuhkE?=
 =?us-ascii?Q?OwpjBwsmpluv5R3O0I/MVjQacp1sUZU1l1XQkBKfXn7n2x7yNPf4a+ICHeDJ?=
 =?us-ascii?Q?xIahrL7ulPvxikFH0HwfQ/xZu6UyoT4Kl6TdVM+/r9On6zbsp9EtQphM4PlA?=
 =?us-ascii?Q?FJDrp2/SIcNlEVmc4mQ2WUk+q0VRvmffNfGM3ZhwKYKeSlgW0CGwrdDV8G1l?=
 =?us-ascii?Q?ovevAyqJj+XC7zbdVZiG612a7ZrX/KNH0OTfEv24kUgKDAcDHKRNsnEUuZcf?=
 =?us-ascii?Q?uxnG1NFBOG2rGbZWQ1Cdta3hiwJlRuFga8Ukvgmowc5rjHHezmj1R1dPURAh?=
 =?us-ascii?Q?IAthuY9b7VjNwfgyoouv011YmRAb4rFk4x+HdeKQfPMq+hQnYvz2OgS85M82?=
 =?us-ascii?Q?W0bvK1ZglqbmHNulMjQKHZsYBTEROiquh8P665hsbrul5S4uD/pcD6h8xf5o?=
 =?us-ascii?Q?KfR8JHlA/RQuY1k8CqTUC8GnLwfVyUxs4uTydxBhEaRHqpUC/CGHMc/6HtQH?=
 =?us-ascii?Q?eYCwugGdieucDbkFUjnYIOl4/3+AZcOvzMDmsKJnk7M/7zCw7rg8q5Iupust?=
 =?us-ascii?Q?OdqJvSJikYaVyqI+vxqkHbT4bGg4n4VhJg23septesXdsHR7oVqqPhNt7e9o?=
 =?us-ascii?Q?/dKBgbu35c91qbrYsluM3UYBG7y/2NXpviu8glfqTDzz0ptTOU4Rxu9WmD1A?=
 =?us-ascii?Q?Uux1R6IgelwMyEYbi3NDbWxavX3Zru+mdCgJJrWNiXEKy1pYBrW6qcFgwE0W?=
 =?us-ascii?Q?pJdA7v5qYUYi5TF85OdOjz6eCuAhuR119ll9eAl1p17wN4wiOrETHBE+H3Yd?=
 =?us-ascii?Q?OWyv5pFDojchD8HGE21HijrANKDAcRUqYbpxqHPRmjjqWhp9K3xUpOXwZi6q?=
 =?us-ascii?Q?jQA3uaVCtSY4eGrn9dVXUMAtzjLawfid1o9lLtuldt53Dihpt4n4SFkrD4wq?=
 =?us-ascii?Q?ZkxkqoKuzsvq7hAdJuEH/k41Eb4z3zdTdYmpyg8ty130jW7GeN/AdoZV8okC?=
 =?us-ascii?Q?TXpyN8lMS5OKbNuJ6egw9U3f9ncxRuR1KA7BXNAnspGUBnUk0PWwy7vj64th?=
 =?us-ascii?Q?HoW2r1hxB7CjEQzCRlH2pWj2vG5RZ6bR/MkyDxEtQZzirOT304DLog0GU+jv?=
 =?us-ascii?Q?sbAwm2LkA3S2uwgjNLVbbBrXZxM3y2omQ2/IaW3D6dLTok6j/SfiG+kdl86x?=
 =?us-ascii?Q?R8YZwHY9f3cT8Xg8nVnZomg+4M+p3bCoUSkocPXjpbt03lB/4YD6BOdcXlGx?=
 =?us-ascii?Q?pGrMw0Ki9C7j9FZRdBdAE0l5B9K9eNQ456Aja3UX0korKH5o9hXr49xGGLwc?=
 =?us-ascii?Q?Rhyrh03nw5EJV77bKV5vlCDjPOq4u9mlkG96Yfxi5o5jniEJayagRckuUpAQ?=
 =?us-ascii?Q?ohQ7pkf/PLrztzf71qUnPKga/aUIiJbdclyjuyRptC45xjCYD3DLlrkYTXLh?=
 =?us-ascii?Q?xsUqURRT56jIQotZgjE3Gt9mmLJwfZw0lFesejDWVniDHYI+5sKgRkScQv6K?=
 =?us-ascii?Q?RBmPj4xKa6cngMZPhxOdA6peWNrQ606lZ+DRNsVc2wwfU0OAbDNHh23V7hnO?=
 =?us-ascii?Q?eS075tYdwVRW5aVOTmfYMtJXb63ZqvIjKm37rsJ6nMRsWuBonk1i3s8fiOuA?=
 =?us-ascii?Q?HUzKdy+/cT7hcIb53YSICHJWsKx6b5KttY84gWj7iCimwSRXOBostW3O3JHU?=
 =?us-ascii?Q?dUuoL0Eq232DFwyDQqTP8ixmOFU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a023954c-19da-441e-43ec-08d9da9ce6ee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 16:09:28.2980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls8aQ5my3DTepl+nK4G0gau+p6sPhrrjwI7G1TndvnYwdy4G1TqEZsXmKgPYay4rLktwAz2l1oHht6O9YuOAaQADH7AfhPwCgwEpcfpuAbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4964
Received-SPF: pass client-ip=40.107.21.134;
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

Add simple test-case for new addresses argument of display-reload qmp
command.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/avocado/vnc.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
index 096432988f..936285a50b 100644
--- a/tests/avocado/vnc.py
+++ b/tests/avocado/vnc.py
@@ -51,3 +51,13 @@ def test_change_password(self):
         set_password_response = self.vm.qmp('change-vnc-password',
                                             password='new_password')
         self.assertEqual(set_password_response['return'], {})
+
+    def test_change_listen(self):
+        self.vm.add_args('-nodefaults', '-S', '-vnc', ':0')
+        self.vm.launch()
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5900')
+        res = self.vm.qmp('display-reload', type='vnc',
+                          addresses=[{'type': 'inet', 'host': '0.0.0.0',
+                                      'port': '5901'}])
+        self.assertEqual(res['return'], {})
+        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5901')
-- 
2.31.1


