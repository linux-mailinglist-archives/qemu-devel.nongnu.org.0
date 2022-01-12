Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB2448BDEF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 05:42:07 +0100 (CET)
Received: from localhost ([::1]:59988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7VSY-0003x3-Jy
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 23:42:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQd-0002Id-Rj; Tue, 11 Jan 2022 23:40:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1n7VQX-0003Sk-C4; Tue, 11 Jan 2022 23:40:06 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20C1ZuKU006889; 
 Wed, 12 Jan 2022 04:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=19VrwEJvg6bLZKt5bHQ0iQOBLSVNTJkHmx57TMoMkvM=;
 b=jv+3wwkZjhux7XXeOXTr8WOb61EapAINMQtPbM96FsZCEf2vyE9feWSnqwoFtkDZ6eoC
 PaOxv/PjQrApZ4ZNdhgVvjwAP3c2phe1zuUNRB3MlfDelVlJS40lqmXRWsgKM7xEZIeV
 cgQ7L/foj2QEcHL9v9bKqJeicK1n2cXGq26ciYRFq6Zj1SOJ9RdtozLZ+4JpsY12MAN6
 TWQnKmRhLqJMZduoEbs2ULziqd0c9CYoOau5PZc6nfc6GP6Jq1EL+mdJMCnf7R7CMrMH
 wnSbdBjOD5ixQ2+r9Q5o8N6ncD+KbDrtBOa5seoMOhjE3RdGVsnvDVAEnEzlEVeUSr6M xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhhcw6p7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:58 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20C3jo2e028241;
 Wed, 12 Jan 2022 04:39:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhhcw6p74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C4X23p021520;
 Wed, 12 Jan 2022 04:39:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3df2895ea3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 04:39:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20C4Unmq32965044
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 04:30:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE04C42042;
 Wed, 12 Jan 2022 04:39:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5902F42054;
 Wed, 12 Jan 2022 04:39:51 +0000 (GMT)
Received: from vm.lan (unknown [9.171.78.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 04:39:51 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 0/5] target/s390x: Fix shift instructions
Date: Wed, 12 Jan 2022 05:39:43 +0100
Message-Id: <20220112043948.224405-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: n1i90V9MJSzBz1nfgC2jwFy9Y70H6Yes
X-Proofpoint-ORIG-GUID: 8DmRd9ZQR-mZ0arOTTohT7KK9vHVJMZ2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_01,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120024
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 target/s390x/tcg/cc_helper.c    |  35 +----
 target/s390x/tcg/insn-data.def  |  36 ++---
 target/s390x/tcg/translate.c    |  36 ++---
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/shift.c         | 258 ++++++++++++++++++++++++++++++++
 5 files changed, 297 insertions(+), 69 deletions(-)
 create mode 100644 tests/tcg/s390x/shift.c

-- 
2.31.1


