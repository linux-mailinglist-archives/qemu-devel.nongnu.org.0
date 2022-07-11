Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B1570A45
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 21:02:25 +0200 (CEST)
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAyfn-0007FF-Fl
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 15:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaY-0002RW-Ec; Mon, 11 Jul 2022 14:56:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45082
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaV-00060u-PQ; Mon, 11 Jul 2022 14:56:58 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BICKjd012718;
 Mon, 11 Jul 2022 18:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i4yVnMq/TEfygjts3btTYr61C0buV1CPNPpNqKp7VhM=;
 b=G7sZ2jjxycnRZ3jpShZv9Ax7nzxgG4EswXDNNIfRFfCy+JT469i9tkM8uLzXjxkkk/3J
 NV51VyKkwXI0sHGUfSxx6dHUHHfFvLQI+yo8U0107tlgM6BDkhqgQlItv6xxdO5tollj
 o9DBlI/qauy8tW4b+aZzt41SO3/4WmF40NaDL1/MxKP61S0QL5fnpv94OGwSRgf26asC
 As/V75qHvQf2qdBX+kFEoHvERoYnK6DXi5Cqnv2m8P1piuSk1mlcmKhMaqHkJkZzdcDv
 fx1ZtzeQI+db6Jj8U5GE7Wh8MclfXuvQmQJuXP3/NGfDNRq6PuxHyj5nL1giFlbz1Lsn KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8pk9d9h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:52 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BIWh8l013270;
 Mon, 11 Jul 2022 18:56:51 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8pk9d9gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BIpiUK017486;
 Mon, 11 Jul 2022 18:56:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn01h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26BIukfT20972014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 18:56:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88DB842041;
 Mon, 11 Jul 2022 18:56:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CA704203F;
 Mon, 11 Jul 2022 18:56:46 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jul 2022 18:56:45 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/3] accel/tcg: Fix unaligned stores to s390x
 low-address-protected lowcore
Date: Mon, 11 Jul 2022 20:56:38 +0200
Message-Id: <20220711185640.3558813-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220711185640.3558813-1-iii@linux.ibm.com>
References: <20220711185640.3558813-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c3j7NlnROJ8QUv6ZLR2y6FktUXmUoM3K
X-Proofpoint-ORIG-GUID: iupURZyDm9hg8eBox04Puizeu-1LTMZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_23,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=954
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110079
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

If low-address-protection is active, unaligned stores to non-protected
parts of lowcore lead to protection exceptions. The reason is that in
such cases tlb_fill() call in store_helper_unaligned() covers
[0, addr + size) range, which contains the protected portion of
lowcore. This range is too large.

The most straightforward fix would be to make sure we stay within the
original [addr, addr + size) range. However, if an unaligned access
affects a single page, we don't need to call tlb_fill() in
store_helper_unaligned() at all, since it would be identical to
the previous tlb_fill() call in store_helper(), and therefore a no-op.
If an unaligned access covers multiple pages, this situation does not
occur.

Therefore simply skip TLB handling in store_helper_unaligned() if we
are dealing with a single page.

Fixes: 2bcf018340cb ("s390x/tcg: low-address protection support")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/cputlb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index f90f4312ea..a46f3a654d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2248,7 +2248,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
     const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
     uintptr_t index, index2;
     CPUTLBEntry *entry, *entry2;
-    target_ulong page2, tlb_addr, tlb_addr2;
+    target_ulong page1, page2, tlb_addr, tlb_addr2;
     MemOpIdx oi;
     size_t size2;
     int i;
@@ -2256,15 +2256,17 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
     /*
      * Ensure the second page is in the TLB.  Note that the first page
      * is already guaranteed to be filled, and that the second page
-     * cannot evict the first.
+     * cannot evict the first.  An exception to this rule is PAGE_WRITE_INV
+     * handling: the first page could have evicted itself.
      */
+    page1 = addr & TARGET_PAGE_MASK;
     page2 = (addr + size) & TARGET_PAGE_MASK;
     size2 = (addr + size) & ~TARGET_PAGE_MASK;
     index2 = tlb_index(env, mmu_idx, page2);
     entry2 = tlb_entry(env, mmu_idx, page2);
 
     tlb_addr2 = tlb_addr_write(entry2);
-    if (!tlb_hit_page(tlb_addr2, page2)) {
+    if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
         if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
             tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
                      mmu_idx, retaddr);
-- 
2.35.3


