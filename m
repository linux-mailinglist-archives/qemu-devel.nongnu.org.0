Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBAF40ABE3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:42:20 +0200 (CEST)
Received: from localhost ([::1]:58808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5tL-0006IL-NB
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e4-000574-Q9; Tue, 14 Sep 2021 06:26:32 -0400
Received: from mail-vi1eur05on2115.outbound.protection.outlook.com
 ([40.107.21.115]:28801 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e1-0003UG-VB; Tue, 14 Sep 2021 06:26:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrvJB+J0t1aMKw3QTA5Qvb5qAvKqChJuqdN/yBTS3tzaVB4aXkjAzeegfQSB5GRrcQav5n26fFIXTcOL9FCEx3EotmbEWX1pQTkdrDpKSm3YAvNcpqGgcRSwqq9hl9+7E0S+T3jI38EQrncaEowuaYMk38SSdUbxpVVv8B9lRn0gkOEN9MwcRMS8kJgoInB6ZC8E8VHM5E/oF5+xAcWvZf4PrG/5+icEPeAtkv40cdHZ7zyX2yfJzsEqndW65gTVGAQa0JtNOqWQxKjs3timbLTORTdoFfLZZLUPcTmPFu1jxAelhPF2uc4dSBdjGIh6PXwQfnEzPuNC0I4pH5AReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=nSWfudO6mET02yX2UIAz9lnRXZeC3XZnEQ8avr5fR74=;
 b=fje+UBztkh/WP2kocDc5zXdYjyvFsDSsWb9weidpPOe0yhcLSAv+hbRXQrLu7Y4bnTjxstUND8jrm3ISFdPEasptIawaZgv9uIfAX79RLNaQpPYjqpFOIoAP7PY1jvDEmvpv45aFOrT+qMc8ZXIP73Pd5BQa9EyMIUPEoEjKbr/Yjh6XhiWZ/4pxW/s45HsvRhmS5ZhodlwdHi8M+6uDpH8/UpJES55ufRy5Hjh+VeMiMSEGIveHdEZUQhdF7LFzkRKOzIvl3kRGd1f6dsg8zd5v9Ohc/tNOSQqafNe8XrtvXhY44dAgAqEKXgdgWAKVKsRmFEqJLlTVMl5BNN9qCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSWfudO6mET02yX2UIAz9lnRXZeC3XZnEQ8avr5fR74=;
 b=kUa5Zebdi4XzY8zzWktzEOa3ztyvpTOeZjPntfJVAroBeRIsHvXb+0qN3GGV4xYiHA2f/mFnlxenKAwTefBIoIt2UnDzFiULsMubDBXfwd9HFfm8/bI6pbK9qFcOhpAv2bEnqTKL8HCqwGQG7GgDORIRdaKfIxpnGICWpi3pBs8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6071.eurprd08.prod.outlook.com (2603:10a6:20b:29f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v3 11/17] iotests/common.rc: introduce _qcow2_dump_header
 helper
Date: Tue, 14 Sep 2021 13:25:41 +0300
Message-Id: <20210914102547.83963-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06bfa127-9d82-46d1-e1cf-08d9776a16d7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6071994939AF5A0016234B63C1DA9@AS8PR08MB6071.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nXZzd7ovMBgVj/YtJHL1hW6R1n9dRp5ZhoQTu/+xuSyt/omb0OTC9VJByiTb//23p31ulFVvU7lhzijUUNkkFi7G/ewdd9jiBRsJumKTohqf6O3U7AmZ+PyyXtKfVrpYO486Ioegh8xFJlDUFulN2C/eu90yZ+6b6zchgb/oQNidtjMqQp/RbN7rnuEzBmu9uH0rxuvb0N3F5toxiOYAcShagE6CIwge3Hg/hNnxrlU6r1S4Y2KFUuy1ADZ7NbbD/PzVuTnz7j99vZYEwD//rE6QAs1a5+O0QWFMoDcAoqv0ShmU714HMfS8aDE3UpPfZeAV+Hn6PDsWDhD7NFW/hJOejx3ASH0WlIBq3ouTEbQWYRi2eBMQ+bMEZWwYuJ20VnZ0D5BFuAs36S7NuxgK8FIc6He2/c/0+6xDG1r0rbtTY7XWjJyhX8WoLu0Jal0TeBVeVQUAHt1GWYCc3u7wF6OPZhs+gSNthHTgy/ZfiTccKIR2zcvy7L8yNfUBopdDeBGJTZuR1OTs28rNtRNMfP1w0fCyNi0wFiWZRp2u5ehd3ZYHHnxyhDhoy14frYwFCobWFq8vKrjc/TL41BtZuSehWxY84RaDiXvly7bOVLZLQHVi2HTxvW0n4J74WPghOBuW/r2mtg7ydf3IIAOIjLIEBEJM/SRYBjbCyMzoKCInL7IeYV06nlL1sbq5zzqa3cQFrFiAVaMYdmMxj4qY2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39840400004)(366004)(136003)(396003)(6486002)(26005)(86362001)(4744005)(2906002)(6666004)(38350700002)(66476007)(38100700002)(66946007)(478600001)(8676002)(36756003)(956004)(66556008)(1076003)(186003)(6506007)(6512007)(6916009)(5660300002)(2616005)(8936002)(4326008)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Alp6wb49+kGC5Kkh73H7czl0Iusq24BQ35jfSkhsUEah+hF73P3tYopQmeeM?=
 =?us-ascii?Q?Wd8dh0+5QFXg+hI9+tCP9xrISlLh3JlY+LHYqAL5xvryVs4ekzvNc2ZiEAqj?=
 =?us-ascii?Q?kIUqWXzgdak+YwWeEJUh9HiIpgM520Uay4MNs9GDKdaKDiXqih+zw0vWGXMF?=
 =?us-ascii?Q?utqWw4ru3+7PuYmQGOX1fUPEu+LL4oH7dFNBy7PfBh8ipO5kICe7QpVzZL2S?=
 =?us-ascii?Q?rleN74NJ8QtiGjO6qnB4N67kLS6xa1JFmCViAfyqmlLBmeY/99HPElnxKppC?=
 =?us-ascii?Q?5jldGy3lU26Um2oUwSZyNOrgrQB10tZP2iHlPzy7wa4PVzH4jPsS8ctjLKXE?=
 =?us-ascii?Q?xp/Sxv4P9UJzXhQTAgr5NSgOtuuYLRypCI0Y+jkAShJs+2LQ6yn5dMtZD3Tt?=
 =?us-ascii?Q?2NeXrgi9naEAxomAIwO5dSIni8Bh82ANIuczRY9I+xVe335C1c5Ouf1ukcln?=
 =?us-ascii?Q?1zO2RNkD1LCH6LbpCfe64h/hngZnMvvlOo9Bp5+ABAWedYuVyu8xh+w6IUe0?=
 =?us-ascii?Q?oVIC4TK8MMthF4RPe6UbMJbGoJCgqRGOFv9rYSPbPt+pCm4smeCh/TCP5K5A?=
 =?us-ascii?Q?hv8D9UOOulArHfKSnUGnMVihg3nQdI1/N9+OI6UGplh0QacTEKLjcBt7rnXi?=
 =?us-ascii?Q?Asd1jCTfMnnmdAGd5le+nnnVbhu5Sc4Q0PvuGeKpypBGnIzpbmQ6IVJewl0y?=
 =?us-ascii?Q?njLJeaPYiNAADQteIE+x1mmEAWxy7gzXQNVphUrzTj7xJwC6qW/IMjzsf3Gm?=
 =?us-ascii?Q?gORaTLu9KvKCMoVuhwsaZfYLDQNImUL0KxA52g124QC9Q9aekcaSu3oRnSE0?=
 =?us-ascii?Q?nuWGkqGxGVrdPkCh09mdnN9NCW5nlGd9n8ND6Zp7fYb0YGI3KsDZuOiY3blR?=
 =?us-ascii?Q?ymr08mW242ntxDAgyfd5qpjIyDy4+DVhYKeR2E2MdfMejDHR9Rz6Uv9rcLLR?=
 =?us-ascii?Q?P5JddlaRlj0xw21p4Mk+YlvwqEO46DjQGiRxYBCtIeHoPk2dG/+/mbkdeWnH?=
 =?us-ascii?Q?IEZoKEuNa8QesBLD9QcoZIIl0scf3bgaL7f829ECDl3ybKoqeRdIx/nzH8j4?=
 =?us-ascii?Q?9qIIM/Bk9FCFFfy9HWx9dZtCxp9kaUa2dfpVyj8EtKRWsQ8Dd6LYjEPHnoby?=
 =?us-ascii?Q?G8baTgecCMVsTER0HSL5is8y7PTJyV1kJ7nTtKnN/d5Zd+GgJrdyuBKg7Bew?=
 =?us-ascii?Q?/TG1HkZ8iV3F7p+Q1qDtOj6JGU+Glsg5B1IaZu0jh84EdtEPfhJSOEbaUWcJ?=
 =?us-ascii?Q?IXPcpFtL/sy1Zejc/qlg6CmIpxq8dJIL0KQ/5XmgXllUvnoevqYfnm+N9M+C?=
 =?us-ascii?Q?dwGC4SZmTNJWE+snjy+IFuLV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bfa127-9d82-46d1-e1cf-08d9776a16d7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:18.4744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bThESDIY7voS0kjt2KBze7F+0k0rx9/fBctMqbAhpGUMuI8Zf4298FzAnAe9pxkWUJ3nirooo1TEIDOTpePd02JdBFBIboVbZgGseH16924=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6071
Received-SPF: pass client-ip=40.107.21.115;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll use it in tests instead of explicit qcow2.py. Then we are going
to add some filtering in _qcow2_dump_header.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.rc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index d8582454de..5dea310ea0 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -996,5 +996,15 @@ _require_one_device_of()
     _notrun "$* not available"
 }
 
+_qcow2_dump_header()
+{
+    img="$1"
+    if [ -z "$img" ]; then
+        img="$TEST_IMG"
+    fi
+
+    $PYTHON qcow2.py "$img" dump-header
+}
+
 # make sure this script returns success
 true
-- 
2.29.2


