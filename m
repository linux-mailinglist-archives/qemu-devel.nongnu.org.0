Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E4051A1CE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:07:46 +0200 (CEST)
Received: from localhost ([::1]:33564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFfN-0001ng-VW
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCsw-0003nm-Pq
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:09:36 -0400
Received: from mail-eopbgr140129.outbound.protection.outlook.com
 ([40.107.14.129]:5511 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCsv-0002KW-7A
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:09:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5C63nC/oPrxZ7S9KHVKbit2iXDbFsNxuKd8HtQ1RIkTwh+MvaZoH+huApmP4fHr2aAQM8/F0ArNWWa9Y0S3UhQQq3czL2IbWbGIhIig4rNxYJofCWYouA70/ZHryEmLKtaGGL4YnHUSjZdin/oJNAAOE96KT/NMh3tD/Oaj2d/hEAD57QhXVGfXddlza0X8vUa25RdCRlNOB8259+njQkBPwUys3JtsWpRjMN5avG+SHnJLA/EvIZ/zm65y36C5s3lM0Y91TL3nOFmqG7Gq7CxkXkajJsRztyH3YsDwfCZYNCnn3asLYm0/fEEOAGF60R9YX2vzw3cPLjjEP6mz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihO/cO/a+PPiXGUnlX3VUBIuW3Lfj00KOHDSlEyp/ss=;
 b=C11QmZpSi0OZXZwnfAWeb7SDSnsFqAzCgBp056hVJENB8YbC3qxXF5KcAQPLe80D4nsrlTOebFppmY+Rl7Nuuoh800WOLpd3I4LO95q/YcyIWYim1fErYDoMg0OR2EQT0R3vs9mBiTXdzjVC0Q7t1HuSLhNmGEcKr4N0OWu/De2MeBbFp0XWlD/CEax6rBQ4yyS5DUUgpCv0bs8vdC6zdqLiJ25WJHC5+SXNHCeJip5wIi+AIaL+dtvSIWOgQJmca22dHkY4cR3ozsncsz7mxF8r+AHBAWLPDBCcR1LWx9ni5i1/8HEhJcdVESBoRyHMyieTWD/eRVC6jvKXyFVjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihO/cO/a+PPiXGUnlX3VUBIuW3Lfj00KOHDSlEyp/ss=;
 b=em2K7P7zlO6hF8hCyX5GIzQhZBFrSm50cssRRhb664gPAJYGy3LayBhLcqDZlFjAnTPUiZ3Szf5vQmeh3cXtODC/yBgyewE78gDwoPz6XW08DQXZcs/8w1EBDPf2kkGj+gHWyf5XMtAl5G4YLW3kWPruR9B3gJqVe54ivl+4xRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DU0PR03MB8551.eurprd03.prod.outlook.com (2603:10a6:10:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:22 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:22 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 0/7] Undeprecate nanoMIPS and fix multiple bugs
Date: Wed,  4 May 2022 13:03:56 +0200
Message-Id: <20220504110403.613168-1-stefan.pejic@syrmia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::25) To VE1PR03MB5501.eurprd03.prod.outlook.com
 (2603:10a6:803:11e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d7f3aef-b80e-4af4-c83d-08da2dbdd7c1
X-MS-TrafficTypeDiagnostic: DU0PR03MB8551:EE_
X-Microsoft-Antispam-PRVS: <DU0PR03MB855166AF967CB5392221006FF8C39@DU0PR03MB8551.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5W/r3LMuNyh1DcBwvdNwEA+hHr0ysXqq3n0TD0USXhIyd6O3k7weKgOzVbW24PX22iyOiCbWjL8vJUij8sqGftp0lt2Lcw+D5iDuyUsb/AFjGk+lYbJF0kx5WPdBIu62cHc3eRVpbN3TRLEOHqwuu6fgX45qqrAcGYfTg56vuD4SVKMe6KW6F806/eEhOyjLaNMuKweJpb1Y/hLKOih9N9+unWpL0aR4akAI4yJ2hdKF4JTTEUmLUrSTJzodkdchVkHt14j/rPPUfgJB/cZcweBpk8Bd5IxeR4O6vOqPUaxdTG5vxTdXFpnH/C+wfjJrn2yEdxz4iLf+GLkZ3kJOGHHGun2yj0QjL09oXu50V2/OR/KTjcdN+/a7ZiHLLXHVS6XeaaELzxo0Vp9XL4ZpnuwS/Z+YeLRmu4EmsaNyQde9h46W+ZXAGuJj8mdBE6IvdyymWdHuOOkwTRxUFn/NUJ5WymMQxwvdy88R794Muf7nvTBKEtL20zeXEyH7SuJPMWFpwp6hXFDD3tt7tE4YKkluMlUbxHoGHJZ1URfrANA1euSGfxiz0PFNrLtX8drFBXFquD+eSZuOyTZsahk76JaD0oWQrqgL6xLeek3m8AkaSP/Yh3wyBdLbZY9qFejR1/hbs8QqZry0OH+3rixkP5pjsspfDBbZyNRjEElL6BIjW6MIjbDA/NS+SOIF8HXhbGGGgY09HsT0Vpo5q9jWjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(39840400004)(346002)(376002)(396003)(136003)(38100700002)(8936002)(36756003)(38350700002)(316002)(1076003)(83380400001)(6506007)(6916009)(2616005)(186003)(4326008)(44832011)(107886003)(6486002)(2906002)(4744005)(3450700001)(5660300002)(508600001)(8676002)(66556008)(52116002)(6666004)(66946007)(66476007)(6512007)(26005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tvvWWNmUktzCkKewWEg7WDoWEEZ511HV+ZusEK75A69GM9cDl8e+rrKeIeTo?=
 =?us-ascii?Q?NnuvT/cOX2qCuXJCHdko3B7Is41YgZjKiw+V6iMZIZbqxFn9uYVxPFkXTPbc?=
 =?us-ascii?Q?sHbV28V4E/LSNRBOthoKOTgx1qABbUa/wqKGvEXXn46iZNbAMH2OflqM/z/3?=
 =?us-ascii?Q?khQFjfLixqnvaLa8WZTCZKBsDLFqpKfsnzAz/FUSEh1cgb40xtnKHs4wIPig?=
 =?us-ascii?Q?OtmhHs7/gxGdV90Vynoe6WiVFWmnvq2JvWr7Shg+77q0/94YCvg89WJL2HGR?=
 =?us-ascii?Q?mm5+i3P0Q8WM6q0Ef7F5UoS3w89sFdjYd2iVFCPlJZcuokz40rGZAywPAq7f?=
 =?us-ascii?Q?4gnicUEhts8yA2gjpwS3my8eIrgPNKBFn34Me9RoCTARNk5Fa1yFCMF+GwY9?=
 =?us-ascii?Q?jqBzp/8g3+TZK7wH5HEXml4Zf8HMuDRQBc1neDebbo1aL0MPvnRIUthfi9hq?=
 =?us-ascii?Q?LukZAbFImvV0h/zguu/2oeVit7kTOKcLTODsBeQvxOg5SokVNZ+COqTzxi0p?=
 =?us-ascii?Q?7sCXXyMt6ucN1vEp0JAzxSFJZWRf2pjPRg20ei9MxEFQtWQ1dlkFWvinzqBj?=
 =?us-ascii?Q?5QmU5K+nQ6TG+Acdpi6EfNyk8E7CAN4WowraQVWvWvqhvXrpzYO0qf51Xt/Z?=
 =?us-ascii?Q?axh2QrJ1h8QqhdT+JYmWbpt1j53eAc1bJesypfD71ues9wcdjF3rxfU50X+B?=
 =?us-ascii?Q?MCl6heCP6ZlKiQq8LOn5jKj9qxzSi8IwEwvyGb/zXfhahkYbmyQc/+2cugLi?=
 =?us-ascii?Q?HQ5VrVaX1bm6ujKqliZ+hNYKz2LbDBMK1JfTQMNUB1FPokCNXMAA8OonEoq+?=
 =?us-ascii?Q?zd91OdeoMJBjE/yE88E9qoEhnr36GkILQzbF0l6498GYwD2YBSHuMuIzz6Kv?=
 =?us-ascii?Q?Y/xA/jDwekAKk7fBmqYbotZHome3Z3wj3lKiQ1FCh4cpAk+7oLNRiW4CJMxv?=
 =?us-ascii?Q?4RO/dh6Q6Km2Qff9IWm4QKA4f2u1G+M5oNxcKzxlga2rwfgPEsgyOIaopi+P?=
 =?us-ascii?Q?0MdjDSMe4vZCDq+/f3R9FsbyYnmetsj4KOpE91/nJnuNCcnvya4jYLeAm0MP?=
 =?us-ascii?Q?73659DvBckUVuNdiqCZyysiuDAp282tHaWupBSS+83ppLJh3tujympG6utPz?=
 =?us-ascii?Q?7X7K7RWsoRAkGwzhLKiQcFb4AXubK8C3Npl6bLHykMIRreF7G7LteZmu2JrY?=
 =?us-ascii?Q?P3PnV/LlgCj9HBugZH8IXKmo7veLBpTBk+W1svTOf7I3T+wiNQZ/fUI0tFJl?=
 =?us-ascii?Q?mkTZGJUzXtJQBNqtM5HZP22ToYKi4qQLc5WlJIBl8CAWetl6bVvZm+BcY0zL?=
 =?us-ascii?Q?YoYe1mQwL3hFmGvhlVqfBllB+TqZaHrUfy2m5CxSUpsvNdwPU6UXU4mhH+Gg?=
 =?us-ascii?Q?xvQNj5XlFiMAl0Vi/9mM0QFyxMkho6dwZU1sM4SUZbo0OGyUT2tBF9WO67RP?=
 =?us-ascii?Q?84s1uwGAGaoj7r7Lsy3iKHizNGgSHiSNMKjKu/qV+EDSeQIpE4OPIArwI4+Q?=
 =?us-ascii?Q?FDtnkb0JIjne9KcM7B6mit0fgrvDLUOXi2TAZXRObT46GS4948uvJt9zSUyK?=
 =?us-ascii?Q?MhhiTy6tCOmPjuOiIyE0n438J3F3vwzprrCzJfZl33ST/hMIMvRBczof837O?=
 =?us-ascii?Q?A8m1BXQImZ/ezQ4jjchmke2SefDMo7yEBp4EalEDFAYFR1GmGHr/8e3hlQrZ?=
 =?us-ascii?Q?YsGz9xfZLJ82ysf5JJaD/BYZW7WTe8WouixbQ1mToxM/UQSWxOh0rIQPi3Uc?=
 =?us-ascii?Q?QvyiQQLliopfaKjKPsNJXrTfBJDo9Wk=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7f3aef-b80e-4af4-c83d-08da2dbdd7c1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:22.0403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAJGdWdboV5ZdEHMogj0pPBgm3/LDSwAuMlQAzS9J2pA/4AwnTwakO3el661j7maadlHnXUgeLqPucFmvmVHLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8551
Received-SPF: pass client-ip=40.107.14.129;
 envelope-from=Stefan.Pejic@Syrmia.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series of patches aims to undeprecate nanoMIPS architecture and fix
several issues that were found in recent testings.

Dragan Mladjenovic (4):
  target/mips: Fix emulation of nanoMips EXTRV_S.H instruction
  target/mips: Fix emulation of nanoMips BPOSGE32C instruction
  target/mips: Fix emulation of nanoMips BNEC[32] instruction
  target/mips: Fix handling of unaligned memory access for nanoMips ISA

Stefan Pejic (3):
  target/mips: Fix emulation of nanoMips MTHLIP instruction
  target/mips: Add missing default cases for some nanoMips pools
  target/mips: Undeprecate nanoMips ISA support in QEMU

 MAINTAINERS                              |  3 ++-
 docs/about/deprecated.rst                | 26 -------------------
 target/mips/cpu.h                        |  2 +-
 target/mips/tcg/nanomips_translate.c.inc | 33 +++++++++++++++++++++---
 target/mips/tcg/translate.c              |  5 ++--
 5 files changed, 35 insertions(+), 34 deletions(-)

-- 
2.25.1


