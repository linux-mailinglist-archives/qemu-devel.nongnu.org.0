Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12015AD013
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:28:35 +0200 (CEST)
Received: from localhost ([::1]:59904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9LG-00051s-Af
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xj-0006eI-2O
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:04:16 -0400
Received: from mail-db8eur05on2102.outbound.protection.outlook.com
 ([40.107.20.102]:11233 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8xd-0002pP-9o
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:04:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US096cpd+SgXv42gXcWBT2HL2Hnv8R2D0UOJg6MFED5nPojZ4E4ENZ8kTVvnpsIclOO1h1EOBAViAq4MW2wlBhBZNsOHMJL9y0DyWL9ftcK7LwLGunkWqDgIsWmTCd1cv+wYTwi3XjEgOJawxwUbOk68o3Zk6x8eiDkMVztlHsFchJj9dtew4U1jvEV21FnEVDyali8a3lzt1+6fWwK8+JA/RdHSokqsAKvixt4HBzj9tILo/ahJPOOYlbk2tsVWm9i7jvVmrYK2PNxWl+MX56mg4sOqTR1Py0AXXuhc56lubioYPsHC9JWAvRH7t+vCRvkJ4/gS/FnVl8OcDWhirA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUwvQg/EZ+at5PjG1i2F9/zboDTdN3shc1ZjNtMYGlI=;
 b=DqKb9Su/JU6etWwovJxUltYSQ6zK3qvOukwSMCUc+aBGigVs2t0VWdLymXS2AO0QrjCO4qBxvVTgCT/j+G1xCXr+K9eccaT3BPzgprhNQYlWMJRm96JIKfvIeurbsG4/Xnnv3kbt50vKLKbqQwk6ukJC6O9/mXrYB/kSMXSav/FHYr5SHm/QrIPyGy45TpGZpa+b97J4k8h4NqpVTMiGeuJGEP5m19Hx3axig4PyGGDf9qjehpZa479LXwqvQ0yyqwtDHVVUm5L5sR25DfyXsn7iVdPCPcDAMDxmdH2cN4JmWfIOLOoFd6Lb1XeQ7514N1WJZzXYvptxgH2z/pAocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUwvQg/EZ+at5PjG1i2F9/zboDTdN3shc1ZjNtMYGlI=;
 b=P1h16hiwbO1zvQOK0My1krtfKSCgwpBTloqiRiYWFe5XZTheimViFixhi590SnXfI1wFUfIknlnoZfwCe9oD1yRojB21VDQst6UlivtG6F07JJMvefV8D5ylwRIXzUhjf8e28VPav7v0PVWY0IHH2BDweLwTlSXGfAeFhmq9OfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by VI1PR03MB3871.eurprd03.prod.outlook.com (2603:10a6:803:6c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Mon, 5 Sep
 2022 10:04:01 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:04:01 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 20/20] disas/nanomips: Rename nanomips.cpp to nanomips.c
Date: Mon,  5 Sep 2022 11:55:22 +0200
Message-Id: <20220905095522.66941-21-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 02aa67da-fa0e-4597-8b7c-08da8f25f4a8
X-MS-TrafficTypeDiagnostic: VI1PR03MB3871:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cRHknMijJudg2YdO+hjNtERHmCgWc6bBkgIyam/89SWtfv1NK0pg4+XARdRLqiJ0M2DYdckEER32ZIjFzMNqP/VXPpJYH51rwg3FAOQIe7FvAGsHGRM+g3uvA/g2eHYBRTdeb8qtFjmV/UvUrjor7G4DCE4RdcI+MBiruaT17gKI9Up1xeLXIQMUioam+322Vk8Lojiwb2zRpPOLbsYOnkJ2tpMWlEDK8tg/B42Hq3SEbESnLG/hhR8c3L5zfxUEYNz4eFdXmAOXFFJjPx3Mv/JG1/zxS3TyO6jZmL7R6MYM7RIsJKtRuptY1Qp22L6gUGf0Qgttt8EI06jZEP4UjzuelDqUX/XoEqkiIe9ox0m6Pp7+hfExt5iHsWvRrGBJkWaZJg1yEKhOUU0EnWsMTow9FmY+W4Ep1h+SL2iuAXaZFrnVdZrqKGb3xMjPPAdXY8eHJNFxvq8h+NzyJPBpkv+1tXVzjaM07xc/0A9QKYw1OuGGcRspvVjpX2BC/7ajAS5L+PMIhhlEczB1yKaqcSck3JM8PFmYCef6qGZ3FNhj2mQqOKFaGI9Hx9cWUaRvROJ/kiMUafB9uA9flhh05tPEKFi+A6PF4X6dEcVrqpR8Ae1uDGJaj2USX6jFTYRIBUDM26FY7Y9Y9I6d/d7Ldo+GHp3GpQOa5EfP1LLzUHewIU3Sd4VXmbroHnM/hJcNHLLCXaqFx0gYBpxhJm819OfKd2EFnGepTRGlW9FX7i4I0rIdRVrt2o0VwOfqrjDm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(346002)(39830400003)(376002)(1076003)(186003)(478600001)(41300700001)(6506007)(107886003)(6666004)(52116002)(86362001)(2616005)(6486002)(38350700002)(6512007)(83380400001)(38100700002)(316002)(26005)(6916009)(8936002)(2906002)(8676002)(4326008)(66946007)(66476007)(36756003)(66556008)(5660300002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sFNzr/1OM+jn0utqBnrF5wuuh+L67cjU70FfepjmBdIYrMFIaPM9Ry09QuIM?=
 =?us-ascii?Q?Xf+UG4fub5qz80kSxdNsYlpzomiw1bFNGWCmG9+HXYxjq+QfY7wyCtTQIDid?=
 =?us-ascii?Q?Hm3OzI82QvaiPSj2Ha2pgcyD0+hnlfF/TpO46zHVbedj772OYaGG/CFf0U2A?=
 =?us-ascii?Q?XKBFYbLhrY186PRM7XK0n6YEM6n3mkV17ZzeJstYmEbicue86LJNZ9A880wA?=
 =?us-ascii?Q?HK1nmpZk+EgkDQGklgWvRnMDmeLANFimgZr5wF0/lVIoV5GcVcPwUrboHkbE?=
 =?us-ascii?Q?Y6UnV/t5O5EiqnUs4zQuhEQuGihO1ivxmdqNHCzxBGhHs91D6K2we+zjP49V?=
 =?us-ascii?Q?T5UHbQz2Nt3QyoWgUS36n1iowsSoqeia7tOVKR8D6KO2Ga2iZfBzPJedluEf?=
 =?us-ascii?Q?EA7EeNvi1lIonAQA/sGFcKtnvwkePqkrJX0xYneZ/rV9yGxn7sgyK3QhEKgG?=
 =?us-ascii?Q?aqFujvTNAfaSnS3mqYJbs1M+VtQsq+s8v9xKkr1IRn+X1YHe7pQUXtkThEIk?=
 =?us-ascii?Q?hgq/7yZzC5PIiqgUCReTNB8yacUkOT//91STU6ypyH+cfUzhHSDI7M9Yr+8X?=
 =?us-ascii?Q?uGo/0b2OBPMVTAU9F1cQ75m19FcMLXp1K9SilnqNLFZzg9w0rOiae0QLhjfD?=
 =?us-ascii?Q?V0VOokTylXgTy+28+t26nbdvTIIYCfIbQxZ58R49U502dy3HuzCMK0/1jS/H?=
 =?us-ascii?Q?8+VM+YdcN7o5ZKscR9Hj62Iws8rXgy0QDj2hIMO97sqzfUT8uN6mkZvp4GCh?=
 =?us-ascii?Q?aIAGYW/Wr0NpM/MrEgGTLYfzQOQrhJ+/l7/Hd897FphFifBfl+f+YLfpj/AZ?=
 =?us-ascii?Q?g5wROQ3oA8LpNCcu9YMuJgOdKss6F+K47CQy/3LX3s06ZaMattXv7H+NoHIv?=
 =?us-ascii?Q?cjvAYDpT0S/kHYd5f7aDDbhaAnXNHIw5pev8VGgVZ++L5UCZjfKNeBeLP49G?=
 =?us-ascii?Q?WulikPgpX1nC28yBgf1S65oLOuKAv5B1KZ2lpipgjmttpH92/ekitQLMesy7?=
 =?us-ascii?Q?rKrh+rRxBMz5lSCWUTOz+htuDmizeqLImHmkUlXmdsmJxLKZZ/s0XN8sL5Cv?=
 =?us-ascii?Q?Dxgi7vUj70qoe9Wo0WderPM4LPngLPof62DtBUJ5DFkbA1nzgDAHZ3WAES9G?=
 =?us-ascii?Q?BUQ3Njkq1Vjl46Njbx0ajxkoh2cBCmfOUwAvpxRwC2Emzsk6pqK8KXNUZqHy?=
 =?us-ascii?Q?OubYaUWkIiKjvq5V2S351J2axQJo0IrQlOffkV7nUXivAkb/mWuZ6lQlhNug?=
 =?us-ascii?Q?5p4e29vicYMYd61p2JGebfoCNuZCIuepOL01hB9ivbSoToGszYr0C12ityUw?=
 =?us-ascii?Q?BZGsOVk7YZpm20Ml+k0Y7SOynawE98au13tNOj+F60RKiSqnyqZfrGKtuhBQ?=
 =?us-ascii?Q?7edOcdw42LGr1Q7YQLiqkEJTqAfSQf8fo6l1aw/HDip+pkSE2GpS1WmID3AL?=
 =?us-ascii?Q?Iq25lulkCY4q4bJrqyhMgJX3VU5G7fxgGjIyziZTu2hW/mP6Hq+X86MmKBvU?=
 =?us-ascii?Q?wed7cnLMNOHZafacfPdUXBh1U6LP0Wbk+CZW7jSCEpenwZ92/a78456xwY6h?=
 =?us-ascii?Q?ewFMEUxb91MN2bPvcfFZvgqUKY95ZOJc35W2pFr9z438VAJv0RX5VDOeOhu0?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02aa67da-fa0e-4597-8b7c-08da8f25f4a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:04:00.9626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KElyf8T5Lrce63WMGv087bOEKhCcRggrvPKc9uWD4xt2cHeO4UEVEmd5dMmxJtw5MbjVvF94iwB+NEjv8bsBsTOok9joQhk6bhxso1+jkLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3871
Received-SPF: pass client-ip=40.107.20.102;
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

Now that everything is converted to the C code, nanomips.cpp file is
renamed to "nanomips.c". Therefore, meson.build file is also changed.

The explicit cast after the call to g_malloc() is no longer needed
because the file now compiles as a C code.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/meson.build                  | 2 +-
 disas/{nanomips.cpp => nanomips.c} | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)
 rename disas/{nanomips.cpp => nanomips.c} (99%)

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
similarity index 99%
rename from disas/nanomips.cpp
rename to disas/nanomips.c
index 7315484464..afe9ae7cc2 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.c
@@ -525,11 +525,7 @@ static const char *GPR(uint64 reg, struct Dis_info *info)
 static char *save_restore_list(uint64 rt, uint64 count, uint64 gp,
                                struct Dis_info *info)
 {
-    /*
-     * Currently, this file compiles as a cpp file, so the explicit cast here
-     * is necessary. Later, the cast will be removed.
-     */
-    char *str = (char *)g_malloc(200);
+    char *str = g_malloc(200);
     str[0] = '\0';
 
     for (uint64 counter = 0; counter != count; counter++) {
-- 
2.25.1


