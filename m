Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A964D68CA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 19:53:24 +0100 (CET)
Received: from localhost ([::1]:39468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSkOB-000531-AU
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 13:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkKQ-0007KZ-Q4; Fri, 11 Mar 2022 13:49:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1248
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSkKP-0007Qn-2E; Fri, 11 Mar 2022 13:49:30 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BGPK6I022774; 
 Fri, 11 Mar 2022 18:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eOylWPNjJk3icH0AJggi83Gac5cRdkijjpSYfmg6fek=;
 b=AyVQoLInYDKogEp5eHlcjbWhW6y2540ZPgLxdK9YLa3AmEvKrVKY2JeJVcoZfnveLuCR
 TvoP6zeBrEBm0e2jaQ5b0055Xxgjvpvk4GNv1hO/4EbzyPHEyqH5HzHDyo8YR3FRHNS7
 5mMtxPdTQxZLAZb4pCXg8OdyGxk5g2vIxw3EDZra0/qOp7sWd81E+uZtKLjXeDDPBU3x
 hHswZck3zSOBVknOjp8ZfPHw4h5/zIDvq31wHdoxvhI0OOnKqqnyMdI7/2YoOszWqcXt
 BeqY7scN/zIxts/Clw7PJY1JmjuO4XKw/8XwvsJnX4MTluiHc92sjpq7TyQHnrT3EYSn 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqgwja1ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:26 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22BIZnm4004240;
 Fri, 11 Mar 2022 18:49:25 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqgwja1t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:25 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22BInLSg001448;
 Fri, 11 Mar 2022 18:49:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ekyg8neee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Mar 2022 18:49:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22BInKM213041990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 18:49:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38357AE045;
 Fri, 11 Mar 2022 18:49:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0322AE04D;
 Fri, 11 Mar 2022 18:49:19 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Mar 2022 18:49:19 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/3] s390x/tcg: Fix BRASL with a large negative offset
Date: Fri, 11 Mar 2022 19:49:09 +0100
Message-Id: <20220311184911.557245-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311184911.557245-1-iii@linux.ibm.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PsTOIpZN_C-MhSSLfykL-8QUSs3LW9Xu
X-Proofpoint-ORIG-GUID: WJxw6xW9vpM1N3W9bVKl9i6Zibj9NiKx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-11_07,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=830
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203110091
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

Fixes: 8ac33cdb8bfb ("Convert BRANCH AND SAVE")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 904b51542f..41c8696185 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1597,7 +1597,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s, s->pc_tmp);
-    return help_goto_direct(s, s->base.pc_next + 2 * get_field(s, i2));
+    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
 }
 
 static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
-- 
2.35.1


