Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31109573C8B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 20:31:05 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBh8a-0006wX-Aa
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 14:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh51-0002A4-8r; Wed, 13 Jul 2022 14:27:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56572
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oBh4y-0001Rh-Bc; Wed, 13 Jul 2022 14:27:23 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DIDkBU004591;
 Wed, 13 Jul 2022 18:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=f0Wv61l/2Xv0ELmtIw3CQnnNtI1j7f8brXYA12OMOx8=;
 b=sxt2nuIR8x1WE2OEthACz1N3FgMeQFjf7SP7fx02tzsPV++6vdbdjDSI340TowwmsRNv
 q8alNpFJmd3eXJcWuaWAtMOJbC6Hd37Mlgsrv1gChHXSvLlpVxC6MqUgl3GVNwfuWmiZ
 Do6dfSPKclCtDgWQ3Y2XRkYUkNlrac4fxHVXdnCl+D4povX4QsEowzfUD7yiq7USprn9
 xc81VgERy7l5849ab+BgntNivE8Xo3ainRzxguBQTExP9W6hyMn18AEi3Z5nnDWtXCam
 9fKEd4pVXG+aGxPd/gDvk3hQsjMav5U9DK8rAid3kwZA8iLN4avU0Js9grJpK3VLP8AE 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha35208vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:27:11 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DINaiN010039;
 Wed, 13 Jul 2022 18:27:11 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha35208u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:27:11 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DHvEpV024410;
 Wed, 13 Jul 2022 18:26:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3h71a8naka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 18:26:17 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DIQEWr18088404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 18:26:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2624D42041;
 Wed, 13 Jul 2022 18:26:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DEDD4203F;
 Wed, 13 Jul 2022 18:26:13 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.47.149])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 18:26:13 +0000 (GMT)
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
Subject: [PATCH v2 0/3] target/s390x: vfmin/vfmax fixes
Date: Wed, 13 Jul 2022 20:26:09 +0200
Message-Id: <20220713182612.3780050-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DY0m1wqYWq-FA2EI4tBCcISr70ZvI5Uf
X-Proofpoint-GUID: yoWjqqqjWG7v9OIAvsQm7TazeOZPFiuE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=831 adultscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130073
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

v1: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01915.html
v1 -> v2: Drop mmap() in the test (Richard).

Ilya Leoshkevich (3):
  target/s390x: fix handling of zeroes in vfmin/vfmax
  target/s390x: fix NaN propagation rules
  tests/tcg/s390x: test signed vfmin/vfmax

 fpu/softfloat-specialize.c.inc    |   3 +-
 target/s390x/tcg/vec_fpu_helper.c |   4 +-
 tests/tcg/s390x/Makefile.target   |   7 +
 tests/tcg/s390x/vfminmax.c        | 411 ++++++++++++++++++++++++++++++
 4 files changed, 422 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/s390x/vfminmax.c

-- 
2.35.3


