Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718CD6B6AC6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 20:50:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbRhW-0001k0-8B; Sun, 12 Mar 2023 15:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbPBQ-0006Ry-M5
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:08:32 -0400
Received: from mail-sgaapc01acsn2080b.outbound.protection.outlook.com
 ([2a01:111:f400:feab::80b]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <y-koj@outlook.jp>) id 1pbPBO-0004Lg-UT
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:08:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScsOXzDNgqq4IXj9sp01PMacY2WfD78YQo6wEvd7tGkAGHURpmnaCD6Zfkmy9bfo8Tn/P3+abeMsYTrZ4vo3p1K5NEABIH/imIgqDq99C9WsaJEN82ZR+5b09KPK71MK+jeDjzWbiw3dPUDtF4kbhO21eIsAiRMg7rUfloFdHwKvFQUE1ocbapgPgPfXxLoFgbdVKS1o/PjIoAPLC31ScvVY6WOYjQFw3+WhSZr44E4i2MlsNvBSA9lWYgGRbrvUHxdPJk+lU8xFlPpmb+27378mCKNswb/RBmbdAJcL/MvHX+1Yt3LF7YSHwYsPfWNujL+++in5WqGvx85wIarZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP6aCGocP9ufZCf2yfN39DFKwpXBjdNVGnXbz9BELcQ=;
 b=R8C90Ux+BO7TP0rsu28TtmNaNfR34dxyR1C5FqXlQwoCS9ibXXVNd+y3PlOfPD22b6/F4d8H7NSIPOpMQdQTqeK6PZIv5HgmplVhePfdqBfwXxDI09U3q3m0rhjZj1CU2A2z50hOReLPPtAZhwBN7jxo4DRDcpYWtw4AbSxPKRXcRNUQxyVmG4Mchlxm0jlvpSN9SbFe6vQfZPJRWD/tjSbCdh01xUV2R1owO7764HX7dLLOHE5FjUEZSUcQBvffv58cBx5hTLM3kvyfkZkEUaEU0o4nsv3fxpRVnZOVpZBqEgQAph1Ppx2AuHZ4DbLQ3ayaqtliGEtOzm53epPrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com (2603:1096:400:202::7)
 by SEYPR06MB5280.apcprd06.prod.outlook.com (2603:1096:101:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.22; Sun, 12 Mar
 2023 17:08:06 +0000
Received: from TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae]) by TYZPR06MB5418.apcprd06.prod.outlook.com
 ([fe80::5aac:46da:e945:95ae%9]) with mapi id 15.20.6178.019; Sun, 12 Mar 2023
 17:08:06 +0000
From: Yohei Kojima <y-koj@outlook.jp>
To: qemu-devel@nongnu.org
Cc: Yohei Kojima <y-koj@outlook.jp>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] linux-user: replace strerror() function to the thread
 safe qemu_strerror()
Date: Mon, 13 Mar 2023 02:07:11 +0900
Message-ID: <TYZPR06MB5418975FD72403A8B4BEB5449DB89@TYZPR06MB5418.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678640194.git.y-koj@outlook.jp>
References: <cover.1678640194.git.y-koj@outlook.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [HHrKFZZVcxAJFgjrAwT/Ih+kF4q4dE4aiKv4JLadr/SilOoSxZuPqFbA89IFPowA]
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To TYZPR06MB5418.apcprd06.prod.outlook.com
 (2603:1096:400:202::7)
X-Microsoft-Original-Message-ID: <e48e140eef73c6bc5eeb8ef1edaf82b447a56018.1678640194.git.y-koj@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5418:EE_|SEYPR06MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ab0ea4-8977-481f-b91c-08db231c5909
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HA9J4fT469aFVB4v9tvblxl4g+IHj8/dfNTFxGMOHN3R4wld3yPnf8IEG+J58OqhL6dMdQwQRKfIjipPQNpWqy4MpYVw6AlkOe9dRil0Ynrfn+BpI9C8+MpnZfE/zaNQqL6kevOQE6ze9kaIoOs9nFhbNHesF2EWCrd76Hmb3a8H+NIPLCLWQ24UlwSUO+8fllewOH+U5xbOxv+3aSC3q3rvz+cHkwX8Hm8+ibBIpi4XxYj5M9B+4kE4eXUm3PtvXYSlvE5WrPDVkxE1DOSCHsb7/ULtZ391HLopGN4bGG4P8cH9YeyinNfPbyIXm/GSbY9y2/vdIongB7BlbeiBrmYRMfWGWcZNziiZLIoRQ8+SNKbJHIfhYjrWTI/+5uAXa4XJ7OW0G9kd8lCmfPjMvhCj6TnDeYFJjKXlAJegC5E6gq6n1ljZTCA+QRoux4BDPae0sFSIq8c40JhvX8cCPsF9PpQ9+5Ng6gKwemuaxZQWumuEKw1i+wdZ7I3f4KtVukxSu+I5VvSDZaDP3K7USGmKvWsR2htdUEgqIn9yyqOcI7e+xCkiNw+QN5/3cyXuZT/zIsp1/A7LHTRHc83oLDlPSUtN7EP8FrzgVdwuTWYNIrfFwVDgWT72xvG0+wkIJ89VU42uZslmRszdLhMsGg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CK1ZU9wL1l33g/UmJ+n8UftjFjhndN+eSFtBC5vSsVeseMETOP/jWLrvQBB9?=
 =?us-ascii?Q?M0xmQnM+Xxonk44V5t5/jsi/YQvQwpMPmN71/HDGuyGvD8oRwhvB96m7zAmK?=
 =?us-ascii?Q?tIZuFhms5I7C++pzZTmmCfRppT8A92gw5D0/7xEZk49byh6j+qjzYp5noK0q?=
 =?us-ascii?Q?8GU3nx5Kzxbnj25plRe0I0U1xJ0cVpGF1UtG/N0Cz+Yn8yeBv8mWAA/WqDJB?=
 =?us-ascii?Q?vudgbg+iubIf449vbTVVIZVJybjttr53bTac5cOPp6hFCJ93J179z3LTLHov?=
 =?us-ascii?Q?SdhCsKxjHDNhHPulIJEql2pp17eBfnGBuW6rPybAxqLJWeACiT2ZSHdaoXd8?=
 =?us-ascii?Q?AQTlqYhrAws04gNZT8qOm2zn7NgVT1psvyNe6fc/iT0PFFMop83TBQKI8CuN?=
 =?us-ascii?Q?rA8hG5JqwH+Eei/y6T8IDoz2MqgjazAp/DpqtrGotPFtsftG/SXaQEeeLRr8?=
 =?us-ascii?Q?jvOi+vB/HJwVp5ZWNJN0mHxAObhIA7H/E0KtVkUffJQxGYa30oxGDGthlBfG?=
 =?us-ascii?Q?2S/rkbLtMOAZE0yq7549qoZ0hp+zMAL0nInHecIfCh+iatk09rpqUQEWapoQ?=
 =?us-ascii?Q?+ZIVafQAeP/Bc0ntxthUA9HGuJx2KguIMukQi70KK4uddvHqmbLzT532MAux?=
 =?us-ascii?Q?BAmwV6KHJlugoS2nGcVH+5nLRxpvpT7lVcBmR1nzmxJm9Ntwka/oIUhctkfb?=
 =?us-ascii?Q?Jnrs8dWsgetpg4qnXLKggvMrg385x+5HJT76IE+Fwew22ZwnF6S2M1tCHrzS?=
 =?us-ascii?Q?UOvkzQWpTS42B5ESFS38+K88NeUDuvhE6Tx8OcXHJZ4ejbuEhMIxTtF7c0pH?=
 =?us-ascii?Q?WNRYnqW8XdxVPzt23aM8Xl23cTAiLIh9N7+vdGdGbZqwkBQgcJ5M1v2EJADy?=
 =?us-ascii?Q?NhI8gfYnRSVgEwuiNnNNaY+Ng+dmhOkkL+vMMKMCmBTTY8N0UgnDleqSPyeC?=
 =?us-ascii?Q?VlBOpxTpvJcXLnobjpcjDrUq60rbGpFwVHiegAonbslIaAu/5M8MnY9G0C3P?=
 =?us-ascii?Q?FNvT2rjedhi8mW5cuVuGcqjUOyQMzN5Yr9JcLHrDN4lurAnQWSlOhFo6SflT?=
 =?us-ascii?Q?2GUOlhN4xXj6ADLTdu4oSt1iTMlmNl+xzXTnW5Vm9ADL5dW5PxgiWVQjrsBJ?=
 =?us-ascii?Q?Y7STQHlekEBCBMk7qEeNWLMra7vcNtpMcwZIcpzVbh5ewghcnb1C5mRKi7q6?=
 =?us-ascii?Q?TgMKK+lrWYqlh73vJZ8pCtxPL97dVqDY3Fv2yKG0WCONAQLz5AFauDrCylmg?=
 =?us-ascii?Q?7S0a7wuGCbfPRoXHrjTmlE6XJrg8kNZ9U7Hwra8xCpNosWETEFapFsTwnlLJ?=
 =?us-ascii?Q?JX4TdNjts/KouEuzpxvg+gdry+Aqj4/X3Ozl/WV2pmwOdg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ab0ea4-8977-481f-b91c-08db231c5909
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5418.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 17:08:06.4016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5280
Received-SPF: pass client-ip=2a01:111:f400:feab::80b;
 envelope-from=y-koj@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 12 Mar 2023 15:49:48 -0400
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
---
 linux-user/elfload.c | 4 ++--
 linux-user/main.c    | 4 ++--
 linux-user/syscall.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5928c14dfc..7eaafa8509 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2757,7 +2757,7 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
         error_report("Unable to reserve 0x%lx bytes of virtual address "
                      "space at %p (%s) for use as guest address space (check your "
                      "virtual memory ulimit setting, min_mmap_addr or reserve less "
-                     "using -R option)", reserved_va, test, strerror(errno));
+                     "using -R option)", reserved_va, test, qemu_strerror(errno));
         exit(EXIT_FAILURE);
     }
 
@@ -3550,7 +3550,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
     g_free(scratch);
 
     if (!bprm->p) {
-        fprintf(stderr, "%s: %s\n", bprm->filename, strerror(E2BIG));
+        fprintf(stderr, "%s: %s\n", bprm->filename, qemu_strerror(E2BIG));
         exit(-1);
     }
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 75dbb52788..8be7ac489d 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -735,7 +735,7 @@ int main(int argc, char **argv, char **envp)
     if (execfd == 0) {
         execfd = open(exec_path, O_RDONLY);
         if (execfd < 0) {
-            printf("Error while loading %s: %s\n", exec_path, strerror(errno));
+            printf("Error while loading %s: %s\n", exec_path, qemu_strerror(errno));
             _exit(EXIT_FAILURE);
         }
     }
@@ -873,7 +873,7 @@ int main(int argc, char **argv, char **envp)
     ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
         info, &bprm);
     if (ret != 0) {
-        printf("Error while loading %s: %s\n", exec_path, strerror(-ret));
+        printf("Error while loading %s: %s\n", exec_path, qemu_strerror(-ret));
         _exit(EXIT_FAILURE);
     }
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a6c426d73c..d25545c355 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -575,7 +575,7 @@ const char *target_strerror(int err)
         return "Successful exit from sigreturn";
     }
 
-    return strerror(target_to_host_errno(err));
+    return qemu_strerror(target_to_host_errno(err));
 }
 
 static int check_zeroed_user(abi_long addr, size_t ksize, size_t usize)
-- 
2.39.2


