Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11CF62A18A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 19:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov0xU-0001Po-JS; Tue, 15 Nov 2022 13:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ov0xG-0001Nq-BA
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:46:50 -0500
Received: from mail-am0eur02on2072a.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::72a]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1ov0xB-0007ot-Tr
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 13:46:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pj8jugcg8Zl7pC4Q8vmcpoyWM2a1X5+WSFc/RDphYBumKCsVsjcHitCIy6gA092EKZHNf1t/+yVaKwFniVWZLMxPd5zZqDC5JuUDxOfULwQnYtRcvNo2jEUh2/d0fqcQmk+30MTsEZfXshqhxKOnw26J+91xrsAfcnhYYHkp8NYXDhtGPL36zpSjXDh90xQh/cs23IHF8pDZ3MmA5IlUuavK7Dy3+8+n256KM0TiX7XtXjcSrFJh6JmorC3vH5e70G2S/i0O5N4J1OYkdrhHyzmE4hX1ZLRPS141cCxVhLBhdqzOv3NVVOYSQhEg43kgYvTQDYBoaopwBH62uPiqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEMg4oOdhSn2vP0CdGPIau04WxebWvFLjMKOiPpyYns=;
 b=ndFoxtaXo8393GyCb1sW+KdqSl7fvN2BU5xBdoGVsVzwX2wpvB1Luqsl8DBsejVLokI4nnHzYDCxpm2xlb8Y19e+TYrKTMmArue0C0DQVJH/tdp9RwtTfcvGVj1lzQpmrwE0JD4Ab1DXgvbG5tK5sIWr3We5IbcNemPMcuJLs6lP9DteOUdi7Brv22griOMvJbjfAY3hlb2VpHphnK59FxV3Gx15Cj0Vr37hu0CJugzx4g/j2jTxfwdakObhQCvAF9PhB3QekYPHuDVNWaGyYCEHZgJdwlxMabj30x+3gENViEvtVzW/2Wq9kcD6UM6vLFnz+wTnpAP4+9LEoKnQvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEMg4oOdhSn2vP0CdGPIau04WxebWvFLjMKOiPpyYns=;
 b=eQxWiIJKj28lRZr0uiMgTRs//jDRNQMbqlBUTPoQiZjtZ/q+cONE3+LV5Ddug2SEnGLUzoxaGNPFE4JP7IWRyRCeWeJIqqi8rNi6bSnyLAsRoHWG6sidqmYIg+XOY5IYfIC+Icbn3iVXYuVzlqI7ByY+bI/qruG7H8NPYvyr7n9i5KZ9W2pNV10zxZz6cp4eYT+AUWAaS0QGtCF0d4CJyV+McWAFOn7IFz05332zjO4yxy+wnnXPlIPHioeOHlrLsaP+puXTVEp3ZRAxAoxy+a+QeMb3SrLFV1U990d5XXDr1w5CqXYIh21leG3DLfmuyE5FQ7Df8slHVA0Tr8t0JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB4PR08MB8125.eurprd08.prod.outlook.com (2603:10a6:10:384::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Tue, 15 Nov
 2022 18:46:09 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::fa9b:7e41:680b:aeb5]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::fa9b:7e41:680b:aeb5%8]) with mapi id 15.20.5834.007; Tue, 15 Nov 2022
 18:46:09 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH 0/2] qga: Add ZFS TRIM support for FreeBSD
Date: Tue, 15 Nov 2022 19:45:58 +0100
Message-Id: <20221115184600.747961-1-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0102.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::43) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DB4PR08MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: d0953492-b2a3-464f-0dbf-08dac739a8e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KuQm6H2ZVGlhD6KzxGY1ws0479aAipK2B0WtN9TDHL1HtqcUy9YTxKMnkeGJLd4t4+RjB0hGqu13zcuJCSPjFPxREzf6sW/LcAdkOmLrWe76dUAeKlz75HqWvXYg/bg7QF0q10wlIWwsM7LpgMci0HJcCcFG1FgzSIbNBnhx0BwRQtUKcnFHRCKyNfX2bWn/98GaoUhqTmVBQ6XgRUOznDug11ekPFxbE2NS9EfdHajLhFVhRPZvLD4dN5ftn2si1pZ/1vNV5onx8HiaxsKXqImORhGNWl/TS+obsq8fgYcYUf8OulxBDkTwFslH7TNQjb+wr+BQMc8owJNtYS/VAv/D1S4yHjJhFcJrJP+SM99S9fMhwen6k148zt2i21IqPn/SdlopNqPT/5BlOc3gxGKEj6K5KdCaSO6CLYm26sCTftVNXoaboOjwUPBVqZmIi0uSMVzw/c+vca9lF1hxtNn+j447riy67LHpbfkzI4Bhy40If6tM8oZStdQJb2t0x52/eJr4HuciZJUuJzkGv2EBGjSHGca/NAHQgrVXjhnKD0qrhWJ/nkdzg1/z/LYaGVeaclGWKa9WXK5q6wKwyXolTbMOconKquZi/uqB/xBCvS4wuSlEUj3y1TkS/pv9VWFyffWtYZi6kgi2cOM2AVwXsQXqtnk1V4BpKR0D997Ec6rhvdoYmebg8uoIO35/yBjElp6aiX8j5RlStU/WSkQJOK7GZXUCWZ62pPBeKHyEDTvWFehNbHVYxFAWcFKj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39850400004)(376002)(136003)(346002)(451199015)(6666004)(6486002)(478600001)(6506007)(6916009)(316002)(26005)(1076003)(66946007)(186003)(6512007)(66556008)(4326008)(66476007)(4744005)(36756003)(41300700001)(2616005)(44832011)(8676002)(5660300002)(8936002)(52116002)(38100700002)(2906002)(83380400001)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cqwLsk8ovQeIS6a7IsJz4vogwfIds1Ihvft4XMbTgli8JD60xEH6si4QY0JS?=
 =?us-ascii?Q?IhDOH45VlC2cIHBpaztG3HbxbSS7MgoLcFka7io3NMheqIPGmsLrEZgS2mis?=
 =?us-ascii?Q?sp96UF/Iwhu0VDycz2Lv8v0SeBDcxclPxvmCX2ZTwFOUnfweZzckvGd8rkx5?=
 =?us-ascii?Q?oGZfRkuUqa62Zeqj8/YfgOvZVvlv/pI017bnzns1KI3rJL0FsqoL8Ql/xc6k?=
 =?us-ascii?Q?/Ii4E1t2zNvCA3vLGc/j1rB0h44KtLqN41Ivf84QY+OJOtnJ+hQUu177vIZ5?=
 =?us-ascii?Q?xh7W/uVe6WYPXvQC7uQEGctj/Z609pdN5rBHKf+ar8IcHf53yDYDmqKSDmKa?=
 =?us-ascii?Q?Zln32XI9iiHz90QDA/mS5qFvax7XDiF8K8M/tz8+a+B+Ax0Fazo+tejpfbdT?=
 =?us-ascii?Q?sZY0l//hMCirzL8RLpa/d4I1vvicJTOxQNnP2gr2wDpeIx66n6vgxTyMglDG?=
 =?us-ascii?Q?4zRAGOCo5M5nrQOH3fQZ1GPxNiqjNayxX9lzaZr9RnUZcsQmmEV1xnuMsVQP?=
 =?us-ascii?Q?AP68eBlBUY3BJTugSMnEoylmF9FJAXEnn2qlqpiWM3sSpXMEQY2o6Zur3Xdb?=
 =?us-ascii?Q?h/E5MHdGaCH7DkSjjpR4Qj3fbc7fhq4cYytzunoEeHM3QryqC4qiKuQvckGU?=
 =?us-ascii?Q?cmua2K0gWH5pemvllv/dUyQYiJBsqZbwmbiTTNCoyFQWUJKfs3GFj+YzYBFB?=
 =?us-ascii?Q?Dt3dsQYnLWfUOBWboNRnQNT9Ebxub6TiQJI17FsE8Ir6Wvi9xPkfxEivoYrZ?=
 =?us-ascii?Q?TedDirlZEcuJQX3c+XzS5kHINq8rdUcC1ibOf2jiwSRbC25Trg9EDlSIaKH8?=
 =?us-ascii?Q?hTOa4w22PNL4dWjwSrLmuImoS6oticFSKQbgvCAEPwuTkt/iG64e3MVximnu?=
 =?us-ascii?Q?WX3G+lyr65EuifJgitGuQWhNC4zjvLFm54JgmffOXJe8NtEOYFsyBsbRCD7j?=
 =?us-ascii?Q?Kty8HVcRDsiLkrm4T65HwjVyMM1DvLMP4GAGuyKddZZrNPJjvdoAgn/xwoJo?=
 =?us-ascii?Q?vTgEhJBWK4DOJN+1ShR3v+nnYumd8h2YpSzlglpPhlkIafeHTTep1e32vuoo?=
 =?us-ascii?Q?rhksUc1pSqGqHTPNCEpvxU6zcY/tg8BWUX/YE9cSQIndJbt8+pInPd3ZiGDl?=
 =?us-ascii?Q?cR8myAkk1MAS/p1t5I7SIVOhxDrOZ4qDBvCN3BUNSAOXgVgsUObtC3/ml2sx?=
 =?us-ascii?Q?H2c0ki8gngRPnjp4Eqr6XxdCv2qqQZqMkl14hJ3Ppta275LS3nh6XaCA2Tdt?=
 =?us-ascii?Q?UNC9mTIv+5YcIpRO/QvPul1T48/duTIw4vGpzsJlU+ggIUXXt0sLcmdl2Dfo?=
 =?us-ascii?Q?N+JvQgCSPEcA0eZMpL72yKv1lB8ChfPUZHhjaMrWQa0++nLQ+HYhk7PjlTOI?=
 =?us-ascii?Q?SxSiI1tM3oeurEAOSzpFR9OnbrmXMwVXjtMYRkRYW1WSTVEOuFCMM8GgiCJ9?=
 =?us-ascii?Q?ywwOwmSGWmo6gNvm3GpPTUxg9Gqjb3i1nMMgRpSpBIkZo/81sBO3JkfbTn8Y?=
 =?us-ascii?Q?aZ5EihxWU93dTfa1xe+LmZ/+wTssZ2izSw2mb010WPn/HD0agibx3+ekIGJB?=
 =?us-ascii?Q?2IZ5MnlU2MZCZdibeLnaZ78rEeAxu5HpwqlyKPH1dae1TPIs5fYK0/d80DE8?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0953492-b2a3-464f-0dbf-08dac739a8e8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 18:46:08.9689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTbLlidl7e7ltaLIGENjEbLkc131a7rsoGQaFsvDdciLogeJ/Hrt0dJnt0A61fcG+9ljbq5Dna23xHBEsSeN0h6Hzof7yKqxJiCu+51v1Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8125
Received-SPF: pass client-ip=2a01:111:f400:fe13::72a;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Move Linux-specific FS TRIM code to commands-linux.c and add support of
ZFS TRIM for FreeBSD.

Alexander Ivanov (2):
  qga: Move FS TRIM code to commands-linux.c
  qga: Add ZFS TRIM support for FreeBSD

 qga/commands-bsd.c    | 109 ++++++++++++++++++++++++++++++++++++++++++
 qga/commands-common.h |   1 +
 qga/commands-linux.c  |  73 ++++++++++++++++++++++++++++
 qga/commands-posix.c  |  72 ----------------------------
 4 files changed, 183 insertions(+), 72 deletions(-)

-- 
2.34.1


