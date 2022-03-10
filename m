Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129194D4591
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:20:53 +0100 (CET)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGqi-0002EC-3H
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:20:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGmc-0004DJ-2z
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8572
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nSGma-0005su-4v
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:16:37 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22A9WGZK026557
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SCPx5HvDJd++c1/MVf9EaagbroBju7wFNfLCFRCjm0c=;
 b=r15w3xHBnFeUef1x7DSwFO5Xx75HDMHZu4mlupdFAmUZAc/Qu9x5mmtOCG2vDH9uzvhq
 XSAesknYk1FLid3293WRMVTUsEA3uDFloTvpc152HtjEm6mOZPfHgUSbYkBBJOw/hrHG
 8xHN4Fo7D4FiOWAQ49uhr/fb13zS8WJ/IMcMd1Qz2lS6FwK5gF4/ZzWr15MnlEKU/1zY
 lcZrBsgmnKYz0djVwn1yGE39OFLrt2Kee1SDx8QOkZb89GmoAB2Yg6IvfoYU6w3K614q
 Z3iT6Nm676Ih3unMrrzSd8o3OAGqL36ynH8/ew2+LOFpUHqiooVkfM0V0zxxXg8paLCx nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eq7yr1qp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:34 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22A9pNMa018954
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:16:34 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eq7yr1qnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:34 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ABDoAh009846;
 Thu, 10 Mar 2022 11:16:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3epysw9hne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 11:16:32 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22AB5HW946072194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 11:05:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68C8C4C044;
 Thu, 10 Mar 2022 11:16:30 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E01A24C04A;
 Thu, 10 Mar 2022 11:16:29 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Mar 2022 11:16:29 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] dump: Split write of section headers and data and add a
 prepare step
Date: Thu, 10 Mar 2022 11:16:05 +0000
Message-Id: <20220310111608.3362-3-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220310111608.3362-1-frankja@linux.ibm.com>
References: <20220310111608.3362-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KEGgR9mNJR6iAYmgxwtC8bRP4j6SfSpz
X-Proofpoint-ORIG-GUID: 3yY1E13u0tvHwfrZb_9fP-8M9MGjsQFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100059
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
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

By splitting the writing of the section headers and (future) section
data we prepare for the addition of a string table section and
architecture sections.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 112 ++++++++++++++++++++++++++++++++----------
 include/sysemu/dump.h |   4 ++
 2 files changed, 90 insertions(+), 26 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 88343d7486..e4198e8f3e 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -341,30 +341,72 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
     }
 }
 
-static void write_elf_section(DumpState *s, int type, Error **errp)
+static size_t write_elf_section_hdr_zero(DumpState *s, void *buff)
 {
-    Elf32_Shdr shdr32;
-    Elf64_Shdr shdr64;
-    int shdr_size;
-    void *shdr;
-    int ret;
+    Elf32_Shdr *shdr32 = buff;
+    Elf64_Shdr *shdr64 = buff;
 
-    if (type == 0) {
-        shdr_size = sizeof(Elf32_Shdr);
-        memset(&shdr32, 0, shdr_size);
-        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr32;
+    if (dump_is_64bit(s)) {
+        memset(buff, 0, sizeof(Elf64_Shdr));
+        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
     } else {
-        shdr_size = sizeof(Elf64_Shdr);
-        memset(&shdr64, 0, shdr_size);
-        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr64;
+        memset(buff, 0, sizeof(Elf32_Shdr));
+        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
     }
 
-    ret = fd_write_vmcore(shdr, shdr_size, s);
+    return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+}
+
+static void prepare_elf_section_hdrs(DumpState *s)
+{
+    uint8_t *buff_hdr;
+    size_t len, sizeof_shdr;
+
+    /*
+     * Section ordering:
+     * - HDR zero (if needed)
+     */
+    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+    len = sizeof_shdr * s->shdr_num ;
+    s->elf_section_hdrs = g_malloc0(len);
+    buff_hdr = s->elf_section_hdrs;
+
+    /* Write special section first */
+    if (s->phdr_num == PN_XNUM) {
+            write_elf_section_hdr_zero(s, buff_hdr);
+    }
+}
+
+static void prepare_elf_sections(DumpState *s, Error **errp)
+{
+    if (!s->shdr_num) {
+        return;
+    }
+
+    prepare_elf_section_hdrs(s);
+}
+
+static void write_elf_section_headers(DumpState *s, Error **errp)
+{
+    size_t sizeof_shdr;
+    int ret;
+
+    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+
+    ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
     if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write section header table");
+        error_setg_errno(errp, -ret, "dump: failed to write section data");
+    }
+}
+
+static void write_elf_sections(DumpState *s, Error **errp)
+{
+    int ret;
+
+    /* Write section zero */
+    ret = fd_write_vmcore(s->elf_section_data, s->elf_section_data_size, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "dump: failed to write section data");
     }
 }
 
@@ -561,12 +603,22 @@ static void dump_begin(DumpState *s, Error **errp)
     /* Write elf header to buffer */
     prepare_elf_header(s);
 
+    prepare_elf_sections(s, errp);
+    if (*errp) {
+        return;
+    }
+
     /* Start to write stuff into files*/
     write_elf_header(s, errp);
     if (*errp) {
         return;
     }
 
+    write_elf_section_headers(s, errp);
+    if (*errp) {
+        return;
+    }
+
     /* write PT_NOTE to vmcore */
     write_elf_phdr_note(s, errp);
     if (*errp) {
@@ -579,14 +631,6 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write section to vmcore */
-    if (s->shdr_num) {
-        write_elf_section(s, 1, errp);
-        if (*errp) {
-            return;
-        }
-    }
-
     /* write notes to vmcore */
     write_elf_notes(s, errp);
 }
@@ -643,6 +687,19 @@ static void dump_iterate(DumpState *s, Error **errp)
     } while (!get_next_block(s, block));
 }
 
+static void dump_end(DumpState *s, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (!s->elf_section_data_size) {
+        return;
+    }
+    s->elf_section_data = g_malloc0(s->elf_section_data_size);
+
+    /* write sections to vmcore */
+    write_elf_sections(s, errp);
+}
+
 static void create_vmcore(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
@@ -653,6 +710,9 @@ static void create_vmcore(DumpState *s, Error **errp)
     }
 
     dump_iterate(s, errp);
+
+    /* Write section data after memory has been dumped */
+    dump_end(s, errp);
 }
 
 static int write_start_flat_header(int fd)
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 9c4a83156b..4c5a593b81 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -173,6 +173,10 @@ typedef struct DumpState {
     int64_t length;
 
     void *elf_header;
+    void *elf_section_hdrs;
+    uint64_t elf_section_data_size;
+    void *elf_section_data;
+
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
     uint32_t nr_cpus;           /* number of guest's cpu */
-- 
2.32.0


