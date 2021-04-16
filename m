Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C858A3624B2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:56:39 +0200 (CEST)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQpi-0000Ip-QT
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQjA-00034B-D5; Fri, 16 Apr 2021 11:49:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQj8-000080-HF; Fri, 16 Apr 2021 11:49:52 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFYgq1091398; Fri, 16 Apr 2021 11:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=3t2srugeftu7HAyHW8NUSjtAWg61QVEYVODVxFRV/qE=;
 b=pHc7ptXMZnC+eXRtkTieKUh//aYcxRqoIgdRLsHpg+Ayooe3Kkx2rmCsGYHwbFgSi/2w
 q0NgsDSPGCvQb4LCpDJaEi1DVXuS/4DPVgWJrSx7tfFcbpMCblbri3bHsnn2XGorStjG
 uJXfVMECevzyGABevLB7v78kASofn9jTVn+ByyXAf+iO+t1mu60l8V+sX1EjoS/iofCp
 lzDcC1gT7YnTJkFR/i8Orj63EcEi9uyKnbtYA00EdtOu3hP3JdjqlhX/3OmTdnz9WQMK
 T2fJYH3l7GRskZ0nv/8VMWtaO45YehIGZpjlwQtWrpPHIcEdzb7+yc0CsO5NF6aDig6S bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y7wv2mtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:47 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GFZEGv094392;
 Fri, 16 Apr 2021 11:49:46 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y7wv2mt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GFd0uF029134;
 Fri, 16 Apr 2021 15:49:44 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 37u39haf07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:49:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13GFnIIu31981914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:49:18 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E054D11C04C;
 Fri, 16 Apr 2021 15:49:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0525E11C050;
 Fri, 16 Apr 2021 15:49:40 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 15:49:39 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Date: Fri, 16 Apr 2021 17:49:35 +0200
Message-Id: <20210416154939.32404-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NdW9b8RPf2yoyIKcWS8poAYp30qLEa4N
X-Proofpoint-ORIG-GUID: tM-Y3PHzr_ig3Cq3uKU1rz8xF4B4LSkZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If arch-specific code generates a translation block of size 0,
tb_gen_code() may generate a spurious exception.

Fix s390x (patch 1), ARM (patch 2) and xtensa (patch 3) and add an
assertion in order to catch such situations earlier (patch 4).

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
          in tb_gen_code().

v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02101.html
v2 -> v3: Split the common code change into a separate patch, add the
          ARM patch in order to fix
          https://gitlab.com/cohuck/qemu/-/jobs/1178409450

v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02332.html
v3 -> v4: Add the xtensa patch in order to fix
          https://gitlab.com/cohuck/qemu/-/jobs/1178409540

v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02592.html
v4 -> v5: Handle thumb: the following C code triggers the assertion:
          typedef void (*funcptr)(void);
          int main() { funcptr f = (funcptr)0xffff0001; f(); }

Ilya Leoshkevich (4):
  target/s390x: Fix translation exception on illegal instruction
  target/arm: Make sure that commpage's tb->size != 0
  target/xtensa: Make sure that tb->size != 0
  accel/tcg: Assert that tb->size != 0 after translation

 accel/tcg/translate-all.c |  1 +
 target/arm/translate.c    |  2 ++
 target/s390x/translate.c  | 16 +++++++++++-----
 target/xtensa/translate.c |  3 +++
 4 files changed, 17 insertions(+), 5 deletions(-)

-- 
2.29.2


