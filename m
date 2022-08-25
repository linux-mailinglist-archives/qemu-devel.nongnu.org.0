Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4455A148B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:43:04 +0200 (CEST)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE4T-0005UQ-Nv
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtV-0000aA-3V; Thu, 25 Aug 2022 10:31:41 -0400
Received: from mail-vi1eur05on2096.outbound.protection.outlook.com
 ([40.107.21.96]:43230 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtT-0004oG-Gz; Thu, 25 Aug 2022 10:31:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMBSn2F4s683ebM3GS6FDpd9OmYyYzDDjenPZ8a1clBbvIx+huVug9Gy8KkCrll5v/g8mTU8ClStVD5jOSuPsdCJDZ8gqq+AN2YJL4ncuJHhVWhB76zr6yNBDIEY9zEhsc4ktwC5/o6iV77uIDOLz6gJ7Jso88UtkUrch8Ioy4TB9eZRZr8IkoR0aUGsMgrxYlHbQfeBn+x+lCtKy/qU2HvaZaf8o5sugpB+N35IyY+ntI6KItBbCLmoBbM5ud/2rScEN2IeviPYNOC+JtPgjQQqlptj2hr/wj34HX6H3anZuRIookOvEsFYnnIZuk5qtJFZEjPd3HJm1xnFAAzorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yk9li7uTihtYm0CYbs5JOYbF9rA4KmKM2Fs2RDAdLcY=;
 b=HBwXARMkPBjFRfKBfMZT/anu/DFcV8GVCN6WR8slrxgdep8RaeepPcyO+WzySw8+vD4r5ka5qLcxuc5HYNhnFCATy9tEBXc7q5j46lly1PMNqEC5UyfauesuO9YR3N4p4s+TcLSaKCy47XqUru4Fc40Zkmlb9om0SNDcPnNWdvQL4i8Ik7pfjBy/AOSgbio+uUtWWT59ypD6thqk+P+yAiPrNXupdxyJ9XJiB5iQ4uahAdutiMwi2ZHVbM6KMByNhTzS75JQOgLxAOtoYvAbWXEav55YtkCoL14PLT/fYZ3Y+b70u3Z+jC2bbb7MhPwiPQzuNs0usjgHE/RZpU2jjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yk9li7uTihtYm0CYbs5JOYbF9rA4KmKM2Fs2RDAdLcY=;
 b=MtdiaVO3hxbLzmCDn5zjyPsL5JV5aOqNTC0s7uIYLnqr/8xmQjdZ7q79H3eXoVRUutJeOnb/gaAN1QoU1YsIhXZLfF0y++35rKwfFSOp46RCXWTyQDjFqntTWmJBDcYjq5/7nKq2nfjGftlGBtLpuLJbtniK+mbjaC5SYQ95SQxsljM5YKzCFYYxWsj7AFUWB8dvZBRf023NK23YywXN6zP085Rx/GMZGptt6R43eob6/AZbbyCixKuc/tCBy54QGBgkvksknqPSX6eEPlQ/AF4+TddlUHOxNwjuXRf7uUQ6Dp7aaO7F289e8mSM595i/7LsgHrkl4sD5sDr0eusLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by HE1PR0802MB2298.eurprd08.prod.outlook.com (2603:10a6:3:c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 14:31:18 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:18 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 02/10] parallels: Fix high_off calculation in
 parallels_co_check()
Date: Thu, 25 Aug 2022 16:31:01 +0200
Message-Id: <20220825143109.176582-3-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6392704e-b374-471e-1842-08da86a67940
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2298:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPcvRTAShXKOcZCueBJxrBpuTMeaktSFGbHYpTCJdve++wUDqxkYwDX3l+STjLuH0f8hqazETCacVZ20mfTqimlA1M/WD8Q1IAE2cFN4LxEACGR8Inw33odZvvRBKGYFIk2wygGNrs3hXU4zJ/Zm5ryC5W/EpwekZepVwtxuY3DA3HxYlq6tmmFB22Kb8QmkmhtwT2ixIJscxppSP7Xmj0J1yCCFT4tKQ27Gt2StB1xXvz7LuSTk+/yZBdQ6MQ+Tehmi2wlNrvV3E5+TDHYTBeX3KHC4Mm5NLNjVIRkuHBCDmlRhwpmr964UqR2Z2mzAHtHaYA6bq4q4nj/NSbI0X09sVxWgW9J2yX80zOtxZVQxIFHrWq8yqPBGDwRrlfKpmikBk12lebklI3RHaxQLacC/sxoo9CLYs8a15f7l90sxG1ejpPEX5TMjJHrC6HE4WLIzh+UA+AlNPkI4T2EN5GDuysGvrxxyqyx9tfulYvmooKNY/E4oAhHaiqm1T9q93NjCh8gStNdL3h9LK7C/wttgD1HyPr9pEJExidhcGf1q9IHeERWhIXOPxVmWKFH018rWncoEffRTAUwsWAB1zuBhOaDzJbEV/+W1rHy00C0BH+64vyKXNiZBtN9HPHhcJhX17ov6eAd18Efi2kS9dNha10lu4gb5GoCHiR2w2N678vuoC1Hr7jvt/7IEAYhzkLC8JuarRIUqWly/qDjy1b11EyncQsQfpimClSKEkZ5L0A2oAl0fQS0s6TBBnvUCC6PwHWhcsW5wmo6WKc9+/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(376002)(366004)(396003)(136003)(346002)(36756003)(83380400001)(4744005)(186003)(1076003)(2616005)(6506007)(6512007)(5660300002)(52116002)(2906002)(26005)(44832011)(478600001)(38100700002)(38350700002)(8676002)(6916009)(316002)(66946007)(4326008)(86362001)(66556008)(6666004)(66476007)(8936002)(6486002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xCMB8l77BkHqpdB5/OqrXAbNr1Z2utSiVwxpsmH6HCOJcgHOP7fc+Qtca50O?=
 =?us-ascii?Q?/snNtxqHFtWua3zDqkw7EQnF/mlZMxWAnDQcGycwC+O4XujD6PMnSqUvYJav?=
 =?us-ascii?Q?WLopcs7W1JLqAGILlULTg3Yip4+6K7/aNXUCZ7SS8wTTCSXV8vj+Ob+xWdYQ?=
 =?us-ascii?Q?V1lSqDnHIvmMA1wrJMbK1mZN92PhsMm0Ur+YYrBevtMcMckveDS+FZD94Z12?=
 =?us-ascii?Q?RdARdc7QFjO9ScEt1D9BOwxqNYJW5favmZc/FbKhMS6iHX2qr47oDXP6LnLy?=
 =?us-ascii?Q?wUaLui4SIqdRfzAb6nvBAcwFRFjYdYBmT0hUlAbEetSHtJKYimlUEHhXSUvJ?=
 =?us-ascii?Q?Y0/fHGEm8CLxosUYaG+CRW52TVGLQ9MiFI8Baa/DdY6fSjjajBNcV+lIu0LM?=
 =?us-ascii?Q?UaSh+HWmpZ8j51JATHPiBJYn/NAnmbNvurwULFDn0lMS50BUBn5bMgtqYTwS?=
 =?us-ascii?Q?S+Ph09HRwZeHAyxxbI+FE3s/TaF7FyRiDazNJD+QF2GMCU0iWPzeFuUkEMPR?=
 =?us-ascii?Q?GyTynGCO1yzx/mFTLsdG9I0foZ30pgANDwEdI8tP5b19thwi++vzPBc+vpuc?=
 =?us-ascii?Q?LGYD9hIozBseoO1ZedKNpE65Zo7ZG/MhyIYs+V8LgLZobDni7dP1EcmEuz6c?=
 =?us-ascii?Q?dS+j0pfIiNPDuFQZLcnkAutST0PYXNmGjYwAwyHWNMDS1fnQ4vpQf5QJ+s/Q?=
 =?us-ascii?Q?Sa4bDL84Z7CSszFoX8NJW6cdxH1GGC4qpVKdHGqrFikMuwZkMqsG0ybwdsdW?=
 =?us-ascii?Q?2vGc5xpC6F0Asw7E5OaQS7TeVlMBvB4PIgFFbevlz1C4Jdc5YKkJNSpOOtYM?=
 =?us-ascii?Q?a9UEKZRt1ODsHq7r/NKkaNm80jr8z+IpfmpfAzxcfjXoGsJOBDIsj45Kne5r?=
 =?us-ascii?Q?BLk9sP+Cl8AKfPfTPT3L0fSMVoZe0M8KPV3IXzUza5h1+e+LmL6FGxpbTu2W?=
 =?us-ascii?Q?Z6nynlzXHz3JstABjbqYdmihm+Td7KNK+Vhxfq+JBXNRFnZZhmL7+mUO9dnx?=
 =?us-ascii?Q?ss7aTn3RVOq9lxffl1mMQJgO5TELypwsYws4U5LSR7eYuvpkB/EXSZb8FVYt?=
 =?us-ascii?Q?lJGK7zbIFNl84wKwu92jRWOqUMRFSYCAKezUN2DwN74YI75t5SdzhzAMOIc/?=
 =?us-ascii?Q?ETh2PPa4nTJhimcv5L0kXlpoqZmZqynIC/o12bNe1DLLTzUd45sHBpKkZ+tY?=
 =?us-ascii?Q?9SDcz2AgDVTGDCtTs+TLMnx1JmrKgv3Yua3X6CI82T8K0lJp7T7vxDiEuH/8?=
 =?us-ascii?Q?lfiz+2kVUBNlPUNAJNHFc+YWSG76KX8ZurGPlu5VhIWKmQ9bA3wZFwsv0K0O?=
 =?us-ascii?Q?l+vteIUiAfJwLeaAyQNeVF7Qfii++tSjtuSpFUf40qQ5F3MBdsBAD83P09df?=
 =?us-ascii?Q?awgoAlz8aVEuSuGx0Im4UcsFr3RSnsA9RRs384zb1RzoV1S+jx0yrao2p6L1?=
 =?us-ascii?Q?wEUJYmaPEG1SDjYjN78nXiLAR4jeGVGcKgP5y48Qwq3qyPFZWzc4KMxDGIG3?=
 =?us-ascii?Q?TqhH2MbLEcgnjDcHyatMIDz4MgT8gdEvJXsHYRUck41NpP7kS+2n+zDpIpe0?=
 =?us-ascii?Q?n0eKR240K+XQUm/cYvUtm/Xen/XDzcrVXQDDZrEuTu55c9QZalEVIS2hXfpG?=
 =?us-ascii?Q?7rIhWfVbZf68HwS6qfhL50I=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6392704e-b374-471e-1842-08da86a67940
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:18.4533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t5YJQPAkF6Ih7y0PhD9Pw0gqigV2G+p4Ju/M0WbjA0yDwN9NmLeoPX7IzMeHijjC9+26eklusc6eOmQFxTjFqAqeNjlO/CnlVwONw71T8bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2298
Received-SPF: pass client-ip=40.107.21.96;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Don't let high_off be more than the file size even if we don't fix the image.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 93bc2750ef..7e8cdbbc3a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -460,12 +460,12 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
             res->corruptions++;
             if (fix & BDRV_FIX_ERRORS) {
-                prev_off = 0;
                 s->bat_bitmap[i] = 0;
                 res->corruptions_fixed++;
                 flush_bat = true;
-                continue;
             }
+            prev_off = 0;
+            continue;
         }
 
         res->bfi.allocated_clusters++;
-- 
2.34.1


