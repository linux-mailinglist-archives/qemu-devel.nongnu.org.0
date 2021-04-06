Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC39354E22
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:47:21 +0200 (CEST)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTgQi-00027O-Hc
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lTgNv-0000u8-26; Tue, 06 Apr 2021 03:44:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lTgNs-0001w9-Mq; Tue, 06 Apr 2021 03:44:26 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1367WwRH147137; Tue, 6 Apr 2021 03:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=lu25V2SGdtz38GOZ0LlVT2V7dYxrzmlNDns0o3wacic=;
 b=nJiLF7viAXyCxdV/dcSyOol3AW1dJ0/aq9piVviVrc6PWmfL2iYxg1qG9v1oyPv/mnP2
 PcNN2iXv1RIEs+Ycusq78HFP7+j7KeF/uuKrR3s4WJL4RM4F2vJf5hYCPonHmVzk0USl
 FXNCpke7oEPo5rjXYPLPboIemco8dUU6l2lUHyuWo1ixJDOHpQh93wJbQUE2p8JsDXqg
 aRg83p74QYn9Q5tvXTlTvpSKvc0WpBWddZoEAcKk+9k1woDO39HwVqVGig4wgu13XIMc
 nV2TZ0jvQEOZC++jZ/7Ys06xX08vbtLteGZ+S2JhD2XF2WTvCB/ZKws22qyfmV1lD5wp 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5eassud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 03:44:20 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1367X1mX147322;
 Tue, 6 Apr 2021 03:44:20 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37q5eassth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 03:44:20 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1367h0sL001446;
 Tue, 6 Apr 2021 07:44:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 37q2q5hx1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Apr 2021 07:44:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1367iFnj35914120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Apr 2021 07:44:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D60B11C05B;
 Tue,  6 Apr 2021 07:44:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F48A11C050;
 Tue,  6 Apr 2021 07:44:14 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.42.152])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Apr 2021 07:44:14 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] s390x: css: report errors from ccw_dstream_read/write
Date: Tue,  6 Apr 2021 09:44:12 +0200
Message-Id: <1617695053-7328-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5VF-xTvRPWj7oOm8sxA2nx5r15GgPcQj
X-Proofpoint-ORIG-GUID: xVZ_XC5CUFFBEC-d22PHT-Eu5EoXuuL7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-06_01:2021-04-01,
 2021-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104030000 definitions=main-2104060050
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, imbrenda@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By checking the results of errors on SSCH in the kvm-unit-tests
We noticed that no error was reported when a SSCH is started
to access addresses not existing in the guest.
For exemple accessing 3G on a guest with 1G memory.

If we look at QEMU ccw_dstream_write/write functions we see that they
are often not checked for error in various places.
  
It follows that accessing an invalid address does not trigger a
subchannel status program check to the guest as it should.

Regards,
Pierre
 

Pierre Morel (1):
  s390x: css: report errors from ccw_dstream_read/write

 hw/char/terminal3270.c | 11 +++++--
 hw/s390x/3270-ccw.c    |  3 ++
 hw/s390x/css.c         | 16 +++++-----
 hw/s390x/virtio-ccw.c  | 66 ++++++++++++++++++++++++++++++------------
 4 files changed, 69 insertions(+), 27 deletions(-)

-- 
2.17.1


