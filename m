Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DFB48C59D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:08:40 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eIo-00058W-R1
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:08:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7dVr-0003x1-6W; Wed, 12 Jan 2022 08:18:04 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41208
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7dVo-0003sE-Fh; Wed, 12 Jan 2022 08:18:02 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CCHKFv009605; 
 Wed, 12 Jan 2022 13:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=VUWGDWhbcfcnt/ZyRhO7cgTdrl4Q0nm5cDXiHLDNACQ=;
 b=TXVtOXtS5BzbQHZyCFXWuKDfPon69ETDp1SQdcPIAMOAf9iWvYGvWFsDGpM16iwYbl+X
 bq2+VNtckQcrkZrMxlxlKEd0QD0S8rV4febKBtnQz3M0ShvMe4+TzT6mal7OHt3TSwGH
 4XSuVh1g1YqPVEoAEbSb/so2zMeFYeVAU1zJv4LVdm4kLtpvSmBVddVtMCtWKhkZ2Ydp
 5P5nhDaI0ZDl1t/+TSIdq9gMnM4+9ksF3P2Nl6rYUMiMeMjXemT0CfyBeMLC5ASt2Ifx
 yCHJW/Cjo2Sm0t8Y+oFyYYi+o8nlg9i6dStJ4iyMlJ+ONWYo1GRhBSo2WXUqsJKGq/4e CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhwkuvgk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:17:58 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CDFAs6028156;
 Wed, 12 Jan 2022 13:17:58 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhwkuvgj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:17:57 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CDC5SQ004281;
 Wed, 12 Jan 2022 13:17:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3df28aac3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:17:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CDHrKG40173960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 13:17:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 172A5AE051;
 Wed, 12 Jan 2022 13:17:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 890B8AE04D;
 Wed, 12 Jan 2022 13:17:52 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 13:17:52 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 0/5] target/s390x: Fix shift instructions
Date: Wed, 12 Jan 2022 14:17:46 +0100
Message-Id: <20220112131751.226011-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Wkhmcffe3yZdVgbZmtczQEoLtGvsekU-
X-Proofpoint-GUID: Xt6W-vcuVFgDHmSZtToEPCBneXgruJ13
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02488.html
v2 -> v3: Unify CC_OP_SLA_32 and CC_OP_SLA_64.
          Add underscores to test macro parameters.
          Shift CC in test asm.
          Add a second SLAG test.
          Add tags to commit messages.

v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg02035.html
v1 -> v2: Fix cc_calc_sla_32().
          Fix cc_calc_sla_64().
          Fix SLDA sign bit index.
          Inline help_l2_shift().
          Fix wout_r1_D32().
          Add all shift instructions to the test.
          Split the series.

Ilya Leoshkevich (5):
  target/s390x: Fix SLDA sign bit index
  target/s390x: Fix SRDA CC calculation
  target/s390x: Fix cc_calc_sla_64() missing overflows
  target/s390x: Fix shifting 32-bit values for more than 31 bits
  tests/tcg/s390x: Test shift instructions

 target/s390x/cpu-dump.c         |   3 +-
 target/s390x/s390x-internal.h   |   3 +-
 target/s390x/tcg/cc_helper.c    |  39 +----
 target/s390x/tcg/insn-data.def  |  36 ++---
 target/s390x/tcg/translate.c    |  49 +++---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/shift.c         | 270 ++++++++++++++++++++++++++++++++
 7 files changed, 318 insertions(+), 83 deletions(-)
 create mode 100644 tests/tcg/s390x/shift.c

-- 
2.31.1


