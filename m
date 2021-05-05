Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6B3735E8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:58:11 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCQ6-0004W5-A4
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCJ3-0005zR-E7; Wed, 05 May 2021 03:50:53 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:41697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCJ0-0002WS-Hn; Wed, 05 May 2021 03:50:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlVgLPDMbA/LrvOwyd/B/99fFHy/DiQwftWTzgIPSY7O6d3Vs4wzKF6W/z9jcpEhBooBuhLTZgfgbyXZ3iKeOMuac9zPa61QLO/L+OHD64ayz7uyjnra4SXgDFkFpGdcxHACnzfDK19nip87HcHsFIS+y2n399e30q0Hy/+itmQzQvNUPNyGuhv0Zr2RDzsbQWuorifRTfGoBcybwCzCozj3N8Vo73E2MjZ9R9NLoGrM0i2NT7ky59d6549t/DEh55W3PsLcpoxP6sp+eEgdGHbLvvmvRPE2NAjJvWsDYsZyPnl0u7GkfYtwQ8111oYNyxlkeFWcbY1SZNSCkQOQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyTu4G1ABqa2GqOxkDz/PheUnnxvT6/B+ecXhi0G2h8=;
 b=SsKwxfW/n8Chb/3+PIF5MYyqiq2zCddB6V7Y9LYzjOh2Q/9VxKj//5DwNl/3Fsk1spuMHrus6+sWXlzpnm61W0D1Cu7NpqNwwyPlo9Zvi7YMLA8Tkpi5BsNxWcFlY5VPXwfenz/HvphNvKivTkYOMEyY/uiFSi4YxtCOU//XnnuSQiEiy1eNX7oOqRGAsOAw3QGzcS7Mw7OZareIs/iSOy6U9mSpe0OgIGUIdsiJB0L3tTLIaAaLV1aB/Sbo5OXQ0y5+UTvP5axXxAPWNEdRpAFb8fXDhF3I/nqmS4o0M0G/CQ+clcqvHSksXa/8ppEZbaVCI3WmBwSp4AYHIsCcVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyTu4G1ABqa2GqOxkDz/PheUnnxvT6/B+ecXhi0G2h8=;
 b=e56+3Qa1n+cKALTseJny78UGYp/Bx63y21QyAkk8+ytU+p6zFUhgMe+zSEm+TejahgzG8WVJ/lWnUNr+gibNiyO4UnGYBR2QRUySyD0MPM8DuaJUPJV0Sr0viKjeQj7z2OwqS4fEI2UfBs5JvNjJSi9YE+phH0fHDTgnplaXaEc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v5 08/11] block/io: allow 64bit write-zeroes requests
Date: Wed,  5 May 2021 10:49:58 +0300
Message-Id: <20210505075001.45041-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ad032f5-7ef0-4ab6-7e46-08d90f9a77ff
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68390ABAB5ED6E60831E7969C1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:154;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2LL5QXOk+etyfh9Hyxk6WMxxU4OAkTtIm+ZIYwti6/d9sft7uqo55UffwnwJ7EEmQNubhWvok3R7OMMTTiYUewB00jbJpyEaJOLZ59sZuZF9yx7G7ailocco/a0r2GcBRCw1fh2WjAd2vSY3pGQf72SaPlN26Xx0Sk4zxJkXaFwMrVHQmSUXlNDOZaHmqvbXNi4evGzH+J70OYcFVUKukCaKOTydP8nODs2yd93lUPz6jqdm2FxOaWfrqE6hL9G9o92KpIiJAFCNSMb0Fa0DfcUV1IbKEhzdxPXXgIs6gGafuwcr5DJYGpLMYxIdzA9fW68imoh3W72wXv/Bzrw9FHfzwRODuj4Z33O7UuyBRXE39m0vxAcT85Kfb/cC7J54dfRwNQlxNiQN6omG9vF9hjwBJ5MKUMhhK3lLsZ4542PHfH9c2loBJ/TbYD+7YaLBN0t6x3Mud6g+icWYrr4BdUOUOsw6wY7taWlfcsQoj6mdPGhifZatTSaJ2PUvBLs9sEWDSqPwxKxMoW7+q0ZqffMqHJgkf289JnGGlYNLVL+lMzU9En96V+Mw/5fsNGsFntDRR0839av0pOlqcea+TkP1rB4Y59h6Txu6zT/tsGcPIpFKfoXL4cTPBHV+6t99obXLNKvC1EvIUQ4WHu4NcQX1XrKp+oOO/tGMRWGwVoYGkEJEFtZ7p69aK9aYlkzX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(83380400001)(6666004)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QNxUMEYNqiTavKgeEkOVUPpFEB06itGmsE2P9RpAHnlcs83scD6rqj4jIjCh?=
 =?us-ascii?Q?H3KWH/tucxuddf/60PJEnX7qVClBU2I+VNsC8J1bK8a/hz24EBiPYlxBn3kw?=
 =?us-ascii?Q?y01tjo15WG32h5TBVPWyiw0dZTCPHufOJw51ni7SyMsZJcWMp9LztgdLLv/8?=
 =?us-ascii?Q?k9Ag28DQ3KdMblOmsVYPS3597ySQEpfU7T/9v/ByC4j8DTDRwfns5NtzQ9zz?=
 =?us-ascii?Q?0eQr+Yk8oVzP8g2hhjZF3+4irgT6l08w3duV9I2NuOXvp00S4r8HcJ5rUBma?=
 =?us-ascii?Q?SxZq35Tx/tKy8s6pwGHvZ0rdPnvhGqlp5hEZF0QTAQHeHG7eEKS7JVujCSSN?=
 =?us-ascii?Q?p8isjt0iYHtDcgl1XHW0JcorFR7IsHnuUUm6JJxgjHp3tvE5V5J+TLHLC0ge?=
 =?us-ascii?Q?lxfwgYNOQDIkXrPs9DvIC4cIvi0AuJuW2BJEhSe4lLYRM1Q3PtV4M7rWpvhh?=
 =?us-ascii?Q?3jF6dUWJVucTt3CwJn4YpKOVEned9qNWtt2Dg+KFnnp2qV0FvpinlLFasWtR?=
 =?us-ascii?Q?WDpWoSWMQmMDPq+DUfUeuHnOT3XNKBux4f7hQ72Y1MZxV//LEc19Vo60giWu?=
 =?us-ascii?Q?6oabwj8cZjR9SpKFCCKaizFOKgzgDA9YTzOWbBOxa9HlzGZbCujFrtOThumj?=
 =?us-ascii?Q?1Lb2GYL4DP1nJhKOWgtgjn2YJm+/4XM6XYij5D3nwzQ4VHiv+zy+FoYvtADg?=
 =?us-ascii?Q?69HJEH6Uf2cJIu2zAIB3HIf9acMnBbKhoTCCHbzUwBUZz3x92ydFgEunm/Bv?=
 =?us-ascii?Q?YdGC42xastFoPl9o54B1+kEi30ciSNcbLf49Aqiz7kcay+8/GnxE1hHXB20z?=
 =?us-ascii?Q?Svn2wo0kqyllzUC1eJ822wnpKNeqTPojyIkSxwLuU+dYDUvHth8Q9GVRr+Cr?=
 =?us-ascii?Q?3Y6omYZjQLUxS/vK3Ud9WLpj90q3csfADpXxE5kYrvJS+e/lxnAd6QCOIK5t?=
 =?us-ascii?Q?rFvIZcTcLLL9xGX8s63aLgMgWDo82LoSPtBP8oK9fHRAYyFwXT/o/zks67i8?=
 =?us-ascii?Q?e7wAbAWGCWA3zi03qqRc3ekJuxyXqsTL8t47IfZh6sx5EXGsXNXgGQjWMSc8?=
 =?us-ascii?Q?TjLMnWc7fG21rZRx+odRBrPVaSjb+xd4RH0+ReCknHRGqCu8kPZBjgM3DwKA?=
 =?us-ascii?Q?9m1wMdgvKyWezgltCbkRMn6+GMCt+jXs+7QxMAAx5unpmOGiqMucd9Qvy3o3?=
 =?us-ascii?Q?TJsjbkyEvSRat07kOYWwHixny/IJp4FH04tAVcD0tGYwlotgPv8FRTxsIBVW?=
 =?us-ascii?Q?rpE0pze3hmmkghSft/HBbGqGLRRRnFcbiTMVdRRbbWe37RmNrV2QdzMs/Tj4?=
 =?us-ascii?Q?jAtTXZ8OxqPbdCpHHF73D7MM?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad032f5-7ef0-4ab6-7e46-08d90f9a77ff
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:36.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLR98B8zSeH7TNEfg3DsZxpVQfcPWL7i1c+AuOqpXGXYBYk7JtF8+Tlmx7xNuBPj6A5MWAuda6CCHygPnRFypkIbTB0U9WLbBbihZSwOIb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Now, when all drivers are updated by previous commit, we can drop two
last limiters on write-zeroes path: INT_MAX in
bdrv_co_do_pwrite_zeroes() and bdrv_check_request32() in
bdrv_co_pwritev_part().

Now everything is prepared for implementing incredibly cool and fast
big-write-zeroes in NBD and qcow2. And any other driver which wants it
of course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 0648561b15..195b68b19e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1863,7 +1863,8 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int head = 0;
     int tail = 0;
 
-    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes, INT_MAX);
+    int64_t max_write_zeroes = MIN_NON_ZERO(bs->bl.max_pwrite_zeroes,
+                                            INT64_MAX);
     int alignment = MAX(bs->bl.pwrite_zeroes_alignment,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
@@ -2239,7 +2240,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOMEDIUM;
     }
 
-    ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    if (flags & BDRV_REQ_ZERO_WRITE) {
+        ret = bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, NULL);
+    } else {
+        ret = bdrv_check_request32(offset, bytes, qiov, qiov_offset);
+    }
     if (ret < 0) {
         return ret;
     }
-- 
2.29.2


