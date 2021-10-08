Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB57442726D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 22:40:05 +0200 (CEST)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYwey-0003ex-E3
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 16:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mYwdN-0002CC-J5; Fri, 08 Oct 2021 16:38:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44970
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mYwdK-0002Sn-NC; Fri, 08 Oct 2021 16:38:25 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198KRMTK018095; 
 Fri, 8 Oct 2021 16:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=hSu220TV5KgJgxMwmMHlPUucEldFuNXnKvI6AcpwHSU=;
 b=seGaO2KCUUbBcsdwbsGjZOrrPHFH9vbhyT3bo4O0JoHUP0fG1pGueE3/Q/pQy5EhY8Tt
 4/8UJ/QQQHilhxLndCQheXmLClK0uauZFqJFJvehvi3MnjcGTyQ5nzo+ZjWcQi2bgAKw
 nLWnWxwJgLlHLtFXvlcfEDIMo2SLn0ve7ruF8tH3F/aXH2o2l5VpCIxYrRu6Y4ZbVofL
 oABzeOkJNsA5YAi3DOS0Js5VeWhlXy1QyyWq7cQoIvyWf6yosTv1xl2v4FhWxGL+1Ppg
 jxyYtuou4UrPMnzZiMEVSbrhYboMsD/amlpL6/EeNaxkXkMb2SBTBLfu/qsmcHUdg5yU uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bjsk94xd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 16:38:19 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 198KWaAV010966;
 Fri, 8 Oct 2021 16:38:18 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bjsk94xcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 16:38:18 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 198KM9Nn027602;
 Fri, 8 Oct 2021 20:38:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3bef2ahck2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 20:38:16 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 198KcCGt41419242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Oct 2021 20:38:13 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1EB8A405B;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC194A4054;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 44BE0E0291; Fri,  8 Oct 2021 22:38:12 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v1 0/2] Improvements to SIGP handling [QEMU]
Date: Fri,  8 Oct 2021 22:38:09 +0200
Message-Id: <20211008203811.1980478-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oE1TVzLQmYBb8b-SS6LGJm-IBLiGrgG1
X-Proofpoint-GUID: eawKXe6Qvt70bUzqJZRUXshRheE3fAXW
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_06,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=860
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110080112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm cleaning up some of the SIGP code in KVM and QEMU,
and would like to propose the following changes.

Patch 1 should be less concerning than its KVM counterpart,
since the CZAM bit in question is already present in QEMU.

Patch 2 provides some handshaking with KVM. Since QEMU
injects a Stop IRQ for a couple of the SIGP orders, we
can provide the flags associated with it, to provide some
direction for how KVM should process it.

While this has no dependency on the KVM code, the KVM series
that I'm working on in parallel is here:

https://lore.kernel.org/r/20211008203112.1979843-1-farman@linux.ibm.com/

Eric Farman (2):
  s390x: sigp: Force Set Architecture to return Invalid Parameter
  s390x/kvm: Pass SIGP Stop flags

 target/s390x/kvm/kvm.c |  4 ++++
 target/s390x/sigp.c    | 18 +-----------------
 2 files changed, 5 insertions(+), 17 deletions(-)

-- 
2.25.1


