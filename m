Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679D5736F7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:12:36 +0200 (CEST)
Received: from localhost ([::1]:54822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBcAN-0001TP-Cf
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc50-00083w-LA; Wed, 13 Jul 2022 09:07:02 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10072
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc4y-00069o-LG; Wed, 13 Jul 2022 09:07:02 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DCoN3B012557;
 Wed, 13 Jul 2022 13:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rN/tsqBdZ7vcsuY46UbDDEUrlmg7duNLbWlQsKQA/Ck=;
 b=YqtWGymIOftr1afEWkBMShi2nlxWUZPVoc6xAKdNfgVti/8sYOGHcVOVoopC/4FuCtmz
 lj71FQ4HuKbD+75sZB92RkcMAclQO7TATTuAsEVfgx9jn5LsZp3hp63KJ0/0o1KmXM+S
 bV7XMc0YCli7nTJK98ZoljGdfFKKXbiHersIxKNgs37C25+uxe2xZknebVkImmHKgdI4
 kVuFioZDcK+06m7npGGtSOmpLXcE9yitzgwHDXVhcWkYTwS7qH8Sfg5JA8zyl7EwBdgb
 9FyQ5QLbjr3fbk29QHXffBQUP6eL0fSr0Z7mLeEJ6UledB+6g+kSE2xclaNZmu9ybQPN RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9xdk0f8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:59 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DCsTKe030968;
 Wed, 13 Jul 2022 13:06:58 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9xdk0f7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DCoFwa009063;
 Wed, 13 Jul 2022 13:06:56 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhwqag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26DD73Og30015982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 13:07:03 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53A84AE051;
 Wed, 13 Jul 2022 13:06:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45DC5AE045;
 Wed, 13 Jul 2022 13:06:52 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 13:06:52 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH v2 06/11] dump/dump: Add arch section support
Date: Wed, 13 Jul 2022 13:03:17 +0000
Message-Id: <20220713130322.25517-7-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713130322.25517-1-frankja@linux.ibm.com>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OgkBfCeiu3eLx4fgudAMIX_W7XJ0lKOW
X-Proofpoint-GUID: 8mDFb8h-DgZ2QZRQOOIxeAZnmd3PBu1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_01,2022-07-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207130050
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add hooks which architectures can use to add arbitrary data to custom
sections.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c                | 21 ++++++++++++++++++---
 include/sysemu/dump-arch.h | 27 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 31e2a85372..02de00b6de 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -400,6 +400,7 @@ static void prepare_elf_section_hdrs(DumpState *s)
     /*
      * Section ordering:
      * - HDR zero (if needed)
+     * - Arch section hdrs
      * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
@@ -417,6 +418,9 @@ static void prepare_elf_section_hdrs(DumpState *s)
         return;
     }
 
+    size = dump_arch_sections_write_hdr(&s->dump_info, s, buff_hdr);
+    buff_hdr += size;
+
     /*
      * String table needs to be last section since strings are added
      * via arch_sections_write_hdr().
@@ -567,14 +571,23 @@ static void get_offset_range(hwaddr phys_addr,
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
@@ -682,8 +695,8 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write all PT_LOAD to vmcore */
-    write_elf_loads(s, errp);
+    /* write all PT_LOADs to vmcore */
+    write_elf_phdr_loads(s, errp);
     if (*errp) {
         return;
     }
@@ -723,6 +736,7 @@ static void dump_end(DumpState *s, Error **errp)
         return;
     }
     s->elf_section_data = g_malloc0(s->elf_section_data_size);
+    dump_arch_sections_write(&s->dump_info, s, s->elf_section_data);
 
     /* write sections to vmcore */
     write_elf_sections(s, errp);
@@ -1894,6 +1908,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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
2.34.1


