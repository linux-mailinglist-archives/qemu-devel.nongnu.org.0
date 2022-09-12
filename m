Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E165B5B0E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 15:23:06 +0200 (CEST)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXjOz-0006Lo-8K
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 09:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXicI-0007fP-6v
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:50 -0400
Received: from mail-eopbgr70118.outbound.protection.outlook.com
 ([40.107.7.118]:30439 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXicF-0006b3-9c
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:32:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIaTMHZ4RH+QGfAjqn7zZXkyU9BhXObZeEOlniAb3WjXdBupWlXjIcNBLmpPnJSf9/7N2CJNkZj9SvACvzhGRqin2DOXH2wqDsn8DPq9SAVVhoaiKxYWZKQlOZDfkLBXD/xK1n9mXcAaDJuVQB2EHM5TPXoYsZ78Ai+6Kv09FtvOANutAUDK/VC3zgGBe4AepENGS8GvxJKHyG+Eff1lKqcXXHV5ZJ0JlbXpeEV+rrhCT7sUJct4ZvSHnkJm4N+C6D9WUwUxf2ATDFjiZpf8rL9sboMEStjc22vFs1bPQKyXFjyho70oU1FlrB+05HdGwXROh9fkzqwnvDmkttaEmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMlcJUVYCt3Lm+2rl3tGWUBLdrPGpCyzUuBost9me58=;
 b=E1V1rto6JmDwoBGW+zeGDW0PnA+9MLZm90WrjpPwHRl4frn794erMzz3pRXFbgVe15YXmrAoZXVoaYpqmy/u4eHAWt/66k5Q/xLNizMWTqHi7lXRcVn2UViKq8f/sxMv4c2/r2GaLFyFUE5F+t2SdAyQqwtfbq77zzSzYzd64+GOtoOHW/KtOl5siXq6UheAqcjCRWsrQjE7T+KQP/4Tda+eWWdHI7wL6HQfRm/Ull3RtV6KNI1p81DFeSURCopyNLXh0MEXZ5thrucBL6Mg4512goqoIkllocpTF9l9hNpBtTtNF3TaoR5i3NDZXhodg2CaSsi4fa/PipCjoYrd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMlcJUVYCt3Lm+2rl3tGWUBLdrPGpCyzUuBost9me58=;
 b=x3tgfbXN8xbECWtyfsq6s7Cr1mJpTwRevALhSG+jZd2tm119eBY7Nlxf3yVGvg+XmXNCE4OtzLieyDtf2IGd4vkoaKmnoyoG7VoTqlP0ShjCNTcrSHa/lt3HrWRtEthfaDO0xD0TE64ypwYooctTEqeol/s7f/Nuh7L590touyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:32:40 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:32:40 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v3 24/24] disas/nanomips: Rename nanomips.cpp to nanomips.c
Date: Mon, 12 Sep 2022 14:26:35 +0200
Message-Id: <20220912122635.74032-25-milica.lazarevic@syrmia.com>
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
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bcea2c-3e26-4007-c719-08da94bae212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jy9rbhMYknjX84NFuMhIvkWA4jNtBPxIAAbYkhqEAzSUnDrDGDQI7kJyauHLtXNyjtkBn6+Nu9NBfaD6DcxIwgItoNiYS/EvdSprd+zdHq7J314pq7CZugdRI00LPITR4OCpdzRw2kTfqOOZIvUXSn36anVJOPYwHEyZTRHdHJe5H5D5qyNHrNrac4qKrqKI0qG6Zq53VogKMS16V3P3p/6kAQakUtXTa8RWrapIOdClsacLRTE1Og0lX1LhepmUACofAgSnSpZopruac9rL1DgT7Cjm55yyGuIWYywpYH5nZGS7S5u5vbWxVy8xAMgAznx7lCzycf4X9f+YSG4ecme4AjKIW9d/7jIT7qbdmsqh+/Wg8Vo/twjJZJEXu8rrAsBNolBGBAUL48QbjdJM7uO3S4regNIhi3S/qQP2WjEzIhXyeDiWUih1r8CE8RIHTrBTquIm2cEcVwgOW9vm0S11rkicrwZH0wBOlFuugRhGNdP1Dj8CgWJ6L46g77T+oq0o9fskA8pvrKGuxDgU2ez+TdhXxWlPeiz7Jan63TtjTAfmjH3kJ5OJAp03J20SEAgZRSRiRArEh8Er8JLCQAX6GYByCDwzL9I7HOfEhjA3zvPK6mSqNqQg3nGtCP+wvbDFa9gWUz2PUMrV/HfuLWDUZ3bkzJuXBNX9xmxYv/z87cRBdGA9LXgMss/jhVQluEIZe97L3nCjN+tLGtv+djd8qPEJ9di21syD3Gik2A4fG8ly0A9vAWRldswAbqmG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(5660300002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(107886003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sYPKXm+1+1OqkiG1/lr1zxTZrC7sUzlsri9Y4UZsLFrD2efimxkLE+H5PLQF?=
 =?us-ascii?Q?mZvz1M3FAcYv7bRx/Tko4FSfR7gjQkkdP6fCOwCvkyDBOWN4MKbcC21mgJEE?=
 =?us-ascii?Q?XSVi7ad8cPDzDsu/z5ZAsZWfGaA1qnWF2cvPPR/M2OpyHdYFT5k11YU8VJmI?=
 =?us-ascii?Q?jHFaWWgn7zS/v48IqtMIdAE4fZX+7wN7AnpcSpZIVmTW/fEaWejIFXtJcHoY?=
 =?us-ascii?Q?AowvugR4d2NpaZWg7QjzdolwksieIFWDLp+3vCIaLMUcZS0kOfYT8EdZRCWh?=
 =?us-ascii?Q?l/17sdNGbQTX6kgj7O43f+UO9pWGHO50Dn1GD2msUl1vsOi2AwryEeti66m6?=
 =?us-ascii?Q?KstdB8vayUkZhGN9b4NuV9H3Y62zWHhDACKFFjXAsGR8VEmf9jcWnkuW5Db2?=
 =?us-ascii?Q?mIn8F9QFDEHCht/PH1B7YYSYum9dFjC8HIVmLgDpBz1J8yGdh/FDq8xorOL8?=
 =?us-ascii?Q?ZFFihjb+z2ENJVUNnCX0ntvqJeLMgFYMg6HhFT1QMSl/V3HHuWhjRmFeMJoo?=
 =?us-ascii?Q?6HnRP9J+85pQt2he9YogSLe9PmTOJFn5qFpdMRJ8xKDs4R56BOVOT5nY0ZNN?=
 =?us-ascii?Q?sqnrpwHhEX94F+dP/+2s5U9/lF6QkRBs3bGn22O9X0vl8ppU53slUZZqncmQ?=
 =?us-ascii?Q?coLoQNSkO/9ISkSIAllCwDdCmZLIDdS0ZcMrd1DmpPzDFUt7FCbDV7neSc7Q?=
 =?us-ascii?Q?3ljOcjavAmIvf6JNqDRODv5/GZHoYjwTSzRVYVt8iqQ3ywgKKHVByqyIUHQB?=
 =?us-ascii?Q?W5dCvGPGiDlJ2H/Yj8OlKw3LVPYLlIpMmQYbrAquGxT/7bKjyliDnvF45SUn?=
 =?us-ascii?Q?5o5J55FaNCuJZOTLJ3go9+G+DlF+IES938xW9SqKuTQqQHOmQQaSnEY4EkHF?=
 =?us-ascii?Q?u3cHiKZQimUYwIu+exiRyvaSsgBNbnIy6KeKkI9tMaSyyyH8a6h9xlTCs/Tf?=
 =?us-ascii?Q?ojR1RPEjWrqEOECv3T9oYSBeh4M3BJXB5/xztBRLE8oNBbNNiW7iiFvRWkhB?=
 =?us-ascii?Q?QFBUYV4lYGsm116G5k6TZwmO0OgZ6xsn7zcN/Ii6glF3ZUH6Yy9SMA/vop1c?=
 =?us-ascii?Q?pw2fc0QoIUUyh686w0cEgA6nTwDNt9Bw/eH3T0muYsfFy40F3tfZZCurNIi+?=
 =?us-ascii?Q?4z9bYugbng99nlxkmaMDbvhK9YEve0oZAWDjHZjEfMtj04up78lWv130uLMH?=
 =?us-ascii?Q?XjcFOw35t4zVmp+r1YErr0ZEZJVu9zOWJSguafKK0pA8NhT818EYamFrKuQ1?=
 =?us-ascii?Q?HJB2QBsTE306mJYM7cdFjd1uUSN84NSXBj+Qn/rASNjKCnlYNmzPFDrdRwxk?=
 =?us-ascii?Q?PSHzExi34+0YGnFf2KYvww8ncuLwT1/UcLJOpC3SHxMXjZ/A9k3pa5dJNMFf?=
 =?us-ascii?Q?CjjVm7QqK7hJdVn4+DZtW5v8YrYWywU1o8TJIqvcZ0OXmj2ODmiCx2FlL0K8?=
 =?us-ascii?Q?l0iPptSjnCHdYhh3FaS45QjDoqn35OTgUNDFXwnUbuUmA9kosb6N2uHVaQHg?=
 =?us-ascii?Q?UNjZMB0KQxoEVxWr6VObS4dAygGVUZBpnz1cBdd0obxHZBxHBR+cQCHoiv96?=
 =?us-ascii?Q?Z0E4m9pp0ZuIJI+XLf4/sMaL0AFES1tzzRnzsJd2Dh8HAk1e1HsYgwzp1okq?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bcea2c-3e26-4007-c719-08da94bae212
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:32:40.5305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lt8jAiCL+rGo7hFCrWZXvkRz0URBBmSCWET+xOdV1g/Ny+HNDMFa+lqBUSr+pkne4p3B34p8SQ0JcsJ4huLrThIs46dlEbusAxvVEnLpIcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603
Received-SPF: pass client-ip=40.107.7.118;
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

Now that everything has been converted to C code the nanomips.cpp file
has been renamed. Therefore, meson.build file is also changed.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/meson.build                  | 2 +-
 disas/{nanomips.cpp => nanomips.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename disas/{nanomips.cpp => nanomips.c} (100%)

diff --git a/disas/meson.build b/disas/meson.build
index ba22f7cbcd..1977f5cd92 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -5,7 +5,7 @@ common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
 common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
 common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
 common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
-common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.cpp'))
+common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.c'))
 common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
 common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
diff --git a/disas/nanomips.cpp b/disas/nanomips.c
similarity index 100%
rename from disas/nanomips.cpp
rename to disas/nanomips.c
-- 
2.25.1


