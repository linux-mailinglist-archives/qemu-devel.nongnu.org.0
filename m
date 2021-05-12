Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A4C37B4C7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:04:51 +0200 (CEST)
Received: from localhost ([::1]:47414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgg78-0007nK-5W
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lgg5Q-0006Tl-3W
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:03:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:64484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lgg5N-0007oU-Qq
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:03:03 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14C42Tm0102337; Wed, 12 May 2021 00:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Ab+5mNODFgv5qFSzsjCV2j5ra2rKo0bTTZC3TLFtPdA=;
 b=B/6N2FxHowrHlyOvYYYFmAxl4V9+tl4d+DJRS2QswarGuSyAqmDdoKFRZmu+E3DjD3kL
 YJSeSas/YYaYmBD0Ww/gw/dtI9ZCBL4xVWVnLpDi5SpfCbTbmj1eC1AIX/knOzNOTVWX
 NMDJ5Mg7hhL9EFxlZmpz5av96QXvVLz2mGL+ElvNJ2VZddoKsUhqhGeijNNeQD1fQNTC
 62yjsBm/TPl6UhBDCk5Cu9xj5iiQXLd1hxqk4x8VXrvdIb1wepmc9Z9bDwLXETIhKATI
 zDPKDsR2QFdirN06vR9DYDDDetFU4PjYbzPVd8xwMMJXuGOYpqIKj0TREdNUbnyb7nc1 hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38g7cvr9yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 00:02:59 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14C42uCK103090;
 Wed, 12 May 2021 00:02:58 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38g7cvr9y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 00:02:58 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14C3xIev020770;
 Wed, 12 May 2021 04:02:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 38dj98h2c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 04:02:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14C42ra410420560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 04:02:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9935052051;
 Wed, 12 May 2021 04:02:53 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2ECD75204E;
 Wed, 12 May 2021 04:02:53 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 0/2] target/i386: Make sure that vsyscall's tb->size != 0
Date: Wed, 12 May 2021 06:02:48 +0200
Message-Id: <20210512040250.203953-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ax2UPq1f7TlGV6wkeTT2z69UDYMcIBl
X-Proofpoint-GUID: 2UUqZjCJeDUvCcDyfZgbgyOwQ3Hiat7F
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_01:2021-05-11,
 2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=677 adultscore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105120028
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Ilya Leoshkevich (2):
  target/i386: Make sure that vsyscall's tb->size != 0
  tests/tcg/x86_64: add vsyscall smoke test

 target/i386/tcg/translate.c      |  1 +
 tests/tcg/x86_64/Makefile.target |  6 +++++-
 tests/tcg/x86_64/vsyscall.c      | 11 +++++++++++
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/x86_64/vsyscall.c

-- 
2.29.2


