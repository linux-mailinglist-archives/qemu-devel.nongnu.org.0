Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA858A08F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:33:04 +0200 (CEST)
Received: from localhost ([::1]:55026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfeZ-0004Su-Ma
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oJfWE-0007rJ-OE; Thu, 04 Aug 2022 14:24:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oJfWB-0002NO-Mz; Thu, 04 Aug 2022 14:24:26 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 274IKHt8014787;
 Thu, 4 Aug 2022 18:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=h3HEMhSlQYICcA5ige4nxejoD2e7be9ru97zqFJ9Jks=;
 b=ikWAP7EMBAQR4bfDO+/mW1Cv6910iEUvd5HmGhC3aLp50FSWEGDFTdASiTbQEbIBb42/
 k66gFqXQkwqM7k3kB27rf2HNQjrk4rqdT4/VtS3oCraBk6rlFLEEM9mJOOinZVpgTeo1
 q3U22toBgLmJOdlvhfJsfWUGQ/1J5lhcQFniEyaOx194OTvxAHzEIJ8chhsJussuN8Qq
 epCpiNHD7qMGngqp0joHZxcJC+nhSLEPjK7bHkcOq4hv33vAmkia4W90iNZDW2c6KRBs
 DE783a04KpdVw+PHFdem4I2NzdWYAuywqBc2hVVPs/wcLBSyt40Be+24G78YP0uT+mDN 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrk9y022p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 18:24:08 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 274ILdUO020558;
 Thu, 4 Aug 2022 18:24:07 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hrk9y021h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 18:24:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 274ILlSt005230;
 Thu, 4 Aug 2022 18:24:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3hmv98xgg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Aug 2022 18:24:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 274IO13N29295080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Aug 2022 18:24:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87DB35204E;
 Thu,  4 Aug 2022 18:24:01 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.2.232])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EB04A5204F;
 Thu,  4 Aug 2022 18:24:00 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Date: Thu,  4 Aug 2022 20:23:57 +0200
Message-Id: <20220804182359.830058-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8yXBeg1E6zxPWh5o22UpaOkKlL8cbwqq
X-Proofpoint-ORIG-GUID: EkjBolN4HWhe7W4YJ3KElqJ7HMXlhw3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_03,2022-08-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040077
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

I noticed that when we get a SEGV due to jumping to non-readable
memory, sometimes si_addr and program counter in siginfo_t are slightly
off. I tracked this down to the assumption that translators stop before
the end of a page, while in reality they may stop right after it.

Patch 1 fixes the issue, patch 2 adds tests.

Best regards,
Ilya

Ilya Leoshkevich (2):
  linux-user: Fix siginfo_t contents when jumping to non-readable pages
  tests/tcg: Test siginfo_t contents when jumping to non-readable pages

 accel/tcg/translate-all.c        |  16 ++--
 accel/tcg/translator.c           |  25 ++++++
 include/hw/core/cpu.h            |   2 +
 linux-user/signal.c              |   5 ++
 tests/tcg/multiarch/noexec.h     | 114 ++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target  |   1 +
 tests/tcg/s390x/noexec.c         | 145 +++++++++++++++++++++++++++++++
 tests/tcg/x86_64/Makefile.target |   3 +-
 tests/tcg/x86_64/noexec.c        | 116 +++++++++++++++++++++++++
 9 files changed, 421 insertions(+), 6 deletions(-)
 create mode 100644 tests/tcg/multiarch/noexec.h
 create mode 100644 tests/tcg/s390x/noexec.c
 create mode 100644 tests/tcg/x86_64/noexec.c

-- 
2.35.3


