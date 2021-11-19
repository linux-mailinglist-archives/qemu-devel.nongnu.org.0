Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540045784F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 22:46:26 +0100 (CET)
Received: from localhost ([::1]:38330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moBiC-0006dE-Oj
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 16:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1moBfX-0005FC-Rq; Fri, 19 Nov 2021 16:43:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1moBfV-00071t-OM; Fri, 19 Nov 2021 16:43:39 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJLgdJL015545; 
 Fri, 19 Nov 2021 21:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=14eQzsj88sASAHBvWMAkg2VEBmlpVQ2WRKj6xog3zfU=;
 b=pJfbw4f091nK/6kG3cnfaP0/7Cgffh1OHPpGvqIUippU1zmBQSUNfedHPI7GKWdZjG70
 7Dg/rxwj8XvQ015y+umwsIYADcTPAGIKMzRiMNOf8PjtKSIWoaMQ1wvHyXh+/q15BpDK
 IYQP7pbIaV2JI6aXf4ZC98LwQKhCGAsEKw3u/S57bWsVFurz6/Odvo0RySN4zoBr0Tvf
 +NEQbM9s7K7Qs37fFnoVVbY+lDRTESNUUuF+e/z03tF49Ufsc7P+kSNCsO+jUD6o6//l
 340yqmAtFm19VlenTSdDo/xeeweLbWjKdBHIsthiuawYV9oiDVrb+/G12BkjY4Wj6OjI BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cem30g0gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:43:34 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJLhY14021728;
 Fri, 19 Nov 2021 21:43:34 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cem30g0ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:43:34 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJLHoWf019661;
 Fri, 19 Nov 2021 21:43:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 3ca4mm247b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:43:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJLhS2664815546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 21:43:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D5FE5204F;
 Fri, 19 Nov 2021 21:43:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 7A6B55204E;
 Fri, 19 Nov 2021 21:43:28 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 32476E0A39; Fri, 19 Nov 2021 22:43:28 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v4 0/2] s390x: Improvements to SIGP handling [QEMU]
Date: Fri, 19 Nov 2021 22:43:25 +0100
Message-Id: <20211119214327.2367026-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XtW3NwV_OXYEswbi27x8axyyNwUhxDiI
X-Proofpoint-ORIG-GUID: 4UyzWB1VcmSyf5ke6xVpqbniWVRjxTzp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_15,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=967
 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190114
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is an update to the SIGP handling series, to correspond to
version 4 of the KVM series [1].

This should be very similar to v3, but there is only one IOCTL
and it accepts a payload describing the operation.

Unfortunately, I lost track of David's suggested improvement [2]
and have not incorporated nor tested any of it. Next time!

[1] https://lore.kernel.org/all/20211119213707.2363945-1-farman@linux.ibm.com/
[2] https://lore.kernel.org/r/13499d9f-652b-ea75-4ad7-32a347297a55@redhat.com/

Previous RFCs:
v1: https://lore.kernel.org/r/20211008203811.1980478-1-farman@linux.ibm.com/
v2: https://lore.kernel.org/r/20211102201122.3188108-1-farman@linux.ibm.com/
v3: https://lore.kernel.org/r/20211110204528.1378524-1-farman@linux.ibm.com/

Eric Farman (2):
  Temporary linux-headers update
  s390x: Implement the USER_BUSY capability

 linux-headers/linux/kvm.h    | 16 +++++++++++++++
 target/s390x/cpu-sysemu.c    | 15 ++++++++++++++
 target/s390x/cpu.c           |  1 +
 target/s390x/cpu.h           |  8 ++++++++
 target/s390x/kvm/kvm.c       | 38 ++++++++++++++++++++++++++++++++++++
 target/s390x/kvm/kvm_s390x.h |  2 ++
 target/s390x/sigp.c          | 19 +++++++++++++++++-
 7 files changed, 98 insertions(+), 1 deletion(-)

-- 
2.25.1


