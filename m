Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C1D6C8578
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:01:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmdE-0005tx-La; Fri, 24 Mar 2023 14:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmdC-0005tM-4E
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:18 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmdA-0002ID-Pg
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDJwEVY5fmSXi1IMBWQL12Zfx6fsKtFQkKpfsYyxuvKoN4bcwJb3CXGoBsAK8e46XQ7dp4EvaD5m9fcmRI9uDH3ANG1Yy0XTJ7Uc0no5HcaWx29gLG2gk6e5MMnVqOy+UYMWxTqbHJsOT1g4dWGRhYluUd0tTE5XjioFj+XkxpZNDeRoBUOl8D5hH1iyguScZq6s6YPEYe2gZcWB3QXbNqlSjad3+3hDtS8q/OCD4VynVQQgjtX+9dN4IfB4zy48MzL3TGmn+5Qj7T+eEB6fAoMUsNxeaOn8IFOFu5cXyHSu2NWWnGx1yBa3eHbZUZLq1/GLg5h0fk3QWICv9kvUCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdvzBXNgxJy6TqWUHB5WSZYF29QYHgnkWv6O5g2F1YE=;
 b=bZbOBme6wy1EJ4pZmgJiJVqvjmrnTyoRmWmk9f+M5pKl0ao/Avq4CgaVtSg/E+1GscAH689boBofqWdC1AQs8oxa52v5dv1ge17VcrdgXa6/xlIokEBnFDg6fnhwjDrLsDAG1KaOQwHB5HKuEWLqR5qaTh2MShgOLyRPwA+ca8Hf7wZivguLBKRyggIrccr9c2MreJLc8D6gYNmS/6fFZFZgPLZOREI0UmRElYxY7gnGdpWANfa3MwTqEeZkAzlL9cqh/WcV14JzFamz5hX/y/2NDqKY2XiAEbHBLPETJn3zLjN/6dMr6ep7Nyr5L6UXNw4FhnmnJV7RbnHa/GH+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdvzBXNgxJy6TqWUHB5WSZYF29QYHgnkWv6O5g2F1YE=;
 b=Bo8XsITbpaAswj1aUDNf3HCyc5F3TA9skapqACS/ub7Tr2v5RrceAzmjlVb97qt8+1fx5FBbYbt9vt+EbQGL60PbJPw93Qy7modWuUK9T3YeagVI2394MCyC7bVUsgZELp2OWhrWkxoCkDw2FcArMK0hLC4z7+cEryNUEVPZ0Eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:58:58 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 18:58:58 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 6/8] igb: respect E1000_VMOLR_RSSE
Date: Fri, 24 Mar 2023 16:34:59 +0100
Message-Id: <20230324153501.20695-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::35) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: f6eabe89-ffdc-4b8e-4347-08db2c99d111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A8cYBiZ126hF+eN5WtCUWxpBElI4ueVO/JnUL8jSMDPAqgxvXzAx1xihnUSQxYEK4i43FqkME1WzDcS+o/UH2cxWoTBYkKlcttgULb68q57IrIRmJWxOvYtJj7RzQXSYA1GcMxO7B9LRrUO2ULTG76D3qUkW27qI7Mx1Xa0FA+8FC9Z34lKo/ja9QXA4cTElkHJMhsQRLurUJXksDmIUoYypKpBTy6t5IlS15jFNf18oFRtlIbhNewenlMJuiiStF6fm0Fxrr0fBpMxwZrG3TO2C4mh028DWRE4fRGrZx+wWacSkn1IZfxJwi9HrSpVr9aHSvaq9+w8l3aKgCzkOV3LXFdxtonHeDYLxVqafcS4hgvJVsAAak2b/STfYFoYbIUwUGk40HNnAM1lu3tDHHyhn7Okabp9gNIDRNykVSPZZZ52i38k6Gra3jtVHz/BxQoU8aSoBUS/GpYoM9iuuoM85FNb1zQ6S2ztQQj/Gzs0v3M7cntsxjiuu/Q5Gx4f7j0mYWEdhrQN71D+x3cNFvyXlq3WlB98GtypldESAkIEZiIfpmlu9m4QdM8Z/Lil6p5xW/odliAui9jdjBDwmGb8A8t6Yt1zrn3lp7kFdW7K7NPjzcqVqmhMRkVLQvHnhIfyCpL+FIFIQGXtKO91qVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(4744005)(186003)(2616005)(2906002)(6486002)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/V8pFMep5zRnbhKnL4eveZuItG/XYn/t5AKt8nbnIfZacbaAEUVw2FrLXrir?=
 =?us-ascii?Q?wD7CEopMFK2vM1zuLmw8ZDNxIjZYO63qqS2vP4UmKT3k1y5ws1e36yUiYzkb?=
 =?us-ascii?Q?FlL07QTDLTKW3wK3BF0mPo+zsQ4jBOzL6LHmAX4S/qi1PqKt3ZT9IX7Tm3wy?=
 =?us-ascii?Q?UW7W+Bsgg6rI2eC7p0Qxz+IcEW+ypD5Zabv37XL66u/NjywV2OmwdQVWR+zg?=
 =?us-ascii?Q?FJZaHcab0XVTEU9r6SvMIBhwCXxDd1+/7W5mm+Vyo9ZN+MA2AlUjP3sTX5FF?=
 =?us-ascii?Q?bwwJE4/YnHQiUoU38E6W5WtFywp2t5noM/uXr2pCvcrD9k7/pj3DcSW2OEQA?=
 =?us-ascii?Q?w74NNtoW5S4ldlYabaWq/NxEewa5VWMyFCJZ+917l+YAXXCsOy1cJHYKC5k8?=
 =?us-ascii?Q?H6GPN9sE/jpte9jRTg1COSplxBU1Zq57CiEJeYhTH9e9AWT+Qgc/73jVyziJ?=
 =?us-ascii?Q?DD+U6WqyMra39PQAkbBL9YuuL93HOxswt28zlVXmqQm8KdKSZ6ZSCiCHmT1M?=
 =?us-ascii?Q?Dn87Kxc4+BI6ZKcMFfK8j064r5Ih6Qa9EiMV/uQZwSVLONq6zlhzlxz0KIYW?=
 =?us-ascii?Q?ChV+vvhl+KLwfDXdx+fDQ55LYLhE/sFtrDulpdJByCclwg299MKWqaJwu+Vl?=
 =?us-ascii?Q?vQ9VUhgH6TN68+w3X2eXi4liSpQpZ9MVhWPq4f/NmkW7fZdxP6uiz9yxr0MP?=
 =?us-ascii?Q?ilLHJwSq+zPbKlB/NN8X6tSIBOyZag/Bx7EaWY7CSi9/aseUzDUc0LTJfhs1?=
 =?us-ascii?Q?t/NqNE/uC9A5WHXo9niYl3kItxACH3Cd7sh9tU/aq/E++Yy4BpchEr8enR0z?=
 =?us-ascii?Q?YoMBhnWqkuDhKunggnlUeJLaDoO1iD3IzTwkNOcF6pawT8+MFo8YUrkvz3mR?=
 =?us-ascii?Q?0dvDB43uZJY6hiQKDsOG3vlZ7kO2VYUPlNPo74XLQlkwo4CK7Sl7I9uRKq/M?=
 =?us-ascii?Q?L7Tb6gzWECTUbRh7nQpOkaZcQr8vIQ0fhbdtmeFZMdJEZjT6ecjWJg5LtnGI?=
 =?us-ascii?Q?XK3M0TzTuxfc0gsh5s/YQ1e9uHjWaoP2iwf9rm8T0kDhFrUR3DEckEjnIiqE?=
 =?us-ascii?Q?dOo3P4p4KPpD0iTahmc9WFYwWWZaaFiyW/naqhRlLD3qj3V5HW65izm54T+n?=
 =?us-ascii?Q?2RlKG+VA0R/edImf+GxBCRXO2I5WjaOgpTIJRZbNhXuS9+U9bdzmiAdz/jwM?=
 =?us-ascii?Q?MP/fT+YgEQleOHmVG1zrHuPVYclgK2cNvCunl/LyeRft4BD76vLLOifXEcw9?=
 =?us-ascii?Q?K82fSnb7OeZtzWuqsLMTvLCuORZh/ilDmRXk6M0F1wuPCP7SAvdojJJBCt04?=
 =?us-ascii?Q?yf8VgOHyhcbqihGT5gioPorjfSYDZQ+LZImePd4RNKLKtnE/sX4YnK69pEfT?=
 =?us-ascii?Q?o5j755cTzHN+7tZs31EU2j6GQW/dIgMGz2us4UD28QEnvw2JN9SIvxs02UrG?=
 =?us-ascii?Q?vv7I0ktl7bkgd1UwHA7rLOytjgdOsO7HDwJtKu0t0PXxGiObPv3Ffv+ITXUr?=
 =?us-ascii?Q?bJ/KwLYOC7Hrou5VNEAohjj42gQ2ZWVjkFFJ6wIigJcjvZ3U4hMPVJgqKvpF?=
 =?us-ascii?Q?9JuUx4jDldAU/DkFTzhvJA3XdaIZAekKSLzYG8tpyrlTTt2HTQqGLL3iFIgh?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f6eabe89-ffdc-4b8e-4347-08db2c99d111
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:58:55.3494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: acqekhUjILzHqBp/xU+/JqUOLIhyjZu6M86rTxyJ2Y86vF4FbxaLTHPKawneU7Iqn/hkszr94NBE5zjQu5Uf+oMLaeNqzuf7AW9nsDvrb2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=2a01:111:f400:7e1b::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RSS for VFs is only enabled if VMOLR[n].RSSE is set.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 38aa4596b1..fd61c6c550 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1057,8 +1057,15 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
         if (queues) {
             igb_rss_parse_packet(core, core->rx_pkt,
                                  external_tx != NULL, rss_info);
+            /* Sec 8.26.1: PQn = VFn + VQn*8 */
             if (rss_info->queue & 1) {
-                queues <<= 8;
+                for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
+                    if ((queues & BIT(i)) &&
+                        (core->mac[VMOLR0 + i] & E1000_VMOLR_RSSE)) {
+                        queues |= BIT(i + IGB_NUM_VM_POOLS);
+                        queues &= ~BIT(i);
+                    }
+                }
             }
         }
     } else {
-- 
2.34.1


