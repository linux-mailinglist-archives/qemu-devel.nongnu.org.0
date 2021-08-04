Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066593E00C2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:02:34 +0200 (CEST)
Received: from localhost ([::1]:58726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFbV-0000tr-1x
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFXu-0004Sp-My
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:58:50 -0400
Received: from mail-dm6nam10on2077.outbound.protection.outlook.com
 ([40.107.93.77]:53472 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFXs-0003WR-2f
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:58:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9aJYBxVSj/oQ3tfnXNV/s0BHY3wRtt+H+/FsUZCNtvyyxiJXv/GkyyS+B9u1wllUDt/MGPQkJ9GgYt4EAw0Q2JVPCPTR6r7YNCGZmPQLWfj81LDJJfP+n5kXpSv53872c5beFNb80NLv9C88qO5Dm4W2sKTELwEVxAuaV+IagNgjSpygMRrTPtw/AXghZE/MxRTra83EojUcL1UMkkEHAq25ETb4U3wKC2BDLYWjzh87yd5NRFnJtwdaQc4DipTcSiuJNfwytbXmKb7fGI7cNMGWIiLVgD+aarT4A1N5NKosTg2VktUScYuLadbFEKXwj+7Q1EF1VI82EcjacRFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxDCB2rRUBfd8nCDsOF4pkvfIWxf6Q+Hl5ENg9xHpL8=;
 b=Duiu2iXJ/JdBei0J5gThGeYXN/Q7OqYKSnkpD21ek+ffZkXn5zYZ+w2R+b/Any4E5byW85j+ffDCFsvH5JAAJZZfcg0wyt4uOOYz2EfFlvge+IPaEWLkuGGKX56M3Vt6zJIuwzcgqtl/ubxN6+kOZaNQl4MnFUzF4DHykx++8nxEClJylqIRAFKLF2d1ncQgthV1mkTOaNzSduF7qRP2+NcuE2DBIE3sw4cK0oVlwnCCkYwtCr/fnS+5NeDS4Qe5XxMTtQq4QHyUnc4y7JlP+O5QizfYbSYno5hdnaVXeWE9x+Mo3m+eTCxRX88qUmsykD6VuI43iAFzpkHiWhO7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxDCB2rRUBfd8nCDsOF4pkvfIWxf6Q+Hl5ENg9xHpL8=;
 b=YkAWy0btEbxaZdo+WFm6RXLCL3CtCGy2xM7FWJLgSLyK0ltmcgG+1E20aj1fBPG5bFHIz/1QRP7hC3uOfzVLgONiIne/GPRWbmWBThheVH17b3iyOZsS9hfnYkd6vLtBYIhc9lUlCZO4kjDxEhKEdvACmUJZTWA4IdDU/DIJqR4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 11:58:44 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:58:44 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 11/14] migration/ram: add support to send encrypted pages
Date: Wed,  4 Aug 2021 11:58:33 +0000
Message-Id: <2d6bda0d4cf3202b22d23f3eebf743588f6e506a.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:806:27::29) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SA9PR13CA0144.namprd13.prod.outlook.com (2603:10b6:806:27::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.11 via Frontend Transport; Wed, 4 Aug 2021 11:58:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7db01a1c-4af2-4cc5-c676-08d9573f35c1
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2542A8ED0F45573A9CC3085E8EF19@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G5C9qqD10oxvM1EW47G5WAvSW7HibO6eQleuMaf0rzyqZT8XrG2s9idVLXczzUjLNDFDt2Y8Mb8+TQsxF9wp4Qtvdy+wLJGhKyNQEITt8QGmUvJGlHfu1O8g6U2IHY4WJprPOU9XoDvVrFeohxHHzE+N9xdnnubWe4fdFpUB6pteUUbLbJlmcLvEZye85PmwpnYmuervRGkEGKR6VmpI71BFtSZ00k9VTngfEqBtCy/LdKTSrTi2D2r3Si1KuV/BJJXF2WAQUJpiaJZtavFMrUZ6gLA5Xd2ZN3tS/q6LKQSWkPVRuaRjKgN3Qhn3N+026KuWnb7AoDK9WvmCOM69AoVWmEXpA4Opj7bdrs2rzKdXNXKOUZWF/ku1UNbHkdqeOJ7AdIsxteZxVhyHVpNlB3WqL02lePoy8zoOpmVGSQHUICV+Qf4DJZZ9OxgfJGuyo1w56AfJOh1cVRPLE4jDXCoPxpHb2/K2a3LIrKjqT1x2Y4EhYUNBUoHuxoprlesn0+cFi4fV0edBsmZKW8EYbVvHRlX3YwfFRlZqasXV2VcXTaL6oXh7BgtPzzNzh0IuN3hncM8atgjlXXjkFJ53/6xIzTTrW9LNwO7wmzq1yeg1pvLuuQSUhXhyn9tGchGGiNJs6vKkskzaTKjA/t5nKqHLSWn6ghkp99vttrLGWc/naNAWnKZKPmYooo6683V/H5JNXnA349D4myfRKMkJQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(4326008)(83380400001)(66946007)(316002)(2906002)(2616005)(956004)(36756003)(86362001)(6666004)(8936002)(38350700002)(30864003)(26005)(6916009)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66476007)(66556008)(186003)(7696005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6idJrEYuH9HogJyuPkJU1i8jJcb3aoPFFOyPErc1oflUNp+Wr5AD5GWpX8Il?=
 =?us-ascii?Q?xklFvwPcw8mxc0Ho5XegNHQhqkyj/xv6rp4su1BtJFYc2T0btKjYfHWiHVZS?=
 =?us-ascii?Q?h6AVMzvud8np2YgV0x9GIEXm/vJZGWxRUn6G+VIvBjA6Qxzf72U1XOnQrfiv?=
 =?us-ascii?Q?zGOHv+F7VeM/Oj4BFZs2XfTGPyGDaYKZa15ul/BGYEfwnseQLP0yVV5keOWe?=
 =?us-ascii?Q?rUpgCPAxT+YPkk7jfFU30j8eiM/xhzd/SOTf306OUrv6nMmskeHtu0221Ain?=
 =?us-ascii?Q?4UiPG/Il7kjq+CsXghCvlXxJjs4axh+KYjJ95K4J/lpRBytxuWuUmdgllzhA?=
 =?us-ascii?Q?lYv45A/CtQ6aN0WXApb8rF2QlznvAvZwladyKFBkU2jkqXPze8Xnnox57tUC?=
 =?us-ascii?Q?N7SBLU1v/q5bcWBFH24oKhBlMqrH73noM5kVRWK9HDVySBogtmG1Fy6vESTa?=
 =?us-ascii?Q?pSnFTnz1v5YmhKANvFfKF6ydaVy16FpGIGNvISZEIepFHrF51BO3yVatKX+W?=
 =?us-ascii?Q?xiLPbcuoxO4Dmq9iCKyqrXA0gN2Qb/N6MDCrN8VgexiwFk5KO1p+NytqVGXN?=
 =?us-ascii?Q?qRO2UxTAxGr/0XneRRAfsqMLwuEJU3f+z/6WG9rqLWt/CHIIp7My/gAhy4tx?=
 =?us-ascii?Q?yvOX+27L3gd6rrZbmttOYBrr/Vi2KnAaF5eutpvICcPf51KZObzY1QSt0qXL?=
 =?us-ascii?Q?hDDszEBwGsbtdkt6uvKz9AzqMlY4OckAM0gpw62c7Qmp/iAVCSIO2K6mfA7h?=
 =?us-ascii?Q?+y/YpdnYjlMb+69FnAMSQNkhaTKr7BT8L/5sXD3SJshEaN13ywtKofEtsNAc?=
 =?us-ascii?Q?jh7w/eKE/5MfaGoPps6fUHfJR/gcKUlsompCf/nWSnhk6pQTwVK827BXA2Zo?=
 =?us-ascii?Q?0qOfO1HR1tkp7mBGZezxAiDQ4LsZiYnvB6UHTopVjrVzqk2GHyAwmE2sG0K1?=
 =?us-ascii?Q?YGiERhLHfqUeKeEpZPMdRzGBMBIHECL7+3n5Xj0aEdTra4/sx/S0MX6zX2z7?=
 =?us-ascii?Q?iLItSNGHThmy728Fs+0lz0zbO0JNChlgcHmFyg2b58CXezTv/Ret5uUiiQqL?=
 =?us-ascii?Q?Nxtu8CMSz5cM6U4lsE/WQ/uISZAFOAFvG7UALKaz79+UgYm7R+aEBjX1J1is?=
 =?us-ascii?Q?kELxEAavpeJp6209IfAlyPtql3bQ3hpecp86gd6c/FYPcxvnTg0kPHzjITXR?=
 =?us-ascii?Q?ODXJaz+e2OuEiV9N/hlqqfwNkoV9vgXUjpgXstpRR+ucapzzoJUjqiSMolqx?=
 =?us-ascii?Q?V1R2Z3VUcOSyJhf5HHeH64EX5Yg0J+ks8TqVfTHXoFjXTgmwLLRzJ/oW7qh4?=
 =?us-ascii?Q?Rnaj37KG+7s233jUWXJOmkG6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db01a1c-4af2-4cc5-c676-08d9573f35c1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:58:44.7672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbbkOfLwVdrXEd9kreYVSnFizwy8PJ+nYrQ3WF4BF3JKzEPknIPT6dBQdHZcEqoW8JnKcSPPtr+Rw6YSdr0G8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Received-SPF: softfail client-ip=40.107.93.77;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Brijesh Singh <brijesh.singh@amd.com>

When memory encryption is enabled, the guest memory will be encrypted with
the guest specific key. The patch introduces RAM_SAVE_FLAG_ENCRYPTED_PAGE
flag to distinguish the encrypted data from plaintext. Encrypted pages
may need special handling. The sev_save_outgoing_page() is used
by the sender to write the encrypted pages onto the socket, similarly the
sev_load_incoming_page() is used by the target to read the
encrypted pages from the socket and load into the guest memory.

Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
Co-developed-by: Ashish Kalra <ashish.kalra@amd.com>
Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/sysemu/sev.h  |   4 ++
 migration/migration.h |   1 +
 migration/ram.c       | 162 +++++++++++++++++++++++++++++++++++++++++-
 target/i386/sev.c     |  14 ++++
 4 files changed, 180 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 118ee66406..023e694ac4 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -17,6 +17,9 @@
 #include <qapi/qapi-types-migration.h>
 #include "sysemu/kvm.h"
 
+#define RAM_SAVE_ENCRYPTED_PAGE           0x1
+#define RAM_SAVE_SHARED_REGIONS_LIST      0x2
+
 bool sev_enabled(void);
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
@@ -34,5 +37,6 @@ int sev_remove_shared_regions_list(unsigned long gfn_start,
 int sev_add_shared_regions_list(unsigned long gfn_start, unsigned long gfn_end);
 int sev_save_outgoing_shared_regions_list(QEMUFile *f);
 int sev_load_incoming_shared_regions_list(QEMUFile *f);
+bool sev_is_gfn_in_unshared_region(unsigned long gfn);
 
 #endif
diff --git a/migration/migration.h b/migration/migration.h
index 7a5aa8c2fd..eda07e214d 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -391,5 +391,6 @@ bool migration_rate_limit(void);
 void migration_cancel(void);
 
 void populate_vfio_info(MigrationInfo *info);
+bool memcrypt_enabled(void);
 
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7af..1cb8d57a89 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -55,6 +55,11 @@
 #include "qemu/iov.h"
 #include "multifd.h"
 #include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "exec/confidential-guest-support.h"
+
+/* Defines RAM_SAVE_ENCRYPTED_PAGE and RAM_SAVE_SHARED_REGION_LIST */
+#include "sysemu/sev.h"
 
 #if defined(__linux__)
 #include "qemu/userfaultfd.h"
@@ -78,12 +83,20 @@
 #define RAM_SAVE_FLAG_XBZRLE   0x40
 /* 0x80 is reserved in migration.h start with 0x100 next */
 #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
+#define RAM_SAVE_FLAG_ENCRYPTED_DATA   0x200
 
 static inline bool is_zero_range(uint8_t *p, uint64_t size)
 {
     return buffer_is_zero(p, size);
 }
 
+bool memcrypt_enabled(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    return ms->cgs->ready;
+}
+
 XBZRLECacheStats xbzrle_counters;
 
 /* struct contains XBZRLE cache and a static page
@@ -449,6 +462,8 @@ static QemuCond decomp_done_cond;
 
 static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
                                  ram_addr_t offset, uint8_t *source_buf);
+static int ram_save_encrypted_page(RAMState *rs, PageSearchStatus *pss,
+                                   bool last_stage);
 
 static void *do_data_compress(void *opaque)
 {
@@ -1165,6 +1180,80 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
     return 1;
 }
 
+/**
+ * ram_save_encrypted_page - send the given encrypted page to the stream
+ */
+static int ram_save_encrypted_page(RAMState *rs, PageSearchStatus *pss,
+                                   bool last_stage)
+{
+    int ret;
+    uint8_t *p;
+    RAMBlock *block = pss->block;
+    ram_addr_t offset = pss->page << TARGET_PAGE_BITS;
+    uint64_t bytes_xmit;
+    MachineState *ms = MACHINE(qdev_get_machine());
+    ConfidentialGuestSupportClass *cgs_class =
+        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(ms->cgs));
+    struct ConfidentialGuestMemoryEncryptionOps *ops =
+        cgs_class->memory_encryption_ops;
+
+    p = block->host + offset;
+
+    ram_counters.transferred +=
+        save_page_header(rs, rs->f, block,
+                    offset | RAM_SAVE_FLAG_ENCRYPTED_DATA);
+
+    qemu_put_be32(rs->f, RAM_SAVE_ENCRYPTED_PAGE);
+    ret = ops->save_outgoing_page(rs->f, p, TARGET_PAGE_SIZE, &bytes_xmit);
+    if (ret) {
+        return -1;
+    }
+
+    ram_counters.transferred += bytes_xmit;
+    ram_counters.normal++;
+
+    return 1;
+}
+
+/**
+ * ram_save_shared_region_list: send the shared region list
+ */
+static int ram_save_shared_region_list(RAMState *rs, QEMUFile *f)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    ConfidentialGuestSupportClass *cgs_class =
+        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(ms->cgs));
+    struct ConfidentialGuestMemoryEncryptionOps *ops =
+        cgs_class->memory_encryption_ops;
+
+    save_page_header(rs, rs->f, rs->last_seen_block,
+                     RAM_SAVE_FLAG_ENCRYPTED_DATA);
+    qemu_put_be32(rs->f, RAM_SAVE_SHARED_REGIONS_LIST);
+    return ops->save_outgoing_shared_regions_list(rs->f);
+}
+
+static int load_encrypted_data(QEMUFile *f, uint8_t *ptr)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    ConfidentialGuestSupportClass *cgs_class =
+        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(ms->cgs));
+    struct ConfidentialGuestMemoryEncryptionOps *ops =
+        cgs_class->memory_encryption_ops;
+
+    int flag;
+
+    flag = qemu_get_be32(f);
+
+    if (flag == RAM_SAVE_ENCRYPTED_PAGE) {
+        return ops->load_incoming_page(f, ptr);
+    } else if (flag == RAM_SAVE_SHARED_REGIONS_LIST) {
+        return ops->load_incoming_shared_regions_list(f);
+    } else {
+        error_report("unknown encrypted flag %x", flag);
+        return 1;
+    }
+}
+
 /**
  * ram_save_page: send the given page to the stream
  *
@@ -1965,6 +2054,35 @@ static bool save_compress_page(RAMState *rs, RAMBlock *block, ram_addr_t offset)
     return false;
 }
 
+/**
+ * encrypted_test_list: check if the page is encrypted
+ *
+ * Returns a bool indicating whether the page is encrypted.
+ */
+static bool encrypted_test_list(RAMState *rs, RAMBlock *block,
+                                  unsigned long page)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    ConfidentialGuestSupportClass *cgs_class =
+        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(ms->cgs));
+    struct ConfidentialGuestMemoryEncryptionOps *ops =
+        cgs_class->memory_encryption_ops;
+    unsigned long gfn;
+
+    /* ROM devices contains the unencrypted data */
+    if (memory_region_is_rom(block->mr)) {
+        return false;
+    }
+
+    /*
+     * Translate page in ram_addr_t address space to GPA address
+     * space using memory region.
+     */
+    gfn = page + (block->mr->addr >> TARGET_PAGE_BITS);
+
+    return ops->is_gfn_in_unshared_region(gfn);
+}
+
 /**
  * ram_save_target_page: save one target page
  *
@@ -1985,6 +2103,17 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
         return res;
     }
 
+    /*
+     * If memory encryption is enabled then use memory encryption APIs
+     * to write the outgoing buffer to the wire. The encryption APIs
+     * will take care of accessing the guest memory and re-encrypt it
+     * for the transport purposes.
+     */
+    if (memcrypt_enabled() &&
+        encrypted_test_list(rs, pss->block, pss->page)) {
+        return ram_save_encrypted_page(rs, pss, last_stage);
+    }
+
     if (save_compress_page(rs, block, offset)) {
         return 1;
     }
@@ -2786,6 +2915,18 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
     }
 }
 
+static int ram_encrypted_save_setup(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    ConfidentialGuestSupportClass *cgs_class =
+        (ConfidentialGuestSupportClass *) object_get_class(OBJECT(ms->cgs));
+    struct ConfidentialGuestMemoryEncryptionOps *ops =
+        cgs_class->memory_encryption_ops;
+    MigrationParameters *p = &migrate_get_current()->parameters;
+
+    return ops->save_setup(p);
+}
+
 /*
  * Each of ram_save_setup, ram_save_iterate and ram_save_complete has
  * long-running RCU critical section.  When rcu-reclaims in the code
@@ -2820,6 +2961,13 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     (*rsp)->f = f;
 
     WITH_RCU_READ_LOCK_GUARD() {
+
+        if (memcrypt_enabled()) {
+            if (ram_encrypted_save_setup()) {
+                return -1;
+            }
+        }
+
         qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
 
         RAMBLOCK_FOREACH_MIGRATABLE(block) {
@@ -3004,6 +3152,11 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
 
         flush_compressed_data(rs);
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
+
+        /* send the shared regions list */
+        if (memcrypt_enabled()) {
+            ret = ram_save_shared_region_list(rs, f);
+        }
     }
 
     if (ret >= 0) {
@@ -3808,7 +3961,8 @@ static int ram_load_precopy(QEMUFile *f)
         }
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
-                     RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
+                     RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE |
+                     RAM_SAVE_FLAG_ENCRYPTED_DATA)) {
             RAMBlock *block = ram_block_from_stream(f, flags);
 
             host = host_from_ram_block_offset(block, addr);
@@ -3937,6 +4091,12 @@ static int ram_load_precopy(QEMUFile *f)
                 break;
             }
             break;
+        case RAM_SAVE_FLAG_ENCRYPTED_DATA:
+            if (load_encrypted_data(f, host)) {
+                    error_report("Failed to load encrypted data");
+                    ret = -EINVAL;
+            }
+            break;
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             multifd_recv_sync_main();
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 789051f7b4..d22f2ef6dc 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -142,6 +142,7 @@ static struct ConfidentialGuestMemoryEncryptionOps sev_memory_encryption_ops = {
     .save_setup = sev_save_setup,
     .save_outgoing_page = sev_save_outgoing_page,
     .load_incoming_page = sev_load_incoming_page,
+    .is_gfn_in_unshared_region = sev_is_gfn_in_unshared_region,
     .save_outgoing_shared_regions_list = sev_save_outgoing_shared_regions_list,
     .load_incoming_shared_regions_list = sev_load_incoming_shared_regions_list,
 };
@@ -1647,6 +1648,19 @@ int sev_load_incoming_shared_regions_list(QEMUFile *f)
     return 0;
 }
 
+bool sev_is_gfn_in_unshared_region(unsigned long gfn)
+{
+    SevGuestState *s = sev_guest;
+    struct shared_region *pos;
+
+    QTAILQ_FOREACH(pos, &s->shared_regions_list, list) {
+        if (gfn >= pos->gfn_start && gfn < pos->gfn_end) {
+            return false;
+        }
+    }
+    return true;
+}
+
 static void
 sev_register_types(void)
 {
-- 
2.17.1


