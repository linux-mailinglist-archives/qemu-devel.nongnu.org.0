Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66F73E0A86
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 00:47:53 +0200 (CEST)
Received: from localhost ([::1]:52140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBPg0-0000mR-Bc
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 18:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBPf0-0007up-CF
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 18:46:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1mBPey-0003jy-9V
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 18:46:50 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174MWrSC132597; Wed, 4 Aug 2021 18:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=DyMENpRwDg0aNXpBNhjRz8AFvYKCRDxOVC35qrp9VrQ=;
 b=Hs72ki9a88e+z+a1kn/Br7bMyEBo408qAAVIJGfZJ6Kvh6+NmwSP0MA2QiGvRhSlH6nK
 SXiSjCaN+VR6DNlP+W31i4AiSrUD/MpCMLOkT3gvDOlMT4iRU3wdfOpos03VROKsEvb0
 Et/mIC8M7jMZRRpDhFvpQc0Ogs2IKtv94RIKAl6/wG+otCNQzjIBDtE2ARlx86Ac8fP+
 kS5AqBm0M2NsySwRlyi98oYK0r1sUdg4jr1v0YX0IOfsW8CRNZOgBOSnIDMUq1BiIZyl
 dfH7mq1hbzSe4xTyM8pgmNbIuGjmqLC1kVVDBuu0JBj715Cb14BR48kY6sQS4JZikpPM Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a827wjj26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 18:46:43 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 174MX2WD133096;
 Wed, 4 Aug 2021 18:46:43 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a827wjj1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 18:46:43 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 174MibRt010503;
 Wed, 4 Aug 2021 22:46:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3a4x5993a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Aug 2021 22:46:40 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 174MkbWK53543412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Aug 2021 22:46:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51FC811C08D;
 Wed,  4 Aug 2021 22:46:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2AF611C05B;
 Wed,  4 Aug 2021 22:46:36 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Aug 2021 22:46:36 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH RFC 0/1] accel/tcg: Clear PAGE_WRITE before translation
Date: Thu,  5 Aug 2021 00:46:32 +0200
Message-Id: <20210804224633.154083-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l_AG-5NdoFimHct0WzN7auj8gonbWDrC
X-Proofpoint-GUID: EhIzVImgQlWqGyB3xOooqIjPUDq5ci8P
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_08:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108040138
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

As discussed on IRC, here is the tentative fix for concurrent code
patching. It helps with the x86_64 .NET app on s390x and survives
check-tcg.

Bug report: https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00644.html

IRC log:
========
<stsquad> iii: my initial thoughts are there is a race in tb_page_add because while we will have flushed all the old pages this new corrupted page gets added the new corrupted one gets in
<iii> stsquad: I think you are right that it can be considered a tb_page_add race. Would it be reasonable to solve it by marking the page read-only before translation and then making sure that it doesn't get its PAGE_WRITE back until translation is complete?
<rth> iii, stsquad: https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07995.html
<rth> iii: yes, making the page read-only early is the fix, i think.  i believe we already hold the mmap_lock around translation, so that should make a writer fault and then wait on the mmap_lock.
<iii> rth: Thanks, let me give it a try. I'll post whatever I come up with as an RFC patch to qemu-devel.
<rth> thanks
<stsquad> rth: doesn't that serialise all translation again?
<stsquad> rth: we could page lock instead?
<rth> stsquad: i thought we were talking about user-only, where translation is always serial.
<rth> stsquad: the link from january is a system-mode bug of the same kind, where, yes, we need to hold the page lock or something.
<stsquad> rth: ahh yes because we don't have zoned translation caches...

Ilya Leoshkevich (1):
  accel/tcg: Clear PAGE_WRITE before translation

 accel/tcg/translate-all.c    | 59 +++++++++++++++++++++---------------
 accel/tcg/translator.c       | 26 ++++++++++++++--
 include/exec/translate-all.h |  1 +
 3 files changed, 59 insertions(+), 27 deletions(-)

-- 
2.31.1


