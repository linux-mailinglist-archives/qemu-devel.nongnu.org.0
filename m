Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2B5570FF0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:02:04 +0200 (CEST)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5Dt-0003Fm-2n
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB59o-0006Qs-QG; Mon, 11 Jul 2022 21:57:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8108
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oB59n-0003KI-8h; Mon, 11 Jul 2022 21:57:48 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C1HmBn002371;
 Tue, 12 Jul 2022 01:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zYEKSCiLRix8hYzupzuBQTSygCVE8ZV02uCqMS3URP0=;
 b=DfnaTj0VNtcBW/IQsvnGaKmM79bYunCsDR6ox3nPN+5lBUtfQDq3/pTSHwupkd+cwfmq
 82Lr+Zs1TEiQ4PLW9DGVQBdGfjqP7spGCSlMuX0XuArA/ljhe6zNHPlHxI1esExNsokW
 Kd6zs12Wdo2aPwuAfojjMABZpcb4WEvMoLe3exkkcrOmFBPFVgtOUPyJ7sD8I9LDoY80
 QJgqJV8Tc2L7GZNe0zkiRIDpn2C018c21HugL85T6l0TD0TDTW8384Rv/iM/Qme2I27J
 ITFHwtFJum8VPN3koq7QDdFR09bYsyZVQkAVyxHbg44iSht1x6BU9RUIxCZZZVj3w2XE kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8y5x8qxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:30 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C1rBEq007728;
 Tue, 12 Jul 2022 01:57:29 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8y5x8qwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C1plcO016968;
 Tue, 12 Jul 2022 01:57:28 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn0c43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 01:57:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26C1vOJk22479180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 01:57:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66E64A404D;
 Tue, 12 Jul 2022 01:57:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D163AA4040;
 Tue, 12 Jul 2022 01:57:23 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Jul 2022 01:57:23 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/3] target/s390x: vfmin/vfmax fixes
Date: Tue, 12 Jul 2022 03:57:14 +0200
Message-Id: <20220712015717.3602602-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rvw83tjQCrKJL1ZYn1fcx82wQzZjEvQ9
X-Proofpoint-ORIG-GUID: pV2Jt6flhdwPHjTZ3g2v0jFL3sBhWrmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_01,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=762
 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120004
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

Hi,

Uli has found an issue with finding maximum of different kinds of 0s; I
wrote a test and found another one with finding maximum of different
kinds of NaNs.

Patches 1 and 2 fix those issues, patch 3 adds a vfmin/vfmax test.

Best regards,
Ilya

Ilya Leoshkevich (3):
  target/s390x: fix handling of zeroes in vfmin/vfmax
  target/s390x: fix NaN propagation rules
  tests/tcg/s390x: test signed vfmin/vfmax

 fpu/softfloat-specialize.c.inc    |   3 +-
 target/s390x/tcg/vec_fpu_helper.c |   4 +-
 tests/tcg/s390x/Makefile.target   |   7 +
 tests/tcg/s390x/vfminmax.c        | 426 ++++++++++++++++++++++++++++++
 4 files changed, 437 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/s390x/vfminmax.c

-- 
2.35.3


