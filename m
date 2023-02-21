Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F169E634
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:47:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWiP-0001TS-Oc; Tue, 21 Feb 2023 12:46:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pUWiG-0001Ro-1U; Tue, 21 Feb 2023 12:46:00 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pUWiE-0004Vt-4m; Tue, 21 Feb 2023 12:45:59 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31LHUbm9027612; Tue, 21 Feb 2023 17:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=t2ZamT49PElLMoTb3z/UtJlNNaDr7OnJHDIOaejOR0E=;
 b=rtSrdh6nZLcgYSJxeNDO7fc3s+tsTIJLU4vojpArNQW97MFMz+714Y0Lc1tvRXiSnlPN
 aUq5st0Egc3c0Dacf8vrjDB7ZwrA0H/9D8TG55o/FqPvul7Q0D7USJd1jMIzNqxltlge
 QAESxa4Lm0Hez1Ylo6QaHpJHZEZcQoTDa5iJRmiMeBJticGGwPEi2Iq+plBhu9c/ybMa
 HCZUL/kV2q4kHKIlNDbAuERcMcMRc1rQJbv5KyNzg5Y28JRZnT3LD6o5faLR2NrN6QYG
 ov1pFIgyBsm2F0bhy5LnHBP2o/x2Fh4DAX4xusQPLHCsKPvU59OCofBKQ9mJWppfbmmH jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nw2dwrarb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 17:45:54 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31LHhcG1035337;
 Tue, 21 Feb 2023 17:45:53 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nw2dwrar5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 17:45:53 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LFmtI1011387;
 Tue, 21 Feb 2023 17:45:52 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3ntpa7gvr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Feb 2023 17:45:52 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31LHjpsl45089200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 17:45:51 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29C3D5805D;
 Tue, 21 Feb 2023 17:45:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF5F958057;
 Tue, 21 Feb 2023 17:45:50 +0000 (GMT)
Received: from t15.endicott.ibm.com (unknown [9.60.89.108])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 21 Feb 2023 17:45:50 +0000 (GMT)
From: jrossi@linux.ibm.com
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Cc: thuth@redhat.com, frankja@linux.ibm.com, jjherne@linux.ibm.com,
 jrossi@linux.ibm.com
Subject: [RESEND PATCH 0/1] pc-bios: Support List-Directed IPL from ECKD DASD
Date: Tue, 21 Feb 2023 12:45:47 -0500
Message-Id: <20230221174548.1866861-1-jrossi@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dNQipvmQEltekCAhZVcBYSZvzdOViY9o
X-Proofpoint-GUID: X2klCYi1tJwG5fQZXoue4t2UUFQ-GxpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_10,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jrossi@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Jared Rossi <jrossi@linux.ibm.com>

Add support for List-Directed IPL (LD-IPL) type pointers.

We check for a boot record indicating LD-IPL and use it if it is valid,
otherwise we use the CCW CDL or LDL format as usual. When a block is accessed
during IPL the block number is first calculated based on the cylinder, head,
and record numbers included in the block pointer; if LD-IPL has been initiated
then each pointer will be interpreted using the new format.

For simplicity, there is no choice presented to forcibly use CCW-IPL if LD-IPL
is available.  Because both sets of pointers ultimately go to the same
kernel/initrd, using CCW- or LD-IPL is transparent to the user.

One aspect of the user experience that does change is the availability of the
interactive boot menu when a loadparm is not specified.  For the existing
CCW-IPL, when the user does not specify a loadparm they are presented with a
list of boot options; however, this list is only written in the old style
pointers.  Therefore, if no loadparm is specified, and LD-IPL is supported, the
default boot option will be used automatically.

Jared Rossi (1):
  pc-bios: Add support for List-Directed IPL from ECKD DASD

 pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
 pc-bios/s390-ccw/bootmap.h |  30 ++++++-
 2 files changed, 148 insertions(+), 39 deletions(-)

-- 
2.31.1


