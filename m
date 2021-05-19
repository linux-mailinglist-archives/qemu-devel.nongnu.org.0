Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083F388647
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 06:59:32 +0200 (CEST)
Received: from localhost ([::1]:46268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljEIt-0005Z2-3A
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 00:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ljEHO-0003GT-Dx
 for qemu-devel@nongnu.org; Wed, 19 May 2021 00:57:58 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49700
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1ljEHF-0001QF-EM
 for qemu-devel@nongnu.org; Wed, 19 May 2021 00:57:58 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14J4tmhM061971; Wed, 19 May 2021 00:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=vcsWbMVtL7UKEAc5jKvUI4OKcbcJ6cdnWgUN614s13w=;
 b=WwyYf7wMy+bVp0/mNAbHqufbMcRasfWblJ4OjHgWPlD2TquM59zwoQH12mlf4vd6OWAH
 OsqFghItOq5/VOtgIwygNscbI6HnE51zODeNO04gm/GzdJ3ofAyQa/Uu//xKdqP05au/
 uRl3HkvAU1clA6QX1j6oH1jHfnroO1iWbfZhxewfn7Rmww0tiRE+/SCqq8ahsDzEgHZc
 OFxc6Lawtfupa4xGEwCvqc45oxGboAqAVOkn3lAeNEpLmR1lAhbLaCQ3IPTYqL3di9Dl
 eCgP3tbL4mgnSWJoN8q6f1uj99AaXVNkuqcMZhOAOqazmsd1gMnI2RcoqjxSk/c9nfi4 Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mv34r0jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 00:57:45 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14J4vjeG065339;
 Wed, 19 May 2021 00:57:45 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38mv34r0jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 00:57:44 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14J4vhJa002221;
 Wed, 19 May 2021 04:57:43 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38j5x89uc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 04:57:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14J4vCOY19399148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 04:57:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2764A5204E;
 Wed, 19 May 2021 04:57:40 +0000 (GMT)
Received: from vm.lan (unknown [9.145.39.144])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B13F952054;
 Wed, 19 May 2021 04:57:39 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH v2 0/2] target/i386: Make sure that vsyscall's tb->size != 0
Date: Wed, 19 May 2021 06:57:36 +0200
Message-Id: <20210519045738.1335210-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0IyR-7MtQgyqOF5TVQLvv8p2zYh9Dv14
X-Proofpoint-GUID: qUhbtApsx5-FKbBAm4GEQ6YzdnPa0JZ-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_01:2021-05-18,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=826 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series for the s390-next tree fixes [1]. Patch 1 is the fix, patch
2 is the new test to avoid similar regressions in the future.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg02962.html

v1: https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg03219.html
v1 -> v2: Fixed a problem with compiling the new test on centos7. `make
          docker-all-tests` does not spot any other issues with the
          updated patch (it does fail though: a number of iotests have
          problems, there is a build problem with musl, etc, but this
          all happens without the patch too).

Ilya Leoshkevich (2):
  target/i386: Make sure that vsyscall's tb->size != 0
  tests/tcg/x86_64: add vsyscall smoke test

 target/i386/tcg/translate.c      |  1 +
 tests/tcg/x86_64/Makefile.target |  6 +++++-
 tests/tcg/x86_64/vsyscall.c      | 12 ++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/x86_64/vsyscall.c

-- 
2.31.1


