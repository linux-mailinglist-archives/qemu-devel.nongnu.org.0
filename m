Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19B3330D7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:24:28 +0100 (CET)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjq7-0006TS-Ad
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJjCN-00057W-0W
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:43:24 -0500
Received: from mail-dm6nam08on2095.outbound.protection.outlook.com
 ([40.107.102.95]:41712 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1lJjCK-0007E7-V2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:43:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+CuXaf1kIneChKlwxJyZwBnuCsrm2XSApzi/eNY8uyZ3M3BSU5Vhfzv58rd6/I17YIVYfDkl+S2zO1N2o0eWqseBTYG7GKysp8MQP+EYPHtkZznPanFqY8wdZFSJNL46W3vB75dQTLMaGY5XBYyTcaMBnguB8oypgDcDgh5l/VU8+5fzoyhoWsehG3w40I7hkr0rgXx/Zc6LOTS1Xd3HNnuAcDv5jT6qcGUMFa+nJKrRw1sJrR8PuIKni5oJci6C1WJViw0R4SXpdUAkACWcPXK2Vss3ZtvjaEXO7h5+mmTUQqjhtypwe48AV/kyt2aQZi6QOxWRr8vFOmiwxWm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz0L+PThvjJ+KmVLaZTfFKDBrGQ27YKLHSAsSwjgIRE=;
 b=VsFKdti2YnWEQdiEtWhN/UIu1chXavf8KruLkkbdpylB08CM7VcpQXpKZHWJlEbfxYzFSJUouDbRkHbGaDP2Z33nYbD4OKtinvqNEALkNULQT0PLsseKMWn6WMghv5Q2/aaW6JgX00dTcrskpYhTtAZ5VQhcBa/H1W248UoFvuiQLLBkw3bb2XO0iS48YrkdG0opCwb48ivcwo7Eb7KAQRhynCcs5t7XUDlfwhpvwMHMfWLJftGwZdvhPxPGCyc0LJrAl23WVLu1EbhZcISVrgHJYWAz6AUKj4w8jr2l84TuMaa6kKa5GoNWuu0Ph9hGa2axjvFDa0oj294ydLSUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz0L+PThvjJ+KmVLaZTfFKDBrGQ27YKLHSAsSwjgIRE=;
 b=hLn7apOX5fRoXkBsCHorbtOldDyiPtWcowgl8xOHuJW0J3r76DmXgn3Gxa368G+yVoMW3kvAKRv8k1l/q/rySuT7jYSiWoiM3AO0n/k0E1Zf7VNXofsQdcWWd+kGK9/u4ZKKdzhrK6LIs4exxTRvIXV6Udy9FMx/aYUKHr05998=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none
 header.from=os.amperecomputing.com;
Received: from SN6PR01MB4304.prod.exchangelabs.com (2603:10b6:805:a6::23) by
 SN6PR01MB3791.prod.exchangelabs.com (2603:10b6:805:18::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Tue, 9 Mar 2021 20:28:16 +0000
Received: from SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403]) by SN6PR01MB4304.prod.exchangelabs.com
 ([fe80::c43:8d97:e9e9:6403%7]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 20:28:16 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, richard.henderson@linaro.org,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v2] plugins: Expose physical addresses instead of device
 offsets
Date: Tue,  9 Mar 2021 15:28:02 -0500
Message-Id: <20210309202802.211756-1-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.30.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [68.73.113.219]
X-ClientProxiedBy: BL1PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::32) To SN6PR01MB4304.prod.exchangelabs.com
 (2603:10b6:805:a6::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from strawberry.localdomain (68.73.113.219) by
 BL1PR13CA0237.namprd13.prod.outlook.com (2603:10b6:208:2bf::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.13 via Frontend
 Transport; Tue, 9 Mar 2021 20:28:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32f1e072-d03c-4632-ac8d-08d8e339de82
X-MS-TrafficTypeDiagnostic: SN6PR01MB3791:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR01MB379109689EF4A45D365FC87D8A929@SN6PR01MB3791.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACjnAdeuascZyS8zpFm31bq3D5MZZcrZd41fdYY0H60QN6wrjJnCxbheGCRfG2Fo5Jt9hNVzVYQkGDn/pdVfCf1Ss1A05fVfvhCsIjlmvPBlsxJKiORCeaYBX6127hUJKyBw6IWep7PoBqwD41HzcZB3es3zdbJ+GuW57gNwZ6US6Vl8FRqKqUKjjbwvQ2jhP0RnLI842d90isiY2gy8WGJw3rJMSbQb2OsY2ZAU+7KFkLsvAP2BiBMCpAiONYYTKGJFwJukWB5tcuzTVidRaE4qa89+y2/nFu2lnC2TYKcekvB/317vJK93y9LtUJh7SazCpVDs3/ZknyFZ/jKX0w37S3e2EW4o71Am8iRXOkSwrkfc2VX8r8t2MIZ567BUnQCwWjLBA1qNAdqMCXiIQaLG8hftU1U5IU1lq6SSz/WGKta3F3Epq4FAQHgV5NtCqWXFc4lkDremuv8ubOw1MaJR83zXpX8NbdGtXWpW6oWvccTaZzMdyuz/gswY6vrCzvRFxZMSCT6oLd9V+GERFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR01MB4304.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39850400004)(346002)(8676002)(6666004)(66946007)(66476007)(316002)(86362001)(107886003)(8936002)(16526019)(66556008)(186003)(6486002)(110136005)(2906002)(5660300002)(1076003)(52116002)(478600001)(6506007)(26005)(6512007)(4326008)(2616005)(956004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gVKjsEDyyG4syWee0ZQkW1g8IyGHfvxWgnRUsmTFuiHCz4zS/AFiyghaPHlH?=
 =?us-ascii?Q?1ynuXXVHt5FF5/iLf3gHpihpq2zD/g+yvtobchRQkqvoQOd0Vl3lvRTO9oHa?=
 =?us-ascii?Q?2leh/reEHCtMuyijJj9SdWZ2I29eBMQYNkiG/mwuPZdc1kboy+cLuDh8u9+x?=
 =?us-ascii?Q?2Gtm/vNyLlBiJmOZ+KP6yzEjudeH7EJs7o/UwhfEsGDA6rSCcdnR+OsjkY92?=
 =?us-ascii?Q?MnsJ+2HQhltWK+3zZY0NdnngT9B43ExDm760510IPhoK35kjHfhRPS2oWKqc?=
 =?us-ascii?Q?UMXnNF/kpOzxzaYdtZKYTEanPffgjzJN2i1/R3KuIeS79P2pvKGaDQAMAsBW?=
 =?us-ascii?Q?pAC5itiuHxdwao+c2HWm0BtN0OdwFWY4Wg++8HVJPY+6S9m0bdGL2vLkg3SJ?=
 =?us-ascii?Q?+E22cPcYzTHHANbBs+L88x0LWra+cfKa+oBwsYmvHP2Jxixp7xwASYdapW+9?=
 =?us-ascii?Q?WV4LAm1OikY+CnO4M53Og9j3CnHUxjSzQKCmmRpKnbD6c1SRDLoXO6cKgS6S?=
 =?us-ascii?Q?Vu8rW4RkE01yj7GJvoOQDoPOLNI+2b3a8LEa6PA9HgKF5Z+kIwndiyYIxBkC?=
 =?us-ascii?Q?iYC8Jj6BH5lqJqXwBRYL4/siNU3aRQg+I452R9h/UWY3gywcJaGd3OR1pKjV?=
 =?us-ascii?Q?CboRrU9hRmpvjZ5p4KqxCU4BvVQmnzmYa8F0Gl1V1yHQPJJK1a9BZOj7g+PM?=
 =?us-ascii?Q?A1oq0eF5ZrowayXiyixnkrGViuumHJWxC7KtwrVeXZYFRX7ienknFKZFOEG5?=
 =?us-ascii?Q?Lary8yFniOkCw2JOhIHebh8FGhWOByC9kZ05zLXPll4XCcEkIegCczFeU585?=
 =?us-ascii?Q?PLY4gptxrFoF3mJk7oNiFwWq6qCbE+yQwO8PnERvBLD8egGbzKoKUjuogWpv?=
 =?us-ascii?Q?tBcb6tmEqKzoEosnvlZxdQ5jboG7pHQThDB5L4oA+uaUyc4NFdU+UBeZqS8K?=
 =?us-ascii?Q?PB6jYg6j9qQLBqDwlpCMIrqY9v4d9VOA2+r1mWFuZmxqR6rvwE8Ne/6v2KaV?=
 =?us-ascii?Q?j5yL6LSK04eT5zL2FncamkH1yOuhenSxQ/b1wbZZjZMUeOi7BkhdKpNuxPRD?=
 =?us-ascii?Q?qNb18RZjZC5FO/vJhyn3iRMvPagl+nm+VCM1QrilQY8oa3nQM9j9OANMKdJA?=
 =?us-ascii?Q?/jDrzdKC/ptILx8/yYJQ5ob5I2sNQCmijvuw+CkjZFOnobP7NckfijjTO4n8?=
 =?us-ascii?Q?ptpQLQMO1WmKowGk7a+ME2rroQaxc4PC5P3h+ZweMR+q9IxDQNs49ug2bzoq?=
 =?us-ascii?Q?UcA9QhjxG5uwl+Zhcg3Kg6DlqDJKJ0jrOThXud8CFO+TaC4Q9hVoYp1GeyD1?=
 =?us-ascii?Q?xuGvdST5nBf1mVZM8InjeRa7?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f1e072-d03c-4632-ac8d-08d8e339de82
X-MS-Exchange-CrossTenant-AuthSource: SN6PR01MB4304.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 20:28:16.0660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aIem7D/mQoITwycAUr/IiNili6cYFltmogMwdGJT6yrBZYzvbAoVwlEgVHkM9qK/lunqbGmGrP4xqxQPj/Ig2uLwhKuAwfC84GleARGDuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB3791
Received-SPF: pass client-ip=40.107.102.95;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

This allows plugins to query for full virtual-to-physical address
translation for a given `qemu_plugin_hwaddr` and stops exposing the
offset within the device itself. As this change breaks the API,
QEMU_PLUGIN_VERSION is incremented.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 contrib/plugins/hotpages.c  |  2 +-
 contrib/plugins/hwprofile.c |  2 +-
 include/qemu/qemu-plugin.h  | 32 +++++++++++++++++++++++++-------
 plugins/api.c               | 17 ++++++++++++-----
 4 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
index eacc678eac..bf53267532 100644
--- a/contrib/plugins/hotpages.c
+++ b/contrib/plugins/hotpages.c
@@ -122,7 +122,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         }
     } else {
         if (hwaddr && !qemu_plugin_hwaddr_is_io(hwaddr)) {
-            page = (uint64_t) qemu_plugin_hwaddr_device_offset(hwaddr);
+            page = (uint64_t) qemu_plugin_hwaddr_phys_addr(hwaddr);
         } else {
             page = vaddr;
         }
diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index 6dac1d5f85..faf216ac00 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -201,7 +201,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         return;
     } else {
         const char *name = qemu_plugin_hwaddr_device_name(hwaddr);
-        uint64_t off = qemu_plugin_hwaddr_device_offset(hwaddr);
+        uint64_t off = qemu_plugin_hwaddr_phys_addr(hwaddr);
         bool is_write = qemu_plugin_mem_is_store(meminfo);
         DeviceCounts *counts;
 
diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index c66507fe8f..3303dce862 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
 
 extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
-#define QEMU_PLUGIN_VERSION 0
+#define QEMU_PLUGIN_VERSION 1
 
 typedef struct {
     /* string describing architecture */
@@ -307,8 +307,8 @@ bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
 bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
 bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 
-/*
- * qemu_plugin_get_hwaddr():
+/**
+ * qemu_plugin_get_hwaddr() - return handle for memory operation
  * @vaddr: the virtual address of the memory operation
  *
  * For system emulation returns a qemu_plugin_hwaddr handle to query
@@ -323,12 +323,30 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr);
 
 /*
- * The following additional queries can be run on the hwaddr structure
- * to return information about it. For non-IO accesses the device
- * offset will be into the appropriate block of RAM.
+ * The following additional queries can be run on the hwaddr structure to
+ * return information about it - namely whether it is for an IO access and the
+ * physical address associated with the access.
+ */
+
+/**
+ * qemu_plugin_hwaddr_is_io() - query whether memory operation is IO
+ * @haddr: address handle from qemu_plugin_get_hwaddr()
+ *
+ * Returns true if the handle's memory operation is to memory-mapped IO, or
+ * false if it is to RAM
  */
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
+
+/**
+ * qemu_plugin_hwaddr_phys_addr() - query physical address for memory operation
+ * @haddr: address handle from qemu_plugin_get_hwaddr()
+ *
+ * Returns the physical address associated with the memory operation
+ *
+ * Note that the returned physical address may not be unique if you are dealing
+ * with multiple address spaces.
+ */
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr);
 
 /*
  * Returns a string representing the device. The string is valid for
diff --git a/plugins/api.c b/plugins/api.c
index 0b04380d57..3c7dc406e3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -40,6 +40,7 @@
 #include "sysemu/sysemu.h"
 #include "tcg/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
 #ifndef CONFIG_USER_ONLY
@@ -298,19 +299,25 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 #endif
 }
 
-uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr)
+uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
 {
 #ifdef CONFIG_SOFTMMU
     if (haddr) {
         if (!haddr->is_io) {
-            ram_addr_t ram_addr = qemu_ram_addr_from_host((void *) haddr->v.ram.hostaddr);
-            if (ram_addr == RAM_ADDR_INVALID) {
+            RAMBlock *block;
+            ram_addr_t offset;
+            void *hostaddr = (void *) haddr->v.ram.hostaddr;
+
+            block = qemu_ram_block_from_host(hostaddr, false, &offset);
+            if (!block) {
                 error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
                 abort();
             }
-            return ram_addr;
+
+            return block->offset + offset + block->mr->addr;
         } else {
-            return haddr->v.io.offset;
+            MemoryRegionSection *mrs = haddr->v.io.section;
+            return haddr->v.io.offset + mrs->mr->addr;
         }
     }
 #endif
-- 
2.17.1


