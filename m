Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC7D398ADB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:37:36 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loR3v-0007Ty-EM
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQg7-0002im-9z; Wed, 02 Jun 2021 09:12:59 -0400
Received: from mail-eopbgr130108.outbound.protection.outlook.com
 ([40.107.13.108]:50294 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfv-0003nQ-W4; Wed, 02 Jun 2021 09:12:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0n3EMxiei5eCBSSl7N51arNqtOr2oYGZoszCGx3eIwpMU+JC4yklfh6BiJ5zEJIvvQrjrXdjq0jQN7BFU+64A47M/FPnMo5GX8w2osj5tJWmuYRuVoi7pEpkxgZlMYH0oTRPuiP2CiK9EDeaYA1y4N+i78mz52YYmXXj0jSAbzFHlAIB+6j4kYhAJwrT0ZHnw9C/elXPxxhBzVvyXAT73ykAevyTTmoPhYCHQyg9bGyf7uCUHcRc+fCzxUKTQvHK5iQQuX5OTgqrPUZ55lGtTo4N5TPNJCKnZApCq0jJnXmDLMXUvr6idAprUsg6xpCwv4uQnW/wSegVXXHIIxZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCPQk2Vj1oy/h55SJ19zMBsNknD+DXREd/PLofRnW6o=;
 b=k9xzshG8XEWmxus/TxvKmA69AjjN0XTu5npybWpSHf0c5ywyg5yeDKpDYeI1uCAhIqMZ71beK4mhO+mqaHKcvd9MibKPl6ao1uwpDH1P8FIYBeF04lSEzUW1GAGNuzeuR7JiR6o5CsdoVErNQMgKAhtdGRrzbY7PJ8y4Dh900ZKJMEg3jS8lIl+ReQD6qLM42MXTc+dm5TE2geyEJiykZUyKVRQTiQPnRR2N8c9Lf99yUrE2jXImWzu+7sWU/d4JJEtpFb8Qc6O1TVQHdu0xxfMv6NH0Z2OjsoaJDLFW1OguVJkkfVUDAl09C93IVw4bggnzvE3ROslif9PCWx+k6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCPQk2Vj1oy/h55SJ19zMBsNknD+DXREd/PLofRnW6o=;
 b=A36GUe50TBQKHHaLzUhFy4nD9AXLicqNdoMt7uo/rC9DMTFE2cDGjG35pYxoZbLP/RSH/EHZmn+XV5bwRxN+kERPhc985pn8nYrCsAzvZICKzU1eSJ2mPzEY1fjdnpdi+T8Gb5JQgijiyJYwkf7fv4HwWjKEKRILxWFhclnLl/A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4536.eurprd08.prod.outlook.com (2603:10a6:20b:bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 13:12:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:12:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 31/35] iotests.py: hmp_qemu_io: support qdev
Date: Wed,  2 Jun 2021 16:11:04 +0300
Message-Id: <20210602131108.74979-32-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:12:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af6579f-754c-4881-ac43-08d925c80725
X-MS-TrafficTypeDiagnostic: AM6PR08MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45365164D92F7B2DA5328FBCC13D9@AM6PR08MB4536.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RE2/ofWSg0ZsBlS3bSbHpKGpferKeBoR6jbZsg0Q3GJGLcSzgzhO/aYVQ6LUr0LmIGcQyeBUJRbtNfOsbmU1E+12CBll2yOUQ669kEI882Gf3i2V9x7tlRxHPv0hzgXg8EH+BALPwP3IB0RNuJ1tOsjyXSx1F8LDKi+i2I1dTk/Dqk57knZxFYqEBi8Hp0N/hkSWHH8EXMoOj/OkZ6IJ1rPDIAy1RtqkFI5rNmFpdNxCKXF9o2VASYamx7ds146W0f/5jPxX3cRi7SgUft8KrYMTFo5/4EHML/FC3OccebwFed6YyGkAN5x07/b4W9gZUVIQzlwJ+r0BZavkdZ6lshOVotafiVRleFACfHtOvsf0gnKVZgyYbGW4B4ECUEpAvw7+1q2zUEl4+TZVJFpG0phdA4XFUJmQR6nUCTxshdmsy9cob3PK3402nGE1SChnNdV3zorTKg7m4VTLnt/NiZJq9Wt7kgfQQ+GGNRpezZiqQ3fK+OO6MAdriFRdeSG/+qcrD9NIHh/NEcz1tXDhR1VBtMyrdfR2EI/ZUrQAxa5y6pGGB+GpKi7Kkkk4LaH8onURk+9Bm5dcuuy6bz+ze5Vckf6hQgE4llebYmuK0Rkvjb5aQyqI1qurJvpi3al7mfOYbxzDk6futAB4i4CsNwF/FXXdRZLpu2WEaFi8ZP4kRegTdwAyXRWDg+sVVcKC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39840400004)(2906002)(36756003)(316002)(83380400001)(5660300002)(66556008)(1076003)(66476007)(4744005)(6512007)(66946007)(52116002)(7416002)(956004)(8676002)(186003)(6916009)(6486002)(16526019)(6506007)(8936002)(38100700002)(38350700002)(6666004)(2616005)(86362001)(478600001)(4326008)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cbOnTzES6ih4UGjWibZfNr2VyWFWLcmsC18a+7Stu1LVexUu6BcNVRn2uJEu?=
 =?us-ascii?Q?kRqpqT0kSxqfMGxG4tLh2XstXWW7wwA/rigafsKGLzJWnYDjknSj0224MmxU?=
 =?us-ascii?Q?C6P0AnWid0IeNfdiRfgFni5ujkRhRyVFkYtoDVKjWjDfFTx/LBmHMqvBo0w+?=
 =?us-ascii?Q?cU3tIZqBhoY69KLpSajbTga8e/qzBKGtKfD8swAUSm37J5d3/0aMQpdh0yyE?=
 =?us-ascii?Q?nJiEB3h7nrEQu9+wWssl2bczxUpbWMyuy38SWSOJGQcqcxYbcmA20Hs9vBHd?=
 =?us-ascii?Q?ovc1peJFAZIgv7aLGL2EteYBGgERrIzhrbMXu5nrCjAfpV1AoNr5/V5e4j//?=
 =?us-ascii?Q?18db0yHqMPeojNfmTOjFRgyV06BEWj1cX2M7IivUHIoRF+lht+yTiR0hMvng?=
 =?us-ascii?Q?t3jDl7ZhNI2oJLDt3rGWPsLEsVqjLolSa8vfZ/62eTKsa/Squl2tGFH/71cV?=
 =?us-ascii?Q?I/HOEdyZ5wBXuiTazGs2mly7xYMmh6HPCY4EuDsFu8aBGGEAYwIBuPgDH6Mn?=
 =?us-ascii?Q?UzW1blLcWR4g4XUe0AenPlOk99llybn3Q4mFIK0EovQPWK9jp/ZAdAIP9UeZ?=
 =?us-ascii?Q?kdYr4ZjFYSPTaNp7n8WXVUuCaTPqxBBfGr8HirenI53G3IS3x19oc7y45Ufa?=
 =?us-ascii?Q?kPCbkZmovscvFF2+Bcf0W3N4O/c+ToV9TFwR3uwzDqlfBh8j8tyZds44xyBG?=
 =?us-ascii?Q?MgP6P/hKqGWj96cTdwNLYUX971v/p4wiVRIzJ9tGGVgdFG9ncFyUEZaBgbq7?=
 =?us-ascii?Q?ZJ0YnCwHifdGTzxEqnbfjNgP6tZwua3ugiYrT2kFWKBX6gm1kyW9FVK+WeAu?=
 =?us-ascii?Q?E8KHhGzKvOIefRjbM3sRbF7h2UD6nNBlH+1phULISVemnoJJvXN7LenSlOG7?=
 =?us-ascii?Q?/vnkuv/YDKNIo+qdSzcKv3zqvJ9w7z91wFQH75Z5rRUhrvvAysV6/5DF0SUR?=
 =?us-ascii?Q?/XxDn1glj1hvq6O6lfGpUoeHaRnu8g6Viu9lVJ+QHmGvhBIwWQ9/0WtDOecI?=
 =?us-ascii?Q?sPcC18h8QkLdmvi7kE0daIXYdLkmGmBr1HcQhUjEwXrp6A+rMbmVCJs2DV3j?=
 =?us-ascii?Q?PEewy1ttC6pavIQ3GzmxeoYQEz2lWUzdb3m84D1NgLFYG977/TWjn/SWdqJ2?=
 =?us-ascii?Q?sh/Q0Qju7WeK22ve+jcikI4CFYOeBUaKaqTrQJ7Oj6Zts4QsZQLapMKiwITy?=
 =?us-ascii?Q?/7FEC72E6pd66Y9xpvSUC8GZIz4EkCxlOTO6MNbo1x1NzkoCgAEaZhtz5jWz?=
 =?us-ascii?Q?99Huu7Hl9LHP+YNkXYLXKZ4EEMEPt9h67ZxH4d6Qbu+D8T7y7dRCAGbfOyyG?=
 =?us-ascii?Q?MDMl2qoYK7fDfxs48BQ0kHlY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af6579f-754c-4881-ac43-08d925c80725
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:12:09.4765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpM1/IH97U2TddEQ0dxFFNCejL4cytWYqwK9U1QSbUg6fa/9AUyDOuR3m2bySkCG5RfAhVyAqdozIqWno+nEyfH6d6wPcnRfBIIxUBZ/yGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4536
Received-SPF: pass client-ip=40.107.13.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/iotests.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index c7ec16c082..9fa0162b07 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -655,9 +655,10 @@ def resume_drive(self, drive: str) -> None:
         self.hmp(f'qemu-io {drive} "remove_break bp_{drive}"')
 
     def hmp_qemu_io(self, drive: str, cmd: str,
-                    use_log: bool = False) -> QMPMessage:
+                    use_log: bool = False, qdev: bool = False) -> QMPMessage:
         """Write to a given drive using an HMP command"""
-        return self.hmp(f'qemu-io {drive} "{cmd}"', use_log=use_log)
+        d = '-d ' if qdev else ''
+        return self.hmp(f'qemu-io {d}{drive} "{cmd}"', use_log=use_log)
 
     def flatten_qmp_object(self, obj, output=None, basestr=''):
         if output is None:
-- 
2.29.2


