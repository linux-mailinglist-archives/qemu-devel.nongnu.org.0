Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEAD592A6B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 09:44:32 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNUlz-0003ns-C5
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 03:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUY1-0008Po-1o
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:05 -0400
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:52230 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oNUXw-0000jm-7T
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 03:30:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhyyQazO3KZtEhQ5W9AGN3+A7Q2Tf6Fo+SIgaZcKS0X3rLlR6vg8wMQWhXXcl4K+gykiToZjFIcgzxGiCwSFQj//SKWR9r6mogcXdT1zATzMzmtFD1D5PxKNe9v0ndsPO+j7dtJkAXbJ2yz5cNLKAWfiVimO3UfwtfgOAun+AYMi0jywudyxkkNpRFoT4Y+5t+J0DRfXWe13hMhOwGWrh8Y0TT8U+cunHPZ+v59s4OgahAaiQ3tJSj+B426pgeWZ1XBA0X9QpZPwLIB2+3YeG3PvWeeBEqQBQO523drqCHaj83cmt37c0GAoqUnREhPt1C6jx6fOTzT0RQdpXgQDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lD5b2/sz0Py2pT9CVbKmSQgDbv2uOIY7PBJ0yDfeL+Y=;
 b=Wz+bFBnpihOv6utf/2fLRO08QJewv0SndWlnuNAFDge/xxSdJzqKSvD5T2efuAi4+vymLcLr1Wxxp3SVLjCW2xje3x0mqPVyquUah7yE0F4E9fvFu6Fr+fMtMW0ZuMVo3Ua7GPgGHDUdkTeT6KjKv4Zx9LvrlUmknSb8qWlDWTKGsIPL++hP9IspGCZPg3inj+/3wBsbEV4XiPGNVZZfOtLvfoHCCWSXNxWbFpDcMLUbDD37XZnttJb4VAW/MLucIi5C59rd0sv8HMk4panfGFXAOFFtP/rzKqUJvNWLZw55IHGEcAQFI84KyfcSdjIV0qUbPLSS782b3Jm+yGsgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lD5b2/sz0Py2pT9CVbKmSQgDbv2uOIY7PBJ0yDfeL+Y=;
 b=a9XE6rL0zKucZmMN8hmhYR82l9Fk9fUuaaK/keN0q/IATG1RFmmIowiceM7Gj3tFYiPIp0YRECRCnQjExS8M9YKLqskwgDDhRCnsgZiEOcBTcGdpEHdrambHE1tBdW/vWX9hjG37wk+2Zyu8XaDklH5HEWZWWw//F/WbfH6p9x0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by PA4PR03MB8134.eurprd03.prod.outlook.com (2603:10a6:102:2a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 07:29:30 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::7996:9fde:76d3:745%5]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 07:29:30 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH 07/20] disas/nanomips: Remove Pool tables from the class
Date: Mon, 15 Aug 2022 09:26:16 +0200
Message-Id: <20220815072629.12865-8-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2f1ee26-2192-4649-853f-08da7e8fe424
X-MS-TrafficTypeDiagnostic: PA4PR03MB8134:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gJfmhgOEAcQl3fa/terAEe08SK3OZcylz1GFY/5ZaA58P742ieVXoodQ+BbrK51t2zNWsTy0uLddStnLUxmYdXXZxpdz13ywdmczRaBlCSusS6LmadlwIQ1TRnlXzxbkoxfA2rwJgRM4rLPDddWWRpOI8Hz1bWGYbrGdLRMcUOwIGo0imFqPq3GKjNCLN3OwW5+H5MK8bpb+rwTqjw8ZH3Oi1FS5UX7dm4jJaajbYQOPzI8V6+d51l5wAak/X/lRwWx5kTi4kJ4x9qDm8zfCtgIACo1pHOgsClAaKuJizMPitTXrp6Unl65aoFuSi9k9+VIwCMeyij4ZfJY6cDQPlTDlQNHI9k9juWz4UJPvoy7DezBg4IXlsOxYdr8iyOoH+igBi9WdJUnVJ7KQIXo4b29Q4NyQhXs5WIubxZPmOBxp5P0tGr05ZXorI9iXz2kAogBC6kcn7whuNPQO+Q8pTnPZzxnbv3UySnFhvCukjisLtggUypPLxJTnhhEWXpnWGzqrMfM9h3F4f+1WZq5bxYTXfsLKVdf1dTLD6+IRu3TZWhjqYuvtcdqqiheywX5SCXUE472non2yACWyYG4siU4hF2FPYOQfZN/sj4d3AeeChhJA8aLUzIgBHam6YbhCxBYCkme2/3TlzzwI7kRI3Fjh7HXtE6F3i+S8AYxqNkP68YBzdlzUGNHqG95swvHa5oZNOAfc7O1g3FymEjNgdhNaYYuhN3IgCy133dhl36hLzBylaHrX+9aj4nOV7URM64Ey+yS1Vh53HufKqiToTOWNrdiotBHXqBnmBNfJ9KU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(346002)(39830400003)(136003)(396003)(38100700002)(2906002)(26005)(66556008)(5660300002)(66946007)(66476007)(6512007)(52116002)(6506007)(38350700002)(6916009)(478600001)(6486002)(107886003)(41300700001)(186003)(86362001)(2616005)(6666004)(316002)(83380400001)(4326008)(1076003)(8676002)(44832011)(8936002)(30864003)(36756003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eZ11LvEu3FYM17+COmLyjUxurYKAuXabogKKCXkxFHvvVo55K1+S8ki8/psb?=
 =?us-ascii?Q?Ihn9NEwQ0V8EjB1/PCZ+r7CJfUGCFc+5E2vFRcVpthVBal0zMaOJFWVsrSMi?=
 =?us-ascii?Q?H3CNMM/SQjUE77j+MINOj6Qcyu/OLKiLwlcAsxEmR2JFQBRU8dRaFqjC6un9?=
 =?us-ascii?Q?FTLSPZy8R7vBndHuYbeXNUNz0unqIFTu5LobuZd1ZBH3yX92xL/BKMl+Yz4/?=
 =?us-ascii?Q?AOXe/2uKxzVUdzodvw2ho1tsPSbvxuJQy97HjYLrypuE0vgumZC1HOvldNeG?=
 =?us-ascii?Q?rpQF9oSjQWdfiFzF0w76VAo+q6nfes+fldmaVdg2gQxMi5UMCt/gav9hugj5?=
 =?us-ascii?Q?IphT6M5sETGzCjhYyxoM74rdtkDEkADLy5v6vxMe0XC8ankgFKN913YpYqcu?=
 =?us-ascii?Q?CTZhVF4MyVxesZxlX8F9bTfoaZ6SetQtxu8IguZZHbk8aY3MgZpiD9bxNgaj?=
 =?us-ascii?Q?RJutd8xsWYhvMCB1Y9/+2/GduNXaOAl0VAHJ/6NTfR7jv0QzE4x65z+r93YZ?=
 =?us-ascii?Q?doSA/KCPZB0BUFKzBjYnCH44OF9cePXUtJcmhOCthMUSe/tD3pgp6BxvZxtQ?=
 =?us-ascii?Q?Awo5ikrxsAfvYMcCXJFPBBJj9n+JFs2qejMtLG5hG4s9ZJZHaNkPXquWHblZ?=
 =?us-ascii?Q?Yf/ZOLHEf+hUug26whHfV/ms+1JE8p2fVC6F16ayL0PjrAt962haV9vHePBA?=
 =?us-ascii?Q?H9Za2AaiHXKag9rthqER6P6HmCCYp4huhoqr14YEm1O2W+VtVgtETU11brk5?=
 =?us-ascii?Q?Qd1GA7ys2o+EWRdMy3MNHrMDXxy9iz9PQPBGsoWFoT8XRZhGvxGekLQKG3Py?=
 =?us-ascii?Q?5MKSICqaUrejfVPu7979voHfjPiG8o+WZKHfvz43+24WEllyL7MJ2i9V8Taa?=
 =?us-ascii?Q?OcQ2s8LXo9S3oT7j+J8F8lpRYbgLlHvzlH3cpPDVBZjcoXAblzMvwfgZOdc8?=
 =?us-ascii?Q?5RoLIM5ybEcItK2zEgZJFX8O1MqhtbIzOrYZm4VATDXaMXjLUq8R/BY+90Iz?=
 =?us-ascii?Q?jNdOdZMmvBalzCCpu+uGIp8lhhrW7SUzVSkTQHBInk+xY+6c6oAJ3UvEEZjO?=
 =?us-ascii?Q?ofwwTiIlSHdv1+xymk+ufphulBSpSzkC+s4SJIcEwJCIrC+YWcESNdHmYE8H?=
 =?us-ascii?Q?WB4U0MOKRkVIzhvM4Jyr6Ly0rZ5F3HGTgE66e99T/TUtZBUqMhP2n7h6pCLy?=
 =?us-ascii?Q?lAzFY5bRIVbYgJxvkfUBC6NMh4be//VZwTb+Jvlhmy+Jkm9ak1HPwNP+537E?=
 =?us-ascii?Q?P/llMNNtnkLLJxjG6y29NJbZR2x9UugMqWURoqti2kDoWw2gkh1hbe+MHyoh?=
 =?us-ascii?Q?bOHBGwtzdAlJQMXZdxja+fKZNJnuIwGMrZJa3HePS4RPiK4H2FKF2/WHk0sP?=
 =?us-ascii?Q?okURuc5cK2jRHEDrawQdh5taXU2qJezvMTLOCB0DNDfWnVK99p9G4V4ZXp1B?=
 =?us-ascii?Q?sbFYO2USIDsZHxO91R+Bkp06oy/L7HGXhvntEXWFI77RaQdEVwDd8zu9uNoi?=
 =?us-ascii?Q?ycav6UOkUR0BhKE3HbXaOz/RyvtZeU4pdLg8Q+Is8w1I/u27yxPj2cbAJGXX?=
 =?us-ascii?Q?2WoWi0r00lw14Xxt8r7Wg27s4zdOwIc+dFkKwp78s9PwfmJJnXWOcAl5Ec0D?=
 =?us-ascii?Q?MA=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f1ee26-2192-4649-853f-08da7e8fe424
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 07:29:30.0774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qIJK3/q4UKP/I7XKdijWzoxcSNZlTp2s00tzkLkYHhRAoTPDiK35X7vFbiTAO95q+sVHT+E9TzQeqncSKwzUQpbl+n2ODT0BAhnFgwijpI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8134
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Pool tables are no longer declared as static fields of the NMD
class but as global static variables.

The NMD::Disassemble method is using the MAJOR Pool table variable, so
its implementation is moved to the end of the nanomips.cpp file,
right after the initialization of the MAJOR Pool table.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 363 ++++++++++++++++++++++-----------------------
 disas/nanomips.h   | 201 ++-----------------------
 2 files changed, 193 insertions(+), 371 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 205c4f3143..c35ece428c 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -757,13 +757,6 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 }
 
 
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type)
-{
-    return Disassemble(data, dis, type, MAJOR, 2);
-}
-
-
 /*
  * Recurse through tables until the instruction is found then return
  * the string and size
@@ -16674,7 +16667,7 @@ static std::string YIELD(uint64 instruction)
  *
  */
 
-NMD::Pool NMD::P_SYSCALL[2] = {
+static struct Pool P_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfffc0000, 0x00080000, &SYSCALL_32_      , 0,
        0x0                 },        /* SYSCALL[32] */
@@ -16684,7 +16677,7 @@ NMD::Pool NMD::P_SYSCALL[2] = {
 };
 
 
-NMD::Pool NMD::P_RI[4] = {
+static struct Pool P_RI[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfff80000, 0x00000000, &SIGRIE           , 0,
        0x0                 },        /* SIGRIE */
@@ -16700,7 +16693,7 @@ NMD::Pool NMD::P_RI[4] = {
 };
 
 
-NMD::Pool NMD::P_ADDIU[2] = {
+static struct Pool P_ADDIU[2] = {
     { pool                , P_RI                , 4   , 32,
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
@@ -16710,7 +16703,7 @@ NMD::Pool NMD::P_ADDIU[2] = {
 };
 
 
-NMD::Pool NMD::P_TRAP[2] = {
+static struct Pool P_TRAP[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000000, &TEQ              , 0,
        XMMS_               },        /* TEQ */
@@ -16720,7 +16713,7 @@ NMD::Pool NMD::P_TRAP[2] = {
 };
 
 
-NMD::Pool NMD::P_CMOVE[2] = {
+static struct Pool P_CMOVE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000210, &MOVZ             , 0,
        0x0                 },        /* MOVZ */
@@ -16730,7 +16723,7 @@ NMD::Pool NMD::P_CMOVE[2] = {
 };
 
 
-NMD::Pool NMD::P_D_MT_VPE[2] = {
+static struct Pool P_D_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1f3fff, 0x20010ab0, &DMT              , 0,
        MT_                 },        /* DMT */
@@ -16740,7 +16733,7 @@ NMD::Pool NMD::P_D_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::P_E_MT_VPE[2] = {
+static struct Pool P_E_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1f3fff, 0x20010eb0, &EMT              , 0,
        MT_                 },        /* EMT */
@@ -16750,7 +16743,7 @@ NMD::Pool NMD::P_E_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::_P_MT_VPE[2] = {
+static struct Pool _P_MT_VPE[2] = {
     { pool                , P_D_MT_VPE          , 2   , 32,
        0xfc003fff, 0x20000ab0, 0                      , 0,
        0x0                 },        /* P.D_MT_VPE */
@@ -16760,7 +16753,7 @@ NMD::Pool NMD::_P_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::P_MT_VPE[8] = {
+static struct Pool P_MT_VPE[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003bff, 0x200002b0, 0                      , 0,
        0x0                 },        /* P.MT_VPE~*(0) */
@@ -16788,7 +16781,7 @@ NMD::Pool NMD::P_MT_VPE[8] = {
 };
 
 
-NMD::Pool NMD::P_DVP[2] = {
+static struct Pool P_DVP[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x20000390, &DVP              , 0,
        0x0                 },        /* DVP */
@@ -16798,7 +16791,7 @@ NMD::Pool NMD::P_DVP[2] = {
 };
 
 
-NMD::Pool NMD::P_SLTU[2] = {
+static struct Pool P_SLTU[2] = {
     { pool                , P_DVP               , 2   , 32,
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
@@ -16808,7 +16801,7 @@ NMD::Pool NMD::P_SLTU[2] = {
 };
 
 
-NMD::Pool NMD::_POOL32A0[128] = {
+static struct Pool _POOL32A0[128] = {
     { pool                , P_TRAP              , 2   , 32,
        0xfc0003ff, 0x20000000, 0                      , 0,
        0x0                 },        /* P.TRAP */
@@ -17196,7 +17189,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
 };
 
 
-NMD::Pool NMD::ADDQ__S__PH[2] = {
+static struct Pool ADDQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000000d, &ADDQ_PH          , 0,
        DSP_                },        /* ADDQ.PH */
@@ -17206,7 +17199,7 @@ NMD::Pool NMD::ADDQ__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::MUL__S__PH[2] = {
+static struct Pool MUL__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000002d, &MUL_PH           , 0,
        DSP_                },        /* MUL.PH */
@@ -17216,7 +17209,7 @@ NMD::Pool NMD::MUL__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDQH__R__PH[2] = {
+static struct Pool ADDQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000004d, &ADDQH_PH         , 0,
        DSP_                },        /* ADDQH.PH */
@@ -17226,7 +17219,7 @@ NMD::Pool NMD::ADDQH__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDQH__R__W[2] = {
+static struct Pool ADDQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000008d, &ADDQH_W          , 0,
        DSP_                },        /* ADDQH.W */
@@ -17236,7 +17229,7 @@ NMD::Pool NMD::ADDQH__R__W[2] = {
 };
 
 
-NMD::Pool NMD::ADDU__S__QB[2] = {
+static struct Pool ADDU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200000cd, &ADDU_QB          , 0,
        DSP_                },        /* ADDU.QB */
@@ -17246,7 +17239,7 @@ NMD::Pool NMD::ADDU__S__QB[2] = {
 };
 
 
-NMD::Pool NMD::ADDU__S__PH[2] = {
+static struct Pool ADDU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000010d, &ADDU_PH          , 0,
        DSP_                },        /* ADDU.PH */
@@ -17256,7 +17249,7 @@ NMD::Pool NMD::ADDU__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDUH__R__QB[2] = {
+static struct Pool ADDUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000014d, &ADDUH_QB         , 0,
        DSP_                },        /* ADDUH.QB */
@@ -17266,7 +17259,7 @@ NMD::Pool NMD::ADDUH__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SHRAV__R__PH[2] = {
+static struct Pool SHRAV__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000018d, &SHRAV_PH         , 0,
        DSP_                },        /* SHRAV.PH */
@@ -17276,7 +17269,7 @@ NMD::Pool NMD::SHRAV__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHRAV__R__QB[2] = {
+static struct Pool SHRAV__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200001cd, &SHRAV_QB         , 0,
        DSP_                },        /* SHRAV.QB */
@@ -17286,7 +17279,7 @@ NMD::Pool NMD::SHRAV__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SUBQ__S__PH[2] = {
+static struct Pool SUBQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000020d, &SUBQ_PH          , 0,
        DSP_                },        /* SUBQ.PH */
@@ -17296,7 +17289,7 @@ NMD::Pool NMD::SUBQ__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBQH__R__PH[2] = {
+static struct Pool SUBQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000024d, &SUBQH_PH         , 0,
        DSP_                },        /* SUBQH.PH */
@@ -17306,7 +17299,7 @@ NMD::Pool NMD::SUBQH__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBQH__R__W[2] = {
+static struct Pool SUBQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000028d, &SUBQH_W          , 0,
        DSP_                },        /* SUBQH.W */
@@ -17316,7 +17309,7 @@ NMD::Pool NMD::SUBQH__R__W[2] = {
 };
 
 
-NMD::Pool NMD::SUBU__S__QB[2] = {
+static struct Pool SUBU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200002cd, &SUBU_QB          , 0,
        DSP_                },        /* SUBU.QB */
@@ -17326,7 +17319,7 @@ NMD::Pool NMD::SUBU__S__QB[2] = {
 };
 
 
-NMD::Pool NMD::SUBU__S__PH[2] = {
+static struct Pool SUBU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000030d, &SUBU_PH          , 0,
        DSP_                },        /* SUBU.PH */
@@ -17336,7 +17329,7 @@ NMD::Pool NMD::SUBU__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHRA__R__PH[2] = {
+static struct Pool SHRA__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000335, &SHRA_PH          , 0,
        DSP_                },        /* SHRA.PH */
@@ -17346,7 +17339,7 @@ NMD::Pool NMD::SHRA__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBUH__R__QB[2] = {
+static struct Pool SUBUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000034d, &SUBUH_QB         , 0,
        DSP_                },        /* SUBUH.QB */
@@ -17356,7 +17349,7 @@ NMD::Pool NMD::SUBUH__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SHLLV__S__PH[2] = {
+static struct Pool SHLLV__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000038d, &SHLLV_PH         , 0,
        DSP_                },        /* SHLLV.PH */
@@ -17366,7 +17359,7 @@ NMD::Pool NMD::SHLLV__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHLL__S__PH[4] = {
+static struct Pool SHLL__S__PH[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000fff, 0x200003b5, &SHLL_PH          , 0,
        DSP_                },        /* SHLL.PH */
@@ -17382,7 +17375,7 @@ NMD::Pool NMD::SHLL__S__PH[4] = {
 };
 
 
-NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
+static struct Pool PRECR_SRA__R__PH_W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200003cd, &PRECR_SRA_PH_W   , 0,
        DSP_                },        /* PRECR_SRA.PH.W */
@@ -17392,7 +17385,7 @@ NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
 };
 
 
-NMD::Pool NMD::_POOL32A5[128] = {
+static struct Pool _POOL32A5[128] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0x20000005, &CMP_EQ_PH        , 0,
        DSP_                },        /* CMP.EQ.PH */
@@ -17780,7 +17773,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
 };
 
 
-NMD::Pool NMD::PP_LSX[16] = {
+static struct Pool PP_LSX[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000007, &LBX              , 0,
        0x0                 },        /* LBX */
@@ -17832,7 +17825,7 @@ NMD::Pool NMD::PP_LSX[16] = {
 };
 
 
-NMD::Pool NMD::PP_LSXS[16] = {
+static struct Pool PP_LSXS[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0x20000047, 0                      , 0,
        0x0                 },        /* PP.LSXS~*(0) */
@@ -17884,7 +17877,7 @@ NMD::Pool NMD::PP_LSXS[16] = {
 };
 
 
-NMD::Pool NMD::P_LSX[2] = {
+static struct Pool P_LSX[2] = {
     { pool                , PP_LSX              , 16  , 32,
        0xfc00007f, 0x20000007, 0                      , 0,
        0x0                 },        /* PP.LSX */
@@ -17894,7 +17887,7 @@ NMD::Pool NMD::P_LSX[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_0[4] = {
+static struct Pool POOL32Axf_1_0[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000007f, &MFHI_DSP_        , 0,
        DSP_                },        /* MFHI[DSP] */
@@ -17910,7 +17903,7 @@ NMD::Pool NMD::POOL32Axf_1_0[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_1[4] = {
+static struct Pool POOL32Axf_1_1[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000027f, &MTHLIP           , 0,
        DSP_                },        /* MTHLIP */
@@ -17926,7 +17919,7 @@ NMD::Pool NMD::POOL32Axf_1_1[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_3[4] = {
+static struct Pool POOL32Axf_1_3[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000067f, &RDDSP            , 0,
        DSP_                },        /* RDDSP */
@@ -17942,7 +17935,7 @@ NMD::Pool NMD::POOL32Axf_1_3[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_4[2] = {
+static struct Pool POOL32Axf_1_4[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc001fff, 0x2000087f, &SHLL_QB          , 0,
        DSP_                },        /* SHLL.QB */
@@ -17952,7 +17945,7 @@ NMD::Pool NMD::POOL32Axf_1_4[2] = {
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
+static struct Pool MAQ_S_A__W_PHR[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20000a7f, &MAQ_S_W_PHR      , 0,
        DSP_                },        /* MAQ_S.W.PHR */
@@ -17962,7 +17955,7 @@ NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
+static struct Pool MAQ_S_A__W_PHL[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20001a7f, &MAQ_S_W_PHL      , 0,
        DSP_                },        /* MAQ_S.W.PHL */
@@ -17972,7 +17965,7 @@ NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_5[2] = {
+static struct Pool POOL32Axf_1_5[2] = {
     { pool                , MAQ_S_A__W_PHR      , 2   , 32,
        0xfc001fff, 0x20000a7f, 0                      , 0,
        0x0                 },        /* MAQ_S[A].W.PHR */
@@ -17982,7 +17975,7 @@ NMD::Pool NMD::POOL32Axf_1_5[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_7[4] = {
+static struct Pool POOL32Axf_1_7[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20000e7f, &EXTR_W           , 0,
        DSP_                },        /* EXTR.W */
@@ -17998,7 +17991,7 @@ NMD::Pool NMD::POOL32Axf_1_7[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1[8] = {
+static struct Pool POOL32Axf_1[8] = {
     { pool                , POOL32Axf_1_0       , 4   , 32,
        0xfc000fff, 0x2000007f, 0                      , 0,
        0x0                 },        /* POOL32Axf_1_0 */
@@ -18026,7 +18019,7 @@ NMD::Pool NMD::POOL32Axf_1[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
+static struct Pool POOL32Axf_2_DSP__0_7[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200000bf, &DPA_W_PH         , 0,
        DSP_                },        /* DPA.W.PH */
@@ -18054,7 +18047,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
+static struct Pool POOL32Axf_2_DSP__8_15[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200010bf, &DPAX_W_PH        , 0,
        DSP_                },        /* DPAX.W.PH */
@@ -18082,7 +18075,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
+static struct Pool POOL32Axf_2_DSP__16_23[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200020bf, &DPAU_H_QBL       , 0,
        DSP_                },        /* DPAU.H.QBL */
@@ -18110,7 +18103,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
+static struct Pool POOL32Axf_2_DSP__24_31[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200030bf, &DPAU_H_QBR       , 0,
        DSP_                },        /* DPAU.H.QBR */
@@ -18138,7 +18131,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2[4] = {
+static struct Pool POOL32Axf_2[4] = {
     { pool                , POOL32Axf_2_DSP__0_7, 8   , 32,
        0xfc0031ff, 0x200000bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_0_7 */
@@ -18154,7 +18147,7 @@ NMD::Pool NMD::POOL32Axf_2[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_4[128] = {
+static struct Pool POOL32Axf_4[128] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x2000013f, &ABSQ_S_QB        , 0,
        DSP_                },        /* ABSQ_S.QB */
@@ -18542,7 +18535,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group0[32] = {
+static struct Pool POOL32Axf_5_group0[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x2000017f, &TLBGP            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGP */
@@ -18642,7 +18635,7 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group1[32] = {
+static struct Pool POOL32Axf_5_group1[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000417f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(0) */
@@ -18742,7 +18735,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
 };
 
 
-NMD::Pool NMD::ERETx[2] = {
+static struct Pool ERETx[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc01ffff, 0x2000f37f, &ERET             , 0,
        0x0                 },        /* ERET */
@@ -18752,7 +18745,7 @@ NMD::Pool NMD::ERETx[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group3[32] = {
+static struct Pool POOL32Axf_5_group3[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000c17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(0) */
@@ -18852,7 +18845,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5[4] = {
+static struct Pool POOL32Axf_5[4] = {
     { pool                , POOL32Axf_5_group0  , 32  , 32,
        0xfc00c1ff, 0x2000017f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0 */
@@ -18868,7 +18861,7 @@ NMD::Pool NMD::POOL32Axf_5[4] = {
 };
 
 
-NMD::Pool NMD::SHRA__R__QB[2] = {
+static struct Pool SHRA__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc001fff, 0x200001ff, &SHRA_QB          , 0,
        DSP_                },        /* SHRA.QB */
@@ -18878,7 +18871,7 @@ NMD::Pool NMD::SHRA__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_7[8] = {
+static struct Pool POOL32Axf_7[8] = {
     { pool                , SHRA__R__QB         , 2   , 32,
        0xfc000fff, 0x200001ff, 0                      , 0,
        0x0                 },        /* SHRA[_R].QB */
@@ -18906,7 +18899,7 @@ NMD::Pool NMD::POOL32Axf_7[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf[8] = {
+static struct Pool POOL32Axf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0x2000003f, 0                      , 0,
        0x0                 },        /* POOL32Axf~*(0) */
@@ -18934,7 +18927,7 @@ NMD::Pool NMD::POOL32Axf[8] = {
 };
 
 
-NMD::Pool NMD::_POOL32A7[8] = {
+static struct Pool _POOL32A7[8] = {
     { pool                , P_LSX               , 2   , 32,
        0xfc00003f, 0x20000007, 0                      , 0,
        0x0                 },        /* P.LSX */
@@ -18962,7 +18955,7 @@ NMD::Pool NMD::_POOL32A7[8] = {
 };
 
 
-NMD::Pool NMD::P32A[8] = {
+static struct Pool P32A[8] = {
     { pool                , _POOL32A0           , 128 , 32,
        0xfc000007, 0x20000000, 0                      , 0,
        0x0                 },        /* _POOL32A0 */
@@ -18990,7 +18983,7 @@ NMD::Pool NMD::P32A[8] = {
 };
 
 
-NMD::Pool NMD::P_GP_D[2] = {
+static struct Pool P_GP_D[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000007, 0x40000001, &LD_GP_           , 0,
        MIPS64_             },        /* LD[GP] */
@@ -19000,7 +18993,7 @@ NMD::Pool NMD::P_GP_D[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_W[4] = {
+static struct Pool P_GP_W[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000003, 0x40000000, &ADDIU_GP_W_      , 0,
        0x0                 },        /* ADDIU[GP.W] */
@@ -19016,7 +19009,7 @@ NMD::Pool NMD::P_GP_W[4] = {
 };
 
 
-NMD::Pool NMD::POOL48I[32] = {
+static struct Pool POOL48I[32] = {
     { instruction         , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600000000000ull, &LI_48_           , 0,
        XMMS_               },        /* LI[48] */
@@ -19116,7 +19109,7 @@ NMD::Pool NMD::POOL48I[32] = {
 };
 
 
-NMD::Pool NMD::PP_SR[4] = {
+static struct Pool PP_SR[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc10f003, 0x80003000, &SAVE_32_         , 0,
        0x0                 },        /* SAVE[32] */
@@ -19132,7 +19125,7 @@ NMD::Pool NMD::PP_SR[4] = {
 };
 
 
-NMD::Pool NMD::P_SR_F[8] = {
+static struct Pool P_SR_F[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc10f007, 0x80103000, &SAVEF            , 0,
        CP1_                },        /* SAVEF */
@@ -19160,7 +19153,7 @@ NMD::Pool NMD::P_SR_F[8] = {
 };
 
 
-NMD::Pool NMD::P_SR[2] = {
+static struct Pool P_SR[2] = {
     { pool                , PP_SR               , 4   , 32,
        0xfc10f000, 0x80003000, 0                      , 0,
        0x0                 },        /* PP.SR */
@@ -19170,7 +19163,7 @@ NMD::Pool NMD::P_SR[2] = {
 };
 
 
-NMD::Pool NMD::P_SLL[5] = {
+static struct Pool P_SLL[5] = {
     { instruction         , 0                   , 0   , 32,
        0xffe0f1ff, 0x8000c000, &NOP_32_          , 0,
        0x0                 },        /* NOP[32] */
@@ -19189,7 +19182,7 @@ NMD::Pool NMD::P_SLL[5] = {
 };
 
 
-NMD::Pool NMD::P_SHIFT[16] = {
+static struct Pool P_SHIFT[16] = {
     { pool                , P_SLL               , 5   , 32,
        0xfc00f1e0, 0x8000c000, 0                      , 0,
        0x0                 },        /* P.SLL */
@@ -19241,7 +19234,7 @@ NMD::Pool NMD::P_SHIFT[16] = {
 };
 
 
-NMD::Pool NMD::P_ROTX[4] = {
+static struct Pool P_ROTX[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000d000, &ROTX             , 0,
        XMMS_               },        /* ROTX */
@@ -19257,7 +19250,7 @@ NMD::Pool NMD::P_ROTX[4] = {
 };
 
 
-NMD::Pool NMD::P_INS[4] = {
+static struct Pool P_INS[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000e000, &INS              , 0,
        XMMS_               },        /* INS */
@@ -19273,7 +19266,7 @@ NMD::Pool NMD::P_INS[4] = {
 };
 
 
-NMD::Pool NMD::P_EXT[4] = {
+static struct Pool P_EXT[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000f000, &EXT              , 0,
        XMMS_               },        /* EXT */
@@ -19289,7 +19282,7 @@ NMD::Pool NMD::P_EXT[4] = {
 };
 
 
-NMD::Pool NMD::P_U12[16] = {
+static struct Pool P_U12[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f000, 0x80000000, &ORI              , 0,
        0x0                 },        /* ORI */
@@ -19341,7 +19334,7 @@ NMD::Pool NMD::P_U12[16] = {
 };
 
 
-NMD::Pool NMD::RINT_fmt[2] = {
+static struct Pool RINT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000020, &RINT_S           , 0,
        CP1_                },        /* RINT.S */
@@ -19351,7 +19344,7 @@ NMD::Pool NMD::RINT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ADD_fmt0[2] = {
+static struct Pool ADD_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000030, &ADD_S            , 0,
        CP1_                },        /* ADD.S */
@@ -19361,7 +19354,7 @@ NMD::Pool NMD::ADD_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELEQZ_fmt[2] = {
+static struct Pool SELEQZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000038, &SELEQZ_S         , 0,
        CP1_                },        /* SELEQZ.S */
@@ -19371,7 +19364,7 @@ NMD::Pool NMD::SELEQZ_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CLASS_fmt[2] = {
+static struct Pool CLASS_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000060, &CLASS_S          , 0,
        CP1_                },        /* CLASS.S */
@@ -19381,7 +19374,7 @@ NMD::Pool NMD::CLASS_fmt[2] = {
 };
 
 
-NMD::Pool NMD::SUB_fmt0[2] = {
+static struct Pool SUB_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000070, &SUB_S            , 0,
        CP1_                },        /* SUB.S */
@@ -19391,7 +19384,7 @@ NMD::Pool NMD::SUB_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELNEZ_fmt[2] = {
+static struct Pool SELNEZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000078, &SELNEZ_S         , 0,
        CP1_                },        /* SELNEZ.S */
@@ -19401,7 +19394,7 @@ NMD::Pool NMD::SELNEZ_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MUL_fmt0[2] = {
+static struct Pool MUL_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000b0, &MUL_S            , 0,
        CP1_                },        /* MUL.S */
@@ -19411,7 +19404,7 @@ NMD::Pool NMD::MUL_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SEL_fmt[2] = {
+static struct Pool SEL_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000b8, &SEL_S            , 0,
        CP1_                },        /* SEL.S */
@@ -19421,7 +19414,7 @@ NMD::Pool NMD::SEL_fmt[2] = {
 };
 
 
-NMD::Pool NMD::DIV_fmt0[2] = {
+static struct Pool DIV_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000f0, &DIV_S            , 0,
        CP1_                },        /* DIV.S */
@@ -19431,7 +19424,7 @@ NMD::Pool NMD::DIV_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::ADD_fmt1[2] = {
+static struct Pool ADD_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000130, &ADD_D            , 0,
        CP1_                },        /* ADD.D */
@@ -19441,7 +19434,7 @@ NMD::Pool NMD::ADD_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::SUB_fmt1[2] = {
+static struct Pool SUB_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000170, &SUB_D            , 0,
        CP1_                },        /* SUB.D */
@@ -19451,7 +19444,7 @@ NMD::Pool NMD::SUB_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MUL_fmt1[2] = {
+static struct Pool MUL_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001b0, &MUL_D            , 0,
        CP1_                },        /* MUL.D */
@@ -19461,7 +19454,7 @@ NMD::Pool NMD::MUL_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MADDF_fmt[2] = {
+static struct Pool MADDF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001b8, &MADDF_S          , 0,
        CP1_                },        /* MADDF.S */
@@ -19471,7 +19464,7 @@ NMD::Pool NMD::MADDF_fmt[2] = {
 };
 
 
-NMD::Pool NMD::DIV_fmt1[2] = {
+static struct Pool DIV_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001f0, &DIV_D            , 0,
        CP1_                },        /* DIV.D */
@@ -19481,7 +19474,7 @@ NMD::Pool NMD::DIV_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MSUBF_fmt[2] = {
+static struct Pool MSUBF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001f8, &MSUBF_S          , 0,
        CP1_                },        /* MSUBF.S */
@@ -19491,7 +19484,7 @@ NMD::Pool NMD::MSUBF_fmt[2] = {
 };
 
 
-NMD::Pool NMD::POOL32F_0[64] = {
+static struct Pool POOL32F_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0~*(0) */
@@ -19687,7 +19680,7 @@ NMD::Pool NMD::POOL32F_0[64] = {
 };
 
 
-NMD::Pool NMD::MIN_fmt[2] = {
+static struct Pool MIN_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa0000003, &MIN_S            , 0,
        CP1_                },        /* MIN.S */
@@ -19697,7 +19690,7 @@ NMD::Pool NMD::MIN_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MAX_fmt[2] = {
+static struct Pool MAX_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa000000b, &MAX_S            , 0,
        CP1_                },        /* MAX.S */
@@ -19707,7 +19700,7 @@ NMD::Pool NMD::MAX_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MINA_fmt[2] = {
+static struct Pool MINA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa0000023, &MINA_S           , 0,
        CP1_                },        /* MINA.S */
@@ -19717,7 +19710,7 @@ NMD::Pool NMD::MINA_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MAXA_fmt[2] = {
+static struct Pool MAXA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa000002b, &MAXA_S           , 0,
        CP1_                },        /* MAXA.S */
@@ -19727,7 +19720,7 @@ NMD::Pool NMD::MAXA_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CVT_L_fmt[2] = {
+static struct Pool CVT_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000013b, &CVT_L_S          , 0,
        CP1_                },        /* CVT.L.S */
@@ -19737,7 +19730,7 @@ NMD::Pool NMD::CVT_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::RSQRT_fmt[2] = {
+static struct Pool RSQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000023b, &RSQRT_S          , 0,
        CP1_                },        /* RSQRT.S */
@@ -19747,7 +19740,7 @@ NMD::Pool NMD::RSQRT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::FLOOR_L_fmt[2] = {
+static struct Pool FLOOR_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000033b, &FLOOR_L_S        , 0,
        CP1_                },        /* FLOOR.L.S */
@@ -19757,7 +19750,7 @@ NMD::Pool NMD::FLOOR_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CVT_W_fmt[2] = {
+static struct Pool CVT_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000093b, &CVT_W_S          , 0,
        CP1_                },        /* CVT.W.S */
@@ -19767,7 +19760,7 @@ NMD::Pool NMD::CVT_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::SQRT_fmt[2] = {
+static struct Pool SQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000a3b, &SQRT_S           , 0,
        CP1_                },        /* SQRT.S */
@@ -19777,7 +19770,7 @@ NMD::Pool NMD::SQRT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::FLOOR_W_fmt[2] = {
+static struct Pool FLOOR_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000b3b, &FLOOR_W_S        , 0,
        CP1_                },        /* FLOOR.W.S */
@@ -19787,7 +19780,7 @@ NMD::Pool NMD::FLOOR_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::RECIP_fmt[2] = {
+static struct Pool RECIP_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000123b, &RECIP_S          , 0,
        CP1_                },        /* RECIP.S */
@@ -19797,7 +19790,7 @@ NMD::Pool NMD::RECIP_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CEIL_L_fmt[2] = {
+static struct Pool CEIL_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000133b, &CEIL_L_S         , 0,
        CP1_                },        /* CEIL.L.S */
@@ -19807,7 +19800,7 @@ NMD::Pool NMD::CEIL_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CEIL_W_fmt[2] = {
+static struct Pool CEIL_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0001b3b, &CEIL_W_S         , 0,
        CP1_                },        /* CEIL.W.S */
@@ -19817,7 +19810,7 @@ NMD::Pool NMD::CEIL_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::TRUNC_L_fmt[2] = {
+static struct Pool TRUNC_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000233b, &TRUNC_L_S        , 0,
        CP1_                },        /* TRUNC.L.S */
@@ -19827,7 +19820,7 @@ NMD::Pool NMD::TRUNC_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::TRUNC_W_fmt[2] = {
+static struct Pool TRUNC_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0002b3b, &TRUNC_W_S        , 0,
        CP1_                },        /* TRUNC.W.S */
@@ -19837,7 +19830,7 @@ NMD::Pool NMD::TRUNC_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ROUND_L_fmt[2] = {
+static struct Pool ROUND_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000333b, &ROUND_L_S        , 0,
        CP1_                },        /* ROUND.L.S */
@@ -19847,7 +19840,7 @@ NMD::Pool NMD::ROUND_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ROUND_W_fmt[2] = {
+static struct Pool ROUND_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0003b3b, &ROUND_W_S        , 0,
        CP1_                },        /* ROUND.W.S */
@@ -19857,7 +19850,7 @@ NMD::Pool NMD::ROUND_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf_0[64] = {
+static struct Pool POOL32Fxf_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(0) */
@@ -20053,7 +20046,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
 };
 
 
-NMD::Pool NMD::MOV_fmt[4] = {
+static struct Pool MOV_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000007b, &MOV_S            , 0,
        CP1_                },        /* MOV.S */
@@ -20069,7 +20062,7 @@ NMD::Pool NMD::MOV_fmt[4] = {
 };
 
 
-NMD::Pool NMD::ABS_fmt[4] = {
+static struct Pool ABS_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000037b, &ABS_S            , 0,
        CP1_                },        /* ABS.S */
@@ -20085,7 +20078,7 @@ NMD::Pool NMD::ABS_fmt[4] = {
 };
 
 
-NMD::Pool NMD::NEG_fmt[4] = {
+static struct Pool NEG_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000b7b, &NEG_S            , 0,
        CP1_                },        /* NEG.S */
@@ -20101,7 +20094,7 @@ NMD::Pool NMD::NEG_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_D_fmt[4] = {
+static struct Pool CVT_D_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000137b, &CVT_D_S          , 0,
        CP1_                },        /* CVT.D.S */
@@ -20117,7 +20110,7 @@ NMD::Pool NMD::CVT_D_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_S_fmt[4] = {
+static struct Pool CVT_S_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0001b7b, &CVT_S_D          , 0,
        CP1_                },        /* CVT.S.D */
@@ -20133,7 +20126,7 @@ NMD::Pool NMD::CVT_S_fmt[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf_1[32] = {
+static struct Pool POOL32Fxf_1[32] = {
     { pool                , MOV_fmt             , 4   , 32,
        0xfc001fff, 0xa000007b, 0                      , 0,
        CP1_                },        /* MOV.fmt */
@@ -20233,7 +20226,7 @@ NMD::Pool NMD::POOL32Fxf_1[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf[4] = {
+static struct Pool POOL32Fxf[4] = {
     { pool                , POOL32Fxf_0         , 64  , 32,
        0xfc0000ff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0 */
@@ -20249,7 +20242,7 @@ NMD::Pool NMD::POOL32Fxf[4] = {
 };
 
 
-NMD::Pool NMD::POOL32F_3[8] = {
+static struct Pool POOL32F_3[8] = {
     { pool                , MIN_fmt             , 2   , 32,
        0xfc00003f, 0xa0000003, 0                      , 0,
        CP1_                },        /* MIN.fmt */
@@ -20277,7 +20270,7 @@ NMD::Pool NMD::POOL32F_3[8] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_S[32] = {
+static struct Pool CMP_condn_S[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000005, &CMP_AF_S         , 0,
        CP1_                },        /* CMP.AF.S */
@@ -20377,7 +20370,7 @@ NMD::Pool NMD::CMP_condn_S[32] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_D[32] = {
+static struct Pool CMP_condn_D[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000015, &CMP_AF_D         , 0,
        CP1_                },        /* CMP.AF.D */
@@ -20477,7 +20470,7 @@ NMD::Pool NMD::CMP_condn_D[32] = {
 };
 
 
-NMD::Pool NMD::POOL32F_5[8] = {
+static struct Pool POOL32F_5[8] = {
     { pool                , CMP_condn_S         , 32  , 32,
        0xfc00003f, 0xa0000005, 0                      , 0,
        CP1_                },        /* CMP.condn.S */
@@ -20505,7 +20498,7 @@ NMD::Pool NMD::POOL32F_5[8] = {
 };
 
 
-NMD::Pool NMD::POOL32F[8] = {
+static struct Pool POOL32F[8] = {
     { pool                , POOL32F_0           , 64  , 32,
        0xfc000007, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0 */
@@ -20533,7 +20526,7 @@ NMD::Pool NMD::POOL32F[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_0[64] = {
+static struct Pool POOL32S_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(0) */
@@ -20729,7 +20722,7 @@ NMD::Pool NMD::POOL32S_0[64] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf_4[128] = {
+static struct Pool POOL32Sxf_4[128] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc000013c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(0) */
@@ -21117,7 +21110,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf[8] = {
+static struct Pool POOL32Sxf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc000003c, 0                      , 0,
        0x0                 },        /* POOL32Sxf~*(0) */
@@ -21145,7 +21138,7 @@ NMD::Pool NMD::POOL32Sxf[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_4[8] = {
+static struct Pool POOL32S_4[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00003f, 0xc0000004, &EXTD             , 0,
        MIPS64_             },        /* EXTD */
@@ -21173,7 +21166,7 @@ NMD::Pool NMD::POOL32S_4[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S[8] = {
+static struct Pool POOL32S[8] = {
     { pool                , POOL32S_0           , 64  , 32,
        0xfc000007, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0 */
@@ -21201,7 +21194,7 @@ NMD::Pool NMD::POOL32S[8] = {
 };
 
 
-NMD::Pool NMD::P_LUI[2] = {
+static struct Pool P_LUI[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000002, 0xe0000000, &LUI              , 0,
        0x0                 },        /* LUI */
@@ -21211,7 +21204,7 @@ NMD::Pool NMD::P_LUI[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_LH[2] = {
+static struct Pool P_GP_LH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0001, 0x44100000, &LH_GP_           , 0,
        0x0                 },        /* LH[GP] */
@@ -21221,7 +21214,7 @@ NMD::Pool NMD::P_GP_LH[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_SH[2] = {
+static struct Pool P_GP_SH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0001, 0x44140000, &SH_GP_           , 0,
        0x0                 },        /* SH[GP] */
@@ -21231,7 +21224,7 @@ NMD::Pool NMD::P_GP_SH[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_CP1[4] = {
+static struct Pool P_GP_CP1[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0003, 0x44180000, &LWC1_GP_         , 0,
        CP1_                },        /* LWC1[GP] */
@@ -21247,7 +21240,7 @@ NMD::Pool NMD::P_GP_CP1[4] = {
 };
 
 
-NMD::Pool NMD::P_GP_M64[4] = {
+static struct Pool P_GP_M64[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0003, 0x441c0000, &LWU_GP_          , 0,
        MIPS64_             },        /* LWU[GP] */
@@ -21263,7 +21256,7 @@ NMD::Pool NMD::P_GP_M64[4] = {
 };
 
 
-NMD::Pool NMD::P_GP_BH[8] = {
+static struct Pool P_GP_BH[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0000, 0x44000000, &LB_GP_           , 0,
        0x0                 },        /* LB[GP] */
@@ -21291,7 +21284,7 @@ NMD::Pool NMD::P_GP_BH[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_U12[16] = {
+static struct Pool P_LS_U12[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f000, 0x84000000, &LB_U12_          , 0,
        0x0                 },        /* LB[U12] */
@@ -21343,7 +21336,7 @@ NMD::Pool NMD::P_LS_U12[16] = {
 };
 
 
-NMD::Pool NMD::P_PREF_S9_[2] = {
+static struct Pool P_PREF_S9_[2] = {
     { instruction         , 0                   , 0   , 32,
        0xffe07f00, 0xa7e01800, &SYNCI            , 0,
        0x0                 },        /* SYNCI */
@@ -21353,7 +21346,7 @@ NMD::Pool NMD::P_PREF_S9_[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_S0[16] = {
+static struct Pool P_LS_S0[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f00, 0xa4000000, &LB_S9_           , 0,
        0x0                 },        /* LB[S9] */
@@ -21405,7 +21398,7 @@ NMD::Pool NMD::P_LS_S0[16] = {
 };
 
 
-NMD::Pool NMD::ASET_ACLR[2] = {
+static struct Pool ASET_ACLR[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfe007f00, 0xa4001100, &ASET             , 0,
        MCU_                },        /* ASET */
@@ -21415,7 +21408,7 @@ NMD::Pool NMD::ASET_ACLR[2] = {
 };
 
 
-NMD::Pool NMD::P_LL[4] = {
+static struct Pool P_LL[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005100, &LL               , 0,
        0x0                 },        /* LL */
@@ -21431,7 +21424,7 @@ NMD::Pool NMD::P_LL[4] = {
 };
 
 
-NMD::Pool NMD::P_SC[4] = {
+static struct Pool P_SC[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005900, &SC               , 0,
        0x0                 },        /* SC */
@@ -21447,7 +21440,7 @@ NMD::Pool NMD::P_SC[4] = {
 };
 
 
-NMD::Pool NMD::P_LLD[8] = {
+static struct Pool P_LLD[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f07, 0xa4007100, &LLD              , 0,
        MIPS64_             },        /* LLD */
@@ -21475,7 +21468,7 @@ NMD::Pool NMD::P_LLD[8] = {
 };
 
 
-NMD::Pool NMD::P_SCD[8] = {
+static struct Pool P_SCD[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f07, 0xa4007900, &SCD              , 0,
        MIPS64_             },        /* SCD */
@@ -21503,7 +21496,7 @@ NMD::Pool NMD::P_SCD[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_S1[16] = {
+static struct Pool P_LS_S1[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f00, 0xa4000100, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(0) */
@@ -21555,7 +21548,7 @@ NMD::Pool NMD::P_LS_S1[16] = {
 };
 
 
-NMD::Pool NMD::P_PREFE[2] = {
+static struct Pool P_PREFE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xffe07f00, 0xa7e01a00, &SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
@@ -21565,7 +21558,7 @@ NMD::Pool NMD::P_PREFE[2] = {
 };
 
 
-NMD::Pool NMD::P_LLE[4] = {
+static struct Pool P_LLE[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005200, &LLE              , 0,
        CP0_ | EVA_         },        /* LLE */
@@ -21581,7 +21574,7 @@ NMD::Pool NMD::P_LLE[4] = {
 };
 
 
-NMD::Pool NMD::P_SCE[4] = {
+static struct Pool P_SCE[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005a00, &SCE              , 0,
        CP0_ | EVA_         },        /* SCE */
@@ -21597,7 +21590,7 @@ NMD::Pool NMD::P_SCE[4] = {
 };
 
 
-NMD::Pool NMD::P_LS_E0[16] = {
+static struct Pool P_LS_E0[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f00, 0xa4000200, &LBE              , 0,
        CP0_ | EVA_         },        /* LBE */
@@ -21649,7 +21642,7 @@ NMD::Pool NMD::P_LS_E0[16] = {
 };
 
 
-NMD::Pool NMD::P_LS_WM[2] = {
+static struct Pool P_LS_WM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000400, &LWM              , 0,
        XMMS_               },        /* LWM */
@@ -21659,7 +21652,7 @@ NMD::Pool NMD::P_LS_WM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_UAWM[2] = {
+static struct Pool P_LS_UAWM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000500, &UALWM            , 0,
        XMMS_               },        /* UALWM */
@@ -21669,7 +21662,7 @@ NMD::Pool NMD::P_LS_UAWM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_DM[2] = {
+static struct Pool P_LS_DM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000600, &LDM              , 0,
        MIPS64_             },        /* LDM */
@@ -21679,7 +21672,7 @@ NMD::Pool NMD::P_LS_DM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_UADM[2] = {
+static struct Pool P_LS_UADM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000700, &UALDM            , 0,
        MIPS64_             },        /* UALDM */
@@ -21689,7 +21682,7 @@ NMD::Pool NMD::P_LS_UADM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_S9[8] = {
+static struct Pool P_LS_S9[8] = {
     { pool                , P_LS_S0             , 16  , 32,
        0xfc000700, 0xa4000000, 0                      , 0,
        0x0                 },        /* P.LS.S0 */
@@ -21717,7 +21710,7 @@ NMD::Pool NMD::P_LS_S9[8] = {
 };
 
 
-NMD::Pool NMD::P_BAL[2] = {
+static struct Pool P_BAL[2] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfe000000, 0x28000000, &BC_32_           , 0,
        0x0                 },        /* BC[32] */
@@ -21727,7 +21720,7 @@ NMD::Pool NMD::P_BAL[2] = {
 };
 
 
-NMD::Pool NMD::P_BALRSC[2] = {
+static struct Pool P_BALRSC[2] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xffe0f000, 0x48008000, &BRSC             , 0,
        0x0                 },        /* BRSC */
@@ -21737,7 +21730,7 @@ NMD::Pool NMD::P_BALRSC[2] = {
 };
 
 
-NMD::Pool NMD::P_J[16] = {
+static struct Pool P_J[16] = {
     { call_instruction    , 0                   , 0   , 32,
        0xfc00f000, 0x48000000, &JALRC_32_        , 0,
        0x0                 },        /* JALRC[32] */
@@ -21789,7 +21782,7 @@ NMD::Pool NMD::P_J[16] = {
 };
 
 
-NMD::Pool NMD::P_BR3A[32] = {
+static struct Pool P_BR3A[32] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc1fc000, 0x88004000, &BC1EQZC          , 0,
        CP1_                },        /* BC1EQZC */
@@ -21889,7 +21882,7 @@ NMD::Pool NMD::P_BR3A[32] = {
 };
 
 
-NMD::Pool NMD::P_BR1[4] = {
+static struct Pool P_BR1[4] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc00c000, 0x88000000, &BEQC_32_         , 0,
        0x0                 },        /* BEQC[32] */
@@ -21905,7 +21898,7 @@ NMD::Pool NMD::P_BR1[4] = {
 };
 
 
-NMD::Pool NMD::P_BR2[4] = {
+static struct Pool P_BR2[4] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc00c000, 0xa8000000, &BNEC_32_         , 0,
        0x0                 },        /* BNEC[32] */
@@ -21921,7 +21914,7 @@ NMD::Pool NMD::P_BR2[4] = {
 };
 
 
-NMD::Pool NMD::P_BRI[8] = {
+static struct Pool P_BRI[8] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc1c0000, 0xc8000000, &BEQIC            , 0,
        0x0                 },        /* BEQIC */
@@ -21949,7 +21942,7 @@ NMD::Pool NMD::P_BRI[8] = {
 };
 
 
-NMD::Pool NMD::P32[32] = {
+static struct Pool P32[32] = {
     { pool                , P_ADDIU             , 2   , 32,
        0xfc000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.ADDIU */
@@ -22049,7 +22042,7 @@ NMD::Pool NMD::P32[32] = {
 };
 
 
-NMD::Pool NMD::P16_SYSCALL[2] = {
+static struct Pool P16_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfffc    , 0x1008    , &SYSCALL_16_      , 0,
        0x0                 },        /* SYSCALL[16] */
@@ -22059,7 +22052,7 @@ NMD::Pool NMD::P16_SYSCALL[2] = {
 };
 
 
-NMD::Pool NMD::P16_RI[4] = {
+static struct Pool P16_RI[4] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfff8    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI~*(0) */
@@ -22075,7 +22068,7 @@ NMD::Pool NMD::P16_RI[4] = {
 };
 
 
-NMD::Pool NMD::P16_MV[2] = {
+static struct Pool P16_MV[2] = {
     { pool                , P16_RI              , 4   , 16,
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
@@ -22085,7 +22078,7 @@ NMD::Pool NMD::P16_MV[2] = {
 };
 
 
-NMD::Pool NMD::P16_SHIFT[2] = {
+static struct Pool P16_SHIFT[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc08    , 0x3000    , &SLL_16_          , 0,
        0x0                 },        /* SLL[16] */
@@ -22095,7 +22088,7 @@ NMD::Pool NMD::P16_SHIFT[2] = {
 };
 
 
-NMD::Pool NMD::POOL16C_00[4] = {
+static struct Pool POOL16C_00[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc0f    , 0x5000    , &NOT_16_          , 0,
        0x0                 },        /* NOT[16] */
@@ -22111,7 +22104,7 @@ NMD::Pool NMD::POOL16C_00[4] = {
 };
 
 
-NMD::Pool NMD::POOL16C_0[2] = {
+static struct Pool POOL16C_0[2] = {
     { pool                , POOL16C_00          , 4   , 16,
        0xfc03    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_00 */
@@ -22121,7 +22114,7 @@ NMD::Pool NMD::POOL16C_0[2] = {
 };
 
 
-NMD::Pool NMD::P16C[2] = {
+static struct Pool P16C[2] = {
     { pool                , POOL16C_0           , 2   , 16,
        0xfc01    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_0 */
@@ -22131,7 +22124,7 @@ NMD::Pool NMD::P16C[2] = {
 };
 
 
-NMD::Pool NMD::P16_A1[2] = {
+static struct Pool P16_A1[2] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfc40    , 0x7000    , 0                      , 0,
        0x0                 },        /* P16.A1~*(0) */
@@ -22141,7 +22134,7 @@ NMD::Pool NMD::P16_A1[2] = {
 };
 
 
-NMD::Pool NMD::P_ADDIU_RS5_[2] = {
+static struct Pool P_ADDIU_RS5_[2] = {
     { instruction         , 0                   , 0   , 16,
        0xffe8    , 0x9008    , &NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
@@ -22151,7 +22144,7 @@ NMD::Pool NMD::P_ADDIU_RS5_[2] = {
 };
 
 
-NMD::Pool NMD::P16_A2[2] = {
+static struct Pool P16_A2[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc08    , 0x9000    , &ADDIU_R2_        , 0,
        0x0                 },        /* ADDIU[R2] */
@@ -22161,7 +22154,7 @@ NMD::Pool NMD::P16_A2[2] = {
 };
 
 
-NMD::Pool NMD::P16_ADDU[2] = {
+static struct Pool P16_ADDU[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc01    , 0xb000    , &ADDU_16_         , 0,
        0x0                 },        /* ADDU[16] */
@@ -22171,7 +22164,7 @@ NMD::Pool NMD::P16_ADDU[2] = {
 };
 
 
-NMD::Pool NMD::P16_JRC[2] = {
+static struct Pool P16_JRC[2] = {
     { branch_instruction  , 0                   , 0   , 16,
        0xfc1f    , 0xd800    , &JRC              , 0,
        0x0                 },        /* JRC */
@@ -22181,7 +22174,7 @@ NMD::Pool NMD::P16_JRC[2] = {
 };
 
 
-NMD::Pool NMD::P16_BR1[2] = {
+static struct Pool P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
        0xfc00    , 0xd800    , &BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
@@ -22191,7 +22184,7 @@ NMD::Pool NMD::P16_BR1[2] = {
 };
 
 
-NMD::Pool NMD::P16_BR[2] = {
+static struct Pool P16_BR[2] = {
     { pool                , P16_JRC             , 2   , 16,
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
@@ -22201,7 +22194,7 @@ NMD::Pool NMD::P16_BR[2] = {
 };
 
 
-NMD::Pool NMD::P16_SR[2] = {
+static struct Pool P16_SR[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfd00    , 0x1c00    , &SAVE_16_         , 0,
        0x0                 },        /* SAVE[16] */
@@ -22211,7 +22204,7 @@ NMD::Pool NMD::P16_SR[2] = {
 };
 
 
-NMD::Pool NMD::P16_4X4[4] = {
+static struct Pool P16_4X4[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfd08    , 0x3c00    , &ADDU_4X4_        , 0,
        XMMS_               },        /* ADDU[4X4] */
@@ -22227,7 +22220,7 @@ NMD::Pool NMD::P16_4X4[4] = {
 };
 
 
-NMD::Pool NMD::P16_LB[4] = {
+static struct Pool P16_LB[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc0c    , 0x5c00    , &LB_16_           , 0,
        0x0                 },        /* LB[16] */
@@ -22243,7 +22236,7 @@ NMD::Pool NMD::P16_LB[4] = {
 };
 
 
-NMD::Pool NMD::P16_LH[4] = {
+static struct Pool P16_LH[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc09    , 0x7c00    , &LH_16_           , 0,
        0x0                 },        /* LH[16] */
@@ -22259,7 +22252,7 @@ NMD::Pool NMD::P16_LH[4] = {
 };
 
 
-NMD::Pool NMD::P16[32] = {
+static struct Pool P16[32] = {
     { pool                , P16_MV              , 2   , 16,
        0xfc00    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.MV */
@@ -22359,7 +22352,7 @@ NMD::Pool NMD::P16[32] = {
 };
 
 
-NMD::Pool NMD::MAJOR[2] = {
+static struct Pool MAJOR[2] = {
     { pool                , P32                 , 32  , 32,
        0x10000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P32 */
@@ -22367,3 +22360,9 @@ NMD::Pool NMD::MAJOR[2] = {
        0x1000    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16 */
 };
+
+int NMD::Disassemble(const uint16 * data, std::string & dis,
+                     TABLE_ENTRY_TYPE & type)
+{
+    return Disassemble(data, dis, type, MAJOR, 2);
+}
diff --git a/disas/nanomips.h b/disas/nanomips.h
index d27711b4e2..da1ec2ad8f 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -63,6 +63,18 @@ enum TABLE_ATTRIBUTE_TYPE {
     ALL_ATTRIBUTES = 0xffffffffull,
 };
 
+struct Pool {
+    TABLE_ENTRY_TYPE     type;
+    struct Pool          *next_table;
+    int                  next_table_size;
+    int                  instructions_size;
+    uint64               mask;
+    uint64               value;
+    disassembly_function disassembly;
+    conditional_function condition;
+    uint64               attributes;
+};
+
 
 class NMD
 {
@@ -73,198 +85,9 @@ public:
 
 private:
 
-    struct Pool {
-        TABLE_ENTRY_TYPE     type;
-        struct Pool          *next_table;
-        int                  next_table_size;
-        int                  instructions_size;
-        uint64               mask;
-        uint64               value;
-        disassembly_function disassembly;
-        conditional_function condition;
-        uint64               attributes;
-    };
-
     uint64 extract_op_code_value(const uint16 *data, int size);
     int Disassemble(const uint16 *data, std::string & dis,
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size);
-
-    static Pool P_SYSCALL[2];
-    static Pool P_RI[4];
-    static Pool P_ADDIU[2];
-    static Pool P_TRAP[2];
-    static Pool P_CMOVE[2];
-    static Pool P_D_MT_VPE[2];
-    static Pool P_E_MT_VPE[2];
-    static Pool _P_MT_VPE[2];
-    static Pool P_MT_VPE[8];
-    static Pool P_DVP[2];
-    static Pool P_SLTU[2];
-    static Pool _POOL32A0[128];
-    static Pool ADDQ__S__PH[2];
-    static Pool MUL__S__PH[2];
-    static Pool ADDQH__R__PH[2];
-    static Pool ADDQH__R__W[2];
-    static Pool ADDU__S__QB[2];
-    static Pool ADDU__S__PH[2];
-    static Pool ADDUH__R__QB[2];
-    static Pool SHRAV__R__PH[2];
-    static Pool SHRAV__R__QB[2];
-    static Pool SUBQ__S__PH[2];
-    static Pool SUBQH__R__PH[2];
-    static Pool SUBQH__R__W[2];
-    static Pool SUBU__S__QB[2];
-    static Pool SUBU__S__PH[2];
-    static Pool SHRA__R__PH[2];
-    static Pool SUBUH__R__QB[2];
-    static Pool SHLLV__S__PH[2];
-    static Pool SHLL__S__PH[4];
-    static Pool PRECR_SRA__R__PH_W[2];
-    static Pool _POOL32A5[128];
-    static Pool PP_LSX[16];
-    static Pool PP_LSXS[16];
-    static Pool P_LSX[2];
-    static Pool POOL32Axf_1_0[4];
-    static Pool POOL32Axf_1_1[4];
-    static Pool POOL32Axf_1_3[4];
-    static Pool POOL32Axf_1_4[2];
-    static Pool MAQ_S_A__W_PHR[2];
-    static Pool MAQ_S_A__W_PHL[2];
-    static Pool POOL32Axf_1_5[2];
-    static Pool POOL32Axf_1_7[4];
-    static Pool POOL32Axf_1[8];
-    static Pool POOL32Axf_2_DSP__0_7[8];
-    static Pool POOL32Axf_2_DSP__8_15[8];
-    static Pool POOL32Axf_2_DSP__16_23[8];
-    static Pool POOL32Axf_2_DSP__24_31[8];
-    static Pool POOL32Axf_2[4];
-    static Pool POOL32Axf_4[128];
-    static Pool POOL32Axf_5_group0[32];
-    static Pool POOL32Axf_5_group1[32];
-    static Pool ERETx[2];
-    static Pool POOL32Axf_5_group3[32];
-    static Pool POOL32Axf_5[4];
-    static Pool SHRA__R__QB[2];
-    static Pool POOL32Axf_7[8];
-    static Pool POOL32Axf[8];
-    static Pool _POOL32A7[8];
-    static Pool P32A[8];
-    static Pool P_GP_D[2];
-    static Pool P_GP_W[4];
-    static Pool POOL48I[32];
-    static Pool PP_SR[4];
-    static Pool P_SR_F[8];
-    static Pool P_SR[2];
-    static Pool P_SLL[5];
-    static Pool P_SHIFT[16];
-    static Pool P_ROTX[4];
-    static Pool P_INS[4];
-    static Pool P_EXT[4];
-    static Pool P_U12[16];
-    static Pool RINT_fmt[2];
-    static Pool ADD_fmt0[2];
-    static Pool SELEQZ_fmt[2];
-    static Pool CLASS_fmt[2];
-    static Pool SUB_fmt0[2];
-    static Pool SELNEZ_fmt[2];
-    static Pool MUL_fmt0[2];
-    static Pool SEL_fmt[2];
-    static Pool DIV_fmt0[2];
-    static Pool ADD_fmt1[2];
-    static Pool SUB_fmt1[2];
-    static Pool MUL_fmt1[2];
-    static Pool MADDF_fmt[2];
-    static Pool DIV_fmt1[2];
-    static Pool MSUBF_fmt[2];
-    static Pool POOL32F_0[64];
-    static Pool MIN_fmt[2];
-    static Pool MAX_fmt[2];
-    static Pool MINA_fmt[2];
-    static Pool MAXA_fmt[2];
-    static Pool CVT_L_fmt[2];
-    static Pool RSQRT_fmt[2];
-    static Pool FLOOR_L_fmt[2];
-    static Pool CVT_W_fmt[2];
-    static Pool SQRT_fmt[2];
-    static Pool FLOOR_W_fmt[2];
-    static Pool RECIP_fmt[2];
-    static Pool CEIL_L_fmt[2];
-    static Pool CEIL_W_fmt[2];
-    static Pool TRUNC_L_fmt[2];
-    static Pool TRUNC_W_fmt[2];
-    static Pool ROUND_L_fmt[2];
-    static Pool ROUND_W_fmt[2];
-    static Pool POOL32Fxf_0[64];
-    static Pool MOV_fmt[4];
-    static Pool ABS_fmt[4];
-    static Pool NEG_fmt[4];
-    static Pool CVT_D_fmt[4];
-    static Pool CVT_S_fmt[4];
-    static Pool POOL32Fxf_1[32];
-    static Pool POOL32Fxf[4];
-    static Pool POOL32F_3[8];
-    static Pool CMP_condn_S[32];
-    static Pool CMP_condn_D[32];
-    static Pool POOL32F_5[8];
-    static Pool POOL32F[8];
-    static Pool POOL32S_0[64];
-    static Pool POOL32Sxf_4[128];
-    static Pool POOL32Sxf[8];
-    static Pool POOL32S_4[8];
-    static Pool POOL32S[8];
-    static Pool P_LUI[2];
-    static Pool P_GP_LH[2];
-    static Pool P_GP_SH[2];
-    static Pool P_GP_CP1[4];
-    static Pool P_GP_M64[4];
-    static Pool P_GP_BH[8];
-    static Pool P_LS_U12[16];
-    static Pool P_PREF_S9_[2];
-    static Pool P_LS_S0[16];
-    static Pool ASET_ACLR[2];
-    static Pool P_LL[4];
-    static Pool P_SC[4];
-    static Pool P_LLD[8];
-    static Pool P_SCD[8];
-    static Pool P_LS_S1[16];
-    static Pool P_PREFE[2];
-    static Pool P_LLE[4];
-    static Pool P_SCE[4];
-    static Pool P_LS_E0[16];
-    static Pool P_LS_WM[2];
-    static Pool P_LS_UAWM[2];
-    static Pool P_LS_DM[2];
-    static Pool P_LS_UADM[2];
-    static Pool P_LS_S9[8];
-    static Pool P_BAL[2];
-    static Pool P_BALRSC[2];
-    static Pool P_J[16];
-    static Pool P_BR3A[32];
-    static Pool P_BR1[4];
-    static Pool P_BR2[4];
-    static Pool P_BRI[8];
-    static Pool P32[32];
-    static Pool P16_SYSCALL[2];
-    static Pool P16_RI[4];
-    static Pool P16_MV[2];
-    static Pool P16_SHIFT[2];
-    static Pool POOL16C_00[4];
-    static Pool POOL16C_0[2];
-    static Pool P16C[2];
-    static Pool P16_A1[2];
-    static Pool P_ADDIU_RS5_[2];
-    static Pool P16_A2[2];
-    static Pool P16_ADDU[2];
-    static Pool P16_JRC[2];
-    static Pool P16_BR1[2];
-    static Pool P16_BR[2];
-    static Pool P16_SR[2];
-    static Pool P16_4X4[4];
-    static Pool P16_LB[4];
-    static Pool P16_LH[4];
-    static Pool P16[32];
-    static Pool MAJOR[2];
-
 };
 
 #endif
-- 
2.25.1


