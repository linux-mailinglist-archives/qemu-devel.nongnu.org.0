Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F4037274B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:34:47 +0200 (CEST)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqVy-0005UM-Bs
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqO6-00084f-R4; Tue, 04 May 2021 04:26:40 -0400
Received: from mail-db8eur05on2116.outbound.protection.outlook.com
 ([40.107.20.116]:45350 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqO0-0007Kk-J3; Tue, 04 May 2021 04:26:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPcroBsUuj+BXHjYymTkC1Gs6k++E28YD/L8nxalokLMVDGLJOvkm2fi7IEfEtWCMUmqKxS8yF2hXNuCDmNAWTIBkzkpAh4fJ7cQA35X71LUPgHau0G05JdSn7FXdyIJcbZsxnzUPG/1WSakILEMIbaMFZRtp1i00jbVub5/Fsj2P7T/1tkk/GGyrD1pKwiM8k7rosYjUeIBh/cFTu49Hjuq8/kI4bOQ4rIXXT/ruvOIrVPGMX4QubT6Pm+T6OYRHXdPsMO3MYnfBgs4EuEmTRZPqWkC/EJ0YkTPjDO/C+6248tRWl6rsIuX+AN4N+8KsJWoWU/h/m5Y3UkUNct1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvmnDOR9x/Zvz8zJ5Jq1asZUkH4HLw+fQnWy+fGVoLw=;
 b=ZBmBJPSApig8y1q/Va/gHBx2mtCQwdaw8nrJcrQXFy0/ZmfRT+oDWui8RfNP1B2Vkt6wcrHomgFqBMJiDHWu2QiXRD11xiY5e052zv4INNo99Pyb1xgZXQ6TSI4Xu7f0gObBcjvTGn3bHkm4pKtjVw4cITkvj2hbg2cGyJOD+UPVuWr9btaEdGoeKM2pNs+BgI5npuz+BwXxa5AfofuRYh0kZVU9sbdUVJHK0Poc42vrvTThO3sPOUKTKEOM5vwkXx8p0mETNMqGdANsFpEL1giK6Zegsj7tolpHGEFDPFxJXuAz5dG+kVdw/KLK0aj+e9KfCXLlxoQknEdKje/8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvmnDOR9x/Zvz8zJ5Jq1asZUkH4HLw+fQnWy+fGVoLw=;
 b=OWnfq3FwlMx6ISLr3m58NiGIlE9A8d5alBEbFDeHUGEzS1PZ0nN9aUFJMDTp0Bq+JnkZnt1WKA1a453S9KjuYLU2yu3SxM4PPTtw79NOdLVHccuJi4xJY0OF6z13zlg9vZ+egKItOyMLGh4nv9p2a0P3K0e1spdZ92QgLtEdQAM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 6/9] test-write-threshold: drop extra tests
Date: Tue,  4 May 2021 11:25:50 +0300
Message-Id: <20210504082553.20377-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40e841ac-d546-40c1-56b2-08d90ed64831
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33812A69450570FC9A4D7315C15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qDst5Xd+PMKSJ270UaBexRmqSOs1XJfq+wqWalvynG2e0t7SU21d+Uqu3DOImdolMUXonzy/yKkI2JkBpTxhPh557J3BUNLoBaUhDolaOVG8CtP04eK9YyXeUnU1zIbdrUfk6OoxcVBBUVGrqKt+HCO1W0n99NvCkK4RL7oMLM8qIEJOR8yysjFUm0rxIdSX5n67TCQZ8DYiP9JDwoRTLvXzRaKRs/TgNX8tSMUoC3sT+QkcCPig/KgO2+beBp/hUQu8AmregZI6bfm2y4kqAQuQ8LzvbmhukYT3G7xUAmyVRuoFZn1RMC2/dnHftA+iLue5vRBlAJo6pR5d4fitYl0JkA+l8EJNLcXXU9G9GbQLDHKGJ8gPpc8LtVFTsw6J/qHDmrUl7FPnDr8bvEe2PmbQCV5gTPT1O68SeAzgAwMcaUbItZqyZQiz5/nSgnP0/iWKHP0xAmGQwDq5Dso7YPgdOQtKKumc1d/R8RNUQF5dZ2nDIBmsl5zaSrQxl6QOTFWRH+VuLmgf/6H0z+y8Rnoc4+3hq6BGdIn8Qh43yP+46ZUO37mUhnFOn0jPLpNQg8TdAc7nEbyKb3leyE0Vp6wocDiaXKej7ZFeuc/Huun9UTeu/QdH0qnlnaFeVtJmN2SUoci5jQ0AaIip4MTqdv8PuCtH1WVIgzuUt+Jpfe9eziEgJy0tjmoZ3o5KQbh8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kvH/kFU3f+s/l0e2ZZ2WvfuSXh/QNmw9/keLcLHIe3rgWJo4J3lw82Wkcu/8?=
 =?us-ascii?Q?G/4j79LSexQo/rpFxp1OV3KHHbWDEDCtdp6Nxgd4rM8L9BOAjXpWKeBOoAnh?=
 =?us-ascii?Q?fgDejbSkSGb5rYR9M19kT1E3aec75AmFcBkPJWrfwjQhduuexIm6oNsBIj/p?=
 =?us-ascii?Q?e2EJuFk+edjrWrO5yqYkwpTECLz19mYTxCSYFZB7xAUICNxuYcY6Ysi57IoI?=
 =?us-ascii?Q?piwolLuDa46q2zLHnff704zdh+Cbl1D+o7fHAekhsTkS1tcDs3TKPCjBSSVJ?=
 =?us-ascii?Q?IS+7TsDWcO+dHl7P3SPzqBZX2HdNhsilNcruL1pKjA40q7E1E13dN38TY9x5?=
 =?us-ascii?Q?uKlhyi5jGrhKKBAObT1R2ykMeKOHOFrtiE5oyHDttSHOYzY7CeyPEOD/MgIK?=
 =?us-ascii?Q?cFLSzipX0DewH0fPE81DK2JQXE5xtimiWDAOJqKdVwn8cDAgqIcz07GVznMS?=
 =?us-ascii?Q?PzB1Z6jayUH72ok5pmT1g1YCeOuH0Z3CkYfq8sKR2Kt1cGuIE6FMcGhzSQW3?=
 =?us-ascii?Q?oxqlpm88fh2t6eEp+dzGikIftIpA6rgTgLEe0frjbk1c4fXkLxUnS+lsLJ0x?=
 =?us-ascii?Q?1b0fAy1xRODvHcTt+XZQp4V/kBnMnnsRfcZkxm1qgIeSWw5kzgSwp9S/ka3D?=
 =?us-ascii?Q?slWaHTJIxrZ45pAZ3fj+hGCEghcc5BYvlP2EFaMsWDvvi5Z57mDWDpJH5pfQ?=
 =?us-ascii?Q?mLAI0DjY5PWOOO93KH+v+XA8q+eRpUAMek//Drr7FUNQFz5vWGv6z2KjS3UM?=
 =?us-ascii?Q?GcBWPz3syZNuvrFF4clf4LUEVbYl/QN4xTkg0gOnxMU79NC00zuwc/4eCZpo?=
 =?us-ascii?Q?sCAUadR8Qi3i+DXWCQIwoXiOM07rw8TNojhhubgSHQ8iF1UazSeMfzJcC+Mi?=
 =?us-ascii?Q?D4Zqh75HmvHAO2vD+0OQcfUP9FJxQ5Icj3cEkf/+YGEZgjCpsMapPKJehoYE?=
 =?us-ascii?Q?CAtYvK1K8rpZe21pA3DKKp1f8Eq9asSMi+v6JiCuKUCDZBB8KcvpJBskFtFo?=
 =?us-ascii?Q?/Hkq+GJcuOqnT4rpGbmcCcNlF1fn1BYK+oVNqSmQI3ETm5mh8hyxoKircoU6?=
 =?us-ascii?Q?LMytQbX3QtwLfkd8Wf9ySnO209P9Qe7qGCKdT+UCQcyxj1hZq0CpQpDyG6Rt?=
 =?us-ascii?Q?0wecvZyYg/D0pFEUfDb/54YDpLYW7WRhAJtF0z5cpFC2HtywiFTefHt8OV5Z?=
 =?us-ascii?Q?s7jWmI9+HvEf8bNPMkpgGFBH2YwqNj6XuLKjzW5wRPmTU7AtuFpVgBrkljOc?=
 =?us-ascii?Q?lwvGFOQdw6NuWZnqRYmIIzHmREWMO4e1Zry1eSLlxYdcAkBuy2C0gqmVEabg?=
 =?us-ascii?Q?JQc82ShGJtHoS8Rt+Rr7P/fU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e841ac-d546-40c1-56b2-08d90ed64831
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:14.7783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uyr0vofl8CUcol+ZDVjCe2FCnBAPpqEMX63YmojghfVq7gFgRS0lurMfL6iGV8dRu85HQm9IeOtkdqs/WPtEz6RTSooQe8BFTeoRgVQCpdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.116;
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

Testing set/get of one 64bit variable doesn't seem necessary. We have a
lot of such variables. Also remaining tests do test set/get anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-write-threshold.c | 43 -------------------------------
 1 file changed, 43 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index bb5c1a5217..9e9986aefc 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -12,43 +12,6 @@
 #include "block/write-threshold.h"
 
 
-static void test_threshold_not_set_on_init(void)
-{
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, 0);
-}
-
-static void test_threshold_set_get(void)
-{
-    uint64_t threshold = 4 * 1024 * 1024;
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    bdrv_write_threshold_set(&bs, threshold);
-
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, threshold);
-}
-
-static void test_threshold_multi_set_get(void)
-{
-    uint64_t threshold1 = 4 * 1024 * 1024;
-    uint64_t threshold2 = 15 * 1024 * 1024;
-    uint64_t res;
-    BlockDriverState bs;
-    memset(&bs, 0, sizeof(bs));
-
-    bdrv_write_threshold_set(&bs, threshold1);
-    bdrv_write_threshold_set(&bs, threshold2);
-    res = bdrv_write_threshold_get(&bs);
-    g_assert_cmpint(res, ==, threshold2);
-}
-
 static void test_threshold_not_trigger(void)
 {
     uint64_t threshold = 4 * 1024 * 1024;
@@ -84,12 +47,6 @@ int main(int argc, char **argv)
 {
     size_t i;
     TestStruct tests[] = {
-        { "/write-threshold/not-set-on-init",
-          test_threshold_not_set_on_init },
-        { "/write-threshold/set-get",
-          test_threshold_set_get },
-        { "/write-threshold/multi-set-get",
-          test_threshold_multi_set_get },
         { "/write-threshold/not-trigger",
           test_threshold_not_trigger },
         { "/write-threshold/trigger",
-- 
2.29.2


