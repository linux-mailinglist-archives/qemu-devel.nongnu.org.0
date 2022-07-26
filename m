Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7D580FDE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:27:56 +0200 (CEST)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGr5-0001Wr-Rg
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGn2-00049G-07; Tue, 26 Jul 2022 05:23:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oGGmz-0005Xs-65; Tue, 26 Jul 2022 05:23:42 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26Q9LOcb019867;
 Tue, 26 Jul 2022 09:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=M1mFnujovPpQdW0okbSzoTY+7ltrGORMcJD5SriZqMc=;
 b=TOZgf8Styjzl9d6WbzuvRCkjF6MIPMHjZitwkh/kmW9ExaEso63ECwMvzJbdvWBs/cNT
 TKWq/SruZy+gEsk4HOfY+keTkcrMd0Yw+byWz/EIM3v1Q8zj5Lljh/H826JQFw3X/8UD
 oJLDkG1a35jm8fwi8XPM1P0J1I0S2bCp3c5eAqMEKs8HnruMjixo5TGmtTOmz7t9ZuCd
 Blh8ms1VAMMs6pTgu4ofTAhPJ22bsLNUF7ToVzUNMMr/0ynAYnYgwH6OYORDy5n6FrLu
 wsAYt+ppcgTkDSiSzJbAnm6XQSfO/Q2m5BcOvTsPQmfgMVnW/aShWMhx8QYg+bvOAztH Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjm81qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:39 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26Q9M69B022040;
 Tue, 26 Jul 2022 09:23:39 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hjdjm81q8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:39 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26Q9L4pT029671;
 Tue, 26 Jul 2022 09:23:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3hg98nbj1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jul 2022 09:23:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26Q9LZh823265578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 09:21:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 189CAA405F;
 Tue, 26 Jul 2022 09:23:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB1F0A4054;
 Tue, 26 Jul 2022 09:23:32 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jul 2022 09:23:32 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v4 04/17] dump: Rework get_start_block
Date: Tue, 26 Jul 2022 09:22:35 +0000
Message-Id: <20220726092248.128336-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726092248.128336-1-frankja@linux.ibm.com>
References: <20220726092248.128336-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: woFI7y_RLLUIXsXUOBT3pe-A4wlu4o4Y
X-Proofpoint-ORIG-GUID: uy9CM3bvWV74bHarUmeaZDIz0V17eZoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_02,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=931 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

get_start_block() returns the start address of the first memory block
or -1.

With the GuestPhysBlock iterator conversion we don't need to set the
start address and can therefore remove that code. The only
functionality left is the validation of the start block so it only
makes sense to re-name the function to validate_start_block()

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 35b9833a00..b59faf9941 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1498,30 +1498,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
     }
 }
 
-static ram_addr_t get_start_block(DumpState *s)
+static int validate_start_block(DumpState *s)
 {
     GuestPhysBlock *block;
 
     if (!s->has_filter) {
-        s->next_block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         return 0;
     }
 
     QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
+        /* This block is out of the range */
         if (block->target_start >= s->begin + s->length ||
             block->target_end <= s->begin) {
-            /* This block is out of the range */
             continue;
         }
-
-        s->next_block = block;
-        if (s->begin > block->target_start) {
-            s->start = s->begin - block->target_start;
-        } else {
-            s->start = 0;
-        }
-        return s->start;
-    }
+        return 0;
+   }
 
     return -1;
 }
@@ -1668,8 +1660,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         goto cleanup;
     }
 
-    s->start = get_start_block(s);
-    if (s->start == -1) {
+    /* Is the filter filtering everything? */
+    if (validate_start_block(s) == -1) {
         error_setg(errp, QERR_INVALID_PARAMETER, "begin");
         goto cleanup;
     }
-- 
2.34.1


