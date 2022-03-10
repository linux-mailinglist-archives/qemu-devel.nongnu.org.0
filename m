Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722C4D45A0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:25:53 +0100 (CET)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGvY-0001hS-2a
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGmf-0004JP-6M
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGmd-0005tU-7E
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:40 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A9rS2H020319
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dNAfhfQAz+P+bmZW5Pz++s5XhKYotLEG36PfSjZOgDU=;
 b=n7vV01sWo0UTwdcojnoHdDo/fP0Jo4pdnncAWgR+kHYw4uhR8W4ujJhQynJA8T8oiRRT
 7xR9Luv44Vh7x3wEY8D3VRuBFzhYbkinabSBgWQtxPYe++aTHSOtjx5vC9CN5HKXAHzd
 xIw0XOrV/Th1dT7AlWlVD+flU6JfbRn28LrHT65yBpkvTDUjQbcTp8IKcviMUZY4JKv+
 AE4Ngvvgw+37pSeap+AC/qmLQZSv092N78qrryiviDb7cgKA5frAmirfxEqyxyI7kNe2
 Uluyx8QljbE4VUCddH5a6X9E5tFsqK10XemjW1fIhOBjr72770Z72QtVQu+X9SPEHmLp fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n1jmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:37 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AB0mtf010869
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:37 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eqf3n1jm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:37 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABF4Uj014763;
 Thu, 10 Mar 2022 11:16:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3ekyg8jmjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22ABGWIW59113800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:16:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B6254C044;
 Thu, 10 Mar 2022 11:16:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2E944C040;
 Thu, 10 Mar 2022 11:16:31 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:16:31 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] dump/dump: Add arch section support
Date: Thu, 10 Mar 2022 11:16:08 +0000
Message-Id: <20220310111608.3362-6-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310111608.3362-1-frankja@linux.ibm.com>
References: <20220310111608.3362-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zGdyiKhcP91vmzK7my78W0fMRtgpNgiX
X-Proofpoint-GUID: Tv_e_x1TiFFBU7LQiqAbDilhlvoC1RyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com, mhartmay@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add hooks which architectures can use to add arbitrary data to custom
sections.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c                | 21 ++++++++++++++++++---
 include/sysemu/dump-arch.h | 27 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 7b3fd6a065..a9d9ea514d 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -398,6 +398,7 @@ static void prepare_elf_section_hdrs(DumpState *s)
     /*
      * Section ordering:
      * - HDR zero (if needed)
+     * - Arch section hdrs
      * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
@@ -415,6 +416,9 @@ static void prepare_elf_section_hdrs(DumpState *s)
         return;
     }
 
+    size = dump_arch_sections_write_hdr(&s->dump_info, s, buff_hdr);
+    buff_hdr += size;
+
     /*
      * String table needs to be last section since strings are added
      * via arch_sections_write_hdr().
@@ -565,14 +569,23 @@ static void get_offset_range(hwaddr phys_addr,
     }
 }
 
-static void write_elf_loads(DumpState *s, Error **errp)
+static void write_elf_phdr_loads(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
     hwaddr offset, filesz;
     MemoryMapping *memory_mapping;
     uint32_t phdr_index = 1;
+    hwaddr min = 0, max = 0;
 
     QTAILQ_FOREACH(memory_mapping, &s->list.head, next) {
+        if (memory_mapping->phys_addr < min) {
+            min = memory_mapping->phys_addr;
+        }
+        if (memory_mapping->phys_addr + memory_mapping->length > max) {
+            max = memory_mapping->phys_addr + memory_mapping->length;
+        }
+
+
         get_offset_range(memory_mapping->phys_addr,
                          memory_mapping->length,
                          s, &offset, &filesz);
@@ -685,8 +698,8 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write all PT_LOAD to vmcore */
-    write_elf_loads(s, errp);
+    /* write all PT_LOADs to vmcore */
+    write_elf_phdr_loads(s, errp);
     if (*errp) {
         return;
     }
@@ -755,6 +768,7 @@ static void dump_end(DumpState *s, Error **errp)
         return;
     }
     s->elf_section_data = g_malloc0(s->elf_section_data_size);
+    dump_arch_sections_write(&s->dump_info, s, s->elf_section_data);
 
     /* write sections to vmcore */
     write_elf_sections(s, errp);
@@ -1939,6 +1953,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
      * If phdr_num overflowed we have at least one section header
      * More sections/hdrs can be added by the architectures
      */
+    dump_arch_sections_add(&s->dump_info, (void *)s);
     if (s->shdr_num > 1) {
         /* Reserve the string table */
         s->shdr_num += 1;
diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
index e25b02e990..de77908424 100644
--- a/include/sysemu/dump-arch.h
+++ b/include/sysemu/dump-arch.h
@@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
     uint32_t page_size;      /* The target's page size. If it's variable and
                               * unknown, then this should be the maximum. */
     uint64_t phys_base;      /* The target's physmem base. */
+    void (*arch_sections_add_fn)(void *opaque);
+    uint64_t (*arch_sections_write_hdr_fn)(void *opaque, uint8_t *buff);
+    void (*arch_sections_write_fn)(void *opaque, uint8_t *buff);
 } ArchDumpInfo;
 
 struct GuestPhysBlockList; /* memory_mapping.h */
@@ -28,4 +31,28 @@ int cpu_get_dump_info(ArchDumpInfo *info,
                       const struct GuestPhysBlockList *guest_phys_blocks);
 ssize_t cpu_get_note_size(int class, int machine, int nr_cpus);
 
+static inline void dump_arch_sections_add(ArchDumpInfo *info, void *opaque)
+{
+    if (info->arch_sections_add_fn) {
+        info->arch_sections_add_fn(opaque);
+    }
+}
+
+static inline uint64_t dump_arch_sections_write_hdr(ArchDumpInfo *info,
+                                                void *opaque, uint8_t *buff)
+{
+    if (info->arch_sections_write_hdr_fn) {
+        return info->arch_sections_write_hdr_fn(opaque, buff);
+    }
+    return 0;
+}
+
+static inline void dump_arch_sections_write(ArchDumpInfo *info, void *opaque,
+                                            uint8_t *buff)
+{
+    if (info->arch_sections_write_fn) {
+        info->arch_sections_write_fn(opaque, buff);
+    }
+}
+
 #endif
-- 
2.32.0


