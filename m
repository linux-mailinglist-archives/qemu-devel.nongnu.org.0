Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CFA3B5DF5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:28:11 +0200 (CEST)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqN0-0007su-Au
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxq7c-0006oq-Ij; Mon, 28 Jun 2021 08:12:17 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com
 ([40.107.1.131]:39798 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxq7Y-0004eW-Ii; Mon, 28 Jun 2021 08:12:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgD5zsZrRrEKnxbcIAujWi0eOTqHwtDj6pn4l5T6iF96xfedy0W/DbPPRPV27sb/ESKRM1xfEV8V2MeA1z/2u36MYRIh1sd5C8ASRi10mt6ubQ5bKf4voKKCfH1WCOCQa1fPm/r+TDW6Dt7ryvMUpGY46TEJ0awGCVhWXVKe+jpIt4hsZoYkUjzd5xutlcHmlNftSaPZDChLwf6YMsDpN2+ajXiT9mMNw84fS6fJHAOxg3IsGrSsKtwowsmrmNPqLuDe97pENFtqoxhd9GnWoksbU3bp1T8Y2K3NOk1qPTI9rsFXC8buA61tPCL1tkbSEXtRdhWtb9jaB+yjL0nLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRR3JVQjJURvT23v5IFZP5kODoBL+9OMnobhA6WoqtM=;
 b=MG37KBJIg9o/k1P9Dvb4X3SdNEuacIXJw2kuO+UBaj3apoFEhri24Zk2HAPq34MGw5MePndoQlg+0htFQEfetqZWmylPW7z1b/rmYkcf02z8nkVJpEfYxeexola5JPkZQAd0YDdEHst5SxkOimyzcFkEnxTMi7uyrkG2XyURfj4XvZG4hU0Y5NAo/zx0M8uvMFf3d7zmmYLNr6oJo7Js80gZj7+7b3qOF3XoU1BWDya9o86hTVEs6A8eLen3dX3Ax0sUdB1TBiTcWps+EZSCzWbaT+JPzqb7Svr9u/cqVNEwo5VdvPkREsv09WDDfIshAOS0Qb4/Uo9YCW1rych7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRR3JVQjJURvT23v5IFZP5kODoBL+9OMnobhA6WoqtM=;
 b=SEZ4i/Fq2siZAjueBXIozYolpCX2OkNBltaFLIKhLQQAXYcm/DxZm3CMJdnAPC6Tc2UHeFuY7QCZf3FPRyMsozPSjU2eVV+pj2jyO98F04GsKxIUcAspaqnzA0oDLSxTyl6flvTuJjOXCJY8rkY0SXLHxOFHCr2fC+gQ05PdwaU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 28 Jun
 2021 12:12:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:12:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, stefanha@redhat.com
Subject: [PATCH v2 1/2] introduce QEMU_AUTO_VFREE
Date: Mon, 28 Jun 2021 15:11:32 +0300
Message-Id: <20210628121133.193984-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210628121133.193984-1-vsementsov@virtuozzo.com>
References: <20210628121133.193984-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::25)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:12:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c8bf32a-0bb8-46ba-3556-08d93a2df0e7
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16523CA1CB31686D3B0B28CEC1039@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mo9CnR5yoGasOsBFXAb+M/S77NKpGRJs242YtfFPDCZUU1JYij/yZZFvSFi5EYkOIXLKOvkR7Z44pOWHj0GnYiTumHJpFTi7TViWlyGBfq2+aqCoYl66CbhEwz0CyjL++RNe8mExoltZ7auiPpfMNhy2Dmf9XDz6w42uvpQMPJEJCPL1If93QZgqHEXIA8AedmezLa5Lazl1+VUFFHRUpebtjDAFPfYAG/R0BrQXHyv2I5+XYKAAdyzBArDhLeugL9RyU9Fmx42RNCkWnfK9X4NEZdPEzasAEdST1qmJSFl5+zH9tEscY8/HMM3wRpB4wzYAjdUa17eTiOhMrS9EH5F+SNRt8w4FlK9oB1FiMoL1ify378yZB7rMLL5wBWRa1LJaO3sp/yg47/xNbbAqJUAMVEGUNp43eg8jWZX2pptv8twXjcuVRsSxXlxOXJhIC9MJUPlW7/+J4I0lBihGdGAQzbpysJS+Lpp5Xb/zJTJpAuFA1y4SaYWMxpdiEEUMkLv24uKgkslYdqJPG+pf1LcRZawRKVd3GamaQwcicxfqkeMs+oumGDN386dhYnMSd2J35YumbWogTLdWrOeabDCsn9DUqnxCvnwrd6+47eIplWvE8wL0Y3yU7i+QYm28tFLO9OTEg5TQDZ/yOGtActNmzNzplFiIaTrwbt1OmeCfQHqhVEcI8aZXCdeJ/LST5jNxqGCxNDYdxu0Vt8OaI3baUvmQ+gShjbmBRivsWggllVEUdv+YcKH+vT/2JnKPuaFJhRreg2aP15dd2PteEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39840400004)(136003)(66556008)(66476007)(66946007)(186003)(16526019)(1076003)(6666004)(38100700002)(38350700002)(316002)(86362001)(8676002)(956004)(36756003)(6486002)(6512007)(8936002)(5660300002)(52116002)(6916009)(2906002)(26005)(2616005)(4326008)(6506007)(478600001)(69590400013)(84603001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FLPCW2JrLb5QOzDfqtHNGBIK5OkQ3LaMCyke9KEe7GeWxRH81sobtEFuWCOZ?=
 =?us-ascii?Q?aIDhrPdeUhidLQU6hV62Q5ES5+vfjizUufOCvj3CVK7hEngsOJ8zzzLq+Bxl?=
 =?us-ascii?Q?dzA9m54BW5wPrM6fLeUskH11sUAn2NZrkP4M5IVGycqe/GeM/pLAeWYXQv1R?=
 =?us-ascii?Q?f9ePEirtm9YkwYxlgGNy1NamkgOSys+rMeNYtBUuM5BgmTKUqPdcACWEZNfE?=
 =?us-ascii?Q?eEAkguFdHEQJVqOT2yvhgWktFkSOLzDUi2PQCtMoXs/M2tgWyN9GxxYFAYOk?=
 =?us-ascii?Q?mj0iLtcbhQWYgmzGi96iBgcOEIb6+Nx24SgBe4UMtB8pzUxga2QsuQRbbzdL?=
 =?us-ascii?Q?BepIRKqZ4ZAOQH9Su+Uek5XGN8DQ7pZFRSuxP4BHzhR6C5Dwy0ETQCfpW67n?=
 =?us-ascii?Q?/W08w0dssqW+lOkJOFctqG+b3T9Mw6Ed0zAaHSegM2i73eiyfhoSWcN143Nm?=
 =?us-ascii?Q?UQ1KTRaU/mjOoO9twtopFZZNFriQIf7fwRn0ljuEX5r76yMPayngg8wReG+n?=
 =?us-ascii?Q?UnLZNMLWvsCstaMs592ZcheC421n1JIauIMfi7NLIpvr21ERjdL6vppWUN/q?=
 =?us-ascii?Q?T/yE09qJvIXW+itn2SThb2Wq7IAZngcOfR4nAJ1aVzZSJrS2VDH63tfYUMbM?=
 =?us-ascii?Q?V9eqLEomjShgZDcq2EIGg8W+2PHDVTPjzY2Iqst9+jhaVxNRDLQCzga6wOlT?=
 =?us-ascii?Q?g5n5Oph7NG5Ek3JseCLcSAKDP/57hIU0MhDgkvW3dFYRgBSVkfXjyTXmDrFk?=
 =?us-ascii?Q?nRGpwPCObBShSQ8IRpkBucCjfp+5Eq2WvJfjdpZE1Lfv72CbnEsa0anwcJ9p?=
 =?us-ascii?Q?BGBCNXJgs+fXdsVy3jYKRBeWgLaq7DvdlCZBqwFDNRMOBnwWAGR/BwnmgomE?=
 =?us-ascii?Q?/G5DKjl1ehiAG7GsRfxijffOvwHF/9UbwWbU5D9y4AQ5O6im/LnQZoNbZYr+?=
 =?us-ascii?Q?TTvBTgFRWA/ZUNoGxvjWso7FQTEUFuP3kpMliDV0ny47otaJwc83sla1D6d7?=
 =?us-ascii?Q?bST0nhaju9EMInIH0iF95Q2vxHdr52LR0jAtEFB6fKeCSkDXQPWZ27PH75ih?=
 =?us-ascii?Q?uw9znNlEADeUf2Sp9UniSwkkHdVVKJpkkf8KjDe25u6cCer4iaKJ+Ky77huw?=
 =?us-ascii?Q?rNEJMAXW93Bjcxy20m6mHzzT15bxvjhUkGuDbtcNGYTvnsd611bwQl/YyGvf?=
 =?us-ascii?Q?Gj/Z1nd0Mg3CrWqH7BOqp2mv7Su3PivxaP0juqjHLTv+ewzGp6sQQiafwXVh?=
 =?us-ascii?Q?aFZ4WGOYG2cpovdV5L0JsAsP0wOSrHjhh/EBjcDlBnYhA3KqyZ+YSkEKIHe2?=
 =?us-ascii?Q?ooVemmCIJnTcawcjYnfbBj7O?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8bf32a-0bb8-46ba-3556-08d93a2df0e7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:12:04.0802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCCJIAQRESeqmn03h2Qjavq99OkfB1QVYufFPVG0zS8+m0KDgEQGj2KoUgQcl/bP1JiP8aMkkePPSURy+8Y2yrinwCcEtw0jVZodZaYaDkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.1.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Introduce a convenient macro, that works for qemu_memalign() like
g_autofree works with g_malloc.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/osdep.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 0a54bf7be8..e3a62cce89 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -370,6 +370,21 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
 void qemu_vfree(void *ptr);
 void qemu_anon_ram_free(void *ptr, size_t size);
 
+/*
+ * It's an analog of GLIB's g_autoptr_cleanup_generic_gfree(), used to define
+ * g_autofree macro.
+ */
+static inline void qemu_cleanup_generic_vfree(void *p)
+{
+  void **pp = (void **)p;
+  qemu_vfree(*pp);
+}
+
+/*
+ * Analog of g_autofree, but qemu_vfree is called on cleanup instead of g_free.
+ */
+#define QEMU_AUTO_VFREE __attribute__((cleanup(qemu_cleanup_generic_vfree)))
+
 /*
  * Abstraction of PROT_ and MAP_ flags as passed to mmap(), for example,
  * consumed by qemu_ram_mmap().
-- 
2.29.2


