Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58E5B5AB8
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:59:10 +0200 (CEST)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXj1p-0001nc-B9
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiaq-0006iR-T3
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:31:16 -0400
Received: from mail-eopbgr70093.outbound.protection.outlook.com
 ([40.107.7.93]:54542 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiao-0006P4-KS
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:31:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpXdwbTuB583IpiEPttTC1LedUhg6Uw9a2lRt9S/Mm1+sNQIzSy1NVC9mBhIOfXHYETH+CYgHNDA936Ws04jQoeK+XfaV5/h6m51csIHUQ7Q3Jpjkshcyihizc9rE8xk1PV1cd7lwmDpCDUQK5v8g9S6WCYITVCWWFE9pl+rx65Cqfeq3z4UkLSz9ZcwMxk5TlsgcCrWAgeUTsJ5cm8UZoUmwVXMRVk8GylO96310QQjzdGn3HOhOkl1to1wTeDF2KTuDQD0yPFQWktMUJgyLmnXzoiQbuBrlKsULycL/CEw4DqfQ9YEzm0cVTELCnMj2iRvls0kyMeEps0RuXQViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dJa2Wlt+woJH/b2PK5qmH7Z8sywAkPUf1BDy3gafKk=;
 b=NWsxNICQn6iOt3sTBPRwqNx/50TJ9+RaLgRSrFNrM5h6wyyxRU/TAPtXnK90Xt1XRLvAXVBPJkcUEuqYyzyV1Hp0zEvXC+hNrW95yex89i66hPnnsonRxKnrqpbTYb5PDBMUdeRbC+p/m7Ny7KfF2MSSS+oOh3E7H2MvxWg3VUTa1S8Ovx/IVz6L6M1ARJiEFd6oHWxzmkHCHzN11xpG7+1wTiXUlQlQkyUjip7j2776PzBYtSNM1lwGds1NxNKoKJ5kRMMlnR5j1xu5x9GSOJCnomUwmZampaw48GVZC5F0R89dpE+TMwGtOMAc3lQ+1Ai/wH+H8mc35/fuO1mB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dJa2Wlt+woJH/b2PK5qmH7Z8sywAkPUf1BDy3gafKk=;
 b=Mn9W24pt9ozeyYMlUWl5VY2+EZRI1g7RRDeTQp2/eIqTjl3NNOBVeK+ljoefIrsFMu6J9hsDomN+55LuLNhX0OqA+12HC45pLy/YzTAVZ6rLN/v9ar8chsQmE0bDcMccTHkFEgLJUTWcQsWkjO0uzQ3G2HA5aI7f3oEdrOBofeg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DB4PR03MB9481.eurprd03.prod.outlook.com (2603:10a6:10:3f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:31:10 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:31:10 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 17/24] disas/nanomips: Remove CPR function
Date: Mon, 12 Sep 2022 14:26:28 +0200
Message-Id: <20220912122635.74032-18-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|DB4PR03MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: cd93a2ac-0d6d-4d62-8b62-08da94baac35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LkjvnkaUvErCQTKh9hwQqByVWnim8fL7iy66rAd7yFFduHaN8/6Fwm0cteSQhVBCM1cDRmqi+mNfdBCb+aQh+mKjXg/PIlkStbTTVtb+YvfBQzE7W4Ej1bMdUBlv+qGXVTE/MKWy/lsoMzdBdlirJKuZL1P3XhyQytr/48+MAYyOAMmqq3kevHnenefPFInexopLCBTxpzUK4YrCH95bpHte/t5SFVFp+USgBseR6l3hNF2Ccvi95M2OMOvtsDi7GfkUkFeE9cq1Xg7zqlo/42u6Et5+hCd4xxz+P/kAQn9YzTD2AS5O8XU2GXWbixgdetnXz/MdmESicxqFaOgI29FYxkH0CBtyrU48JF6gdMVOlnqYZme4KJmTDf2dRIYdoBYbcqBtzzUGCV2c7PH/a7mpKDAs1+LQV/RLREZusCNjNvC750O2KNnN+BAZ7hWdxLE8Jm42G5YLnTBuyC6mvLutSy/p8SZvbT/gU8dHF/d9EY5xsvfYM9l99log8GU5iWepxSxNzpIPKwXX/T4tqeh7D/mTq9fzgVwf9LvGQFT83m5tXe1WsI9kqhyRk1v21FmvP/uSF6OAbmVzZcKgPhPmH/EbLPd84yGcOf/tGrsQaU2gunarRMHpmqTGYlh3LMLCiIwTQOZkOF9d4Z2tqt1SKNUB55W7kgVqv5nN339SZ4CxmY9uCrjtZ/WIJJCO4ECsWFKFA7kOBq8Q0rvhQpw/rh8psCr+trkBziOoAL3tObRVtcPHXAd++P6NokKc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39830400003)(376002)(346002)(366004)(396003)(38100700002)(26005)(36756003)(6512007)(41300700001)(83380400001)(107886003)(6666004)(2906002)(52116002)(8936002)(2616005)(44832011)(1076003)(186003)(6506007)(30864003)(5660300002)(86362001)(66556008)(66946007)(66476007)(8676002)(6486002)(4326008)(38350700002)(6916009)(316002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DsXaCcKU+/rZdJzDMvYNn0R9YQkRUuiyRjkJ4zwabtYu6ZH3U4AB0arM1CK2?=
 =?us-ascii?Q?QGkm4i6sDKwGjux2LyuH7FQ+R0GwLwrmk/pj3FiPPJQpGSTSeocWGg2Lt4QJ?=
 =?us-ascii?Q?lAmlH7zYc6a0XKkHe9b/saPsY+wx1L0q7UQ+6WpVORbBA8X+WLd8ofrq6hXh?=
 =?us-ascii?Q?9x02vSfQJ2QpIPtZ3XonPep3sgybPh/sg7mWNaU9QYhXXUx2+96Q9JZ9x2hR?=
 =?us-ascii?Q?PirUR91PPwKvNnPpwFWVECoAA05/YDM7haPCZhcA5Rhc/ac8Hnm7/VXpqpe9?=
 =?us-ascii?Q?6AVoKnz74QavMxX8n6c+JVivPOobY7o56VNMfMy9qnkQnnPI1gwKLPD67Dhl?=
 =?us-ascii?Q?ReGs6oHY6MO6lybVx25eh0Z1Ob+Lj76yKRHu/IZ2+ab7J3pRVRTgY/fka35F?=
 =?us-ascii?Q?FkzenvUAvDP1Q/XZBTeTKM4XIAGdeELst1IQhtJFu5FiVImN54XiSbarBJdo?=
 =?us-ascii?Q?t9FK/gYmZhtSbzhbMHoU8W9gi0iSJbIAVMuVWdlue1t2AogkM7gGZfdyBDCh?=
 =?us-ascii?Q?HCAAiM+mSwy4ZMjjIaAd8DF9VonZpVTKHyYh5/TS7iuSLelkvgzJeSxevz+A?=
 =?us-ascii?Q?DbO5WA+d0NfWXg+51oVEixQKMEi3No0ESMv/gAbiBVPGnvqqpq4RHELBKp6d?=
 =?us-ascii?Q?P+slmhsQGqWq6W3jTsKk/rNqfsk8tKisiUo+W00xyiygNS6QfBt5SrfDUUe6?=
 =?us-ascii?Q?gMjBvXACQgtTn2/DYVTfBhVr16zBCzebQ2pSIexR18bWMIBrMZPIpea9EJXY?=
 =?us-ascii?Q?xZMkblUb/Z0bSacQSs0hWFfWilG3EggWPxZKUJd6UmjpSX8jZWyoKpSGNZm3?=
 =?us-ascii?Q?v9O3yaayS3y+/WNVIUK1bm7siIdE2a50JbgYPQJo+5wjKREWKesfzE2VvVSn?=
 =?us-ascii?Q?TsfAgjL4ZZ8Gjq5NqMTRSuMSqNuR1hoJI4ZVDyVeTkHqfMI9AIfjwNFZZNav?=
 =?us-ascii?Q?awG4B4CjN81On2Yln58IQWtuf8ij3ndMAMDm7vkkN28IN6AlYCJ4aNpsUUG5?=
 =?us-ascii?Q?4YpHD0UQx3HIf1quHOmYV7lbS7cR2kR9yBu+dPCosqcA5RmKe3Ir5DVQqa0Z?=
 =?us-ascii?Q?cZ2YrkvNP2RLXYZ8GyOB6a1QgSmxSlSaOqOyHLGFn2ivPFfK2xxjPeH1yj3A?=
 =?us-ascii?Q?d8EwP/UWxTtzl/U+3PWmk4aB/99md22TVam5QHtIars7R5ZmJTOi1DbWwr/N?=
 =?us-ascii?Q?PHDImTMTB5ni3OCkKhe18kddO96T4qVDkofJVV+dOhBGbFLXliyBSmIZro7h?=
 =?us-ascii?Q?QuUxWktXRComnH5U2VuI3NyZEmusXdDm4XwjkkyfT4BCaMVXsbyVC29my0mP?=
 =?us-ascii?Q?IGRuTYkLtGR14VKmuFtK+I8befTiaRqH/EEwazloFbjQfeUJXgKm2tOZJ1O6?=
 =?us-ascii?Q?HIHhKO+obKNL+TBzY+99XJGKfwYj3RD/PEeklx76fb4vZsPfeTCMqK8kS7cN?=
 =?us-ascii?Q?iEjlWqMmNChYbEX4h3npp8qRzfKcyi7WGgrw0ypqQk/tPOiBc6an/AC8JL4H?=
 =?us-ascii?Q?vpiIScQuObIC2hi0izDejFje7Q0wpf2q5SYpiumrKNbj3ffd8pmP9PPQOb7F?=
 =?us-ascii?Q?LkG0G3dz8VCMoSJUXsZ1lKPF4TvjhptDLiQ06aujzwi/WqNRQIu2BQGIaqYF?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd93a2ac-0d6d-4d62-8b62-08da94baac35
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:31:10.2239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKRRvxUVUfEQi2CY65axOO10YLeMNnc6kucQQ5Zt3TCVR8Hqd3FUbsYB2LCJ/ZWUkrOkuYaRnep4KZ0AikzZ78gv08qwHXYQRx2DkotQdS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9481
Received-SPF: pass client-ip=40.107.7.93;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

CPR functions has been removed.

Before this patch, we'd been calling img_format twice, the first time
through the CPR function to get an appropriate string and the second
time to print that formatted string. There's no more need for that.
Therefore, calls to CPR are removed, and now we're directly printing
"CP" and integer value instead.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 110 +++++++++++++++++++--------------------------
 1 file changed, 45 insertions(+), 65 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 441204bb84..e269f853e6 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -519,13 +519,6 @@ static const char *AC(uint64 reg)
 }
 
 
-static char *CPR(uint64 reg)
-{
-    /* needs more work */
-    return img_format("CP%" PRIu64, reg);
-}
-
-
 static char *ADDRESS(uint64 value, int instruction_size, Dis_info *info)
 {
     /* token for string replace */
@@ -2774,10 +2767,9 @@ static char *BC2EQZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *ct = CPR(ct_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BC2EQZC %s, %s", ct, s);
+    return img_format("BC2EQZC CP%" PRIu64 ", %s", ct_value, s);
 }
 
 
@@ -2796,10 +2788,9 @@ static char *BC2NEZC(uint64 instruction, Dis_info *info)
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    char *ct = CPR(ct_value);
     char *s = ADDRESS(s_value, 4, info);
 
-    return img_format("BC2NEZC %s, %s", ct, s);
+    return img_format("BC2NEZC CP%" PRIu64 ", %s", ct_value, s);
 }
 
 
@@ -3403,9 +3394,8 @@ static char *CFC1(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CFC1 %s, %s", rt, cs);
+    return img_format("CFC1 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -3425,9 +3415,8 @@ static char *CFC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CFC2 %s, %s", rt, cs);
+    return img_format("CFC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -4889,9 +4878,8 @@ static char *CTC1(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CTC1 %s, %s", rt, cs);
+    return img_format("CTC1 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -4911,9 +4899,8 @@ static char *CTC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("CTC2 %s, %s", rt, cs);
+    return img_format("CTC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -5745,9 +5732,9 @@ static char *DMFC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMFC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMFC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -5789,9 +5776,8 @@ static char *DMFC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("DMFC2 %s, %s", rt, cs);
+    return img_format("DMFC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -5812,9 +5798,9 @@ static char *DMFGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMFGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMFGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -5883,9 +5869,9 @@ static char *DMTC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMTC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMTC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -5927,9 +5913,8 @@ static char *DMTC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("DMTC2 %s, %s", rt, cs);
+    return img_format("DMTC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -5950,9 +5935,9 @@ static char *DMTGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("DMTGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("DMTGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -8148,10 +8133,10 @@ static char *LDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *ct = CPR(ct_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LDC2 %s, %" PRId64 "(%s)", ct, s_value, rs);
+    return img_format("LDC2 CP%" PRIu64 ", %" PRId64 "(%s)",
+                      ct_value, s_value, rs);
 }
 
 
@@ -9089,10 +9074,10 @@ static char *LWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *ct = CPR(ct_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("LWC2 %s, %" PRId64 "(%s)", ct, s_value, rs);
+    return img_format("LWC2 CP%" PRIu64 ", %" PRId64 "(%s)",
+                      ct_value, s_value, rs);
 }
 
 
@@ -9665,9 +9650,9 @@ static char *MFC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -9709,9 +9694,8 @@ static char *MFC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MFC2 %s, %s", rt, cs);
+    return img_format("MFC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -9732,9 +9716,9 @@ static char *MFGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -9755,9 +9739,9 @@ static char *MFHC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFHC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFHC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -9799,9 +9783,8 @@ static char *MFHC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MFHC2 %s, %s", rt, cs);
+    return img_format("MFHC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -9822,9 +9805,9 @@ static char *MFHGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MFHGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MFHGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10391,9 +10374,9 @@ static char *MTC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10435,9 +10418,8 @@ static char *MTC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MTC2 %s, %s", rt, cs);
+    return img_format("MTC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -10458,9 +10440,9 @@ static char *MTGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10481,9 +10463,9 @@ static char *MTHC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTHC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTHC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -10525,9 +10507,8 @@ static char *MTHC2(uint64 instruction, Dis_info *info)
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
     const char *rt = GPR(rt_value);
-    char *cs = CPR(cs_value);
 
-    return img_format("MTHC2 %s, %s", rt, cs);
+    return img_format("MTHC2 %s, CP%" PRIu64, rt, cs_value);
 }
 
 
@@ -10548,9 +10529,9 @@ static char *MTHGC0(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *c0s = CPR(c0s_value);
 
-    return img_format("MTHGC0 %s, %s, 0x%" PRIx64, rt, c0s, sel_value);
+    return img_format("MTHGC0 %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, c0s_value, sel_value);
 }
 
 
@@ -12021,9 +12002,9 @@ static char *RDHWR(uint64 instruction, Dis_info *info)
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
     const char *rt = GPR(rt_value);
-    char *hs = CPR(hs_value);
 
-    return img_format("RDHWR %s, %s, 0x%" PRIx64, rt, hs, sel_value);
+    return img_format("RDHWR %s, CP%" PRIu64 ", 0x%" PRIx64,
+                      rt, hs_value, sel_value);
 }
 
 
@@ -13089,10 +13070,9 @@ static char *SDC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *cs = CPR(cs_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SDC2 %s, %s(%s)", cs, s_value, rs);
+    return img_format("SDC2 CP%" PRIu64 ", %s(%s)", cs_value, s_value, rs);
 }
 
 
@@ -15244,10 +15224,10 @@ static char *SWC2(uint64 instruction, Dis_info *info)
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    char *cs = CPR(cs_value);
     const char *rs = GPR(rs_value);
 
-    return img_format("SWC2 %s, %" PRId64 "(%s)", cs, s_value, rs);
+    return img_format("SWC2 CP%" PRIu64 ", %" PRId64 "(%s)",
+                      cs_value, s_value, rs);
 }
 
 
-- 
2.25.1


