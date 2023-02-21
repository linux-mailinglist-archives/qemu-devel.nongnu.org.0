Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AA169E636
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:47:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWiP-0001Tb-Hm; Tue, 21 Feb 2023 12:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pUWiI-0001SM-IF; Tue, 21 Feb 2023 12:46:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pUWiG-0004XY-49; Tue, 21 Feb 2023 12:46:02 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31LHUa0I027580; Tue, 21 Feb 2023 17:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ftp+12VGdglM+HQ9msNO2aGV/q90kltd8sZCM7UfJAk=;
 b=dxVx97l9k2ZXNv+S2m6KOF5fZlnd84OlBHhqr4d148u7ykjS257hdTCBnYeZ7/8KHrGG
 BRj0sc7pzfuRDTZzvM8mNCsBdZhCHt2hz9OG1F/U3zwDp9KT97ChASvpMmq3Z2Tcr2w3
 /cZap4984GHGOrVlNtA50PRfL1lwb4V2A3Uilky23tFzZPbacNu8ORcFQ7Begp+dE6Vu
 jIjqMH6OR4mQOPsZG/nO3G7CbaVK3It/kkuTGZj/l+yhMBOgZmi7bWRJiph0/EaW8HnN
 SKt4D/jA3AjPl2/1tEbyc2Twi8kQbyS+uECwMBryelDFIaJO8Cpm751Z8n0Zhj89huav Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nw2dwrasb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 17:45:57 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31LHX1Wq037737;
 Tue, 21 Feb 2023 17:45:57 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nw2dwras5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 17:45:57 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LFtFJT000617;
 Tue, 21 Feb 2023 17:45:56 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3ntpa78vut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 17:45:56 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31LHjsvj52429064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 17:45:54 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5065358059;
 Tue, 21 Feb 2023 17:45:54 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B03E58062;
 Tue, 21 Feb 2023 17:45:53 +0000 (GMT)
Received: from t15.endicott.ibm.com (unknown [9.60.89.108])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 21 Feb 2023 17:45:53 +0000 (GMT)
From: jrossi@linux.ibm.com
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Cc: thuth@redhat.com, frankja@linux.ibm.com, jjherne@linux.ibm.com,
 jrossi@linux.ibm.com
Subject: [RESEND PATCH 1/1] pc-bios: Add support for List-Directed IPL from
 ECKD DASD
Date: Tue, 21 Feb 2023 12:45:48 -0500
Message-Id: <20230221174548.1866861-2-jrossi@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230221174548.1866861-1-jrossi@linux.ibm.com>
References: <20230221174548.1866861-1-jrossi@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2Xlzpt0m5I6643Y87xTeQl4WXG3zzsxx
X-Proofpoint-GUID: maiRgP-4YusXyX1u05ZjiBTMmM8pv0Lq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_10,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jrossi@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jared Rossi <jrossi@linux.ibm.com>

Check for a List Directed IPL Boot Record, which would supersede the CCW type
entries.  If the record is valid, proceed to use the new style pointers
and perform LD-IPL. Each block pointer is interpreted as either an LD-IPL
pointer or a legacy CCW pointer depending on the type of IPL initiated.

In either case CCW- or LD-IPL is transparent to the user and will boot the same
image regardless of which set of pointers is used. Because the interactive boot
menu is only written with the old style pointers, the menu will be disabled for
List Directed IPL from ECKD DASD.

If the LD-IPL fails, retry the IPL using the CCW type pointers.

If no LD-IPL boot record is found, simply perform CCW type IPL as usual.

Signed-off-by: Jared Rossi <jrossi@linux.ibm.com>

---
 pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
 pc-bios/s390-ccw/bootmap.h |  30 ++++++-
 2 files changed, 148 insertions(+), 39 deletions(-)

diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
index 994e59c0b0..77229f93f3 100644
--- a/pc-bios/s390-ccw/bootmap.c
+++ b/pc-bios/s390-ccw/bootmap.c
@@ -72,42 +72,74 @@ static inline void verify_boot_info(BootInfo *bip)
                "Bad block size in zIPL section of the 1st record.");
 }
 
-static block_number_t eckd_block_num(EckdCHS *chs)
+static void eckd_format_chs(ExtEckdBlockPtr *ptr,  bool ldipl,
+                            uint64_t *c,
+                            uint64_t *h,
+                            uint64_t *s)
+{
+    if (ldipl) {
+        *c = ptr->ldptr.chs.cylinder;
+        *h = ptr->ldptr.chs.head;
+        *s = ptr->ldptr.chs.sector;
+    } else {
+        *c = ptr->bptr.chs.cylinder;
+        *h = ptr->bptr.chs.head;
+        *s = ptr->bptr.chs.sector;
+    }
+}
+
+static block_number_t eckd_chs_to_block(uint64_t c, uint64_t h, uint64_t s)
 {
     const uint64_t sectors = virtio_get_sectors();
     const uint64_t heads = virtio_get_heads();
-    const uint64_t cylinder = chs->cylinder
-                            + ((chs->head & 0xfff0) << 12);
-    const uint64_t head = chs->head & 0x000f;
+    const uint64_t cylinder = c + ((h & 0xfff0) << 12);
+    const uint64_t head = h & 0x000f;
     const block_number_t block = sectors * heads * cylinder
                                + sectors * head
-                               + chs->sector
-                               - 1; /* block nr starts with zero */
+                               + s - 1; /* block nr starts with zero */
     return block;
 }
 
-static bool eckd_valid_address(BootMapPointer *p)
+static block_number_t eckd_block_num(EckdCHS *chs)
 {
-    const uint64_t head = p->eckd.chs.head & 0x000f;
+    return eckd_chs_to_block(chs->cylinder, chs->head, chs->sector);
+}
+
+static block_number_t gen_eckd_block_num(ExtEckdBlockPtr *ptr, bool ldipl)
+{
+    uint64_t cyl, head, sec;
+    eckd_format_chs(ptr, ldipl, &cyl, &head, &sec);
+    return eckd_chs_to_block(cyl, head, sec);
+}
 
+static bool eckd_valid_chs(uint64_t cyl, uint64_t head, uint64_t sector)
+{
     if (head >= virtio_get_heads()
-        ||  p->eckd.chs.sector > virtio_get_sectors()
-        ||  p->eckd.chs.sector <= 0) {
+        || sector > virtio_get_sectors()
+        || sector <= 0) {
         return false;
     }
 
     if (!virtio_guessed_disk_nature() &&
-        eckd_block_num(&p->eckd.chs) >= virtio_get_blocks()) {
+        eckd_chs_to_block(cyl, head, sector) >= virtio_get_blocks()) {
         return false;
     }
 
     return true;
 }
 
-static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
+static bool eckd_valid_address(ExtEckdBlockPtr *ptr, bool ldipl)
+{
+    uint64_t cyl, head, sec;
+    eckd_format_chs(ptr, ldipl, &cyl, &head, &sec);
+    return eckd_valid_chs(cyl, head, sec);
+}
+
+static block_number_t load_eckd_segments(block_number_t blk, bool ldipl,
+                                         uint64_t *address)
 {
     block_number_t block_nr;
-    int j, rc;
+    int j, rc, count;
     BootMapPointer *bprs = (void *)_bprs;
     bool more_data;
 
@@ -117,7 +149,7 @@ static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
     do {
         more_data = false;
         for (j = 0;; j++) {
-            block_nr = eckd_block_num(&bprs[j].xeckd.bptr.chs);
+            block_nr = gen_eckd_block_num(&bprs[j].xeckd, ldipl);
             if (is_null_block_number(block_nr)) { /* end of chunk */
                 break;
             }
@@ -129,11 +161,26 @@ static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
                 break;
             }
 
-            IPL_assert(block_size_ok(bprs[j].xeckd.bptr.size),
+            /* List directed pointer does not store block size */
+            IPL_assert(ldipl || block_size_ok(bprs[j].xeckd.bptr.size),
                        "bad chunk block size");
-            IPL_assert(eckd_valid_address(&bprs[j]), "bad chunk ECKD addr");
 
-            if ((bprs[j].xeckd.bptr.count == 0) && unused_space(&(bprs[j+1]),
+            if (!eckd_valid_address(&bprs[j].xeckd, ldipl)) {
+                /*
+                 * If an invalid address is found during LD-IPL then break and
+                 * retry as CCW
+                 */
+                IPL_assert(ldipl, "bad chunk ECKD addr");
+                break;
+            }
+
+            if (ldipl) {
+                count = bprs[j].xeckd.ldptr.count;
+            } else {
+                count = bprs[j].xeckd.bptr.count;
+            }
+
+            if ((count == 0) && unused_space(&(bprs[j + 1]),
                 sizeof(EckdBlockPtr))) {
                 /* This is a "continue" pointer.
                  * This ptr should be the last one in the current
@@ -149,11 +196,10 @@ static block_number_t load_eckd_segments(block_number_t blk, uint64_t *address)
             /* Load (count+1) blocks of code at (block_nr)
              * to memory (address).
              */
-            rc = virtio_read_many(block_nr, (void *)(*address),
-                                  bprs[j].xeckd.bptr.count+1);
+            rc = virtio_read_many(block_nr, (void *)(*address), count + 1);
             IPL_assert(rc == 0, "code chunk read failed");
 
-            *address += (bprs[j].xeckd.bptr.count+1) * virtio_get_block_size();
+            *address += (count + 1) * virtio_get_block_size();
         }
     } while (more_data);
     return block_nr;
@@ -237,8 +283,10 @@ static void run_eckd_boot_script(block_number_t bmt_block_nr,
     uint64_t address;
     BootMapTable *bmt = (void *)sec;
     BootMapScript *bms = (void *)sec;
+    /* The S1B block number is NULL_BLOCK_NR if and only if it's an LD-IPL */
+    bool ldipl = (s1b_block_nr == NULL_BLOCK_NR);
 
-    if (menu_is_enabled_zipl()) {
+    if (menu_is_enabled_zipl() && !ldipl) {
         loadparm = eckd_get_boot_menu_index(s1b_block_nr);
     }
 
@@ -249,7 +297,7 @@ static void run_eckd_boot_script(block_number_t bmt_block_nr,
     memset(sec, FREE_SPACE_FILLER, sizeof(sec));
     read_block(bmt_block_nr, sec, "Cannot read Boot Map Table");
 
-    block_nr = eckd_block_num(&bmt->entry[loadparm].xeckd.bptr.chs);
+    block_nr = gen_eckd_block_num(&bmt->entry[loadparm].xeckd, ldipl);
     IPL_assert(block_nr != -1, "Cannot find Boot Map Table Entry");
 
     memset(sec, FREE_SPACE_FILLER, sizeof(sec));
@@ -264,13 +312,18 @@ static void run_eckd_boot_script(block_number_t bmt_block_nr,
         }
 
         address = bms->entry[i].address.load_address;
-        block_nr = eckd_block_num(&bms->entry[i].blkptr.xeckd.bptr.chs);
+        block_nr = gen_eckd_block_num(&bms->entry[i].blkptr.xeckd, ldipl);
 
         do {
-            block_nr = load_eckd_segments(block_nr, &address);
+            block_nr = load_eckd_segments(block_nr, ldipl, &address);
         } while (block_nr != -1);
     }
 
+    if (ldipl && bms->entry[i].type != BOOT_SCRIPT_EXEC) {
+        /* Abort LD-IPL and retry as CCW-IPL */
+        return;
+    }
+
     IPL_assert(bms->entry[i].type == BOOT_SCRIPT_EXEC,
                "Unknown script entry type");
     write_reset_psw(bms->entry[i].address.load_address); /* no return */
@@ -380,6 +433,23 @@ static void ipl_eckd_ldl(ECKD_IPL_mode_t mode)
     /* no return */
 }
 
+static block_number_t eckd_find_bmt(ExtEckdBlockPtr *ptr)
+{
+    block_number_t blockno;
+    uint8_t tmp_sec[MAX_SECTOR_SIZE];
+    BootRecord *br;
+
+    blockno = gen_eckd_block_num(ptr, 0);
+    read_block(blockno, tmp_sec, "Cannot read boot record");
+    br = (BootRecord *)tmp_sec;
+    if (!magic_match(br->magic, ZIPL_MAGIC)) {
+        /* If the boot record is invalid, return and try CCW-IPL instead */
+        return NULL_BLOCK_NR;
+    }
+
+    return gen_eckd_block_num(&br->pgt.xeckd, 1);
+}
+
 static void print_eckd_msg(void)
 {
     char msg[] = "Using ECKD scheme (block size *****), ";
@@ -401,28 +471,43 @@ static void print_eckd_msg(void)
 
 static void ipl_eckd(void)
 {
-    XEckdMbr *mbr = (void *)sec;
-    LDL_VTOC *vlbl = (void *)sec;
+    IplVolumeLabel *vlbl = (void *)sec;
+    LDL_VTOC *vtoc = (void *)sec;
+    block_number_t ldipl_bmt; /* Boot Map Table for List-Directed IPL */
 
     print_eckd_msg();
 
-    /* Grab the MBR again */
+    /* Block 2 can contain either the CDL VOL1 label or the LDL VTOC */
     memset(sec, FREE_SPACE_FILLER, sizeof(sec));
-    read_block(0, mbr, "Cannot read block 0 on DASD");
+    read_block(2, vlbl, "Cannot read block 2");
 
-    if (magic_match(mbr->magic, IPL1_MAGIC)) {
-        ipl_eckd_cdl();         /* only returns in case of error */
-        return;
+    /*
+     * First check for a list-directed-format pointer which would
+     * supersede the CCW pointer.
+     */
+    if (eckd_valid_address((ExtEckdBlockPtr *)&vlbl->f.br, 0)) {
+        ldipl_bmt = eckd_find_bmt((ExtEckdBlockPtr *)&vlbl->f.br);
+        if (ldipl_bmt) {
+            sclp_print("List-Directed\n");
+            /* LD-IPL does not use the S1B bock, just make it NULL */
+            run_eckd_boot_script(ldipl_bmt, NULL_BLOCK_NR);
+            /* Only return in error, retry as CCW-IPL */
+            sclp_print("Retrying IPL ");
+            print_eckd_msg();
+        }
+        memset(sec, FREE_SPACE_FILLER, sizeof(sec));
+        read_block(2, vtoc, "Cannot read block 2");
     }
 
-    /* LDL/CMS? */
-    memset(sec, FREE_SPACE_FILLER, sizeof(sec));
-    read_block(2, vlbl, "Cannot read block 2");
+    /* Not list-directed */
+    if (magic_match(vtoc->magic, VOL1_MAGIC)) {
+        ipl_eckd_cdl(); /* may return in error */
+    }
 
-    if (magic_match(vlbl->magic, CMS1_MAGIC)) {
+    if (magic_match(vtoc->magic, CMS1_MAGIC)) {
         ipl_eckd_ldl(ECKD_CMS); /* no return */
     }
-    if (magic_match(vlbl->magic, LNX1_MAGIC)) {
+    if (magic_match(vtoc->magic, LNX1_MAGIC)) {
         ipl_eckd_ldl(ECKD_LDL); /* no return */
     }
 
diff --git a/pc-bios/s390-ccw/bootmap.h b/pc-bios/s390-ccw/bootmap.h
index 3946aa3f8d..d4690a88c2 100644
--- a/pc-bios/s390-ccw/bootmap.h
+++ b/pc-bios/s390-ccw/bootmap.h
@@ -45,9 +45,23 @@ typedef struct EckdBlockPtr {
                     * it's 0 for TablePtr, ScriptPtr, and SectionPtr */
 } __attribute__ ((packed)) EckdBlockPtr;
 
-typedef struct ExtEckdBlockPtr {
+typedef struct LdEckdCHS {
+    uint32_t cylinder;
+    uint8_t head;
+    uint8_t sector;
+} __attribute__ ((packed)) LdEckdCHS;
+
+typedef struct LdEckdBlockPtr {
+    LdEckdCHS chs; /* cylinder/head/sector is an address of the block */
+    uint8_t reserved[4];
+    uint16_t count;
+    uint32_t pad;
+} __attribute__ ((packed)) LdEckdBlockPtr;
+
+/* bptr is used for CCW type IPL, while ldptr is for list-directed IPL */
+typedef union ExtEckdBlockPtr {
     EckdBlockPtr bptr;
-    uint8_t reserved[8];
+    LdEckdBlockPtr ldptr;
 } __attribute__ ((packed)) ExtEckdBlockPtr;
 
 typedef union BootMapPointer {
@@ -57,6 +71,15 @@ typedef union BootMapPointer {
     ExtEckdBlockPtr xeckd;
 } __attribute__ ((packed)) BootMapPointer;
 
+typedef struct BootRecord {
+    uint8_t magic[4];
+    uint32_t version;
+    uint64_t res1;
+    BootMapPointer pgt;
+    uint8_t reserved[510 - 32];
+    uint16_t os_id;
+} __attribute__ ((packed)) BootRecord;
+
 /* aka Program Table */
 typedef struct BootMapTable {
     uint8_t magic[4];
@@ -292,7 +315,8 @@ typedef struct IplVolumeLabel {
         struct {
             unsigned char key[4]; /* == "VOL1" */
             unsigned char volser[6];
-            unsigned char reserved[6];
+            unsigned char reserved[64];
+            EckdCHS br; /* Location of Boot Record for list-directed IPL */
         } f;
     };
 } __attribute__((packed)) IplVolumeLabel;
-- 
2.36.1


