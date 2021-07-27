Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E83D7B5B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 18:50:00 +0200 (CEST)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QHH-0002Fa-75
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 12:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFj-0008IB-1P; Tue, 27 Jul 2021 12:48:23 -0400
Received: from mail-eopbgr80111.outbound.protection.outlook.com
 ([40.107.8.111]:53292 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8QFh-0004HS-Im; Tue, 27 Jul 2021 12:48:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQScY0uA/bTnV7f6rwYMuRi3rtbtm4JeZtDtpdxa5mHNoDibxOoHlLchZ/xMr0b7THOcJa3IM+qykGOGHTbOrFXEdkpBUS01BYWkvP4Jas0u0U0SPoqr1VPzupDo66qhf9Olo3IJFnltmFwWaSdPfhhfIeDzRyuCS180Z0ryzhXX3ItOnROsG7rHpqHFkdcvd1We6dQgJgWMM4LE4tk/hc+zde4lZdvAY7E9H4bLwBfOokmyXPWIWU6hgfPD/rnHgtPKViVMIOXCnK6tQnJeiKbQqjZUZ7sWJCEAAsvtSyZjouf05jQXggm7vUsg9IwhlKRo2xPHN/Lyjbyp+tCFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3jnACxQqPteKs311+DUhC5xzHo/8dkcagky69xFHmk=;
 b=CUqNqTOpXp2/JXRMn0wvDYgqbT8b1JT8M5rQcVupic0wrwaK6DKxtWd/N59JLBHpCQULCgIEoiGZFq5pOnRb3UexiOmMXaSi+5D8A97EPK3gTPQ36ckCbGXgGxgJzDhCL73T161EiviAJIao2dVaQGxzQwI0XBOC3d65FY4crrKYN3yr+It7P7C08LALz+FNrmj+CEj+9fBcyYjGxuFoaVcY0uoWoZ+icTDRHj24WK/uiu/OV9q16fEwPJDlhBplJELBF8/ua3phUgCiN0yyoBUfhwdw1Zf3fVT/eMDtenwEVymRDwcJN1kPz+PS98YrHT3of7oz8d2JXAHXd6ZHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3jnACxQqPteKs311+DUhC5xzHo/8dkcagky69xFHmk=;
 b=I4FSH2k7z4ukbrjSjFbW2+QOHC8nkChIqI5pYC4NNKrn0uSbK+a/TrXtCGl8zPmv1zZ+EjgCIjISYB8PE6UUNiZqNQ6p5EX8kOrpfJCCqou2ucIgA48UlEQnmX0Lev5K7ETtBOJ2Xjybpsxc3u5J9pIj7w9ln8u8eNJYCX3u94E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1841.eurprd08.prod.outlook.com (2603:10a6:203:2e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 16:48:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 16:48:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH 2/3] job: use complete(do_graph_change=false) to handle soft
 cancel
Date: Tue, 27 Jul 2021 19:47:53 +0300
Message-Id: <20210727164754.62895-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210727164754.62895-1-vsementsov@virtuozzo.com>
References: <20210727164754.62895-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0501CA0024.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0024.eurprd05.prod.outlook.com (2603:10a6:3:1a::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Tue, 27 Jul 2021 16:48:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd4bce02-92b9-49cf-048a-08d9511e5235
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1841FBD71877E0ADA7A50CADC1E99@AM5PR0801MB1841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XnffmX0sLj9o3aF2bHSIFQ3YvXl58IiAa4ysY70PPDzPr8lXYqMj6gZJnOeY6eUHAiGFQUeMlMaB8SFzSrD5dVm8QFUsvWx1N71s1geM3BWch1Q/AFjv7dyshkwnzLjEVrU0qKDMYK1ftsmb/QA4eeibnHskPnH7oDyQVpCFE7M6bpXprI/oDUpp7P5mpDySX+IcbszZeKUJihdNSot6dBMI703AxIs1xHtSTEhoVFrUttxp413/StZ89byxw3NC4i5sj1aXqAB0I4ks5LoUtcXIOuKaggLPyDh9LyQWFj1e0tM8enHxczpIpJS1SytPOGFrgdYkP+rbgV1IU2tIsn4RWJQay/z7JM555Jd5amcEhC5woV/mCoKAfq4IxHRAHoiLNDC3HMTi1WxJuYV8gtG8X6a39vEU5xnCfp9ifjCnCGaWL6DiRpXyxDx62mBhaE1ctFi8Lia/fXcxpH6XFBuKzkpz/HZz6Y4WMHAkbW5hL+JmWvXZQZYa7i8AOTukRu8saaq7UCejahAoJHtn+bGQrTaCibKmwzJe7oiY3L7sVfZvc+gFe45E+Zrxy0WQcSPTT83OcjFn8xfBEGayi76OSdSO+u/wVpd+Bg77hJSz4qe9DCuW2nsmb7NP2aPTDhiHJnH/lKpF5T96o7XRY25SayLimNM3laK60OZrAXDvFqzbhXTR48kbKVNwEQKGJKUr8tFM+EeLupw+Io6OWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(39830400003)(376002)(2616005)(186003)(8936002)(6512007)(5660300002)(36756003)(4326008)(38100700002)(478600001)(52116002)(6506007)(2906002)(83380400001)(6916009)(86362001)(6666004)(316002)(6486002)(66946007)(8676002)(26005)(38350700002)(956004)(1076003)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4xsXNXx0+DmiWfNXdxHHlfFumeSz1/fdf/knKUJK/C6K6FKte0i4QJgPWH40?=
 =?us-ascii?Q?s50/zlQvHeuL5GlPXZaN2DaogW2nTqvASLmwrshSKVSIpQfkMoQARLLWS/2E?=
 =?us-ascii?Q?Dk/XMvWfCbSJ29r/wuU51OJM5QwEFOCtTE3JSc4AtYGBFYAic6V/L9YMhJf+?=
 =?us-ascii?Q?TDc5g0nE6IMmWkLbTGUULaD0fjonW8uYBd9aNy0FkwVeuyDZyaWjmrZVGxvu?=
 =?us-ascii?Q?sKxhvVYMtTy+xvOSeUSd+KXigMVahyoxAAzHoFHWOC7S9sxtSPEjXZGwwIkP?=
 =?us-ascii?Q?2nev8j0Gil5y9D25eHl7G5+EUaIqW9pr3QAkqunTNRgYjBa2hceg+SvZXjmS?=
 =?us-ascii?Q?KszGjNmtveHCCSe/qclhrqG1p20UYrd4/lp0EFV6UWmy1giXxM47H0QvmCK1?=
 =?us-ascii?Q?0jMyjn9VRCOQRynoVbybtclkk6z8sKr8hyfEx50+5mycvIaV7PH4K3yy0/be?=
 =?us-ascii?Q?LfeOY5o9Ifzi+IyXuyxM3gAMCGAS1wJH52CnnQI2XJrhRuLXjKDTjZzYPgu1?=
 =?us-ascii?Q?swLSZy6vt2MLqczgwfiVlXGUWGFkraAA2msPuPqSSVceY2CELnYzwkBJpYFR?=
 =?us-ascii?Q?aio5dVCNpTUFOLiA/osiVF2kE6fEOQGiRCCgdp+0k9m7XHkSMezXBRR85Iuc?=
 =?us-ascii?Q?bkBGK04vwvB7rI1OxlbH/p0mZa1oP4dXGzfay46yy46tQPWjQ3H8DA0VCepD?=
 =?us-ascii?Q?xpCwnRFEuYQ3Uf6JWKHAmDt5/GHjDEn2sRG53EqzP+VqOok9ILIsO3ZIq/eG?=
 =?us-ascii?Q?WmuaIFZFlCGoEatMs3KimwZLAHsHKhPlcbh3xo4JIawLiEjCfoOtMYlbo1IR?=
 =?us-ascii?Q?4cT8/NXNfMd7yg5rIylmJ1Jsy+vi6WrtXHKxFvZ/yoQCRGE+cAKSt0yntOnJ?=
 =?us-ascii?Q?5C9vTwCueeZNbyWwEXr7CbJOPvugxHC+6b//TmLMiZUV0pmZ28SOFKu0/+4+?=
 =?us-ascii?Q?6RSpZZZSXVjpQJyGAUnd4M9dUZbjZ0scYFG1pry6MBqRji/+Bm80lpUUntZw?=
 =?us-ascii?Q?9BJTod2Bd9WkBhCDI1Pv1yMm6TaqUMEpTYpaGRJY7l5577Iq2Nti/7I5vkzZ?=
 =?us-ascii?Q?6FT+WWBnmUYBWlTryph3HQOF27n8hG7Jhxd37tFJSBR0u3jcO8MoKP7XSFfi?=
 =?us-ascii?Q?TXQ4p/wz84cOy0/QGEbxC83fcUAn+WYDctxNIXPzRxpd/NiDUq90ACwgnrQf?=
 =?us-ascii?Q?4mspcotIHXEAB6yphTXTKqTZJPMZ8vwOemkF0c/n78l0H5YfnEcs8Ni0HREX?=
 =?us-ascii?Q?O0OsYV/Vk8W6qhLBTdg9B2/KSDS7YUvUUzuydg08XSVC7KKdwr1DYBEd+Um8?=
 =?us-ascii?Q?TNpwtwx2AL3wp6aKiS5BfEfP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4bce02-92b9-49cf-048a-08d9511e5235
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 16:48:12.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gaqc/wt7sMV1Ae2deCJcWngqQrOsSXqvNNU5CSKVPTQOiS8Nzq4yT+nq0JNEa9NMvtjxHz1NZaTWwHY9XPfKR5E1qIBLcIBstm1Q+VbfuFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1841
Received-SPF: pass client-ip=40.107.8.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Soft cancel of READY mirror is more like completion than cancelling. We
have bugs and misunderstanding because of this feature. Now, let's
handle it the other way to drop force cancelling at all in the
following commit.

This makes internal implementation cleaner. Still, we should deprecate
and drop old interface (through block-job-cancel) as a separate step.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 blockdev.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 3d8ac368a1..c4ee5f02f4 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3366,7 +3366,16 @@ void qmp_block_job_cancel(const char *device,
     }
 
     trace_qmp_block_job_cancel(job);
-    job_user_cancel(&job->job, force, errp);
+    if (!force && job_is_ready(&job->job)) {
+        /*
+         * Hack to support old mirror soft-cancel. Please add new API to do
+         * complete with disabled graph-change, deprecate soft-cancel and
+         * finally drop this code.
+         */
+        job_complete_ex(&job->job, false, errp);
+    } else {
+        job_user_cancel(&job->job, force, errp);
+    }
 out:
     aio_context_release(aio_context);
 }
-- 
2.29.2


