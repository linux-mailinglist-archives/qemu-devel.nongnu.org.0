Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E082357CC11
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 15:37:13 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEWMa-00027T-SX
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 09:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9c-0000c4-Lo; Thu, 21 Jul 2022 09:23:48 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oEW9Z-0006Xn-Sk; Thu, 21 Jul 2022 09:23:47 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LDDE8Z029345;
 Thu, 21 Jul 2022 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=RTcW0/uUOyEZLH/JAzC+wjq/cPAA/BRuf2Pp2iDgBrY=;
 b=iqpYu4UFKF3mOcwRE62lGORcEIKGssZQsPTwXVcFOh1AAp/o6Pr4m4OpjkN55y/+hLZY
 1chPW69IiDGf7jstnCwPjxTKFr195n6OG8MQR9qPR8dqtUFqVUVExjK3La+dueLq+XOF
 giawRzak+1hd3ORNZjrKoqa19+CYv3qmi3GMIp03m8OaDsJGppGGnl+0HKMCrUngH27L
 jvuf77MZAxnf8W+lKzI70BOdovc8VxX8DvDAus/2+2Rzb/GFmhLU2rYOqGTQhjdcPUuL
 QTkXtH/24gSNpRgJSlhf7gJRgFdsgzyeLngqP1N4xJ0zdiMkVeh9w1392RU2NJTe+UAp NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf6mwj17d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:44 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LDDHYj029489;
 Thu, 21 Jul 2022 13:23:43 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf6mwj165-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:43 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LDNfgF028956;
 Thu, 21 Jul 2022 13:23:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3hbmy8y4xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 13:23:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26LDNo2w28574116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 13:23:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19D714C046;
 Thu, 21 Jul 2022 13:23:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B99F4C044;
 Thu, 21 Jul 2022 13:23:37 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 13:23:36 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Subject: [PATCH v3 09/14] dump/dump: Add arch section support
Date: Thu, 21 Jul 2022 13:22:51 +0000
Message-Id: <20220721132256.2171-10-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220721132256.2171-1-frankja@linux.ibm.com>
References: <20220721132256.2171-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SDn30iY2LWWT8Q5DexfjRITemX4Gi_C3
X-Proofpoint-ORIG-GUID: mDVZuYRwwGQi6DXPEy_Yehx2KDABOHqI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_17,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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
 dump/dump.c                |  6 ++++++
 include/sysemu/dump-arch.h | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index 944217349a..60a164afd5 100644
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
@@ -721,6 +725,7 @@ static void dump_end(DumpState *s, Error **errp)
         return;
     }
     s->elf_section_data = g_malloc0(s->elf_section_data_size);
+    dump_arch_sections_write(&s->dump_info, s, s->elf_section_data);
 
     /* write sections to vmcore */
     write_elf_sections(s, errp);
@@ -1892,6 +1897,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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


