Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C6592A6C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:44:42 +0200 (CEST)
Received: from localhost ([::1]:51744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUm9-0004FT-EJ
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXv-0008P7-T6
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:04 -0400
Received: from mail-vi1eur05on2116.outbound.protection.outlook.com
 ([40.107.21.116]:36512 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXq-0000kD-Fk
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:29:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJjdFvBg4e8WqjoBDlMT9or+QcosIXWnc8UdWv28u3+foSTcgE2sS6vLE+vn1aQO2lA7s12lpMORrGBa2Crx+dDTyc+uRrBScWWQhj5VE2vQIL+M8rFm8bG1P/obR7ddlE6nbkxAQJLdBZcIWkYJswHOCUfbd70vhQ5X4/r9KqjtxRf1TYUM+hQcb2LUq7d26yBad8JH7pSht7RcBe9Zd52SxCaJNnvQ5TkwqWvPja5bP27ti46HiKgrEgPzSDyEiOyeog5x8ddO/BlJM+6gVO6/usR3ae+mPk1+c65LyPt0a6ucYEOhErbGZrssKMBvAnzLX5zSaVBKoUUtDlHr0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fLuU5uh0Q9NgvwZqa3Zzh1S6AcQ9PiX1+CJL9lfeQA=;
 b=hzo0efGIt7fTfArzmeLoYsGfQ5e1cM6/TjmPD8XD2IQj46us8EZtSGCIzs26AAY0IzysXoPHeo1+jmgari44IGleX7q5ou1pKaSp8OWUsISt6PFOcJH2mChqlXCCXXnsk/fVL972vnWwo7tNaT9atg8X1hKh2H94+PyNdLtQxjDTMi0oYahGXbtTuiMoN0jErOi7q4gaC9Peb1Yps1SETyBKbk5ZEvfpTibLQNsiRxIWgjD1Ggyi9P1gy8Udx2Ht1e22Nc5arsy4tPYohr5WLsKkgw985zXcMfWAU+VHemvbswVOrHLSfZwTo2LeLTkN6LhnuPgAGvc3vV6HWxaoug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fLuU5uh0Q9NgvwZqa3Zzh1S6AcQ9PiX1+CJL9lfeQA=;
 b=j7jZYyHWjdYfL1MykmEknRfDBSYumiSehPgA0vVbfPwmd+QgfBJobGmoiLwnCy0pi9ageJcRjNONIVQMKervwD4DLHv1HpphtYpadW6/6NAujUhIXGwywxHsoJzCw9dcT8iAABtFww/h8lZoCr/ay+dvfRSTRX9S46ikVJM4av8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AM0PR03MB4515.eurprd03.prod.outlook.com (2603:10a6:208:c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Mon, 15 Aug
 2022 07:29:51 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:29:51 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 10/20] disas/nanomips: Delete nanomips.h
Date: Mon, 15 Aug 2022 09:26:19 +0200
Message-Id: <20220815072629.12865-11-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6cca5f6d-906b-4823-a7bd-08da7e8ff0a8
X-MS-TrafficTypeDiagnostic: AM0PR03MB4515:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwO5ToniJ63yITkj44EFKSI3v+PvfBTatMp442Ttzb8gwdj/SxICGdxlFUWqmOobqDKb7sZfI+SuqAoEFwEqo3QJkCblqz2DAe+ySCea1OxYhaNC27pTRmXgr9CqPBDLM0drmd4XDHKwVxV1G9m7R0xRlWFf7EuU4uvxctll13L8Z949V8WOz+ztfWQ+6HxDU4+xVshYR/OINjuqJ83kYQ3TZkGuTTkhsTt3TZI6wsOOkN9fXAJL/wGnTxem61mZ2sAAWZRKSF3Ls4YD4KMVgE0HSbQxWnZ2yF/qsG96hzHI3R6JjIsBgBjBS5u2uzs7/uosxAXqCcjDz7bkffaONk63kFVLs4jjOjtkrkhf2D84fh/aXqiMFH+Ek7pxon39ddHAopAKjV3yqoLme4M8XE3IC1SDQ6RWLr2m/9BghXHA9nExsn3aetEiWPHu9NfqowD4uWQbvI8M82K5kdyzkD3Z2KB5aVCIephITpSsDFiLUrEIiBk0zyotCbq5kP26o9G4jiZk8wSSj+GvPPz+MiImLiYY1YQAxJbLZdOH8QTHivCgy4i0RXrSpLB5XHGIpvUiwBWeifi5/aRsoDAbeb9Rj09uQrqmts7nYJMmI1Vvup6y4nHfDSluXtlhtPmmpSWNV4a6Ecy5WYbU8xXpM2UUNUKde2yc0Yb+E0oPVDrrZZI1JrzS8sf+1krNWUcouF3p6x5/Eq7Ji/uYjNWgOwbFTzNhaGwESgFWGt80jpF1UQ1yHI4VI6JHPKCoLSbuqtK1W1Xj5BpncdNjgdSLQs2atpkb9Jz9u/4kRkAVeLBhQHsqp0FCsyPAWh5imlo7ZPODl9jQzSR4bO7aOL3aKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39830400003)(366004)(136003)(346002)(376002)(396003)(86362001)(107886003)(186003)(1076003)(2616005)(38350700002)(83380400001)(38100700002)(5660300002)(8936002)(36756003)(66556008)(66476007)(8676002)(4326008)(66946007)(2906002)(44832011)(478600001)(41300700001)(52116002)(26005)(6512007)(6506007)(6666004)(6486002)(316002)(6916009)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yhPBXGNeCrUbZc/XwG8pWEjjYS6Ju8NZEq8EZTnR0x4q4OK2oawLKyp3x/66?=
 =?us-ascii?Q?55yqPUkKp0GlvIZvV/jQsekrcF3ifBT/mv0Eids2UYAfHO6cYvyoapLSXdXP?=
 =?us-ascii?Q?vnSCyrwmbTa30leUZOmH7Rt3Ociz1hQI6h8McA3pUi/XTso4KgByAN+aaCJo?=
 =?us-ascii?Q?d+SDMHo2Glfqwn1ZWcH2OS5+Y/Xu5EcxSz64QJXqBhkPuR++9sWzxX3Thusx?=
 =?us-ascii?Q?v2kMSvM0bt7azcLA79BYTroikT5JCeUTOYBOwA3xzGjJoBWBdDtyvYNT/hJS?=
 =?us-ascii?Q?S9KnTH15byIHEzwafJVdm9Vi8T3mip5VWuJTSdKU+daNZpuI+POuwUlnFZZF?=
 =?us-ascii?Q?LXNXZomwn9ApdjXHmHhSP6f8tVezt3VCvVaxPxzgbbaAvLbObsHuPwJ+G1YX?=
 =?us-ascii?Q?efIZrLaW4y66jj7738SgLAbBUba0A6DEi6MtB3zPavyIJqKp6Fz519ya6A2z?=
 =?us-ascii?Q?tREnl0dPVe8vQkQDHlQ/9OhwtwrYiQXMLhzXccuKbgSxUig80+3jWTob885p?=
 =?us-ascii?Q?rbb6eNUKlnqBB2rL11LzIjiH/CeK6S7VGhfSFKJwwF5Ve3Y7/eLxA9vytdko?=
 =?us-ascii?Q?DNN+uHDhJ46/W4jV+K5G3dm3JwaRSODhl+0d8u8EHp+XC2E6PSbmaHRTRmIX?=
 =?us-ascii?Q?SN1EuAv9aV1QmeMh8aFGC3zodbzHt3894PvlFPyQBlbRUrXRo3keHxI5MUXp?=
 =?us-ascii?Q?58VIFYDMVPg3bzt9gtoojnxdpNdDv+MOi9w4JjYk08sVIKslX1bBarX6Xuzz?=
 =?us-ascii?Q?mzOMUtDc6Vf9Agvb4zGhHvxNdlNpFxm+2ZyzIScH5E+pPKnveyyf38vpzX1X?=
 =?us-ascii?Q?T/kC92dBh+K7Fv6m75kmcUl50qhL+pedCNf4PI0gTix2U99aWXJCociCOm57?=
 =?us-ascii?Q?/fWvAvxSKwu3m7YWX6Kza3YEW5QbpKRY7A2UmnLo9yb/H/0qG+UhnF9JjGg9?=
 =?us-ascii?Q?Q0vOsibdmbTYP4XQtt2jzHJpjjOHmcqpN3S8YafcOAs8rI+lWe17Ts2WCEq+?=
 =?us-ascii?Q?HDiLlwmw8luR7o6DYmySpmshlWm009ElYUAHtL9Uqe6mHS1/QIdgdf1pdy4J?=
 =?us-ascii?Q?VADehUpbjc+LZvAbGH5NOi24QZXUPyH9moBj/3sNxakrUCJZV7ZAnORbtB6A?=
 =?us-ascii?Q?WQr1tgWpda11jT6GqFtHisiiIPbYVZ3jLrn733Vn7R4GS5Iv9c4YbDKLNe/L?=
 =?us-ascii?Q?bkKPE8H/ga7j3IAS8TH9NGkFZ0h23zNMO73OznGiXE+25rMfJ41UGRsqUbUz?=
 =?us-ascii?Q?kiprWgaRiislYeGeegg3Dxx9jBVEE9tSHUr2tA1SaFE5syMeqGCh8uLqwG4V?=
 =?us-ascii?Q?4sooL1OLDu9BUAUWs5cTin+Bn7wxC62XUxtQ2+O6vDwswV2odB7GnELLsqbH?=
 =?us-ascii?Q?ByXZSYvkJJMj/RsXHe28PI1kSULB3Rp7HjWLYigyYdxFYZ6C3oaHrtWSWaM3?=
 =?us-ascii?Q?DTsHcbYFhjIs0Uqr0q8SOwNG7ltFZgLZTlasNTWw8zvSa4apxm4eU7LC4q4p?=
 =?us-ascii?Q?k3itAwP0PkjMFOBl0oAa7hwRohCvI3ziDq6xkCtyQkD8PSGjSeRBHsg+VacB?=
 =?us-ascii?Q?1Wu00P7gULr74ImU+zrGelIkueGOTciszp82V02LxZsi8d/TAfDQq3hFfotO?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cca5f6d-906b-4823-a7bd-08da7e8ff0a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:29:51.0291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlDvaMDHePb9JJ35qz9qCSkw4ElPjHs66HJWzJ2CqfzXj4nSZLa4/3BKwz71EGw8o5UYJuVDPQXSsJc/2Lzz+eCF3FmyRejI6UsuQNEpuS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4515
Received-SPF: pass client-ip=40.107.21.116;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Header file nanomips.h has been deleted for the nanomips disassembler to
stay consistent with the rest of the disassemblers which don't include
extra header files.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.h | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 disas/nanomips.h

diff --git a/disas/nanomips.h b/disas/nanomips.h
deleted file mode 100644
index b3186971ee..0000000000
--- a/disas/nanomips.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- *  Header file for nanoMIPS disassembler component of QEMU
- *
- *  Copyright (C) 2018  Wave Computing, Inc.
- *  Copyright (C) 2018  Matthew Fortune <matthew.fortune@mips.com>
- *  Copyright (C) 2018  Aleksandar Markovic <amarkovic@wavecomp.com>
- *
- *  This program is free software: you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation, either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
- *
- */
-
-#ifndef DISAS_NANOMIPS_H
-#define DISAS_NANOMIPS_H
-
-
-
-#endif
-- 
2.25.1


