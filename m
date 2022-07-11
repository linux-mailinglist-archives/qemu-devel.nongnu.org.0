Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7D6570A44
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 21:02:25 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAyfm-0007Dn-WC
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 15:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaX-0002R4-4C; Mon, 11 Jul 2022 14:56:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oAyaV-0005xT-8L; Mon, 11 Jul 2022 14:56:56 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BHJYR4009799;
 Mon, 11 Jul 2022 18:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=dja5qNhFMidWWRcqGwEE52roSibN8A1rnBHFE4gUAxk=;
 b=ZezxH+t/qwP/PkJT85xCx01kGlz4Fj0ZAswhefwinQk8T1q6AHGL5pG892lKn+XTVkea
 3AGlBTqcQkV594eyMGZaFcYUHSv6Mw8S31JRban/VV/Cs5LdyeM7Rffr2B506+Dx8M/Y
 WhY868YqCfkFXNWhaRfSRJX0OFi0Wk+gMYfedETxjbKryKSB7i95ECLx5bBbKrW9QKBr
 1/OyZJnSi7te3DNu7raI7YS9VxYTnxDoce2irVqNc2QCxVasihffZjbO6PeKtNDjAC1y
 rCBU+GF0Vh5kx97AajJjG2PccstkkiMAbHzlB6hTlQxt5rKp0KujKiM4eKBbFF1NBxWf 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8r5rjbna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:50 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BHw9xp031989;
 Mon, 11 Jul 2022 18:56:50 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8r5rjbmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:49 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BIplpx017489;
 Mon, 11 Jul 2022 18:56:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn01h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 18:56:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26BIuiGi24117578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 18:56:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4636A42041;
 Mon, 11 Jul 2022 18:56:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEB5842042;
 Mon, 11 Jul 2022 18:56:43 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.48.196])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jul 2022 18:56:43 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/3] accel/tcg: Fix unaligned stores to s390x
 low-address-protected lowcore
Date: Mon, 11 Jul 2022 20:56:37 +0200
Message-Id: <20220711185640.3558813-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1CvrOhAAtuXx7EwvAaRivNhuDPkXezCI
X-Proofpoint-GUID: nPbzrZQAUIWRBp6ptrymFOufaTkEAumE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_23,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110079
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

I noticed that certain accesses to lowcore incorrectly trigger
protection exceptions. I tracked it down to store_helper_unaligned()
calling tlb_fill() with ranges like [0, 2000).

Patch 1 fixes the issue, patch 2 adds a new MMIO device that enables
writing system tests for s390x, patch 3 adds a system test for this
issue.

Best regards,
Ilya

Ilya Leoshkevich (3):
  accel/tcg: Fix unaligned stores to s390x low-address-protected lowcore
  hw/misc: Add mmio-debug-exit device
  tests/tcg/s390x: Test unaligned accesses to lowcore

 accel/tcg/cputlb.c                      |  8 ++-
 hw/misc/Kconfig                         |  3 +
 hw/misc/debugexit_mmio.c                | 80 +++++++++++++++++++++++++
 hw/misc/meson.build                     |  1 +
 hw/s390x/Kconfig                        |  1 +
 tests/tcg/s390x/Makefile.softmmu-target |  9 +++
 tests/tcg/s390x/unaligned-lowcore.S     | 24 ++++++++
 7 files changed, 123 insertions(+), 3 deletions(-)
 create mode 100644 hw/misc/debugexit_mmio.c
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

-- 
2.35.3


