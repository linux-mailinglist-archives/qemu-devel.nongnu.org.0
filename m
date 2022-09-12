Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906175B5A41
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 14:38:05 +0200 (CEST)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXihQ-000343-Kw
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 08:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZ8-0004dO-Pr
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:30 -0400
Received: from mail-eopbgr70131.outbound.protection.outlook.com
 ([40.107.7.131]:5091 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oXiZ7-0005rg-3B
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 08:29:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeM8PK9hyU/OQ1LGjt/DzxaNavMT4uSrMObJQiis8WKlTTYozxjEO5hU7P/8+Esh5DNDIgWDPAlg3wWnN8yRhlaeKiMQsrlKbCiFLb/Q3BQXr/EoFHEUQvEWYupfwTJA2HuJwxOgDuplvDQ8Pws1YNy/ADHl7dfEnfQCMEAjLi3ZBpqCR4Y0NThzW7vrqkp8QpTbeGL9jjhEEZb9ndJp7MV/fnYZg49ukcPxzK1AN4+8B0EmBxk7GvCF98xwW8pNDFu6aV4I7rwTsd1dNJFUTCt1pkHxNqRpxptFtxx7Zo/PIgkgmf4EMuaa3Qe9p9sWMruXCQVC55+Cvr79LpLwLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaF844un6Xw322CZ4MvVCkXLwjCShophUBJ/Hvg0r7I=;
 b=QeyLXEldpuEhv2+WAXdu+/PHE0i+CAOQpNNSHYYwyfUUYAmQ+Ft4/3I8IAVWuoaSQlTYflr2MIaV0F2Tn9gb6b1Ai8Gl72ylIYv8tycEfkvtJDtQOEjAB7NwFO8mdleIIDKpVNMUB4zLkrrsWnh1vwKrC6k6R4LaQJE8LaV0L4kOS4h4m+rEenW5Z+Gt7tbhYwyHv93VshNcZoez1MhTlvjhCzQqE0Aj9o4eoI+yHoXrrF/hUJY/BjZw0i6eLTkgp1qVpeY3zfhNo7Y22KeUoaPe9G6I+6zqnmib6qbPX1TKOQvbvvjcHoZmlEvmkrODRIuHHdQ6G+iTUtTK9f09GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaF844un6Xw322CZ4MvVCkXLwjCShophUBJ/Hvg0r7I=;
 b=e+jJMdut89hBGCsj04G2S8KHnQwE8DaP2PQNEDJZmkRisv7FCmfaYqQPR1SJXf9qVBYCDZH8T4rEvVZMFWSZhfJRme4xAJzcVsoCZdHbaBvEmLApzeV7542JzcdniBDqMfM+UoIGGvvyE8vPgV70uDtsgJ0lhk44eE/NhJtRtDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB7603.eurprd03.prod.outlook.com (2603:10a6:20b:34e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 12:29:24 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::6dde:d3f:2ed9:e27c%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 12:29:24 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 10/24] disas/nanomips: Move typedefs etc to nanomips.cpp
Date: Mon, 12 Sep 2022 14:26:21 +0200
Message-Id: <20220912122635.74032-11-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0145.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::23) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR03MB6045:EE_|AS8PR03MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 917c2e5e-7bf1-44a1-f604-08da94ba6d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBXDQRF9ZCLTayHhXH58LYOzlCwoMEVcI1yet8D4istCGNtqp1hn7SxvsAz2P80d9q2BmJgNqVybN3n/TZ5ad+kGQCimfyGbSWkcfKxiYD5H2jw/y+03pH2CvU6C40QKSzKOR2YpcVFT9ohfCDTVFqfxR4E7qGlI2jZQjtBlqAQXGhpIsD0PqYlt1mDbDWdraxkW/ZOa7jE6BKd6iPTvmqBxYKT1T8MrwLhPrViwHu1YGvNTsMKu5ry5Z25uLIrzsw1TuW/zsoIO1sxY1MThHU1gxAKXd5tHIkQeVIN9w55vfVVDBnL+uHqeTi4fSviQ8cMfFKIAr0kIXQy3IBUviXaX8AC+2iYzVbJmGsr3c0yoZVgRO37YcARq6NpK/i2n8v0nzC+lpQjG5oLaZhxFHHKXAXpkB1n3dnUs61I3KM+nvlfqqg9B9agnlyEuJOreEkHHl7gm3AItaVyTwdQLo+KJw9uyXig11eM6u50mkKF/CMYKUc6rkVUrbmFQHihVq5yemzFgJrI7q263iQMys2oVdW5dGmYRAYSvnN/PhqAb++2O6AClOb/dUjXD/vdifoxmQvVHj0R3zhBIBJ4FNQzCGbvbCfl0CvnpdJfQjHyTijlJ7pqxFx0c5irigPYYK30G3Jftlpozy++BL9JRpiDgEmQurRoZuzQp9QdQn8tZnJxnCc/20ul31PPvRzcw0B+1S7TSEAyXdJKsG4D0uHVl7VQhkL6f5vRMPvEXNIiHPK8KKjrakDEWKq3sDxaR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(396003)(366004)(39840400004)(38100700002)(38350700002)(44832011)(83380400001)(2616005)(186003)(1076003)(8936002)(4326008)(66476007)(66946007)(316002)(8676002)(2906002)(6916009)(54906003)(5660300002)(7416002)(36756003)(66556008)(6506007)(41300700001)(6486002)(478600001)(26005)(6512007)(52116002)(86362001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzk0Y3BXQ3FDeXhLNXBzZG52cjErZ0IxMlFVUkdPVHpabmV1K01TeXIwK0dZ?=
 =?utf-8?B?RW1rbEhWS0FMaWZJeGVxQm0wSGVTSVVtS2loTHl1bDQ5L0Q5WVhQNXlSZG5y?=
 =?utf-8?B?dmlaYkZXUXpvTzV6Vy9naHJ4YkZDSWExK0ozaVYrQVYxelZtaE42OGxvSlBL?=
 =?utf-8?B?SXRzWTdLNWE5WlB2bFNFcEl5MDdmNHZwYTRGRlh2RE1wVG9YdGM2cWVNZ3Q0?=
 =?utf-8?B?UWpxZjVhYkp1blJ0WHNUZ3VxZnZtcEVldytlL0RyRlBJYlZVamNWc0hkaTla?=
 =?utf-8?B?dzhKNUFQa0NjMkZCdHA4bWhJM0xPTFhrYVYrMTlTaVBJaFFhQWpqQlYxS3Fo?=
 =?utf-8?B?Mjk5bGltU2p3ZFg3bmpaZW14STcrQjhaQ1dyNEwwbENwWE5DQ21MenRkb3Na?=
 =?utf-8?B?NGZ6OEE2MVFpYWNxNXVyS2xHbXNEc21LVDIxNjFvU3RQRW5pV0RRdHpmUkJy?=
 =?utf-8?B?NFVFOERCaExQaXVrbGx0WCsvVU5aWWs2QXpuMjN4MTI0MnpkanJianAvTXJ4?=
 =?utf-8?B?c0pmV0YwVGNUZ2FFdG5rNVhsZUY1NnBWRHVRU1ZoM2ZKM1J2Nm9ibWtWMWdu?=
 =?utf-8?B?U1QvY3pHMml6NUlYQXZFaGhoZHVGWWpQcFphN3pFSytCbjB3ZStyUUFqQUda?=
 =?utf-8?B?WlRmTjY5ZVVBcGF3UVRoNFZXaEd3QmJ0elRxWkU3aTlrWWI0OE1aT01iVVVv?=
 =?utf-8?B?SktjQ3J0RGJudGJRQmlTekJFWDhvU20wK3VFZHZhWDdYNWFWQVphTXUyaHdV?=
 =?utf-8?B?bm4wTStqUFMxU25sU1c4eUZsWi8xWXA3bnZLOHg5YnpQVmlraTlQZEwyWVBX?=
 =?utf-8?B?SkJIOUVOSElMV2VuSGNlZU03c3EveU1vSmRtNEhuMXF4NzRIaDNHbCs4Z1R5?=
 =?utf-8?B?RjdvSlJIYkptV2trNkJndGVkdHlDWk1CUWYzdnhDeE5aR1hTU1BVU2VnVDIv?=
 =?utf-8?B?dndjb3pFbWtWeXJ5QXdJRGI2bGw5d01QcVpEWmlEMVBLSkpPL3RXZFlSU1kx?=
 =?utf-8?B?Mk10ZVJiMlpRZ29XMC9qdjE1d2F1RmIrbENTV3RXdHcyZ2k5SDdhYk51ZlhK?=
 =?utf-8?B?R3JwWUFYR3ZPM201Z0VvY1Y0Z0pPb2F0S2dpYlhUZkt5WjZ3VVc5cU1YZE5C?=
 =?utf-8?B?ckEvaS9JR2pCQUVPSFB6NktYNmZPRXk3cDRaM3ErVHJQSVpscEp4TEkwZ2ZV?=
 =?utf-8?B?UVplSzE4bUl6YlpLUVIxc0E2SDJkNmZjNWIrRC9xRjdjRjRnT2pEMFJVNjVk?=
 =?utf-8?B?SUllaXJ4Q1hFTjJpTjdwc1VtcFlsOE01UEI5YUowT285ckJPRHNyOUtPbjVG?=
 =?utf-8?B?Yko0eXdZTmhHdHltYWd5TUh3cTJGY2grWFZwQ3hrcDROZzZJb1BaMFRYMElh?=
 =?utf-8?B?VGhtUzZMMi9JMlhWWWRYYlVTTnBrYUo2QkpQQWJjVHNYWG8zeitXc01XQzQ0?=
 =?utf-8?B?UUJOWmhBN2NYZGFYc3pPektsdTZIMkM2d1ZjZzc4cHpBSmEvNHp1QXNDRlhk?=
 =?utf-8?B?WmtCczdpUGVOb2hMVTBvb3JHUUlDYUVUUEpwRlpDL1BtTXdvRW16OWJLWEcw?=
 =?utf-8?B?dU93K0RUVTEvVTdMSU9IQ0VLNVhIMTJuWlFub0FOUnpYU2pONEJ5UFVVdkhF?=
 =?utf-8?B?dEsrSkNRK1p2cTBxYW1LUWY1RHExQnNxeUVzYUxOWEpmMld0THd4dm52bHYr?=
 =?utf-8?B?M1h3ZndhZE9xVVFJcFlzdkhuMURFTDR5RzdFWFZ1VjdvcEZZNlVsN0ZlRmdi?=
 =?utf-8?B?R3BSMzlBVWNJOFMzRVNzZDVUSllLWWhNNlJpM0toWEU4MmlzMldwNG4wT2VL?=
 =?utf-8?B?YkFGOER5TUpZVGEyT3dQeDVjeElUTzdFYnRFYlR4ZFhWMWxkQzlUWEZHcURF?=
 =?utf-8?B?U3c1bmxXVXJKSktSTUE5R1daOWtBVUhSeUdBY3FnNE5yWUZUbjZIYzQ2K3l0?=
 =?utf-8?B?SFdjbk1rZmVuQVVSRGErZnhaUmtnNHZDdFBxRDJna1BCRnlUREJzVjg1V1Mx?=
 =?utf-8?B?MDE0eTdTNGx2eEtuRUJ4YnhXOFo0ZXkvRGxvWUt6SVl4ejZEbDl2bzlzWlM1?=
 =?utf-8?B?SDVSR1hteVA4M3VzYWlUUEVoQmR4MUZTNmhEQlpjRnRxbTE5L0lrSDZNeFd5?=
 =?utf-8?B?TkNLcURldjRHZ3ovdWhqVVBRZnJlSzY0OXUrbFJwaDlnN2RFYThmY1NwWWMx?=
 =?utf-8?B?SXc9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917c2e5e-7bf1-44a1-f604-08da94ba6d37
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 12:29:24.4964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TavzGshXNEE0NoXdsYDihRrbdGyQW+VJbGrGo0YqPdg/tLTaraDPd/XcOAHRAhWWLBFqyKAFHViWK74RbkBYadJV4Fb/4tPD/C5gEY2F6/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7603
Received-SPF: pass client-ip=40.107.7.131;
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

The following is moved from the nanomips.h to nanomips.cpp file:
- #include line
- typedefs
- enums
- definition of the Pool struct.
Header file nanomips.h will be deleted to be consistent with the rest of
the disas/ code.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/nanomips.cpp | 57 +++++++++++++++++++++++++++++++++++++++++++++-
 disas/nanomips.h   | 57 ----------------------------------------------
 2 files changed, 56 insertions(+), 58 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 3b5e6d520f..7fed1abff0 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -36,7 +36,62 @@
 #include <stdio.h>
 #include <stdarg.h>
 
-#include "nanomips.h"
+#include <string>
+
+typedef int64_t int64;
+typedef uint64_t uint64;
+typedef uint32_t uint32;
+typedef uint16_t uint16;
+typedef uint64_t img_address;
+
+enum TABLE_ENTRY_TYPE {
+    instruction,
+    call_instruction,
+    branch_instruction,
+    return_instruction,
+    reserved_block,
+    pool,
+};
+
+enum TABLE_ATTRIBUTE_TYPE {
+    MIPS64_    = 0x00000001,
+    XNP_       = 0x00000002,
+    XMMS_      = 0x00000004,
+    EVA_       = 0x00000008,
+    DSP_       = 0x00000010,
+    MT_        = 0x00000020,
+    EJTAG_     = 0x00000040,
+    TLBINV_    = 0x00000080,
+    CP0_       = 0x00000100,
+    CP1_       = 0x00000200,
+    CP2_       = 0x00000400,
+    UDI_       = 0x00000800,
+    MCU_       = 0x00001000,
+    VZ_        = 0x00002000,
+    TLB_       = 0x00004000,
+    MVH_       = 0x00008000,
+    ALL_ATTRIBUTES = 0xffffffffull,
+};
+
+typedef struct Dis_info {
+  img_address m_pc;
+} Dis_info;
+
+typedef bool (*conditional_function)(uint64 instruction);
+typedef std::string (*disassembly_function)(uint64 instruction,
+                                            Dis_info *info);
+
+typedef struct Pool {
+    TABLE_ENTRY_TYPE     type;
+    const struct Pool    *next_table;
+    int                  next_table_size;
+    int                  instructions_size;
+    uint64               mask;
+    uint64               value;
+    disassembly_function disassembly;
+    conditional_function condition;
+    uint64               attributes;
+} Pool;
 
 #define IMGASSERTONCE(test)
 
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 75abe03bba..0fd7299900 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -23,61 +23,4 @@
 #ifndef DISAS_NANOMIPS_H
 #define DISAS_NANOMIPS_H
 
-#include <string>
-
-typedef int64_t int64;
-typedef uint64_t uint64;
-typedef uint32_t uint32;
-typedef uint16_t uint16;
-typedef uint64_t img_address;
-
-enum TABLE_ENTRY_TYPE {
-    instruction,
-    call_instruction,
-    branch_instruction,
-    return_instruction,
-    reserved_block,
-    pool,
-};
-
-enum TABLE_ATTRIBUTE_TYPE {
-    MIPS64_    = 0x00000001,
-    XNP_       = 0x00000002,
-    XMMS_      = 0x00000004,
-    EVA_       = 0x00000008,
-    DSP_       = 0x00000010,
-    MT_        = 0x00000020,
-    EJTAG_     = 0x00000040,
-    TLBINV_    = 0x00000080,
-    CP0_       = 0x00000100,
-    CP1_       = 0x00000200,
-    CP2_       = 0x00000400,
-    UDI_       = 0x00000800,
-    MCU_       = 0x00001000,
-    VZ_        = 0x00002000,
-    TLB_       = 0x00004000,
-    MVH_       = 0x00008000,
-    ALL_ATTRIBUTES = 0xffffffffull,
-};
-
-typedef struct Dis_info {
-  img_address m_pc;
-} Dis_info;
-
-typedef bool (*conditional_function)(uint64 instruction);
-typedef std::string (*disassembly_function)(uint64 instruction,
-                                            Dis_info *info);
-
-typedef struct Pool {
-    TABLE_ENTRY_TYPE     type;
-    const struct Pool    *next_table;
-    int                  next_table_size;
-    int                  instructions_size;
-    uint64               mask;
-    uint64               value;
-    disassembly_function disassembly;
-    conditional_function condition;
-    uint64               attributes;
-} Pool;
-
 #endif
-- 
2.25.1


