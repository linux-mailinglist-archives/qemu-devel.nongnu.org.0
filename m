Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F2E592A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 10:00:05 +0200 (CEST)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNV13-0002nV-2M
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 04:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUaK-0001OB-BX
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:37 -0400
Received: from mail-eopbgr130101.outbound.protection.outlook.com
 ([40.107.13.101]:9382 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUaI-0001Ew-M4
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:32:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/+W5wLZhF/oO2L/x2oNZ6nGaBU+QpQgI1gvyDchuYmtOvpqCqUR/BIE+0a2daY7Y5T52AFajhEUaxYy5sitz+G9+o1WX+uXKMhr5eIzG309nIqSHcx5xGvs0ZIbGojZEU7y57tU0T1kdvx9d9TgvV1F3Bz/rF84GeFFtqtNW+18uRQSGINrIHgAm/W589vmXEZTKMP/ky7YVExOQRJYUq7uKkMOGqrxy0rKMYPm7iqGrFDKCkqSxYihZBOsXGkYExVPPIGEwblElt2ZUKZXdC9wxwc0EZIG8NzZ7D0ko9Unfiix2NGU6Ab4zOowMiieaRhy+Qp3m018rRIIjnIAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kMlcJUVYCt3Lm+2rl3tGWUBLdrPGpCyzUuBost9me58=;
 b=d22DJtARdqNaQfUb/tjwpSScSiVmXJWAe4uuyEFu6jEFhmP/iz52zzxIen9lBQyUe6SvAJF7XDrhVAHmaLKn7LhAk286FxaMekqsw3yu4cu6FaUFzz91tZMFnB/Qzr2SGqicp+oJiceIMSXXMP5rgu6gnfbwGWLEtSBzn1t/JKuNXSK3BumM63IStYnA/BdaV5YAllvg+9UntDe0CTd3wTXx/+qBDFO+w80ihJhVSy1tJpyUVoiBBl3bVnbCCAyNpGATithkdCQMm80FzkGrA02WD6asHq6iD3aFyzovyLrDrpyIpxDnx1QHH3XfhYNkaBnEPLsxm1anm5apJYdwXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kMlcJUVYCt3Lm+2rl3tGWUBLdrPGpCyzUuBost9me58=;
 b=WJeXAz91KVD6BrXbkrFo2aivg5J7/zuuEsxezlEvjAIb6y9wPu8rIOuA8XWbj3jcCe802h5zg6do5mLey4Wv42zzMJ65YrKY9pu6fLtDP5loXVZ4WgQ2EjS2R/yf9xPppIGYT+Bat+fSGuiEtiFAHxUhVLo/ChSrJfSc2KxpnaU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by DU0PR03MB9152.eurprd03.prod.outlook.com (2603:10a6:10:471::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 07:32:19 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:32:19 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 20/20] disas/nanomips: Rename nanomips.cpp to nanomips.c
Date: Mon, 15 Aug 2022 09:26:29 +0200
Message-Id: <20220815072629.12865-21-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0009.eurprd08.prod.outlook.com
 (2603:10a6:803:104::22) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49d2640c-689c-44ea-7501-08da7e904949
X-MS-TrafficTypeDiagnostic: DU0PR03MB9152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pHB8excA4JnKD8QNR1EnzNNm42Q33DmmTnkVNUiDQMx9xN8GydJXin72wop3t8WISWtJZ10JWOVDnIWuOZ53pKgPdZ3ZJ8SkVxXkl6PiLooqI4mig4PJUa68h/MZLmQ3qR30SO5WtN5LxNw34qOz7wEm1S0GIfPFNdPgCVW9AfS6y3aIZgYrqsc6io3xBsfOAxdCtGHyU0RRzMoRQzNjxq2eW0UBxTcuoHC/fcXjJoSuYCP9TVg59zGdLIRnE7mx1ZdSgC9ZVCug2EFTxNul+EasynZSCeocDqmhak8+E7tIUqURVPYkJQvH5Vb3U3o/zxEE/Z74MV5Rki2Um1qGzwfEC8Hn2ftlo8Cr0okbBgVax/Y56tnrowshjaOQGJev/l5iqriDmueUWMxVtbvo9Hb+LHOipyOXnh+1Y1+VWJ1B7kuNXYru0smLCI+PBZi6OBhUjmG+V5Z5uBR1Oo1pRDm0Y8JwNTN0vLc0OUXDd63GQqLyhZ6c/YrdBAQQ9THx1gRZmDL+ysVZYAgykq9VCJ7W63v+TW+QfhHLXLOVBJmuGKVYtKblY/zQVM0fZYjMWkPWbzZ9iymaK3aDGge6RVaGsH8Zi5eINmoux+SoSbmqpMnZnfvedWYZm6ee51AVen5lJ+kifEkYJlSN+irbkUHF6aJi3lNECHWAb7bYW1NJzBBP3iqP1988c3d5siiIRLUQ8pTgBFJcZV9a9lHLD1F0b2r/5ABiSw8JRbY5yUKiaQGrtqxyEbmxhtnFDV6245Gw8Rtpopv7/OkV83LXqt/ZqNrq75fzQPDTk7xueas=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39840400004)(376002)(396003)(136003)(346002)(366004)(52116002)(1076003)(8936002)(5660300002)(44832011)(2906002)(26005)(86362001)(41300700001)(66476007)(186003)(6666004)(2616005)(6506007)(6512007)(83380400001)(478600001)(38100700002)(4326008)(8676002)(66556008)(316002)(107886003)(6916009)(38350700002)(6486002)(66946007)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z5beKhZ4uVhbj5IXh1PY1dpA39FONZo3fMxEoSUwrtcewv+lac1nFziYibSy?=
 =?us-ascii?Q?61LVAHhmrwphZqzdL5HeqYZ8ucqCyYnJyOCA92bDKYpBTdO5cFB99A8TgOQ4?=
 =?us-ascii?Q?RowtdxPee2AO4UFZBce0sOzKSReD+j1qJLcWNCU9DTfIDOrokKpRAZ/eHj/a?=
 =?us-ascii?Q?+NOgkszUS0KQHNbXW108qwHIp2sQMyHKvMYo1RT6E5DGf6oT5WqiMEAtU/zO?=
 =?us-ascii?Q?DzWevgHy8DUttriWuem24UAz3Ud163iVeIElrvLhgBIrZtWD78PoAheftx7S?=
 =?us-ascii?Q?suzeGOVHd7QXu8Q21rMlmAELCQsSSzlE9xcyvRD5QqPAnwUyakRQMKUWinjt?=
 =?us-ascii?Q?lzY7h9LJwU3ktr83YlrvudRU5PK5JyrCJmf6AeC4PAwzZiG78ofL7tGcUddp?=
 =?us-ascii?Q?0CRb2bq6ZAIZ8MYMuamr2yycV4WZhfDPxrrmgOUikVtbUfQvf4M4gM4bwGib?=
 =?us-ascii?Q?fI3gdT85X7FfGB34kTWb9yBgBTpFf/4JSx2M/0Jc1SYzWXKbpMRtoMX11XJ9?=
 =?us-ascii?Q?x2zNkBjSx74IXpK6fA136ETvOGwFXdel0Pj+YlAXSDprIACDBwwUZKB1rkh4?=
 =?us-ascii?Q?MwxjYDAPFI+YUo2GqW4UlggGsOxLj9l0eKz/LjlJAOi2bpbmcyqiLONPAfpf?=
 =?us-ascii?Q?hlI/2aCNgRQF0iPMAc26yX5IWhb799WI1jIoZqhBHjRyRlUnKpmDJ/cYr2Hj?=
 =?us-ascii?Q?0NMMpiaLfvkscUP7rtELPCjx9AkkD4Opq3bjZYTJSZO6Ega3V6Kjp3MZL4w5?=
 =?us-ascii?Q?NIA7I2ksomCAdLGkivbDwoj5SszRFzls0VUAbk4I/kFpXMHcp0OGgB5+2s1N?=
 =?us-ascii?Q?LZ6B6tVSpf7oBoAiRMliVdd7+UqgckCpwps/itVOeFVQl2f5JDs97sZBbIZ1?=
 =?us-ascii?Q?+9tLsnd/qJVt4rYmB8gy843sYf9+7Ws4e+3LHXmSo0sSfy4tacrmHLF0vFgv?=
 =?us-ascii?Q?vb6Q6O+Y3Oqeh1sXLqU6xZOqNKgzMwyHkXnb30mZCJJmeh7G+rBqrs72s1f5?=
 =?us-ascii?Q?BivVj2nRd5gYsv33AnEri4YkXg/TVLEkOj+5k6uywO81W83Br5RRlvcvG9pf?=
 =?us-ascii?Q?vGIkh8BfqnEmNJ+E4O+tx3r6rsSwrUJ3nCX4659ghdlcsue9nBChSHMeLcG1?=
 =?us-ascii?Q?0ZEaoQgG4qMDjHPLheNtkIuvlx0AiJ2RVuKEMTwSGRLa1tx2IvIk6AC4Drse?=
 =?us-ascii?Q?U0V7JZwWLgwoOw/A0B8INtDlV9/ggmKrw0TPbTTnxgzbb5RLkRuTUp4ZGpjz?=
 =?us-ascii?Q?6eGdbwkpdcmvPawQVawUhV7aMuUKk39DPvDWxYL6ihID6lSGJ/yGy5QQ1pGY?=
 =?us-ascii?Q?Ja9QFtwox9PDxXwRgmfv51FWug72B4FF36dGdf56sys+aM+S0l5QGevTvXCF?=
 =?us-ascii?Q?571iEEjNeF9mNLbOXhxxj8ywqkPCfucDhu25dBc8GlzEXu4LkXpWZSGxJmke?=
 =?us-ascii?Q?8z3wsdHfXRol6YYZr/yLR48Vt8YCyxJEU9pA/gCzb+kmn3FrE/qx1XxaYlZR?=
 =?us-ascii?Q?NrDIHOJcEb1dGGcX8F7WzOT1bvXkNCFqiLX1wolsgnxyvHvw+eKrJd0Wbuzh?=
 =?us-ascii?Q?wqs8IOi0WNzENxhbV3cdeptfuBoSwoYYxjyzvamHPyC9iWuS7pw03LSqFZwk?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d2640c-689c-44ea-7501-08da7e904949
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:32:19.7381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUJEoEsh5Lx+rzLxhzmCEhKETbAllAb6qTi17SI2A1GmTuGvoqVNJEbmBUqHbCpfwHSaPQLedge2OMPgw/+O7QOQ/mUkVu1yooixNMKHrFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9152
Received-SPF: pass client-ip=40.107.13.101;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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


