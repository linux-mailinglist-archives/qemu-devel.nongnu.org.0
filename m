Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF063F9EF8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:38:29 +0200 (CEST)
Received: from localhost ([::1]:58084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgkG-0002ch-5l
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRK-0001E5-J3; Fri, 27 Aug 2021 14:18:55 -0400
Received: from mail-eopbgr20112.outbound.protection.outlook.com
 ([40.107.2.112]:14422 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRI-0006cC-RM; Fri, 27 Aug 2021 14:18:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7XO9R2IisyXty9YWiTpTjtOl+AUlnGuBznSXZN3R5sbTc4H91Q78AFk6uKVR01LESWnxd1+zoNk8iW4AIrsSJW4OxUw7vqgggEMdc2mTY1CaHIY5mSY8LLe4K79N5cVtJjSOFj4giTQWwT0Iuos2aKwve4azZjssJdiJtwWYRY32fD6iGo4y+CdDn7RzsBL7j63l+enxi8HXwb+jKVX+/2vzEyW/tzQaK3DIo/7+SfATWzM4O4ZozNBSP2NgKWtYEppe5nHNSL1E2HArAQUJJyy0W+zft0N1/XESmBBJs9UbRXwncVJngEJYcfyfHYlfIlCE/VAeJQDs+EZOZ4MPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+RpOKe79nwzKYG49VUEqSLmaamzBSZo+oefqE94tPI=;
 b=R8xOtkAvqCJG8xlRkRPmxAc+F9D35qHsbg9UCfgmpy4U8JO1lNDmzYrgnpOgEM3XFkOmjDXJ3rw4Gw3sk2uMNT/gGLV9YSu6XVmHMypJLeL827Ye8D9gpVekMc/J6g6FKiwhdi8Er5F2svE4BEnDk4BOPx8oJ6T+YLJR4vcuobdc21sTXf/D3GbFAHnGqgbW3IcH6fPzeeHQ4933aaPwjeV8CpBWHKbqdKF1nxAFmwHkj1YmMCRfutG+vQJvR8jxYZiFTthIX6/3cK1wnlebspdpRqSZ2altD7PhTUCqHrCWJC2P19o2XVvQgdwMybGAj7WF5yvNJI0XXquG2TXcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+RpOKe79nwzKYG49VUEqSLmaamzBSZo+oefqE94tPI=;
 b=k0n8SCSMUP4AfD9PKQuH+jcvRx+wb27Cxaip81ukndNurEJsozPORRpkRrhYuPXtTvsakX6nbGn/5sDmcMeoj1uw6p+kxkWgBpEmuvjeJMSf6XU4hJXWvmiljREIfSnjwkH85p6crD+o2FkktXh/dqFHwramHqp3A8mVUbCEsD8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 08/19] block/reqlist: add reqlist_wait_all()
Date: Fri, 27 Aug 2021 21:17:57 +0300
Message-Id: <20210827181808.311670-9-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc627e7-ac62-497f-591c-08d9698714c3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765564C15ADBE809B803B29C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6s1BQbbR5m0+5b/GjEho4bbHlSrRQVLMVDDLHyoFY5UWox8oaCjtxyOKSn3/SeZQmLvTumeCJhUuxJ298p7DpYeZeh0yPllhIFCOOLa3UxpnJZyW7MlrCReY35DhLHwBdDTG/5hDTDwMDsLSgyWX0yUZYT55/HaL+575CkYnaL/fBdpHPxWyl+h2M287lce0yjCGkiV7agFl3e0WuxP7TxrwL3Hllre0CcU7lTgmZIDz+jLUcbQlvvngaWxvbduV+jVQyf1vdV10j+vNKvWmfIqsvUxZcCTtNL3cLGbHz36K3WPjS1EVQ++99QFvdWZnG83O5COlNfVtlA1w3kvqbI9akcCmgmwdGHPARtKwrc7+acdsofRL0SgYTzB9VJvQ4L6iNSJFPVKM82d6+Cqw4Z6mLEutssrUEjQxIYmEqsrjFgV/WHhUhrfhCQPA9+O84LmiUFPjjlEfgXW6yJ+cl65s0O1F2n8K1LbLHbtOw24hDbMWhR1jPkJqI4RhqeTIJ9q3YVOklu8zYQJlDhxPk5At2grZLUrkQ/2peVqyALp5Xm0IH9l6CPElbBHgbw2uw9K4I8jh8iThcHo0tvGSxSY6HhpVK7pWGhP9LDGt2fBHDGCobR71XorEuH0zKQhLEuAu0J0se+0wMLt4uJfblH5SePhUlYgiOVxZ4UKVOsRY6kfH9MNBptVGF59vbj1ng/3LubCokr46a9c6lT2k+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1nTcRI7DKVZJX8mGqiX4RsOloHOtE3wyU+Sm/xuNvPQw/aCb0+MzzGkCkiwK?=
 =?us-ascii?Q?hSPncCMeK/0KYgYv8y3eS0g3Yp7v0xgQa4C1M+lgwQitxH4/W4OUwfN5/0JU?=
 =?us-ascii?Q?2csK6ntRcOuIFduLpj0SKvJjqG05Ag7ZMPKWiZGcyNfFWJ7NAud49fuVeZ4M?=
 =?us-ascii?Q?fx4NUgAArTY9rLUROdZlLbRQXSsvKsJJfD36wcDimdH0ja4KM3fVCe3dQSG0?=
 =?us-ascii?Q?9q1NMt3Bfj+nRZpHex9DEP6VVxGKr313DXt6xEK+KiSFsDvAB2h3TfwagGPI?=
 =?us-ascii?Q?yKdmUkjaMRHoFwcpFlYzgIw+uFPKYWSZ+IEafUg9xZsZboj1hzFWZGpoovLt?=
 =?us-ascii?Q?bgjnH4V5wGVGciXzj4BmqtGoyWGnF35ylmK7xWWol0iDJ/pGU9w52Z5Anue2?=
 =?us-ascii?Q?TcZoKQg6e1Y16syQZuaSEPAUWTOgTkQEZD8Iazv910tBuCHJBJFivpbhmibR?=
 =?us-ascii?Q?6PJV6Ey091lZeWqhnLQra0ruVbmVeF9t2K0ESR0JGC4Aa0RcPvtL4MHiahYE?=
 =?us-ascii?Q?28DlN7yy7TU8Kv9lQiHVwnySeZKOtmT0Ox6RxpYVcJb7aODMMVRWdowSNQns?=
 =?us-ascii?Q?XfH3KvYchJkjKWaPA3AhpPKvSBdXRs98bIHSXFwJoL8G3bxJonERiJ6bapyz?=
 =?us-ascii?Q?4l7DJukVOvj8RnNioyPoC+9Hpvh1HFYdoX8KQNmvZ7qkgQ3Gcilka7ZQCauC?=
 =?us-ascii?Q?0fn+d6Sxs6KyFgtGiYUIJ+tzaVKGM5oZwOK0D4He2NWoaX3Y1oMYNXjSsPFP?=
 =?us-ascii?Q?GEG6DE3MbnTZ1Zna0tYz7NhEDQWOfzWV7rtUo5gNRtDN3A87Epc/NtORyqx+?=
 =?us-ascii?Q?pZQjOzmhNJiuyXz6y3gSOy+WglmMrs4rbffZSKSXQygGg5S+cYGjW6AWrJBQ?=
 =?us-ascii?Q?e9/vr7fLLVYR2xMkrM/IrmxBYLOEuJBQ32WCQKSuOE1O66LJbQWDoL14APVo?=
 =?us-ascii?Q?58fP3/9bOtRfxt0wav69lS1uiZXJnWmjN7z+uxLp2OiTR99Ukcq92zFvkcuD?=
 =?us-ascii?Q?6O4oSvd1i9pRdh+6F4Ygh6ZCV9ZyoGgoFiPuxG0nIUrlL/qv57Rksf9V+kLo?=
 =?us-ascii?Q?CWdBsEWYOgmIkhf4wQ9ZsCy7Wt1a2wt28OHrVkyFfCOwFsB8DtjB+jPf3cNl?=
 =?us-ascii?Q?pxqIVzJ62SHuWiMNwcn/Tv/wckxzAYnTvcKwkUc0xmDvULKQwusu/lxiGKgx?=
 =?us-ascii?Q?EJxHwY3UoT9DD0o+nCDFPlmCU0+Yg9K3ipFYoG13duNJeJFwRBmbcvgx7hI/?=
 =?us-ascii?Q?H0Eg94un/3KvxvJ7ALErrCe9NJ7pZSdXAhZQq/lTXvScP8EhvSQDdAMmBebT?=
 =?us-ascii?Q?HNO+LNLR7iLlnC1XVUb1Mk5b?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc627e7-ac62-497f-591c-08d9698714c3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:34.0808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4Z7sFVqnDVpQ1kgwA9xKfGpSWpm3gKuhJWsmpcTa6fQwdKxHtQnHB5hqCfL48QgNEr6ICavzVZhLooggPCy34gf8A2hf3nXOlKE1E3q/Kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.112;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add function to wait for all intersecting requests.
To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/reqlist.h | 8 ++++++++
 block/reqlist.c         | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index b904d80216..4695623bb3 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
 bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
                                    int64_t bytes, CoMutex *lock);
 
+/*
+ * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
+ * loops, caller is responsible to stop producing new requests in this region
+ * in parallel, otherwise reqlist_wait_all() may never return.
+ */
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
 /*
  * Shrink request and wake all waiting coroutines (may be some of them are not
  * intersecting with shrunk request).
diff --git a/block/reqlist.c b/block/reqlist.c
index 5e320ba649..52a362a1d8 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -57,6 +57,14 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
     return true;
 }
 
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    while (reqlist_wait_one(reqs, offset, bytes, lock)) {
+        /* continue */
+    }
+}
+
 void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
 {
     if (new_bytes == req->bytes) {
-- 
2.29.2


