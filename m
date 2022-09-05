Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5FB5AD0E3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:58:58 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9og-0001cB-1b
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xV-0006YI-7k
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:04:03 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:6112 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xQ-0002ni-L1
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:04:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adTWG6VV7GRIvHYL3lXI3LJNhXKgDlM76jJSqYA9RWr5JDX+PUzjE9E0R29JGdo7QUo5BnPNNb/xmaS+WPb2n0sOmyH7VTx44+nEXyRsCvWFUqd8/fCzJRVUISi1EFo5pEpCG4rj1Yb2P1haYFpP9fCVQm/8p1LYGa88Q3HHVYfo7432gfuB0JhTp2NONoEtcecNZRFrURTZ7/KG2xv1utFmYDJooiDMlzsSOOuuWLUuAln1XlQMKLVJjp2cAz5H+48dUTU+dpcgLT4aurECMvZPHq+dG6q0TTqK8F5NDd+fJ6DZ3EzVOaJr0j+avyoZRXDCNtlO1Z75Hd+hp1fmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oN23c8MsblZENlGRXMRbzHZYMvuT1OWCYAaOKFInmgg=;
 b=mmvznLTmCeVI4W/4hUnMI0gWFeway3Bq71Gqw6kS16Rp7sxixiQiZjW2QVWsU4E3npM7FsY3BYcvtsJG6dpqxFzwetYGACKSOLkwXp05NW0xSpi7aa1Lz0EQbxJwvDQWKR/OFRWq9Fnv870zB4su14L0KDcVKqNANz9rc4adFe9Cumx2ZrHy1I2UbX0BmmECu/sEU2UuUQ/+a9HSR83O15bLkwKNRdDgDdmMgIsBxpWljySB4LDqre4u7jC7Y0/5mqpUVw14ukc+ifXc4DwzztE+l4jh4BabM9W6nzzzM69tqQMfB36vofkL6T9C8nyxy7zfkQf0yk45imG0R1JwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN23c8MsblZENlGRXMRbzHZYMvuT1OWCYAaOKFInmgg=;
 b=mbesRJZ5Fdt5fFS1271lPhdlq5YCISL/oh+1jsHg+82XsDx7iQuPURhS8X4+zMF0GoupTAH5J3ole3hkyte4wvDvhBbjawTaenSVauwiMEgaK6kfDGAoE2nqUlSrEL/xVSQNaM2MEi7WvPvFZlYRIp842HaDtQxVH0Jo6hxL2KE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VI1PR03MB3871.eurprd03.prod.outlook.com (2603:10a6:803:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:03:54 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:03:54 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 19/20] disas/nanomips: Add struct keyword
Date: Mon,  5 Sep 2022 11:55:21 +0200
Message-Id: <20220905095522.66941-20-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f6f631e-02eb-4089-7c28-08da8f25f0ba
X-MS-TrafficTypeDiagnostic: VI1PR03MB3871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sxEQ7dEaBau8Ah48S8bi5gogQeRQk3qMKnK6Hw41VULj829oBjc9JIwNkLezIF9VBdPBwIlw0i5PVz6l20mU/N04yTmjYQ2+EUbIv79PUZCjy761ULDAaFOfey1QTVcolZHJwbWJYQeFz+ycEf9GfuFXa9FB5kGwEjPxVTNsz07MAIF5UfQVewo7o8SJAkz281BQqKRkknN8DFv1jVFRI3a55lAOnyNbXgk7/iHy55olX/q0DxZz+XbnFMUTn++5bdF8TqKLkW9L0PDVgZ+gCTDSWIt4VWnt3uuEQ/C6whGMDiyjwI/KaTsxmnJGB59DEL2sSKI4gitf4Lxd3o1BJOuufLVRcDzMMVaNfykMaWObENZhvFEpMLs8pl9AxDVl4kioQ2FvezmdbbaM7HRoBsq4oBhr+RtEkaXw0Jggkzuq+PC+AhzIlttLMMH6rSD6E5sO0Spacjjxd6adI7Vw91H5I3B/W8YoiW0UhUZypMHaQp6A1C7UCl1qiTn3aiF5tcFUH3XnmlZGva3C3PqRb/7qWGW4n70VQeOAD9HTNif2Z2UVvJaq5Jr3N4LijSBk+XohDmqT14ti7CuMq2zzWBYpiOjr+HN0cxIn1en+1QqNlRogNa4UhkAjrKExsc/NdMs2HtZyB6/V9qvRRLjwvInjCpkkIxn4Qbvj1rdNRnfvscbrssEDbxBg3TqIjKrmYCrt1nSq9bwqNKzl9J+kfpmtT764C3kjdzixx3IW4vMz+1EgAQcH0P7cIDlGgL1X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39830400003)(376002)(1076003)(186003)(478600001)(41300700001)(6506007)(107886003)(6666004)(52116002)(86362001)(2616005)(6486002)(38350700002)(6512007)(83380400001)(38100700002)(316002)(26005)(6916009)(8936002)(2906002)(8676002)(4326008)(66946007)(66476007)(36756003)(66556008)(4744005)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ivWwm2f3MQN9mu/Gpjmays4d0QbcoVCEfhh2j9EYbpKHtrJKDWSpYqlwV672?=
 =?us-ascii?Q?+4XJDveP/rl97pVeFCQLWyLH7jWUSjo6t06AB/HtLMr2PSNZQVrIQLtSNwuo?=
 =?us-ascii?Q?MZ77cteNcIZZUrDlYZ8++96nhbp3+NPCWnib3Qo2K4R4F0RXH5KHoI5k66j5?=
 =?us-ascii?Q?5+4PZaa/C45ys8Hg0rY3XFO3N4g3+5Mr5hNOvltUnZ3crkFpS7I/NJxpP0//?=
 =?us-ascii?Q?Z0FIVKguL6Sw7LpeAJ4HUDyxnlAGq8GLm/SweDPga6AqD64lSD3fXS2yd+om?=
 =?us-ascii?Q?Vda2d0i4bPJdF7jmPQIdSx9gV5J5ZhyQg47iy79gpcjBu5SJZd8yaDji3/mJ?=
 =?us-ascii?Q?2VlthyKmSXnBS3L+b/9PT7A44Py8IKviCQdb6sppbBxXpPcK5J8SzC6UutNN?=
 =?us-ascii?Q?836MdXgGqZmpurQFbeEfwHtbEnJgnIpN2hhmGfZxXSUVPVQ1Ad1UTgy5uMRS?=
 =?us-ascii?Q?uOcEcukymXLCtrBvgjSsadk6tOs7SDnHNBdgDYrjtemAMDArMAIqAcfdjl0x?=
 =?us-ascii?Q?8R91PqKiXffIGs/WJwXt1hqtb+uGMp/v9JeAFIceK7jtv3jXTfypB0Ce95Pw?=
 =?us-ascii?Q?4UgTAvdBz1kXajsIGd34xsF8lCSxKPpeSUtBzZobIOmGTZXuKwiwdmshsCAw?=
 =?us-ascii?Q?cMvxm7oZN0fMCCSHFGuQNKluM3KmgpFq1jP38gga2GluroLPGY6KQfTk87hn?=
 =?us-ascii?Q?tt0vfgEFDFucDYuWGli2YpF7xwH7HNnSUtK+yfV5TPpS2JMH3Qbn+Sk3pZy9?=
 =?us-ascii?Q?OjDwm4fKPwqWt9CN3J1PLvA2f6ExCgKfubpdsAYf1aDb8IyHIlTskv5UixyO?=
 =?us-ascii?Q?GGpGFY62jeeSDjDx50bcmlpBbXBSpqFgUS/WNX5T+rbJ7aujiSO8k2CH/szI?=
 =?us-ascii?Q?xx1Y2SIFwom5H6C0D8MjrhQhJ0FOBfSbfTIIsZhTAmLoQsZmxuo4oy12ITFc?=
 =?us-ascii?Q?35GiSM5NM7esZgG8RRNfGhC6bofCXGBVtNtOIuTDUZPDffnCmzcnROymjnIp?=
 =?us-ascii?Q?vVVsp2OE+ZYxW6M4ft7Snf7Uy17f3G97lT/c4QJuJKTLdahH/jkLQto+Y3v5?=
 =?us-ascii?Q?kEiqZr7yWOurIW6MloDiDSY5BSDWDr1o6RzNMJvwfAhXbqZLr8qTaX3cKgsU?=
 =?us-ascii?Q?fwRRMpEcyMbnO9gS8PIZA2tsr+94nG6Vo7tfFDTxtf5xRFKMCaw/AklsXRGl?=
 =?us-ascii?Q?ysKwXLTyOnn+Oo+qU9z/K7fQfj1WetpW09CCSrYqPrZU0K1tdqgQTia8mfdB?=
 =?us-ascii?Q?ralPuSqAGOY8dMuzUbGh93NHtRtTHCn0RwMeIRM7JPnIAXJdaPyLlcqZvBvQ?=
 =?us-ascii?Q?2LOK2ZZW+/d8KHSwDqaPIdpjyOsZfD+INIxH1wqTkVgz2PklkpaW/BkGFnlg?=
 =?us-ascii?Q?KS8iyXqBCoCedN6EklsiW24dNg3KhPNcXQUP7LGaYVm96FLMM0jmPOyt2sYK?=
 =?us-ascii?Q?SbHPPVkTC3Bxw/1MhHzDfH3t6mG+NosFjI2jBCUfIvLLvD7Ygvd4zaqHGyC3?=
 =?us-ascii?Q?yAAK8BzXG+JAVUX9N2bLOtgafwub/alLpYLy9RMbsmTlCuxSscl+UcgZaPTC?=
 =?us-ascii?Q?utU6+rOLgMHOnKmwgx/CfYAaNPloex2+2DBhQD7Ps0QtVM1Ya7t7owjXSt64?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6f631e-02eb-4089-7c28-08da8f25f0ba
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:03:54.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nePPwBv/aYc3UTdTlr6VcsUQyxS9k0xhHMWnQ4k5hR505KI5LdpFCLX3TLZISNAkmDNa87SiVASgMO5PwbgbV8R1wfNDLqmPf/f81JclDp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3871
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

Changed the type of the table parameter in Disassemble function:
- from const Pool *
- to const struct Pool *

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 disas/nanomips.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index ab54456c2e..7315484464 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -635,7 +635,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      disassembly string  - on error will constain error string
  */
 static int Disassemble(const uint16 *data, char *dis,
-                       TABLE_ENTRY_TYPE *type, const Pool *table,
+                       TABLE_ENTRY_TYPE *type, const struct Pool *table,
                        int table_size, struct Dis_info *info)
 {
     for (int i = 0; i < table_size; i++) {
-- 
2.25.1


