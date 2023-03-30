Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2506D0C75
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 19:14:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phvqc-00044x-HS; Thu, 30 Mar 2023 13:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phvqa-00044i-NB
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:14:00 -0400
Received: from mail-sgaapc01olkn2082b.outbound.protection.outlook.com
 ([2a01:111:f400:feab::82b]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1phvqY-0006kV-Gk
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 13:13:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHf9rO2UW3c57NmOzIpy7HpWTreNKUUeWNIgcHbzG+IlvrcEV51mCZuh3VbF739M3IqOiGGNr07uQA+B0qmL1IrvmBf+5p6tHT6sXBbFKtOGRdoG1ycwN9T99YQv6rSa7bFCFPmJ6HLbicUFXnTVbUEGEq64Irap5edyzlnqo7XWSCswoInWi3lLh/iKFTCuuBxd9fA0Zq8IHP9tHmlW2woVeF45yrlkI4tMbqs3DSKe+MxnY33SU7K/+raQfx1yUJNYuxxwlmvptgosXcCDndgexjrJrCMDB1BMIQISTeg7Frdwndc385pDJwbQO7wxx9eE3EF38NT8KMbSWA9RBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiJsr9CPrbN55cMeg+aWTS6w64wRE8UZmMfkdXkbFkU=;
 b=T4Ns7eeIv6HIc8a0bj868J5ReXjkp+Q4cerg79W3J0GUdwBMrkRhDqgk35qAq5dESELiNvstc4JNB/KyvecIkOhKyePivcdxEz8U1wHKdTP4Q0ZCDC8o7l+FgMBzH9AwscPYt/j0bhYFN9SjMQEsKzx+e6FWE6ji1I8Xp78nSt9I2IQecp2+8Axvz0v0VRGNP3uAvvPcnm5IfNqRQlahN5AFE3DkMz9Lyt22OIUC8oGSkacp2XQOOsKbDfrMwE8w8drG4wJQ6VstJujQvZfgtTm6wo4npdhYu9d9zhJlW73d7M0XiuXWPvCgPEkTxjJICBXLITXHxzAl2WDHRnqfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by TY0PR06MB5331.apcprd06.prod.outlook.com (2603:1096:400:214::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 17:13:52 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::1c39:fb04:b3c2:5a26%2]) with mapi id 15.20.6222.034; Thu, 30 Mar 2023
 17:13:52 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Yohei Kojima <y-koj@outlook.jp>, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3 2/4] linux-user: replace strerror() function to the thread
 safe qemu_strerror()
Date: Fri, 31 Mar 2023 02:13:20 +0900
Message-ID: <TYZPR06MB54189ECF0D8E61A27274B7CE9D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
References: <TYZPR06MB5418D71BB6F2BBFD80C01E559D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [VpntekuQoZnCvNyIzfe0fkI/t9Gu42ZzdxCvMZue9n4WrmWxlHn7d79w22JU1BJK]
X-ClientProxiedBy: TYCP286CA0133.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::20) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <5c57a76488a9a5607fdbdd750e29478903d98df7.1680195348.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|TY0PR06MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: f245b35c-a928-4489-3288-08db314222df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XDuGBUGhqeClUvPbGNmHcBxxnl5A0Vbnzg3vQKufnXtY02QmpIoWV9gTyXUPqBzQW+Mi4zzhmpF3lkZZEZXao8n4rR82w2dMijdUr9yW3H28LV8fPPCu2D/t/gY9BvigiXYsyvbL6chdFMViwKnK7bTIc3rJe0pLfApfcO4ffKskvlyaB1s4M17jrgmkPSRaReFhU/AAqNkjyT+8OkKNZukDRD31iy9NY6LlCTRZ2nOg27mPBoi09WgMHt4a7BZdscTlLLB9qe5ZYrLJCjwFwsSYhQOJK/qoMGmaIfD2a7sL+17yRUemyZrRKvMMIS0xS1dKtbW3+D80zvjiJQiqo+yrU4Zj9znG73jQYsgIE+pH0DU5H+/lfojE6Upiyz/ktDaErE3QVSVVU6JcKGAkkeb9kCndbsru41nvkDXBJtuU12nYJkN7GsrdfaCxNVINk2s6Ny1QvxgR86YGZeC5KmDF0eBJC/It6XGz5NdYw+34pFpcpJoc2kGel9IOZYM9RDxaYIcdo3Cwnu8XkO4KCzzqI89HY8E7HWoVriiP6ky/Wav75R6Dosmdvd6duGZKRNXAXUpNi6RCFm0W0mZboBIp6nopDLc5s5DtCEX/6sM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklWZ0JNVERjQTZRQS8vU21qSDZud2tFbHhrbmJueksvRHZXWS9teHRmNEEw?=
 =?utf-8?B?bGZRRGV1bjJoWDYxZVFnb3BrQWFTOTlBNjRlcllkMVRRbjViY0pGcDVGOStt?=
 =?utf-8?B?dHNtd3NVQW5xZ3lsSWxtNTNmZGQ2TS93THhWRUR0SU02UGdWaTBoWG9WNDNS?=
 =?utf-8?B?VzdJY1R2VkprYnNPVUNyci9PM0ZYSEZTUkVvVkdLTXAwa2UwMVJhZHkrWHpo?=
 =?utf-8?B?NnlYMXhOTGpkR1doTVJ1T0ZxclRuUy8rbjdPL005T0ZMRW9qbG9JOHBabHhw?=
 =?utf-8?B?V0l5Q053VE4vWU1IakxhcjBLMFBBeTIrNlZtQ2VKdXFVcVBxUkRrSnViajgy?=
 =?utf-8?B?enozNkFvYWd2Z0hQajcwQURla3RySExiREljRWpaTjNldnYxWUhzbmpldzE0?=
 =?utf-8?B?OW11Y0FtSytuY09sY1hya096SXdFQVlpRjRoc0R4R0sxdmpXcncvVGpXMXFY?=
 =?utf-8?B?NDlxd0RuU3BlWEhNSlY0eTh0S2tTRXJYN3h1ekFLZ0U4NEJHQXVxaU5nVUtS?=
 =?utf-8?B?ejAwTVZzd1o4SUFvQm9Nc3NXMGFUZUo4aGlURjQzZFRicmNSR2k2bGZxV1JF?=
 =?utf-8?B?TERaSmJlWGpQSnBpaitjTURha3JLK29ZRXVHbGZlZDhyTUtiWjZGWGo4L1lu?=
 =?utf-8?B?TFNBWGhtcldLNDNFNS9EaWY0V3B4cEZpMGh2WkMzd215Wlp2aVhpQTNIZmdm?=
 =?utf-8?B?RzlPOG43S0EzNENzTzdiVDMyb29mN1BvZWwwUlJaWWxLeUNIMkxWMytCeDVt?=
 =?utf-8?B?c2lSL1hpYk12YXErSDBiNk9EQnZEVG9iTmVqQS9NUEhETmF1Sndtb2RpeXph?=
 =?utf-8?B?WlpkTDJ2TmJjN1paamcvbkd2bWFYUndCVjVlM21vQlpHMlQveEtzU213eTk3?=
 =?utf-8?B?MEQ1a2pZOFZORnBQYXVqZXFYVDJXVWtuTUVHVDhUNUk3TGRSbmsyRGhjTU95?=
 =?utf-8?B?UTF0WnNkcXBVenFsV1RlQllsZ1RVUU5Tdmczb0p0Nkhsb0tGV2FQZVF2Qkdx?=
 =?utf-8?B?T09ZekNucENJMjRuaHNYWUpyZ0xnREJHbnQ4d2Y2VGU1blJYUXlXN3dOR1Jh?=
 =?utf-8?B?UnNxRFZSL3ZWekJZTWJ3dUN0WGM5cGE3WHZZWHZ0ZllPdm1QREQrbGpOMThO?=
 =?utf-8?B?R0J3MXpncGNxNVhmOHFMUGIra1R4bGl2dFRiYzJUNEV1c2NJc0RoWThVWWdV?=
 =?utf-8?B?aXhrcnhxenRGc2JERG1PR2FsV2pPanYwcE05UUIwRUtoR2lQUXNBdVNxRWlo?=
 =?utf-8?B?azRHZ0RVQlJQaGRhV09RSDdzNU9VNFJjTUptSnBKb01CYnFIbGJxMjd0RzFP?=
 =?utf-8?B?eWpIRE9PVk9ENjE3V3JRNHgrMW1kTEE4Y3pIb3U1M1J2RS9VN0l1Z3ZPMTd4?=
 =?utf-8?B?YXBEUUgvR00wdi9TVGtTYnZaeksyL2RlTzg4SCt6WEFTdzIzeGNnSEEzc1lC?=
 =?utf-8?B?SmNjVFpqbDR5TXpUeFhXYnJBMS9qTm5YMGM0T3pHc21XVDY4eUlPbXh6Nmh4?=
 =?utf-8?B?Wk41NEhEK0d0Z0hIMFFwMW42VGl1ZFc3Z1FMdTV3UDBBaElnMDd4dGdSTFZU?=
 =?utf-8?B?Z1hKaVc5ZzNaYkp2enpzVHZKNldIVm1kMVFQMFJxamVvMnRRbVBVcjRiOUlv?=
 =?utf-8?B?R3BhNHlRNDl1SUVsTjFUeWVGajhSYUU4YkFlOVBVVklTcmVTVFlIa1hFOUhW?=
 =?utf-8?B?c0ZEM09FRGRIYWNIUVI0MU5BNlNPN2VUQWQzRWM2ajZEeGh3OHA3L0dRPT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f245b35c-a928-4489-3288-08db314222df
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 17:13:52.6953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5331
Received-SPF: pass client-ip=2a01:111:f400:feab::82b;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

strerror() is not guaranteed to be thread-safe as described in
(https://gitlab.com/qemu-project/qemu/-/issues/416).

This commit changes files under /linux-user that call strerror() to call
the safer qemu_strerror().

Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 6 ++++--
 linux-user/main.c    | 5 +++--
 linux-user/syscall.c | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b96b3e566b..0fde7de735 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -17,6 +17,7 @@
 #include "qemu/guest-random.h"
 #include "qemu/units.h"
 #include "qemu/selfmap.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "target_signal.h"
@@ -2790,7 +2791,8 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
         error_report("Unable to reserve 0x%lx bytes of virtual address "
                      "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, min_mmap_addr or reserve less "
-                     "using -R option)", reserved_va + 1, test, strerror(errno));
+                     "using -R option)", reserved_va + 1, test,
+                     qemu_strerror(errno));
         exit(EXIT_FAILURE);
     }
 
@@ -3583,7 +3585,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
     g_free(scratch);
 
     if (!bprm->p) {
-        fprintf(stderr, "%s: %s\n", bprm->filename, strerror(E2BIG));
+        fprintf(stderr, "%s: %s\n", bprm->filename, qemu_strerror(E2BIG));
         exit(-1);
     }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index fe03293516..953b8ede65 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -746,7 +746,8 @@ int main(int argc, char **argv, char **envp)
     if (execfd == 0) {
         execfd = open(exec_path, O_RDONLY);
         if (execfd < 0) {
-            printf("Error while loading %s: %s\n", exec_path, strerror(errno));
+            printf("Error while loading %s: %s\n", exec_path,
+                   qemu_strerror(errno));
             _exit(EXIT_FAILURE);
         }
     }
@@ -892,7 +893,7 @@ int main(int argc, char **argv, char **envp)
     ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
         info, &bprm);
     if (ret != 0) {
-        printf("Error while loading %s: %s\n", exec_path, strerror(-ret));
+        printf("Error while loading %s: %s\n", exec_path, qemu_strerror(-ret));
         _exit(EXIT_FAILURE);
     }
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98..f6b4fe8059 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -581,7 +581,7 @@ const char *target_strerror(int err)
         return "Successful exit from sigreturn";
     }
 
-    return strerror(target_to_host_errno(err));
+    return qemu_strerror(target_to_host_errno(err));
 }
 
 static int check_zeroed_user(abi_long addr, size_t ksize, size_t usize)
-- 
2.39.2


