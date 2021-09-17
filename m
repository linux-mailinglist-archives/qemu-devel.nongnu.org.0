Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A240F73D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:08:53 +0200 (CEST)
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRCfk-0002wQ-Fu
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mRCe3-0001VG-Ip; Fri, 17 Sep 2021 08:07:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mRCe2-0005gN-00; Fri, 17 Sep 2021 08:07:07 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HBxt62021811; 
 Fri, 17 Sep 2021 08:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=ldO6b4+cCsAHSX32zSTL7BqZpWJk0PhVZ6GjGooCgDI=;
 b=Ild3vJeetEhRdwfU76ymUXgYGkEPXC88QmEqBMF+HHeVP2SGXtbpsFdIgW2mBR36lnRe
 t6YKwIZtg2GmLkrRmiNmnPalgUm/jd6TsnHecNYaKReTa/5Pw1LW89HnQwlWm9wqoJrz
 lxbtZHIlEPKrb6C4YpY8ZqUpIeIe2wKPkRf5+81GDFH+kc5/qhEdYtz4P9oG7AwhbNg0
 +HGpxs42ccQWOKYR7CZLG0B9kH9D54UZ/nH+/ehMI1z/n3ImBs69i4Xx5+gFHtaeHReF
 BlJMQE05qN6jyoBcUmJEAkUtCxyhn5x7hEDAJ2K6UYVp+ECl8i3jC5dlNwiq693QSvWE cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4tms85cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 08:07:01 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18HBxwBh021851;
 Fri, 17 Sep 2021 08:07:01 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b4tms85bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 08:07:01 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18HC4s92021178;
 Fri, 17 Sep 2021 12:06:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3b0m3a41ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 12:06:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18HC6tJW53543200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Sep 2021 12:06:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF26A11C089;
 Fri, 17 Sep 2021 12:06:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6709E11C04A;
 Fri, 17 Sep 2021 12:06:54 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.70.78])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Sep 2021 12:06:54 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH 0/1] s390x:clp: implementing CLP immediate commands
Date: Fri, 17 Sep 2021 14:06:52 +0200
Message-Id: <1631880413-20655-1-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nhBKeHgtNl-PqoD6rgsMapcaSLtLPH7y
X-Proofpoint-ORIG-GUID: fmStqRhozy8Zlcp6PwOagVKGVHIEWAi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_05,2021-09-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=737
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109170077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: thuth@redhat.com, mjrosato@linux.ibm.com, david@redhat.com,
 farman@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CLP immediate commands allow to query the Logical Processor
available on the machine and to check for a specific one.

I do not see any reason to not implement it.

The check for an immediate command is done on bit 0 of the RRF i3
field so let's implement a new clp_immediate_cmd() to handle CLP
immediate commands.

AFAIK only the basi processor, with Logical Processor Selector 0,
LPS==0, and the PCI processor, LPS==2, are currently available on
QEMU.


Pierre Morel (1):
  s390x:clp: implementing CLP immediate commands

 hw/s390x/s390-pci-inst.c         | 33 ++++++++++++++++++++++++++++++++
 include/hw/s390x/s390-pci-inst.h |  5 +++++
 target/s390x/kvm/kvm.c           |  6 ++++++
 3 files changed, 44 insertions(+)

-- 
2.25.1


