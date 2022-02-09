Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C011E4AF422
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:32:39 +0100 (CET)
Received: from localhost ([::1]:41278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHo1O-0007rH-RT
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZH-0001J5-RQ; Wed, 09 Feb 2022 09:03:37 -0500
Received: from [2a01:111:f400:7d00::715] (port=53856
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nHnZF-0000MG-Ef; Wed, 09 Feb 2022 09:03:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqUAWXhjcRe44Ji9D7kJSDlYSrxeXq4GGtWEuio/1H3NyFwBkKtKgDN0Je4uAw5Qtd/euB1Ol2VZhAuGr/s0u/nIkpdzC2jDWlslWpKdQ1LXnVj23sciqyzF4wZLdzl/kQBnbYA65R7EBU1tp5qgLILZg9J77emGbIu2s9cNkVhyIh2hW/qhLXcoDcXc3wg1YFBY8k2sTDUpcFoKB2G53+h+ggV0ICLlY6hAsicwGv0EehOIM7Rn5oWSSygJmLBi8CW6AanN/UrBswv3IhkhaBQzILYo7Jr1FoUtJbpZqW8qyr39Eo1/uUZIMfLY2oYi8R9fpLf6S0/Qaaz4DE/9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+yzq0CQ0cXDxU3zpY3JBGHeGHSXeRDv9oKe4GeUxmk=;
 b=aaP4TDSBE6B7/QXEBxmwXi1OoXZjld5ekZG4FmV0NgGdZ542AOHJ/O0YfRkCbjGS/PkZAkpJRMn0ijQGGB8YX+TaKOXlISEyFPQ+dJQYkITidBmT1GSPmsjXBcsXfc2zDSJZ1GwiibUugxyVz1+GRGaVMs8Nsa4kpzmSi/8VxdnzYYZV9Sp5DF8N14hBDXEjNQV4l7Esm31MkEcnsQcvDrICqh4VflzskqNSKv4ZJ5ACYIhzLFXgRFMU70PKXQG4WIHBea3IhOW3kX3HKmnUyRpmsAsdPfLdCqW7M+p/4Lil9lJ52rI6dbebvMmNhCqNbr56DonnBklmGFS1XxW0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+yzq0CQ0cXDxU3zpY3JBGHeGHSXeRDv9oKe4GeUxmk=;
 b=vvQNAtoZi7F6ZFfTOKSDxNnnHwnG5P3MQ9JsNshfGt7jop4owU1jPcHFJeZyND0St3UCSyxpWki3WACR/7t+wPxCBEMOxdV6yheKpjmrhiqLmGxeK7cK+SIzjSMXDuC6dxIgWQv5MTdM4F5bKEGcHsrPaE5U5mUM1Ke/SN2Mc7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 14:03:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Wed, 9 Feb 2022
 14:03:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 2/7] block/nbd: Delete open timer when done
Date: Wed,  9 Feb 2022 15:02:53 +0100
Message-Id: <20220209140258.364649-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220209140258.364649-1-vsementsov@virtuozzo.com>
References: <20220209140258.364649-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0192.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::8) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d1f14bf-cbed-4beb-7b68-08d9ebd4e883
X-MS-TrafficTypeDiagnostic: AM8PR08MB5698:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB5698932B3BB33CB32E93854AC12E9@AM8PR08MB5698.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PFrHj230eH+2TnxmNm+PbMnoYygpqR0GNqdkvMPavb5ShZW37U4z9bvY8LZnoA3L7pRwDAr4SA2M/Z3BGqob+o2iyVQd6hq5i255MB6PxaVE7FCqdg+qY3SAhSq3Hcb4fQy1ptt5CnC34z+4dH4EBMCumXfGaHnCFAA3CCqinb8tPMWuJGbigerVl060QD03gh131dslHLzWaHjn/QS71BSA20yD4Km8xqiIATCkVy+Gh0IPY0WQBfw8luRNHKyqd8mwOC9HWX2G/kBtnC7135fNXtgOkXqLi7Z+U2Zm8uhEtWIoHOWqlk6u1ay575tobnE8J/uuoBnFLJTGydYzFPV+09Gur/z6//G5IfpfxyXvnMZNPrZ5thlo0zBXZI5dK2e2i77CPhBq4Tek6Sr795FfYbVd+8LJTVQfSU5Y7dR05DE7SNmuoRgw9ZiKFpDXECsqHsWYhnx1BYJPifNECl4Zzdh54SSoaHkQLzybCXUNrGo0R3O/GJrvE3fsODdvYXq67BwcyYb8JkzewrI0QpSJXY6h52D4dJ/o5nv8rrNY2AQyKQLBj/T5KdQfnF58imqIuk2h0DJeKQKbWFB2eIC7I53H9W/InoAYnKg9+gqaOQYEGCbWtup6EucQnMHw6uBaIQSziqi2bDHuwetmVLAUQtdSVb+GddY42wEbQg1+MA4U9B2JxK52Dntgv3O/2dE3/KtpiClHlEzxj0Wkbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(36756003)(316002)(6512007)(83380400001)(2906002)(5660300002)(6666004)(8936002)(1076003)(38350700002)(66476007)(66556008)(6506007)(8676002)(86362001)(66946007)(38100700002)(4326008)(508600001)(6486002)(26005)(186003)(6916009)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0L3s2y2lOOjhgN2D8uy1T9e0Jq9vE/aGM+aBoiAm8O/GuIIXNv3oGXrarVg4?=
 =?us-ascii?Q?ba8g7xGyVCygKn1j7XGMjFHRc7cdbaem78tJoRi1iq4tkV82RPIkvM47446R?=
 =?us-ascii?Q?17Wlwqg3Ba1U7OA5A7dA0fAQJ+FZ7Nl3zRQsHrIfQ4KFoXdlRUg3w02BJWH4?=
 =?us-ascii?Q?Chx2rqBX25Uzxz6hcIi2LuflZoqh/N4zLkIIkr7OZ8p3f5LDKG8pTBaf5PSo?=
 =?us-ascii?Q?+C6NGNw865zvo1krtv4+Iuv315Mm+sHtE9fRD/6chPkuqi2xn+g1L/b9iDQF?=
 =?us-ascii?Q?FVRIkHH43uy6EG34C7zBZwByXMshsPcKGTo5swWH8bz1FVw3/Nplr9EiwuZV?=
 =?us-ascii?Q?4EaP9AruRlhaMWimPngdC+13ZFhlpxb969c88aMJOwUmBcX2pos4yJ87TCuQ?=
 =?us-ascii?Q?cxXu3K4InLPSmmafa1PHTg6PTO9RWEzI0DYMLuSK7u5Jb2eRoxD91zFBFXxt?=
 =?us-ascii?Q?VoehzWaz5FrJG64WLXmROG6RTh3AQzDPoHjzSURcTUXvpEv76PNIcMkoSG4o?=
 =?us-ascii?Q?rU9r9YrYj9SPRzBX6OQ48PqDDxBamQakA9XVSZFo3OLmc4X2QpZuYHjU/MUo?=
 =?us-ascii?Q?yd2R1IODzYFSFwM2q1mEsBmbDty4YIy0riF0CV/ziQFUPfML3IbV+8EOTHv+?=
 =?us-ascii?Q?gcDWwo68QWFFCNEbE2sCxgJ18ll91puV0wISR/Zq0krBGnAoFSMnSAdOm2sz?=
 =?us-ascii?Q?E84j6aXJJ0WTPO0QGqrolleWlnwAIR6kTOf2UL92inR4gh098fEkNIV61xLP?=
 =?us-ascii?Q?NiGdhyxLXqOKAIHzepVI2dNMBdTdE4nb+Sz2FNNqQjuZTPycCSdlAyGOOMh0?=
 =?us-ascii?Q?Dze0crbP/MS4tRLM+fG1HTkgS2l/sS93tFPxKj/tv5mYwldY0mghdMkDfyfY?=
 =?us-ascii?Q?/BmZ990PUEZp4RUDQocrb35v1vcgbHPKnG4ndotfyEqzdunKdQm+azRTP2L9?=
 =?us-ascii?Q?JbBP1cC4bnSzwXWQOTO69dX6NYf4ytnemM39mB4IxRpK4lsHTyNRpbmquhbT?=
 =?us-ascii?Q?E5egVcVUF9rczT/Kr9hAeNdKj4S9JVRgNo5eth+X4cnAVL8RNNJ9rSo0H7WT?=
 =?us-ascii?Q?uv38PmYrKw1n8GVjGQVHCwoyxMI18D2PogWYvwPE+xEJZsZQuKo5c1mKnRx5?=
 =?us-ascii?Q?6x8JRldH7qEDTtgCm3mkEQRjF7yYf9tmZ1rumCRb2Sov8oeth987JC7mUYv/?=
 =?us-ascii?Q?h79lQUqXwIfHwgFum5zNrBZVs4YwTqASSQz9PVLwOMYkm83OkeBMt5QjBZsX?=
 =?us-ascii?Q?trXn47kxSdW/4/HMyeI0sVah0Mjm0xMqEiYc0oi5pfYgbIEV238lyhSxMSHl?=
 =?us-ascii?Q?i4tbf34FGE1rhcQI7lZBeKqn/QFwIIPJS6MNmujvZno/0x89Cf1XTJaFz+LU?=
 =?us-ascii?Q?jWpDeL12CRzg8Fl6eJd/EnZ2ruKNVd3ymqVSGvc6YKutLxWLPYLUXzVOca7c?=
 =?us-ascii?Q?WsNx7xn+7m0bwDuwma4Pmg3ggi0/a4A1MYir0fpfFvYGcHThXt0RkXprffEA?=
 =?us-ascii?Q?FlxN92D8HBS8bLf4xeMXZ8b5BeKQMxtIle+AqtVTFPvs61LkqcwItfPl0862?=
 =?us-ascii?Q?5RMJbGrrquHfJteVKLsu3I8xOrBQ4T9mtMLDN3MkHp5J/1ubtHiISj5i3nFk?=
 =?us-ascii?Q?Rh2TxIe+uecHVfP5VZiAAkNG1YvqxkrUNMGwbIqO5OEpabmzgxILZkS2Y75I?=
 =?us-ascii?Q?lFsQcQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1f14bf-cbed-4beb-7b68-08d9ebd4e883
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 14:03:11.7098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qbq73cDirp0Q5tKFW3ZBgETP4Z/jZUd2HikrrskaKW94TV78H64yB1UkjYBu5KJ4Se6t/zSrJrUelVN8mLKY0QnappZX8BtC2kZMiIdn2TQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::715
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::715;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Hanna Reitz <hreitz@redhat.com>

We start the open timer to cancel the connection attempt after a while.
Once nbd_do_establish_connection() has returned, the attempt is over,
and we no longer need the timer.

Delete it before returning from nbd_open(), so that it does not persist
for longer.  It has no use after nbd_open(), and just like the reconnect
delay timer, it might well be dangerous if it were to fire afterwards.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 16cd7fef77..5ff8a57314 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -1885,11 +1885,19 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail;
     }
 
+    /*
+     * The connect attempt is done, so we no longer need this timer.
+     * Delete it, because we do not want it to be around when this node
+     * is drained or closed.
+     */
+    open_timer_del(s);
+
     nbd_client_connection_enable_retry(s->conn);
 
     return 0;
 
 fail:
+    open_timer_del(s);
     nbd_clear_bdrvstate(bs);
     return ret;
 }
-- 
2.31.1


