Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A46847D739
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:55:03 +0100 (CET)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06lR-0002be-PY
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:55:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jh-00088l-0M; Wed, 22 Dec 2021 13:53:13 -0500
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:20601 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n06jf-0004am-Dh; Wed, 22 Dec 2021 13:53:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIknrcEJ+wZsujZHA8QhCvFpOyjwJ1L0d7n0Am0u6xKhw37QiFdNoZyA+6Xlz23nkko+cAIMAAX8trdM656DYcBVEvffb5bk5UtbG97ttn893V4n4LzHLi/pI6iP24bzOKld4N87bbhx0WtRoduojtEHl1TKHY6r4AcWhJoXwAgOJHTxZOFYGjKuo3nlIgNECnRLabN+eCngAOJ/Xg+l82LpdcJMjz7HmwHLQ270jbYEHdnRrjyN2ewBcFyKvSQ+1whorsNBOSgxst9mMPPyb+H9SPxj+noTdcAZ3U+DPJ36LRJYS7rpHfqQPij3MK1HoF2OVB0s9HKNOqmUiCGwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/XQBzvuOj+2z0KHJakJs/0955lq43qqA+KruNrLMnk=;
 b=bTKK0/TtgIPTCqaQovcMRQwZZYR4t9DA0JboRrxjpeQlYGJkvp99WTVv8rmyHQME3k7zSlbe9smoL1UwUBQ8PjyM+M+Xb6BMxxUfszi1d2aSjoBUuqykOSsRKImLoyG9wzq9KTM/JMrpzA8WpZwMy2WLZqW/t1DtipKcSx2OXzd6siyW6TklIHjfOB90/O/jBHembwtPqFvWFm4dT7UPnAfAzn+A9pyTL6I0hkMCKDkAiG5EP/OiTtbHwTkY4eMTbUziZ/9UFhtvNpHrYKRyvWHksKHyop9m2/JeyafCj4QjxnvTShspZ+7G52k4FdfhmVfBPjs82omhOBzJOJOVJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/XQBzvuOj+2z0KHJakJs/0955lq43qqA+KruNrLMnk=;
 b=VjwaUFC1cNwFGTxmDvGSIHDngYJOwOWdExE/ETK0iG0UbcENC15hhbjm1LVrMLiwgwcQR/dmAfenDAWWYtZzBBDibh/zCCz1COOuI4tA/KZ/wDDmyfiJc8F2F8JKrE4MEPY+FSviZq8qfV4GJnJh1INbW7ZOZ4mR9vdsns+l28c=
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
 vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org
Subject: [PULL 3/7] nbd/client-connection: improve error message of cancelled
 attempt
Date: Wed, 22 Dec 2021 19:52:44 +0100
Message-Id: <20211222185248.466010-4-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: e7b17355-6cf0-4b20-4f8b-08d9c57c47ce
X-MS-TrafficTypeDiagnostic: AM8PR08MB5857:EE_
X-Microsoft-Antispam-PRVS: <AM8PR08MB58575CBE7E6112296B5E9855C17D9@AM8PR08MB5857.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wNJVEaNG+MIOhDcBNiaiSucLsYTzQew2YeRwGnR/vxUDrSLw6hxMqsASKjYD5UQBjgF91/sOdHpxfyd2hAkQHnqFQlSNPSA5l0u8bI1jW22a6IDqU1MEofFUJecCPJiKk3lZqx8ouVCpJSz1888G8AyVrkN+g/D7Ln3l2ZYv8ACm0iFXxQ8g5mdxIUZlVwbq8sYguqpE3bmGXItyrmkgPwHykQP71oD+atjaGbAUj3QGOqe/0t+ARzc88xqB2/d0KhOpMoWprMufEuiwxb7drNN04pLWyMQkfbILIU6YY2PS1xTipAVvcNb6OPwXyWRmmDseM6VyfnKyJI66BL7E14gmh0o1HgSXG/0q7B0bUfOjAZUz4GvQl7sZ1CEEzzYirxkNPOToSX3bxoKlrpCXI4a0HYdXFmAEDq9uSa6ikNnjSu2SH2YD/h820wL0X9dGVnYHO/n81hQiYVxnxsc80eJxTxpZuJO7XBNqOo45X8Y55xS9t+qs/zN2bxoOSdT3n2MT8uZPwVmodpynALJkzTudtdrx7dCfBvC1zy8lH4Pw/Fuly79Tjqj+uPhqv/dwS2KLyh1Vx7rHa+Pcv3CE62IoJ+APPc/FqjL32qJTKghrUvsY8i/LpAkwE/7zr4Xj0P+FqzwsWr9wD/i9WquI+o0wlK1FgJudjC4+X34Qqs7MhlrxQ2iDAa4XkfacATotDJDIxv576dFQ5J2WjgpP+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(6512007)(4326008)(6486002)(38350700002)(38100700002)(6506007)(83380400001)(66556008)(66476007)(36756003)(26005)(66946007)(5660300002)(8676002)(8936002)(186003)(6666004)(6916009)(2906002)(52116002)(86362001)(508600001)(316002)(15650500001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s48zIjmtZi8vXmx5END0QR+TRnXiz1zOnhMwn0gt0xlB6n/B4h1fVaimbK5a?=
 =?us-ascii?Q?LaTXKPY1kY31ahfT7MfDDc1Er1OxLi1JlQTwLMlfSFMTeDDVz4BV0Ux3QKUF?=
 =?us-ascii?Q?eZF6HecXleb2Fy24XEdAdGAu9EXu3TV+sSJohQLl+7h550Wf8+EkLrzQDN0j?=
 =?us-ascii?Q?C1Oh35IlDX2oEw3J92dV7Gf7DR4WJvFb5COAMT69KIyspf3H2oAikdB6RtRy?=
 =?us-ascii?Q?oUHfcOprxg0Nd4Jj0Mtfd+QXZMPzOM1t2tjlhmTGneroqvdLnd40gQDf8x/z?=
 =?us-ascii?Q?Ap1jfVdBOaSPlq9jAjuzECj25aBIo3+jTDl8ZZCqUJO1/LiO6kU3dyN/TZOK?=
 =?us-ascii?Q?DQIeo3HLKlsrFSBzBSgHGQB1G10xZMxmZnfZEwJujrScU+GTrls9wSx3TvIz?=
 =?us-ascii?Q?aoH2mCQcVg0CnMJFqSPnBDo7ZYrURMp94eiMuVs/7TcaUS59LhiqgkJQ390A?=
 =?us-ascii?Q?/mcyOTgw351xfjYzx++hDqH4K/qgv2jhDatWd/X+v7JgzlcwJ2qr9QCtWc2U?=
 =?us-ascii?Q?Mn/duPLONqacVFRqxsd6movr9/IY3RfLioxW2o4d5yQoE3IyGYV0/yHGdGQF?=
 =?us-ascii?Q?CO9aEjDAFdfWziApeI1n+er6y0P07pSyqvxmqySpAMcZ+55RWazxylVVPiQg?=
 =?us-ascii?Q?i8rLIt1O3qu5UgRtgOs9jMK7e5RBUEj3EKLj7xQS9W9YXFeJtbyug1aDyxP9?=
 =?us-ascii?Q?NV2+YBwNxFC8pwGjlRqi2+b6hHxkMVdOxEQAr0VM5wvkZ8XmHqUVs28LpMbE?=
 =?us-ascii?Q?5rn7hY6XCo95+rnhWc2PKNpuvx8oUmTBfR/gspVfbjEODbfzp/xDzr5D81Hu?=
 =?us-ascii?Q?qP5x09bwljhaXstjiIxmfOdS0HsZm+507qTfdU3sP5azo9a8YswCTiWbvqMC?=
 =?us-ascii?Q?/LC2CesS7MROtFc1Hv6GCvZkyl/QQtB0bfRX9zXzosVoLNTLqHPvXiHN2hlc?=
 =?us-ascii?Q?Kl6YOIkA6yxsSKzEEE9QF+7baaolMeeaUt0+YLtN3euzYClJbQiZizNTMuoV?=
 =?us-ascii?Q?f/YKKXkPvR2AZxkkTjvnFoKyuxRq78QfqWpaOXts8VBuhTzUsSYcIlBL9trW?=
 =?us-ascii?Q?6wzEcYy3oWLiIaPVltKkRx05CH+MRiheL3+PdB2dVIyMH/WpJlF0QBFQMvhW?=
 =?us-ascii?Q?t3lBBooVW1bSQiOkpcVJERSXi5sLAHux6FNhnKBYi95cMCQfx1wlLl3sTPJz?=
 =?us-ascii?Q?YTZdKz7gq1TfzsPIzSUYAp3I/mBf2EQXXeJ3KXI3jAa+9FO8zGv+xt09b0C0?=
 =?us-ascii?Q?XKajLg0VCfm0eYh6Hle2w41H+amRFnSpbaTKUfO/rMfxw4mi01znVYlbL3W8?=
 =?us-ascii?Q?DmuxmQvtA70Lug6zfZ4IYYWkm16BSNaF2oBKEGO8A1hmgMllNbCChRBzM8MA?=
 =?us-ascii?Q?dMIBRp3Kmau0drWNEJg1razrEXaiwsWMUjyZesLPZFOinjbQTwwBmq2EJ69N?=
 =?us-ascii?Q?jE3exNvh0n2E+OiN0v0mmcwe/t41hIS6bI1hd6fe2TBGzvuOgk6kZbK7yUd4?=
 =?us-ascii?Q?jgiVYI1MlyV2sIPl0WoBjLKQYl828zHiyFdNB15DzcukYhQBjJ89I+CmtQH0?=
 =?us-ascii?Q?kiBi1elaEl43+hvVkeseEM2durglf3o//BABKAKyHINyuaMiiUvQfLlkHxf1?=
 =?us-ascii?Q?XnNnDLxTYcUIFnHQOOLceKZkByOXkCX5Ecp0dLyTXQOKXSE8XHp4Xj86JyOt?=
 =?us-ascii?Q?WNv+4CoppSLt2m8//biIJsPVddw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b17355-6cf0-4b20-4f8b-08d9c57c47ce
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 18:53:02.2049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDEx7VcswvsNX5Nkouc79OzfZHGi7lMfZmtXEAxTglcLoj748woODCsubK0GW50Ckq/QtqzG9qUG1Ats2+wwD9VHIcg+VvhJHl7dtzweU/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857
Received-SPF: pass client-ip=40.107.21.137;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 722998c985..2bda42641d 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -351,8 +351,15 @@ nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
             if (conn->err) {
                 error_propagate(errp, error_copy(conn->err));
             } else {
-                error_setg(errp,
-                           "Connection attempt cancelled by other operation");
+                /*
+                 * The only possible case here is cancelling by open_timer
+                 * during nbd_open(). So, the error message is for that case.
+                 * If we have more use cases, we can refactor
+                 * nbd_co_establish_connection_cancel() to take an additional
+                 * parameter cancel_reason, that would be passed than to the
+                 * caller of cancelled nbd_co_establish_connection().
+                 */
+                error_setg(errp, "Connection attempt cancelled by timeout");
             }
 
             return NULL;
-- 
2.31.1


