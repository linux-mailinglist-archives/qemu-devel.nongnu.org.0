Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1EC58FC83
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:40:40 +0200 (CEST)
Received: from localhost ([::1]:33276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7UN-00022K-9F
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73v-0004df-O2; Thu, 11 Aug 2022 08:13:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23074
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73t-0000GO-Ux; Thu, 11 Aug 2022 08:13:19 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6xeP013682;
 Thu, 11 Aug 2022 12:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+wZog8rZ0BGhlvEX7q61NapXJEsQWRkb2CDGwKI8n9o=;
 b=j8P8+FAmTaG4D9XvmI7rwC4qPDR1UEGQnxHptoA5zsS81sCuBehVY2IMPWP6YGmLNdic
 PNDrAhj7guSLP7UBihWderBnaCoI7v9X6viZGBZ3SFWKY0FKbYHphHtbXdJYMJwM0Q69
 /wBYMQ+EE0x6HMaBQfTEFoSceBMuN/EcLhgk29ZpoSwEI5ozBDVQvJMYWRf1TIObU/tW
 Nmaq6lMks3lUhy8Rya7EalOTojlA2XaHEqrXKxSmzhSOdwZE3WXUISnTLMoA0XjkiyUW
 BS3+msdPdw0eb3qTBhx7RXBRcloorm4treFpdoRvxaEmocDQZ9aa6gOsAexUKd6HNIZX bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0q6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:16 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7oQj022535;
 Thu, 11 Aug 2022 12:12:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0pbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC6Mgp025336;
 Thu, 11 Aug 2022 12:12:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3huww2j0g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27BCCWW025887156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6902AE04D;
 Thu, 11 Aug 2022 12:12:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5CA2AE045;
 Thu, 11 Aug 2022 12:12:13 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:13 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 12/18] dump/dump: Add section string table support
Date: Thu, 11 Aug 2022 12:11:05 +0000
Message-Id: <20220811121111.9878-13-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LWO4GMeTa8I3xgTm2SF_Ylwm3hvLvXke
X-Proofpoint-ORIG-GUID: h5HJ5iwLrU86fzATA8Q440wf8X1tVz1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110037
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

As sections don't have a type like the notes do we need another way to
determine their contents. The string table allows us to assign each
section an identification string which architectures can then use to
tag their sections with.

There will be no string table if the architecture doesn't add custom
sections which are introduced in a following patch.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 71 +++++++++++++++++++++++++++++++++++++++++++
 include/sysemu/dump.h |  4 +++
 2 files changed, 75 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index 31eb20108c..0d6dbf453a 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -103,6 +103,7 @@ static int dump_cleanup(DumpState *s)
     memory_mapping_list_free(&s->list);
     close(s->fd);
     g_free(s->guest_note);
+    g_array_unref(s->string_table_buf);
     s->guest_note = NULL;
     if (s->resume) {
         if (s->detached) {
@@ -156,6 +157,9 @@ static void prepare_elf64_header(DumpState *s, Elf64_Ehdr *elf_header)
         elf_header->e_shoff = cpu_to_dump64(s, s->shdr_offset);
         elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
         elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
+        if (s->string_table_usage) {
+            elf_header->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
+        }
     }
 }
 
@@ -184,6 +188,9 @@ static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
         elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
         elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
         elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
+        if (s->string_table_usage) {
+            elf_header->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
+        }
     }
 }
 
@@ -393,17 +400,50 @@ static void prepare_elf_section_hdr_zero(DumpState *s)
     }
 }
 
+static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
+{
+    Elf32_Shdr shdr32;
+    Elf64_Shdr shdr64;
+    int shdr_size;
+    void *shdr;
+
+    if (dump_is_64bit(s)) {
+        shdr_size = sizeof(Elf64_Shdr);
+        memset(&shdr64, 0, shdr_size);
+        shdr64.sh_type = SHT_STRTAB;
+        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr64.sh_name = s->string_table_buf->len;
+        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
+        shdr64.sh_size = s->string_table_buf->len;
+        shdr = &shdr64;
+    } else {
+        shdr_size = sizeof(Elf32_Shdr);
+        memset(&shdr32, 0, shdr_size);
+        shdr32.sh_type = SHT_STRTAB;
+        shdr32.sh_offset = s->section_offset + s->elf_section_data_size;
+        shdr32.sh_name = s->string_table_buf->len;
+        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
+        shdr32.sh_size = s->string_table_buf->len;
+        shdr = &shdr32;
+    }
+
+    memcpy(buff, shdr, shdr_size);
+}
+
 static void prepare_elf_section_hdrs(DumpState *s)
 {
     size_t len, sizeof_shdr;
+    void *buff_hdr;
 
     /*
      * Section ordering:
      * - HDR zero
+     * - String table hdr
      */
     sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     len = sizeof_shdr * s->shdr_num;
     s->elf_section_hdrs = g_malloc0(len);
+    buff_hdr = s->elf_section_hdrs;
 
     /*
      * The first section header is ALWAYS a special initial section
@@ -419,6 +459,17 @@ static void prepare_elf_section_hdrs(DumpState *s)
     if (s->phdr_num >= PN_XNUM) {
         prepare_elf_section_hdr_zero(s);
     }
+    buff_hdr += sizeof_shdr;
+
+    if (s->shdr_num < 2) {
+        return;
+    }
+
+    /*
+     * String table is the last section since strings are added via
+     * arch_sections_write_hdr().
+     */
+    prepare_elf_section_hdr_string(s, buff_hdr);
 }
 
 static void write_elf_section_headers(DumpState *s, Error **errp)
@@ -1688,6 +1739,14 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     s->filter_area_begin = begin;
     s->filter_area_length = length;
 
+    /* First index is 0, it's the special null name */
+    s->string_table_buf = g_array_new(FALSE, TRUE, 1);
+    /*
+     * Allocate the null name, due to the clearing option set to true
+     * it will be 0.
+     */
+    g_array_set_size(s->string_table_buf, 1);
+
     memory_mapping_list_init(&s->list);
 
     guest_phys_blocks_init(&s->guest_phys_blocks);
@@ -1844,6 +1903,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         }
     }
 
+    /*
+     * calculate shdr_num and elf_section_data_size so we know the offsets and
+     * sizes of all parts.
+     *
+     * If phdr_num overflowed we have at least one section header
+     * More sections/hdrs can be added by the architectures
+     */
+    if (s->shdr_num > 1) {
+        /* Reserve the string table */
+        s->shdr_num += 1;
+    }
+
     if (dump_is_64bit(s)) {
         s->shdr_offset = sizeof(Elf64_Ehdr);
         s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 9ed811b313..358b038d47 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -180,6 +180,10 @@ typedef struct DumpState {
     hwaddr note_offset;
 
     void *elf_section_hdrs;     /* Pointer to section header buffer */
+    void *elf_section_data;     /* Pointer to section data buffer */
+    uint64_t elf_section_data_size; /* Size of section data */
+    GArray *string_table_buf;   /* String table data buffer */
+    bool string_table_usage;    /* Indicates if string table is used */
 
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
-- 
2.34.1


