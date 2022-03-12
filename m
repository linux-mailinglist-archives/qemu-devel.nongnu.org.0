Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E3D4D6DC2
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 10:33:52 +0100 (CET)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSy8F-0007HY-9J
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 04:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0Y-0002Zj-Or; Sat, 12 Mar 2022 04:25:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:20586
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0W-0007KQ-UI; Sat, 12 Mar 2022 04:25:54 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22C4V04x030055; 
 Sat, 12 Mar 2022 09:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WGlaORyLBE9rKtjLX9jXbOlfpXOV3MnTMlNNBZ6isYU=;
 b=BbkaS5q3CH9fP63/nEUQq/yLOyFv2DfOPp6Ibf6yxVY0ZfvvPn/Tk65OU7sW0ETigbKe
 Wih/fhL57BG/DONDimQSFDgZEvSlfMC8Fh4PP+v7yGDuTD6cpggOUoj5Iksb/65LSCwN
 jusiMwoHdnaf0k2HLjmmOqHXWR2qzCGg8VtMY6FgYKY+K64mfu+RB88ZgChqL11BJiqV
 4hosKA8OPi/C5rodiiz7iu2AL7iB1cJmhJbvHsH6FOE9K1f4vrWN6x+6mjXAJlxL7MCn
 qAL9N8fBFriS3TcnCjsrgzRO5kX8QHQEpFuSnQF5Z2a/OD4NXdBn6A7hzzajzW2+F6Bn yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3erhm9d82r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:51 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22C9PoNI007415;
 Sat, 12 Mar 2022 09:25:50 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3erhm9d82e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:50 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22C9E7LM009568;
 Sat, 12 Mar 2022 09:25:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3erjshgewg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22C9PjaO58851742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Mar 2022 09:25:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 676C542041;
 Sat, 12 Mar 2022 09:25:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF0594203F;
 Sat, 12 Mar 2022 09:25:44 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 12 Mar 2022 09:25:44 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 2/3] s390x/tcg: Fix BRCL with a large negative offset
Date: Sat, 12 Mar 2022 10:25:40 +0100
Message-Id: <20220312092541.585282-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312092541.585282-1-iii@linux.ibm.com>
References: <20220312092541.585282-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n7u68YDIjh2qtINIS7CY9n95dI9alXto
X-Proofpoint-ORIG-GUID: PLG3QQitnCMS2GOyNWfORSJZSKyHM6XU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-12_03,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203120053
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When RI2 is 0x80000000, qemu enters an infinite loop instead of jumping
backwards. Fix by adding a missing cast, like in in2_ri2().

Fixes: 7233f2ed1717 ("target-s390: Convert BRANCH ON CONDITION")
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 41c8696185..5acfc0ff9b 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1201,7 +1201,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
     DisasJumpType ret;
-    uint64_t dest = s->base.pc_next + 2 * imm;
+    uint64_t dest = s->base.pc_next + (int64_t)imm * 2;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
-- 
2.35.1


