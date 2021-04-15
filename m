Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9F360A15
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:07:10 +0200 (CEST)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1i9-0000dd-Os
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lX1eU-0005rS-7F; Thu, 15 Apr 2021 09:03:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lX1eS-0001F7-6L; Thu, 15 Apr 2021 09:03:21 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FCYMlW141693; Thu, 15 Apr 2021 09:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=CDvmKElKFnRZlMFnXllQ/NTQU2VhWGAhn961BswmKy4=;
 b=SFXK8rA0kVpcUVJmATjzvGAa4zFXdHui9RnaWucqoHf56cFZdyHqFVjuXA/IM4GuWPml
 YTujGdb/tGHTIbcFV/IPNLyCebfQTJopavGI27fhxGDJAASlXf8x44bxWZ7UvopkeyZs
 xt9SNojRZaP/4XEHnT2Rqny22EGO2UFJwtXSqYE2ZXNwaf5XA1PorTm1ogAignns5YnZ
 I5c/F9ej2vQONrCl/wjZSKBdVUFK63xmajx6EabjQiRNb9d2hlGr3GsyFQE85Yi3/7l0
 8pujxAbgtFq4P7rDViAU6AB5VmcUc9L0G8yXmSZRUppr0uMCgGZyGOqX6bax8dUiXmVd iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x0ffjbjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 09:03:17 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FCYPEQ142120;
 Thu, 15 Apr 2021 09:03:16 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x0ffjbe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 09:03:16 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FCrxWq015112;
 Thu, 15 Apr 2021 13:03:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hkwdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:03:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FD36Xv43254134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 13:03:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCDDEA405F;
 Thu, 15 Apr 2021 13:03:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BFAAA4054;
 Thu, 15 Apr 2021 13:03:06 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 13:03:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Date: Thu, 15 Apr 2021 15:03:01 +0200
Message-Id: <20210415130305.28640-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dRzI0vt4BvaFCusWB0SlFDprolQ5i9Dl
X-Proofpoint-ORIG-GUID: eYhLOiTsQaByPg9I6FOHM2WsXFO0_nl0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104150084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If arch-specific code generates a translation block of size 0,
tb_gen_code() may generate a spurious exception.

Fix s390x (patch 1), ARM (patch 2) and xtensa (patch 3) and add an
assertion in order to catch such situations earlier (patch 4).

v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02037.html
v1 -> v2: Fix target/s390x instead of trying to tolerate tb->size == 0
          in tb_gen_code().

v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02101.html
v2 -> v3: Split the common code change into a separate patch, add the
          ARM patch in order to fix
          https://gitlab.com/cohuck/qemu/-/jobs/1178409450

v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg02332.html
v3 -> v4: Add the xtensa patch in order to fix
          https://gitlab.com/cohuck/qemu/-/jobs/1178409540

Ilya Leoshkevich (4):
  target/s390x: Fix translation exception on illegal instruction
  target/arm: Make sure that commpage's tb->size != 0
  target/xtensa: Make sure that tb->size != 0
  accel/tcg: Assert that tb->size != 0 after translation

 accel/tcg/translate-all.c |  1 +
 target/arm/translate.c    |  1 +
 target/s390x/translate.c  | 16 +++++++++++-----
 target/xtensa/translate.c |  3 +++
 4 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.29.2


