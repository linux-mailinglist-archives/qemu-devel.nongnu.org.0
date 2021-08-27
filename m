Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174B3F9846
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 12:52:43 +0200 (CEST)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJZTV-0003R4-A8
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 06:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mJZRy-0001yk-12; Fri, 27 Aug 2021 06:51:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5118
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mJZRt-00062M-0l; Fri, 27 Aug 2021 06:51:05 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17RAYOhM020243; Fri, 27 Aug 2021 06:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=paw2ZvP54Nyg1HvWtofMtUjyz2hooMz2gTQIsa10VVA=;
 b=KH13OAipVp2ZzFGfKlncYxunnZfyyhuw7ndYEPfQ6h5zmLMlv8icJwzKnOIDhI0Jcvrm
 lTXC/b9/DqGKeGkFoXrwkovzfsbmFGI3CeFKLgeCLMMOTxGBLE+ORJFM1h97j9vyiWJY
 gWU68LCtwft6LGZFePSFYd/SKlqrz0Hc5asWUijmucXMitapwt0uHo4iSKmKbo65T5N1
 XZBgHdb7UKUQcrfMLZk668Y961GJ4AD2pGHG8qbW87qbq55CRKxMZEcj0a/7l4Lxt6JJ
 tfnX02i/iI8q47vRoyjoLl/Z88GE339f8QeKxp5PThopZ549M8jIAoxJrugRvR+RG9iM NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3apwhtswn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 06:50:58 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17RAYcut021452;
 Fri, 27 Aug 2021 06:50:57 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3apwhtswmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 06:50:57 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17RAlpeH000746;
 Fri, 27 Aug 2021 10:50:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3ajs48kbmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Aug 2021 10:50:55 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17RAoq1f56951164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Aug 2021 10:50:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37F9111C052;
 Fri, 27 Aug 2021 10:50:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE44F11C08A;
 Fri, 27 Aug 2021 10:50:51 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.164.230])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 27 Aug 2021 10:50:51 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: kvm@vger.kernel.org
Subject: [PATCH 0/2] s390x: ccw: A simple test device for virtio CCW
Date: Fri, 27 Aug 2021 12:50:48 +0200
Message-Id: <1630061450-18744-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LLbsC-2Yo4K4ePH_Ofj_SY_9JkTA3oSF
X-Proofpoint-GUID: 4eqRFCTTYLdXaDyq297R63rlzmLMMwsN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-27_03:2021-08-26,
 2021-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=896 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108270066
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, drjones@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, mst@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello All,


This series presents a VIRTIO test device which receives data on its
input channel and sends back a simple checksum for the data it received
on its output channel.
 
The goal is to allow a simple VIRTIO device driver to check the VIRTIO
initialization and various data transfer.

For this I introduced a new device ID for the device and having no
Linux driver but a kvm-unit-test driver, I have the following
questions:

Is there another way to advertise new VIRTIO IDs but Linux?
If this QEMU test meet interest, should I write a Linux test program?

Regards,
Pierre


Pierre Morel (2):
  virtio: Linux: Update of virtio_ids
  s390x: ccw: A simple test device for virtio CCW

 hw/s390x/meson.build                        |   1 +
 hw/s390x/virtio-ccw-pong.c                  |  66 ++++++++
 hw/s390x/virtio-ccw.h                       |  13 ++
 hw/virtio/Kconfig                           |   5 +
 hw/virtio/meson.build                       |   1 +
 hw/virtio/virtio-pong.c                     | 161 ++++++++++++++++++++
 include/hw/virtio/virtio-pong.h             |  34 +++++
 include/standard-headers/linux/virtio_ids.h |   1 +
 8 files changed, 282 insertions(+)
 create mode 100644 hw/s390x/virtio-ccw-pong.c
 create mode 100644 hw/virtio/virtio-pong.c
 create mode 100644 include/hw/virtio/virtio-pong.h

-- 
2.25.1


