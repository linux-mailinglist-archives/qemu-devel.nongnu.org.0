Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB5D6B8B6C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:42:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyLq-0007By-Bf; Tue, 14 Mar 2023 02:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyLo-0007BX-3p
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:41:36 -0400
Received: from mail-tyzapc01olkn2081e.outbound.protection.outlook.com
 ([2a01:111:f403:704b::81e]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbyLm-0002cY-GB
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:41:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+7uyWwoBajLOeLv8K/LeEDoZXkCgfQQ3Mar3Lm0he1lVF68bM0pkNXM7X0BaseWG0Dhsg7tDb7TcC5lY6iHitDktqncEDl5F7LYI49hKc/P1i67dSC4ItuXWLxiuUJKz2ZRMukC37qRwphR1f2TF/u7QW9uN466dvRthAo4AuOju0dIXwc854pKaVavQxEU7YPHYGlyBYuoCP7pnv7RGT7nQ1RwCYXcPhqzCZKJnPNJU5o7IzLZ9yOWqL9XUGSpwJQyAzpweMzuCNhG+WF5kK9o2AhTfJhDAmeqCZMEHa2lsfIACsAhmuRyILymjSL32Wd769v1/xiqkUJoK7mg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/xs8dRBnGLWwFiRIBi5ukhefKy2OnEfa6ZPqFhHKzk=;
 b=mn4/B3gyRmkPT+OWdewEkt4wxyQzI0j+0GjO77q/7I2KbsQ2iW0j7WGJnkG/2ZCLWeWfbonONg8ih8CYlpev88+7oCkUCnd9FZKrGQmJiM6fiMwSj6kWFjCz2Cfl+md25Xphg86Eew3QsiTdRjA6Dqyveo98NRhC7511k5ObQ/MoQLGf+vPOme3b3eoF6K3BbuC6PL9zQw/qNwmxvh8rV4RCHrP0OtzZGIiqvaJyspJ1Ap94NjrCkT5e3iMDUgMk7KbItYnfQEQfk+07ngyy/3a4ZYnQ0RjA2PoT+6cJFKWPadRabc/zljqUFkMixo5PVi96pJChNszsciDT6qzX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by KL1PR06MB6019.apcprd06.prod.outlook.com (2603:1096:820:d1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.23; Tue, 14 Mar
 2023 06:41:00 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 06:41:00 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yohei Kojima <y-koj@outlook.jp>
Subject: [RFC PATCH v2 2/2] linux-user: replace strerror() function to the
 thread safe qemu_strerror()
Date: Tue, 14 Mar 2023 15:40:33 +0900
Message-ID: <TYZPR06MB541876821E3AD1306D6DC88A9DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678770219.git.y-koj@outlook.jp>
References: <cover.1678770219.git.y-koj@outlook.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [eD/kn8H7YuYF7l+Ypa+YHuv1b37+6Z6nK/VFywzSmr5YhbWZwAAlz6XFZ2O2O9d+]
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <690c218bd75a19cb46fd4c88e78d85f37f0df782.1678770219.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|KL1PR06MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5fecc2-94e1-4180-0c6f-08db24571312
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pDkjtG0RvAV3gK/kQM2w3n4yNSMAtMkccxf5bCgd1EKqZBq2Cu7+HQ8mfxToTiCiqQwCYh1a0OCz4I2OTxUXyJzUSZQuhN2k4RnulPswW3d3QRilP/ZKzhrino+LkTRgUtn+5ryvv+DKgKF4b50TTuLm16fj/eExTWkUDBJHrWt3uST7wI+1h1hoOoMDbI3XDGWfxrIF4o05zlt89tCJxdnPRFZAZTGF9oBz7q4I+iIqpqseZkLY7qqKomnYv+ZSvtYkpHPqAYbj8NTOMSz4SHEhqUJsWu6fRgIES+UmfVswbhTzevEQIzCYXjUPtrI4HFKl2JylvtaK5MfcBsywbYzYZyi+E9zAkAg47C/4QF08pvcHSVjVOANNYx83LCvJUux5prceSbZ85llte6UYYBJy1LBrjCel2dsKwRY88SLmQphZoS7UyLDbvd4x1Lr0zApWbxaZiltjtQCPuyZ/PZCR6ty8sFl27LgfGOn3Z6sWuG027ZCbOsGBFB/dLcvnhdGBVMYbW9BulGijkQFg/m4KfGNa/iDjscyyR4uez5YdmvsjTI4co3iH1CHFblbAm0IEEkZMENicc4ydLdCOwce3dnPZva4OkF3NPvZI4oOC68rU8id8fo/oo0hgL+a5QXmp8AHM5tuMe4RjHo7B8g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?svmZcjnCsfbGYf5lsxxxGpao8dEZxLdrocjVXQzQMa5rzsMaJ1q5T5pfHwXr?=
 =?us-ascii?Q?NSnZO/jIDihjswomJoON8+mAtHiKvuv7hOr/n86M2q44hU9AcQS5eFg6raOI?=
 =?us-ascii?Q?1lYxaVWrEBQwiTxdVTQcZe0AwzCHFpT3o9y+qPuz1pogR/VR1VERELzCH2YC?=
 =?us-ascii?Q?6JQvmQmILu2yboPKkNlp1c5G7F0OjdXfS7tpxxAuPsnJyoam6TVpaSlhjwds?=
 =?us-ascii?Q?TEq6I+yihsU8f26eKrmhZn62PmRRmmcOfvF5qWfeKHUrXAWwaoFiP0TZXvPA?=
 =?us-ascii?Q?gm+KtSydPltM9YP611pBFukq66U1M2kOex9bWFDqlSTn/U8O1ueD35elaB4O?=
 =?us-ascii?Q?/+VEZDaOP2Wq2xcJiilZoBPJ2hRYvlKCLLf7kF5mI+la8d4JbxrtJftA+6zZ?=
 =?us-ascii?Q?rU+1NAccsYAJGDLqGDPyfxoM6t7V3s9RIdSAOs56Qk4jfnkQMa6HcwQ+xQqC?=
 =?us-ascii?Q?H155OH3KJi4gIOAOkp4hHR6UOxoSNE1hDKlzMEa7jJcExToWQjCgi+7nP7d4?=
 =?us-ascii?Q?YPabusx6/Vw28yHZ6tsWugmasecPnjn6syfqRpYCCvX3YiHOVwicUN3PXdZB?=
 =?us-ascii?Q?FWdNyrxist8gSOIsXCyTs4G1tFJpnpZNtrTbxvvCPZ+KYuiLX7OWlSfmKB5o?=
 =?us-ascii?Q?wFYgRGsOqejeCsL3WwHOLUtd95XoLafZuvwriXU0lyTVpDY/Nmk0IBN2uQGo?=
 =?us-ascii?Q?xzdXuGGcvA69i03Wr0DipKHwJGFtwkRZsToBvn3bkL1O6QfMd6ZRu5GrdW9S?=
 =?us-ascii?Q?aj7HwoZzq+vNWRYX5X3VftZ1TVwFWKMIhZ4QagHJiCLvYWY75K1SR6n/JZCR?=
 =?us-ascii?Q?Y1jp9kE29AbJ94FbLDcC22g15N3lK2tZWMDBQ/rtOI/pmYeDuKtsf2k6M1eR?=
 =?us-ascii?Q?xkS2+hXupAT4GthS5gz0g+j7NjFgVJvLD0iI+AePLQwP8MBpH3Ia17M1HK3B?=
 =?us-ascii?Q?odugVZTJVCrWW3m8986jp/TghZ5nbmdSkVb4pXwgK0cvnRpA3BGYnAuna0UN?=
 =?us-ascii?Q?gQPjMDzxdr/tPSGhj1R23GKGmGI/DTUk5EtBIOe9y0G0x7ZWbWOybMm2n1lq?=
 =?us-ascii?Q?NpFYVGxQt9X/hn1oxcZ7pV6WXwczi2i1vEro38wiEL2+3+6LIF2Jy2yslbhx?=
 =?us-ascii?Q?5jfEepQ/gav9I03/+jOmregR3gcNIKD0L+t6S8mzoSlY0O4+jIGWmQgpmHM+?=
 =?us-ascii?Q?5t1Wt+ittJAirFpGNn6oE79G7aa+1O3hiLZnitedEm7XsNSoUYAkqGuKTV9G?=
 =?us-ascii?Q?tQJiE6KLq6OIkQyIFzNWaPk2IePf/cJrbDv4elsFbD5JMY/69ukpkO7tCpvt?=
 =?us-ascii?Q?qzRuGMJWQcGtUqtokubawdJG?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5fecc2-94e1-4180-0c6f-08db24571312
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 06:41:00.5323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6019
Received-SPF: pass client-ip=2a01:111:f403:704b::81e;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
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
Reply-To: TYZPR06MB5418216269D0ED2EB37D6FF49DBE9@TYZPR06MB5418.apcprd06.prod.outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

strerror() is not guaranteed to be thread-safe as described in
(https://gitlab.com/qemu-project/qemu/-/issues/416).

This commit changes files under /linux-user that call strerror() to call
the safer qemu_strerror().

Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
---
 linux-user/elfload.c | 4 ++--
 linux-user/main.c    | 4 ++--
 linux-user/syscall.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 150d1d4503..6ed2141674 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2771,7 +2771,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
         error_report("Unable to reserve 0x%lx bytes of virtual address "
                      "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, min_mmap_addr or reserve less "
-                     "using -R option)", reserved_va, test, strerror(errno));
+                     "using -R option)", reserved_va, test, qemu_strerror(errno));
         exit(EXIT_FAILURE);
     }
 
@@ -3564,7 +3564,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
     g_free(scratch);
 
     if (!bprm->p) {
-        fprintf(stderr, "%s: %s\n", bprm->filename, strerror(E2BIG));
+        fprintf(stderr, "%s: %s\n", bprm->filename, qemu_strerror(E2BIG));
         exit(-1);
     }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 4b18461969..e0e133d631 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -744,7 +744,7 @@ int main(int argc, char **argv, char **envp)
     if (execfd == 0) {
         execfd = open(exec_path, O_RDONLY);
         if (execfd < 0) {
-            printf("Error while loading %s: %s\n", exec_path, strerror(errno));
+            printf("Error while loading %s: %s\n", exec_path, qemu_strerror(errno));
             _exit(EXIT_FAILURE);
         }
     }
@@ -887,7 +887,7 @@ int main(int argc, char **argv, char **envp)
     ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
         info, &bprm);
     if (ret != 0) {
-        printf("Error while loading %s: %s\n", exec_path, strerror(-ret));
+        printf("Error while loading %s: %s\n", exec_path, qemu_strerror(-ret));
         _exit(EXIT_FAILURE);
     }
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24cea6fb6a..50090feac5 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -580,7 +580,7 @@ const char *target_strerror(int err)
         return "Successful exit from sigreturn";
     }
 
-    return strerror(target_to_host_errno(err));
+    return qemu_strerror(target_to_host_errno(err));
 }
 
 static int check_zeroed_user(abi_long addr, size_t ksize, size_t usize)
-- 
2.39.2


