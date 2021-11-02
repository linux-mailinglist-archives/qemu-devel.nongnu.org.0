Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95240443710
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 21:14:13 +0100 (CET)
Received: from localhost ([::1]:40590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi0Ae-0008Hf-6E
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 16:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mi08G-0006E3-9A; Tue, 02 Nov 2021 16:11:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mi08E-0006ZZ-GN; Tue, 02 Nov 2021 16:11:44 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2IMZbv016776; 
 Tue, 2 Nov 2021 20:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=UtrazYe88XuJJVet/eDSjP2WqcAcZQF5UEndMJtf0cI=;
 b=mXRyucifatBMkSQGuHLiozuw1/RT67UczRVFfT+dzeKFxKQd3e8oxYq5Z8vvaqt6mVTI
 aLOCh51Rs4G5gY+JS8pYveNTq76ADXdX2mA4X4q6ZPLmkhs/ctWrgimcnSelm0A7L8LM
 Q6h6DYjcav/hAD1wT2CuSAxCiE+/JegR82r4q7a23J8XyNJOr78y5J2bvDDXMHqBpZxV
 TemRQ38WX/C5uDfMkt0MJs8BZD7WqY1dex9fdeLC5I3INgczSpHujDORAQ/glsyz50PU
 s0BFzJB0JKCFeLFei5giSM2toDLNal3eB4xUJW32xz1/S2EAKydnwx8g98SfK9keQA7Y 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c3aj7sxwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:37 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2K4fkb006752;
 Tue, 2 Nov 2021 20:11:37 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c3aj7sxw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:36 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2K2mVO000877;
 Tue, 2 Nov 2021 20:11:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3c0wpb5nhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:34 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A2KBVcb3015216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 20:11:31 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF116A4057;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB34EA404D;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 790B0E039C; Tue,  2 Nov 2021 21:11:30 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v2 0/2] s390x: Improvements to SIGP handling [QEMU]
Date: Tue,  2 Nov 2021 21:11:20 +0100
Message-Id: <20211102201122.3188108-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OJshIibn1CfMwSixz4eXAPKYHOA7Cgb8
X-Proofpoint-GUID: b4OCO9833eAH-mp3zQgCRKXKJTLvG_oO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020106
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is an update to the SIGP handling I brought up a few
weeks ago [1]. It doesn't share anything with v1, as one of
the patches has already been pulled to master [2] and the
other is now dropped in favor of this direction.

Here, we take advantage of a new KVM ioctl [3] to indicate
when userspace has completed processing a particular SIGP
order, based on David's suggestion [4]. This code resets
the "busy" situation for every order, regardless of whether
the Principles of Operation dictates whether the order
would mark the vcpu busy.

It's not as graceful as I'd like, but it does what I expect
it to. Maybe some more refactoring on this side would help
matters. Thoughts?

[1] https://lore.kernel.org/r/20211008203811.1980478-1-farman@linux.ibm.com/
[2] https://lore.kernel.org/r/20211015091622.1302433-1-thuth@redhat.com/
[3] https://lore.kernel.org/r/20211102194652.2685098-1-farman@linux.ibm.com/
[4] https://lore.kernel.org/r/3e3b38d1-b338-0211-04ab-91f913c1f557@redhat.com/

Eric Farman (2):
  Temporary linux-headers update
  s390x: Implement the USER_SIGP_BUSY capability

 linux-headers/linux/kvm.h    |  4 ++++
 target/s390x/cpu-sysemu.c    |  7 +++++++
 target/s390x/cpu.h           |  4 ++++
 target/s390x/kvm/kvm.c       |  9 ++++++++
 target/s390x/kvm/kvm_s390x.h |  1 +
 target/s390x/sigp.c          | 40 ++++++++++++++++++++++++++++++++++++
 6 files changed, 65 insertions(+)

-- 
2.25.1


