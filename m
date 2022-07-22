Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D54C57EA4D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 01:38:04 +0200 (CEST)
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF2Db-0008Ds-48
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 19:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oF2C7-0006fQ-Vv; Fri, 22 Jul 2022 19:36:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oF2C5-0004ey-Mz; Fri, 22 Jul 2022 19:36:31 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26MMjr1f008031;
 Fri, 22 Jul 2022 23:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=4Nd5TFEUV+3LcvYXwWZvajWNpYlfzYETstTKHED3MMg=;
 b=svPEHk502qQf5kK6WGCfUtL8qaYxW9iML1MqPK1GmA+kANdoUuBRbS0JVyJBewlSMgwT
 l+2GYlznfBzkNMKOZKYe83yNAAEBR9AxsaK8mtNo+JZzOmtx7b3N73jty5jtFTQvaznb
 napbMjht7HIfgnRoCc7HkG+p9jZ84uPKjXJt/wfGA1QsaQtQBxhnv3+M2SP3zLMjGUj/
 rhQFoFZUJCwjuh8niCBNDm69kSUenqAL3vjCGJX8DR6fUCsWoHnjLvxHqey6CYN7YRTG
 8M3IrG4vK5TCFYfD0Ju3xak9KeTFZm0tiYTztj1XOHDPH9dugor3x6IlQ880zj361ZGL SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg4y78vvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:24 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26MNaOkk009360;
 Fri, 22 Jul 2022 23:36:24 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hg4y78vum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:24 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26MNaMZ6010566;
 Fri, 22 Jul 2022 23:36:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3hbmy90s6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jul 2022 23:36:21 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26MNaVRj26804682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 23:36:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFB074C046;
 Fri, 22 Jul 2022 23:36:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6593E4C044;
 Fri, 22 Jul 2022 23:36:18 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.90.71])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 22 Jul 2022 23:36:18 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 0/2] accel/tcg: Test unaligned stores to s390x
 low-address-protected lowcore
Date: Sat, 23 Jul 2022 01:36:12 +0200
Message-Id: <20220722233614.7254-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J1uA-un8sqeCxSCQgb4ncVqela8aZNXN
X-Proofpoint-ORIG-GUID: Bnw0rKq9QgM6U4Eb_intPWTMYs3A4WfF
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207220094
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

This is a follow-up series for [1].

The fix has been committed.

I asked Christian what might be a good alternative for the
mmio-debug-exit device for testing, and he suggested to look into
shutdown/panic actions.

Patch 1 adds a new panic action.
Patch 2 tests unaligned stores to s390x low-address-protected lowcore;
it performs a shutdown on success and panic on failure.

Best regards,
Ilya

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01876.html

Ilya Leoshkevich (2):
  qapi: Add exit-failure PanicAction
  tests/tcg/s390x: Test unaligned accesses to lowcore

 include/sysemu/sysemu.h                 |  2 +-
 qapi/run-state.json                     |  4 +++-
 qemu-options.hx                         |  2 +-
 softmmu/main.c                          |  6 ++++--
 softmmu/runstate.c                      | 17 +++++++++++++----
 tests/tcg/s390x/Makefile.softmmu-target |  9 +++++++++
 tests/tcg/s390x/unaligned-lowcore.S     | 19 +++++++++++++++++++
 7 files changed, 50 insertions(+), 9 deletions(-)
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

-- 
2.35.3


