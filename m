Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFB25B474F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 17:37:16 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oX2Xj-0005CX-AA
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 11:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nb91605@student.uni-lj.si>)
 id 1oX1Fr-0008HK-4E; Sat, 10 Sep 2022 10:14:44 -0400
Received: from mail-eopbgr130112.outbound.protection.outlook.com
 ([40.107.13.112]:13761 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nb91605@student.uni-lj.si>)
 id 1oX1Fo-0004Xk-Tm; Sat, 10 Sep 2022 10:14:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9W4k+7s5GJqANe/avc3TLc/NXhuHgNLa01eC0R0ns5BhUxcF6MgjVFy56TcS+EuN+Xs0ugwm3ONZW1LQ99c+yHUXrhO3PzBbitDx4fQln3O2AAwvzArJM3Nz4vvqJLBJQ1XOpWgi0zWMow5soMj6IbJdeM3yy0wb0dxfxhNKISuauXDEMdrGnWZ5dNjerYAZiGirPJGz+2cUx6snAnESK+bEGoHa7rtXpRpO7aMqtng7Q13KRwVns0kMhBlsFageueXSNcG40QMVfBVIYJgXn/bmVKYaQjCOdef0bQOtYoO1VAzK4pGYDu/B6HNPs+azZXfLdWPzfPxTBgrZkcyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJCTI8R40yb72XYuX9c0G6zPCe37jK3R0zbLbdC4xVk=;
 b=PAPfxAsaoyyjEZQGxm3Oob/L55OkNyx7ANPGRhQFKM4RA/1ueuPx9lLsH78M5kpAXI2ubSHdPOPnYn1K2Gh2nlrb1yAV/1CKNgLSDZI8eIyuDskLgt4QtbHHsGYQ7dDnZVZd3p3ksh7UfjlNUIMRLit3A3vsz26INgqgrjked0dOfZauDO2iTC9ym1jngb32Np/SE2Y57Ygo8/Wrua2fjOep1UfmY9ENgm79Hzgg2oZawqoWctKjKv56Yned/e5drMVlhSEaSsX0bNW584vYaUCC6VHY3fkECzz/raGvG9l3HAaDu8rMQq3sJSqTTHp894MP3i0FpDb3QYX+s9CsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.uni-lj.si; dmarc=pass action=none
 header.from=student.uni-lj.si; dkim=pass header.d=student.uni-lj.si; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unilj.onmicrosoft.com; 
 s=selector2-unilj-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJCTI8R40yb72XYuX9c0G6zPCe37jK3R0zbLbdC4xVk=;
 b=QBTuH9J6Wo5VdK25QdJNUyHhsYy5ADwbAouFl1/Uc0IpPyF6/WPa8O/smOFmoOCpLhOVnvsGu5ZmUPqVNeAQVLO128za423PcyJ0jURqC2kWqf4aCJ7mX2bQitNMlnGJK10JIqzsDad6CXwbaUuYzTBbZnT15i0GM906t9yl1rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=student.uni-lj.si;
Received: from AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5aa::21)
 by AS4PR10MB5846.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:511::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Sat, 10 Sep
 2022 14:14:33 +0000
Received: from AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::355d:20a6:e896:d98b]) by AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::355d:20a6:e896:d98b%5]) with mapi id 15.20.5612.014; Sat, 10 Sep 2022
 14:14:33 +0000
From: Nikola Brkovic <nb91605@student.uni-lj.si>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Nikola Brkovic <nb91605@student.uni-lj.si>
Subject: [PATCH] arm/monitor: add register name resolution
Date: Sat, 10 Sep 2022 16:12:16 +0200
Message-Id: <20220910141213.111154-1-nb91605@student.uni-lj.si>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0202CA0031.eurprd02.prod.outlook.com
 (2603:10a6:803:14::44) To AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR10MB7043:EE_|AS4PR10MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e991aff-bb57-491d-53eb-08da9336c8a0
X-ETR: Bypass spam filtering for student.uni-lj.si
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1pm5rjS4V77sX5xgpLpg84bhbfgMUcDzoaGWwKISMpkstgQUp5/t8tlunAohMt9TH61uDtCE45+S37VkbtdDd7l6w8RFqX0G9cyV888iSAUNPG711Gbe+Fcz3o2fu2pYE1u4mAGvjKwp6nw1pvsqVPHkP65KueUEgxbGLDU6itSHzR3CKSXI94zWySA66xarCAw/tu+tdD6P/kDtmFZDWcugi4abzh0YQ8QuSeU7jl4QbK6qJcgWjs6+wD1cEBGta2IYBxPqjE7nduTwcgueKW6jmR1uCrFAA3jE0sfPapK+EdJb+ZNMF8uZWuHMHyTaIvERJOGL383Ov3Sb6scki86f806SzqDPRupvetBWe21C5GqSFj7ilIVxPQGas0xN0NsoZZ65TuzGjhFAEezfodu0tXdS0qWbr+5mZYYF3jemiGEnrYfgjB388aaTzphzvwvp/9BCVeevTLGG9REL0tkmWkdifATMbelM3WPQf0yaOaFZSgph/wgIbAVusucoH0M8Ne0EIXwed8Bcz9vli/W12e5Hua3wPuAkEDJMwt3vR2M4v5n/xowkLFXQUEUv5PhoJpg9J0R2M6VYg2MDRtvAWStyTIYG/VmTPFJ4p9uwzirlGCFSO1fBgktRuI5/0s3zpF5Db51xkjBtSGlkZTupV5joARVggK8qmPhKuu4t6DiNRpYm/D8z/Do2UHTB5Kx+zUFB+fci4LGZlyy1bQy/3F9JnwbSYWUzfmC+Uyl0sw4/cWa/+dKhoeQCH7fJ+DMIL2/RrhQYE2XQ4DSHzdzwv1jm0LEsGPWTtyc4D9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(366004)(136003)(39860400002)(376002)(86362001)(6916009)(6666004)(316002)(107886003)(478600001)(6506007)(186003)(786003)(6486002)(6512007)(52116002)(41300700001)(26005)(2616005)(41320700001)(1076003)(966005)(2906002)(8936002)(66476007)(38350700002)(66556008)(66946007)(5660300002)(4326008)(8676002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TV5SikAUtdd8WV0TGzk8VhU3+gcV7HvyR3nl8JYAEwjGNwH/ZjPYTMtStLzs?=
 =?us-ascii?Q?1ZrATdJOocKkWty1LgTlVpuXdasJS6Zauu57L6QVjyxSvziMorPtijd17R9a?=
 =?us-ascii?Q?MBt6W5/+xj1dovtExNqUEXBn5Cl7QEwuCYdzrNT2cdBtBK45B3tXkWfFb9X8?=
 =?us-ascii?Q?9FMPCH2e3z7hqZNFYS9bJbNLS0mptZPU2zFMTnqGlJOPlJ9aADAEMtD0a5Ax?=
 =?us-ascii?Q?cwDxDgCOlC6oC/NW3x5VcM21fP/4yHfNEMSOpO58ABGhEyLM2of1KnX+ztB5?=
 =?us-ascii?Q?pI6lrlDDOyUL/SaGNJ4H0HI6T+iY3W0UcTRy3kIQLz69NaHcKcPhtPtb7QX+?=
 =?us-ascii?Q?4zxoOTmw8ILlcCf4a9nCXbB192z5lM1IfOhg5uPIf/LjmwCmAYvKapqZjssw?=
 =?us-ascii?Q?deApPns9KrSkJTb0Xshm23yj19/HlJ1wWzMSUH4WQQK28WbFvLbjC51rZ5/P?=
 =?us-ascii?Q?9aOD38Em3HLPqE1sWL53SfbopaUyEIThcddbAPrVEGOBRnHGg84KDkdyh/Yb?=
 =?us-ascii?Q?JBVY7+IRKgvutiuaW2zNz4O57Yw3WmqMRKwIZyOytFK9gKDWFEP8Mgosg9mW?=
 =?us-ascii?Q?HuopoX8tJrAg05qWy2dVabi6FFjC5N2ojL2i6K3oDjsEqRVMT8LwbLexcGu9?=
 =?us-ascii?Q?BvfHoIiuhV5xxsA6r7L48EiY5AVRgAVgln0aEQKdhFjoBadCF6rPIS28F3sq?=
 =?us-ascii?Q?BRyIPGdRh8EPUlqs1hyLEano+u08k7TCh5MFkuBY8IKFEKMPMCWdaqHe51th?=
 =?us-ascii?Q?vtQY1xtRVY2wKFe9ty2AiHxokm7cRjNUROBChlCfovHUA09GoCjvEkh140H6?=
 =?us-ascii?Q?COKCghW+71jmtfVSj4gYBJiF1PHtYBrzEudx56lV8Q/YhGKgzWeOVWLVBSPS?=
 =?us-ascii?Q?qrjsGvsNhCiEpoSAWtxGCmRGA35vny7oHSLO7UeQ8C7VA+kH4gdQGbxi16E5?=
 =?us-ascii?Q?+ELe6Czvv2ps4pZYes4sPl1X2lFqOuUgzne+xctttiE5NafS6gF9c1clJlWf?=
 =?us-ascii?Q?WTE1pEqSPtr30Yd/enyD163JJlE12IfsCJQJxwEWD0FaDqgVWSyDFsLEggsv?=
 =?us-ascii?Q?lcKH25j7A41HnXd/kwOno0kYT9luf5uqREdLDFgU/zTn2GdkoeYAoOaXo44y?=
 =?us-ascii?Q?tbhaEDzsLDsRTGC92GeAUR15Qj8RTgb+FDIJLShnkulkUUTVSoylx8ldtBOC?=
 =?us-ascii?Q?3eIixclAhVOfFfr7eH5jLNYn+1j65ATq0XFX9gxb4cWkdh/hmyRvvEjlDsj1?=
 =?us-ascii?Q?SvD0H3g8WozJPlD+s0WyHER86wAqf4U2QRCUdfqoO/NmDzbC29GTFTAmM2FL?=
 =?us-ascii?Q?MV4+xuIJlUPJoDtcO5AMPUsNYXktp2AYOXuyktr8EN8p2GR22q0oxIf9+Is9?=
 =?us-ascii?Q?P05tY0bEUYSsnCI8zGO994Gc0MLvap3xaIOgLa5wgfxe1v0d7UWqdRMQCUbD?=
 =?us-ascii?Q?kk3RKDrm98Rf1/ngYH/djXzmCj8YUfWTu4WpmvdDyNeACVBMFkFvKiGwfJvl?=
 =?us-ascii?Q?2tB8soMralMrplBwnom5Q1E4/ItbrFD0QSCFBycMRIPi0Bq+u6e/Fw2MNxyj?=
 =?us-ascii?Q?cYls1qzDCm5nTvUTBDzfgyL3mxzOhNgbIRl4Moha15SBnU1bUGtmb6Y1xFZs?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: student.uni-lj.si
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e991aff-bb57-491d-53eb-08da9336c8a0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB7043.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2022 14:14:33.1376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a6cc90df-f580-49dc-903f-87af5a75338e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nicA2hkj5WwKJeqDFghGcMxFGs3rHQZVE5lLnCGlOXtqRJzqLEWDSHO8jnhnTKTauBMCebeq/IXcUnhaZgFjwHj94+vs66f7xuoXvLHc60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5846
Received-SPF: pass client-ip=40.107.13.112;
 envelope-from=nb91605@student.uni-lj.si;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 10 Sep 2022 11:34:43 -0400
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

This patch allows the monitor to resolve the
stack pointer, instruction pointer,
system status register and FPU status register
on ARM targets.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1145

Signed-off-by: Nikola Brkovic <nb91605@student.uni-lj.si>
---
 target/arm/monitor.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa355..143c95bca4 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -31,6 +31,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qdict.h"
 #include "qom/qom-qobject.h"
+#include "monitor/hmp-target.h"
 
 static GICCapability *gic_cap_new(int version)
 {
@@ -228,3 +229,31 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     return expansion_info;
 }
+
+static target_long monitor_get_cpsr(Monitor *mon, const struct MonitorDef *md,
+                                    int val)
+{
+    CPUArchState *env = mon_get_cpu_env(mon);
+    return cpsr_read(env);
+}
+
+const MonitorDef monitor_defs[] = {
+    { "sp|r13", offsetof(CPUARMState, regs[13])},
+    { "lr|r14", offsetof(CPUARMState, regs[14])},
+#ifndef TARGET_AARCH64
+    { "pc|r15|ip", offsetof(CPUARMState, regs[15]) },
+#else
+    { "pc|ip", offsetof(CPUARMState, pc) },
+#endif
+
+    /* State registers */
+    { "cpsr", 0, &monitor_get_cpsr},
+    { "fpscr", offsetof(CPUARMState, vfp.fp_status)},
+
+    { NULL }
+};
+
+const MonitorDef *target_monitor_defs(void)
+{
+    return monitor_defs;
+}
-- 
2.37.3


