Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C285C648285
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3ciY-0003il-Rc; Fri, 09 Dec 2022 07:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1p3ch3-0003TC-IW
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:41:34 -0500
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1p3ch1-0005E9-OY
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:41:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT574CRAP1596e48F47H9pqn0spaXot4RfcW7aSTvStdalwTL8DVS18kP9bzO0jlS7n3zTWKkTzVhuWyF7zhZS06rdMb4TUX/FrmPYXF/Ft6kWLuboa91asN1bxo6/V1wdAQ06C+OEYU4uYkOWLgitqaZw1cgPoFXzYI2bLrDPzlEHpfRaMpnx7/cdLMDldIwtS7eByipPZruwWXCPETOj+q4dGLxh5ddPrT6mjGUiNnSoYsoWHd1jOjh994Vk11ej09i4WcmIZ7XmFz+L4NNS6lWY3KD2Ov1R6CXQKohP5kwn/ZBGT3QLKU8AJ4KU1R3OFyxLnIPBGNAhEDmVqPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVN//N8wb2R7vk+93oNILHxFuzVapj92NOSeg2P/QLA=;
 b=L4nZdPI33C9FYbSl47OI3Nhx+61PU+9N2cRZZeZGIi8ZQ2FzL8Q4qIXrPYfMLCk70he0N1h0dZxsw93NGVZpWC5Df9rIVDxSxVIOw1ewnkCWpLGPAmmpLbktpcLPLWMjgNuVY3lhQ+SiHhp5VJKGnl4FhD1igaDlFwB5z/FvObe/GR9MFQed/yeREZILp/cWqxOsz6rUJS2kibuogYeaTAHPBgu+c/yNpcO9t5mhoz8e+Dl9RU6tOwUUypnkqhP1Jddgaj9hLTvUBzj+tn5F/gSopBaRqD2fpQCuAOG5s2JLX8GLGlYcX5Yc6wIeLcp/jdPs0hnssHW3fucq7LAF1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVN//N8wb2R7vk+93oNILHxFuzVapj92NOSeg2P/QLA=;
 b=EkfRy2GiQuT2NjfcqAaIQLTY92iJFc3FdnYjNMglbHTyPPMlcbhw3SgFVc7ZnEnXIMQkmW1HxsnJW0AuzrLZ3NSjZnX+Gch7zDY25mxsuKq5IwuaM4iOGwIDyqlNdE0eiiI+QTYG36B9HoTD94jy85sOQXoRUI7vJaZnH+YwoWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from PAVPR03MB9678.eurprd03.prod.outlook.com (2603:10a6:102:318::20)
 by AS8PR03MB10037.eurprd03.prod.outlook.com (2603:10a6:20b:636::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 9 Dec
 2022 12:36:27 +0000
Received: from PAVPR03MB9678.eurprd03.prod.outlook.com
 ([fe80::6661:f59:ba9e:90f0]) by PAVPR03MB9678.eurprd03.prod.outlook.com
 ([fe80::6661:f59:ba9e:90f0%7]) with mapi id 15.20.5880.016; Fri, 9 Dec 2022
 12:36:26 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: philmd@linaro.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, djordje.todorovic@syrmia.com,
 mips32r2@gmail.com, dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH] target/mips: Add nanoMIPS ISA support in QEMU
Date: Fri,  9 Dec 2022 13:35:50 +0100
Message-Id: <20221209123550.98139-1-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR03CA0077.eurprd03.prod.outlook.com
 (2603:10a6:803:50::48) To PAVPR03MB9678.eurprd03.prod.outlook.com
 (2603:10a6:102:318::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAVPR03MB9678:EE_|AS8PR03MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: a1aef745-d35b-49d5-1a85-08dad9e1fceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uB4Y8Wxl4skGBFDVcdkRqSw8cVBUllGdGitvvmJDSl+lx8H+zj+WGrty1RAatxmBZOPe8v+m6xh5WRKTwzmpc+Z3ibhuGs1FWVmmQEhyhIs1z3Nfx2erYRAMu2zTcrLY63f0ZvHIu0aUYO4ff71P/7zsEPTVzUPok2yHtBLuexR6+cc39x7EHe/TSf+JTcj9H29jNIi5tWcA64xIBYPo3SOYrJpY9VKHLJ54cLcW882UCWGM1SmcDY+FKbnxEmNX+9s4VBFsSKcfKB+XZVZNb0j2BJVYO4W3YE4E92dRx9ZBWerbYJMKue2LgTxvGZpEzdpzCsSELx+eV++d66yca9Q86qlQkBzLuNcZo8zGd6JkZObPYIQBU6o1cnqWb9xd0kfnXmjxw9gmL2LjuIb89eehjdmy2oBw22woIaFLfqVcL868UiZTQ2EquKa5jxqHLFa/lJSh3Ss/39gGcvdZPot6zuydrLkMMlSsY7pAWihR36FKFswkVgWc1QBKnvbDBHyW2YmwBGLuOpksF9wuYuZPT8a8P0zK9zOYgX9xBcS7vFquxTSuiKF/ayZcNf/Ql+IzilXmQdWcH98dUm5QX1/5ctTxwlYf7wI65X9wsCRu6pVB7D1zaXH/1PTusu2Fh5yKRy045EnKBMvoGvgGr4C0bNja5v+u2Om0C1zRqiTpeqglUp6KTgIB8m/1w+u8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAVPR03MB9678.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(39840400004)(136003)(376002)(346002)(451199015)(36756003)(2906002)(38350700002)(38100700002)(8936002)(44832011)(4744005)(5660300002)(1076003)(186003)(83380400001)(2616005)(86362001)(316002)(6916009)(6486002)(6666004)(478600001)(6512007)(41300700001)(26005)(4326008)(66946007)(6506007)(107886003)(8676002)(66476007)(52116002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uTXeDuGIwG6en35NsSYE0lPth6nQtYmGOFmdKHoPKZvMwfyKWvR4bWvTT5GQ?=
 =?us-ascii?Q?DM5Z0GauUOuLx7M23mtt+TDOMG6vTEZgFcWTPB4MT9O3dsPnpMmL0YbfEI7G?=
 =?us-ascii?Q?j9PANNyvZqT5yjjeHIlS36cGbPzEtb1nYQ9IdkO4sbp5l+/HS1hIFlrp3wBw?=
 =?us-ascii?Q?/+eHadPYsGqV6ZcOlfmZyLFMPItrCo+AnzrTV23HTJeprufQA+bPQx69HeA5?=
 =?us-ascii?Q?DdMtSHe5bFSXDdUmO5S/1LFHdFo8sSiII1nHrCkLdn8gMIUCi5vVK/QjspVB?=
 =?us-ascii?Q?CJVTl+knhRDIWoZk14q3CXfJnO0Nb6MxQTz4kaXbQkfYMMVLPpfi/gMYwrN0?=
 =?us-ascii?Q?C/VdEqU5P8Aic+i2vGEmth7bB1fdyrWuc1CsRspZT3YSHR+67XpnUwgc4Zxd?=
 =?us-ascii?Q?xX8CAi/3fvyVH1o61A2BIVGcjt3SAaAGBq5YVu4cpBhLEY/CS4KE3h6td+7z?=
 =?us-ascii?Q?yliLOeT9RZfHT+pFZI6RnPergPClKKFAgFYC6FtG6g4P21Q9EF3GvOWJaIaF?=
 =?us-ascii?Q?ur8DJw1wq8mG7Recj/MUlh5WpmOwSSGoNuFijjUNO1qxOtEeqSbk5Ck3Ve35?=
 =?us-ascii?Q?8J7TRHwnSOI2IrvP0JJvCQwUqOtZdddAD6bJ9vtm82llv8Spc8PgVLglnzyq?=
 =?us-ascii?Q?6b2TBaiF9wa6pNTcDbYHJdpXaZAfLbOeowyBZAwfGbyk0WNBP1ItF+uJvdKV?=
 =?us-ascii?Q?Ho3OegJCvMitBrdA9svtgC9YjmpP3tdMp17E8AuMmOhi+GP5ZIluYUTruvSZ?=
 =?us-ascii?Q?t3FBviB+z/FhrKN1XhRAOCxI6+QPvOemgRo5QdUs76yrKW3FYv+xkaYAjLfZ?=
 =?us-ascii?Q?oaJRvrYDnMj1UG7HvwmwiATViU2+TwHqT/VR94xG1RKAcYlakoi1j9galYHB?=
 =?us-ascii?Q?1IiQOSl+yZ6wpFRJFFd9jjZ9cwDWcoXNU1Id6KMcmaLs8W+7sTOrWpOgqzju?=
 =?us-ascii?Q?51x+67boOTwPE6hGkXASySM0PKp7GkZT2DdScwn6NrYsnjHon2kKs5vB+Et0?=
 =?us-ascii?Q?h8jUhzoaNTDs4Buaz73QsItNe51AxKToAUdfZegUTmm/1nv12qWmpjOr3NSq?=
 =?us-ascii?Q?YPUDildRHJvgphfQPbp6IhZ7t8ZlzYIy1ir0966iFXU9LgliHh20zxU9w3k0?=
 =?us-ascii?Q?wbzWrAZsylzqIsUl18U3WRQNuqAAaz0HHdanaAaEqV2o/U9aNB4A4PC+6OT1?=
 =?us-ascii?Q?ile2CzX6qedZZzKPu2jXQC6U6Jsmd1KVo5CuvpZk1EscM8Yn28edrIjKBorE?=
 =?us-ascii?Q?ejc7qyjsUQi+jfZ24Ir/qsrc0oAVQv8ixcYYX2Kn3VAC16Zh3ieTVH7rHER9?=
 =?us-ascii?Q?IjX1FrOwtlRqiUUPPadTzrxCUPc33oUWZ0J2HcSWb+f15sui0hwb2otVRgVU?=
 =?us-ascii?Q?gpz2Bnulsm7I6ZESkal/HK5NPRiMMmyHm6d5L5r2mPSjDCUz61DXjW5Jg/XC?=
 =?us-ascii?Q?xBtua44OuX3oOSgtG3uODIUIk3w/QpZ7/kE29H7P3rKfSZ8Q8i/M1cy5+dRI?=
 =?us-ascii?Q?Q5+AB1hO9BCUoNCMxwtUKD/kGiOmT5vQ4rHJhUcdqE24JD4PfVMrn+T88xme?=
 =?us-ascii?Q?ecof6DSqxSQPHkFpyUCVtmMsFCxowWmct3dhJPfpFjJ+7tMVNhaXjdxfW1+9?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1aef745-d35b-49d5-1a85-08dad9e1fceb
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB9678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 12:36:26.2513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEcLtJZSqTBcwSZibLu6eIeY8/tTKFKwKV9wA7nLIoDV19TBp6rw1c/4DvgmDRhIzZ+2E0yawxh2eiU6w5XRfNYj+Lz2L6ly6myKSJh6yL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10037
Received-SPF: pass client-ip=40.107.21.102;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

nanoMIPS ISA support is planned to be maintained.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 MAINTAINERS | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6966490c94..66e083b455 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -237,10 +237,16 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: disas/*mips.c
+F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
+MIPS TCG CPUs (nanoMIPS ISA)
+M: Milica Lazarevic <milica.lazarevic@syrmia.com>
+S: Maintained
+F: disas/nanomips.c
+F: target/mips/tcg/*nanomips*
+
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
-- 
2.25.1


