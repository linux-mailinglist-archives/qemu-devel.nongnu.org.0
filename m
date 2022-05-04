Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA71251A1D0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:07:49 +0200 (CEST)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFfQ-0001wG-Vx
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoh-0001Ym-P6
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:13 -0400
Received: from mail-db8eur05on20708.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::708]:59233
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCof-0001El-Ex
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfC7dBGkqji0Q5TwawsN/YV5RhESXa+HqE1qHLG81Gi1jTdQQ0io3dNhaoGWtUCJQv4gSUjNQv5+Vf8JZJPIc+xOCt+nMD2rEHKNKGZu/scvK8IUb3rmS8gfTH5/u2XPnNhBWIuhXCkQod8Y7Xj1sHv6yN+GpZOLaQ3h/GfyeFbwALJ8L7vCFAb4KtRIjvk2jH+6i4bYg+N5LEK7VI6ECPq957QOM8V8XfPwHqw+fR5z8KZMWbqD1lfQmjFR42dNCJelzdzIpJHR+q5NWVZDVXeoLyvSkzpBuxji9hGLh0B4EOq7zM09Z798OmdhkFYKUkQoyjgRZRpKEdJCT7KQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozRZWXamtvJBh7cPTG4AjBo+CJtW+2SxDR23pwlF/ik=;
 b=h6BAUoD5XKiwXNjFa5mTo+xfz/lBocC74kqymws2ifpyIFf531AOG/ZQuuRn4q1B+HhrAXPjZVX+EzSMIZ1Ji74FlyGqCq+2g/AmgS1lYl2zC8OBhTryhZ0hvDzYOEoQa2INiiU9skngcm2Gqtaof7MjnLnwQfHz2DktL080qyx5F2hfU8pEiUDdLkvSi+GqOZvui/elSYV++YXj47PCNFpg2LskB6ITPzVAGBS/Di5/ShpGw2siEnQNupyVY8p880Xo43HfmCVHKmQrdAB+AgXZu+iT0v9qL8A7CIfygl1Pzwp8nN+IccXQUIfyDMzMbb6vUFTuOQNKpiA3oh9yrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozRZWXamtvJBh7cPTG4AjBo+CJtW+2SxDR23pwlF/ik=;
 b=lJ59z1cAE0kp9Qgtl+5A6BOVUdp7SOZBR+OyzPFLShS+m5+fsMtFGRwd4AHtprO/wDhhgum2zCIoUevz1nY5SU3m+7W6jOVKeYCUuaZmbAGlxE3nSYAfMHuRoywJEbQPuQdAKdFLexhZlxFMM/zPEhntqFL5FQbppoJaU0Ae0OY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DB6PR0302MB2631.eurprd03.prod.outlook.com (2603:10a6:4:b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:27 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:27 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 7/7] target/mips: Undeprecate nanoMips ISA support in QEMU
Date: Wed,  4 May 2022 13:04:03 +0200
Message-Id: <20220504110403.613168-8-stefan.pejic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504110403.613168-1-stefan.pejic@syrmia.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::25) To VE1PR03MB5501.eurprd03.prod.outlook.com
 (2603:10a6:803:11e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fc2193b-672b-44da-7fe5-08da2dbddb12
X-MS-TrafficTypeDiagnostic: DB6PR0302MB2631:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0302MB2631695AAB96B4BF1662F6B0F8C39@DB6PR0302MB2631.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g94YdkR737lxhYdzfSYtVxVOAScEC+E1A/mccyw4UR0R5Ki3Jfgfcjph7+1E4B9DvDDGParPW48ZfPAsD1qUR57/QzTjrRdrYdtMLTBCkx9Y5/psewO9ZoGo7mPLT+xj3hsxRHmvdR3AwyqCp8u7jKGc/AyuHvtrf9RXFTe5a45LyIQvCXWNZkYrpo9yQhtbQY/Z83uM+iTqcae0JhoXQOMPD8Z2iWX/9jTTeQQxyZHyDk1Y4faPuNKWnDRVWe1nUKZQFkuR2/OFhq4rejRyss+VDJ4tcdpEvAHRNbf9csnYQ/35cjpJhUPRyN6sawvyaf86TRY4YnzvtUtkfLGMuRYTuJle3czrSZT5gfa2a9aJEYMxdo4Z22gUKxmYB1m8nkQHfdsAbdtVHCdd+D90lPp+NcJreK8Nji0u3jOg9V6S1fgwhPtC1uKsGt036MvsbVK74XtZ2M4utDhv+lPzowFr5ZNqug6CEr4WDBzkbDMyYYMesFXrl4OuG3/ahoqRv8RAtU/STc25O01SnJr7T/71A/LypMOVqh58trIL9GIaRf7m1D5Cp2Q068t2MkWmD8qts0B3pN+2H1nPYvj0TnFjBp6bPmIbFo08sqhq0EfrHu2VoBHQMk8TsQjW6axt4dPXWhVyKL6YuCTsq6ewAQzgMdfIQkmFYJG7HTkKuBx/E/po3CY+YMkf/SZnkLC/i0No2h5Ic9M2whM5kuwmcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(396003)(376002)(136003)(366004)(52116002)(2616005)(107886003)(26005)(6506007)(83380400001)(6512007)(1076003)(3450700001)(36756003)(2906002)(44832011)(8936002)(5660300002)(6666004)(86362001)(4326008)(8676002)(6486002)(66556008)(66946007)(66476007)(186003)(6916009)(38100700002)(38350700002)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aTy8gRs2eu2+dMZh8+VpvJtC5AyvRBIL5F7JZO21jyXVKtHnO0cYn9qbyzNr?=
 =?us-ascii?Q?8uDozvo+nJS7dCPsEnDPZyBpBg3ZPQP852Iw+l93U20JoRgNRbcunZORlsdc?=
 =?us-ascii?Q?N0HiGyiRz70SdntEFZEI6DqFu/w1T/ZDLTltpQ3EpYJTLgyRfBeK3UYWtHgn?=
 =?us-ascii?Q?DQQyD2cqh9E6TIJ6iYvsndTujYayVvUWyN8krCP3WBMVFqsI3sCufiAapGib?=
 =?us-ascii?Q?xkxSI0xj05q1DfjYQfP7mj3RLRArT92OzynPvLKOPExRwwK8DRikmbaq6tSf?=
 =?us-ascii?Q?q5NlfkFzKsjO2eb7AUYqoNpHT2rOt+Xzfjv/pvo9UQzc8tKT+4iwVtxPHlKB?=
 =?us-ascii?Q?GvR3rW/EQd9bpyLxd/+0Y5gFzLkUVSDUjL7ex7IzEHFaJo9s8llA+lYzqBO5?=
 =?us-ascii?Q?hw1RfgJuwtwk7Nglx87RBblKswyQnvLgtcfBnfdD2lNOvkqioPTsIyh7UT50?=
 =?us-ascii?Q?0cwKQxqfoCyhjC5jfGpgmObJBV4SkEtNoPG71Quz3O/7gaUX9dYCjBOIswuJ?=
 =?us-ascii?Q?nT01w8TaMbPeXZ3a42tSE9IX8loS8/QDOYt79euO9IX3MyoWdJt7imCtemmQ?=
 =?us-ascii?Q?Zg6nsEokQOu8lLr6pfS04A3g/3cwRnRFlcOJqLwgvL7IuSRbuGkOWYUsY6hL?=
 =?us-ascii?Q?x1M7MtFDX2/kRFdSiuC1cvQRQDcfRitaYFuwN5dsfjanQp8Uel8WfU9OX2vy?=
 =?us-ascii?Q?ETLxE8pix2ad7msuPUWKHR7QUBU+ZLj9siMxGKqB4NxRC0txQSxEYBhedbqc?=
 =?us-ascii?Q?5qrjYBa9Xec9eypqRA4dJnnpbbJ+xlVQMEzGzkNdGpiFeulStiD5ilpD88OA?=
 =?us-ascii?Q?DgT5azURR+Wqx82nnhRWkK5m4nkiRI6zIcB69epA+pruZ4MgRxL8pcAVjZD+?=
 =?us-ascii?Q?TtJGai8FNIDi0KddVzm71UZ/BftpkxdMyu6QrgKeaxSUwtsCyTyB8ywPviMb?=
 =?us-ascii?Q?4fDACriLsUxhPqwSgfCkaheoyHnPX1guCsGkAINTHaOUUpU0RvwDhISMCTBT?=
 =?us-ascii?Q?U87Xgd/AvB11Hf4kUNGUOzucrsrOMktUY9CErCkOWSv9oQiWdYcHPV3wIR0p?=
 =?us-ascii?Q?M4l0rMoJM7innoojGNV27pbErt5JEAKzpVRt4NZUFGEo0HK35KiCO6orUJbx?=
 =?us-ascii?Q?AeWF1SERjhn+bGisq9O/mAWg2ObkOuLqPvWY/V3RvXleVD5Tweq2zT6DuOb4?=
 =?us-ascii?Q?Y4hIg6Lp7DGM8irutjnO73L0rtC+4Arcl7SPkk9hkiBBuWAEabbICq5ac/5N?=
 =?us-ascii?Q?hDLFYeK6jl5hTVu6936xjHke70+kc67HA/Jn93Jy662AsEPZd9+XbOSXK3QO?=
 =?us-ascii?Q?+zjwRIE86szHNAGCO2pwZyfv/PN+wryNz4G94y/wIQh21sdflrK6+Go7Vi8p?=
 =?us-ascii?Q?NPnge3Ewop91BS3/vbw68Ocw45fj9OrijR9k6gHlK98uWw4CV6jIr4DJKDxj?=
 =?us-ascii?Q?/OAMM4POPPlFGHb2e9y1MrGyfwRWhRHwWB3umfuJMlXAzpRcrJ7q+rzzVkyB?=
 =?us-ascii?Q?5B03xfFs8DIFhuIdzzDRetAu2t27YnPx3HxImxKNLaik/MHUOMdtyO58UEwB?=
 =?us-ascii?Q?fUzY5Y07rIKVOEFcPMs+a7KD6EAo091NQqEMLuCGJaxwnPlrkhu/5azKUEjh?=
 =?us-ascii?Q?JxjcsfLdkFxa8DbjTeKOW/HAbXwgcbOy5xQQe7W8r20UUBkhGo8h514n6NBz?=
 =?us-ascii?Q?EsqBZj4+VkTTSUkX27y1A0HR5b6ySawqsSUWGtvNcL/FjxJJK4SSWVpLDu9f?=
 =?us-ascii?Q?Aarx1BGohllUNaahEfYYF/xiPPn7VDk=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc2193b-672b-44da-7fe5-08da2dbddb12
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:27.6494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rMeXYaWI/bP/Bio31hZUuCWm9gzROHjmHuSjWdmou4ztP158eBCMbfXmMH2qgPbqZM2P50o/l1NZsTGSPw5lgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2631
Received-SPF: pass client-ip=2a01:111:f400:7e1a::708;
 envelope-from=Stefan.Pejic@Syrmia.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 May 2022 10:01:55 -0400
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
Reply-To: Stefan Pejic <stefan.pejic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

nanoMips ISA support in QEMU is actively used by MediaTek and is
planned to be maintained and potentially extended by MediaTek in
future.

Un-orphan nanoMips ISA support in QEMU by setting a mainainer from
MediaTek and remove deprecation notes from documentation as well.

Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
---
 MAINTAINERS               |  3 ++-
 docs/about/deprecated.rst | 26 --------------------------
 2 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 294c88ace9..f1e0dee8a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,7 +240,8 @@ F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
 MIPS TCG CPUs (nanoMIPS ISA)
-S: Orphan
+M: Stefan Pejic <stefan.pejic@syrmia.com>
+S: Maintained
 F: disas/nanomips.*
 F: target/mips/tcg/*nanomips*
 
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 896e5a97ab..4b0868886f 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -276,13 +276,6 @@ System emulator CPUS
 ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
 Models instead.
 
-MIPS ``I7200`` CPU Model (since 5.2)
-''''''''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 
 QEMU API (QAPI) events
 ----------------------
@@ -382,16 +375,6 @@ The above, converted to the current supported format::
 
   json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
 
-linux-user mode CPUs
---------------------
-
-MIPS ``I7200`` CPU (since 5.2)
-''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 Backwards compatibility
 -----------------------
 
@@ -421,15 +404,6 @@ versions, aliases will point to newer CPU model versions
 depending on the machine type, so management software must
 resolve CPU model aliases before starting a virtual machine.
 
-Guest Emulator ISAs
--------------------
-
-nanoMIPS ISA
-''''''''''''
-
-The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
-As it is hard to generate binaries for it, declare it deprecated.
-
 Tools
 -----
 
-- 
2.25.1


