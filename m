Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017CA58FC33
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:29:03 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7J7-0005ra-Vy
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73u-0004YH-G9; Thu, 11 Aug 2022 08:13:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41526
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM73s-0000F0-Ds; Thu, 11 Aug 2022 08:13:18 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6uaj013315;
 Thu, 11 Aug 2022 12:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=u/FBcX1YUPeJNHhAcJqaj6B526OCtEMaBR/+ksHsvws=;
 b=c5Bl58Qy4ZVzDF9eEf18dQ1iyTJlzojOF8aazmgpCEoldjm3ZanG3UA9m7C9ZuIIqY41
 I0YhNN0MifSLxxyC9cM1UopfIDZ/dQ1RIGcjBs+2jC06yGq+fxpMbJ8ZIRPuuEBefNZj
 fx0tqYYN2ztf/3mtDYEWy0SdT3MgYZVBlFTD0yUkDdB5J8utfJCO3ijsuK2M5r7Zw0NL
 R0u3Dvp7nXkFxtASrF17OLAZ+VxB5iG7Uu9PerB/YexdT/tzRX9qPGPpxq8kQrcoXlzS
 VWAuQ4ccc81zWQZFVqqqF86Iap/cWwtH/+YN+AEpOc25C+rmuUWaHXzE34e4iJIHfZSX CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0q08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:13:14 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC7DRv016279;
 Thu, 11 Aug 2022 12:12:45 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw1dp0nuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC7ZhE014962;
 Thu, 11 Aug 2022 12:12:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3huwvg20kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:07 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCC4G327263406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FC75AE04D;
 Thu, 11 Aug 2022 12:12:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D982AE045;
 Thu, 11 Aug 2022 12:12:03 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:03 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 04/18] dump: Rework get_start_block
Date: Thu, 11 Aug 2022 12:10:57 +0000
Message-Id: <20220811121111.9878-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kjtCK-HJUsLP0LBLd9HPUWbEusqWbJUr
X-Proofpoint-ORIG-GUID: akthUi9s6M66r-zqo73C1iTx1ayyEsjW
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

get_start_block() returns the start address of the first memory block
or -1.

With the GuestPhysBlock iterator conversion we don't need to set the
start address and can therefore remove that code and the "start"
DumpState struct member. The only functionality left is the validation
of the start block so it only makes sense to re-name the function to
validate_start_block()

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---
 dump/dump.c           | 20 ++++++--------------
 include/sysemu/dump.h |  2 --
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 340de5a1e7..e204912a89 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1500,30 +1500,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
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
@@ -1670,8 +1662,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         goto cleanup;
     }
 
-    s->start = get_start_block(s);
-    if (s->start == -1) {
+    /* Is the filter filtering everything? */
+    if (validate_start_block(s) == -1) {
         error_setg(errp, QERR_INVALID_PARAMETER, "begin");
         goto cleanup;
     }
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index ffc2ea1072..7fce1d4af6 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -166,8 +166,6 @@ typedef struct DumpState {
     hwaddr memory_offset;
     int fd;
 
-    GuestPhysBlock *next_block;
-    ram_addr_t start;
     bool has_filter;
     int64_t begin;
     int64_t length;
-- 
2.34.1


