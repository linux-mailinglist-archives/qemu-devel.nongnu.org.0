Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9424544FA4
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:43:59 +0200 (CEST)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJOA-000139-LU
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfW-0002B2-Cf
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:29 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:41250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <het.gala@nutanix.com>)
 id 1nzCfT-0007w0-2Q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:33:26 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25964FQm010057;
 Thu, 9 Jun 2022 00:33:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=proofpoint20171006; bh=SgdqbDOFodEcUcSC6wl/6KpFmB82pJiFuaR/ner+dVA=;
 b=0NKMZzVEwVoovhz04IgxQTKP1ZtwYqSPAGQpXnv2xradF6nIw6WtsrNxn+hituxfB+k/
 bi7s4B+K3GANYFkr98vC40RcfTQ2vreKSzZOkA1Z9aMu1BZ44/dkk8/k/Yq225ga8aGR
 M5ZiXVNQNoFzgAe3jGCz/0RCsVgUzDBezxvzn6b99DaDq1yLOBdLAHFZHD6dVG318vNi
 a1XfCls7AXfnThFlYcmH4SK0h0qaDPjiTyHJqWEihz0w123dbM90HZp+zjmDhg+XvYQ4
 3dB8Vu24bWMt6uJXGnjW4QdqtcT4XfBwsjcjr5j/W1dmLBz29phUV3EoAhfyVP0QQ5B4 cg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gg6fha4e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jun 2022 00:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZR3dxSd4BaVwHapyfpn7j00bBED9b1WXU2qXWnauH46aqzq0L198PLfzIjUBTNvLWRI4YipAiuKdAAC3s5QdAWL2L1Pm2LcT/Yamm3mxzCp+HNIdH5pyatFvcl52tgSDDc+qbPOYWiLuFc+VszwCtWvdaGYg0j7HSoighS4PPP/gl9df6QnwWfmah1UwgcAQJtwLTj0nSMQShOOBAhGDhRiVrheuAAmUaQ1vSN415FlUUcwRvkB8bAoMHyuCrjIVndFnA9lmLA/PJ0y2CCc2CYt/Gpg9f4sefoTTgBEE1tpGFDWAWt7q003wo5vS/eyxsYtJi8oCftpQUY4HBsVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgdqbDOFodEcUcSC6wl/6KpFmB82pJiFuaR/ner+dVA=;
 b=U8LQrjoDlr8DHaAwpcdAgYmcSVTwZnZxxQbZTE4bdrlQAhWKVn2HzNlCNCjnwBlge0/5mlUmE/V5IzhVA8stOKyzuLoLfljY0KZE5JkqsX+8JnwkgX/9eXUdkxLQZBQV4IxQuZgEOy05BsWgkJy1Fl/yOASSvRzRuJZLcl2fCFJRu5sAG48rnoeVNvRMqjCBxM8cA33WGCF0Tja8HQMU5KjQ10ysxGDlZfJjOsMabK8A4FAVGpGwJCOWC+bbrOFoGt47sws215VHgC72YHlrbgI4YEGHHn1UpI/sMAehwscCfjSWij2fQAi1DWVVMo2sQrHqKkz9U8qbwGfuvS4kiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BYAPR02MB4343.namprd02.prod.outlook.com (2603:10b6:a03:57::18)
 by SA1PR02MB8639.namprd02.prod.outlook.com (2603:10b6:806:1fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 07:33:19 +0000
Received: from BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f]) by BYAPR02MB4343.namprd02.prod.outlook.com
 ([fe80::1493:404b:3242:8e0f%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 07:33:19 +0000
From: Het Gala <het.gala@nutanix.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Het Gala <het.gala@nutanix.com>, Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH 4/4] Adding support for multi-FD connections dynamically
Date: Thu,  9 Jun 2022 07:33:05 +0000
Message-Id: <20220609073305.142515-5-het.gala@nutanix.com>
X-Mailer: git-send-email 2.22.3
In-Reply-To: <20220609073305.142515-1-het.gala@nutanix.com>
References: <20220609073305.142515-1-het.gala@nutanix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::12) To BYAPR02MB4343.namprd02.prod.outlook.com
 (2603:10b6:a03:57::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6926655-3f7a-47f2-f45f-08da49ea5314
X-MS-TrafficTypeDiagnostic: SA1PR02MB8639:EE_
X-Microsoft-Antispam-PRVS: <SA1PR02MB8639098B8418E22BE0CE77A998A79@SA1PR02MB8639.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N91vxyOOtQHcrwjy0nhoPyxrQlGap2/f3cEz18O2hKLrGF5A1epA9+U4w3ihYkuFnR+geEUpyEK4tR7PNMrlAJ7S38gfkt4YqHaRITy7bjEkLA+L6X3xLYJj2lchsJnF+xHw1bCsigaYBllwRH0blsKwA4AyITtZlyg2iGw/rQqWoRWsEUGFOmu1/YCT33sR3/45qo9EFk8vXwGPeRzzaMGUZ6RKrxtBKO5jYKN8O3/hRFS8A7LtCEAWCLaNcim0mr+U0qpDJQE4eRmbmzdjedcY0su6uNWaaNS8f55XFVdDQKpLW4qbhYZiZ749CywBkopqQ5xa4t3o6YElqJeTQPk3uBLJKe6fsitJlzZ1DLvsa+HWdeJKTaety7HsQyA8Qs27czQ7PN7oDxwmyb4L1dyTqZxUs3FEEemrqRFiBSJS+3KMppgZpr1HPUMVD0E6cg5SikWXil8lnJ8INRShqW8rokCZfIkP/KRef/PGb3OoBYbHexi5Wd+YA1Dh055PF4TGeZGHJNDzM++JidZldmTg7BMsJhiNFZ6VNhsi5rPrjifhd/uY/M8FyfKDWV68cyOdFU5afi0n5bxzztcWlXCIKc+O6q6wrFcNaLJhtt2d9M+07nu5HzXbrRUhyPkpZfZPow9xiEx417WxsEOc2oMhwJ7OH6NXN+kJbPJusEP9nsSvmDOmaMrJUHC3dK3+S34E0Oci76XUGp4fqVkGiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4343.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(107886003)(6666004)(1076003)(2906002)(8936002)(52116002)(54906003)(86362001)(6506007)(186003)(5660300002)(30864003)(83380400001)(6486002)(44832011)(38350700002)(26005)(38100700002)(36756003)(6512007)(2616005)(316002)(66556008)(66946007)(4326008)(6916009)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VSX/weg3BjGVSummcLW/MkhLvE4w5lzTRp0Dl6woGO5XrM7kddnCu+xxlQL/?=
 =?us-ascii?Q?U582LEcR6G3biMxjGtvipv5kvZDKANkBDorLDAdpPEE4gEIFk2GY40z4aCvd?=
 =?us-ascii?Q?/GQM56B2xyh/VWwhQ32FmY4FiulQdCiIVtyzaZj6ftRbmEm8ugssYMwlhXkD?=
 =?us-ascii?Q?Zhsnt2kywb07oEW7/vlZBFmv7r+J+oGVhQnu4wdu4j9nZyNcUhMt/k/Jg2CF?=
 =?us-ascii?Q?mF+fxnTzApUDHy7bM1SsV0xJfw+FLWtMv863Tsb5bfUkNem7ruS87jGtKYOU?=
 =?us-ascii?Q?hzHdvoeK3XYgMejw+et+Qux5Xts0fmw63tQH7qGuW5W4XcE3uBSPwHgdTgLG?=
 =?us-ascii?Q?T87S6AmSmOOwKhDVkNPuf0x+5z0MOuzX15jIQIGg1rEFMxcpPt2P4gmIUxGL?=
 =?us-ascii?Q?ds+HSTCONM03qSoKk3qHpnhRlxOy559Z4BSy8t3wG//F2Mr2bR8YjvlU0iVC?=
 =?us-ascii?Q?IQBiWmya2pOvYNy2zu17k/UTCvHUr8VRjQX00RV1IDgraJtpO/TuJZfiFqog?=
 =?us-ascii?Q?+GYA9PRcdWXcooeViU9B0Nyp783MfOjZJ+GQs4homuhAzzkCo9oe/N74n2As?=
 =?us-ascii?Q?KPN3O7pHdroze3JV5Lq4CFZAUCjgIk7ph3RYyQoTIzXhxxOvT1uMB3Qw9xu6?=
 =?us-ascii?Q?zu3NtZ2oJAcTAYrCirrRfdJQQUnqSTKjnmk4gQAQKl4TmAnnxm9kdWf1LPDX?=
 =?us-ascii?Q?l5QsdGmr6aFYZwpCqbnwXbSHbqqCMdfSv1qaUK/VjNbdWQD2hpOPDwUQMq6o?=
 =?us-ascii?Q?98fLQM5fRPv9cHRXTDSKolJ2f9hX52ZL1iQObchvEi8gahU8EcCVUieT0VCJ?=
 =?us-ascii?Q?+gkDYDppjlg2lhiwtlyGv6SuieQ22R+FEOKf9F2J9Ztgb90bbROkewq8SKzM?=
 =?us-ascii?Q?JAZ536IHIu0JHS1RbUQE/A67rwJdj0ppeBO3i6tSiS2vU4pvMKtphZXjiCax?=
 =?us-ascii?Q?hPNy2Y+xF6rS4jPe8iNw2fKkqaf4K8ec6NtelakFD5g4Atf9RlL6vgMMA5Lq?=
 =?us-ascii?Q?Epy9v+uI3fRjCn+7NMovXvjjGkz8RbDZ93BSjKhXDwMVFtCR5dqTxIonye2a?=
 =?us-ascii?Q?eR0f6RQ2RKcbxPpUaPVEfOOO7dLkcCLV/FjulXFTnCEgY9fToioVZzWM+Nhv?=
 =?us-ascii?Q?pJlN7jOz03PMbC/TntFp4S7D+fmr556DRvzSCG4ncaY76t57RAh7uIenkB4m?=
 =?us-ascii?Q?NKIx+QxgGr6pmcqgD97ItEm9jWxCrvfxMe+U5NoC5j3NxBwQo32ZcdAHLZIA?=
 =?us-ascii?Q?sWZq2/ObNNV/MHSTEg/UJwYVmAMECjZDFbhGiH243KLgWiaI3dMhxJeP7OF9?=
 =?us-ascii?Q?5/w5f2tcs8Unwjlf266yT1qKb0OglysMaKXG+CWul4G22U59cdCu5bFgcW/o?=
 =?us-ascii?Q?zJsVwdczLJYEcKrpSowB8hsdFsz+xIbiwo61Hs7mH+3vrapSKFxgG2xKw/dv?=
 =?us-ascii?Q?IIrq0KmvE+oV7trYI05Xk61/++NnmsKAYAseZ2Elx27aKcIY987HjAtHOMVp?=
 =?us-ascii?Q?eCwtM58vJSZ0Qarf3BqBBulMhr4N52jGkBRZZPKzFabA7gEuA5deDoj5v9Hs?=
 =?us-ascii?Q?zzyuJAdHj1PAGTGikr5/IExcZVLiWsC8bwmyzUazrpY9n6KnW2aHOLmOGZ9q?=
 =?us-ascii?Q?2MSxyW+uFPFa4ZLFplkBifu2SNTVxKDM+Hsuv2YhyxAboCSP1KiU32VmlDHZ?=
 =?us-ascii?Q?Dv+Nn+g9dA9AIswvvHvKXYYPIqhFZCGBMk9m2i0O36ZkiOjDECJlXkJngCmV?=
 =?us-ascii?Q?kOM1XCzxE/M1BIhyZpmotXJIJ/6sUGs=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6926655-3f7a-47f2-f45f-08da49ea5314
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4343.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 07:33:19.2184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtmlNjGJAQcQKoXd8EDeEB1lLg8xnm/m5ND9b51IGxS91n/3Nu5xNXWQtf2jMQigMofGvZ7obcmHAAwXXB1WOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8639
X-Proofpoint-GUID: 6qw_rsmNpvt1WQZskN3ck8W62N9QxCCX
X-Proofpoint-ORIG-GUID: 6qw_rsmNpvt1WQZskN3ck8W62N9QxCCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_07,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68; envelope-from=het.gala@nutanix.com;
 helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 09 Jun 2022 09:30:28 -0400
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

i) Dynamically decide appropriate source and destination ip pairs for the
   corresponding multi-FD channel to be connected.

ii) Removed the support for setting the number of multi-fd channels from qmp
    commands. As now all multiFD parameters will be passed via qmp: migrate
    command or incoming flag itself.

Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Het Gala <het.gala@nutanix.com>
---
 migration/migration.c | 15 ---------------
 migration/migration.h |  1 -
 migration/multifd.c   | 42 +++++++++++++++++++++---------------------
 migration/socket.c    | 42 +++++++++++++++++++++++++++++++++---------
 migration/socket.h    |  4 +++-
 monitor/hmp-cmds.c    |  4 ----
 qapi/migration.json   |  6 ------
 7 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9b0ad732e7..57dd4494b4 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1585,9 +1585,6 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
     if (params->has_block_incremental) {
         dest->block_incremental = params->block_incremental;
     }
-    if (params->has_multifd_channels) {
-        dest->multifd_channels = params->multifd_channels;
-    }
     if (params->has_multifd_compression) {
         dest->multifd_compression = params->multifd_compression;
     }
@@ -1702,9 +1699,6 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
     if (params->has_block_incremental) {
         s->parameters.block_incremental = params->block_incremental;
     }
-    if (params->has_multifd_channels) {
-        s->parameters.multifd_channels = params->multifd_channels;
-    }
     if (params->has_multifd_compression) {
         s->parameters.multifd_compression = params->multifd_compression;
     }
@@ -2686,15 +2680,6 @@ bool migrate_pause_before_switchover(void)
         MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER];
 }
 
-int migrate_multifd_channels(void)
-{
-    MigrationState *s;
-
-    s = migrate_get_current();
-
-    return s->parameters.multifd_channels;
-}
-
 MultiFDCompression migrate_multifd_compression(void)
 {
     MigrationState *s;
diff --git a/migration/migration.h b/migration/migration.h
index fa8717ec9e..9464de8ef7 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -372,7 +372,6 @@ bool migrate_validate_uuid(void);
 bool migrate_auto_converge(void);
 bool migrate_use_multifd(void);
 bool migrate_pause_before_switchover(void);
-int migrate_multifd_channels(void);
 MultiFDCompression migrate_multifd_compression(void);
 int migrate_multifd_zlib_level(void);
 int migrate_multifd_zstd_level(void);
diff --git a/migration/multifd.c b/migration/multifd.c
index 9282ab6aa4..ce017436fb 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -225,7 +225,7 @@ static int multifd_recv_initial_packet(QIOChannel *c, Error **errp)
         return -1;
     }
 
-    if (msg.id > migrate_multifd_channels()) {
+    if (msg.id > total_multifd_channels()) {
         error_setg(errp, "multifd: received channel version %u "
                    "expected %u", msg.version, MULTIFD_VERSION);
         return -1;
@@ -410,8 +410,8 @@ static int multifd_send_pages(QEMUFile *f)
      * using more channels, so ensure it doesn't overflow if the
      * limit is lower now.
      */
-    next_channel %= migrate_multifd_channels();
-    for (i = next_channel;; i = (i + 1) % migrate_multifd_channels()) {
+    next_channel %= total_multifd_channels();
+    for (i = next_channel;; i = (i + 1) % total_multifd_channels()) {
         p = &multifd_send_state->params[i];
 
         qemu_mutex_lock(&p->mutex);
@@ -422,7 +422,7 @@ static int multifd_send_pages(QEMUFile *f)
         }
         if (!p->pending_job) {
             p->pending_job++;
-            next_channel = (i + 1) % migrate_multifd_channels();
+            next_channel = (i + 1) % total_multifd_channels();
             break;
         }
         qemu_mutex_unlock(&p->mutex);
@@ -500,7 +500,7 @@ static void multifd_send_terminate_threads(Error *err)
         return;
     }
 
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
         qemu_mutex_lock(&p->mutex);
@@ -521,14 +521,14 @@ void multifd_save_cleanup(void)
         return;
     }
     multifd_send_terminate_threads(NULL);
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
         if (p->running) {
             qemu_thread_join(&p->thread);
         }
     }
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
         Error *local_err = NULL;
 
@@ -594,7 +594,7 @@ int multifd_send_sync_main(QEMUFile *f)
 
     flush_zero_copy = migrate_use_zero_copy_send();
 
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
         trace_multifd_send_sync_main_signal(p->id);
@@ -627,7 +627,7 @@ int multifd_send_sync_main(QEMUFile *f)
             }
         }
     }
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDSendParams *p = &multifd_send_state->params[i];
 
         trace_multifd_send_sync_main_wait(p->id);
@@ -903,7 +903,7 @@ int multifd_save_setup(Error **errp)
     int thread_count;
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
-
+    int idx;
     if (!migrate_use_multifd()) {
         return 0;
     }
@@ -912,7 +912,7 @@ int multifd_save_setup(Error **errp)
         return -1;
     }
 
-    thread_count = migrate_multifd_channels();
+    thread_count = total_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
     multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
     multifd_send_state->pages = multifd_pages_init(page_count);
@@ -945,8 +945,8 @@ int multifd_save_setup(Error **errp)
         } else {
             p->write_flags = 0;
         }
-
-        socket_send_channel_create(multifd_new_send_channel_async, p);
+        idx = multifd_index(i);
+        socket_send_channel_create(multifd_new_send_channel_async, p, idx);
     }
 
     for (i = 0; i < thread_count; i++) {
@@ -991,7 +991,7 @@ static void multifd_recv_terminate_threads(Error *err)
         }
     }
 
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         qemu_mutex_lock(&p->mutex);
@@ -1017,7 +1017,7 @@ int multifd_load_cleanup(Error **errp)
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         if (p->running) {
@@ -1030,7 +1030,7 @@ int multifd_load_cleanup(Error **errp)
             qemu_thread_join(&p->thread);
         }
     }
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         migration_ioc_unregister_yank(p->c);
@@ -1065,13 +1065,13 @@ void multifd_recv_sync_main(void)
     if (!migrate_use_multifd()) {
         return;
     }
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         trace_multifd_recv_sync_main_wait(p->id);
         qemu_sem_wait(&multifd_recv_state->sem_sync);
     }
-    for (i = 0; i < migrate_multifd_channels(); i++) {
+    for (i = 0; i < total_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         WITH_QEMU_LOCK_GUARD(&p->mutex) {
@@ -1166,7 +1166,7 @@ int multifd_load_setup(Error **errp)
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
-    thread_count = migrate_multifd_channels();
+    thread_count = total_multifd_channels();
     multifd_recv_state = g_malloc0(sizeof(*multifd_recv_state));
     multifd_recv_state->params = g_new0(MultiFDRecvParams, thread_count);
     qatomic_set(&multifd_recv_state->count, 0);
@@ -1204,7 +1204,7 @@ int multifd_load_setup(Error **errp)
 
 bool multifd_recv_all_channels_created(void)
 {
-    int thread_count = migrate_multifd_channels();
+    int thread_count = total_multifd_channels();
 
     if (!migrate_use_multifd()) {
         return true;
@@ -1259,5 +1259,5 @@ bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp)
                        QEMU_THREAD_JOINABLE);
     qatomic_inc(&multifd_recv_state->count);
     return qatomic_read(&multifd_recv_state->count) ==
-           migrate_multifd_channels();
+           total_multifd_channels();
 }
diff --git a/migration/socket.c b/migration/socket.c
index d0cb7cc6a6..c0ac6dbbe2 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -28,9 +28,6 @@
 #include "trace.h"
 
 
-struct SocketOutgoingArgs {
-    SocketAddress *saddr;
-} outgoing_args;
 
 struct SocketArgs {
     struct SrcDestAddr data;
@@ -43,20 +40,47 @@ struct OutgoingMigrateParams {
     uint64_t total_multifd_channel;
 } outgoing_migrate_params;
 
-void socket_send_channel_create(QIOTaskFunc f, void *data)
+
+int total_multifd_channels(void)
+{
+    return outgoing_migrate_params.total_multifd_channel;
+}
+
+int multifd_index(int i)
+{
+    int length = outgoing_migrate_params.length;
+    int j = 0;
+    int runn_sum = 0;
+    while (j < length) {
+        runn_sum += outgoing_migrate_params.socket_args[j].multifd_channels;
+        if (i >= runn_sum) {
+            j++;
+        } else {
+            break;
+        }
+    }
+    return j;
+}
+
+void socket_send_channel_create(QIOTaskFunc f, void *data, int idx)
 {
     QIOChannelSocket *sioc = qio_channel_socket_new();
-    qio_channel_socket_connect_async(sioc, outgoing_args.saddr,
-                                     f, data, NULL, NULL, NULL);
+    qio_channel_socket_connect_async(sioc,
+                       outgoing_migrate_params.socket_args[idx].data.dst_addr,
+                       f, data, NULL, NULL,
+                       outgoing_migrate_params.socket_args[idx].data.src_addr);
 }
 
 int socket_send_channel_destroy(QIOChannel *send)
 {
     /* Remove channel */
     object_unref(OBJECT(send));
-    if (outgoing_args.saddr) {
-        qapi_free_SocketAddress(outgoing_args.saddr);
-        outgoing_args.saddr = NULL;
+    if (outgoing_migrate_params.socket_args != NULL) {
+        g_free(outgoing_migrate_params.socket_args);
+        outgoing_migrate_params.socket_args = NULL;
+    }
+    if (outgoing_migrate_params.length) {
+        outgoing_migrate_params.length = 0;
     }
 
     if (outgoing_migrate_params.socket_args != NULL) {
diff --git a/migration/socket.h b/migration/socket.h
index b9e3699167..c8b9252384 100644
--- a/migration/socket.h
+++ b/migration/socket.h
@@ -27,7 +27,9 @@ struct SrcDestAddr {
     SocketAddress *src_addr;
 };
 
-void socket_send_channel_create(QIOTaskFunc f, void *data);
+int total_multifd_channels(void);
+int multifd_index(int i);
+void socket_send_channel_create(QIOTaskFunc f, void *data, int idx);
 int socket_send_channel_destroy(QIOChannel *send);
 
 void socket_start_incoming_migration(const char *str, uint8_t number,
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 32a6b67d5f..9a3d76d6ba 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1281,10 +1281,6 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
         p->has_block_incremental = true;
         visit_type_bool(v, param, &p->block_incremental, &err);
         break;
-    case MIGRATION_PARAMETER_MULTIFD_CHANNELS:
-        p->has_multifd_channels = true;
-        visit_type_uint8(v, param, &p->multifd_channels, &err);
-        break;
     case MIGRATION_PARAMETER_MULTIFD_COMPRESSION:
         p->has_multifd_compression = true;
         visit_type_MultiFDCompression(v, param, &p->multifd_compression,
diff --git a/qapi/migration.json b/qapi/migration.json
index 62a7b22d19..1b1c6d01d3 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -877,11 +877,6 @@
 #                     migrated and the destination must already have access to the
 #                     same backing chain as was used on the source.  (since 2.10)
 #
-# @multifd-channels: Number of channels used to migrate data in
-#                    parallel. This is the same number that the
-#                    number of sockets used for migration.  The
-#                    default value is 2 (since 4.0)
-#
 # @xbzrle-cache-size: cache size to be used by XBZRLE migration.  It
 #                     needs to be a multiple of the target page size
 #                     and a power of 2
@@ -965,7 +960,6 @@
             '*x-checkpoint-delay': { 'type': 'uint32',
                                      'features': [ 'unstable' ] },
             '*block-incremental': 'bool',
-            '*multifd-channels': 'uint8',
             '*xbzrle-cache-size': 'size',
             '*max-postcopy-bandwidth': 'size',
             '*max-cpu-throttle': 'uint8',
-- 
2.22.3


