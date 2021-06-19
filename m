Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09B3ADA60
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:23:51 +0200 (CEST)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubt0-0004hP-Td
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubqz-000256-4M; Sat, 19 Jun 2021 10:21:45 -0400
Received: from mail-db8eur05on2121.outbound.protection.outlook.com
 ([40.107.20.121]:8480 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lubqx-0005FQ-EP; Sat, 19 Jun 2021 10:21:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THLEM/Df6dRJWxZu495qWUBCJ7/w8q+GFYXat8T4yhevIju5ZqBoREUp8d8ETKymK2kUFA9uuL3Np0BfjoBbYEZGnAkGk2nVXl+5HyKaVyV0MCujcVnfG9760dNaHjQuiq19fIBtSLWLYTAbRt5Aj1pNmbz8B5LpKLFEx0Jieo4vsdUCk23GpPOjptKI1xaxnqUxerIXT6gYA6Jw6vQrAJqepVZQEty3YMPCC7BeI63IgM7NxMMXb+2SsygEedRauYUPj2++R+lO8naooLF2aQwz2+aXUYijR9nHfLYokduIw960g3E1ovvlLdqr5VUh7kvXhoqDkZJQb3O/Y7dzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s90z256Fz2CePIbhV3KxnzB8TYondVkOTrC8PgQzYco=;
 b=MNGtAkn2KTZwiVF7Kt5xopJX0iuvt4EWsOSgvbCgl3Kx2R1n6EU0XdgDhpwPRpW7x++aNt3WCj6T8WXpGbEk2CVwtpq19YH8F82i9rQREVJWSoT0RE3dyoxUVn72WtFUZIo73YnKOBcIVRd23q/RZ6vC5SGV8QBXrUqxiZKbUHGRFDdTp0dL7LglPLKj81TiGlL5tTgeWBYSalVBBd66WjpmLqKSfDblL2nMC8Ucyhw4HpW0Lq8k1H41HbOtErrJyKghF4FQVakRHve4bYctXNspoBterSKgYLLXg86tLRrKXG8C4kwirRdXQhsbwaxccZgyXRSkSNqk9qBEXy++DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s90z256Fz2CePIbhV3KxnzB8TYondVkOTrC8PgQzYco=;
 b=Z/R5yLg1IQhL/Jov7GqStLTWMxNEHKaq4/GZvUjBSoTfVeeRLoxAlQdNax9TdtzY7aoNOJnA513WNyZ8jH+UiQMIplfJbAkH/ncdVj98Wer8V1lRJzcqBVR/ZjR1vmu6oRFFCn+4aM0YI7QO1ixc/5/+BIpBn6x0fcg2Ogvddx0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6069.eurprd08.prod.outlook.com (2603:10a6:20b:29c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 14:21:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Sat, 19 Jun 2021
 14:21:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, stefanha@redhat.com
Subject: [PATCH 1/2] introduce QEMU_AUTO_VFREE
Date: Sat, 19 Jun 2021 17:21:19 +0300
Message-Id: <20210619142120.48211-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210619142120.48211-1-vsementsov@virtuozzo.com>
References: <20210619142120.48211-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0902CA0059.eurprd09.prod.outlook.com
 (2603:10a6:7:15::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0902CA0059.eurprd09.prod.outlook.com (2603:10a6:7:15::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.15 via Frontend Transport; Sat, 19 Jun 2021 14:21:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 911b170a-c05d-4748-8765-08d9332d8d16
X-MS-TrafficTypeDiagnostic: AS8PR08MB6069:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6069F08C682B33F81AAADFA8C10C9@AS8PR08MB6069.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKlN46y718QoT3PZ0Fph4zFL3CnqE5k1kzI/N4ZH8Dh4slW/QpsCXZaPqb62xnVrmOCO1De5ny1CBzaNRbusriVdvQiM6LLM5bW03x3PmmcusDPvEiJBQfCMwK5yMFDT6fmhO978ztqQp+/qQNLdv6V7ZZXG7inPhIXZ6f77bcILkp70eltQBGmu9rwa4nyReGqd7RA3Euh4TaeYqX4VCu5RjfE+e2lqKtT4r0ckPw++bRsmgMDIt6iVTYHzZ4VpDO62v9E/nTqIaEdR+vGUFORF7vZ/U5AED6zj1Kjnpv+2hW/mPWLr0dOJwSoE7mS44O5rcNHWDmGacyZG+uJtsWBZMENirtWq7A65x1xhoNpYdtEuzuiY0svl3kcf1TjS/8n+rbIMdJFJscwuZPorfe1gPZu2r1fdqNtCB+34/l+zi0aci5wXrT5Xkxog6UAA7L56/vn8knzIh47nmavPFimYMkLLcUgmCUc6qaZisd6hwjQlFR+Hd5MONLuZbSRf9tXM780u3xXCLpPmfYFGqDZrUX8ececBjaYArIXlqdQH9Rq1Ykm5vbllFSKXBRPiiay0e6yKAHe3qu7JuP9mcXPZNFtHZm6TgWHXuifnLt+Yf9HMl+vvZGIxdYs5XJBbwhUuXGA3W6UWY/QmhzhgQAOBAY9UxA2D266l9RDfByB1gz9kyTacS5VVqhnhtKKs6Aqbr3EN+wJDQJBzl66bsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(376002)(136003)(366004)(346002)(6486002)(38350700002)(2616005)(956004)(38100700002)(66476007)(2906002)(66556008)(6512007)(66946007)(6916009)(5660300002)(6506007)(1076003)(4744005)(4326008)(8936002)(36756003)(86362001)(26005)(8676002)(186003)(52116002)(16526019)(316002)(6666004)(478600001)(69590400013)(84603001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TKGRruspNHj678D2LVos4px/48cJBVIcnRMm6QznF5+/vlOKL3vCCIykPLDh?=
 =?us-ascii?Q?/UiHlclBcFulIP838IqeE/fa1Wubjx5Kb1KmYw5L6zlyl/BqWHDb6x+Mjwmo?=
 =?us-ascii?Q?0jiWWVs3dzyeaSK+PNMVdiL9UZOfrunXHusBNdjHwFj89v1OehyBWbOPLU7b?=
 =?us-ascii?Q?U3QzM5qAEhrA6YVN2wX0zP28qWW9pzb85NG9Kz/hseuUlJuzWaybEJS+tNFv?=
 =?us-ascii?Q?vlVWd4Lam+JpyzyTN2QdWKsPmE4gLox8AHUQzQZyGwmjileTzHkf2+AdtUG7?=
 =?us-ascii?Q?Ioe2fXIdaxvG1M9rYx2UvAwq3N8NAsSF6HMWJ0V1G8uWD965ZLrswCgwp0NJ?=
 =?us-ascii?Q?dLUbf8VrYeN1gM9wZ4bJPr6yHt6pGiP1e3BFZnaxh59H1TPDAPI4/H8dR8qq?=
 =?us-ascii?Q?925TlbybO1gyCbC+00rH+KWEao/5SIU1vxLliMOb876dEXDfWCx3l2u1shlt?=
 =?us-ascii?Q?qG5ENe6OntCK+16D48kvMku0Oi2RLf6fWoc1vimaIlwH9PTdODh1HiYckYDZ?=
 =?us-ascii?Q?ejkzST98/bsklomlNJAaVw9/+qjg7PPmWOY5cZ0iaeCrb016uI58A6EPSBNd?=
 =?us-ascii?Q?4G/NCu9zv83qevhZcOMQQZeSybYIG0TsNIgXy2Ezq6C0TSyI6vOsNnU720mT?=
 =?us-ascii?Q?d5QX/3HCgAQPY3pxsUxAuBh/99/Y8QSTRnFgkXYVsyGZUO81VF1Wyd3NelIs?=
 =?us-ascii?Q?slZx3VbnuA1SXfpqD7jwV/850QO6K75UOBgpJFc6rDGCYUAuluPouWQ0YMrv?=
 =?us-ascii?Q?wxaRlYvbXB9+mxyuhhMvsJXyljZyUX8WbuSwDWPLMH+BG13LYvslLVo191Ki?=
 =?us-ascii?Q?GxQnYuw1PDVar13cS2Q+qMryGEAa/nVrbyY2EOE52uwKhe8W+ET8dLMGyNxu?=
 =?us-ascii?Q?ZMhiIgqdUkh5sOkAuUonynMK6Nv170lZheoK9Icx9yBxU9SmzG9u/GwogUct?=
 =?us-ascii?Q?RWWttuosrITCeWq7zltcpJVl/G/ArzN40KFYF8W6ceY0y0yqOx5iqnKS8qrg?=
 =?us-ascii?Q?cWrMORm/2wSXLOhlyxGGh8rjUsuDPMTUJvNkca5DoVw2rgcxteiTBpPl6Gif?=
 =?us-ascii?Q?NQpn0rzYFwB/yhW1LhgcS+L0Ya2YN9HLxppT55si9luw+aazgB5oub7pUMYg?=
 =?us-ascii?Q?fING9ve+ZZYHZhvANNli93QZU6d0WqcldLBC+Ad+orjH2LgQGz/Ju7oYyFBK?=
 =?us-ascii?Q?lRKoJJ0c/YpKYTpU68IhPajCKasVs9rtdGajhAjgq2O4c/A3nSWVB1udzp1F?=
 =?us-ascii?Q?3qmQ0KbywHXcAR55KG3ut/QPgn9cv7pFFCGie1fl9XHSOLr2fpIJsvKcBUVl?=
 =?us-ascii?Q?/s9JFjKOM8cAsKb4D3bcUqWx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911b170a-c05d-4748-8765-08d9332d8d16
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2021 14:21:38.4857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YR8ZvjgsVD2hbTXuBXrJnQG590tHwsnuh0GjgaA1xMf5pfq5Ume+f6Nd/Axf0YHMRSuCbL2B1LDh4dAXCXsYryUk4sNlOvW0CV6ToA0t/Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6069
Received-SPF: pass client-ip=40.107.20.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Introduce a convenient macro, that works for qemu_memalign() like
g_autofree works with g_malloc.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/osdep.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 236a045671..844658a764 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -366,6 +366,8 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared);
 void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
 
+#define QEMU_AUTO_VFREE __attribute__((cleanup(qemu_vfree)))
+
 #define QEMU_MADV_INVALID -1
 
 #if defined(CONFIG_MADVISE)
-- 
2.29.2


