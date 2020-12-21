Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297372E00C5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:12:16 +0100 (CET)
Received: from localhost ([::1]:55508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQbP-00065q-7l
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQWD-0003Ew-7h
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:06:57 -0500
Received: from mail-eopbgr20090.outbound.protection.outlook.com
 ([40.107.2.90]:62614 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krQW4-0006a3-I5
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:06:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3UyMRPB2gGaxDhELOHTjN8f32hm/VH8AXy3uAiYZBc0xVKMD6Aj0Q5IKAgEOSkMcGOYaOP7XSUtgocq616cbtF0Ne1Z7Oj5McsA3ru2RBNtPP2tVkctnXCRFVidN/KxCVlvfI5lgTu7CVFVbivc7c4mUNCctt18/pQdtTySiLO9I5JNEWtaQF3nyl4ULDeCXms/KfSOM4IeijOgsBoP80YiyVlH3hry65rzEch/oyRtJND1cMidIQSNP24rS99qf+SOpE/KzuPR1xVjO3dOoLZV6sHf2asZYvQHC04/hmLKcqwyLX49Y08ELKQV+z1+nYk6LdLXgXNF5bDKEGFEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYnYK1rhKbb1nmCht/dH9JdBbD8apwG2lFWK908cppk=;
 b=EfUa+8NyLFMH5vrbo9jL4UiAU2Pi9cC5y9+0XVgoBbUj43EMJa7yNvkKUI/OzogFda2o6d16myu4fpJfJ6peagBkF8tESnhgyLk6JAJtUmdSmoz0yqAcfa8nP5EyNM80/5U97E4iBh1HM/uZpk2EXsEP5WMgwUUD8Wkeg3R4cCXSLWLuuy+zDCM3ZLq19ZlExo/2ydx3BoKdTXpPS82FmU6FOiwstGqErTFKpzeS80be1CkrgBm8pP30M4LiJa7e9RwcJv8CKYBNKhnxwnW0KI754K9vLRDJFqDwNqqeBy22zAvijdEQTHosLPnnCK+5bmJnNzEMJC+H6sNhh2Zt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYnYK1rhKbb1nmCht/dH9JdBbD8apwG2lFWK908cppk=;
 b=pZflAj1o8ccGKZW+CexJ0QiWVc4lBCpqahb2z+PnQTOYBewdYV7ZE2a918sHAOh4OcU1uxUNvZsiJIrcU9/jMtTIOiRfGS4/Db6eC6AxVKNXasc5l7w0csDa9Xtr6l1X0KmOczns0Y4fkobEQEoTFn/sZHSSsMfJReWMcPVFg6k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Mon, 21 Dec
 2020 19:06:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Mon, 21 Dec 2020
 19:06:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] net/tap: fix net_init_tap(): set ret on failure path
Date: Mon, 21 Dec 2020 22:06:05 +0300
Message-Id: <20201221190609.93768-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221190609.93768-1-vsementsov@virtuozzo.com>
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR02CA0173.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM0PR02CA0173.eurprd02.prod.outlook.com (2603:10a6:20b:28e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.28 via Frontend
 Transport; Mon, 21 Dec 2020 19:06:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 184a6583-f293-4973-a249-08d8a5e387cb
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB165242A00AA5E4E97CA7E6BEC1C00@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:381;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bH2PQrqcsEzE96cc77Dq93sI2yDIdi5b5IXpVGZjhZMoSWINnTrVAygI3RDklSeK4QIZKu/fUTdol6LA7zqhBZK1OHD5RhhCBZ3XA+6Ogd0qtYTEBzC3Ibj/a35V8nAk+fel75I61ZYB3zC8fT8akrhmHrIkTiF/YMtk40rc5i96PtlWU1nBbT+J1lK9DMfH/8hXvGUt+1kSyzKoNuAfrV+KFci5u4lf7ppCAhZfsxaYiiMIL0TDuMkxmVo/oF5lzDm7IMa3SvtTnOANDqw8bEMHiY/D4PwyOa7dFPUSK6VxIdXRMcX26zhnnoF1n8oGKxhSzFYJKyQY0pwy60MYb0SjUotaQnBPN25Se4oFfQZXIIVEVECXFNw3x1/YpSKfgc2dzmU6hNWltQBfUUkN1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(136003)(366004)(376002)(478600001)(186003)(16526019)(6506007)(6486002)(8936002)(8676002)(4744005)(26005)(2616005)(956004)(1076003)(86362001)(5660300002)(4326008)(66476007)(66556008)(66946007)(107886003)(6512007)(52116002)(2906002)(6916009)(6666004)(83380400001)(36756003)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FWLWVYAOq6FxHC4LGKIbQC6D4g8pRjuMcPaHgfqzqkHtGGKzubSUt6SE5U3Y?=
 =?us-ascii?Q?xG0uIo3lI+ppMRJFVHxRtnvD3IdFVez+CaMXfwo52QX7L/JPEm/jZiYXzJti?=
 =?us-ascii?Q?BrqeDYnpI+sYctWGB5UpGm/iiBkcwtg0kMd+KKk+Z/JyPxKwABN02ADmkalT?=
 =?us-ascii?Q?jHkYePybI25pgEnLNtRYmIAkNMjTwESHTT23l3+eZu6haF/CDN7hHydtLWit?=
 =?us-ascii?Q?BwzYFy/wJjK8jU1xCQyalZHC6CqKb4fW7M3/0cS8+E4fi9IeuL5ektQEsf6w?=
 =?us-ascii?Q?qbCOmTc5nkR8e+367rgEmyxNAQbdtRhvONnzqO3Kydxe1V8PYNa5jkuhWiXy?=
 =?us-ascii?Q?I4b93XSDd+LN71dAVI2eTWT25symutxYRc1Vejf3mkKCw8lhe7PBa7+Vc4KN?=
 =?us-ascii?Q?mQttzKzJ92Qy7uIsYIEDz7Lh1JkXcjXJc0mx0V0c+TIuq64QkFMD5BauPByS?=
 =?us-ascii?Q?AdLl2l4Qp7cDhB5hkLBkLnUhvZIWyxVJbVB1/cN7nVeu8twcOypOtDipL1y+?=
 =?us-ascii?Q?R2uAh5TXic0SpSIjgAIqHUZ+T9UUGAYWM0UziZdUD8MoNnyGzhC5kbkUYxoU?=
 =?us-ascii?Q?6pE+2gUoIgKZAY1Jx0hpjmO/Zl1xMpUAV0QYLuo6gzRR+yoxQGRPMvsCooEt?=
 =?us-ascii?Q?jajO5oyy854k6YWbdNZeQmibexg0Yyyv9uRpT9o/761dCkjuk2fMC+ePZRCc?=
 =?us-ascii?Q?WuPFPAcSeKWUFx54GhVNwvqtUn/mV5ljmrTtYP2tjF6RarPDSwzNhDWV8qpK?=
 =?us-ascii?Q?kEnndwNNWrz6U2K6Mz0sjZ8RvByVPnQ17483f2iya1ktoxVpmDHPPMfI4cBv?=
 =?us-ascii?Q?TJsebGWNB1PzL0O7J2h5yPLTtVg7erhVvxwJrrS4e0OD5RUU/uZ2wunCmSDd?=
 =?us-ascii?Q?A9IPJ1KetJURTM7XVHyE3Afk0nn6sUpFAiZsf5/z2Ahe4OXVn3fQ/TkB7hw4?=
 =?us-ascii?Q?mdxlYjRkzC3lxeFELgE+UbTI7pr9NogArmKS77NxtfZGs33ktEv7oJbmb2Ue?=
 =?us-ascii?Q?QET/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 19:06:32.6507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 184a6583-f293-4973-a249-08d8a5e387cb
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6v5tS0ZYVSpkGVo9EEYTJmE8emCgDHO8OmnZWisrFuLxaqVA6HOXzW5SIZacgOgsnO/5mJSD0daTuhJRGqKDA2DjgUMw8rQfZxdlV7YKP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.2.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
Cc: den@openvz.org, jasowang@redhat.com, vsementsov@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should set ret to -1 on this failure path.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 net/tap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/tap.c b/net/tap.c
index b7512853f4..75b01d54ee 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -880,6 +880,7 @@ int net_init_tap(const Netdev *netdev, const char *name,
             if (i == 0) {
                 vnet_hdr = tap_probe_vnet_hdr(fd, errp);
                 if (vnet_hdr < 0) {
+                    ret = -1;
                     goto free_fail;
                 }
             } else if (vnet_hdr != tap_probe_vnet_hdr(fd, NULL)) {
-- 
2.28.0


