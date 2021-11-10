Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A4944CAC4
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 21:48:29 +0100 (CET)
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkuWC-00027R-S5
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 15:48:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mkuTe-0006nb-IK; Wed, 10 Nov 2021 15:45:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mkuTX-0007VG-Dy; Wed, 10 Nov 2021 15:45:50 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAKfjGH029934; 
 Wed, 10 Nov 2021 20:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=uEuo4vfm+IWBAGjiC/SVCYqJabHO0VAeWVnYLI2rfLQ=;
 b=nO3s9jTcq0rkbbaYzGjRurdZvKRYVMvF8zZ3jPHOtCYnFydRmO/CxabxX/Dpuiwhi/2G
 Hca8AfrhZ3I+Q4uacsxkynH6J7Lm0p97CqiMOiflVV16JFv2wucAAp+mjk+KW4WS3iiR
 GD9PRz4PcB7BxsteeyY/tY9Um17WZe4DnC6AuEfxdcfYpn7VyoODVVkD7g4Tqsca2mzA
 AvIomtrTOuwoPnt81NfCa3nif57ZBkp2lex2ARo/VEAHL7FCb2HbTTCvdVdx0URGCqsZ
 Dh24yuFYHGsIWWPznFTU6U0sPuPMA+YZt0zyshb8x93kJPg1gjibSK/CcgwKg4CZEow3 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8nbfr1xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 20:45:39 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AAKh8w8032336;
 Wed, 10 Nov 2021 20:45:39 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8nbfr1wr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 20:45:38 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AAKbDDj009484;
 Wed, 10 Nov 2021 20:45:36 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3c5hbamav0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 20:45:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AAKjWiE5898764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 20:45:33 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 868495204F;
 Wed, 10 Nov 2021 20:45:32 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 73CB252074;
 Wed, 10 Nov 2021 20:45:32 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 289DEE02A5; Wed, 10 Nov 2021 21:45:32 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v3 0/2] s390x: Improvements to SIGP handling [QEMU]
Date: Wed, 10 Nov 2021 21:45:26 +0100
Message-Id: <20211110204528.1378524-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZiibluuczK-kZ729PliQiAS0isOWFl5q
X-Proofpoint-ORIG-GUID: uXSD_LKtC_E0iFXzoX4FRHSN0w1Devz2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_13,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 mlxlogscore=943 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is an update to the SIGP handling series, to correspond to
version 3 of the KVM series [1].

The main changes here from v2 are the simplified use of
s390_cpu_reset_sigp_busy() throughout the SIGP handlers,
a new invocation of it from s390_cpu_reset(), and the
implementation of the "set sigp busy" IOCTL.

[1] https://lore.kernel.org/r/20211110203322.1374925-1-farman@linux.ibm.com/

Previous RFCs:
v1: https://lore.kernel.org/r/20211008203811.1980478-1-farman@linux.ibm.com/
v2: https://lore.kernel.org/r/20211102201122.3188108-1-farman@linux.ibm.com/

Eric Farman (2):
  Temporary linux-headers update
  s390x: Implement the USER_SIGP_BUSY capability

 linux-headers/linux/kvm.h    |  5 +++++
 target/s390x/cpu-sysemu.c    | 15 +++++++++++++++
 target/s390x/cpu.c           |  1 +
 target/s390x/cpu.h           |  8 ++++++++
 target/s390x/kvm/kvm.c       | 16 ++++++++++++++++
 target/s390x/kvm/kvm_s390x.h |  2 ++
 target/s390x/sigp.c          | 19 ++++++++++++++++++-
 7 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.25.1


