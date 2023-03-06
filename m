Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92016ACF9E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 21:57:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZHsT-0006SO-CO; Mon, 06 Mar 2023 15:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pZHsR-0006M9-1Y; Mon, 06 Mar 2023 15:56:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pZHsP-0001jX-Cw; Mon, 06 Mar 2023 15:56:10 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326KKswB032108; Mon, 6 Mar 2023 20:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=O+4ei8wOfAjTlOlK1Db8Bt/UAhXW8L3gRW5xjVgvCK8=;
 b=hruAEaZAAW186MpEvWVmjdn8TVby9+LjNExB6S0NYl8u4SxyK7zFcUr3xG3k/oZLeeAF
 h4ZPek8Bwv4zcVomw9OP1MPVB504TVboOpdnwQeSt/OSyYev85/pvHdLhbAkkWvBIyt9
 JPT1569XeDYoiG06RsJ9OXHn/IT6DEQBNEG2DDbyMpJNRenKvMrvM2EEzJY15u3vGuCD
 C7oPERJCqW08jtq596CdF7RLQVOOE3X1gmfTN5Ur0jd8OGTeN8pwvdXvmjPU5MfoOFq0
 /GneLIMJQ/j+bDXI/JU5BEJot9iR3pnmAEJMCP7jaZvOeLJp7x+JDFRZXFN8DYMl+61m bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p50vmr9wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 20:56:04 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326Kt5O1018836;
 Mon, 6 Mar 2023 20:56:04 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p50vmr9vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 20:56:04 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3264ePK0001834;
 Mon, 6 Mar 2023 20:56:01 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3p4192aju4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 20:56:01 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326KtwcY62849374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 20:55:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 265CF20049;
 Mon,  6 Mar 2023 20:55:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6F9620040;
 Mon,  6 Mar 2023 20:55:57 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 20:55:57 +0000 (GMT)
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Subject: [PATCH v1 0/2] target/s390x: Fix emulation of C(G)HRL
Date: Mon,  6 Mar 2023 21:55:52 +0100
Message-Id: <20230306205554.2070579-1-nsg@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bLtWtbPR29Os1uxDSjCwcw6AnUi0zlBQ
X-Proofpoint-ORIG-GUID: uOi_u5rg20_wDIWv-RXZBnMvzs_LOS2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=708
 suspectscore=0 adultscore=0 mlxscore=0 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060178
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
halfword, it does not have the same size as the first operand.
Fix this and add a tcg test for c(g)hrl.

Nina Schoetterl-Glausch (2):
  target/s390x: Fix emulation of C(G)HRL
  tests/tcg/s390x: Add C(G)HRL test

 target/s390x/tcg/insn-data.h.inc |  4 +-
 target/s390x/tcg/translate.c     |  7 +++
 tests/tcg/s390x/chrl.c           | 76 ++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |  1 +
 4 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/s390x/chrl.c


base-commit: a2b5f8b8ab7b2c947823088103a40f0ff11fe06b
-- 
2.37.2


