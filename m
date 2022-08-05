Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F2658AEFB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:36:19 +0200 (CEST)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1FC-0002tD-2o
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK1Cz-0007py-PR; Fri, 05 Aug 2022 13:34:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oK1Cx-0004jd-JP; Fri, 05 Aug 2022 13:34:01 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 275HFH5h025974;
 Fri, 5 Aug 2022 17:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=73qnw5nIm3iv+coHjF7quQ8YT4tdxDWXNrMdnbdBb30=;
 b=NwTxsN1SjriiQzfQGErMgShqNcR9yMgY5aZXASEHRC/8GVlWYjvOHyJTZ0onpr64VNLR
 DCE9xt+KVN67Hyxg2cucBKNSZ2W9ASsv/zNk/bkuw9NzzVzK/yuCi8gTChAMQaEcFKOo
 t8CrJeAkeQEWuDxS1XXv3Bw7J/p1ATZqQecCMpNgdLMmCm5lVa14xNCZRVkvNCIwknfQ
 sHuPXNJuYtSWFGiRPQAgZuRJzcgt44m8p/kooC5A3/APmwXG1ZQpfxfQc+ZuEPT0jdSC
 oQtrKBvHZInS+LHgA6+0vd3sizKz5QHLp8AwuIbXJJXh2Es9Z44O2q71Uqysu2I8QbSM 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7eeremw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 17:33:47 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 275HJ4nX037316;
 Fri, 5 Aug 2022 17:33:47 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hs7eerekm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 17:33:47 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 275HK1vq026302;
 Fri, 5 Aug 2022 17:33:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com ([9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3hmuwhtpn8-124
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Aug 2022 17:33:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 275G9HUY8913360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Aug 2022 16:09:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85450A405B;
 Fri,  5 Aug 2022 16:09:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4C66A4054;
 Fri,  5 Aug 2022 16:09:16 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.89.138])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Aug 2022 16:09:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 1/4] accel/tcg: Invalidate translations when clearing
 PAGE_READ
Date: Fri,  5 Aug 2022 18:09:11 +0200
Message-Id: <20220805160914.1106091-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220805160914.1106091-1-iii@linux.ibm.com>
References: <20220805160914.1106091-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _HBbJuXyE-9JJhkTdKj1C6t3rHZnhT2l
X-Proofpoint-GUID: b_ppoRJ3aw37N2LJYf4OXJ85fu5-dRrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-05_09,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=941 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208050082
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

After mprotect(addr, PROT_NONE), addr can still be executed if there
are cached translations. Drop them.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/translate-all.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7..9318ada6b9 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2295,12 +2295,19 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
         PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        bool write_set, read_cleared;
 
-        /* If the write protection bit is set, then we invalidate
-           the code inside.  */
-        if (!(p->flags & PAGE_WRITE) &&
-            (flags & PAGE_WRITE) &&
-            p->first_tb) {
+        /*
+         * If the write protection bit is set, then we invalidate the code
+         * inside.
+         */
+        write_set = !(p->flags & PAGE_WRITE) && (flags & PAGE_WRITE);
+        /*
+         * If PAGE_READ is cleared, we also need to invalidate the code in
+         * order to force a fault when trying to run it.
+         */
+        read_cleared = (p->flags & PAGE_READ) && !(flags & PAGE_READ);
+        if ((write_set || read_cleared) && p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
         if (reset_target_data) {
-- 
2.35.3


