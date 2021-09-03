Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB9D3FFE4F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:40:30 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6cX-0004Fn-Jo
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RO-0003Xn-SR; Fri, 03 Sep 2021 06:28:58 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:7190 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6RN-0002A7-7d; Fri, 03 Sep 2021 06:28:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HavFeezux/FhCrkqi4JfUWQ/7SppSTrHPEUPM7fSoxJzYqqqGMIlDYVfc+wVHSfLSXutKfC3TtSOoRdXXLvcfb+GtBPPdRqg0rucUot73jOKlL6RGAn6lujQEFHC21o2GuYO7uMofecKueQLwWrY28toQ9zMLHWKLIb10Es7t/9o+m1AtitipBFYJ5iHDWJzlFb5UyKOQXXrWt9/Yz5EuQJq1HPTkZYIzVT2uiwQoXJpFdrdw35TmcJl4p7a+oKzOel0fEoZhASAlvOmZ+jxizFQGGJCb9zQTbPCJ40pRlitdHXSqxuAKFR6X7IUKKM6HiyDZPN8hcHxWPguILiQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=q37jmXxnLW9WYqNnvmLXpmmnhXrp0IGNYomrb41dhl4=;
 b=Cgt+tXB3NU0KzARMgJc9eBYDkqSH3xVKKLLpkuB2NHBci763YKtdBowIV6Hkbpj4j9AwhnGoQzgnakgfrwWGPqCv8V3dkDp1c57ojLsHcL7/+ed+53zs52WTpl16JPrHpIfwjif3iiuBFTAaIuqEpUYx8g85SONSBNds7Rq/9We5UmYOaHgdREyFI0dQHRct8Posiu2kFvxc9RP6IfgSRE7so26UXZ5rEjSJS8TjuNJcgXbwXzdHE1AsuP7A0nTKDXlymcMwBNLThn2Y+4T0Otx6rxXbk+fgpUlcwq3mSLnD7YDrUssIPHxF8l8cJw9AMdwMPKIc7muc+wRLG2Nhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q37jmXxnLW9WYqNnvmLXpmmnhXrp0IGNYomrb41dhl4=;
 b=ofoXTCvFBptbeGmj9f27Ue3lj+XNoK3hkUg9jAjLl5/M+PsOyi+CaL1AV33ENlEA72Uqlp8DZR1EpMW0oF+8lFLlsEdEFEwhqEYI24fSVehBTdggrjL4UUK76STbccFcC/6jiEaOf8PuowtCgMiOi310rF46PuARZw/bh+8e+Tk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 10:28:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 11/11] block/io: allow 64bit discard requests
Date: Fri,  3 Sep 2021 13:28:07 +0300
Message-Id: <20210903102807.27127-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b4c3f46-cb3e-4cd6-4af8-08d96ec59bbb
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69453F75DAF4E43083686358C1CF9@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fD0CiVU1u9qsea7lS+vdmPj1CZDzmVC4Nb99rKuBIgz1xTbd1s2NRrgP2TL4vE8YvPirBvzyyWjaOIEq1kOMLK/KdMtnPjYeH2NrIIjYZKTn52H4BHvneqFjm1R9BJXCIhb3U7SLemh2C35jXxC1ABIPSdMsRj8O0v3Q/4cOPOXNIQSQ/Lo52eWzQ/SAmf2T/WOIUoFn0kUfrxNOAgCV3L6d/SXkh+/dx+nHW3p5Hw8QKkKenjcMpKWB+ATBsRwcUwb1uXPKFn+VMs6W8gdOtpb69jlYL6HsriKYEjiuRVH09khMN/VLqlgm4lSLNxYEuGpOp96YQ/20eMiTO5dyVkmokJngQWz8upy5NPgkP0DmZ/4o2IbqjUOHecrpx+7M2iNkVDZSrqNYDJ3MkRYRpajV9EulABQQliMWmOvWhZ1ct4Cdn9x6UYwgpbVovl4gX3J70fTwBpo96Gs3z3BCbMx9e3qHFdKN0kAGtqm04rhiS8g9Mtbk1Zbn3744GCmrqSfQQ1TfqFtR903Jy9Wg/zUDLmy9ZiU4NG/P5ge+JDW8uI0aIPPv41HREc1rjAT0HXYGRvuNXH1b9AATdUB/ciuc2ZMtlXm4cId/xV0goPa7KxgQKUcXvJ6T/cDy/2Rnt5xWTQgrY+Pi1m2EAjWhTxZF/zlrY+mUIthh/UvgGzSCleUNXrJGZQOeuqaNFytQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39850400004)(396003)(376002)(7416002)(83380400001)(38350700002)(36756003)(6512007)(38100700002)(6486002)(5660300002)(52116002)(6666004)(6916009)(186003)(956004)(66556008)(2906002)(66476007)(66946007)(8936002)(6506007)(26005)(86362001)(2616005)(316002)(478600001)(1076003)(8676002)(4744005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Ebo1iX234pikUayYNkCGdBlheTUXo1P1m0+vVQ47Anqm24vqPG7Zd93iWk9?=
 =?us-ascii?Q?oq6vDppHB/1zRx07JcYBvov1gckd8UOgsPP9UWy+Jla3EOmPvMaQuL2zBueG?=
 =?us-ascii?Q?qVfPspd/vt6zgWSo0eBCJhs58X38TZN7j+yPZFkXZbTIkNOuBO4PT56aA1PF?=
 =?us-ascii?Q?MT/EANhJl4FYr0JwN6ZjB9RA6jGQQDhg+/dVqUsiqGQ/EFLEcuQFWJY+I0G8?=
 =?us-ascii?Q?KAATP0wX9Z2FOxu/7J8NSd2cs5HxGZHTD6ySYHtXN1QCzBdB4JGgzsYb1ZnR?=
 =?us-ascii?Q?pV+wQsQaeBQ3tddUy9JRsPeMlAbunpVuoDovhRudaOlk++b3saSBQWX+00VQ?=
 =?us-ascii?Q?dDjaYqEP9JvEWvq4cHtZW8OU2Fzakc55fODWHN99Z9OLhbdRIATzynHvHRAJ?=
 =?us-ascii?Q?unSE2wIELsmsq+ITZMBgDO1f0JO1OKedbcGa0PO4/Fa4P3a58jRaV6xK7eRo?=
 =?us-ascii?Q?GA10S6iUzFWw4ch/O4gSn15sYiUBV9wRqtuoRDTt/5ekWwGFjk/lWWvPwMop?=
 =?us-ascii?Q?3kHVuHJXLUdVxjNCDbLmZfS0jt3J+C5OT0cBsmSxXzbfjrZwVAir74E9igxG?=
 =?us-ascii?Q?x3VtB/MbEAjIy3fetsnOSZkVQsGmCgRHbDOEsUlStkrVhdf7BIlf9PbFNbyB?=
 =?us-ascii?Q?xHMYezscGa0kjco4e2u6/ttG9oIyOo1sS/AWiiyJt+4qwGZM0t/POVwrBSNF?=
 =?us-ascii?Q?yfQu/BZoR4C/svtrHxm4+oeGNsV+vkVCTWab9BCvDFJd/cZxJGbDrEZsF72y?=
 =?us-ascii?Q?zXaZUOye1Fstlu/SrdZL0NNjsEAmRj3uU+xUDQ2hS/Uv3zAJC8vmF8+KxCf1?=
 =?us-ascii?Q?nE/msSGjXYnksXQHDYGnrnlsytRszU1j1C4xvdxgkxthhnwgHS97auzTLWfQ?=
 =?us-ascii?Q?8N9z6OQTrVQciP+npGqG+UvLpKE27KYjGxXklNifOqwNQAHIrxiefx/c4889?=
 =?us-ascii?Q?tTDzxWXu+fCVRlaub7Iv0ItWLsQ3YDPcRc2J3mT1s2KeB3nBYFu2DDjKuteq?=
 =?us-ascii?Q?55wTiT9UV9oHvBj07A6bA65rsJDkCIkx37zSYcPhpmEPcxlGJ5C7NNOObkAd?=
 =?us-ascii?Q?D+Ei0wT8uTTZBen6zi0Agd89PcAdUGBVpPyOAR7UBTBpfG6TA4eQbQO8haDr?=
 =?us-ascii?Q?yIszWu0PqrzWv56jKi6nhYx7cI/k1MzPZpP4eCiBEX3TmOCufxmi5L5rTr1k?=
 =?us-ascii?Q?q99vWOZEa4TJnNSbKBBGEcgo0ySfIIxYfx5fVjzuTa8NEp8VRzNr0kZIPlQT?=
 =?us-ascii?Q?xUsnMjC/LQED/3MXU16lrDi4uqKaYV4Z2r3IJXNvdHPGTvIorhT8gRbSfj2/?=
 =?us-ascii?Q?0eW/ptEujUdui4gsyfaZYkkx?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4c3f46-cb3e-4cd6-4af8-08d96ec59bbb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:45.1624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKnpmcQ0LxxhBfOJnLb5SrX2KLDyvnkEfyTMbCyHz2+l7Ukn1/XKCmF0Htqp99cH60toFJF7PDvR3B5h61JACdikrYHkvKm2AMhd6CKrAq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Now that all drivers are updated by the previous commit, we can drop
the last limiter on pdiscard path: INT_MAX in bdrv_co_pdiscard().

Now everything is prepared for implementing incredibly cool and fast
big-discard requests in NBD and qcow2. And any other driver which wants
it of course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index a5ba1f4cf2..1e9a3a1752 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3042,7 +3042,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         goto out;
     }
 
-    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT_MAX),
+    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT64_MAX),
                                    align);
     assert(max_pdiscard >= bs->bl.request_alignment);
 
-- 
2.29.2


