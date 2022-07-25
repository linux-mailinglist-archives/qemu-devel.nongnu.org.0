Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540195807B2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 00:42:17 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG6mG-00018C-4r
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 18:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oG6i6-0005Lf-Kz; Mon, 25 Jul 2022 18:37:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oG6i4-0001OR-Q5; Mon, 25 Jul 2022 18:37:58 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PMSYfc026525;
 Mon, 25 Jul 2022 22:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=abhv45tcqvJULYYch1yRWy0lio7ifECJMIxjSzpUp1M=;
 b=lA/2DufIJWwRWeVpCI4r8caWSlB/uGat1feMzLvxDfa2mJ4M+qaMrpXta548bsIQkiAm
 PRKI3s0XBTfIpJhDyS1bOXr9oYzv9hxnVUDhsk11IcrRDz0C/gI2P6JkBmC5SNcuxa0g
 QsP1u4bVrs7Lw1wHHyhD0r9NnqY6jb8Lzizrg/U9akC+bD2QVssN/LBf9BZWyDEvw1yM
 fc8w5hiWAkChFKSjAI4Htkr3ueF8uOrcG26WBGuMMEqH+HRIPaBXb8a5HndXlrW9Rdft
 z2IOwFGwUL4zrDrFU1nu5i7BcdP7Sb54SjXP3VYbhKqk2/GIF1v0goAGrwzirNbFhy3m dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hj40h05qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 22:37:54 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26PMVT6t002008;
 Mon, 25 Jul 2022 22:37:53 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hj40h05ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 22:37:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PMZAkl010292;
 Mon, 25 Jul 2022 22:37:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tayk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 22:37:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26PMZouB22151558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 22:35:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41FEF4C04A;
 Mon, 25 Jul 2022 22:37:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C10D54C040;
 Mon, 25 Jul 2022 22:37:47 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.20.53])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jul 2022 22:37:47 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 0/2] accel/tcg: Test unaligned stores to s390x
 low-address-protected lowcore
Date: Tue, 26 Jul 2022 00:37:44 +0200
Message-Id: <20220725223746.227063-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XjKmuGmlsucDHmL5A4sD576gMxTdfqoT
X-Proofpoint-GUID: arNipdRy8wRiUI1HzlXglh5kGB8SRgno
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_13,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250092
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

v2: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg04129.html
v2 -> v3: Add @since tag (Eric).
          Fix a small style issue in the test.

Ilya Leoshkevich (2):
  qapi: Add exit-failure PanicAction
  tests/tcg/s390x: Test unaligned accesses to lowcore

 include/sysemu/sysemu.h                 |  2 +-
 qapi/run-state.json                     |  5 ++++-
 qemu-options.hx                         |  2 +-
 softmmu/main.c                          |  6 ++++--
 softmmu/runstate.c                      | 17 +++++++++++++----
 tests/tcg/s390x/Makefile.softmmu-target |  9 +++++++++
 tests/tcg/s390x/unaligned-lowcore.S     | 19 +++++++++++++++++++
 7 files changed, 51 insertions(+), 9 deletions(-)
 create mode 100644 tests/tcg/s390x/Makefile.softmmu-target
 create mode 100644 tests/tcg/s390x/unaligned-lowcore.S

-- 
2.35.3


