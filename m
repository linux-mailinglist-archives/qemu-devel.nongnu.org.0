Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A23B5AD03D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:37:37 +0200 (CEST)
Received: from localhost ([::1]:40618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9U0-0004Cy-9k
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tS-0004dO-OI
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:52 -0400
Received: from mail-am7eur03on2106.outbound.protection.outlook.com
 ([40.107.105.106]:56865 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tO-0001wM-GW
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 05:59:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/vOvgzkfp0d6kFrtaZnkn/ZPno/LELTENH57XdBUT8TJI7yQzzaVYyA9P1XG/wleCgYMp6AStsJztBGwvVhcyCTtJ/UIjZ59bnFFvYM6RMb7ApwXWTGvtFQJbBHBG5S6YBEywwpnAlrEmhnN/4Bcpb2zHDFhm7sFQeryH9xslrXpLe8Nydaa7ul9Og8hDK/qz2mUJnmrHeLL4CwKYGGrfVkDrVTtJ3iuuSXtt7GigMbumpS+fdX5c53TOygzyL4VFA92xOrUmrI+TZlARu73ub6FE5pPiSD8N48oqe4QCHSsvLrf5cLMO5gM/ZYY/w7GI0+/auK4DhGqaMtEw52yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uaf+4n7Vi7l5DNhfI0ipFeXE+VonR3qkD3YyHYFoI/U=;
 b=U0dp6X4DH8NVVi+wJ8HTEUmS5fNMI9HC3Qn7rgenSHYPAb6/Yzw2Ecorz3LQ/uon3xyAZNpfhI7ScKRkJTZGayiQojs2rlij1xw6sgMjOnlunTmRzjV+Fi/T7xfUqVrD1v8f4pkiw60wSPmdIOI81wu0ekkGGUA/K4BXiTZGR96wF9Z65GlbK4IZU+2hZ/KJqPeuVqT0pQDCJ+PLiPoVt39kWR5CsIxCBDKsofmxfCKKIfySvR4ev577DmCjJ2nzdtFEILkQfSKaRH0OO5XfId4mbR+u2tbcJsR4oU+guza7h3Jup3LC5tg17Ta8fr5il+7W59MqumhFy0TSiTguJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uaf+4n7Vi7l5DNhfI0ipFeXE+VonR3qkD3YyHYFoI/U=;
 b=kgB7SM9YqVSPMakiSfURIqyOQiPoixe/J+aU2Wa6LsQTNLHC63Cw+wo1AKugl/t6xR/k7KLis/TMCn32HVu2FdxddHnrqHMV4qS02ZVpdRM7ahsCxa1MrPanKdQvgHdyQ5EHhpUT6aijpB3Ad8sHF+/ctehvS1HUGCDibloY7dY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 09:59:36 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:59:36 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 07/20] disas/nanomips: Remove Pool tables from the class
Date: Mon,  5 Sep 2022 11:55:09 +0200
Message-Id: <20220905095522.66941-8-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb9650bf-ed20-4561-1618-08da8f255706
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qjEJtNm/y1uB1yceYn6ZXSivMhelYcaw1cV3Lcu4aw/qhSnZgiNl4YsXTVrQEmRYkjKqOsB7a4P/+3/y7mhK7w9AT7vT6PDNsPx5o9leZI6weFSwMPmc87rc9UrLayEOREG0VhnlnjaE9xwbWEz77mSazkMbkMkdS3iTM3NQimhepM0WJ5XPcBlN+iMFDN3yfGns1Iu+Mc44tMiyrKfdweFqDP/Lt2HYj3wff06RaFG8YKspU/2IHXlfa/fGIYA0NUijyx48TJdd+LSOiroHMyPcFKHTDzE7zCAs/AIMwU/zqbq/KfS5PdGYVpk9IE5ngxchol0EkFVbfqpQaES7gPiW/5Iqds59M6VBWiHa9CywLj+gRM135ixyugz10rca4vHnuiENtVQCmt+UJqz2qQdlwPiSYvgWdA55NktfGRxznZX4NJibK7b35aSiDaH0bLaJ/fGTUbE66uLLgsovaYGvYsgPwQ02xiAa+SJSbehSziLFBO747XBulf01UCPD5X2z0/IctHM3i+RXPI9vlqGQgOhQyypjuVdxeAVsxyLbKHmcFQ6VRnK2E3V4BKcMFRHiVCZO6RVMLsAhxAn6Eajz9llLFN8DKybOfwiyO/mny8piVJY+DwWC8gqeVU2GMxfQWgUiUK3gs2vJ7zJ5TML6Vrnmjcyaf/M3QhdnOqjecALEwm+s0iamd5eCzXWtrkLuVUDvztBTRI5dEgzCYQa0CAhE8bJQF2RcZuHaOguQr11sGRCPdJ+/uTCyCRo3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(7416002)(8936002)(44832011)(5660300002)(30864003)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(6666004)(316002)(83380400001)(6916009)(54906003)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHlza1ZxcFNkYXFtVnZwOTJWY0FQS3k5SDFhSWhjc0dQQ2k4SmlxTnkrRXFC?=
 =?utf-8?B?TDg5TnRXZ2hpWDVrS1MvaVVhTk5vMUh0TVFWSmljUFJueVFpbnNPQVFUVStY?=
 =?utf-8?B?Z3NnTVdoMDhZK1B6YUt1Y0JFZ3NkcGZrV3IvcmFOZmNoMFQ3T2tIYUprRDls?=
 =?utf-8?B?ZWVMdUVDUDgrZnJyV0VWM20ra2ZBdDhvT0tOcWd0L01CTVBpR1RWMjJWR0s0?=
 =?utf-8?B?UlhQKysyWXV1bHJFS0RodVh3cGZ1N0ZnMEFRMDloUFVWMGJxeHpWcUYxamJU?=
 =?utf-8?B?MngrOGRJU1FkTjhGclFQQ20yVU5iUXVZK3B1TmdDLzJ2ZjJPRzZBN1dSZGxU?=
 =?utf-8?B?NFh5WGs4UCt4cFNtMGhyU3hzdSt6c2Q4OS9JR2Y1c05IUW5vakJGcFdHZmRx?=
 =?utf-8?B?anFHMDJTbDFvdkhQOHpTTkQ5QndrRHVkdkRSdFQwTU42SHh1MmZCbXMyR0pO?=
 =?utf-8?B?cld6WG1Fd296NHNtNmJHOHBMWHdQQ3hMUURGTGV2cXN6M2tLc2FLaVp1TzMv?=
 =?utf-8?B?dEFCZ0NrRUZXaDZSdFJjY1RiS2NENEFOaGVONWY5L01xQS9nTS81aXR6SUg2?=
 =?utf-8?B?KzljdUxiL00vZFdmU3luYVFyTGFTM3JYTmlsSkNoTFVrdVVoS2xRdXBVazZ6?=
 =?utf-8?B?bFdmYjBuWFRTUzNPOGZYQkRYSU5TYkQrWm1mUzhFampiTkFNRWtJM3hGdy8z?=
 =?utf-8?B?dTNBRks5MWZjTDJaNE45RGdmYzRXRmQ4QVFoT01ENGVrbFVab05ncE5OQVo3?=
 =?utf-8?B?Z3RTSUlCSndnUFBQUno1V243Y3FCQ0NXVlpSVXBLeEhDTVBiVHdBc2x4T0E3?=
 =?utf-8?B?T2RpV1p1ZklQK0pvUmpZNlVxL2taRzFkZEpzZFMvSmEyS2xtZ1dGUTF4WnNu?=
 =?utf-8?B?a2dvRXZ5NFFRb3NsK0dNM1BCV09BOHhORkt0ZzVUWkF6V0hQMVVFekRWb2o4?=
 =?utf-8?B?TURBbk9XSVVtSjRUdmdrMHBwSC9MWW9nYmdSOGVLS1crNjFpeThUb1d0SVJ0?=
 =?utf-8?B?U0F5TWUyc05OYUJ3b0l1WHhqSTE4YlVPSzdtbkZ5cGVIVzc5enlZYWt6dFZI?=
 =?utf-8?B?NWo1dGRSQkZEcFZaMDNEcjlSZ1hKWEpjaG15TGZIM3lBUXBMMHVqTTgxNGdZ?=
 =?utf-8?B?b3pyVElweTh0cXFLL0hqOHd3K0packhUdmdaU21FamFKNXNxaFpwUEhDc1pP?=
 =?utf-8?B?UWs4SFY1TUNGSTR2bUMxb0YxR1lMSEtGblNrUGtIaVFGbnNzd0x6S3kybFBD?=
 =?utf-8?B?VWp3NGg5bC9neWJpclVZdFhjUkdUbFRESmQvdWV6NnFPSHdhNmJBaWZpbWRE?=
 =?utf-8?B?b2NKSTlpVXdycXRFS29iTlRnbDhyR1lZQ0xJM2VzTjBpVURMcVpVNmFMSVUx?=
 =?utf-8?B?a0pPeUFJQjZQdkhwOHIzWXB5ckFDWSt5Kys0cEJIQktDUHk4c2JFWHF6UHFv?=
 =?utf-8?B?d04vR0lFN2JKUTJkSytVdlJyNFhkUVVDbzQxS0JvZ1paY0hUcG92cExiWENX?=
 =?utf-8?B?dDVXUXdXdVB3czAzY2s4a3l3VzhFb0liUGJUOGd3OHJVMXF1Zy9aUHNZYzdu?=
 =?utf-8?B?QmoycFQ5NTV6TGdZeDhLUno1Q2FMNEgwbzN3czVLbG5SR2tRT21oMFpYVkR4?=
 =?utf-8?B?cVpUYk5NajFRSktxeGNxbnh0RUQ0SkFDM3Z2aFpFVldyd0dRSGxPdUxUL1JB?=
 =?utf-8?B?UXQvSFdabnc5WHY2V2tQMUt6aTI1SEQxYzQ2bld1bEFJd3h4eCtqWWhndWtk?=
 =?utf-8?B?Rkl0T0Zva3gwZXFrVTFBYStjTVF4MVlzQWNUUUxhT0V1YTJhV3lraDhpaDZ2?=
 =?utf-8?B?T016dGxyNWNKcHovQ0NodmswNHBmRnh0SWQraEp6QnpsbXNzYm5BUW1hb3c5?=
 =?utf-8?B?OGpiRVJ1S2tMRzlNTnNMTitURWpaQk5KbnFsRzVHOHRDaWU1cWtvRTgxMklx?=
 =?utf-8?B?aGhDZTlMYTBrcWhObHFmK3VCVmluV3BtZXZFWUFBc0ZnTnpFanBpeUVFU21K?=
 =?utf-8?B?RjBEdzZSb2c0WTJRWWdIMHZGOHBUeGJNSEs2cVlidEpobnNOanFoa01XczZy?=
 =?utf-8?B?WjVpU3o4QUx3UUFCanFHNmYzSkJqekhvbmM3OHRqVTMwditPcmJSNFQwRmJ6?=
 =?utf-8?B?ZEgvZTJKTDEranl4QUxFOVZnK3NzemlDVmJ4ZlEzNFFCVkZ4bGZiMHRiZDk0?=
 =?utf-8?B?c0E9PQ==?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9650bf-ed20-4561-1618-08da8f255706
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:59:36.5737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBchfCHeiB8rgYspQe5OhDRpI47s2h/+JDmq9YEZwhkGLqTX7D3Y0A1RhZYwe977lPxSRKVUWRD4sBYwrxPpIeo/6sVvg8X7ZAeEXINQR8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.106;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 disas/nanomips.cpp | 363 ++++++++++++++++++++++-----------------------
 disas/nanomips.h   | 200 ++-----------------------
 2 files changed, 193 insertions(+), 370 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 7ea6326f1d..37809ff365 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -751,13 +751,6 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 }
 
 
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type, img_address m_pc)
-{
-    return Disassemble(data, dis, type, MAJOR, 2, m_pc);
-}
-
-
 /*
  * Recurse through tables until the instruction is found then return
  * the string and size
@@ -16667,7 +16660,7 @@ static std::string YIELD(uint64 instruction, img_address m_pc)
  *
  */
 
-NMD::Pool NMD::P_SYSCALL[2] = {
+static struct Pool P_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfffc0000, 0x00080000, &SYSCALL_32_      , 0,
        0x0                 },        /* SYSCALL[32] */
@@ -16677,7 +16670,7 @@ NMD::Pool NMD::P_SYSCALL[2] = {
 };
 
 
-NMD::Pool NMD::P_RI[4] = {
+static struct Pool P_RI[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfff80000, 0x00000000, &SIGRIE           , 0,
        0x0                 },        /* SIGRIE */
@@ -16693,7 +16686,7 @@ NMD::Pool NMD::P_RI[4] = {
 };
 
 
-NMD::Pool NMD::P_ADDIU[2] = {
+static struct Pool P_ADDIU[2] = {
     { pool                , P_RI                , 4   , 32,
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
@@ -16703,7 +16696,7 @@ NMD::Pool NMD::P_ADDIU[2] = {
 };
 
 
-NMD::Pool NMD::P_TRAP[2] = {
+static struct Pool P_TRAP[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000000, &TEQ              , 0,
        XMMS_               },        /* TEQ */
@@ -16713,7 +16706,7 @@ NMD::Pool NMD::P_TRAP[2] = {
 };
 
 
-NMD::Pool NMD::P_CMOVE[2] = {
+static struct Pool P_CMOVE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000210, &MOVZ             , 0,
        0x0                 },        /* MOVZ */
@@ -16723,7 +16716,7 @@ NMD::Pool NMD::P_CMOVE[2] = {
 };
 
 
-NMD::Pool NMD::P_D_MT_VPE[2] = {
+static struct Pool P_D_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1f3fff, 0x20010ab0, &DMT              , 0,
        MT_                 },        /* DMT */
@@ -16733,7 +16726,7 @@ NMD::Pool NMD::P_D_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::P_E_MT_VPE[2] = {
+static struct Pool P_E_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1f3fff, 0x20010eb0, &EMT              , 0,
        MT_                 },        /* EMT */
@@ -16743,7 +16736,7 @@ NMD::Pool NMD::P_E_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::_P_MT_VPE[2] = {
+static struct Pool _P_MT_VPE[2] = {
     { pool                , P_D_MT_VPE          , 2   , 32,
        0xfc003fff, 0x20000ab0, 0                      , 0,
        0x0                 },        /* P.D_MT_VPE */
@@ -16753,7 +16746,7 @@ NMD::Pool NMD::_P_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::P_MT_VPE[8] = {
+static struct Pool P_MT_VPE[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003bff, 0x200002b0, 0                      , 0,
        0x0                 },        /* P.MT_VPE~*(0) */
@@ -16781,7 +16774,7 @@ NMD::Pool NMD::P_MT_VPE[8] = {
 };
 
 
-NMD::Pool NMD::P_DVP[2] = {
+static struct Pool P_DVP[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x20000390, &DVP              , 0,
        0x0                 },        /* DVP */
@@ -16791,7 +16784,7 @@ NMD::Pool NMD::P_DVP[2] = {
 };
 
 
-NMD::Pool NMD::P_SLTU[2] = {
+static struct Pool P_SLTU[2] = {
     { pool                , P_DVP               , 2   , 32,
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
@@ -16801,7 +16794,7 @@ NMD::Pool NMD::P_SLTU[2] = {
 };
 
 
-NMD::Pool NMD::_POOL32A0[128] = {
+static struct Pool _POOL32A0[128] = {
     { pool                , P_TRAP              , 2   , 32,
        0xfc0003ff, 0x20000000, 0                      , 0,
        0x0                 },        /* P.TRAP */
@@ -17189,7 +17182,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
 };
 
 
-NMD::Pool NMD::ADDQ__S__PH[2] = {
+static struct Pool ADDQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000000d, &ADDQ_PH          , 0,
        DSP_                },        /* ADDQ.PH */
@@ -17199,7 +17192,7 @@ NMD::Pool NMD::ADDQ__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::MUL__S__PH[2] = {
+static struct Pool MUL__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000002d, &MUL_PH           , 0,
        DSP_                },        /* MUL.PH */
@@ -17209,7 +17202,7 @@ NMD::Pool NMD::MUL__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDQH__R__PH[2] = {
+static struct Pool ADDQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000004d, &ADDQH_PH         , 0,
        DSP_                },        /* ADDQH.PH */
@@ -17219,7 +17212,7 @@ NMD::Pool NMD::ADDQH__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDQH__R__W[2] = {
+static struct Pool ADDQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000008d, &ADDQH_W          , 0,
        DSP_                },        /* ADDQH.W */
@@ -17229,7 +17222,7 @@ NMD::Pool NMD::ADDQH__R__W[2] = {
 };
 
 
-NMD::Pool NMD::ADDU__S__QB[2] = {
+static struct Pool ADDU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200000cd, &ADDU_QB          , 0,
        DSP_                },        /* ADDU.QB */
@@ -17239,7 +17232,7 @@ NMD::Pool NMD::ADDU__S__QB[2] = {
 };
 
 
-NMD::Pool NMD::ADDU__S__PH[2] = {
+static struct Pool ADDU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000010d, &ADDU_PH          , 0,
        DSP_                },        /* ADDU.PH */
@@ -17249,7 +17242,7 @@ NMD::Pool NMD::ADDU__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDUH__R__QB[2] = {
+static struct Pool ADDUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000014d, &ADDUH_QB         , 0,
        DSP_                },        /* ADDUH.QB */
@@ -17259,7 +17252,7 @@ NMD::Pool NMD::ADDUH__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SHRAV__R__PH[2] = {
+static struct Pool SHRAV__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000018d, &SHRAV_PH         , 0,
        DSP_                },        /* SHRAV.PH */
@@ -17269,7 +17262,7 @@ NMD::Pool NMD::SHRAV__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHRAV__R__QB[2] = {
+static struct Pool SHRAV__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200001cd, &SHRAV_QB         , 0,
        DSP_                },        /* SHRAV.QB */
@@ -17279,7 +17272,7 @@ NMD::Pool NMD::SHRAV__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SUBQ__S__PH[2] = {
+static struct Pool SUBQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000020d, &SUBQ_PH          , 0,
        DSP_                },        /* SUBQ.PH */
@@ -17289,7 +17282,7 @@ NMD::Pool NMD::SUBQ__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBQH__R__PH[2] = {
+static struct Pool SUBQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000024d, &SUBQH_PH         , 0,
        DSP_                },        /* SUBQH.PH */
@@ -17299,7 +17292,7 @@ NMD::Pool NMD::SUBQH__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBQH__R__W[2] = {
+static struct Pool SUBQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000028d, &SUBQH_W          , 0,
        DSP_                },        /* SUBQH.W */
@@ -17309,7 +17302,7 @@ NMD::Pool NMD::SUBQH__R__W[2] = {
 };
 
 
-NMD::Pool NMD::SUBU__S__QB[2] = {
+static struct Pool SUBU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200002cd, &SUBU_QB          , 0,
        DSP_                },        /* SUBU.QB */
@@ -17319,7 +17312,7 @@ NMD::Pool NMD::SUBU__S__QB[2] = {
 };
 
 
-NMD::Pool NMD::SUBU__S__PH[2] = {
+static struct Pool SUBU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000030d, &SUBU_PH          , 0,
        DSP_                },        /* SUBU.PH */
@@ -17329,7 +17322,7 @@ NMD::Pool NMD::SUBU__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHRA__R__PH[2] = {
+static struct Pool SHRA__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000335, &SHRA_PH          , 0,
        DSP_                },        /* SHRA.PH */
@@ -17339,7 +17332,7 @@ NMD::Pool NMD::SHRA__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBUH__R__QB[2] = {
+static struct Pool SUBUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000034d, &SUBUH_QB         , 0,
        DSP_                },        /* SUBUH.QB */
@@ -17349,7 +17342,7 @@ NMD::Pool NMD::SUBUH__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SHLLV__S__PH[2] = {
+static struct Pool SHLLV__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000038d, &SHLLV_PH         , 0,
        DSP_                },        /* SHLLV.PH */
@@ -17359,7 +17352,7 @@ NMD::Pool NMD::SHLLV__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHLL__S__PH[4] = {
+static struct Pool SHLL__S__PH[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000fff, 0x200003b5, &SHLL_PH          , 0,
        DSP_                },        /* SHLL.PH */
@@ -17375,7 +17368,7 @@ NMD::Pool NMD::SHLL__S__PH[4] = {
 };
 
 
-NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
+static struct Pool PRECR_SRA__R__PH_W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200003cd, &PRECR_SRA_PH_W   , 0,
        DSP_                },        /* PRECR_SRA.PH.W */
@@ -17385,7 +17378,7 @@ NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
 };
 
 
-NMD::Pool NMD::_POOL32A5[128] = {
+static struct Pool _POOL32A5[128] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0x20000005, &CMP_EQ_PH        , 0,
        DSP_                },        /* CMP.EQ.PH */
@@ -17773,7 +17766,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
 };
 
 
-NMD::Pool NMD::PP_LSX[16] = {
+static struct Pool PP_LSX[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000007, &LBX              , 0,
        0x0                 },        /* LBX */
@@ -17825,7 +17818,7 @@ NMD::Pool NMD::PP_LSX[16] = {
 };
 
 
-NMD::Pool NMD::PP_LSXS[16] = {
+static struct Pool PP_LSXS[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0x20000047, 0                      , 0,
        0x0                 },        /* PP.LSXS~*(0) */
@@ -17877,7 +17870,7 @@ NMD::Pool NMD::PP_LSXS[16] = {
 };
 
 
-NMD::Pool NMD::P_LSX[2] = {
+static struct Pool P_LSX[2] = {
     { pool                , PP_LSX              , 16  , 32,
        0xfc00007f, 0x20000007, 0                      , 0,
        0x0                 },        /* PP.LSX */
@@ -17887,7 +17880,7 @@ NMD::Pool NMD::P_LSX[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_0[4] = {
+static struct Pool POOL32Axf_1_0[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000007f, &MFHI_DSP_        , 0,
        DSP_                },        /* MFHI[DSP] */
@@ -17903,7 +17896,7 @@ NMD::Pool NMD::POOL32Axf_1_0[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_1[4] = {
+static struct Pool POOL32Axf_1_1[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000027f, &MTHLIP           , 0,
        DSP_                },        /* MTHLIP */
@@ -17919,7 +17912,7 @@ NMD::Pool NMD::POOL32Axf_1_1[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_3[4] = {
+static struct Pool POOL32Axf_1_3[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000067f, &RDDSP            , 0,
        DSP_                },        /* RDDSP */
@@ -17935,7 +17928,7 @@ NMD::Pool NMD::POOL32Axf_1_3[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_4[2] = {
+static struct Pool POOL32Axf_1_4[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc001fff, 0x2000087f, &SHLL_QB          , 0,
        DSP_                },        /* SHLL.QB */
@@ -17945,7 +17938,7 @@ NMD::Pool NMD::POOL32Axf_1_4[2] = {
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
+static struct Pool MAQ_S_A__W_PHR[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20000a7f, &MAQ_S_W_PHR      , 0,
        DSP_                },        /* MAQ_S.W.PHR */
@@ -17955,7 +17948,7 @@ NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
+static struct Pool MAQ_S_A__W_PHL[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20001a7f, &MAQ_S_W_PHL      , 0,
        DSP_                },        /* MAQ_S.W.PHL */
@@ -17965,7 +17958,7 @@ NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_5[2] = {
+static struct Pool POOL32Axf_1_5[2] = {
     { pool                , MAQ_S_A__W_PHR      , 2   , 32,
        0xfc001fff, 0x20000a7f, 0                      , 0,
        0x0                 },        /* MAQ_S[A].W.PHR */
@@ -17975,7 +17968,7 @@ NMD::Pool NMD::POOL32Axf_1_5[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_7[4] = {
+static struct Pool POOL32Axf_1_7[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20000e7f, &EXTR_W           , 0,
        DSP_                },        /* EXTR.W */
@@ -17991,7 +17984,7 @@ NMD::Pool NMD::POOL32Axf_1_7[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1[8] = {
+static struct Pool POOL32Axf_1[8] = {
     { pool                , POOL32Axf_1_0       , 4   , 32,
        0xfc000fff, 0x2000007f, 0                      , 0,
        0x0                 },        /* POOL32Axf_1_0 */
@@ -18019,7 +18012,7 @@ NMD::Pool NMD::POOL32Axf_1[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
+static struct Pool POOL32Axf_2_DSP__0_7[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200000bf, &DPA_W_PH         , 0,
        DSP_                },        /* DPA.W.PH */
@@ -18047,7 +18040,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
+static struct Pool POOL32Axf_2_DSP__8_15[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200010bf, &DPAX_W_PH        , 0,
        DSP_                },        /* DPAX.W.PH */
@@ -18075,7 +18068,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
+static struct Pool POOL32Axf_2_DSP__16_23[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200020bf, &DPAU_H_QBL       , 0,
        DSP_                },        /* DPAU.H.QBL */
@@ -18103,7 +18096,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
+static struct Pool POOL32Axf_2_DSP__24_31[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200030bf, &DPAU_H_QBR       , 0,
        DSP_                },        /* DPAU.H.QBR */
@@ -18131,7 +18124,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2[4] = {
+static struct Pool POOL32Axf_2[4] = {
     { pool                , POOL32Axf_2_DSP__0_7, 8   , 32,
        0xfc0031ff, 0x200000bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_0_7 */
@@ -18147,7 +18140,7 @@ NMD::Pool NMD::POOL32Axf_2[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_4[128] = {
+static struct Pool POOL32Axf_4[128] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x2000013f, &ABSQ_S_QB        , 0,
        DSP_                },        /* ABSQ_S.QB */
@@ -18535,7 +18528,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group0[32] = {
+static struct Pool POOL32Axf_5_group0[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x2000017f, &TLBGP            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGP */
@@ -18635,7 +18628,7 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group1[32] = {
+static struct Pool POOL32Axf_5_group1[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000417f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(0) */
@@ -18735,7 +18728,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
 };
 
 
-NMD::Pool NMD::ERETx[2] = {
+static struct Pool ERETx[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc01ffff, 0x2000f37f, &ERET             , 0,
        0x0                 },        /* ERET */
@@ -18745,7 +18738,7 @@ NMD::Pool NMD::ERETx[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group3[32] = {
+static struct Pool POOL32Axf_5_group3[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000c17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(0) */
@@ -18845,7 +18838,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5[4] = {
+static struct Pool POOL32Axf_5[4] = {
     { pool                , POOL32Axf_5_group0  , 32  , 32,
        0xfc00c1ff, 0x2000017f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0 */
@@ -18861,7 +18854,7 @@ NMD::Pool NMD::POOL32Axf_5[4] = {
 };
 
 
-NMD::Pool NMD::SHRA__R__QB[2] = {
+static struct Pool SHRA__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc001fff, 0x200001ff, &SHRA_QB          , 0,
        DSP_                },        /* SHRA.QB */
@@ -18871,7 +18864,7 @@ NMD::Pool NMD::SHRA__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_7[8] = {
+static struct Pool POOL32Axf_7[8] = {
     { pool                , SHRA__R__QB         , 2   , 32,
        0xfc000fff, 0x200001ff, 0                      , 0,
        0x0                 },        /* SHRA[_R].QB */
@@ -18899,7 +18892,7 @@ NMD::Pool NMD::POOL32Axf_7[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf[8] = {
+static struct Pool POOL32Axf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0x2000003f, 0                      , 0,
        0x0                 },        /* POOL32Axf~*(0) */
@@ -18927,7 +18920,7 @@ NMD::Pool NMD::POOL32Axf[8] = {
 };
 
 
-NMD::Pool NMD::_POOL32A7[8] = {
+static struct Pool _POOL32A7[8] = {
     { pool                , P_LSX               , 2   , 32,
        0xfc00003f, 0x20000007, 0                      , 0,
        0x0                 },        /* P.LSX */
@@ -18955,7 +18948,7 @@ NMD::Pool NMD::_POOL32A7[8] = {
 };
 
 
-NMD::Pool NMD::P32A[8] = {
+static struct Pool P32A[8] = {
     { pool                , _POOL32A0           , 128 , 32,
        0xfc000007, 0x20000000, 0                      , 0,
        0x0                 },        /* _POOL32A0 */
@@ -18983,7 +18976,7 @@ NMD::Pool NMD::P32A[8] = {
 };
 
 
-NMD::Pool NMD::P_GP_D[2] = {
+static struct Pool P_GP_D[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000007, 0x40000001, &LD_GP_           , 0,
        MIPS64_             },        /* LD[GP] */
@@ -18993,7 +18986,7 @@ NMD::Pool NMD::P_GP_D[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_W[4] = {
+static struct Pool P_GP_W[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000003, 0x40000000, &ADDIU_GP_W_      , 0,
        0x0                 },        /* ADDIU[GP.W] */
@@ -19009,7 +19002,7 @@ NMD::Pool NMD::P_GP_W[4] = {
 };
 
 
-NMD::Pool NMD::POOL48I[32] = {
+static struct Pool POOL48I[32] = {
     { instruction         , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600000000000ull, &LI_48_           , 0,
        XMMS_               },        /* LI[48] */
@@ -19109,7 +19102,7 @@ NMD::Pool NMD::POOL48I[32] = {
 };
 
 
-NMD::Pool NMD::PP_SR[4] = {
+static struct Pool PP_SR[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc10f003, 0x80003000, &SAVE_32_         , 0,
        0x0                 },        /* SAVE[32] */
@@ -19125,7 +19118,7 @@ NMD::Pool NMD::PP_SR[4] = {
 };
 
 
-NMD::Pool NMD::P_SR_F[8] = {
+static struct Pool P_SR_F[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc10f007, 0x80103000, &SAVEF            , 0,
        CP1_                },        /* SAVEF */
@@ -19153,7 +19146,7 @@ NMD::Pool NMD::P_SR_F[8] = {
 };
 
 
-NMD::Pool NMD::P_SR[2] = {
+static struct Pool P_SR[2] = {
     { pool                , PP_SR               , 4   , 32,
        0xfc10f000, 0x80003000, 0                      , 0,
        0x0                 },        /* PP.SR */
@@ -19163,7 +19156,7 @@ NMD::Pool NMD::P_SR[2] = {
 };
 
 
-NMD::Pool NMD::P_SLL[5] = {
+static struct Pool P_SLL[5] = {
     { instruction         , 0                   , 0   , 32,
        0xffe0f1ff, 0x8000c000, &NOP_32_          , 0,
        0x0                 },        /* NOP[32] */
@@ -19182,7 +19175,7 @@ NMD::Pool NMD::P_SLL[5] = {
 };
 
 
-NMD::Pool NMD::P_SHIFT[16] = {
+static struct Pool P_SHIFT[16] = {
     { pool                , P_SLL               , 5   , 32,
        0xfc00f1e0, 0x8000c000, 0                      , 0,
        0x0                 },        /* P.SLL */
@@ -19234,7 +19227,7 @@ NMD::Pool NMD::P_SHIFT[16] = {
 };
 
 
-NMD::Pool NMD::P_ROTX[4] = {
+static struct Pool P_ROTX[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000d000, &ROTX             , 0,
        XMMS_               },        /* ROTX */
@@ -19250,7 +19243,7 @@ NMD::Pool NMD::P_ROTX[4] = {
 };
 
 
-NMD::Pool NMD::P_INS[4] = {
+static struct Pool P_INS[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000e000, &INS              , 0,
        XMMS_               },        /* INS */
@@ -19266,7 +19259,7 @@ NMD::Pool NMD::P_INS[4] = {
 };
 
 
-NMD::Pool NMD::P_EXT[4] = {
+static struct Pool P_EXT[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000f000, &EXT              , 0,
        XMMS_               },        /* EXT */
@@ -19282,7 +19275,7 @@ NMD::Pool NMD::P_EXT[4] = {
 };
 
 
-NMD::Pool NMD::P_U12[16] = {
+static struct Pool P_U12[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f000, 0x80000000, &ORI              , 0,
        0x0                 },        /* ORI */
@@ -19334,7 +19327,7 @@ NMD::Pool NMD::P_U12[16] = {
 };
 
 
-NMD::Pool NMD::RINT_fmt[2] = {
+static struct Pool RINT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000020, &RINT_S           , 0,
        CP1_                },        /* RINT.S */
@@ -19344,7 +19337,7 @@ NMD::Pool NMD::RINT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ADD_fmt0[2] = {
+static struct Pool ADD_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000030, &ADD_S            , 0,
        CP1_                },        /* ADD.S */
@@ -19354,7 +19347,7 @@ NMD::Pool NMD::ADD_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELEQZ_fmt[2] = {
+static struct Pool SELEQZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000038, &SELEQZ_S         , 0,
        CP1_                },        /* SELEQZ.S */
@@ -19364,7 +19357,7 @@ NMD::Pool NMD::SELEQZ_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CLASS_fmt[2] = {
+static struct Pool CLASS_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000060, &CLASS_S          , 0,
        CP1_                },        /* CLASS.S */
@@ -19374,7 +19367,7 @@ NMD::Pool NMD::CLASS_fmt[2] = {
 };
 
 
-NMD::Pool NMD::SUB_fmt0[2] = {
+static struct Pool SUB_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000070, &SUB_S            , 0,
        CP1_                },        /* SUB.S */
@@ -19384,7 +19377,7 @@ NMD::Pool NMD::SUB_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELNEZ_fmt[2] = {
+static struct Pool SELNEZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000078, &SELNEZ_S         , 0,
        CP1_                },        /* SELNEZ.S */
@@ -19394,7 +19387,7 @@ NMD::Pool NMD::SELNEZ_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MUL_fmt0[2] = {
+static struct Pool MUL_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000b0, &MUL_S            , 0,
        CP1_                },        /* MUL.S */
@@ -19404,7 +19397,7 @@ NMD::Pool NMD::MUL_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SEL_fmt[2] = {
+static struct Pool SEL_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000b8, &SEL_S            , 0,
        CP1_                },        /* SEL.S */
@@ -19414,7 +19407,7 @@ NMD::Pool NMD::SEL_fmt[2] = {
 };
 
 
-NMD::Pool NMD::DIV_fmt0[2] = {
+static struct Pool DIV_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000f0, &DIV_S            , 0,
        CP1_                },        /* DIV.S */
@@ -19424,7 +19417,7 @@ NMD::Pool NMD::DIV_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::ADD_fmt1[2] = {
+static struct Pool ADD_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000130, &ADD_D            , 0,
        CP1_                },        /* ADD.D */
@@ -19434,7 +19427,7 @@ NMD::Pool NMD::ADD_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::SUB_fmt1[2] = {
+static struct Pool SUB_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000170, &SUB_D            , 0,
        CP1_                },        /* SUB.D */
@@ -19444,7 +19437,7 @@ NMD::Pool NMD::SUB_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MUL_fmt1[2] = {
+static struct Pool MUL_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001b0, &MUL_D            , 0,
        CP1_                },        /* MUL.D */
@@ -19454,7 +19447,7 @@ NMD::Pool NMD::MUL_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MADDF_fmt[2] = {
+static struct Pool MADDF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001b8, &MADDF_S          , 0,
        CP1_                },        /* MADDF.S */
@@ -19464,7 +19457,7 @@ NMD::Pool NMD::MADDF_fmt[2] = {
 };
 
 
-NMD::Pool NMD::DIV_fmt1[2] = {
+static struct Pool DIV_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001f0, &DIV_D            , 0,
        CP1_                },        /* DIV.D */
@@ -19474,7 +19467,7 @@ NMD::Pool NMD::DIV_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MSUBF_fmt[2] = {
+static struct Pool MSUBF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001f8, &MSUBF_S          , 0,
        CP1_                },        /* MSUBF.S */
@@ -19484,7 +19477,7 @@ NMD::Pool NMD::MSUBF_fmt[2] = {
 };
 
 
-NMD::Pool NMD::POOL32F_0[64] = {
+static struct Pool POOL32F_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0~*(0) */
@@ -19680,7 +19673,7 @@ NMD::Pool NMD::POOL32F_0[64] = {
 };
 
 
-NMD::Pool NMD::MIN_fmt[2] = {
+static struct Pool MIN_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa0000003, &MIN_S            , 0,
        CP1_                },        /* MIN.S */
@@ -19690,7 +19683,7 @@ NMD::Pool NMD::MIN_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MAX_fmt[2] = {
+static struct Pool MAX_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa000000b, &MAX_S            , 0,
        CP1_                },        /* MAX.S */
@@ -19700,7 +19693,7 @@ NMD::Pool NMD::MAX_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MINA_fmt[2] = {
+static struct Pool MINA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa0000023, &MINA_S           , 0,
        CP1_                },        /* MINA.S */
@@ -19710,7 +19703,7 @@ NMD::Pool NMD::MINA_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MAXA_fmt[2] = {
+static struct Pool MAXA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa000002b, &MAXA_S           , 0,
        CP1_                },        /* MAXA.S */
@@ -19720,7 +19713,7 @@ NMD::Pool NMD::MAXA_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CVT_L_fmt[2] = {
+static struct Pool CVT_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000013b, &CVT_L_S          , 0,
        CP1_                },        /* CVT.L.S */
@@ -19730,7 +19723,7 @@ NMD::Pool NMD::CVT_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::RSQRT_fmt[2] = {
+static struct Pool RSQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000023b, &RSQRT_S          , 0,
        CP1_                },        /* RSQRT.S */
@@ -19740,7 +19733,7 @@ NMD::Pool NMD::RSQRT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::FLOOR_L_fmt[2] = {
+static struct Pool FLOOR_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000033b, &FLOOR_L_S        , 0,
        CP1_                },        /* FLOOR.L.S */
@@ -19750,7 +19743,7 @@ NMD::Pool NMD::FLOOR_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CVT_W_fmt[2] = {
+static struct Pool CVT_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000093b, &CVT_W_S          , 0,
        CP1_                },        /* CVT.W.S */
@@ -19760,7 +19753,7 @@ NMD::Pool NMD::CVT_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::SQRT_fmt[2] = {
+static struct Pool SQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000a3b, &SQRT_S           , 0,
        CP1_                },        /* SQRT.S */
@@ -19770,7 +19763,7 @@ NMD::Pool NMD::SQRT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::FLOOR_W_fmt[2] = {
+static struct Pool FLOOR_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000b3b, &FLOOR_W_S        , 0,
        CP1_                },        /* FLOOR.W.S */
@@ -19780,7 +19773,7 @@ NMD::Pool NMD::FLOOR_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::RECIP_fmt[2] = {
+static struct Pool RECIP_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000123b, &RECIP_S          , 0,
        CP1_                },        /* RECIP.S */
@@ -19790,7 +19783,7 @@ NMD::Pool NMD::RECIP_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CEIL_L_fmt[2] = {
+static struct Pool CEIL_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000133b, &CEIL_L_S         , 0,
        CP1_                },        /* CEIL.L.S */
@@ -19800,7 +19793,7 @@ NMD::Pool NMD::CEIL_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CEIL_W_fmt[2] = {
+static struct Pool CEIL_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0001b3b, &CEIL_W_S         , 0,
        CP1_                },        /* CEIL.W.S */
@@ -19810,7 +19803,7 @@ NMD::Pool NMD::CEIL_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::TRUNC_L_fmt[2] = {
+static struct Pool TRUNC_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000233b, &TRUNC_L_S        , 0,
        CP1_                },        /* TRUNC.L.S */
@@ -19820,7 +19813,7 @@ NMD::Pool NMD::TRUNC_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::TRUNC_W_fmt[2] = {
+static struct Pool TRUNC_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0002b3b, &TRUNC_W_S        , 0,
        CP1_                },        /* TRUNC.W.S */
@@ -19830,7 +19823,7 @@ NMD::Pool NMD::TRUNC_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ROUND_L_fmt[2] = {
+static struct Pool ROUND_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000333b, &ROUND_L_S        , 0,
        CP1_                },        /* ROUND.L.S */
@@ -19840,7 +19833,7 @@ NMD::Pool NMD::ROUND_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ROUND_W_fmt[2] = {
+static struct Pool ROUND_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0003b3b, &ROUND_W_S        , 0,
        CP1_                },        /* ROUND.W.S */
@@ -19850,7 +19843,7 @@ NMD::Pool NMD::ROUND_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf_0[64] = {
+static struct Pool POOL32Fxf_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(0) */
@@ -20046,7 +20039,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
 };
 
 
-NMD::Pool NMD::MOV_fmt[4] = {
+static struct Pool MOV_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000007b, &MOV_S            , 0,
        CP1_                },        /* MOV.S */
@@ -20062,7 +20055,7 @@ NMD::Pool NMD::MOV_fmt[4] = {
 };
 
 
-NMD::Pool NMD::ABS_fmt[4] = {
+static struct Pool ABS_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000037b, &ABS_S            , 0,
        CP1_                },        /* ABS.S */
@@ -20078,7 +20071,7 @@ NMD::Pool NMD::ABS_fmt[4] = {
 };
 
 
-NMD::Pool NMD::NEG_fmt[4] = {
+static struct Pool NEG_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000b7b, &NEG_S            , 0,
        CP1_                },        /* NEG.S */
@@ -20094,7 +20087,7 @@ NMD::Pool NMD::NEG_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_D_fmt[4] = {
+static struct Pool CVT_D_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000137b, &CVT_D_S          , 0,
        CP1_                },        /* CVT.D.S */
@@ -20110,7 +20103,7 @@ NMD::Pool NMD::CVT_D_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_S_fmt[4] = {
+static struct Pool CVT_S_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0001b7b, &CVT_S_D          , 0,
        CP1_                },        /* CVT.S.D */
@@ -20126,7 +20119,7 @@ NMD::Pool NMD::CVT_S_fmt[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf_1[32] = {
+static struct Pool POOL32Fxf_1[32] = {
     { pool                , MOV_fmt             , 4   , 32,
        0xfc001fff, 0xa000007b, 0                      , 0,
        CP1_                },        /* MOV.fmt */
@@ -20226,7 +20219,7 @@ NMD::Pool NMD::POOL32Fxf_1[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf[4] = {
+static struct Pool POOL32Fxf[4] = {
     { pool                , POOL32Fxf_0         , 64  , 32,
        0xfc0000ff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0 */
@@ -20242,7 +20235,7 @@ NMD::Pool NMD::POOL32Fxf[4] = {
 };
 
 
-NMD::Pool NMD::POOL32F_3[8] = {
+static struct Pool POOL32F_3[8] = {
     { pool                , MIN_fmt             , 2   , 32,
        0xfc00003f, 0xa0000003, 0                      , 0,
        CP1_                },        /* MIN.fmt */
@@ -20270,7 +20263,7 @@ NMD::Pool NMD::POOL32F_3[8] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_S[32] = {
+static struct Pool CMP_condn_S[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000005, &CMP_AF_S         , 0,
        CP1_                },        /* CMP.AF.S */
@@ -20370,7 +20363,7 @@ NMD::Pool NMD::CMP_condn_S[32] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_D[32] = {
+static struct Pool CMP_condn_D[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000015, &CMP_AF_D         , 0,
        CP1_                },        /* CMP.AF.D */
@@ -20470,7 +20463,7 @@ NMD::Pool NMD::CMP_condn_D[32] = {
 };
 
 
-NMD::Pool NMD::POOL32F_5[8] = {
+static struct Pool POOL32F_5[8] = {
     { pool                , CMP_condn_S         , 32  , 32,
        0xfc00003f, 0xa0000005, 0                      , 0,
        CP1_                },        /* CMP.condn.S */
@@ -20498,7 +20491,7 @@ NMD::Pool NMD::POOL32F_5[8] = {
 };
 
 
-NMD::Pool NMD::POOL32F[8] = {
+static struct Pool POOL32F[8] = {
     { pool                , POOL32F_0           , 64  , 32,
        0xfc000007, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0 */
@@ -20526,7 +20519,7 @@ NMD::Pool NMD::POOL32F[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_0[64] = {
+static struct Pool POOL32S_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(0) */
@@ -20722,7 +20715,7 @@ NMD::Pool NMD::POOL32S_0[64] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf_4[128] = {
+static struct Pool POOL32Sxf_4[128] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc000013c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(0) */
@@ -21110,7 +21103,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf[8] = {
+static struct Pool POOL32Sxf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc000003c, 0                      , 0,
        0x0                 },        /* POOL32Sxf~*(0) */
@@ -21138,7 +21131,7 @@ NMD::Pool NMD::POOL32Sxf[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_4[8] = {
+static struct Pool POOL32S_4[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00003f, 0xc0000004, &EXTD             , 0,
        MIPS64_             },        /* EXTD */
@@ -21166,7 +21159,7 @@ NMD::Pool NMD::POOL32S_4[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S[8] = {
+static struct Pool POOL32S[8] = {
     { pool                , POOL32S_0           , 64  , 32,
        0xfc000007, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0 */
@@ -21194,7 +21187,7 @@ NMD::Pool NMD::POOL32S[8] = {
 };
 
 
-NMD::Pool NMD::P_LUI[2] = {
+static struct Pool P_LUI[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000002, 0xe0000000, &LUI              , 0,
        0x0                 },        /* LUI */
@@ -21204,7 +21197,7 @@ NMD::Pool NMD::P_LUI[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_LH[2] = {
+static struct Pool P_GP_LH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0001, 0x44100000, &LH_GP_           , 0,
        0x0                 },        /* LH[GP] */
@@ -21214,7 +21207,7 @@ NMD::Pool NMD::P_GP_LH[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_SH[2] = {
+static struct Pool P_GP_SH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0001, 0x44140000, &SH_GP_           , 0,
        0x0                 },        /* SH[GP] */
@@ -21224,7 +21217,7 @@ NMD::Pool NMD::P_GP_SH[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_CP1[4] = {
+static struct Pool P_GP_CP1[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0003, 0x44180000, &LWC1_GP_         , 0,
        CP1_                },        /* LWC1[GP] */
@@ -21240,7 +21233,7 @@ NMD::Pool NMD::P_GP_CP1[4] = {
 };
 
 
-NMD::Pool NMD::P_GP_M64[4] = {
+static struct Pool P_GP_M64[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0003, 0x441c0000, &LWU_GP_          , 0,
        MIPS64_             },        /* LWU[GP] */
@@ -21256,7 +21249,7 @@ NMD::Pool NMD::P_GP_M64[4] = {
 };
 
 
-NMD::Pool NMD::P_GP_BH[8] = {
+static struct Pool P_GP_BH[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0000, 0x44000000, &LB_GP_           , 0,
        0x0                 },        /* LB[GP] */
@@ -21284,7 +21277,7 @@ NMD::Pool NMD::P_GP_BH[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_U12[16] = {
+static struct Pool P_LS_U12[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f000, 0x84000000, &LB_U12_          , 0,
        0x0                 },        /* LB[U12] */
@@ -21336,7 +21329,7 @@ NMD::Pool NMD::P_LS_U12[16] = {
 };
 
 
-NMD::Pool NMD::P_PREF_S9_[2] = {
+static struct Pool P_PREF_S9_[2] = {
     { instruction         , 0                   , 0   , 32,
        0xffe07f00, 0xa7e01800, &SYNCI            , 0,
        0x0                 },        /* SYNCI */
@@ -21346,7 +21339,7 @@ NMD::Pool NMD::P_PREF_S9_[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_S0[16] = {
+static struct Pool P_LS_S0[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f00, 0xa4000000, &LB_S9_           , 0,
        0x0                 },        /* LB[S9] */
@@ -21398,7 +21391,7 @@ NMD::Pool NMD::P_LS_S0[16] = {
 };
 
 
-NMD::Pool NMD::ASET_ACLR[2] = {
+static struct Pool ASET_ACLR[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfe007f00, 0xa4001100, &ASET             , 0,
        MCU_                },        /* ASET */
@@ -21408,7 +21401,7 @@ NMD::Pool NMD::ASET_ACLR[2] = {
 };
 
 
-NMD::Pool NMD::P_LL[4] = {
+static struct Pool P_LL[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005100, &LL               , 0,
        0x0                 },        /* LL */
@@ -21424,7 +21417,7 @@ NMD::Pool NMD::P_LL[4] = {
 };
 
 
-NMD::Pool NMD::P_SC[4] = {
+static struct Pool P_SC[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005900, &SC               , 0,
        0x0                 },        /* SC */
@@ -21440,7 +21433,7 @@ NMD::Pool NMD::P_SC[4] = {
 };
 
 
-NMD::Pool NMD::P_LLD[8] = {
+static struct Pool P_LLD[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f07, 0xa4007100, &LLD              , 0,
        MIPS64_             },        /* LLD */
@@ -21468,7 +21461,7 @@ NMD::Pool NMD::P_LLD[8] = {
 };
 
 
-NMD::Pool NMD::P_SCD[8] = {
+static struct Pool P_SCD[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f07, 0xa4007900, &SCD              , 0,
        MIPS64_             },        /* SCD */
@@ -21496,7 +21489,7 @@ NMD::Pool NMD::P_SCD[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_S1[16] = {
+static struct Pool P_LS_S1[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f00, 0xa4000100, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(0) */
@@ -21548,7 +21541,7 @@ NMD::Pool NMD::P_LS_S1[16] = {
 };
 
 
-NMD::Pool NMD::P_PREFE[2] = {
+static struct Pool P_PREFE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xffe07f00, 0xa7e01a00, &SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
@@ -21558,7 +21551,7 @@ NMD::Pool NMD::P_PREFE[2] = {
 };
 
 
-NMD::Pool NMD::P_LLE[4] = {
+static struct Pool P_LLE[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005200, &LLE              , 0,
        CP0_ | EVA_         },        /* LLE */
@@ -21574,7 +21567,7 @@ NMD::Pool NMD::P_LLE[4] = {
 };
 
 
-NMD::Pool NMD::P_SCE[4] = {
+static struct Pool P_SCE[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005a00, &SCE              , 0,
        CP0_ | EVA_         },        /* SCE */
@@ -21590,7 +21583,7 @@ NMD::Pool NMD::P_SCE[4] = {
 };
 
 
-NMD::Pool NMD::P_LS_E0[16] = {
+static struct Pool P_LS_E0[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f00, 0xa4000200, &LBE              , 0,
        CP0_ | EVA_         },        /* LBE */
@@ -21642,7 +21635,7 @@ NMD::Pool NMD::P_LS_E0[16] = {
 };
 
 
-NMD::Pool NMD::P_LS_WM[2] = {
+static struct Pool P_LS_WM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000400, &LWM              , 0,
        XMMS_               },        /* LWM */
@@ -21652,7 +21645,7 @@ NMD::Pool NMD::P_LS_WM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_UAWM[2] = {
+static struct Pool P_LS_UAWM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000500, &UALWM            , 0,
        XMMS_               },        /* UALWM */
@@ -21662,7 +21655,7 @@ NMD::Pool NMD::P_LS_UAWM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_DM[2] = {
+static struct Pool P_LS_DM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000600, &LDM              , 0,
        MIPS64_             },        /* LDM */
@@ -21672,7 +21665,7 @@ NMD::Pool NMD::P_LS_DM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_UADM[2] = {
+static struct Pool P_LS_UADM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000700, &UALDM            , 0,
        MIPS64_             },        /* UALDM */
@@ -21682,7 +21675,7 @@ NMD::Pool NMD::P_LS_UADM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_S9[8] = {
+static struct Pool P_LS_S9[8] = {
     { pool                , P_LS_S0             , 16  , 32,
        0xfc000700, 0xa4000000, 0                      , 0,
        0x0                 },        /* P.LS.S0 */
@@ -21710,7 +21703,7 @@ NMD::Pool NMD::P_LS_S9[8] = {
 };
 
 
-NMD::Pool NMD::P_BAL[2] = {
+static struct Pool P_BAL[2] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfe000000, 0x28000000, &BC_32_           , 0,
        0x0                 },        /* BC[32] */
@@ -21720,7 +21713,7 @@ NMD::Pool NMD::P_BAL[2] = {
 };
 
 
-NMD::Pool NMD::P_BALRSC[2] = {
+static struct Pool P_BALRSC[2] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xffe0f000, 0x48008000, &BRSC             , 0,
        0x0                 },        /* BRSC */
@@ -21730,7 +21723,7 @@ NMD::Pool NMD::P_BALRSC[2] = {
 };
 
 
-NMD::Pool NMD::P_J[16] = {
+static struct Pool P_J[16] = {
     { call_instruction    , 0                   , 0   , 32,
        0xfc00f000, 0x48000000, &JALRC_32_        , 0,
        0x0                 },        /* JALRC[32] */
@@ -21782,7 +21775,7 @@ NMD::Pool NMD::P_J[16] = {
 };
 
 
-NMD::Pool NMD::P_BR3A[32] = {
+static struct Pool P_BR3A[32] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc1fc000, 0x88004000, &BC1EQZC          , 0,
        CP1_                },        /* BC1EQZC */
@@ -21882,7 +21875,7 @@ NMD::Pool NMD::P_BR3A[32] = {
 };
 
 
-NMD::Pool NMD::P_BR1[4] = {
+static struct Pool P_BR1[4] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc00c000, 0x88000000, &BEQC_32_         , 0,
        0x0                 },        /* BEQC[32] */
@@ -21898,7 +21891,7 @@ NMD::Pool NMD::P_BR1[4] = {
 };
 
 
-NMD::Pool NMD::P_BR2[4] = {
+static struct Pool P_BR2[4] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc00c000, 0xa8000000, &BNEC_32_         , 0,
        0x0                 },        /* BNEC[32] */
@@ -21914,7 +21907,7 @@ NMD::Pool NMD::P_BR2[4] = {
 };
 
 
-NMD::Pool NMD::P_BRI[8] = {
+static struct Pool P_BRI[8] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc1c0000, 0xc8000000, &BEQIC            , 0,
        0x0                 },        /* BEQIC */
@@ -21942,7 +21935,7 @@ NMD::Pool NMD::P_BRI[8] = {
 };
 
 
-NMD::Pool NMD::P32[32] = {
+static struct Pool P32[32] = {
     { pool                , P_ADDIU             , 2   , 32,
        0xfc000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.ADDIU */
@@ -22042,7 +22035,7 @@ NMD::Pool NMD::P32[32] = {
 };
 
 
-NMD::Pool NMD::P16_SYSCALL[2] = {
+static struct Pool P16_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfffc    , 0x1008    , &SYSCALL_16_      , 0,
        0x0                 },        /* SYSCALL[16] */
@@ -22052,7 +22045,7 @@ NMD::Pool NMD::P16_SYSCALL[2] = {
 };
 
 
-NMD::Pool NMD::P16_RI[4] = {
+static struct Pool P16_RI[4] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfff8    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI~*(0) */
@@ -22068,7 +22061,7 @@ NMD::Pool NMD::P16_RI[4] = {
 };
 
 
-NMD::Pool NMD::P16_MV[2] = {
+static struct Pool P16_MV[2] = {
     { pool                , P16_RI              , 4   , 16,
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
@@ -22078,7 +22071,7 @@ NMD::Pool NMD::P16_MV[2] = {
 };
 
 
-NMD::Pool NMD::P16_SHIFT[2] = {
+static struct Pool P16_SHIFT[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc08    , 0x3000    , &SLL_16_          , 0,
        0x0                 },        /* SLL[16] */
@@ -22088,7 +22081,7 @@ NMD::Pool NMD::P16_SHIFT[2] = {
 };
 
 
-NMD::Pool NMD::POOL16C_00[4] = {
+static struct Pool POOL16C_00[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc0f    , 0x5000    , &NOT_16_          , 0,
        0x0                 },        /* NOT[16] */
@@ -22104,7 +22097,7 @@ NMD::Pool NMD::POOL16C_00[4] = {
 };
 
 
-NMD::Pool NMD::POOL16C_0[2] = {
+static struct Pool POOL16C_0[2] = {
     { pool                , POOL16C_00          , 4   , 16,
        0xfc03    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_00 */
@@ -22114,7 +22107,7 @@ NMD::Pool NMD::POOL16C_0[2] = {
 };
 
 
-NMD::Pool NMD::P16C[2] = {
+static struct Pool P16C[2] = {
     { pool                , POOL16C_0           , 2   , 16,
        0xfc01    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_0 */
@@ -22124,7 +22117,7 @@ NMD::Pool NMD::P16C[2] = {
 };
 
 
-NMD::Pool NMD::P16_A1[2] = {
+static struct Pool P16_A1[2] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfc40    , 0x7000    , 0                      , 0,
        0x0                 },        /* P16.A1~*(0) */
@@ -22134,7 +22127,7 @@ NMD::Pool NMD::P16_A1[2] = {
 };
 
 
-NMD::Pool NMD::P_ADDIU_RS5_[2] = {
+static struct Pool P_ADDIU_RS5_[2] = {
     { instruction         , 0                   , 0   , 16,
        0xffe8    , 0x9008    , &NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
@@ -22144,7 +22137,7 @@ NMD::Pool NMD::P_ADDIU_RS5_[2] = {
 };
 
 
-NMD::Pool NMD::P16_A2[2] = {
+static struct Pool P16_A2[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc08    , 0x9000    , &ADDIU_R2_        , 0,
        0x0                 },        /* ADDIU[R2] */
@@ -22154,7 +22147,7 @@ NMD::Pool NMD::P16_A2[2] = {
 };
 
 
-NMD::Pool NMD::P16_ADDU[2] = {
+static struct Pool P16_ADDU[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc01    , 0xb000    , &ADDU_16_         , 0,
        0x0                 },        /* ADDU[16] */
@@ -22164,7 +22157,7 @@ NMD::Pool NMD::P16_ADDU[2] = {
 };
 
 
-NMD::Pool NMD::P16_JRC[2] = {
+static struct Pool P16_JRC[2] = {
     { branch_instruction  , 0                   , 0   , 16,
        0xfc1f    , 0xd800    , &JRC              , 0,
        0x0                 },        /* JRC */
@@ -22174,7 +22167,7 @@ NMD::Pool NMD::P16_JRC[2] = {
 };
 
 
-NMD::Pool NMD::P16_BR1[2] = {
+static struct Pool P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
        0xfc00    , 0xd800    , &BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
@@ -22184,7 +22177,7 @@ NMD::Pool NMD::P16_BR1[2] = {
 };
 
 
-NMD::Pool NMD::P16_BR[2] = {
+static struct Pool P16_BR[2] = {
     { pool                , P16_JRC             , 2   , 16,
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
@@ -22194,7 +22187,7 @@ NMD::Pool NMD::P16_BR[2] = {
 };
 
 
-NMD::Pool NMD::P16_SR[2] = {
+static struct Pool P16_SR[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfd00    , 0x1c00    , &SAVE_16_         , 0,
        0x0                 },        /* SAVE[16] */
@@ -22204,7 +22197,7 @@ NMD::Pool NMD::P16_SR[2] = {
 };
 
 
-NMD::Pool NMD::P16_4X4[4] = {
+static struct Pool P16_4X4[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfd08    , 0x3c00    , &ADDU_4X4_        , 0,
        XMMS_               },        /* ADDU[4X4] */
@@ -22220,7 +22213,7 @@ NMD::Pool NMD::P16_4X4[4] = {
 };
 
 
-NMD::Pool NMD::P16_LB[4] = {
+static struct Pool P16_LB[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc0c    , 0x5c00    , &LB_16_           , 0,
        0x0                 },        /* LB[16] */
@@ -22236,7 +22229,7 @@ NMD::Pool NMD::P16_LB[4] = {
 };
 
 
-NMD::Pool NMD::P16_LH[4] = {
+static struct Pool P16_LH[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc09    , 0x7c00    , &LH_16_           , 0,
        0x0                 },        /* LH[16] */
@@ -22252,7 +22245,7 @@ NMD::Pool NMD::P16_LH[4] = {
 };
 
 
-NMD::Pool NMD::P16[32] = {
+static struct Pool P16[32] = {
     { pool                , P16_MV              , 2   , 16,
        0xfc00    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.MV */
@@ -22352,7 +22345,7 @@ NMD::Pool NMD::P16[32] = {
 };
 
 
-NMD::Pool NMD::MAJOR[2] = {
+static struct Pool MAJOR[2] = {
     { pool                , P32                 , 32  , 32,
        0x10000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P32 */
@@ -22360,3 +22353,9 @@ NMD::Pool NMD::MAJOR[2] = {
        0x1000    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16 */
 };
+
+int NMD::Disassemble(const uint16 * data, std::string & dis,
+                     TABLE_ENTRY_TYPE & type, img_address m_pc)
+{
+    return Disassemble(data, dis, type, MAJOR, 2, m_pc);
+}
diff --git a/disas/nanomips.h b/disas/nanomips.h
index dead0bcb94..4cdceb2279 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -64,6 +64,18 @@ enum TABLE_ATTRIBUTE_TYPE {
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
@@ -74,199 +86,11 @@ public:
 
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
                     TABLE_ENTRY_TYPE & type, const Pool *table,
                     int table_size, img_address m_pc);
 
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


