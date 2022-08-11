Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FEC58FA65
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 12:05:14 +0200 (CEST)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM53x-0004Gf-JC
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 06:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4v2-0002Cb-4j; Thu, 11 Aug 2022 05:56:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oM4v0-0002gL-JL; Thu, 11 Aug 2022 05:55:59 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B9hGfV021457;
 Thu, 11 Aug 2022 09:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LNJWTjXEDDLzto9iALwGRYwubqmvc7lVDMXP25KOpVY=;
 b=cbGo04X5rt7GXHWoCqokjInmpqNS/Jcc/T4CjVVdz1EXuaYWol1MCKuCUVvt1agRJBbx
 tmxKChcLilGlnVM/x2faAE18MB3MF5gjul6sq7EjoQBKWiKY+nC3ha2VzND6Tds3/k4f
 A9smdl9Fwgvythtp7US6x91mGj4zfRovxcqYe2bgephO/E335GvX7jJjAvEo/ezFtkRI
 0k4CX4UEt5cYebTBgnAN5Sjl8hTThL5lOhPizHjnR4vTcN+ttw01LvV4Mm/OyKzGcA6r
 5wHC79rSWIW/EQdQZnLjG6u7TNrBfoCYQ6OUE7eEQPp1M0JtFqexBlnftPwJ9f7FEoqc yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvycs0a9t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:42 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27B9jwFY027592;
 Thu, 11 Aug 2022 09:55:41 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hvycs0a8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:41 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27B9oPBp030888;
 Thu, 11 Aug 2022 09:55:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3huww19d7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 09:55:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27B9taPX29950446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:55:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4281FA404D;
 Thu, 11 Aug 2022 09:55:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A303FA4040;
 Thu, 11 Aug 2022 09:55:35 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.43.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 09:55:35 +0000 (GMT)
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
Subject: [PATCH v4 1/5] accel/tcg: Invalidate translations when clearing
 PAGE_EXEC
Date: Thu, 11 Aug 2022 11:55:30 +0200
Message-Id: <20220811095534.241224-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220811095534.241224-1-iii@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EY0s4g3Kw_LFEugvoroab1mYUZOYDGTU
X-Proofpoint-GUID: 6u784K7NpgCYsnuuHMQWwS5ypBNsjB2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208110027
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

In the following sequence:

  addr();
  mprotect(addr, 0x1000, PROT_NONE);
  addr();

the second call must cause a SEGV, but it doesn't, because there is a
cached translation. Drop it.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/translate-all.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ef62a199c7..32ea5f0adf 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2295,12 +2295,19 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
          len != 0;
          len -= TARGET_PAGE_SIZE, addr += TARGET_PAGE_SIZE) {
         PageDesc *p = page_find_alloc(addr >> TARGET_PAGE_BITS, 1);
+        bool write_set, exec_cleared;
 
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
+         * If PAGE_EXEC is cleared, we also need to invalidate the code in
+         * order to force a fault when trying to run it.
+         */
+        exec_cleared = (p->flags & PAGE_EXEC) && !(flags & PAGE_EXEC);
+        if ((write_set || exec_cleared) && p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
         if (reset_target_data) {
-- 
2.37.1


