Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A19D580FFD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:33:57 +0200 (CEST)
Received: from localhost ([::1]:42282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGwt-0007w5-Md
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGnA-0004VA-Mq; Tue, 26 Jul 2022 05:23:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53354
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn8-0005Zy-WC; Tue, 26 Jul 2022 05:23:52 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q9DxoO030689;
 Tue, 26 Jul 2022 09:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YroEPA103CzfLnh/CyxoFyuCR9QSgCts5cjw8qccYrg=;
 b=VWOUu1CAq7u6S7+9wtSYTBEgm89xopBfcQz2QLjFCjOFwygpQ6YZT79wT17C99hRvXvE
 FAWW+ewTlKjFGquhI1Qn4GFIxZB5BRDz+KlGTf2Zb3lfyw/LkczGZqe7I4nuNfubCfhb
 Of9hC46YO8E6t7iXqwB9V06ceuZrgPkPc79YyzyX6hihAnHk1GcgnAcX5tbQiTrnY2SC
 Jr+sjHyKGK3PUktG5X++3PfQceeTw9ZmGeoCIpf5d5QmDtatUln36GKj3mIg4cUI2pMJ
 qtOgZABJnqvAb2Imw5Teg2ZHkok44kUQabJEW9s20Wpalo28ebDgkzn2NatuY2keCRCn mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdeu084j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:49 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q9GgnM008059;
 Tue, 26 Jul 2022 09:23:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdeu0840-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:49 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9LCKk017902;
 Tue, 26 Jul 2022 09:23:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3hh6euj8jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26Q9Nitu23789950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:23:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E454A405B;
 Tue, 26 Jul 2022 09:23:44 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DDA6A4054;
 Tue, 26 Jul 2022 09:23:43 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:43 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 12/17] dump/dump: Add arch section support
Date: Tue, 26 Jul 2022 09:22:43 +0000
Message-Id: <20220726092248.128336-13-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NJMV-ZSE3VHVDtCfTwhN96A4YrufR6YA
X-Proofpoint-ORIG-GUID: DETu_E2shV-6ze4Tmnr-g0xm72htnQe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
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
 dump/dump.c                |  5 +++++
 include/sysemu/dump-arch.h | 27 +++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index 298a1e923f..1ec4c3b6c3 100644
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
@@ -415,6 +416,8 @@ static void prepare_elf_section_hdrs(DumpState *s)
         return;
     }
 
+    buff_hdr += dump_arch_sections_write_hdr(&s->dump_info, s, buff_hdr);
+
     /*
      * String table needs to be last section since strings are added
      * via arch_sections_write_hdr().
@@ -758,6 +761,7 @@ static void dump_end(DumpState *s, Error **errp)
         return;
     }
     s->elf_section_data = g_malloc0(s->elf_section_data_size);
+    dump_arch_sections_write(&s->dump_info, s, s->elf_section_data);
 
     /* write sections to vmcore */
     write_elf_sections(s, errp);
@@ -1929,6 +1933,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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


