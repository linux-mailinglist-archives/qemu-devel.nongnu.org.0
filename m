Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8CE5AD035
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:36:02 +0200 (CEST)
Received: from localhost ([::1]:55046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9ST-0002TR-93
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8v6-0005Rr-J1
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:01:32 -0400
Received: from mail-am7eur03on2130.outbound.protection.outlook.com
 ([40.107.105.130]:25761 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8uw-0002N7-EM
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:01:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJklQgeDSkPyI/KemVvANGbjpkyA050QzqQCZG7DK1lE34/BAXfEGZK06R6QFSSY1ZUToNsrizCJY3mQkP1pvInOqsnt4iRDpt8rNNhUo0q8pGI7X+5w+wpKB/pG7dlwPQ8vuK22AblkX3uHt6l7hsjYRsjbkOBeaYjFVWZijGQZjbTrUnKg6Jp65vyO3xnvEl7Q+A6GQXTYPLl8IuXxpT59cD5Pt3Rt8P/7qrvXsNosJOCFHMyKXt9gR8eQcdjzax5vagBooN3MVAV+J0H/Sxwh65SEUInSzB9XjP5qHjYjy4SGYnWUi15YYWvF37y80zioJxCLPtDKIKEmaW687g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgYpET10iNoWGij+90Sfm557IOgMfaO5H+P9uREGkyc=;
 b=cSM25VauYdeB0Uo2jENquyclOmXwlT3Jn4JNWc8XZG8ocE020pD7QGECptxW3ckSdXNdfvJ5DszRkIy07/olNwFIEsX6wsbh39f2Slpby46/xOPGGgkm1mh+87qbfl8eINHngekpbVqIFf0sx5Bg5EMwGf4KKKV9Xmik7av7WLfsCBZ07xCMfNAhlnrhqdmDn2Xo5w28jXyjQ2lclbZ96KvyXAfmD13pd8Pc59YC73fyOxf1mMM3VFpBXlAOe8YB0ug/q3G8Q4CAtwYzXiTYB+01Yp3MUrYQ/8LQVlDb7ZkhH1bcfLTqt2i+oSAgsMOgkSjWKVQH37GwrgBImthxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgYpET10iNoWGij+90Sfm557IOgMfaO5H+P9uREGkyc=;
 b=KFJ/Xe52z9V/s4DIJ6jHxAQKo3t5RfLV/m2FjceeiM6rkwyi3xMYmBebYDdM+iD0sR/TqXZ4rQOU5hvB/xvjkcz94ginkN3uSR8wqfDN8NmfNjrxmGxLJAQOMWOnb2KetdvOnmBR5S65pMzpbl8ixjNWoBN8lOKwhPTsKIUF62w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 10:00:11 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:00:11 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 12/20] disas/nanomips: Replace std::string type
Date: Mon,  5 Sep 2022 11:55:14 +0200
Message-Id: <20220905095522.66941-13-milica.lazarevic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: dce44b71-af76-4633-e0c8-08da8f256b6f
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kb+tnvzg5AlDaTCYdS04b8s/kRLuehtrI2OuMrlG2xYpo9f4ljqxMZc2qEfCKKIsQwj5BuKrNWT5U4sYqogcplDufxYsmEMf7+Ii/i7PKBTH6kpfiJ8Xar5ySYO+TJkxwx7+Ib0hAdWOQN0rh/G5jrfSIiaMIRQiBTkdsRYBvmNmHmJK/uyV7JZT5ANfqKm7lTyuFuxkrIi7R6FuLEgcev3gOLb2GQ77+t2I/ImofSf+6Nm5KQjBAijNcpC9CKpC5ySVTuc8I7RNPker+GcnXDtDHzYGCdAiTsbilJ1abTdsT77VbMnDsaa6WvfZCDZrMrIP203No7AhVpDiOi20Zzc98S6JsiqUt/EOVV7TtMjLhjfTm5T1tO941CJStAS/+xvvksZeC3AZF+wHhPHwq9xj9Jj1DYZEHINcAlYor74vXLIJih9axmVziOSmgLAW/1f4zALBw7pwzID52ttzzG5HGe5x2uNXxEFecBkXzj/RN/Uy8a5L1e9p1RBfMNhb1jQzZHqPQjr34mbbV0bQEiR3+HYXOMIlyjoh8pglb8jF4wiokyKfKJ5zXSVgOgKsY876gexu14yRDG7euBp8O7wkE5LO19rS2O6CwgzCpcZIr1zF8nvS8rPX5ddMI6wzM52X98+K/YfiExowZ4nQ+OKCNS6L20CuwLtg6EuzyQQ6uRr5H+AKIhCvWBEiaG/njnM7DGs6YGkyNHtjObre8wDnW9MlRcHLo1id055PYlpqgYKBDWk2I5l4RIsKzEmDY5jYsZQb8lKZmO1L4Mr9/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(8936002)(44832011)(5660300002)(30864003)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(107886003)(316002)(83380400001)(6916009)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PCrbADOSLdH3/CGtC5/hVWjQP7gdJq7KY47VVRApRvlou/UMzFc9jV31Ag82?=
 =?us-ascii?Q?uWkkJlbK6rJj5HX8QTte/bO8xjjjZn7VTTzJmDPYWWZibL93b4K69rz2bSsA?=
 =?us-ascii?Q?vTrfeXClHkBsoRnvPqOJE33YqJyMNRBY3fT1KYAdW6SURtEa7Oqe9/oobJ2A?=
 =?us-ascii?Q?2Z4z7yoZizT+WSP7IvGMXayw1MZ2GQJVjdubtHD8wPLqJizGNnPglDJIaZRL?=
 =?us-ascii?Q?sQ91fUqGk3iC8ggFLo36XiPenw2SWQfDsKySsQyebZLvfWfvSyc8kRGMZhnd?=
 =?us-ascii?Q?YYH+gy98Kp5iM9UNgtiH28DIiv+HaCz54X4kD1O4OyBzbMZOoVkuHD6dvuK+?=
 =?us-ascii?Q?jewluSPFRxIe26hoFM6SdNPOwoKWx/UNtPCpi6Jl6jVpx3UDMUPPrtf7q3ts?=
 =?us-ascii?Q?9ZcvLwKuka+0O8oMXN6avsU5k1ngllXwwyEDmVKiBzbw/Ms5ivkSIv4sViX/?=
 =?us-ascii?Q?CCOHsZfMtzxKirv8zgKM6Kc9F64I/7dEfLqhmloI5mMhhpdiAj+GRmOcmFa+?=
 =?us-ascii?Q?QrHOn8JCAzI1C4aRQ6WG5ut/hK2fJAsERw/I0vX7HvF0MWZsaX21o8J4y0Db?=
 =?us-ascii?Q?rq0cxeamwD+erPR+gYGXPS10SWyQlJyXD+1UWgrYYJ/YiQQXAJTEZRLC0IlO?=
 =?us-ascii?Q?RNrRaQQidl2AGMiKYeEwc2ZGdZ6KJJaXBytt2+7QLSxs9m2az19fdotn+Jm5?=
 =?us-ascii?Q?aM8VixlxI2U8/WfiffFVacPqnqv+VjXOYnjmJ7MlqAPVH4nvN41sh1dvkeaj?=
 =?us-ascii?Q?5N6N1/TjFP/0t5YG72uffs5iz/m8j1Xv9aHF+b+k8gpR/jCBGYg3JxfRn+ia?=
 =?us-ascii?Q?KkfVyQ8dlCSPT9eDQVoYYQn13ttf5aXB+iG0esbdgBybRK8Bcd4Ici5Yi3VO?=
 =?us-ascii?Q?Tg1F0LK8lY75U13SuAE297ehsebypDMHdg5NO9kZKXJoSwjIDaCy92MfnGf2?=
 =?us-ascii?Q?Qfvzwm9Yh8M0tA7aB7AF9eFIu4xXKfRo0GRRmwSWr2DVVuapey2hs9ncR1Tx?=
 =?us-ascii?Q?+rg1cJfYcQw1x+m86F5QNxWgClhMILUdhvFTv/jfl+jqCO39SuiKveaT0g6Q?=
 =?us-ascii?Q?U54wdb9hSDlGSLLMaH+96GcwxybmkLY7G4pIfIXDr3YQnblxUtY8moc+ub8N?=
 =?us-ascii?Q?PvSvZcOGy9r0hYc+h/QC561+DugtLdgjdK2ZzdIN006SHrZnVea1AFDwai3o?=
 =?us-ascii?Q?nmv7ak4iENV+bSPl0PYS1TvbeQruWk2aeJ/fP3pGJ3wTq+1+DsF7k+REJAou?=
 =?us-ascii?Q?lEKr2SiXRJVyPRmXV4FOhCQtz862ABULQdTt7WD2XFxi9snl/Mg4DcmG11JI?=
 =?us-ascii?Q?1we5iwr9765pUjW2HW9zCi2pLAAvgyid5HFRe+R4NXnejjYS8cChkYhG+Bf8?=
 =?us-ascii?Q?RZs+/64qXoO+hzqPIiApv1Q2BAldXka4ibAmJJdjUsVroB6sXv7ggQ4xvALM?=
 =?us-ascii?Q?xMFELfkYz+Lg0qfrKPZbabkCDLAdH74LrnP48FVucpkziXDhqi4DEg7LtZOM?=
 =?us-ascii?Q?/DzOQfLBuRjUEMreHpclMMnuowTAU/u4okoDX1KJ3+Ed+1tlNzyCiMTSxpF0?=
 =?us-ascii?Q?IqKwZcdEhWsh8EMkh/HI8VFIbM5VpYzU8oi0g0eQ0e28FHz8yaUnbB/zqR0s?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dce44b71-af76-4633-e0c8-08da8f256b6f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:00:11.3683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QU+z2rcAQebeIwNPiE7fpxhpiVrruBUBt9IAP4fNAwWlNldCcCVQ2N06Av+AKf+wAwAcVJprAWEqw4RtNYM2BdBgP7gW1XRG4Oj8PMPql9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.130;
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

The return type of typedef disassembly_function is changed to char *
instead of std::string. Therefore, for every particular
disassembly_function function signature is changed.
For example:
- static std::string ABS_D(uint64 instruction, img_address m_pc) {...}
is replaced with
- static char *ABS_D(uint64 instruction, img_address m_pc) {...}

Every helper function used to return std::string is changed to return
const char * or char *. Where the return value points to a static string
that the caller must not free, the return type is const char *. If a
function allocates memory and the caller is required to free it, the
return type is a char *. This applies to the following functions:
img_format, to_string, GPR, save_restore_list, FPR, etc.

Now that we replaced every std::string for const char * or char *, it is
possible to delete multiple versions of the img_format function. The
general version:
- static char *img_format(const char *format, ...) {...}
can handle all string formatting, so others have been deleted.

Where necessary, strings are dynamically allocated with g_malloc,
g_strdup_vprintf, and g_strdup_printf. Memory leaking will be prevented
later.

Simple assignments like:
- x = "string"
are handled using the strcpy() function where needed.

String concatenation in the save_restore_list() function is handled
using strcat() function instead of += operator.

Without applying all of these changes, the nanomips disassembler may be
buildable but can't produce the appropriate output, so all of them are
made together.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 disas/nanomips.cpp | 4772 ++++++++++++++++++++++----------------------
 1 file changed, 2337 insertions(+), 2435 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index bfbd472150..cfea95130d 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -30,13 +30,11 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 
-#include <cstring>
+#include <string.h>
 #include <stdexcept>
 #include <stdio.h>
 #include <stdarg.h>
 
-#include <string>
-
 typedef int64_t int64;
 typedef uint64_t uint64;
 typedef uint32_t uint32;
@@ -44,8 +42,8 @@ typedef uint16_t uint16;
 typedef uint64_t img_address;
 
 typedef bool (*conditional_function)(uint64 instruction);
-typedef std::string (*disassembly_function)(uint64 instruction,
-                                            img_address m_pc);
+typedef char * (*disassembly_function)(uint64 instruction,
+                                       img_address m_pc);
 
 enum TABLE_ENTRY_TYPE {
     instruction,
@@ -91,122 +89,20 @@ struct Pool {
 #define IMGASSERTONCE(test)
 
 
-std::string img_format(const char *format, ...)
+static char *img_format(const char *format, ...)
 {
-    char buffer[256];
+    char *buffer;
     va_list args;
     va_start(args, format);
-    int err = vsprintf(buffer, format, args);
-    if (err < 0) {
-        perror(buffer);
-    }
+    buffer = g_strdup_vprintf(format, args);
     va_end(args);
     return buffer;
 }
 
-std::string img_format(const char *format,
-                   std::string s)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3,
-                   std::string s4)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                            s4.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   std::string s3,
-                   std::string s4,
-                   std::string s5)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), s3.c_str(),
-                            s4.c_str(), s5.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   uint64 d,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, d, s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   uint64 d,
-                   std::string s2)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), d, s2.c_str());
-
-    return buffer;
-}
-
-std::string img_format(const char *format,
-                   std::string s1,
-                   std::string s2,
-                   uint64 d)
-{
-    char buffer[256];
-
-    sprintf(buffer, format, s1.c_str(), s2.c_str(), d);
-
-    return buffer;
-}
-
 
-std::string to_string(img_address a)
+static char *to_string(img_address a)
 {
-    char buffer[256];
-    sprintf(buffer, "0x%" PRIx64, a);
-    return buffer;
+    return g_strdup_printf("0x%" PRIx64, a);
 }
 
 
@@ -597,7 +493,7 @@ static uint64 encode_lsb_from_pos_and_size(uint64 d)
 }
 
 
-static std::string GPR(uint64 reg)
+static const char *GPR(uint64 reg)
 {
     static const char *gpr_reg[32] = {
         "zero", "at",   "v0",   "v1",   "a0",   "a1",   "a2",   "a3",
@@ -615,21 +511,26 @@ static std::string GPR(uint64 reg)
 }
 
 
-static std::string save_restore_list(uint64 rt, uint64 count, uint64 gp)
+static char *save_restore_list(uint64 rt, uint64 count, uint64 gp)
 {
-    std::string str;
+    /*
+     * Currently, this file compiles as a cpp file, so the explicit cast here
+     * is necessary. Later, the cast will be removed.
+     */
+    char *str = (char *)g_malloc(200);
+    str[0] = '\0';
 
     for (uint64 counter = 0; counter != count; counter++) {
         bool use_gp = gp && (counter == count - 1);
         uint64 this_rt = use_gp ? 28 : ((rt & 0x10) | (rt + counter)) & 0x1f;
-        str += img_format(",%s", GPR(this_rt));
+        strcat(str, img_format(",%s", GPR(this_rt)));
     }
 
     return str;
 }
 
 
-static std::string FPR(uint64 reg)
+static const char *FPR(uint64 reg)
 {
     static const char *fpr_reg[32] = {
         "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
@@ -647,7 +548,7 @@ static std::string FPR(uint64 reg)
 }
 
 
-static std::string AC(uint64 reg)
+static const char *AC(uint64 reg)
 {
     static const char *ac_reg[4] = {
         "ac0",  "ac1",  "ac2",  "ac3"
@@ -662,26 +563,26 @@ static std::string AC(uint64 reg)
 }
 
 
-static std::string IMMEDIATE(uint64 value)
+static char *IMMEDIATE(uint64 value)
 {
     return img_format("0x%" PRIx64, value);
 }
 
 
-static std::string IMMEDIATE(int64 value)
+static char *IMMEDIATE(int64 value)
 {
     return img_format("%" PRId64, value);
 }
 
 
-static std::string CPR(uint64 reg)
+static char *CPR(uint64 reg)
 {
     /* needs more work */
     return img_format("CP%" PRIu64, reg);
 }
 
 
-static std::string ADDRESS(uint64 value, int instruction_size, img_address m_pc)
+static char *ADDRESS(uint64 value, int instruction_size, img_address m_pc)
 {
     /* token for string replace */
     img_address address = m_pc + value + instruction_size;
@@ -716,7 +617,7 @@ static uint64 extract_op_code_value(const uint16 *data, int size)
  *      instruction size    - negative is error
  *      disassembly string  - on error will constain error string
  */
-static int Disassemble(const uint16 *data, std::string & dis,
+static int Disassemble(const uint16 *data, char *dis,
                        TABLE_ENTRY_TYPE & type, const Pool *table,
                        int table_size, img_address m_pc)
 {
@@ -746,25 +647,26 @@ static int Disassemble(const uint16 *data, std::string & dis,
                                  * an ASE attribute and the requested version
                                  * not having that attribute
                                  */
-                                dis = "ASE attribute mismatch";
+                                strcpy(dis, "ASE attribute mismatch");
                                 return -5;
                             }
                             disassembly_function dis_fn = table[i].disassembly;
                             if (dis_fn == 0) {
-                                dis = "disassembler failure - bad table entry";
+                                strcpy(dis,
+                                "disassembler failure - bad table entry");
                                 return -6;
                             }
                             type = table[i].type;
-                            dis = dis_fn(op_code, m_pc);
+                            strcpy(dis, dis_fn(op_code, m_pc));
                             return table[i].instructions_size;
                         } else {
-                            dis = "reserved instruction";
+                            strcpy(dis, "reserved instruction");
                             return -2;
                         }
                     }
                     catch (std::runtime_error & e)
                     {
-                        dis = e.what();
+                        strcpy(dis, e.what());
                         return -3;          /* runtime error */
                     }
                 }
@@ -773,11 +675,11 @@ static int Disassemble(const uint16 *data, std::string & dis,
     }
     catch (std::exception & e)
     {
-        dis = e.what();
+        strcpy(dis, e.what());
         return -4;          /* runtime error */
     }
 
-    dis = "failed to disassemble";
+    strcpy(dis, "failed to disassemble");
     return -1;      /* failed to disassemble        */
 }
 
@@ -1710,13 +1612,13 @@ static bool SLTU_cond(uint64 instruction)
  *               fs -----
  *                    fd -----
  */
-static std::string ABS_D(uint64 instruction, img_address m_pc)
+static char *ABS_D(uint64 instruction, img_address m_pc)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ABS.D %s, %s", fd, fs);
 }
@@ -1732,13 +1634,13 @@ static std::string ABS_D(uint64 instruction, img_address m_pc)
  *               fd -----
  *                    fs -----
  */
-static std::string ABS_S(uint64 instruction, img_address m_pc)
+static char *ABS_S(uint64 instruction, img_address m_pc)
 {
     uint64 fd_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ABS.S %s, %s", fd, fs);
 }
@@ -1754,13 +1656,13 @@ static std::string ABS_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_PH(uint64 instruction, img_address m_pc)
+static char *ABSQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ABSQ_S.PH %s, %s", rt, rs);
 }
@@ -1776,13 +1678,13 @@ static std::string ABSQ_S_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_QB(uint64 instruction, img_address m_pc)
+static char *ABSQ_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ABSQ_S.QB %s, %s", rt, rs);
 }
@@ -1798,13 +1700,13 @@ static std::string ABSQ_S_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ABSQ_S_W(uint64 instruction, img_address m_pc)
+static char *ABSQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ABSQ_S.W %s, %s", rt, rs);
 }
@@ -1819,15 +1721,15 @@ static std::string ABSQ_S_W(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ACLR(uint64 instruction, img_address m_pc)
+static char *ACLR(uint64 instruction, img_address m_pc)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *bit = IMMEDIATE(copy(bit_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ACLR %s, %s(%s)", bit, s, rs);
 }
@@ -1842,15 +1744,15 @@ static std::string ACLR(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADD(uint64 instruction, img_address m_pc)
+static char *ADD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADD %s, %s, %s", rd, rs, rt);
 }
@@ -1867,15 +1769,15 @@ static std::string ADD(uint64 instruction, img_address m_pc)
  *               fs -----
  *                    fd -----
  */
-static std::string ADD_D(uint64 instruction, img_address m_pc)
+static char *ADD_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ADD.D %s, %s, %s", fd, fs, ft);
 }
@@ -1892,15 +1794,15 @@ static std::string ADD_D(uint64 instruction, img_address m_pc)
  *               fs -----
  *                    fd -----
  */
-static std::string ADD_S(uint64 instruction, img_address m_pc)
+static char *ADD_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string fd = FPR(copy(fd_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *fd = FPR(copy(fd_value));
 
     return img_format("ADD.S %s, %s, %s", fd, fs, ft);
 }
@@ -1915,15 +1817,15 @@ static std::string ADD_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_32_(uint64 instruction, img_address m_pc)
+static char *ADDIU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_15_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -1938,13 +1840,13 @@ static std::string ADDIU_32_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_48_(uint64 instruction, img_address m_pc)
+static char *ADDIU_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -1959,13 +1861,13 @@ static std::string ADDIU_48_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP48_(uint64 instruction, img_address m_pc)
+static char *ADDIU_GP48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, s);
 }
@@ -1980,13 +1882,13 @@ static std::string ADDIU_GP48_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP_B_(uint64 instruction, img_address m_pc)
+static char *ADDIU_GP_B_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -2001,13 +1903,13 @@ static std::string ADDIU_GP_B_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_GP_W_(uint64 instruction, img_address m_pc)
+static char *ADDIU_GP_W_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt, 28, u);
 }
@@ -2022,15 +1924,15 @@ static std::string ADDIU_GP_W_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_NEG_(uint64 instruction, img_address m_pc)
+static char *ADDIU_NEG_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt, rs, u);
 }
@@ -2045,13 +1947,13 @@ static std::string ADDIU_NEG_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
+static char *ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 u_value = extract_u_5_4_3_2_1_0__s2(instruction);
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, $%d, %s", rt3, 29, u);
 }
@@ -2066,15 +1968,15 @@ static std::string ADDIU_R1_SP_(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string ADDIU_R2_(uint64 instruction, img_address m_pc)
+static char *ADDIU_R2_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ADDIU %s, %s, %s", rt3, rs3, u);
 }
@@ -2088,13 +1990,13 @@ static std::string ADDIU_R2_(uint64 instruction, img_address m_pc)
  *     rt -----
  *           s - ---
  */
-static std::string ADDIU_RS5_(uint64 instruction, img_address m_pc)
+static char *ADDIU_RS5_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     int64 s_value = extract_s__se3_4_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
 
     return img_format("ADDIU %s, %s", rt, s);
 }
@@ -2110,13 +2012,13 @@ static std::string ADDIU_RS5_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDIUPC_32_(uint64 instruction, img_address m_pc)
+static char *ADDIUPC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2132,13 +2034,13 @@ static std::string ADDIUPC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDIUPC_48_(uint64 instruction, img_address m_pc)
+static char *ADDIUPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("ADDIUPC %s, %s", rt, s);
 }
@@ -2154,15 +2056,15 @@ static std::string ADDIUPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_PH(uint64 instruction, img_address m_pc)
+static char *ADDQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2179,15 +2081,15 @@ static std::string ADDQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_S_PH(uint64 instruction, img_address m_pc)
+static char *ADDQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2203,15 +2105,15 @@ static std::string ADDQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQ_S_W(uint64 instruction, img_address m_pc)
+static char *ADDQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -2228,15 +2130,15 @@ static std::string ADDQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_PH(uint64 instruction, img_address m_pc)
+static char *ADDQH_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2253,15 +2155,15 @@ static std::string ADDQH_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_R_PH(uint64 instruction, img_address m_pc)
+static char *ADDQH_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2278,15 +2180,15 @@ static std::string ADDQH_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_R_W(uint64 instruction, img_address m_pc)
+static char *ADDQH_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -2303,15 +2205,15 @@ static std::string ADDQH_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDQH_W(uint64 instruction, img_address m_pc)
+static char *ADDQH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -2327,15 +2229,15 @@ static std::string ADDQH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDSC(uint64 instruction, img_address m_pc)
+static char *ADDSC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDSC %s, %s, %s", rd, rs, rt);
 }
@@ -2350,15 +2252,15 @@ static std::string ADDSC(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *          rd3 ---
  */
-static std::string ADDU_16_(uint64 instruction, img_address m_pc)
+static char *ADDU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
 
     return img_format("ADDU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -2374,15 +2276,15 @@ static std::string ADDU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_32_(uint64 instruction, img_address m_pc)
+static char *ADDU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU %s, %s, %s", rd, rs, rt);
 }
@@ -2398,13 +2300,13 @@ static std::string ADDU_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_4X4_(uint64 instruction, img_address m_pc)
+static char *ADDU_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
     return img_format("ADDU %s, %s", rs4, rt4);
 }
@@ -2420,15 +2322,15 @@ static std::string ADDU_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_PH(uint64 instruction, img_address m_pc)
+static char *ADDU_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2444,15 +2346,15 @@ static std::string ADDU_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_QB(uint64 instruction, img_address m_pc)
+static char *ADDU_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2469,15 +2371,15 @@ static std::string ADDU_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_S_PH(uint64 instruction, img_address m_pc)
+static char *ADDU_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -2493,15 +2395,15 @@ static std::string ADDU_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDU_S_QB(uint64 instruction, img_address m_pc)
+static char *ADDU_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2518,15 +2420,15 @@ static std::string ADDU_S_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDUH_QB(uint64 instruction, img_address m_pc)
+static char *ADDUH_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2543,15 +2445,15 @@ static std::string ADDUH_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDUH_R_QB(uint64 instruction, img_address m_pc)
+static char *ADDUH_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -2566,15 +2468,15 @@ static std::string ADDUH_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ADDWC(uint64 instruction, img_address m_pc)
+static char *ADDWC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ADDWC %s, %s, %s", rd, rs, rt);
 }
@@ -2590,13 +2492,13 @@ static std::string ADDWC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ALUIPC(uint64 instruction, img_address m_pc)
+static char *ALUIPC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("ALUIPC %s, %%pcrel_hi(%s)", rt, s);
 }
@@ -2611,13 +2513,13 @@ static std::string ALUIPC(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *           eu ----
  */
-static std::string AND_16_(uint64 instruction, img_address m_pc)
+static char *AND_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("AND %s, %s", rs3, rt3);
 }
@@ -2633,15 +2535,15 @@ static std::string AND_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string AND_32_(uint64 instruction, img_address m_pc)
+static char *AND_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("AND %s, %s, %s", rd, rs, rt);
 }
@@ -2656,15 +2558,15 @@ static std::string AND_32_(uint64 instruction, img_address m_pc)
  *       rs3 ---
  *           eu ----
  */
-static std::string ANDI_16_(uint64 instruction, img_address m_pc)
+static char *ANDI_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 eu_value = extract_eu_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *eu = IMMEDIATE(encode_eu_from_u_andi16(eu_value));
 
     return img_format("ANDI %s, %s, %s", rt3, rs3, eu);
 }
@@ -2680,15 +2582,15 @@ static std::string ANDI_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ANDI_32_(uint64 instruction, img_address m_pc)
+static char *ANDI_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ANDI %s, %s, %s", rt, rs, u);
 }
@@ -2704,15 +2606,15 @@ static std::string ANDI_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string APPEND(uint64 instruction, img_address m_pc)
+static char *APPEND(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("APPEND %s, %s, %s", rt, rs, sa);
 }
@@ -2728,15 +2630,15 @@ static std::string APPEND(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ASET(uint64 instruction, img_address m_pc)
+static char *ASET(uint64 instruction, img_address m_pc)
 {
     uint64 bit_value = extract_bit_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *bit = IMMEDIATE(copy(bit_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("ASET %s, %s(%s)", bit, s, rs);
 }
@@ -2752,11 +2654,11 @@ static std::string ASET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BALC_16_(uint64 instruction, img_address m_pc)
+static char *BALC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2772,11 +2674,11 @@ static std::string BALC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BALC_32_(uint64 instruction, img_address m_pc)
+static char *BALC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BALC %s", s);
 }
@@ -2792,13 +2694,13 @@ static std::string BALC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BALRSC(uint64 instruction, img_address m_pc)
+static char *BALRSC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("BALRSC %s, %s", rt, rs);
 }
@@ -2814,15 +2716,15 @@ static std::string BALRSC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BBEQZC(uint64 instruction, img_address m_pc)
+static char *BBEQZC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *bit = IMMEDIATE(copy(bit_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBEQZC %s, %s, %s", rt, bit, s);
 }
@@ -2838,15 +2740,15 @@ static std::string BBEQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BBNEZC(uint64 instruction, img_address m_pc)
+static char *BBNEZC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 bit_value = extract_bit_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string bit = IMMEDIATE(copy(bit_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *bit = IMMEDIATE(copy(bit_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BBNEZC %s, %s, %s", rt, bit, s);
 }
@@ -2862,11 +2764,11 @@ static std::string BBNEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BC_16_(uint64 instruction, img_address m_pc)
+static char *BC_16_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se10_0_9_8_7_6_5_4_3_2_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2882,11 +2784,11 @@ static std::string BC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BC_32_(uint64 instruction, img_address m_pc)
+static char *BC_32_(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se25_0_24_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC %s", s);
 }
@@ -2902,13 +2804,13 @@ static std::string BC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BC1EQZC(uint64 instruction, img_address m_pc)
+static char *BC1EQZC(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *ft = FPR(copy(ft_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1EQZC %s, %s", ft, s);
 }
@@ -2924,13 +2826,13 @@ static std::string BC1EQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BC1NEZC(uint64 instruction, img_address m_pc)
+static char *BC1NEZC(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *ft = FPR(copy(ft_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC1NEZC %s, %s", ft, s);
 }
@@ -2946,13 +2848,13 @@ static std::string BC1NEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BC2EQZC(uint64 instruction, img_address m_pc)
+static char *BC2EQZC(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    char *ct = CPR(copy(ct_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2EQZC %s, %s", ct, s);
 }
@@ -2968,13 +2870,13 @@ static std::string BC2EQZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BC2NEZC(uint64 instruction, img_address m_pc)
+static char *BC2NEZC(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    char *ct = CPR(copy(ct_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BC2NEZC %s, %s", ct, s);
 }
@@ -2990,15 +2892,15 @@ static std::string BC2NEZC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BEQC_16_(uint64 instruction, img_address m_pc)
+static char *BEQC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_lt_rt3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
 
     return img_format("BEQC %s, %s, %s", rs3, rt3, u);
 }
@@ -3014,15 +2916,15 @@ static std::string BEQC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BEQC_32_(uint64 instruction, img_address m_pc)
+static char *BEQC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQC %s, %s, %s", rs, rt, s);
 }
@@ -3038,15 +2940,15 @@ static std::string BEQC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BEQIC(uint64 instruction, img_address m_pc)
+static char *BEQIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BEQIC %s, %s, %s", rt, u, s);
 }
@@ -3062,13 +2964,13 @@ static std::string BEQIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BEQZC_16_(uint64 instruction, img_address m_pc)
+static char *BEQZC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BEQZC %s, %s", rt3, s);
 }
@@ -3084,15 +2986,15 @@ static std::string BEQZC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BGEC(uint64 instruction, img_address m_pc)
+static char *BGEC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEC %s, %s, %s", rs, rt, s);
 }
@@ -3108,15 +3010,15 @@ static std::string BGEC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BGEIC(uint64 instruction, img_address m_pc)
+static char *BGEIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIC %s, %s, %s", rt, u, s);
 }
@@ -3132,15 +3034,15 @@ static std::string BGEIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BGEIUC(uint64 instruction, img_address m_pc)
+static char *BGEIUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEIUC %s, %s, %s", rt, u, s);
 }
@@ -3156,15 +3058,15 @@ static std::string BGEIUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BGEUC(uint64 instruction, img_address m_pc)
+static char *BGEUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BGEUC %s, %s, %s", rs, rt, s);
 }
@@ -3180,15 +3082,15 @@ static std::string BGEUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BLTC(uint64 instruction, img_address m_pc)
+static char *BLTC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTC %s, %s, %s", rs, rt, s);
 }
@@ -3204,15 +3106,15 @@ static std::string BLTC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BLTIC(uint64 instruction, img_address m_pc)
+static char *BLTIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIC %s, %s, %s", rt, u, s);
 }
@@ -3228,15 +3130,15 @@ static std::string BLTIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BLTIUC(uint64 instruction, img_address m_pc)
+static char *BLTIUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTIUC %s, %s, %s", rt, u, s);
 }
@@ -3252,15 +3154,15 @@ static std::string BLTIUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BLTUC(uint64 instruction, img_address m_pc)
+static char *BLTUC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BLTUC %s, %s, %s", rs, rt, s);
 }
@@ -3276,15 +3178,15 @@ static std::string BLTUC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BNEC_16_(uint64 instruction, img_address m_pc)
+static char *BNEC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s1(instruction);
 
-    std::string rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
+    const char *rs3 = GPR(encode_rs3_and_check_rs3_ge_rt3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = ADDRESS(encode_u_from_address(u_value), 2, m_pc);
 
     return img_format("BNEC %s, %s, %s", rs3, rt3, u);
 }
@@ -3300,15 +3202,15 @@ static std::string BNEC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BNEC_32_(uint64 instruction, img_address m_pc)
+static char *BNEC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEC %s, %s, %s", rs, rt, s);
 }
@@ -3324,15 +3226,15 @@ static std::string BNEC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BNEIC(uint64 instruction, img_address m_pc)
+static char *BNEIC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_16_15_14_13_12_11(instruction);
     int64 s_value = extract_s__se11_0_10_9_8_7_6_5_4_3_2_1_0_s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BNEIC %s, %s, %s", rt, u, s);
 }
@@ -3348,13 +3250,13 @@ static std::string BNEIC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BNEZC_16_(uint64 instruction, img_address m_pc)
+static char *BNEZC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     int64 s_value = extract_s__se7_0_6_5_4_3_2_1_s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 2, m_pc);
 
     return img_format("BNEZC %s, %s", rt3, s);
 }
@@ -3370,11 +3272,11 @@ static std::string BNEZC_16_(uint64 instruction, img_address m_pc)
  *            s[13:1] -------------
  *                           s[14] -
  */
-static std::string BPOSGE32C(uint64 instruction, img_address m_pc)
+static char *BPOSGE32C(uint64 instruction, img_address m_pc)
 {
     int64 s_value = extract_s__se14_0_13_to_1_s1(instruction);
 
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("BPOSGE32C %s", s);
 }
@@ -3390,11 +3292,11 @@ static std::string BPOSGE32C(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BREAK_16_(uint64 instruction, img_address m_pc)
+static char *BREAK_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3410,11 +3312,11 @@ static std::string BREAK_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BREAK_32_(uint64 instruction, img_address m_pc)
+static char *BREAK_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("BREAK %s", code);
 }
@@ -3430,11 +3332,11 @@ static std::string BREAK_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string BRSC(uint64 instruction, img_address m_pc)
+static char *BRSC(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("BRSC %s", rs);
 }
@@ -3450,15 +3352,15 @@ static std::string BRSC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CACHE(uint64 instruction, img_address m_pc)
+static char *CACHE(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *op = IMMEDIATE(copy(op_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CACHE %s, %s(%s)", op, s, rs);
 }
@@ -3474,15 +3376,15 @@ static std::string CACHE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CACHEE(uint64 instruction, img_address m_pc)
+static char *CACHEE(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *op = IMMEDIATE(copy(op_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CACHEE %s, %s(%s)", op, s, rs);
 }
@@ -3498,13 +3400,13 @@ static std::string CACHEE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_L_D(uint64 instruction, img_address m_pc)
+static char *CEIL_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.L.D %s, %s", ft, fs);
 }
@@ -3520,13 +3422,13 @@ static std::string CEIL_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_L_S(uint64 instruction, img_address m_pc)
+static char *CEIL_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.L.S %s, %s", ft, fs);
 }
@@ -3542,13 +3444,13 @@ static std::string CEIL_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_W_D(uint64 instruction, img_address m_pc)
+static char *CEIL_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.W.D %s, %s", ft, fs);
 }
@@ -3564,13 +3466,13 @@ static std::string CEIL_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CEIL_W_S(uint64 instruction, img_address m_pc)
+static char *CEIL_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CEIL.W.S %s, %s", ft, fs);
 }
@@ -3586,13 +3488,13 @@ static std::string CEIL_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CFC1(uint64 instruction, img_address m_pc)
+static char *CFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("CFC1 %s, %s", rt, cs);
 }
@@ -3608,13 +3510,13 @@ static std::string CFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CFC2(uint64 instruction, img_address m_pc)
+static char *CFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("CFC2 %s, %s", rt, cs);
 }
@@ -3630,13 +3532,13 @@ static std::string CFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CLASS_D(uint64 instruction, img_address m_pc)
+static char *CLASS_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CLASS.D %s, %s", ft, fs);
 }
@@ -3652,13 +3554,13 @@ static std::string CLASS_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CLASS_S(uint64 instruction, img_address m_pc)
+static char *CLASS_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CLASS.S %s, %s", ft, fs);
 }
@@ -3674,13 +3576,13 @@ static std::string CLASS_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CLO(uint64 instruction, img_address m_pc)
+static char *CLO(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CLO %s, %s", rt, rs);
 }
@@ -3696,13 +3598,13 @@ static std::string CLO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CLZ(uint64 instruction, img_address m_pc)
+static char *CLZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("CLZ %s, %s", rt, rs);
 }
@@ -3718,15 +3620,15 @@ static std::string CLZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_AF_D(uint64 instruction, img_address m_pc)
+static char *CMP_AF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.AF.D %s, %s, %s", fd, fs, ft);
 }
@@ -3742,15 +3644,15 @@ static std::string CMP_AF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_AF_S(uint64 instruction, img_address m_pc)
+static char *CMP_AF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.AF.S %s, %s, %s", fd, fs, ft);
 }
@@ -3766,15 +3668,15 @@ static std::string CMP_AF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_EQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_EQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.EQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -3789,13 +3691,13 @@ static std::string CMP_EQ_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_EQ_PH(uint64 instruction, img_address m_pc)
+static char *CMP_EQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMP.EQ.PH %s, %s", rs, rt);
 }
@@ -3811,15 +3713,15 @@ static std::string CMP_EQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_EQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_EQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.EQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -3835,15 +3737,15 @@ static std::string CMP_EQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LE_D(uint64 instruction, img_address m_pc)
+static char *CMP_LE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3858,13 +3760,13 @@ static std::string CMP_LE_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_LE_PH(uint64 instruction, img_address m_pc)
+static char *CMP_LE_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMP.LE.PH %s, %s", rs, rt);
 }
@@ -3880,15 +3782,15 @@ static std::string CMP_LE_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LE_S(uint64 instruction, img_address m_pc)
+static char *CMP_LE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LE.S %s, %s, %s", fd, fs, ft);
 }
@@ -3904,15 +3806,15 @@ static std::string CMP_LE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LT_D(uint64 instruction, img_address m_pc)
+static char *CMP_LT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LT.D %s, %s, %s", fd, fs, ft);
 }
@@ -3927,13 +3829,13 @@ static std::string CMP_LT_D(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string CMP_LT_PH(uint64 instruction, img_address m_pc)
+static char *CMP_LT_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMP.LT.PH %s, %s", rs, rt);
 }
@@ -3949,15 +3851,15 @@ static std::string CMP_LT_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_LT_S(uint64 instruction, img_address m_pc)
+static char *CMP_LT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.LT.S %s, %s, %s", fd, fs, ft);
 }
@@ -3973,15 +3875,15 @@ static std::string CMP_LT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_NE_D(uint64 instruction, img_address m_pc)
+static char *CMP_NE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.NE.D %s, %s, %s", fd, fs, ft);
 }
@@ -3997,15 +3899,15 @@ static std::string CMP_NE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_NE_S(uint64 instruction, img_address m_pc)
+static char *CMP_NE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.NE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4021,15 +3923,15 @@ static std::string CMP_NE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_OR_D(uint64 instruction, img_address m_pc)
+static char *CMP_OR_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.OR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4045,15 +3947,15 @@ static std::string CMP_OR_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_OR_S(uint64 instruction, img_address m_pc)
+static char *CMP_OR_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.OR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4069,15 +3971,15 @@ static std::string CMP_OR_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SAF_D(uint64 instruction, img_address m_pc)
+static char *CMP_SAF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SAF.D %s, %s, %s", fd, fs, ft);
 }
@@ -4093,15 +3995,15 @@ static std::string CMP_SAF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SAF_S(uint64 instruction, img_address m_pc)
+static char *CMP_SAF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SAF.S %s, %s, %s", fd, fs, ft);
 }
@@ -4117,15 +4019,15 @@ static std::string CMP_SAF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SEQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_SEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4141,15 +4043,15 @@ static std::string CMP_SEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SEQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_SEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4165,15 +4067,15 @@ static std::string CMP_SEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SLE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4189,15 +4091,15 @@ static std::string CMP_SLE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SLE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4213,15 +4115,15 @@ static std::string CMP_SLE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLT_D(uint64 instruction, img_address m_pc)
+static char *CMP_SLT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4237,15 +4139,15 @@ static std::string CMP_SLT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SLT_S(uint64 instruction, img_address m_pc)
+static char *CMP_SLT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SLT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4261,15 +4163,15 @@ static std::string CMP_SLT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SNE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4285,15 +4187,15 @@ static std::string CMP_SNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SNE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4309,15 +4211,15 @@ static std::string CMP_SNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SOR_D(uint64 instruction, img_address m_pc)
+static char *CMP_SOR_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SOR.D %s, %s, %s", fd, fs, ft);
 }
@@ -4333,15 +4235,15 @@ static std::string CMP_SOR_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SOR_S(uint64 instruction, img_address m_pc)
+static char *CMP_SOR_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SOR.S %s, %s, %s", fd, fs, ft);
 }
@@ -4357,15 +4259,15 @@ static std::string CMP_SOR_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUEQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_SUEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4381,15 +4283,15 @@ static std::string CMP_SUEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUEQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_SUEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4405,15 +4307,15 @@ static std::string CMP_SUEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SULE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4429,15 +4331,15 @@ static std::string CMP_SULE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SULE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4453,15 +4355,15 @@ static std::string CMP_SULE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULT_D(uint64 instruction, img_address m_pc)
+static char *CMP_SULT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4477,15 +4379,15 @@ static std::string CMP_SULT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SULT_S(uint64 instruction, img_address m_pc)
+static char *CMP_SULT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4501,15 +4403,15 @@ static std::string CMP_SULT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUN_D(uint64 instruction, img_address m_pc)
+static char *CMP_SUN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4525,15 +4427,15 @@ static std::string CMP_SUN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUNE_D(uint64 instruction, img_address m_pc)
+static char *CMP_SUNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4549,15 +4451,15 @@ static std::string CMP_SUNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUNE_S(uint64 instruction, img_address m_pc)
+static char *CMP_SUNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4573,15 +4475,15 @@ static std::string CMP_SUNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_SUN_S(uint64 instruction, img_address m_pc)
+static char *CMP_SUN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.SUN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4597,15 +4499,15 @@ static std::string CMP_SUN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UEQ_D(uint64 instruction, img_address m_pc)
+static char *CMP_UEQ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UEQ.D %s, %s, %s", fd, fs, ft);
 }
@@ -4621,15 +4523,15 @@ static std::string CMP_UEQ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UEQ_S(uint64 instruction, img_address m_pc)
+static char *CMP_UEQ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UEQ.S %s, %s, %s", fd, fs, ft);
 }
@@ -4645,15 +4547,15 @@ static std::string CMP_UEQ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULE_D(uint64 instruction, img_address m_pc)
+static char *CMP_ULE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4669,15 +4571,15 @@ static std::string CMP_ULE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULE_S(uint64 instruction, img_address m_pc)
+static char *CMP_ULE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4693,15 +4595,15 @@ static std::string CMP_ULE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULT_D(uint64 instruction, img_address m_pc)
+static char *CMP_ULT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULT.D %s, %s, %s", fd, fs, ft);
 }
@@ -4717,15 +4619,15 @@ static std::string CMP_ULT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_ULT_S(uint64 instruction, img_address m_pc)
+static char *CMP_ULT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.ULT.S %s, %s, %s", fd, fs, ft);
 }
@@ -4741,15 +4643,15 @@ static std::string CMP_ULT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UN_D(uint64 instruction, img_address m_pc)
+static char *CMP_UN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UN.D %s, %s, %s", fd, fs, ft);
 }
@@ -4765,15 +4667,15 @@ static std::string CMP_UN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UNE_D(uint64 instruction, img_address m_pc)
+static char *CMP_UNE_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UNE.D %s, %s, %s", fd, fs, ft);
 }
@@ -4789,15 +4691,15 @@ static std::string CMP_UNE_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UNE_S(uint64 instruction, img_address m_pc)
+static char *CMP_UNE_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UNE.S %s, %s, %s", fd, fs, ft);
 }
@@ -4813,15 +4715,15 @@ static std::string CMP_UNE_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMP_UN_S(uint64 instruction, img_address m_pc)
+static char *CMP_UN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("CMP.UN.S %s, %s, %s", fd, fs, ft);
 }
@@ -4838,15 +4740,15 @@ static std::string CMP_UN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
+static char *CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGDU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4863,15 +4765,15 @@ static std::string CMPGDU_EQ_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
+static char *CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGDU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4888,15 +4790,15 @@ static std::string CMPGDU_LE_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
+static char *CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGDU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4913,15 +4815,15 @@ static std::string CMPGDU_LT_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
+static char *CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGU.EQ.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4938,15 +4840,15 @@ static std::string CMPGU_EQ_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_LE_QB(uint64 instruction, img_address m_pc)
+static char *CMPGU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGU.LE.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4963,15 +4865,15 @@ static std::string CMPGU_LE_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CMPGU_LT_QB(uint64 instruction, img_address m_pc)
+static char *CMPGU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPGU.LT.QB %s, %s, %s", rd, rs, rt);
 }
@@ -4987,13 +4889,13 @@ static std::string CMPGU_LT_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_EQ_QB(uint64 instruction, img_address m_pc)
+static char *CMPU_EQ_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPU.EQ.QB %s, %s", rs, rt);
 }
@@ -5009,13 +4911,13 @@ static std::string CMPU_EQ_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_LE_QB(uint64 instruction, img_address m_pc)
+static char *CMPU_LE_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPU.LE.QB %s, %s", rs, rt);
 }
@@ -5031,13 +4933,13 @@ static std::string CMPU_LE_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string CMPU_LT_QB(uint64 instruction, img_address m_pc)
+static char *CMPU_LT_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("CMPU.LT.QB %s, %s", rs, rt);
 }
@@ -5053,11 +4955,11 @@ static std::string CMPU_LT_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string COP2_1(uint64 instruction, img_address m_pc)
+static char *COP2_1(uint64 instruction, img_address m_pc)
 {
     uint64 cofun_value = extract_cofun_25_24_23(instruction);
 
-    std::string cofun = IMMEDIATE(copy(cofun_value));
+    char *cofun = IMMEDIATE(copy(cofun_value));
 
     return img_format("COP2_1 %s", cofun);
 }
@@ -5073,13 +4975,13 @@ static std::string COP2_1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CTC1(uint64 instruction, img_address m_pc)
+static char *CTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("CTC1 %s, %s", rt, cs);
 }
@@ -5095,13 +4997,13 @@ static std::string CTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CTC2(uint64 instruction, img_address m_pc)
+static char *CTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("CTC2 %s, %s", rt, cs);
 }
@@ -5117,13 +5019,13 @@ static std::string CTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_L(uint64 instruction, img_address m_pc)
+static char *CVT_D_L(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.D.L %s, %s", ft, fs);
 }
@@ -5139,13 +5041,13 @@ static std::string CVT_D_L(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_S(uint64 instruction, img_address m_pc)
+static char *CVT_D_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.D.S %s, %s", ft, fs);
 }
@@ -5161,13 +5063,13 @@ static std::string CVT_D_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_D_W(uint64 instruction, img_address m_pc)
+static char *CVT_D_W(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.D.W %s, %s", ft, fs);
 }
@@ -5183,13 +5085,13 @@ static std::string CVT_D_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_L_D(uint64 instruction, img_address m_pc)
+static char *CVT_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.L.D %s, %s", ft, fs);
 }
@@ -5205,13 +5107,13 @@ static std::string CVT_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_L_S(uint64 instruction, img_address m_pc)
+static char *CVT_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.L.S %s, %s", ft, fs);
 }
@@ -5227,13 +5129,13 @@ static std::string CVT_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_D(uint64 instruction, img_address m_pc)
+static char *CVT_S_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.D %s, %s", ft, fs);
 }
@@ -5249,13 +5151,13 @@ static std::string CVT_S_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_L(uint64 instruction, img_address m_pc)
+static char *CVT_S_L(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.L %s, %s", ft, fs);
 }
@@ -5271,13 +5173,13 @@ static std::string CVT_S_L(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_PL(uint64 instruction, img_address m_pc)
+static char *CVT_S_PL(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.PL %s, %s", ft, fs);
 }
@@ -5293,13 +5195,13 @@ static std::string CVT_S_PL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_PU(uint64 instruction, img_address m_pc)
+static char *CVT_S_PU(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.PU %s, %s", ft, fs);
 }
@@ -5315,13 +5217,13 @@ static std::string CVT_S_PU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_S_W(uint64 instruction, img_address m_pc)
+static char *CVT_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.S.W %s, %s", ft, fs);
 }
@@ -5337,13 +5239,13 @@ static std::string CVT_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_W_D(uint64 instruction, img_address m_pc)
+static char *CVT_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.W.D %s, %s", ft, fs);
 }
@@ -5359,13 +5261,13 @@ static std::string CVT_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string CVT_W_S(uint64 instruction, img_address m_pc)
+static char *CVT_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("CVT.W.S %s, %s", ft, fs);
 }
@@ -5381,13 +5283,13 @@ static std::string CVT_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_48_(uint64 instruction, img_address m_pc)
+static char *DADDIU_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
 
     return img_format("DADDIU %s, %s", rt, s);
 }
@@ -5403,15 +5305,15 @@ static std::string DADDIU_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_NEG_(uint64 instruction, img_address m_pc)
+static char *DADDIU_NEG_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(neg_copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(neg_copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5427,15 +5329,15 @@ static std::string DADDIU_NEG_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DADDIU_U12_(uint64 instruction, img_address m_pc)
+static char *DADDIU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("DADDIU %s, %s, %s", rt, rs, u);
 }
@@ -5451,15 +5353,15 @@ static std::string DADDIU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DADD(uint64 instruction, img_address m_pc)
+static char *DADD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DADD %s, %s, %s", rd, rs, rt);
 }
@@ -5475,15 +5377,15 @@ static std::string DADD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DADDU(uint64 instruction, img_address m_pc)
+static char *DADDU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DADDU %s, %s, %s", rd, rs, rt);
 }
@@ -5499,13 +5401,13 @@ static std::string DADDU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DCLO(uint64 instruction, img_address m_pc)
+static char *DCLO(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("DCLO %s, %s", rt, rs);
 }
@@ -5521,13 +5423,13 @@ static std::string DCLO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DCLZ(uint64 instruction, img_address m_pc)
+static char *DCLZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("DCLZ %s, %s", rt, rs);
 }
@@ -5543,15 +5445,15 @@ static std::string DCLZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DDIV(uint64 instruction, img_address m_pc)
+static char *DDIV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DDIV %s, %s, %s", rd, rs, rt);
 }
@@ -5567,15 +5469,15 @@ static std::string DDIV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DDIVU(uint64 instruction, img_address m_pc)
+static char *DDIVU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DDIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5591,11 +5493,11 @@ static std::string DDIVU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DERET(uint64 instruction, img_address m_pc)
+static char *DERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "DERET ";
+    return (char *)"DERET ";
 }
 
 
@@ -5609,17 +5511,17 @@ static std::string DERET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DEXTM(uint64 instruction, img_address m_pc)
+static char *DEXTM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *lsb = IMMEDIATE(copy(lsb_value));
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTM %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5635,17 +5537,17 @@ static std::string DEXTM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DEXT(uint64 instruction, img_address m_pc)
+static char *DEXT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *lsb = IMMEDIATE(copy(lsb_value));
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5661,17 +5563,17 @@ static std::string DEXT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DEXTU(uint64 instruction, img_address m_pc)
+static char *DEXTU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *lsb = IMMEDIATE(copy(lsb_value));
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("DEXTU %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -5687,17 +5589,17 @@ static std::string DEXTU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DINSM(uint64 instruction, img_address m_pc)
+static char *DINSM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSM %s, %s, %s, %s", rt, rs, pos, size);
@@ -5715,17 +5617,17 @@ static std::string DINSM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DINS(uint64 instruction, img_address m_pc)
+static char *DINS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINS %s, %s, %s, %s", rt, rs, pos, size);
@@ -5743,17 +5645,17 @@ static std::string DINS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DINSU(uint64 instruction, img_address m_pc)
+static char *DINSU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("DINSU %s, %s, %s, %s", rt, rs, pos, size);
@@ -5771,11 +5673,11 @@ static std::string DINSU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DI(uint64 instruction, img_address m_pc)
+static char *DI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DI %s", rt);
 }
@@ -5791,15 +5693,15 @@ static std::string DI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DIV(uint64 instruction, img_address m_pc)
+static char *DIV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DIV %s, %s, %s", rd, rs, rt);
 }
@@ -5815,15 +5717,15 @@ static std::string DIV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DIV_D(uint64 instruction, img_address m_pc)
+static char *DIV_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("DIV.D %s, %s, %s", fd, fs, ft);
 }
@@ -5839,15 +5741,15 @@ static std::string DIV_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DIV_S(uint64 instruction, img_address m_pc)
+static char *DIV_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("DIV.S %s, %s, %s", fd, fs, ft);
 }
@@ -5863,15 +5765,15 @@ static std::string DIV_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DIVU(uint64 instruction, img_address m_pc)
+static char *DIVU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DIVU %s, %s, %s", rd, rs, rt);
 }
@@ -5887,17 +5789,17 @@ static std::string DIVU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DLSA(uint64 instruction, img_address m_pc)
+static char *DLSA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u2 = IMMEDIATE(copy(u2_value));
 
     return img_format("DLSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -5913,13 +5815,13 @@ static std::string DLSA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DLUI_48_(uint64 instruction, img_address m_pc)
+static char *DLUI_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     uint64 u_value = extract_u_31_to_0__s32(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("DLUI %s, %s", rt, u);
 }
@@ -5935,15 +5837,15 @@ static std::string DLUI_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC0(uint64 instruction, img_address m_pc)
+static char *DMFC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -5959,13 +5861,13 @@ static std::string DMFC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC1(uint64 instruction, img_address m_pc)
+static char *DMFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("DMFC1 %s, %s", rt, fs);
 }
@@ -5981,13 +5883,13 @@ static std::string DMFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMFC2(uint64 instruction, img_address m_pc)
+static char *DMFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("DMFC2 %s, %s", rt, cs);
 }
@@ -6003,15 +5905,15 @@ static std::string DMFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMFGC0(uint64 instruction, img_address m_pc)
+static char *DMFGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6027,15 +5929,15 @@ static std::string DMFGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMOD(uint64 instruction, img_address m_pc)
+static char *DMOD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMOD %s, %s, %s", rd, rs, rt);
 }
@@ -6051,15 +5953,15 @@ static std::string DMOD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMODU(uint64 instruction, img_address m_pc)
+static char *DMODU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMODU %s, %s, %s", rd, rs, rt);
 }
@@ -6075,15 +5977,15 @@ static std::string DMODU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC0(uint64 instruction, img_address m_pc)
+static char *DMTC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6099,13 +6001,13 @@ static std::string DMTC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC1(uint64 instruction, img_address m_pc)
+static char *DMTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("DMTC1 %s, %s", rt, fs);
 }
@@ -6121,13 +6023,13 @@ static std::string DMTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMTC2(uint64 instruction, img_address m_pc)
+static char *DMTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("DMTC2 %s, %s", rt, cs);
 }
@@ -6143,15 +6045,15 @@ static std::string DMTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMTGC0(uint64 instruction, img_address m_pc)
+static char *DMTGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("DMTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -6167,11 +6069,11 @@ static std::string DMTGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMT(uint64 instruction, img_address m_pc)
+static char *DMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMT %s", rt);
 }
@@ -6187,15 +6089,15 @@ static std::string DMT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMUH(uint64 instruction, img_address m_pc)
+static char *DMUH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMUH %s, %s, %s", rd, rs, rt);
 }
@@ -6211,15 +6113,15 @@ static std::string DMUH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMUHU(uint64 instruction, img_address m_pc)
+static char *DMUHU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMUHU %s, %s, %s", rd, rs, rt);
 }
@@ -6235,15 +6137,15 @@ static std::string DMUHU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMUL(uint64 instruction, img_address m_pc)
+static char *DMUL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMUL %s, %s, %s", rd, rs, rt);
 }
@@ -6259,15 +6161,15 @@ static std::string DMUL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DMULU(uint64 instruction, img_address m_pc)
+static char *DMULU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DMULU %s, %s, %s", rd, rs, rt);
 }
@@ -6284,15 +6186,15 @@ static std::string DMULU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string DPA_W_PH(uint64 instruction, img_address m_pc)
+static char *DPA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6308,15 +6210,15 @@ static std::string DPA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
+static char *DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6332,15 +6234,15 @@ static std::string DPAQ_SA_L_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6356,15 +6258,15 @@ static std::string DPAQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6380,15 +6282,15 @@ static std::string DPAQX_SA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6404,15 +6306,15 @@ static std::string DPAQX_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPAU_H_QBL(uint64 instruction, img_address m_pc)
+static char *DPAU_H_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6428,15 +6330,15 @@ static std::string DPAU_H_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPAU_H_QBR(uint64 instruction, img_address m_pc)
+static char *DPAU_H_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6452,15 +6354,15 @@ static std::string DPAU_H_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPAX_W_PH(uint64 instruction, img_address m_pc)
+static char *DPAX_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPAX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6476,15 +6378,15 @@ static std::string DPAX_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPS_W_PH(uint64 instruction, img_address m_pc)
+static char *DPS_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPS.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6500,15 +6402,15 @@ static std::string DPS_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
+static char *DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQ_SA.L.W %s, %s, %s", ac, rs, rt);
 }
@@ -6524,15 +6426,15 @@ static std::string DPSQ_SA_L_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6548,15 +6450,15 @@ static std::string DPSQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQX_SA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6572,15 +6474,15 @@ static std::string DPSQX_SA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSQX_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6596,15 +6498,15 @@ static std::string DPSQX_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPSU_H_QBL(uint64 instruction, img_address m_pc)
+static char *DPSU_H_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSU.H.QBL %s, %s, %s", ac, rs, rt);
 }
@@ -6620,15 +6522,15 @@ static std::string DPSU_H_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPSU_H_QBR(uint64 instruction, img_address m_pc)
+static char *DPSU_H_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSU.H.QBR %s, %s, %s", ac, rs, rt);
 }
@@ -6644,15 +6546,15 @@ static std::string DPSU_H_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DPSX_W_PH(uint64 instruction, img_address m_pc)
+static char *DPSX_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DPSX.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -6668,15 +6570,15 @@ static std::string DPSX_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DROTR(uint64 instruction, img_address m_pc)
+static char *DROTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DROTR %s, %s, %s", rt, rs, shift);
 }
@@ -6692,15 +6594,15 @@ static std::string DROTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static std::string DROTR32(uint64 instruction, img_address m_pc)
+static char *DROTR32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DROTR32 %s, %s, %s", rt, rs, shift);
 }
@@ -6716,15 +6618,15 @@ static std::string DROTR32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DROTRV(uint64 instruction, img_address m_pc)
+static char *DROTRV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -6740,17 +6642,17 @@ static std::string DROTRV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DROTX(uint64 instruction, img_address m_pc)
+static char *DROTX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shiftx_value = extract_shiftx_11_10_9_8_7_6(instruction);
     uint64 shift_value = extract_shift_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
+    char *shiftx = IMMEDIATE(copy(shiftx_value));
 
     return img_format("DROTX %s, %s, %s, %s", rt, rs, shift, shiftx);
 }
@@ -6766,15 +6668,15 @@ static std::string DROTX(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static std::string DSLL(uint64 instruction, img_address m_pc)
+static char *DSLL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSLL %s, %s, %s", rt, rs, shift);
 }
@@ -6790,15 +6692,15 @@ static std::string DSLL(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static std::string DSLL32(uint64 instruction, img_address m_pc)
+static char *DSLL32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSLL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6814,15 +6716,15 @@ static std::string DSLL32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DSLLV(uint64 instruction, img_address m_pc)
+static char *DSLLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSLLV %s, %s, %s", rd, rs, rt);
 }
@@ -6838,15 +6740,15 @@ static std::string DSLLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRA(uint64 instruction, img_address m_pc)
+static char *DSRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRA %s, %s, %s", rt, rs, shift);
 }
@@ -6862,15 +6764,15 @@ static std::string DSRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRA32(uint64 instruction, img_address m_pc)
+static char *DSRA32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRA32 %s, %s, %s", rt, rs, shift);
 }
@@ -6886,15 +6788,15 @@ static std::string DSRA32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DSRAV(uint64 instruction, img_address m_pc)
+static char *DSRAV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSRAV %s, %s, %s", rd, rs, rt);
 }
@@ -6910,15 +6812,15 @@ static std::string DSRAV(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRL(uint64 instruction, img_address m_pc)
+static char *DSRL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRL %s, %s, %s", rt, rs, shift);
 }
@@ -6934,15 +6836,15 @@ static std::string DSRL(uint64 instruction, img_address m_pc)
  *          rs -----
  *                       shift -----
  */
-static std::string DSRL32(uint64 instruction, img_address m_pc)
+static char *DSRL32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("DSRL32 %s, %s, %s", rt, rs, shift);
 }
@@ -6958,15 +6860,15 @@ static std::string DSRL32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DSRLV(uint64 instruction, img_address m_pc)
+static char *DSRLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSRLV %s, %s, %s", rd, rs, rt);
 }
@@ -6982,15 +6884,15 @@ static std::string DSRLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DSUB(uint64 instruction, img_address m_pc)
+static char *DSUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSUB %s, %s, %s", rd, rs, rt);
 }
@@ -7006,15 +6908,15 @@ static std::string DSUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DSUBU(uint64 instruction, img_address m_pc)
+static char *DSUBU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DSUBU %s, %s, %s", rd, rs, rt);
 }
@@ -7030,11 +6932,11 @@ static std::string DSUBU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DVPE(uint64 instruction, img_address m_pc)
+static char *DVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DVPE %s", rt);
 }
@@ -7050,11 +6952,11 @@ static std::string DVPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string DVP(uint64 instruction, img_address m_pc)
+static char *DVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("DVP %s", rt);
 }
@@ -7070,11 +6972,11 @@ static std::string DVP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EHB(uint64 instruction, img_address m_pc)
+static char *EHB(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "EHB ";
+    return (char *)"EHB ";
 }
 
 
@@ -7088,11 +6990,11 @@ static std::string EHB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EI(uint64 instruction, img_address m_pc)
+static char *EI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EI %s", rt);
 }
@@ -7108,11 +7010,11 @@ static std::string EI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EMT(uint64 instruction, img_address m_pc)
+static char *EMT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EMT %s", rt);
 }
@@ -7128,11 +7030,11 @@ static std::string EMT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ERET(uint64 instruction, img_address m_pc)
+static char *ERET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "ERET ";
+    return (char *)"ERET ";
 }
 
 
@@ -7146,11 +7048,11 @@ static std::string ERET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ERETNC(uint64 instruction, img_address m_pc)
+static char *ERETNC(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "ERETNC ";
+    return (char *)"ERETNC ";
 }
 
 
@@ -7164,11 +7066,11 @@ static std::string ERETNC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EVP(uint64 instruction, img_address m_pc)
+static char *EVP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EVP %s", rt);
 }
@@ -7184,11 +7086,11 @@ static std::string EVP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EVPE(uint64 instruction, img_address m_pc)
+static char *EVPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("EVPE %s", rt);
 }
@@ -7204,17 +7106,17 @@ static std::string EVPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EXT(uint64 instruction, img_address m_pc)
+static char *EXT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string lsb = IMMEDIATE(copy(lsb_value));
-    std::string msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *lsb = IMMEDIATE(copy(lsb_value));
+    char *msbd = IMMEDIATE(encode_msbd_from_size(msbd_value));
 
     return img_format("EXT %s, %s, %s, %s", rt, rs, lsb, msbd);
 }
@@ -7230,17 +7132,17 @@ static std::string EXT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EXTD(uint64 instruction, img_address m_pc)
+static char *EXTD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTD %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7256,17 +7158,17 @@ static std::string EXTD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EXTD32(uint64 instruction, img_address m_pc)
+static char *EXTD32(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTD32 %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7282,15 +7184,15 @@ static std::string EXTD32(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPDP(uint64 instruction, img_address m_pc)
+static char *EXTPDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    char *size = IMMEDIATE(copy(size_value));
 
     return img_format("EXTPDP %s, %s, %s", rt, ac, size);
 }
@@ -7306,15 +7208,15 @@ static std::string EXTPDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPDPV(uint64 instruction, img_address m_pc)
+static char *EXTPDPV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTPDPV %s, %s, %s", rt, ac, rs);
 }
@@ -7330,15 +7232,15 @@ static std::string EXTPDPV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EXTP(uint64 instruction, img_address m_pc)
+static char *EXTP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 size_value = extract_size_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string size = IMMEDIATE(copy(size_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    char *size = IMMEDIATE(copy(size_value));
 
     return img_format("EXTP %s, %s, %s", rt, ac, size);
 }
@@ -7354,15 +7256,15 @@ static std::string EXTP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string EXTPV(uint64 instruction, img_address m_pc)
+static char *EXTPV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTPV %s, %s, %s", rt, ac, rs);
 }
@@ -7379,15 +7281,15 @@ static std::string EXTPV(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_RS_W(uint64 instruction, img_address m_pc)
+static char *EXTR_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_RS.W %s, %s, %s", rt, ac, shift);
 }
@@ -7404,15 +7306,15 @@ static std::string EXTR_RS_W(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_R_W(uint64 instruction, img_address m_pc)
+static char *EXTR_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_R.W %s, %s, %s", rt, ac, shift);
 }
@@ -7429,15 +7331,15 @@ static std::string EXTR_R_W(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_S_H(uint64 instruction, img_address m_pc)
+static char *EXTR_S_H(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR_S.H %s, %s, %s", rt, ac, shift);
 }
@@ -7454,15 +7356,15 @@ static std::string EXTR_S_H(uint64 instruction, img_address m_pc)
  *       shift -----
  *               ac --
  */
-static std::string EXTR_W(uint64 instruction, img_address m_pc)
+static char *EXTR_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 shift_value = extract_shift_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTR.W %s, %s, %s", rt, ac, shift);
 }
@@ -7479,15 +7381,15 @@ static std::string EXTR_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_RS_W(uint64 instruction, img_address m_pc)
+static char *EXTRV_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV_RS.W %s, %s, %s", rt, ac, rs);
 }
@@ -7504,15 +7406,15 @@ static std::string EXTRV_RS_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_R_W(uint64 instruction, img_address m_pc)
+static char *EXTRV_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV_R.W %s, %s, %s", rt, ac, rs);
 }
@@ -7529,15 +7431,15 @@ static std::string EXTRV_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_S_H(uint64 instruction, img_address m_pc)
+static char *EXTRV_S_H(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV_S.H %s, %s, %s", rt, ac, rs);
 }
@@ -7554,15 +7456,15 @@ static std::string EXTRV_S_H(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string EXTRV_W(uint64 instruction, img_address m_pc)
+static char *EXTRV_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("EXTRV.W %s, %s, %s", rt, ac, rs);
 }
@@ -7579,17 +7481,17 @@ static std::string EXTRV_W(uint64 instruction, img_address m_pc)
  *               rd -----
  *                 shift -----
  */
-static std::string EXTW(uint64 instruction, img_address m_pc)
+static char *EXTW(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 shift_value = extract_shift_10_9_8_7_6(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("EXTW %s, %s, %s, %s", rd, rs, rt, shift);
 }
@@ -7605,13 +7507,13 @@ static std::string EXTW(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_L_D(uint64 instruction, img_address m_pc)
+static char *FLOOR_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.L.D %s, %s", ft, fs);
 }
@@ -7627,13 +7529,13 @@ static std::string FLOOR_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_L_S(uint64 instruction, img_address m_pc)
+static char *FLOOR_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.L.S %s, %s", ft, fs);
 }
@@ -7649,13 +7551,13 @@ static std::string FLOOR_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_W_D(uint64 instruction, img_address m_pc)
+static char *FLOOR_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.W.D %s, %s", ft, fs);
 }
@@ -7671,13 +7573,13 @@ static std::string FLOOR_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string FLOOR_W_S(uint64 instruction, img_address m_pc)
+static char *FLOOR_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("FLOOR.W.S %s, %s", ft, fs);
 }
@@ -7693,15 +7595,15 @@ static std::string FLOOR_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string FORK(uint64 instruction, img_address m_pc)
+static char *FORK(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("FORK %s, %s, %s", rd, rs, rt);
 }
@@ -7717,11 +7619,11 @@ static std::string FORK(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string HYPCALL(uint64 instruction, img_address m_pc)
+static char *HYPCALL(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7737,11 +7639,11 @@ static std::string HYPCALL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string HYPCALL_16_(uint64 instruction, img_address m_pc)
+static char *HYPCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("HYPCALL %s", code);
 }
@@ -7757,17 +7659,17 @@ static std::string HYPCALL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string INS(uint64 instruction, img_address m_pc)
+static char *INS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 msbd_value = extract_msbt_10_9_8_7_6(instruction);
     uint64 lsb_value = extract_lsb_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
-    std::string size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *pos = IMMEDIATE(encode_lsb_from_pos_and_size(lsb_value));
+    char *size = IMMEDIATE(encode_lsb_from_pos_and_size(msbd_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("INS %s, %s, %s, %s", rt, rs, pos, size);
@@ -7784,13 +7686,13 @@ static std::string INS(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string INSV(uint64 instruction, img_address m_pc)
+static char *INSV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("INSV %s, %s", rt, rs);
 }
@@ -7806,11 +7708,11 @@ static std::string INSV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string IRET(uint64 instruction, img_address m_pc)
+static char *IRET(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "IRET ";
+    return (char *)"IRET ";
 }
 
 
@@ -7824,11 +7726,11 @@ static std::string IRET(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_16_(uint64 instruction, img_address m_pc)
+static char *JALRC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("JALRC $%d, %s", 31, rt);
 }
@@ -7844,13 +7746,13 @@ static std::string JALRC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_32_(uint64 instruction, img_address m_pc)
+static char *JALRC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("JALRC %s, %s", rt, rs);
 }
@@ -7866,13 +7768,13 @@ static std::string JALRC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string JALRC_HB(uint64 instruction, img_address m_pc)
+static char *JALRC_HB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("JALRC.HB %s, %s", rt, rs);
 }
@@ -7888,11 +7790,11 @@ static std::string JALRC_HB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string JRC(uint64 instruction, img_address m_pc)
+static char *JRC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
 
-    std::string rt = GPR(copy(rt_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("JRC %s", rt);
 }
@@ -7908,15 +7810,15 @@ static std::string JRC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LB_16_(uint64 instruction, img_address m_pc)
+static char *LB_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LB %s, %s(%s)", rt3, u, rs3);
 }
@@ -7932,13 +7834,13 @@ static std::string LB_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LB_GP_(uint64 instruction, img_address m_pc)
+static char *LB_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LB %s, %s($%d)", rt, u, 28);
 }
@@ -7954,15 +7856,15 @@ static std::string LB_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LB_S9_(uint64 instruction, img_address m_pc)
+static char *LB_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, s, rs);
 }
@@ -7978,15 +7880,15 @@ static std::string LB_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LB_U12_(uint64 instruction, img_address m_pc)
+static char *LB_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LB %s, %s(%s)", rt, u, rs);
 }
@@ -8002,15 +7904,15 @@ static std::string LB_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBE(uint64 instruction, img_address m_pc)
+static char *LBE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBE %s, %s(%s)", rt, s, rs);
 }
@@ -8026,15 +7928,15 @@ static std::string LBE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_16_(uint64 instruction, img_address m_pc)
+static char *LBU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LBU %s, %s(%s)", rt3, u, rs3);
 }
@@ -8050,13 +7952,13 @@ static std::string LBU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_GP_(uint64 instruction, img_address m_pc)
+static char *LBU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LBU %s, %s($%d)", rt, u, 28);
 }
@@ -8072,15 +7974,15 @@ static std::string LBU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_S9_(uint64 instruction, img_address m_pc)
+static char *LBU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, s, rs);
 }
@@ -8096,15 +7998,15 @@ static std::string LBU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBU_U12_(uint64 instruction, img_address m_pc)
+static char *LBU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBU %s, %s(%s)", rt, u, rs);
 }
@@ -8120,15 +8022,15 @@ static std::string LBU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBUE(uint64 instruction, img_address m_pc)
+static char *LBUE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LBUE %s, %s(%s)", rt, s, rs);
 }
@@ -8144,15 +8046,15 @@ static std::string LBUE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBUX(uint64 instruction, img_address m_pc)
+static char *LBUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LBUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8168,15 +8070,15 @@ static std::string LBUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LBX(uint64 instruction, img_address m_pc)
+static char *LBX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LBX %s, %s(%s)", rd, rs, rt);
 }
@@ -8192,13 +8094,13 @@ static std::string LBX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LD_GP_(uint64 instruction, img_address m_pc)
+static char *LD_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LD %s, %s($%d)", rt, u, 28);
 }
@@ -8214,15 +8116,15 @@ static std::string LD_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LD_S9_(uint64 instruction, img_address m_pc)
+static char *LD_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, s, rs);
 }
@@ -8238,15 +8140,15 @@ static std::string LD_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LD_U12_(uint64 instruction, img_address m_pc)
+static char *LD_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LD %s, %s(%s)", rt, u, rs);
 }
@@ -8262,13 +8164,13 @@ static std::string LD_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_GP_(uint64 instruction, img_address m_pc)
+static char *LDC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -8284,15 +8186,15 @@ static std::string LDC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_S9_(uint64 instruction, img_address m_pc)
+static char *LDC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -8308,15 +8210,15 @@ static std::string LDC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1_U12_(uint64 instruction, img_address m_pc)
+static char *LDC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -8332,15 +8234,15 @@ static std::string LDC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1XS(uint64 instruction, img_address m_pc)
+static char *LDC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -8356,15 +8258,15 @@ static std::string LDC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDC1X(uint64 instruction, img_address m_pc)
+static char *LDC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -8380,15 +8282,15 @@ static std::string LDC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDC2(uint64 instruction, img_address m_pc)
+static char *LDC2(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *ct = CPR(copy(ct_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LDC2 %s, %s(%s)", ct, s, rs);
 }
@@ -8404,17 +8306,17 @@ static std::string LDC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDM(uint64 instruction, img_address m_pc)
+static char *LDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -8430,13 +8332,13 @@ static std::string LDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDPC_48_(uint64 instruction, img_address m_pc)
+static char *LDPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LDPC %s, %s", rt, s);
 }
@@ -8452,15 +8354,15 @@ static std::string LDPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDX(uint64 instruction, img_address m_pc)
+static char *LDX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDX %s, %s(%s)", rd, rs, rt);
 }
@@ -8476,15 +8378,15 @@ static std::string LDX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LDXS(uint64 instruction, img_address m_pc)
+static char *LDXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8500,15 +8402,15 @@ static std::string LDXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LH_16_(uint64 instruction, img_address m_pc)
+static char *LH_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LH %s, %s(%s)", rt3, u, rs3);
 }
@@ -8524,13 +8426,13 @@ static std::string LH_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LH_GP_(uint64 instruction, img_address m_pc)
+static char *LH_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LH %s, %s($%d)", rt, u, 28);
 }
@@ -8546,15 +8448,15 @@ static std::string LH_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LH_S9_(uint64 instruction, img_address m_pc)
+static char *LH_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, s, rs);
 }
@@ -8570,15 +8472,15 @@ static std::string LH_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LH_U12_(uint64 instruction, img_address m_pc)
+static char *LH_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LH %s, %s(%s)", rt, u, rs);
 }
@@ -8594,15 +8496,15 @@ static std::string LH_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHE(uint64 instruction, img_address m_pc)
+static char *LHE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHE %s, %s(%s)", rt, s, rs);
 }
@@ -8618,15 +8520,15 @@ static std::string LHE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_16_(uint64 instruction, img_address m_pc)
+static char *LHU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LHU %s, %s(%s)", rt3, u, rs3);
 }
@@ -8642,13 +8544,13 @@ static std::string LHU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_GP_(uint64 instruction, img_address m_pc)
+static char *LHU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LHU %s, %s($%d)", rt, u, 28);
 }
@@ -8664,15 +8566,15 @@ static std::string LHU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_S9_(uint64 instruction, img_address m_pc)
+static char *LHU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, s, rs);
 }
@@ -8688,15 +8590,15 @@ static std::string LHU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHU_U12_(uint64 instruction, img_address m_pc)
+static char *LHU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHU %s, %s(%s)", rt, u, rs);
 }
@@ -8712,15 +8614,15 @@ static std::string LHU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHUE(uint64 instruction, img_address m_pc)
+static char *LHUE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LHUE %s, %s(%s)", rt, s, rs);
 }
@@ -8736,15 +8638,15 @@ static std::string LHUE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHUX(uint64 instruction, img_address m_pc)
+static char *LHUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHUX %s, %s(%s)", rd, rs, rt);
 }
@@ -8760,15 +8662,15 @@ static std::string LHUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHUXS(uint64 instruction, img_address m_pc)
+static char *LHUXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8784,15 +8686,15 @@ static std::string LHUXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHXS(uint64 instruction, img_address m_pc)
+static char *LHXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -8808,15 +8710,15 @@ static std::string LHXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LHX(uint64 instruction, img_address m_pc)
+static char *LHX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LHX %s, %s(%s)", rd, rs, rt);
 }
@@ -8832,13 +8734,13 @@ static std::string LHX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LI_16_(uint64 instruction, img_address m_pc)
+static char *LI_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 eu_value = extract_eu_6_5_4_3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *eu = IMMEDIATE(encode_eu_from_s_li16(eu_value));
 
     return img_format("LI %s, %s", rt3, eu);
 }
@@ -8854,13 +8756,13 @@ static std::string LI_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LI_48_(uint64 instruction, img_address m_pc)
+static char *LI_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
 
     return img_format("LI %s, %s", rt, s);
 }
@@ -8876,15 +8778,15 @@ static std::string LI_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LL(uint64 instruction, img_address m_pc)
+static char *LL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LL %s, %s(%s)", rt, s, rs);
 }
@@ -8900,15 +8802,15 @@ static std::string LL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LLD(uint64 instruction, img_address m_pc)
+static char *LLD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLD %s, %s(%s)", rt, s, rs);
 }
@@ -8924,15 +8826,15 @@ static std::string LLD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LLDP(uint64 instruction, img_address m_pc)
+static char *LLDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8948,15 +8850,15 @@ static std::string LLDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LLE(uint64 instruction, img_address m_pc)
+static char *LLE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLE %s, %s(%s)", rt, s, rs);
 }
@@ -8972,15 +8874,15 @@ static std::string LLE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LLWP(uint64 instruction, img_address m_pc)
+static char *LLWP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -8996,15 +8898,15 @@ static std::string LLWP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LLWPE(uint64 instruction, img_address m_pc)
+static char *LLWPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LLWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -9020,17 +8922,17 @@ static std::string LLWPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LSA(uint64 instruction, img_address m_pc)
+static char *LSA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
     uint64 u2_value = extract_u2_10_9(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string u2 = IMMEDIATE(copy(u2_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u2 = IMMEDIATE(copy(u2_value));
 
     return img_format("LSA %s, %s, %s, %s", rd, rs, rt, u2);
 }
@@ -9046,13 +8948,13 @@ static std::string LSA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LUI(uint64 instruction, img_address m_pc)
+static char *LUI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se31_0_11_to_2_20_to_12_s12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
 
     return img_format("LUI %s, %%hi(%s)", rt, s);
 }
@@ -9068,15 +8970,15 @@ static std::string LUI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LW_16_(uint64 instruction, img_address m_pc)
+static char *LW_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("LW %s, %s(%s)", rt3, u, rs3);
 }
@@ -9092,15 +8994,15 @@ static std::string LW_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LW_4X4_(uint64 instruction, img_address m_pc)
+static char *LW_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("LW %s, %s(%s)", rt4, u, rs4);
 }
@@ -9116,13 +9018,13 @@ static std::string LW_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LW_GP_(uint64 instruction, img_address m_pc)
+static char *LW_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 28);
 }
@@ -9138,13 +9040,13 @@ static std::string LW_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LW_GP16_(uint64 instruction, img_address m_pc)
+static char *LW_GP16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt3, u, 28);
 }
@@ -9160,15 +9062,15 @@ static std::string LW_GP16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LW_S9_(uint64 instruction, img_address m_pc)
+static char *LW_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, s, rs);
 }
@@ -9184,13 +9086,13 @@ static std::string LW_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LW_SP_(uint64 instruction, img_address m_pc)
+static char *LW_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LW %s, %s($%d)", rt, u, 29);
 }
@@ -9206,15 +9108,15 @@ static std::string LW_SP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LW_U12_(uint64 instruction, img_address m_pc)
+static char *LW_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LW %s, %s(%s)", rt, u, rs);
 }
@@ -9230,13 +9132,13 @@ static std::string LW_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_GP_(uint64 instruction, img_address m_pc)
+static char *LWC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -9252,15 +9154,15 @@ static std::string LWC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_S9_(uint64 instruction, img_address m_pc)
+static char *LWC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -9276,15 +9178,15 @@ static std::string LWC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1_U12_(uint64 instruction, img_address m_pc)
+static char *LWC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -9300,15 +9202,15 @@ static std::string LWC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1X(uint64 instruction, img_address m_pc)
+static char *LWC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -9324,15 +9226,15 @@ static std::string LWC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWC1XS(uint64 instruction, img_address m_pc)
+static char *LWC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -9348,15 +9250,15 @@ static std::string LWC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWC2(uint64 instruction, img_address m_pc)
+static char *LWC2(uint64 instruction, img_address m_pc)
 {
     uint64 ct_value = extract_ct_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ct = CPR(copy(ct_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *ct = CPR(copy(ct_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWC2 %s, %s(%s)", ct, s, rs);
 }
@@ -9372,15 +9274,15 @@ static std::string LWC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWE(uint64 instruction, img_address m_pc)
+static char *LWE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWE %s, %s(%s)", rt, s, rs);
 }
@@ -9396,17 +9298,17 @@ static std::string LWE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWM(uint64 instruction, img_address m_pc)
+static char *LWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("LWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -9422,13 +9324,13 @@ static std::string LWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWPC_48_(uint64 instruction, img_address m_pc)
+static char *LWPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("LWPC %s, %s", rt, s);
 }
@@ -9444,13 +9346,13 @@ static std::string LWPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_GP_(uint64 instruction, img_address m_pc)
+static char *LWU_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("LWU %s, %s($%d)", rt, u, 28);
 }
@@ -9466,15 +9368,15 @@ static std::string LWU_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_S9_(uint64 instruction, img_address m_pc)
+static char *LWU_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, s, rs);
 }
@@ -9490,15 +9392,15 @@ static std::string LWU_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWU_U12_(uint64 instruction, img_address m_pc)
+static char *LWU_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("LWU %s, %s(%s)", rt, u, rs);
 }
@@ -9514,15 +9416,15 @@ static std::string LWU_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWUX(uint64 instruction, img_address m_pc)
+static char *LWUX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWUX %s, %s(%s)", rd, rs, rt);
 }
@@ -9538,15 +9440,15 @@ static std::string LWUX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWUXS(uint64 instruction, img_address m_pc)
+static char *LWUXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWUXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9562,15 +9464,15 @@ static std::string LWUXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWX(uint64 instruction, img_address m_pc)
+static char *LWX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWX %s, %s(%s)", rd, rs, rt);
 }
@@ -9586,15 +9488,15 @@ static std::string LWX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWXS_16_(uint64 instruction, img_address m_pc)
+static char *LWXS_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *rt3 = IMMEDIATE(decode_gpr_gpr3(rt3_value));
 
     return img_format("LWXS %s, %s(%s)", rd3, rs3, rt3);
 }
@@ -9610,15 +9512,15 @@ static std::string LWXS_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string LWXS_32_(uint64 instruction, img_address m_pc)
+static char *LWXS_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("LWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -9635,15 +9537,15 @@ static std::string LWXS_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MADD_DSP_(uint64 instruction, img_address m_pc)
+static char *MADD_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MADD %s, %s, %s", ac, rs, rt);
 }
@@ -9659,15 +9561,15 @@ static std::string MADD_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MADDF_D(uint64 instruction, img_address m_pc)
+static char *MADDF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MADDF.D %s, %s, %s", fd, fs, ft);
 }
@@ -9683,15 +9585,15 @@ static std::string MADDF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MADDF_S(uint64 instruction, img_address m_pc)
+static char *MADDF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MADDF.S %s, %s, %s", fd, fs, ft);
 }
@@ -9708,15 +9610,15 @@ static std::string MADDF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MADDU_DSP_(uint64 instruction, img_address m_pc)
+static char *MADDU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MADDU %s, %s, %s", ac, rs, rt);
 }
@@ -9733,15 +9635,15 @@ static std::string MADDU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
+static char *MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_S.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9758,15 +9660,15 @@ static std::string MAQ_S_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
+static char *MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_S.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9783,15 +9685,15 @@ static std::string MAQ_S_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
+static char *MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_SA.W.PHL %s, %s, %s", ac, rs, rt);
 }
@@ -9808,15 +9710,15 @@ static std::string MAQ_SA_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
+static char *MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MAQ_SA.W.PHR %s, %s, %s", ac, rs, rt);
 }
@@ -9832,15 +9734,15 @@ static std::string MAQ_SA_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAX_D(uint64 instruction, img_address m_pc)
+static char *MAX_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAX.D %s, %s, %s", fd, fs, ft);
 }
@@ -9856,15 +9758,15 @@ static std::string MAX_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAX_S(uint64 instruction, img_address m_pc)
+static char *MAX_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAX.S %s, %s, %s", fd, fs, ft);
 }
@@ -9880,15 +9782,15 @@ static std::string MAX_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAXA_D(uint64 instruction, img_address m_pc)
+static char *MAXA_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAXA.D %s, %s, %s", fd, fs, ft);
 }
@@ -9904,15 +9806,15 @@ static std::string MAXA_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MAXA_S(uint64 instruction, img_address m_pc)
+static char *MAXA_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MAXA.S %s, %s, %s", fd, fs, ft);
 }
@@ -9928,15 +9830,15 @@ static std::string MAXA_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFC0(uint64 instruction, img_address m_pc)
+static char *MFC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -9952,13 +9854,13 @@ static std::string MFC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFC1(uint64 instruction, img_address m_pc)
+static char *MFC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MFC1 %s, %s", rt, fs);
 }
@@ -9974,13 +9876,13 @@ static std::string MFC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFC2(uint64 instruction, img_address m_pc)
+static char *MFC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("MFC2 %s, %s", rt, cs);
 }
@@ -9996,15 +9898,15 @@ static std::string MFC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFGC0(uint64 instruction, img_address m_pc)
+static char *MFGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10020,15 +9922,15 @@ static std::string MFGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC0(uint64 instruction, img_address m_pc)
+static char *MFHC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10044,13 +9946,13 @@ static std::string MFHC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC1(uint64 instruction, img_address m_pc)
+static char *MFHC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MFHC1 %s, %s", rt, fs);
 }
@@ -10066,13 +9968,13 @@ static std::string MFHC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFHC2(uint64 instruction, img_address m_pc)
+static char *MFHC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("MFHC2 %s, %s", rt, cs);
 }
@@ -10088,15 +9990,15 @@ static std::string MFHC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFHGC0(uint64 instruction, img_address m_pc)
+static char *MFHGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10111,13 +10013,13 @@ static std::string MFHGC0(uint64 instruction, img_address m_pc)
  *     rt -----
  *               ac --
  */
-static std::string MFHI_DSP_(uint64 instruction, img_address m_pc)
+static char *MFHI_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MFHI %s, %s", rt, ac);
 }
@@ -10133,17 +10035,17 @@ static std::string MFHI_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFHTR(uint64 instruction, img_address m_pc)
+static char *MFHTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = IMMEDIATE(copy(c0s_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10158,13 +10060,13 @@ static std::string MFHTR(uint64 instruction, img_address m_pc)
  *     rt -----
  *               ac --
  */
-static std::string MFLO_DSP_(uint64 instruction, img_address m_pc)
+static char *MFLO_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MFLO %s, %s", rt, ac);
 }
@@ -10180,17 +10082,17 @@ static std::string MFLO_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MFTR(uint64 instruction, img_address m_pc)
+static char *MFTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = IMMEDIATE(copy(c0s_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MFTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10206,15 +10108,15 @@ static std::string MFTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MIN_D(uint64 instruction, img_address m_pc)
+static char *MIN_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MIN.D %s, %s, %s", fd, fs, ft);
 }
@@ -10230,15 +10132,15 @@ static std::string MIN_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MIN_S(uint64 instruction, img_address m_pc)
+static char *MIN_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MIN.S %s, %s, %s", fd, fs, ft);
 }
@@ -10254,15 +10156,15 @@ static std::string MIN_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MINA_D(uint64 instruction, img_address m_pc)
+static char *MINA_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MINA.D %s, %s, %s", fd, fs, ft);
 }
@@ -10278,15 +10180,15 @@ static std::string MINA_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MINA_S(uint64 instruction, img_address m_pc)
+static char *MINA_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MINA.S %s, %s, %s", fd, fs, ft);
 }
@@ -10302,15 +10204,15 @@ static std::string MINA_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOD(uint64 instruction, img_address m_pc)
+static char *MOD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MOD %s, %s, %s", rd, rs, rt);
 }
@@ -10326,15 +10228,15 @@ static std::string MOD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MODSUB(uint64 instruction, img_address m_pc)
+static char *MODSUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MODSUB %s, %s, %s", rd, rs, rt);
 }
@@ -10350,15 +10252,15 @@ static std::string MODSUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MODU(uint64 instruction, img_address m_pc)
+static char *MODU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MODU %s, %s, %s", rd, rs, rt);
 }
@@ -10374,13 +10276,13 @@ static std::string MODU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOV_D(uint64 instruction, img_address m_pc)
+static char *MOV_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MOV.D %s, %s", ft, fs);
 }
@@ -10396,13 +10298,13 @@ static std::string MOV_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOV_S(uint64 instruction, img_address m_pc)
+static char *MOV_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MOV.S %s, %s", ft, fs);
 }
@@ -10418,15 +10320,15 @@ static std::string MOV_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOVE_BALC(uint64 instruction, img_address m_pc)
+static char *MOVE_BALC(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_27_26_25_23_22_21(instruction);
     uint64 rd1_value = extract_rdl_25_24(instruction);
     int64 s_value = extract_s__se21_0_20_to_1_s1(instruction);
 
-    std::string rd1 = GPR(decode_gpr_gpr1(rd1_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
+    const char *rd1 = GPR(decode_gpr_gpr1(rd1_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 4, m_pc);
 
     return img_format("MOVE.BALC %s, %s, %s", rd1, rtz4, s);
 }
@@ -10442,17 +10344,17 @@ static std::string MOVE_BALC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOVEP(uint64 instruction, img_address m_pc)
+static char *MOVEP(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rsz4_value = extract_rsz4_4_2_1_0(instruction);
 
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *re2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
-    std::string rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    const char *rsz4 = GPR(decode_gpr_gpr4_zero(rsz4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
 
     return img_format("MOVEP %s, %s, %s, %s", rd2, re2, rsz4, rtz4);
     /* hand edited */
@@ -10469,16 +10371,16 @@ static std::string MOVEP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOVEP_REV_(uint64 instruction, img_address m_pc)
+static char *MOVEP_REV_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rd2_value = extract_rd2_3_8(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
-    std::string rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
-    std::string rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rd2 = GPR(decode_gpr_gpr2_reg1(rd2_value));
+    const char *rs2 = GPR(decode_gpr_gpr2_reg2(rd2_value));
     /* !!!!!!!!!! - no conversion function */
 
     return img_format("MOVEP %s, %s, %s, %s", rs4, rt4, rd2, rs2);
@@ -10496,13 +10398,13 @@ static std::string MOVEP_REV_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOVE(uint64 instruction, img_address m_pc)
+static char *MOVE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 rs_value = extract_rs_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("MOVE %s, %s", rt, rs);
 }
@@ -10518,15 +10420,15 @@ static std::string MOVE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOVN(uint64 instruction, img_address m_pc)
+static char *MOVN(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MOVN %s, %s, %s", rd, rs, rt);
 }
@@ -10542,15 +10444,15 @@ static std::string MOVN(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MOVZ(uint64 instruction, img_address m_pc)
+static char *MOVZ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MOVZ %s, %s, %s", rd, rs, rt);
 }
@@ -10566,15 +10468,15 @@ static std::string MOVZ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MSUB_DSP_(uint64 instruction, img_address m_pc)
+static char *MSUB_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MSUB %s, %s, %s", ac, rs, rt);
 }
@@ -10590,15 +10492,15 @@ static std::string MSUB_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MSUBF_D(uint64 instruction, img_address m_pc)
+static char *MSUBF_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MSUBF.D %s, %s, %s", fd, fs, ft);
 }
@@ -10614,15 +10516,15 @@ static std::string MSUBF_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MSUBF_S(uint64 instruction, img_address m_pc)
+static char *MSUBF_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MSUBF.S %s, %s, %s", fd, fs, ft);
 }
@@ -10638,15 +10540,15 @@ static std::string MSUBF_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MSUBU_DSP_(uint64 instruction, img_address m_pc)
+static char *MSUBU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MSUBU %s, %s, %s", ac, rs, rt);
 }
@@ -10662,15 +10564,15 @@ static std::string MSUBU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTC0(uint64 instruction, img_address m_pc)
+static char *MTC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10686,13 +10588,13 @@ static std::string MTC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTC1(uint64 instruction, img_address m_pc)
+static char *MTC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MTC1 %s, %s", rt, fs);
 }
@@ -10708,13 +10610,13 @@ static std::string MTC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTC2(uint64 instruction, img_address m_pc)
+static char *MTC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("MTC2 %s, %s", rt, cs);
 }
@@ -10730,15 +10632,15 @@ static std::string MTC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTGC0(uint64 instruction, img_address m_pc)
+static char *MTGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10754,15 +10656,15 @@ static std::string MTGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC0(uint64 instruction, img_address m_pc)
+static char *MTHC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10778,13 +10680,13 @@ static std::string MTHC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC1(uint64 instruction, img_address m_pc)
+static char *MTHC1(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("MTHC1 %s, %s", rt, fs);
 }
@@ -10800,13 +10702,13 @@ static std::string MTHC1(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTHC2(uint64 instruction, img_address m_pc)
+static char *MTHC2(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 cs_value = extract_cs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string cs = CPR(copy(cs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *cs = CPR(copy(cs_value));
 
     return img_format("MTHC2 %s, %s", rt, cs);
 }
@@ -10822,15 +10724,15 @@ static std::string MTHC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTHGC0(uint64 instruction, img_address m_pc)
+static char *MTHGC0(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = CPR(copy(c0s_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = CPR(copy(c0s_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHGC0 %s, %s, %s", rt, c0s, sel);
 }
@@ -10845,13 +10747,13 @@ static std::string MTHGC0(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MTHI_DSP_(uint64 instruction, img_address m_pc)
+static char *MTHI_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MTHI %s, %s", rs, ac);
 }
@@ -10866,13 +10768,13 @@ static std::string MTHI_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MTHLIP(uint64 instruction, img_address m_pc)
+static char *MTHLIP(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MTHLIP %s, %s", rs, ac);
 }
@@ -10888,17 +10790,17 @@ static std::string MTHLIP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTHTR(uint64 instruction, img_address m_pc)
+static char *MTHTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = IMMEDIATE(copy(c0s_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTHTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10913,13 +10815,13 @@ static std::string MTHTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MTLO_DSP_(uint64 instruction, img_address m_pc)
+static char *MTLO_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("MTLO %s, %s", rs, ac);
 }
@@ -10935,17 +10837,17 @@ static std::string MTLO_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MTTR(uint64 instruction, img_address m_pc)
+static char *MTTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 c0s_value = extract_c0s_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_15_14_13_12_11(instruction);
     uint64 u_value = extract_u_10(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string c0s = IMMEDIATE(copy(c0s_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *c0s = IMMEDIATE(copy(c0s_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("MTTR %s, %s, %s, %s", rt, c0s, u, sel);
 }
@@ -10961,15 +10863,15 @@ static std::string MTTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUH(uint64 instruction, img_address m_pc)
+static char *MUH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUH %s, %s, %s", rd, rs, rt);
 }
@@ -10985,15 +10887,15 @@ static std::string MUH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUHU(uint64 instruction, img_address m_pc)
+static char *MUHU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUHU %s, %s, %s", rd, rs, rt);
 }
@@ -11009,15 +10911,15 @@ static std::string MUHU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_32_(uint64 instruction, img_address m_pc)
+static char *MUL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUL %s, %s, %s", rd, rs, rt);
 }
@@ -11033,13 +10935,13 @@ static std::string MUL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_4X4_(uint64 instruction, img_address m_pc)
+static char *MUL_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rt4_value = extract_rt4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
 
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
-    std::string rt4 = GPR(decode_gpr_gpr4(rt4_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rt4 = GPR(decode_gpr_gpr4(rt4_value));
 
     return img_format("MUL %s, %s", rs4, rt4);
 }
@@ -11055,15 +10957,15 @@ static std::string MUL_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_D(uint64 instruction, img_address m_pc)
+static char *MUL_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MUL.D %s, %s, %s", fd, fs, ft);
 }
@@ -11080,15 +10982,15 @@ static std::string MUL_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_PH(uint64 instruction, img_address m_pc)
+static char *MUL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11105,15 +11007,15 @@ static std::string MUL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_S_PH(uint64 instruction, img_address m_pc)
+static char *MUL_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MUL_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11129,15 +11031,15 @@ static std::string MUL_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MUL_S(uint64 instruction, img_address m_pc)
+static char *MUL_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("MUL.S %s, %s, %s", fd, fs, ft);
 }
@@ -11154,15 +11056,15 @@ static std::string MUL_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
+static char *MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEQ_S.W.PHL %s, %s, %s", rd, rs, rt);
 }
@@ -11179,15 +11081,15 @@ static std::string MULEQ_S_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
+static char *MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEQ_S.W.PHR %s, %s, %s", rd, rs, rt);
 }
@@ -11204,15 +11106,15 @@ static std::string MULEQ_S_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
+static char *MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEU_S.PH.QBL %s, %s, %s", rd, rs, rt);
 }
@@ -11229,15 +11131,15 @@ static std::string MULEU_S_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
+static char *MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULEU_S.PH.QBR %s, %s, %s", rd, rs, rt);
 }
@@ -11254,15 +11156,15 @@ static std::string MULEU_S_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_RS_PH(uint64 instruction, img_address m_pc)
+static char *MULQ_RS_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_RS.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11279,15 +11181,15 @@ static std::string MULQ_RS_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_RS_W(uint64 instruction, img_address m_pc)
+static char *MULQ_RS_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_RS.W %s, %s, %s", rd, rs, rt);
 }
@@ -11304,15 +11206,15 @@ static std::string MULQ_RS_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_S_PH(uint64 instruction, img_address m_pc)
+static char *MULQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11329,15 +11231,15 @@ static std::string MULQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULQ_S_W(uint64 instruction, img_address m_pc)
+static char *MULQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -11354,15 +11256,15 @@ static std::string MULQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MULSA_W_PH(uint64 instruction, img_address m_pc)
+static char *MULSA_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULSA.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11379,15 +11281,15 @@ static std::string MULSA_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
+static char *MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULSAQ_S.W.PH %s, %s, %s", ac, rs, rt);
 }
@@ -11403,15 +11305,15 @@ static std::string MULSAQ_S_W_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MULT_DSP_(uint64 instruction, img_address m_pc)
+static char *MULT_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULT %s, %s, %s", ac, rs, rt);
 }
@@ -11427,15 +11329,15 @@ static std::string MULT_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string MULTU_DSP_(uint64 instruction, img_address m_pc)
+static char *MULTU_DSP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string ac = AC(copy(ac_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULTU %s, %s, %s", ac, rs, rt);
 }
@@ -11451,15 +11353,15 @@ static std::string MULTU_DSP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string MULU(uint64 instruction, img_address m_pc)
+static char *MULU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("MULU %s, %s, %s", rd, rs, rt);
 }
@@ -11475,13 +11377,13 @@ static std::string MULU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string NEG_D(uint64 instruction, img_address m_pc)
+static char *NEG_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("NEG.D %s, %s", ft, fs);
 }
@@ -11497,13 +11399,13 @@ static std::string NEG_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string NEG_S(uint64 instruction, img_address m_pc)
+static char *NEG_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("NEG.S %s, %s", ft, fs);
 }
@@ -11519,11 +11421,11 @@ static std::string NEG_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string NOP_16_(uint64 instruction, img_address m_pc)
+static char *NOP_16_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "NOP ";
+    return (char *)"NOP ";
 }
 
 
@@ -11537,11 +11439,11 @@ static std::string NOP_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string NOP_32_(uint64 instruction, img_address m_pc)
+static char *NOP_32_(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "NOP ";
+    return (char *)"NOP ";
 }
 
 
@@ -11555,15 +11457,15 @@ static std::string NOP_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string NOR(uint64 instruction, img_address m_pc)
+static char *NOR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("NOR %s, %s, %s", rd, rs, rt);
 }
@@ -11579,13 +11481,13 @@ static std::string NOR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string NOT_16_(uint64 instruction, img_address m_pc)
+static char *NOT_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("NOT %s, %s", rt3, rs3);
 }
@@ -11601,13 +11503,13 @@ static std::string NOT_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string OR_16_(uint64 instruction, img_address m_pc)
+static char *OR_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("OR %s, %s", rs3, rt3);
 }
@@ -11623,15 +11525,15 @@ static std::string OR_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string OR_32_(uint64 instruction, img_address m_pc)
+static char *OR_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("OR %s, %s, %s", rd, rs, rt);
 }
@@ -11647,15 +11549,15 @@ static std::string OR_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ORI(uint64 instruction, img_address m_pc)
+static char *ORI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("ORI %s, %s, %s", rt, rs, u);
 }
@@ -11672,15 +11574,15 @@ static std::string ORI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PACKRL_PH(uint64 instruction, img_address m_pc)
+static char *PACKRL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PACKRL.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11696,11 +11598,11 @@ static std::string PACKRL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PAUSE(uint64 instruction, img_address m_pc)
+static char *PAUSE(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "PAUSE ";
+    return (char *)"PAUSE ";
 }
 
 
@@ -11715,15 +11617,15 @@ static std::string PAUSE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PICK_PH(uint64 instruction, img_address m_pc)
+static char *PICK_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PICK.PH %s, %s, %s", rd, rs, rt);
 }
@@ -11740,15 +11642,15 @@ static std::string PICK_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PICK_QB(uint64 instruction, img_address m_pc)
+static char *PICK_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PICK.QB %s, %s, %s", rd, rs, rt);
 }
@@ -11765,13 +11667,13 @@ static std::string PICK_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
+static char *PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQ.W.PHL %s, %s", rt, rs);
 }
@@ -11788,13 +11690,13 @@ static std::string PRECEQ_W_PHL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
+static char *PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQ.W.PHR %s, %s", rt, rs);
 }
@@ -11811,13 +11713,13 @@ static std::string PRECEQ_W_PHR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11834,13 +11736,13 @@ static std::string PRECEQU_PH_QBLA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBL %s, %s", rt, rs);
 }
@@ -11857,13 +11759,13 @@ static std::string PRECEQU_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11880,13 +11782,13 @@ static std::string PRECEQU_PH_QBRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
+static char *PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEQU.PH.QBR %s, %s", rt, rs);
 }
@@ -11904,13 +11806,13 @@ static std::string PRECEQU_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBLA %s, %s", rt, rs);
 }
@@ -11927,13 +11829,13 @@ static std::string PRECEU_PH_QBLA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBL %s, %s", rt, rs);
 }
@@ -11951,13 +11853,13 @@ static std::string PRECEU_PH_QBL(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBRA %s, %s", rt, rs);
 }
@@ -11974,13 +11876,13 @@ static std::string PRECEU_PH_QBRA(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
+static char *PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PRECEU.PH.QBR %s, %s", rt, rs);
 }
@@ -11997,15 +11899,15 @@ static std::string PRECEU_PH_QBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_QB_PH(uint64 instruction, img_address m_pc)
+static char *PRECR_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECR.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12022,15 +11924,15 @@ static std::string PRECR_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PRECR_SRA.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12047,15 +11949,15 @@ static std::string PRECR_SRA_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PRECR_SRA_R.PH.W %s, %s, %s", rt, rs, sa);
 }
@@ -12072,15 +11974,15 @@ static std::string PRECR_SRA_R_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECRQ_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQ.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12097,15 +11999,15 @@ static std::string PRECRQ_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
+static char *PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQ.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12122,15 +12024,15 @@ static std::string PRECRQ_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
+static char *PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQ_RS.PH.W %s, %s, %s", rd, rs, rt);
 }
@@ -12147,15 +12049,15 @@ static std::string PRECRQ_RS_PH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
+static char *PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("PRECRQU_S.QB.PH %s, %s, %s", rd, rs, rt);
 }
@@ -12171,15 +12073,15 @@ static std::string PRECRQU_S_QB_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PREF_S9_(uint64 instruction, img_address m_pc)
+static char *PREF_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *hint = IMMEDIATE(copy(hint_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, s, rs);
 }
@@ -12195,15 +12097,15 @@ static std::string PREF_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PREF_U12_(uint64 instruction, img_address m_pc)
+static char *PREF_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    char *hint = IMMEDIATE(copy(hint_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PREF %s, %s(%s)", hint, u, rs);
 }
@@ -12219,15 +12121,15 @@ static std::string PREF_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PREFE(uint64 instruction, img_address m_pc)
+static char *PREFE(uint64 instruction, img_address m_pc)
 {
     uint64 hint_value = extract_hint_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string hint = IMMEDIATE(copy(hint_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *hint = IMMEDIATE(copy(hint_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("PREFE %s, %s(%s)", hint, s, rs);
 }
@@ -12243,15 +12145,15 @@ static std::string PREFE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string PREPEND(uint64 instruction, img_address m_pc)
+static char *PREPEND(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("PREPEND %s, %s, %s", rt, rs, sa);
 }
@@ -12266,13 +12168,13 @@ static std::string PREPEND(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string RADDU_W_QB(uint64 instruction, img_address m_pc)
+static char *RADDU_W_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("RADDU.W.QB %s, %s", rt, rs);
 }
@@ -12287,13 +12189,13 @@ static std::string RADDU_W_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *        mask -------
  */
-static std::string RDDSP(uint64 instruction, img_address m_pc)
+static char *RDDSP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy(rt_value));
+    char *mask = IMMEDIATE(copy(mask_value));
 
     return img_format("RDDSP %s, %s", rt, mask);
 }
@@ -12309,15 +12211,15 @@ static std::string RDDSP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RDHWR(uint64 instruction, img_address m_pc)
+static char *RDHWR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 hs_value = extract_hs_20_19_18_17_16(instruction);
     uint64 sel_value = extract_sel_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string hs = CPR(copy(hs_value));
-    std::string sel = IMMEDIATE(copy(sel_value));
+    const char *rt = GPR(copy(rt_value));
+    char *hs = CPR(copy(hs_value));
+    char *sel = IMMEDIATE(copy(sel_value));
 
     return img_format("RDHWR %s, %s, %s", rt, hs, sel);
 }
@@ -12333,13 +12235,13 @@ static std::string RDHWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RDPGPR(uint64 instruction, img_address m_pc)
+static char *RDPGPR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("RDPGPR %s, %s", rt, rs);
 }
@@ -12355,13 +12257,13 @@ static std::string RDPGPR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RECIP_D(uint64 instruction, img_address m_pc)
+static char *RECIP_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RECIP.D %s, %s", ft, fs);
 }
@@ -12377,13 +12279,13 @@ static std::string RECIP_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RECIP_S(uint64 instruction, img_address m_pc)
+static char *RECIP_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RECIP.S %s, %s", ft, fs);
 }
@@ -12399,13 +12301,13 @@ static std::string RECIP_S(uint64 instruction, img_address m_pc)
  *     rt -----
  *           s ----------
  */
-static std::string REPL_PH(uint64 instruction, img_address m_pc)
+static char *REPL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se9_20_19_18_17_16_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
 
     return img_format("REPL.PH %s, %s", rt, s);
 }
@@ -12421,13 +12323,13 @@ static std::string REPL_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *           u --------
  */
-static std::string REPL_QB(uint64 instruction, img_address m_pc)
+static char *REPL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_19_18_17_16_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("REPL.QB %s, %s", rt, u);
 }
@@ -12443,13 +12345,13 @@ static std::string REPL_QB(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string REPLV_PH(uint64 instruction, img_address m_pc)
+static char *REPLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("REPLV.PH %s, %s", rt, rs);
 }
@@ -12464,13 +12366,13 @@ static std::string REPLV_PH(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string REPLV_QB(uint64 instruction, img_address m_pc)
+static char *REPLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("REPLV.QB %s, %s", rt, rs);
 }
@@ -12486,14 +12388,14 @@ static std::string REPLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_32_(uint64 instruction, img_address m_pc)
+static char *RESTORE_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    char *u = IMMEDIATE(copy(u_value));
     return img_format("RESTORE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12509,13 +12411,13 @@ static std::string RESTORE_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
+static char *RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    char *u = IMMEDIATE(copy(u_value));
     return img_format("RESTORE.JRC %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12531,14 +12433,14 @@ static std::string RESTORE_JRC_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
+static char *RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    char *u = IMMEDIATE(copy(u_value));
     return img_format("RESTORE.JRC %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12554,13 +12456,13 @@ static std::string RESTORE_JRC_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RESTOREF(uint64 instruction, img_address m_pc)
+static char *RESTOREF(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *count = IMMEDIATE(copy(count_value));
 
     return img_format("RESTOREF %s, %s", u, count);
 }
@@ -12576,13 +12478,13 @@ static std::string RESTOREF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RINT_D(uint64 instruction, img_address m_pc)
+static char *RINT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RINT.D %s, %s", ft, fs);
 }
@@ -12598,13 +12500,13 @@ static std::string RINT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RINT_S(uint64 instruction, img_address m_pc)
+static char *RINT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RINT.S %s, %s", ft, fs);
 }
@@ -12620,15 +12522,15 @@ static std::string RINT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ROTR(uint64 instruction, img_address m_pc)
+static char *ROTR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("ROTR %s, %s, %s", rt, rs, shift);
 }
@@ -12644,15 +12546,15 @@ static std::string ROTR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ROTRV(uint64 instruction, img_address m_pc)
+static char *ROTRV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("ROTRV %s, %s, %s", rd, rs, rt);
 }
@@ -12668,7 +12570,7 @@ static std::string ROTRV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ROTX(uint64 instruction, img_address m_pc)
+static char *ROTX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
@@ -12676,11 +12578,11 @@ static std::string ROTX(uint64 instruction, img_address m_pc)
     uint64 stripe_value = extract_stripe_6(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string shiftx = IMMEDIATE(copy(shiftx_value));
-    std::string stripe = IMMEDIATE(copy(stripe_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
+    char *shiftx = IMMEDIATE(copy(shiftx_value));
+    char *stripe = IMMEDIATE(copy(stripe_value));
 
     return img_format("ROTX %s, %s, %s, %s, %s",
                        rt, rs, shift, shiftx, stripe);
@@ -12697,13 +12599,13 @@ static std::string ROTX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_L_D(uint64 instruction, img_address m_pc)
+static char *ROUND_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.L.D %s, %s", ft, fs);
 }
@@ -12719,13 +12621,13 @@ static std::string ROUND_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_L_S(uint64 instruction, img_address m_pc)
+static char *ROUND_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.L.S %s, %s", ft, fs);
 }
@@ -12741,13 +12643,13 @@ static std::string ROUND_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_W_D(uint64 instruction, img_address m_pc)
+static char *ROUND_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.W.D %s, %s", ft, fs);
 }
@@ -12763,13 +12665,13 @@ static std::string ROUND_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string ROUND_W_S(uint64 instruction, img_address m_pc)
+static char *ROUND_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("ROUND.W.S %s, %s", ft, fs);
 }
@@ -12785,13 +12687,13 @@ static std::string ROUND_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RSQRT_D(uint64 instruction, img_address m_pc)
+static char *RSQRT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RSQRT.D %s, %s", ft, fs);
 }
@@ -12807,13 +12709,13 @@ static std::string RSQRT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string RSQRT_S(uint64 instruction, img_address m_pc)
+static char *RSQRT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("RSQRT.S %s, %s", ft, fs);
 }
@@ -12829,13 +12731,13 @@ static std::string RSQRT_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SAVE_16_(uint64 instruction, img_address m_pc)
+static char *SAVE_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt1_value = extract_rtl_11(instruction);
     uint64 u_value = extract_u_7_6_5_4__s4(instruction);
     uint64 count_value = extract_count_3_2_1_0(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    char *u = IMMEDIATE(copy(u_value));
     return img_format("SAVE %s%s", u,
         save_restore_list(encode_rt1_from_rt(rt1_value), count_value, 0));
 }
@@ -12851,14 +12753,14 @@ static std::string SAVE_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SAVE_32_(uint64 instruction, img_address m_pc)
+static char *SAVE_32_(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
     uint64 gp_value = extract_gp_2(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
+    char *u = IMMEDIATE(copy(u_value));
     return img_format("SAVE %s%s", u,
                save_restore_list(rt_value, count_value, gp_value));
 }
@@ -12874,13 +12776,13 @@ static std::string SAVE_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SAVEF(uint64 instruction, img_address m_pc)
+static char *SAVEF(uint64 instruction, img_address m_pc)
 {
     uint64 count_value = extract_count_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string count = IMMEDIATE(copy(count_value));
+    char *u = IMMEDIATE(copy(u_value));
+    char *count = IMMEDIATE(copy(count_value));
 
     return img_format("SAVEF %s, %s", u, count);
 }
@@ -12896,15 +12798,15 @@ static std::string SAVEF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SB_16_(uint64 instruction, img_address m_pc)
+static char *SB_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_1_0(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SB %s, %s(%s)", rtz3, u, rs3);
 }
@@ -12920,13 +12822,13 @@ static std::string SB_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SB_GP_(uint64 instruction, img_address m_pc)
+static char *SB_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SB %s, %s($%d)", rt, u, 28);
 }
@@ -12942,15 +12844,15 @@ static std::string SB_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SB_S9_(uint64 instruction, img_address m_pc)
+static char *SB_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, s, rs);
 }
@@ -12966,15 +12868,15 @@ static std::string SB_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SB_U12_(uint64 instruction, img_address m_pc)
+static char *SB_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SB %s, %s(%s)", rt, u, rs);
 }
@@ -12990,15 +12892,15 @@ static std::string SB_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SBE(uint64 instruction, img_address m_pc)
+static char *SBE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SBE %s, %s(%s)", rt, s, rs);
 }
@@ -13014,15 +12916,15 @@ static std::string SBE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SBX(uint64 instruction, img_address m_pc)
+static char *SBX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SBX %s, %s(%s)", rd, rs, rt);
 }
@@ -13038,15 +12940,15 @@ static std::string SBX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SC(uint64 instruction, img_address m_pc)
+static char *SC(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SC %s, %s(%s)", rt, s, rs);
 }
@@ -13062,15 +12964,15 @@ static std::string SC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SCD(uint64 instruction, img_address m_pc)
+static char *SCD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCD %s, %s(%s)", rt, s, rs);
 }
@@ -13086,15 +12988,15 @@ static std::string SCD(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SCDP(uint64 instruction, img_address m_pc)
+static char *SCDP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCDP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13110,15 +13012,15 @@ static std::string SCDP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SCE(uint64 instruction, img_address m_pc)
+static char *SCE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCE %s, %s(%s)", rt, s, rs);
 }
@@ -13134,15 +13036,15 @@ static std::string SCE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SCWP(uint64 instruction, img_address m_pc)
+static char *SCWP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCWP %s, %s, (%s)", rt, ru, rs);
 }
@@ -13158,15 +13060,15 @@ static std::string SCWP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SCWPE(uint64 instruction, img_address m_pc)
+static char *SCWPE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ru_value = extract_ru_7_6_5_4_3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string ru = GPR(copy(ru_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *ru = GPR(copy(ru_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SCWPE %s, %s, (%s)", rt, ru, rs);
 }
@@ -13182,13 +13084,13 @@ static std::string SCWPE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SD_GP_(uint64 instruction, img_address m_pc)
+static char *SD_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_3__s3(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SD %s, %s($%d)", rt, u, 28);
 }
@@ -13204,15 +13106,15 @@ static std::string SD_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SD_S9_(uint64 instruction, img_address m_pc)
+static char *SD_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, s, rs);
 }
@@ -13228,15 +13130,15 @@ static std::string SD_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SD_U12_(uint64 instruction, img_address m_pc)
+static char *SD_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SD %s, %s(%s)", rt, u, rs);
 }
@@ -13252,11 +13154,11 @@ static std::string SD_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDBBP_16_(uint64 instruction, img_address m_pc)
+static char *SDBBP_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_2_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13272,11 +13174,11 @@ static std::string SDBBP_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDBBP_32_(uint64 instruction, img_address m_pc)
+static char *SDBBP_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SDBBP %s", code);
 }
@@ -13292,13 +13194,13 @@ static std::string SDBBP_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_GP_(uint64 instruction, img_address m_pc)
+static char *SDC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SDC1 %s, %s($%d)", ft, u, 28);
 }
@@ -13314,15 +13216,15 @@ static std::string SDC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_S9_(uint64 instruction, img_address m_pc)
+static char *SDC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, s, rs);
 }
@@ -13338,15 +13240,15 @@ static std::string SDC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1_U12_(uint64 instruction, img_address m_pc)
+static char *SDC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC1 %s, %s(%s)", ft, u, rs);
 }
@@ -13362,15 +13264,15 @@ static std::string SDC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1X(uint64 instruction, img_address m_pc)
+static char *SDC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -13386,15 +13288,15 @@ static std::string SDC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDC1XS(uint64 instruction, img_address m_pc)
+static char *SDC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -13410,15 +13312,15 @@ static std::string SDC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDC2(uint64 instruction, img_address m_pc)
+static char *SDC2(uint64 instruction, img_address m_pc)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *cs = CPR(copy(cs_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SDC2 %s, %s(%s)", cs, s, rs);
 }
@@ -13434,17 +13336,17 @@ static std::string SDC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDM(uint64 instruction, img_address m_pc)
+static char *SDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -13460,13 +13362,13 @@ static std::string SDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDPC_48_(uint64 instruction, img_address m_pc)
+static char *SDPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SDPC %s, %s", rt, s);
 }
@@ -13482,15 +13384,15 @@ static std::string SDPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDXS(uint64 instruction, img_address m_pc)
+static char *SDXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDXS %s, %s(%s)", rd, rs, rt);
 }
@@ -13506,15 +13408,15 @@ static std::string SDXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SDX(uint64 instruction, img_address m_pc)
+static char *SDX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SDX %s, %s(%s)", rd, rs, rt);
 }
@@ -13530,13 +13432,13 @@ static std::string SDX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SEB(uint64 instruction, img_address m_pc)
+static char *SEB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SEB %s, %s", rt, rs);
 }
@@ -13552,13 +13454,13 @@ static std::string SEB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SEH(uint64 instruction, img_address m_pc)
+static char *SEH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SEH %s, %s", rt, rs);
 }
@@ -13574,15 +13476,15 @@ static std::string SEH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SEL_D(uint64 instruction, img_address m_pc)
+static char *SEL_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SEL.D %s, %s, %s", fd, fs, ft);
 }
@@ -13598,15 +13500,15 @@ static std::string SEL_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SEL_S(uint64 instruction, img_address m_pc)
+static char *SEL_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SEL.S %s, %s, %s", fd, fs, ft);
 }
@@ -13622,15 +13524,15 @@ static std::string SEL_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SELEQZ_D(uint64 instruction, img_address m_pc)
+static char *SELEQZ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELEQZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13646,15 +13548,15 @@ static std::string SELEQZ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SELEQZ_S(uint64 instruction, img_address m_pc)
+static char *SELEQZ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELEQZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13670,15 +13572,15 @@ static std::string SELEQZ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SELNEZ_D(uint64 instruction, img_address m_pc)
+static char *SELNEZ_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELNEZ.D %s, %s, %s", fd, fs, ft);
 }
@@ -13694,15 +13596,15 @@ static std::string SELNEZ_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SELNEZ_S(uint64 instruction, img_address m_pc)
+static char *SELNEZ_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SELNEZ.S %s, %s, %s", fd, fs, ft);
 }
@@ -13718,15 +13620,15 @@ static std::string SELNEZ_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SEQI(uint64 instruction, img_address m_pc)
+static char *SEQI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SEQI %s, %s, %s", rt, rs, u);
 }
@@ -13742,15 +13644,15 @@ static std::string SEQI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SH_16_(uint64 instruction, img_address m_pc)
+static char *SH_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_2_1__s1(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SH %s, %s(%s)", rtz3, u, rs3);
 }
@@ -13766,13 +13668,13 @@ static std::string SH_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SH_GP_(uint64 instruction, img_address m_pc)
+static char *SH_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_1__s1(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SH %s, %s($%d)", rt, u, 28);
 }
@@ -13788,15 +13690,15 @@ static std::string SH_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SH_S9_(uint64 instruction, img_address m_pc)
+static char *SH_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, s, rs);
 }
@@ -13812,15 +13714,15 @@ static std::string SH_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SH_U12_(uint64 instruction, img_address m_pc)
+static char *SH_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SH %s, %s(%s)", rt, u, rs);
 }
@@ -13836,15 +13738,15 @@ static std::string SH_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHE(uint64 instruction, img_address m_pc)
+static char *SHE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHE %s, %s(%s)", rt, s, rs);
 }
@@ -13860,13 +13762,13 @@ static std::string SHE(uint64 instruction, img_address m_pc)
  *      shift ------
  *               ac --
  */
-static std::string SHILO(uint64 instruction, img_address m_pc)
+static char *SHILO(uint64 instruction, img_address m_pc)
 {
     int64 shift_value = extract_shift__se5_21_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string shift = IMMEDIATE(copy(shift_value));
-    std::string ac = AC(copy(ac_value));
+    char *shift = IMMEDIATE(copy(shift_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("SHILO %s, %s", ac, shift);
 }
@@ -13882,13 +13784,13 @@ static std::string SHILO(uint64 instruction, img_address m_pc)
  *          rs -----
  *               ac --
  */
-static std::string SHILOV(uint64 instruction, img_address m_pc)
+static char *SHILOV(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ac_value = extract_ac_15_14(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string ac = AC(copy(ac_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *ac = AC(copy(ac_value));
 
     return img_format("SHILOV %s, %s", ac, rs);
 }
@@ -13904,15 +13806,15 @@ static std::string SHILOV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-static std::string SHLL_PH(uint64 instruction, img_address m_pc)
+static char *SHLL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13928,15 +13830,15 @@ static std::string SHLL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ---
  */
-static std::string SHLL_QB(uint64 instruction, img_address m_pc)
+static char *SHLL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -13953,15 +13855,15 @@ static std::string SHLL_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-static std::string SHLL_S_PH(uint64 instruction, img_address m_pc)
+static char *SHLL_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL_S.PH %s, %s, %s", rt, rs, sa);
 }
@@ -13977,15 +13879,15 @@ static std::string SHLL_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa -----
  */
-static std::string SHLL_S_W(uint64 instruction, img_address m_pc)
+static char *SHLL_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHLL_S.W %s, %s, %s", rt, rs, sa);
 }
@@ -14002,15 +13904,15 @@ static std::string SHLL_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_PH(uint64 instruction, img_address m_pc)
+static char *SHLLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14026,15 +13928,15 @@ static std::string SHLLV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_QB(uint64 instruction, img_address m_pc)
+static char *SHLLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14051,15 +13953,15 @@ static std::string SHLLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_S_PH(uint64 instruction, img_address m_pc)
+static char *SHLLV_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV_S.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14075,15 +13977,15 @@ static std::string SHLLV_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHLLV_S_W(uint64 instruction, img_address m_pc)
+static char *SHLLV_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHLLV_S.W %s, %s, %s", rd, rt, rs);
 }
@@ -14099,15 +14001,15 @@ static std::string SHLLV_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_PH(uint64 instruction, img_address m_pc)
+static char *SHRA_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14123,15 +14025,15 @@ static std::string SHRA_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_QB(uint64 instruction, img_address m_pc)
+static char *SHRA_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14147,15 +14049,15 @@ static std::string SHRA_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_PH(uint64 instruction, img_address m_pc)
+static char *SHRA_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14171,15 +14073,15 @@ static std::string SHRA_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_QB(uint64 instruction, img_address m_pc)
+static char *SHRA_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14195,15 +14097,15 @@ static std::string SHRA_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRA_R_W(uint64 instruction, img_address m_pc)
+static char *SHRA_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12_11(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRA_R.W %s, %s, %s", rt, rs, sa);
 }
@@ -14219,15 +14121,15 @@ static std::string SHRA_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_PH(uint64 instruction, img_address m_pc)
+static char *SHRAV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14243,15 +14145,15 @@ static std::string SHRAV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_QB(uint64 instruction, img_address m_pc)
+static char *SHRAV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14267,15 +14169,15 @@ static std::string SHRAV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_PH(uint64 instruction, img_address m_pc)
+static char *SHRAV_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV_R.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14291,15 +14193,15 @@ static std::string SHRAV_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_QB(uint64 instruction, img_address m_pc)
+static char *SHRAV_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV_R.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14315,15 +14217,15 @@ static std::string SHRAV_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRAV_R_W(uint64 instruction, img_address m_pc)
+static char *SHRAV_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRAV_R.W %s, %s, %s", rd, rt, rs);
 }
@@ -14339,15 +14241,15 @@ static std::string SHRAV_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ----
  */
-static std::string SHRL_PH(uint64 instruction, img_address m_pc)
+static char *SHRL_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRL.PH %s, %s, %s", rt, rs, sa);
 }
@@ -14363,15 +14265,15 @@ static std::string SHRL_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               sa ---
  */
-static std::string SHRL_QB(uint64 instruction, img_address m_pc)
+static char *SHRL_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 sa_value = extract_sa_15_14_13(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string sa = IMMEDIATE(copy(sa_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *sa = IMMEDIATE(copy(sa_value));
 
     return img_format("SHRL.QB %s, %s, %s", rt, rs, sa);
 }
@@ -14388,15 +14290,15 @@ static std::string SHRL_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRLV_PH(uint64 instruction, img_address m_pc)
+static char *SHRLV_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRLV.PH %s, %s, %s", rd, rt, rs);
 }
@@ -14412,15 +14314,15 @@ static std::string SHRLV_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHRLV_QB(uint64 instruction, img_address m_pc)
+static char *SHRLV_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SHRLV.QB %s, %s, %s", rd, rt, rs);
 }
@@ -14436,15 +14338,15 @@ static std::string SHRLV_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHX(uint64 instruction, img_address m_pc)
+static char *SHX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SHX %s, %s(%s)", rd, rs, rt);
 }
@@ -14460,15 +14362,15 @@ static std::string SHX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SHXS(uint64 instruction, img_address m_pc)
+static char *SHXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SHXS %s, %s(%s)", rd, rs, rt);
 }
@@ -14484,11 +14386,11 @@ static std::string SHXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SIGRIE(uint64 instruction, img_address m_pc)
+static char *SIGRIE(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_18_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SIGRIE %s", code);
 }
@@ -14504,15 +14406,15 @@ static std::string SIGRIE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SLL_16_(uint64 instruction, img_address m_pc)
+static char *SLL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SLL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14528,15 +14430,15 @@ static std::string SLL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SLL_32_(uint64 instruction, img_address m_pc)
+static char *SLL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SLL %s, %s, %s", rt, rs, shift);
 }
@@ -14552,15 +14454,15 @@ static std::string SLL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SLLV(uint64 instruction, img_address m_pc)
+static char *SLLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SLLV %s, %s, %s", rd, rs, rt);
 }
@@ -14576,15 +14478,15 @@ static std::string SLLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SLT(uint64 instruction, img_address m_pc)
+static char *SLT(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SLT %s, %s, %s", rd, rs, rt);
 }
@@ -14600,15 +14502,15 @@ static std::string SLT(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SLTI(uint64 instruction, img_address m_pc)
+static char *SLTI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SLTI %s, %s, %s", rt, rs, u);
 }
@@ -14624,15 +14526,15 @@ static std::string SLTI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SLTIU(uint64 instruction, img_address m_pc)
+static char *SLTIU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SLTIU %s, %s, %s", rt, rs, u);
 }
@@ -14648,15 +14550,15 @@ static std::string SLTIU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SLTU(uint64 instruction, img_address m_pc)
+static char *SLTU(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SLTU %s, %s, %s", rd, rs, rt);
 }
@@ -14672,15 +14574,15 @@ static std::string SLTU(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SOV(uint64 instruction, img_address m_pc)
+static char *SOV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SOV %s, %s, %s", rd, rs, rt);
 }
@@ -14696,11 +14598,11 @@ static std::string SOV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SPECIAL2(uint64 instruction, img_address m_pc)
+static char *SPECIAL2(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    char *op = IMMEDIATE(copy(op_value));
 
     return img_format("SPECIAL2 %s", op);
 }
@@ -14716,13 +14618,13 @@ static std::string SPECIAL2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SQRT_D(uint64 instruction, img_address m_pc)
+static char *SQRT_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("SQRT.D %s, %s", ft, fs);
 }
@@ -14738,13 +14640,13 @@ static std::string SQRT_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SQRT_S(uint64 instruction, img_address m_pc)
+static char *SQRT_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("SQRT.S %s, %s", ft, fs);
 }
@@ -14760,15 +14662,15 @@ static std::string SQRT_S(uint64 instruction, img_address m_pc)
  *               rd -----
  *                    sa -----
  */
-static std::string SRA(uint64 instruction, img_address m_pc)
+static char *SRA(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SRA %s, %s, %s", rt, rs, shift);
 }
@@ -14784,15 +14686,15 @@ static std::string SRA(uint64 instruction, img_address m_pc)
  *          rt -----
  *               rd -----
  */
-static std::string SRAV(uint64 instruction, img_address m_pc)
+static char *SRAV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SRAV %s, %s, %s", rd, rs, rt);
 }
@@ -14808,15 +14710,15 @@ static std::string SRAV(uint64 instruction, img_address m_pc)
  *          rt -----
  *               rd -----
  */
-static std::string SRL_16_(uint64 instruction, img_address m_pc)
+static char *SRL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 shift3_value = extract_shift3_2_1_0(instruction);
 
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    char *shift3 = IMMEDIATE(encode_shift3_from_shift(shift3_value));
 
     return img_format("SRL %s, %s, %s", rt3, rs3, shift3);
 }
@@ -14832,15 +14734,15 @@ static std::string SRL_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SRL_32_(uint64 instruction, img_address m_pc)
+static char *SRL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 shift_value = extract_shift_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string shift = IMMEDIATE(copy(shift_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *shift = IMMEDIATE(copy(shift_value));
 
     return img_format("SRL %s, %s, %s", rt, rs, shift);
 }
@@ -14856,15 +14758,15 @@ static std::string SRL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SRLV(uint64 instruction, img_address m_pc)
+static char *SRLV(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SRLV %s, %s, %s", rd, rs, rt);
 }
@@ -14880,15 +14782,15 @@ static std::string SRLV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUB(uint64 instruction, img_address m_pc)
+static char *SUB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUB %s, %s, %s", rd, rs, rt);
 }
@@ -14904,15 +14806,15 @@ static std::string SUB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUB_D(uint64 instruction, img_address m_pc)
+static char *SUB_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SUB.D %s, %s, %s", fd, fs, ft);
 }
@@ -14928,15 +14830,15 @@ static std::string SUB_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUB_S(uint64 instruction, img_address m_pc)
+static char *SUB_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
     uint64 fd_value = extract_fd_15_14_13_12_11(instruction);
 
-    std::string fd = FPR(copy(fd_value));
-    std::string fs = FPR(copy(fs_value));
-    std::string ft = FPR(copy(ft_value));
+    const char *fd = FPR(copy(fd_value));
+    const char *fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
 
     return img_format("SUB.S %s, %s, %s", fd, fs, ft);
 }
@@ -14952,15 +14854,15 @@ static std::string SUB_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_PH(uint64 instruction, img_address m_pc)
+static char *SUBQ_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQ.PH %s, %s, %s", rd, rs, rt);
 }
@@ -14977,15 +14879,15 @@ static std::string SUBQ_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_S_PH(uint64 instruction, img_address m_pc)
+static char *SUBQ_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQ_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15002,15 +14904,15 @@ static std::string SUBQ_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQ_S_W(uint64 instruction, img_address m_pc)
+static char *SUBQ_S_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQ_S.W %s, %s, %s", rd, rs, rt);
 }
@@ -15027,15 +14929,15 @@ static std::string SUBQ_S_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_PH(uint64 instruction, img_address m_pc)
+static char *SUBQH_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15052,15 +14954,15 @@ static std::string SUBQH_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_R_PH(uint64 instruction, img_address m_pc)
+static char *SUBQH_R_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH_R.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15077,15 +14979,15 @@ static std::string SUBQH_R_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_R_W(uint64 instruction, img_address m_pc)
+static char *SUBQH_R_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH_R.W %s, %s, %s", rd, rs, rt);
 }
@@ -15102,15 +15004,15 @@ static std::string SUBQH_R_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBQH_W(uint64 instruction, img_address m_pc)
+static char *SUBQH_W(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBQH.W %s, %s, %s", rd, rs, rt);
 }
@@ -15126,15 +15028,15 @@ static std::string SUBQH_W(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_16_(uint64 instruction, img_address m_pc)
+static char *SUBU_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 rd3_value = extract_rd3_3_2_1(instruction);
 
-    std::string rd3 = GPR(decode_gpr_gpr3(rd3_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rd3 = GPR(decode_gpr_gpr3(rd3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("SUBU %s, %s, %s", rd3, rs3, rt3);
 }
@@ -15150,15 +15052,15 @@ static std::string SUBU_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_32_(uint64 instruction, img_address m_pc)
+static char *SUBU_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU %s, %s, %s", rd, rs, rt);
 }
@@ -15174,15 +15076,15 @@ static std::string SUBU_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_PH(uint64 instruction, img_address m_pc)
+static char *SUBU_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15198,15 +15100,15 @@ static std::string SUBU_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_QB(uint64 instruction, img_address m_pc)
+static char *SUBU_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15223,15 +15125,15 @@ static std::string SUBU_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_S_PH(uint64 instruction, img_address m_pc)
+static char *SUBU_S_PH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU_S.PH %s, %s, %s", rd, rs, rt);
 }
@@ -15248,15 +15150,15 @@ static std::string SUBU_S_PH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBU_S_QB(uint64 instruction, img_address m_pc)
+static char *SUBU_S_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBU_S.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15273,15 +15175,15 @@ static std::string SUBU_S_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBUH_QB(uint64 instruction, img_address m_pc)
+static char *SUBUH_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBUH.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15298,15 +15200,15 @@ static std::string SUBUH_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SUBUH_R_QB(uint64 instruction, img_address m_pc)
+static char *SUBUH_R_QB(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SUBUH_R.QB %s, %s, %s", rd, rs, rt);
 }
@@ -15322,15 +15224,15 @@ static std::string SUBUH_R_QB(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SW_16_(uint64 instruction, img_address m_pc)
+static char *SW_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
     uint64 u_value = extract_u_3_2_1_0__s2(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
 
     return img_format("SW %s, %s(%s)", rtz3, u, rs3);
 }
@@ -15346,15 +15248,15 @@ static std::string SW_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SW_4X4_(uint64 instruction, img_address m_pc)
+static char *SW_4X4_(uint64 instruction, img_address m_pc)
 {
     uint64 rtz4_value = extract_rtz4_9_7_6_5(instruction);
     uint64 rs4_value = extract_rs4_4_2_1_0(instruction);
     uint64 u_value = extract_u_3_8__s2(instruction);
 
-    std::string rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs4 = GPR(decode_gpr_gpr4(rs4_value));
+    const char *rtz4 = GPR(decode_gpr_gpr4_zero(rtz4_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs4 = GPR(decode_gpr_gpr4(rs4_value));
 
     return img_format("SW %s, %s(%s)", rtz4, u, rs4);
 }
@@ -15370,13 +15272,13 @@ static std::string SW_4X4_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SW_GP16_(uint64 instruction, img_address m_pc)
+static char *SW_GP16_(uint64 instruction, img_address m_pc)
 {
     uint64 u_value = extract_u_6_5_4_3_2_1_0__s2(instruction);
     uint64 rtz3_value = extract_rtz3_9_8_7(instruction);
 
-    std::string rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rtz3 = GPR(decode_gpr_gpr3_src_store(rtz3_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rtz3, u, 28);
 }
@@ -15392,13 +15294,13 @@ static std::string SW_GP16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SW_GP_(uint64 instruction, img_address m_pc)
+static char *SW_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_20_to_2__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 28);
 }
@@ -15414,15 +15316,15 @@ static std::string SW_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SW_S9_(uint64 instruction, img_address m_pc)
+static char *SW_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, s, rs);
 }
@@ -15438,13 +15340,13 @@ static std::string SW_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SW_SP_(uint64 instruction, img_address m_pc)
+static char *SW_SP_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_9_8_7_6_5(instruction);
     uint64 u_value = extract_u_4_3_2_1_0__s2(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SW %s, %s($%d)", rt, u, 29);
 }
@@ -15460,15 +15362,15 @@ static std::string SW_SP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SW_U12_(uint64 instruction, img_address m_pc)
+static char *SW_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SW %s, %s(%s)", rt, u, rs);
 }
@@ -15484,13 +15386,13 @@ static std::string SW_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_GP_(uint64 instruction, img_address m_pc)
+static char *SWC1_GP_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 u_value = extract_u_17_to_2__s2(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("SWC1 %s, %s($%d)", ft, u, 28);
 }
@@ -15506,15 +15408,15 @@ static std::string SWC1_GP_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_S9_(uint64 instruction, img_address m_pc)
+static char *SWC1_S9_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, s, rs);
 }
@@ -15530,15 +15432,15 @@ static std::string SWC1_S9_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1_U12_(uint64 instruction, img_address m_pc)
+static char *SWC1_U12_(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string u = IMMEDIATE(copy(u_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *ft = FPR(copy(ft_value));
+    char *u = IMMEDIATE(copy(u_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC1 %s, %s(%s)", ft, u, rs);
 }
@@ -15554,15 +15456,15 @@ static std::string SWC1_U12_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1X(uint64 instruction, img_address m_pc)
+static char *SWC1X(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWC1X %s, %s(%s)", ft, rs, rt);
 }
@@ -15578,15 +15480,15 @@ static std::string SWC1X(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWC1XS(uint64 instruction, img_address m_pc)
+static char *SWC1XS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 ft_value = extract_ft_15_14_13_12_11(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWC1XS %s, %s(%s)", ft, rs, rt);
 }
@@ -15602,15 +15504,15 @@ static std::string SWC1XS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWC2(uint64 instruction, img_address m_pc)
+static char *SWC2(uint64 instruction, img_address m_pc)
 {
     uint64 cs_value = extract_cs_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string cs = CPR(copy(cs_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *cs = CPR(copy(cs_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWC2 %s, %s(%s)", cs, s, rs);
 }
@@ -15626,15 +15528,15 @@ static std::string SWC2(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWE(uint64 instruction, img_address m_pc)
+static char *SWE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SWE %s, %s(%s)", rt, s, rs);
 }
@@ -15650,17 +15552,17 @@ static std::string SWE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWM(uint64 instruction, img_address m_pc)
+static char *SWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("SWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -15676,13 +15578,13 @@ static std::string SWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWPC_48_(uint64 instruction, img_address m_pc)
+static char *SWPC_48_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_41_40_39_38_37(instruction);
     int64 s_value = extract_s__se31_15_to_0_31_to_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
+    const char *rt = GPR(copy(rt_value));
+    char *s = ADDRESS(encode_s_from_address(s_value), 6, m_pc);
 
     return img_format("SWPC %s, %s", rt, s);
 }
@@ -15698,15 +15600,15 @@ static std::string SWPC_48_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWX(uint64 instruction, img_address m_pc)
+static char *SWX(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWX %s, %s(%s)", rd, rs, rt);
 }
@@ -15722,15 +15624,15 @@ static std::string SWX(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SWXS(uint64 instruction, img_address m_pc)
+static char *SWXS(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("SWXS %s, %s(%s)", rd, rs, rt);
 }
@@ -15746,11 +15648,11 @@ static std::string SWXS(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SYNC(uint64 instruction, img_address m_pc)
+static char *SYNC(uint64 instruction, img_address m_pc)
 {
     uint64 stype_value = extract_stype_20_19_18_17_16(instruction);
 
-    std::string stype = IMMEDIATE(copy(stype_value));
+    char *stype = IMMEDIATE(copy(stype_value));
 
     return img_format("SYNC %s", stype);
 }
@@ -15766,13 +15668,13 @@ static std::string SYNC(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SYNCI(uint64 instruction, img_address m_pc)
+static char *SYNCI(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SYNCI %s(%s)", s, rs);
 }
@@ -15788,13 +15690,13 @@ static std::string SYNCI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SYNCIE(uint64 instruction, img_address m_pc)
+static char *SYNCIE(uint64 instruction, img_address m_pc)
 {
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("SYNCIE %s(%s)", s, rs);
 }
@@ -15810,11 +15712,11 @@ static std::string SYNCIE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string SYSCALL_16_(uint64 instruction, img_address m_pc)
+static char *SYSCALL_16_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_1_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15828,11 +15730,11 @@ static std::string SYSCALL_16_(uint64 instruction, img_address m_pc)
  *  00000000000010
  *           code ------------------
  */
-static std::string SYSCALL_32_(uint64 instruction, img_address m_pc)
+static char *SYSCALL_32_(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_17_to_0(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("SYSCALL %s", code);
 }
@@ -15848,13 +15750,13 @@ static std::string SYSCALL_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TEQ(uint64 instruction, img_address m_pc)
+static char *TEQ(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("TEQ %s, %s", rs, rt);
 }
@@ -15870,11 +15772,11 @@ static std::string TEQ(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGINV(uint64 instruction, img_address m_pc)
+static char *TLBGINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBGINV ";
+    return (char *)"TLBGINV ";
 }
 
 
@@ -15888,11 +15790,11 @@ static std::string TLBGINV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGINVF(uint64 instruction, img_address m_pc)
+static char *TLBGINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBGINVF ";
+    return (char *)"TLBGINVF ";
 }
 
 
@@ -15906,11 +15808,11 @@ static std::string TLBGINVF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGP(uint64 instruction, img_address m_pc)
+static char *TLBGP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBGP ";
+    return (char *)"TLBGP ";
 }
 
 
@@ -15924,11 +15826,11 @@ static std::string TLBGP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGR(uint64 instruction, img_address m_pc)
+static char *TLBGR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBGR ";
+    return (char *)"TLBGR ";
 }
 
 
@@ -15942,11 +15844,11 @@ static std::string TLBGR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGWI(uint64 instruction, img_address m_pc)
+static char *TLBGWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBGWI ";
+    return (char *)"TLBGWI ";
 }
 
 
@@ -15960,11 +15862,11 @@ static std::string TLBGWI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBGWR(uint64 instruction, img_address m_pc)
+static char *TLBGWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBGWR ";
+    return (char *)"TLBGWR ";
 }
 
 
@@ -15978,11 +15880,11 @@ static std::string TLBGWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBINV(uint64 instruction, img_address m_pc)
+static char *TLBINV(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBINV ";
+    return (char *)"TLBINV ";
 }
 
 
@@ -15996,11 +15898,11 @@ static std::string TLBINV(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBINVF(uint64 instruction, img_address m_pc)
+static char *TLBINVF(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBINVF ";
+    return (char *)"TLBINVF ";
 }
 
 
@@ -16014,11 +15916,11 @@ static std::string TLBINVF(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBP(uint64 instruction, img_address m_pc)
+static char *TLBP(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBP ";
+    return (char *)"TLBP ";
 }
 
 
@@ -16032,11 +15934,11 @@ static std::string TLBP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBR(uint64 instruction, img_address m_pc)
+static char *TLBR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBR ";
+    return (char *)"TLBR ";
 }
 
 
@@ -16050,11 +15952,11 @@ static std::string TLBR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBWI(uint64 instruction, img_address m_pc)
+static char *TLBWI(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBWI ";
+    return (char *)"TLBWI ";
 }
 
 
@@ -16068,11 +15970,11 @@ static std::string TLBWI(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TLBWR(uint64 instruction, img_address m_pc)
+static char *TLBWR(uint64 instruction, img_address m_pc)
 {
     (void)instruction;
 
-    return "TLBWR ";
+    return (char *)"TLBWR ";
 }
 
 
@@ -16086,13 +15988,13 @@ static std::string TLBWR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TNE(uint64 instruction, img_address m_pc)
+static char *TNE(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("TNE %s, %s", rs, rt);
 }
@@ -16108,13 +16010,13 @@ static std::string TNE(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_L_D(uint64 instruction, img_address m_pc)
+static char *TRUNC_L_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.L.D %s, %s", ft, fs);
 }
@@ -16130,13 +16032,13 @@ static std::string TRUNC_L_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_L_S(uint64 instruction, img_address m_pc)
+static char *TRUNC_L_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.L.S %s, %s", ft, fs);
 }
@@ -16152,13 +16054,13 @@ static std::string TRUNC_L_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_W_D(uint64 instruction, img_address m_pc)
+static char *TRUNC_W_D(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.W.D %s, %s", ft, fs);
 }
@@ -16174,13 +16076,13 @@ static std::string TRUNC_W_D(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string TRUNC_W_S(uint64 instruction, img_address m_pc)
+static char *TRUNC_W_S(uint64 instruction, img_address m_pc)
 {
     uint64 ft_value = extract_ft_25_24_23_22_21(instruction);
     uint64 fs_value = extract_fs_20_19_18_17_16(instruction);
 
-    std::string ft = FPR(copy(ft_value));
-    std::string fs = FPR(copy(fs_value));
+    const char *ft = FPR(copy(ft_value));
+    const char *fs = FPR(copy(fs_value));
 
     return img_format("TRUNC.W.S %s, %s", ft, fs);
 }
@@ -16196,17 +16098,17 @@ static std::string TRUNC_W_S(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string UALDM(uint64 instruction, img_address m_pc)
+static char *UALDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16222,15 +16124,15 @@ static std::string UALDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string UALH(uint64 instruction, img_address m_pc)
+static char *UALH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("UALH %s, %s(%s)", rt, s, rs);
 }
@@ -16246,17 +16148,17 @@ static std::string UALH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string UALWM(uint64 instruction, img_address m_pc)
+static char *UALWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UALWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16272,17 +16174,17 @@ static std::string UALWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string UASDM(uint64 instruction, img_address m_pc)
+static char *UASDM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASDM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16298,15 +16200,15 @@ static std::string UASDM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string UASH(uint64 instruction, img_address m_pc)
+static char *UASH(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("UASH %s, %s(%s)", rt, s, rs);
 }
@@ -16322,17 +16224,17 @@ static std::string UASH(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string UASWM(uint64 instruction, img_address m_pc)
+static char *UASWM(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
     uint64 count3_value = extract_count3_14_13_12(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string s = IMMEDIATE(copy(s_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string count3 = IMMEDIATE(encode_count3_from_count(count3_value));
+    const char *rt = GPR(copy(rt_value));
+    char *s = IMMEDIATE(copy(s_value));
+    const char *rs = GPR(copy(rs_value));
+    char *count3 = IMMEDIATE(encode_count3_from_count(count3_value));
 
     return img_format("UASWM %s, %s(%s), %s", rt, s, rs, count3);
 }
@@ -16348,11 +16250,11 @@ static std::string UASWM(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string UDI(uint64 instruction, img_address m_pc)
+static char *UDI(uint64 instruction, img_address m_pc)
 {
     uint64 op_value = extract_op_25_to_3(instruction);
 
-    std::string op = IMMEDIATE(copy(op_value));
+    char *op = IMMEDIATE(copy(op_value));
 
     return img_format("UDI %s", op);
 }
@@ -16366,11 +16268,11 @@ static std::string UDI(uint64 instruction, img_address m_pc)
  *  001000          1100001101111111
  *   code ----------
  */
-static std::string WAIT(uint64 instruction, img_address m_pc)
+static char *WAIT(uint64 instruction, img_address m_pc)
 {
     uint64 code_value = extract_code_25_24_23_22_21_20_19_18_17_16(instruction);
 
-    std::string code = IMMEDIATE(copy(code_value));
+    char *code = IMMEDIATE(copy(code_value));
 
     return img_format("WAIT %s", code);
 }
@@ -16386,13 +16288,13 @@ static std::string WAIT(uint64 instruction, img_address m_pc)
  *     rt -----
  *        mask -------
  */
-static std::string WRDSP(uint64 instruction, img_address m_pc)
+static char *WRDSP(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 mask_value = extract_mask_20_19_18_17_16_15_14(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string mask = IMMEDIATE(copy(mask_value));
+    const char *rt = GPR(copy(rt_value));
+    char *mask = IMMEDIATE(copy(mask_value));
 
     return img_format("WRDSP %s, %s", rt, mask);
 }
@@ -16408,13 +16310,13 @@ static std::string WRDSP(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string WRPGPR(uint64 instruction, img_address m_pc)
+static char *WRPGPR(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("WRPGPR %s, %s", rt, rs);
 }
@@ -16430,13 +16332,13 @@ static std::string WRPGPR(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string XOR_16_(uint64 instruction, img_address m_pc)
+static char *XOR_16_(uint64 instruction, img_address m_pc)
 {
     uint64 rt3_value = extract_rt3_9_8_7(instruction);
     uint64 rs3_value = extract_rs3_6_5_4(instruction);
 
-    std::string rs3 = GPR(decode_gpr_gpr3(rs3_value));
-    std::string rt3 = GPR(decode_gpr_gpr3(rt3_value));
+    const char *rs3 = GPR(decode_gpr_gpr3(rs3_value));
+    const char *rt3 = GPR(decode_gpr_gpr3(rt3_value));
 
     return img_format("XOR %s, %s", rs3, rt3);
 }
@@ -16452,15 +16354,15 @@ static std::string XOR_16_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string XOR_32_(uint64 instruction, img_address m_pc)
+static char *XOR_32_(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 rd_value = extract_rd_15_14_13_12_11(instruction);
 
-    std::string rd = GPR(copy(rd_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string rt = GPR(copy(rt_value));
+    const char *rd = GPR(copy(rd_value));
+    const char *rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
 
     return img_format("XOR %s, %s, %s", rd, rs, rt);
 }
@@ -16476,15 +16378,15 @@ static std::string XOR_32_(uint64 instruction, img_address m_pc)
  *          rs -----
  *               rd -----
  */
-static std::string XORI(uint64 instruction, img_address m_pc)
+static char *XORI(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3_2_1_0(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
-    std::string u = IMMEDIATE(copy(u_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
+    char *u = IMMEDIATE(copy(u_value));
 
     return img_format("XORI %s, %s, %s", rt, rs, u);
 }
@@ -16499,13 +16401,13 @@ static std::string XORI(uint64 instruction, img_address m_pc)
  *     rt -----
  *          rs -----
  */
-static std::string YIELD(uint64 instruction, img_address m_pc)
+static char *YIELD(uint64 instruction, img_address m_pc)
 {
     uint64 rt_value = extract_rt_25_24_23_22_21(instruction);
     uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
 
-    std::string rt = GPR(copy(rt_value));
-    std::string rs = GPR(copy(rs_value));
+    const char *rt = GPR(copy(rt_value));
+    const char *rs = GPR(copy(rs_value));
 
     return img_format("YIELD %s, %s", rt, rs);
 }
@@ -22308,7 +22210,7 @@ static struct Pool MAJOR[2] = {
        0x0                 },        /* P16 */
 };
 
-static int Disassemble(const uint16 *data, std::string & dis,
+static int Disassemble(const uint16 *data, char *dis,
                        TABLE_ENTRY_TYPE & type, img_address m_pc)
 {
     return Disassemble(data, dis, type, MAJOR, 2, m_pc);
@@ -22320,13 +22222,13 @@ static int nanomips_dis(char *buf,
                  unsigned short two,
                  unsigned short three)
 {
-    std::string disasm;
+    char disasm[200];
     uint16 bits[3] = {one, two, three};
 
     TABLE_ENTRY_TYPE type;
     int size = Disassemble(bits, disasm, type, address);
 
-    strcpy(buf, disasm.c_str());
+    strcpy(buf, disasm);
     return size;
 }
 
-- 
2.25.1


