Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60E42816AD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:34:01 +0200 (CEST)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kON4K-0001AW-RM
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1kOMXB-0005JO-V7
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:59:46 -0400
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com
 ([40.107.94.51]:54113 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1kOMXA-0006BP-6B
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:59:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdyUv/1fYR8CZbxcGqptRdTOJTwGOIkxKiw2tflzFk+WIQP+KxpQlvyd1ZyjvhUyHxTh58x0Ix+9ZViG9wDEj6cLaDtcGuomkyP26KOyCBuMkNKxGO2AX+nd1AidBqxAVdWYiBQCzmROtnndKrt+s27QN2UdUaERhcyXntzDXNqnhcUw2AG98AdXM9LPocosDg4sHuFxmslxa5Wpk1hecLaS+XW/++Xovnkk0yVUHf/aEMzpW0+X+sDtPAHkoyizjBzty3OIo09QqkxBgUZOaiuq5WH7OVZSiu56eXywZspx19QIO6gWgftF8FiPy1chKl8ipuEsV5XAoez5EEIr/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mTs2yVnrdf66KmKnSbYbmPCqj/NofZSC4A34MhcMGU=;
 b=YTsNARVz/Hdc/MpUccbYgjYm0Pbl/WE7Gux6vuZiOMxhuybtb5SLhzc558wtEV2HS3+UvKl0sqIFeYDesUB9Y92Cl4hoAMFriIEfpU4hV1zBuzeODNpdbTjEAazWO1EVwFaGukU80+aRsm33VoS+ZkPAjh2IVGIhpIfnFHLTj4eCuhbI1Sz/zl256XiUBKrmgaeqzPRc7OUIHTqcJyJHh6CpF17ITLkxantb+EaNVOCzaFugh7Kq4xKujNbrjsKF8D7jvJnqq/+avWT9iNyY8ZAK+oO4bqXjrUglD66AK5333vi1noCi/bQzqj6XL//bEHb6LLkIyJYvEpqnDrxXgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mTs2yVnrdf66KmKnSbYbmPCqj/NofZSC4A34MhcMGU=;
 b=T2Ry+FNXN9UPrjkVBzSy9xFKTj17GCg35a8QkFf6Txtvk4cAhaCPpsRhzupiAxxFfIHIPrIHn/D3MEJq7HIqHqKvlMPxA64BAa2rRl/ZkG8BktJJD9EYtX/KIhHj5HRR3lgbdgDBi0rRpGK2xOQSSh48cL779PMlVGwSqkakxzg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1494.namprd12.prod.outlook.com (2603:10b6:910:f::22)
 by CY4PR1201MB0149.namprd12.prod.outlook.com (2603:10b6:910:1c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Fri, 2 Oct
 2020 14:59:39 +0000
Received: from CY4PR12MB1494.namprd12.prod.outlook.com
 ([fe80::11f9:59c8:16c0:7718]) by CY4PR12MB1494.namprd12.prod.outlook.com
 ([fe80::11f9:59c8:16c0:7718%8]) with mapi id 15.20.3433.038; Fri, 2 Oct 2020
 14:59:39 +0000
From: Wei Huang <wei.huang2@amd.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 2/3] amd-iommu: Sync IOVA-to-GPA translation during page
 invalidation
Date: Fri,  2 Oct 2020 09:59:06 -0500
Message-Id: <20201002145907.1294353-3-wei.huang2@amd.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20201002145907.1294353-1-wei.huang2@amd.com>
References: <20201002145907.1294353-1-wei.huang2@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [165.204.78.2]
X-ClientProxiedBy: DM3PR12CA0135.namprd12.prod.outlook.com
 (2603:10b6:0:51::31) To CY4PR12MB1494.namprd12.prod.outlook.com
 (2603:10b6:910:f::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ethanolx56bbhost.amd.com (165.204.78.2) by
 DM3PR12CA0135.namprd12.prod.outlook.com (2603:10b6:0:51::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 14:59:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eabcdb46-f602-47ec-74ba-08d866e3c8e9
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0149:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB01492C901595C46B0B912EE9CF310@CY4PR1201MB0149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1l8g0H7oVSEz/EJekNsUKIHpwUYIW6gqyI87CWyRwiX2wtAm+XRe3+CDTUZKLAoYbjjesq/Jn1z90As2lq24OwCAHjAfmBgxidh+qVeLML14WPd8okxbP+8e7JKupn9hD6FLhRUOxdygMGoCNFW+rhHzS5a20zFYo9YwOfPihwY1Q50ty05MyCoZyTAQNc9i6t/2hMAihDp3C9pkjwH3KEs/zkFudYFk2xvZm8symdf4IUAsRL7Iq6OxPot795FZRIo62bZQ7VO0e3hRjOApNhENSLN92AIbQ8HrdgWNYHfqwZCU7Re8MxbI8GzJAQjuw4Nq9D5WIC+fwffU/88MnyO2ULgz6o9AK5jvu9S0fghzq60UZIBozv8yLXA9FDwIRAeuzthwQAGsyGtHqAE+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(66476007)(8936002)(66556008)(66946007)(956004)(8676002)(2616005)(316002)(83380400001)(4326008)(26005)(86362001)(52116002)(6666004)(1076003)(478600001)(186003)(36756003)(6486002)(2906002)(16526019)(5660300002)(6916009)(7696005)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: bWV7n8FzVGTiigQa12Nd8lc2F5kLwWqPLrc9b3sXU4kKk7Et7qW+jqUpOf9ah2F9nxI2LZ+9XXz5uq7B6u37gCluyyiiU1QDuk5BN9vW0WH9fe3aVFYqsE5Xd3ZsgoKhe2QKYpCrqrImvEukUeExKzHwyaqWEjMytC7/0z2Lk9VpLeLbsvMTLhzy/GmywR6ZYQJPSSsEIkGnS9KuYbasDx0wMIaTCjM2tJyn7ApSUW6PjPqd59A9F/H7IwaTbgn9LVB40LSxH/IZdFQD1e40Xa32gixGCWLZzs17qKiuldrf9uk/8hM2ELC0ec3FdTDr6IG3DrUzUjj2TPPTdcIKcb0Ii2bPAtszyJgvvxBCv0iFb3GzStA9rNPbWwjWEbtbhlKP/4/Df2fpt69IHz0GshZKafcnd/QWet7W+iyDeDZrrNxBHhNm2JLzBEsAx1Ce8IpeAk62exKF/iISzxBT2iTHS5O3p0CufNSL2WDT5YKMeistbaHo4f70RR8W5ZRnXDoOdRTj4djAkWZBpKYHQoeHZiVXr4o2XdZIO9UkMOYRYDYuvl+AtkHYqUA7IN2xakvHPGB2Z6BxULRn8KkBaj5ZFzQ8M1PIMlmr6rA87yiylyfKi1HJEj6xuKrHVLrqMmrvNbA/2FFtvsk5SfGzRQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabcdb46-f602-47ec-74ba-08d866e3c8e9
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 14:59:38.9796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p45+LihcOZVP7dPLXryGwAmPRljcRxcVDK3XsGQJOu57n8ihxLD4GZTZk7inuLbV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0149
Received-SPF: none client-ip=40.107.94.51; envelope-from=Wei.Huang2@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 10:59:41
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ehabkost@redhat.com, mst@redhat.com, wei.huang2@amd.com, peterx@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, Suravee.Suthikulpanit@amd.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support to sync the IOVA-to-GPA translation at the time of IOMMU
page invalidation. This function is called when two IOMMU commands,
AMDVI_CMD_INVAL_AMDVI_PAGES and AMDVI_CMD_INVAL_AMDVI_ALL, are
intercepted. Address space notifiers are called accordingly.

Co-developed-by: Wei Huang <wei.huang2@amd.com>
Signed-off-by: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
---
 hw/i386/amd_iommu.c | 177 ++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/amd_iommu.h |  10 +++
 2 files changed, 187 insertions(+)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index c7d24a05484d..7ce68289d20c 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -76,6 +76,12 @@ typedef struct AMDVIIOTLBEntry {
     uint64_t page_mask;         /* physical page size  */
 } AMDVIIOTLBEntry;
 
+static bool amdvi_get_dte(AMDVIState *s, int devid, uint64_t *entry);
+static void amdvi_sync_domain(AMDVIState *s, uint32_t domid,
+                              uint64_t addr, uint16_t flags);
+static void amdvi_walk_level(AMDVIAddressSpace *as, uint64_t pte,
+                             uint64_t iova, uint64_t partial);
+
 /* configure MMIO registers at startup/reset */
 static void amdvi_set_quad(AMDVIState *s, hwaddr addr, uint64_t val,
                            uint64_t romask, uint64_t w1cmask)
@@ -443,6 +449,78 @@ static void amdvi_address_space_unmap(AMDVIAddressSpace *as, IOMMUNotifier *n)
     memory_region_notify_one(n, &entry);
 }
 
+/*
+ * Sync the IOVA-to-GPA translation at the time of IOMMU page invalidation.
+ * This function is called when IOMMU commands, AMDVI_CMD_INVAL_AMDVI_PAGES
+ * and AMDVI_CMD_INVAL_AMDVI_ALL, are triggred.
+ *
+ * The range of addr invalidation is determined by addr and flags, using
+ * the following rules:
+ *   - All pages
+ *     In this case, we unmap the whole address space and then re-walk the
+ *     I/O page table to sync the mapping relationship.
+ *   - Single page
+ *     Re-walk the page based on the specified iova, and only sync the
+ *     newly mapped page.
+ */
+static void amdvi_sync_domain(AMDVIState *s, uint32_t domid,
+                              uint64_t addr, uint16_t flags)
+{
+    AMDVIAddressSpace *as;
+    bool sync_all_domains = false;
+    uint64_t mask, size = 0x1000;
+
+    if (domid == AMDVI_DOMAIN_ALL) {
+        sync_all_domains = true;
+    }
+
+     /* S=1 means the invalidation size is from addr field; otherwise 4KB */
+    if (flags & AMDVI_CMD_INVAL_IOMMU_PAGES_S_BIT) {
+        uint32_t zbit = cto64(addr | 0xFFF) + 1;
+
+        size = 1ULL << zbit;
+
+        if (size < 0x1000) {
+            addr = 0;
+            size = AMDVI_PGSZ_ENTIRE;
+        } else {
+            mask = ~(size - 1);
+            addr &= mask;
+        }
+    }
+
+    QLIST_FOREACH(as, &s->amdvi_as_with_notifiers, next) {
+        uint64_t dte[4];
+        IOMMUNotifier *n;
+
+        if (!amdvi_get_dte(s, as->devfn, dte)) {
+            continue;
+        }
+
+        if (!sync_all_domains && (domid != (dte[1] & 0xFFFULL))) {
+            continue;
+        }
+
+        /*
+         * In case of syncing more than a page, we invalidate the entire
+         * address range and re-walk the whole page table.
+         */
+        if (size == AMDVI_PGSZ_ENTIRE) {
+            IOMMU_NOTIFIER_FOREACH(n, &as->iommu) {
+                amdvi_address_space_unmap(as, n);
+            }
+        } else if (size > 0x1000) {
+            IOMMU_NOTIFIER_FOREACH(n, &as->iommu) {
+                if (n->start <= addr && addr + size < n->end) {
+                    amdvi_address_space_unmap(as, n);
+                }
+            }
+        }
+
+        amdvi_walk_level(as, dte[0], addr, 0);
+    }
+}
+
 static gboolean amdvi_iotlb_remove_by_domid(gpointer key, gpointer value,
                                             gpointer user_data)
 {
@@ -455,6 +533,8 @@ static gboolean amdvi_iotlb_remove_by_domid(gpointer key, gpointer value,
 static void amdvi_inval_pages(AMDVIState *s, uint64_t *cmd)
 {
     uint16_t domid = cpu_to_le16((uint16_t)extract64(cmd[0], 32, 16));
+    uint64_t addr  = cpu_to_le64(extract64(cmd[1], 12, 52)) << 12;
+    uint16_t flags = cpu_to_le16((uint16_t)extract64(cmd[1], 0, 12));
 
     if (extract64(cmd[0], 20, 12) || extract64(cmd[0], 48, 12) ||
         extract64(cmd[1], 3, 9)) {
@@ -465,6 +545,8 @@ static void amdvi_inval_pages(AMDVIState *s, uint64_t *cmd)
     g_hash_table_foreach_remove(s->iotlb, amdvi_iotlb_remove_by_domid,
                                 &domid);
     trace_amdvi_pages_inval(domid);
+
+    amdvi_sync_domain(s, domid, addr, flags);
 }
 
 static void amdvi_prefetch_pages(AMDVIState *s, uint64_t *cmd)
@@ -910,6 +992,101 @@ static inline uint64_t amdvi_get_pte_entry(AMDVIState *s, uint64_t pte_addr,
     return pte;
 }
 
+static inline uint64_t pte_get_page_size(uint64_t level)
+{
+    return 1UL << ((level * 9) + 3);
+}
+
+static void amdvi_sync_iova(AMDVIAddressSpace *as, uint64_t pte, uint64_t iova)
+{
+    IOMMUTLBEntry entry;
+    uint64_t addr = pte & AMDVI_DEV_PT_ROOT_MASK;
+    uint32_t level = get_pte_translation_mode(pte);
+    uint64_t size = pte_get_page_size(level + 1);
+    uint64_t perm = amdvi_get_perms(pte);
+
+    assert(level == 0 || level == 7);
+
+    entry.target_as = &address_space_memory;
+    entry.iova = iova ;
+    entry.perm = perm;
+    if (level == 0) {
+        entry.addr_mask = size - 1;
+        entry.translated_addr = addr;
+    } else if (level == 7) {
+        entry.addr_mask = (1 << (cto64(addr | 0xFFF) + 1)) - 1;
+        entry.translated_addr = addr & ~entry.addr_mask;
+    }
+
+    memory_region_notify_iommu(&as->iommu, 0, entry);
+}
+
+/*
+ * Walk the I/O page table and notify mapping change. Note that iova
+ * determines if this function's behavior:
+ *   - iova == 0: re-walk the whole page table
+ *   - iova != 0: re-walk the address defined in iova
+ */
+static void amdvi_walk_level(AMDVIAddressSpace *as, uint64_t pte,
+                             uint64_t iova, uint64_t partial)
+{
+    uint64_t index = 0;
+    uint8_t level = get_pte_translation_mode(pte);
+    uint64_t cur_addr = pte & AMDVI_DEV_PT_ROOT_MASK;
+    uint64_t end_addr = cur_addr + 4096;
+    uint64_t new_partial = 0;
+
+    if (!(pte & AMDVI_PTE_PRESENT)) {
+        return;
+    }
+
+    if (level == 7) {
+        amdvi_sync_iova(as, pte, iova);
+        return;
+    }
+
+    /* narrow the scope of table walk if iova != 0 */
+    if (iova) {
+        cur_addr += ((iova >> (3 + 9 * level)) & 0x1FF) << 3;
+        end_addr = cur_addr + 8;
+    }
+
+    while (cur_addr < end_addr) {
+        int cur_addr_inc = 8;
+        int index_inc = 1;
+
+        pte = amdvi_get_pte_entry(as->iommu_state, cur_addr, as->devfn);
+        /* validate the entry */
+        if (!(pte & AMDVI_PTE_PRESENT)) {
+            goto next;
+        }
+
+        if (level > 1) {
+            new_partial = (partial << 9) | index;
+            amdvi_walk_level(as, pte, iova, new_partial);
+        } else {
+            /* found a page, sync the mapping first */
+            if (iova) {
+                amdvi_sync_iova(as, pte, iova);
+            } else {
+                amdvi_sync_iova(as, pte, ((partial << 9) | index) << 12);
+            }
+
+            /* skip following entries when a large page is found */
+            if (get_pte_translation_mode(pte) == 7) {
+                int skipped = 1 << (cto64(pte >> 12) + 1);
+
+                cur_addr_inc = 8 * skipped;
+                index_inc = skipped;
+            }
+        }
+
+next:
+        cur_addr += cur_addr_inc;
+        index += index_inc;
+    }
+}
+
 static void amdvi_page_walk(AMDVIAddressSpace *as, uint64_t *dte,
                             IOMMUTLBEntry *ret, unsigned perms,
                             hwaddr addr)
diff --git a/hw/i386/amd_iommu.h b/hw/i386/amd_iommu.h
index 29b7a35a51a5..6d80f4913984 100644
--- a/hw/i386/amd_iommu.h
+++ b/hw/i386/amd_iommu.h
@@ -123,6 +123,8 @@
 #define AMDVI_CMD_COMPLETE_PPR_REQUEST    0x07
 #define AMDVI_CMD_INVAL_AMDVI_ALL         0x08
 
+#define AMDVI_CMD_INVAL_IOMMU_PAGES_S_BIT (1ULL << 0)
+
 #define AMDVI_DEVTAB_ENTRY_SIZE           32
 
 /* Device table entry bits 0:63 */
@@ -148,6 +150,9 @@
 #define AMDVI_EVENT_ILLEGAL_COMMAND_ERROR (0x5U << 12)
 #define AMDVI_EVENT_COMMAND_HW_ERROR      (0x6U << 12)
 
+/* PTE bits */
+#define AMDVI_PTE_PRESENT                 (1ULL << 0)
+
 #define AMDVI_EVENT_LEN                  16
 #define AMDVI_PERM_READ             (1 << 0)
 #define AMDVI_PERM_WRITE            (1 << 1)
@@ -198,6 +203,11 @@
 #define AMDVI_MAX_PH_ADDR          (40UL << 8)
 #define AMDVI_MAX_GVA_ADDR         (48UL << 15)
 
+#define AMDVI_PGSZ_ENTIRE          (0X0007FFFFFFFFF000ULL)
+
+/* The domain id is 16-bit, so use 32-bit all 1's to represent all domains */
+#define AMDVI_DOMAIN_ALL           (UINT32_MAX)
+
 /* Completion Wait data size */
 #define AMDVI_COMPLETION_DATA_SIZE    8
 
-- 
2.25.2


