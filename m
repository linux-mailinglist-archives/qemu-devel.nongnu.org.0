Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D451A1E9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:11:25 +0200 (CEST)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFiu-0007H0-4U
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCsv-0003ms-AL
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:09:35 -0400
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:41294 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCsq-0002KR-Pt
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:09:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcQOHPozcnDumi3V4N9TsYAbYxPYHAfzyiQtAd8esrW1ydYGdefECUgeXphLNcdGjbQCRGEExF3IOGOdcGNsQD0CJy/3hqsqtvqav6VewYW3Mm9jj7RFhaHOigzZkp+t4WW6K7crjaW0gWcGtPlWaXqTmkll69/X2nzf2XPf+nDCBD7mpR96vnNvDnHi9th+DlsQ6aN5a2zfv2BCi5JD7AgVr28G91DGbIip28NuFW3nh2dooWPYcsMNxLac8AM+9zzqgPriD/QX7WLYjYhwU3Eh1Kx4qEPmHvkIAMPu/kpVgYM5BmBaJ8cw0N4K0HR2ye05vGL3fzX+6e+vCfyIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2COhxjV2uDL/oJ3JdRCWk27DPTp4+rt8OWyF9JgGQMA=;
 b=Vi+vbHYgtSxJOHM5/EwS6bOMptlZqz1i4LFVf7/OP2TPvUDoh7EEknwbrFUWTp5PAWVViiOq5N8qxadry9c8xg3y7cKUhz1faQL9oYPLe6k+DSszh3BKNSpVpgMU0+KalftqCqvJz8c0Io9E7jXdrcVPUeQEr2gg4GpbQDR+x5BTdRdMYYyel4gfPWQ4Q+9Rh5G2tojcetR3u8V6OAuZG4wsSzazTMDbP0I7FbNaJprAsUPjp3H2YqtyWAjg12eIZEq5icuMFeGDMNErho8Qo6j6ZV2csw8QkrSinK45KPdurN5TSbIlQxS308bFF/ZyhGQjyUet7uJ3cyPjBTMBbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2COhxjV2uDL/oJ3JdRCWk27DPTp4+rt8OWyF9JgGQMA=;
 b=rJZS0omcDlwXVszpGCvyhR+878ogQSC/jX0AqN3mCOhEzlH//ffUHVrEJHSxOeT8KBf43ypK9/yFv27g7o0JqhwddT+8Zk7Ss9rvmU9ngUStVzfgc+ByKXMMEJ6mdzJnlDvySZw8ugt8fhdlq5Enw7yKLjN5ukXh39bbXw9QgZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DB6PR0302MB2631.eurprd03.prod.outlook.com (2603:10a6:4:b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:24 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:23 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 3/7] target/mips: Fix emulation of nanoMips BPOSGE32C
 instruction
Date: Wed,  4 May 2022 13:03:59 +0200
Message-Id: <20220504110403.613168-4-stefan.pejic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5f434b0f-3188-415d-cb6d-08da2dbdd8cc
X-MS-TrafficTypeDiagnostic: DB6PR0302MB2631:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0302MB26315A6D505AF8783E45224CF8C39@DB6PR0302MB2631.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBZRxvh6txKM00kf+O4+I9ESawqMifctMJdea58N1H/uFatFmIJz2hDfUu4zt0d5mY197vlyMO9Tf6cysxcU+Paddo0Fy8hER2q2kQJ7wJqOM/KFnt0SwpDj2RPtf58y6951WIN/WclDW4MIOgPORIyN//lBZrQ1eFpqeqjsNW7Pi29tk4e5QGeC9O2FacywLn2UFwFSvwyFXc1OCX1QC7c6nxMZMvL/SIkhjRxq8d2yQepPzh7TPCwHxsHG9ppy51ANT+8AjWo0neqjkZXf+V/SvuyOIME0bdjofQJU4in7sFIbLIbG8pZyaItR0JzzWIqfjSmbjmL+vWvn4mFPM9XSikD1ITVhnXJlhjOHhU2xWct8fe+cADndxyip54UffOepJxG42ta1AAmO3zMAHARxi6Xz0jermQUWns/1kQQJmJN0ZZiRTe3J6rG9Hj0zMJrp3wLIA51djQgYfeFm0hQUm21T+6wa+6W1Ka4Zf+yTqWlw2LSy9I/IBSWWoSm5S3ea1+W5DkK6MJRAE0IO5SBM3KsKAiJ0Qrz/lC0lGeoJ55Fry/FHvjMR/x1IMKIFrEjytu54BXHyFcO098+As1LHKgYr+cdypeB9zSuga+dSVdwi+wAfK8IsYNDwgnWfNwHTsiF/ptGpgbXBCSF8Z9P4uTwmvkUeMACSY7SHlHycVs+EFcKaTiHvkrBbltzA/DVHRqFofhy6iR+G3UJzSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(396003)(376002)(136003)(366004)(52116002)(2616005)(107886003)(26005)(6506007)(83380400001)(6512007)(1076003)(3450700001)(36756003)(2906002)(44832011)(8936002)(5660300002)(6666004)(86362001)(4326008)(8676002)(6486002)(66556008)(66946007)(66476007)(186003)(54906003)(6916009)(38100700002)(38350700002)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vBqO3VkjXo3Yl3oefPnDwqMbM/vak9g6nKTEbXimFhvQQqJHUWpF4YWaeD5?=
 =?us-ascii?Q?4o7Pxj3TokO51oMxrDCmy/yIA0AKE/P1qgEgjzAPU6Z3BveUbxlcrZS7hHCQ?=
 =?us-ascii?Q?OytLJBz3nEs2eXQqOBqUhyaqxIpz/dLJLtQOzU9rLZxovvwO11zlNyZLmkUx?=
 =?us-ascii?Q?9Gak72OF6BEdj7zdtfw9Jjkn47mnf2cPcPDG1p0io4LG0UJi3NqvBpXAAS1g?=
 =?us-ascii?Q?el3y87tepJdBLNwAqmjhEvw8k9kwkA3Y1eBTtUWr0KOq/+x0iw1yLBmGlM6X?=
 =?us-ascii?Q?zpqIU4gI+gqKAqwvuFR+RFkHoISagtBSkIaPZJWKejT/omxhaG2KVlznvMZT?=
 =?us-ascii?Q?ydp1du+WHkKiSZDTGeEoZQAp5fLMaP36XuEGedGp4yL/G/MUQfNOyfoGTl+i?=
 =?us-ascii?Q?7FgPGSc/NnDG75di8fYjWP8fIyl6SaapTZMwPxWu7dIQRg/WAXp0c7niTrXg?=
 =?us-ascii?Q?PGqKNZC4nux6FRdGVPEG3If5Z3+1Q2w3tssoEjAzBGD4pxyIHF7YNP5Z0sWH?=
 =?us-ascii?Q?aAHYm6IaZF+9PSXDvLIGm3/oy6XQ5lZiWtdHzCtPGLhQ4zZnUuyZCxtPLdLm?=
 =?us-ascii?Q?6q/VoyhKQmbIwafHHbmGjaYUNXs1IDfvHHiy5jMhZaFabLJoQmhcKNkuq2D8?=
 =?us-ascii?Q?o41FsRWh8szilXKZ/+DF+0PENDZQIijq19amXUea7CRw1GoXCidNFpbw2zqe?=
 =?us-ascii?Q?ZILobeZX0Pz8vICEbb/AYAlohyCM6szd67B4NJvIfMVl1DDt8TJ6pcYZEG3m?=
 =?us-ascii?Q?mq0yaUoCxTRwrHlTgrvTWNCe3rz+3DV6R3nbKLEcsDNrBDM2Xvp5O5DBW0GC?=
 =?us-ascii?Q?jIR0v2hb44Ly5obRPi6z+aZw/IOvpVzH/On93Bu9JtDy63RkCBiRtMvS9Ruz?=
 =?us-ascii?Q?JPfKwYlogclvPOgx3S2zqMCoe90nc3+bfM1xJaXsUCGY5aLFR+0reHdzOdyD?=
 =?us-ascii?Q?d9MwWb+7jh56/PN8/Liazqb7WptdwxviOuNu5z2Wt9OCkpdsoE5o+q+u5kmH?=
 =?us-ascii?Q?FGw9zIi/11KMLZ2kFIj0NGpCxY4l6T411TfgG5BsGN348wT3NPYjyq3Sx4rI?=
 =?us-ascii?Q?wtjqh58Z7MvfNNYLlBofwe2YgmHytJbWmWH057walRW9pZAQBdiF8Jn3z0it?=
 =?us-ascii?Q?Qtp4MgPgcauaGM7kzD7tLJtBED44QvgvSDr1mANKUXkQZhhC/9BQIQnc3l6f?=
 =?us-ascii?Q?kDXJPUHSDrYRE4RFct1OSYC1/Cl7aA1xYyXnBCyUn+Fag65/23QSw8THFm/Q?=
 =?us-ascii?Q?ekx7xLecLHyTZLzMC3tQNxkLWq5xvwQwkVf6s0i+AaBUr3bvioL7irrNPEPt?=
 =?us-ascii?Q?UfqTJ+siUacTJAkq9Y2FV0h9ohxahqrdB7NWjnQA6Jub4MBJg5FKmCgzXDAA?=
 =?us-ascii?Q?cX1wU11/RrDWM1wB+QvkjJdQ42EQ9XKrThUKUnK80y6SlrFyB6m0U6d03SSe?=
 =?us-ascii?Q?Rpk3hZuno/ZFdrN8RBY4gZVAYtxLQKiRMKr9RPYZVvt1bYS4bObOEaJFXYuI?=
 =?us-ascii?Q?peRLjW5EQTK9SMcRj+KUJSUv0u/yZINhcX7CYw/838bIeN13O3tiycTnX2FV?=
 =?us-ascii?Q?dMDqfaQjBusuo9mGm66u3TIHeUvWisYQCdKYoOc7k7HQ/Ejg9/fAjh6WrKEi?=
 =?us-ascii?Q?2gQZyh5G2f1shvHe2CyM6uvISRBhszEc9PtSj0YKuwHeWIrtRWiKIsDDIu+O?=
 =?us-ascii?Q?0SAKGJK84a23P0wrJ2VUf31sa/WpY4HVL6K/5ldqiIbTRCo6ZzxFdiaAwUV0?=
 =?us-ascii?Q?Q3aOyrlGCbM5jhwTaVMBRPvAJ89AMOk=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f434b0f-3188-415d-cb6d-08da2dbdd8cc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:23.6965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDAo9Dx5b6IFob3wL7jJeUeTIUdSB9bNkFYMIqooXhTzyo1w3qVe8vbNrfCI8hqqZPaLOvG5IYyjMdraWgy4Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2631
Received-SPF: pass client-ip=40.107.7.90; envelope-from=Stefan.Pejic@Syrmia.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>

There are currently two problems related to the emulation of the
instruction BPOSGE32C.

The nanoMips instruction BPOSGE32C belongs to DSP R3 instructions
(actually, as of now, it is the only instruction of DSP R3). The
presence of DSP R3 instructions in QEMU is indicated by the flag
MIPS_HFLAG_DSP_R3 (0x20000000). This flag is currently being properly
set in CPUMIPSState's hflags (for example, for I7200 nanoMips CPU).
However, it is not propagated to DisasContext's hflags, since the flag
MIPS_HFLAG_DSP_R3 is not set in MIPS_HFLAG_TMASK (while similar flags
MIPS_HFLAG_DSP_R2 and MIPS_HFLAG_DSP are set in this mask, and there
is no problem in functioning check_dsp_r2(), check_dsp()). This means
the function check_dsp_r3() currently does not work properly, and the
emulation of BPOSGE32C can not work properly as well.

Change MIPS_HFLAG_TMASK from 0x1F5807FF to 0x3F5807FF (logical OR
with 0x20000000) to fix this.

Additionally, check_cp1_enabled() is currently incorrectly called
while emulating BPOSGE32C. BPOSGE32C is in the same pool (P.BR1) as
FPU branch instruction BC1EQZC and BC1NEZC, but it not a part of FPU
(CP1) instructions, and check_cp1_enabled() should not be involved
while emulating BPOSGE32C.

Rearrange invocations of check_cp1_enabled() within P.BR1 pool
handling to affect only BC1EQZC and BC1NEZC emulation, and not
BPOSGE32C emulation.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
---
 target/mips/cpu.h                        | 2 +-
 target/mips/tcg/nanomips_translate.c.inc | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5335ac10a3..04812e84d5 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1076,7 +1076,7 @@ typedef struct CPUArchState {
 #define EXCP_INST_NOTAVAIL 0x2 /* No valid instruction word for BadInstr */
     uint32_t hflags;    /* CPU State */
     /* TMASK defines different execution modes */
-#define MIPS_HFLAG_TMASK  0x1F5807FF
+#define MIPS_HFLAG_TMASK  0x3F5807FF
 #define MIPS_HFLAG_MODE   0x00007 /* execution modes                    */
     /*
      * The KSU flags must be the lowest bits in hflags. The flag order
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 9ee4df2135..941cfaa6bb 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -4478,12 +4478,13 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             case NM_P_BR3A:
                 s = sextract32(ctx->opcode, 0, 1) << 14 |
                     extract32(ctx->opcode, 1, 13) << 1;
-                check_cp1_enabled(ctx);
                 switch (extract32(ctx->opcode, 16, 5)) {
                 case NM_BC1EQZC:
+                    check_cp1_enabled(ctx);
                     gen_compute_branch_cp1_nm(ctx, OPC_BC1EQZ, rt, s);
                     break;
                 case NM_BC1NEZC:
+                    check_cp1_enabled(ctx);
                     gen_compute_branch_cp1_nm(ctx, OPC_BC1NEZ, rt, s);
                     break;
                 case NM_BPOSGE32C:
-- 
2.25.1


