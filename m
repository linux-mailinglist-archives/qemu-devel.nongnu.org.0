Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF35363720A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 06:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy5AK-0007jC-Iz; Thu, 24 Nov 2022 00:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1oy5AH-0007he-8N; Thu, 24 Nov 2022 00:52:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicholas@linux.ibm.com>)
 id 1oy5AF-0006Cj-Mf; Thu, 24 Nov 2022 00:52:48 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO4Onq4017673; Thu, 24 Nov 2022 05:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lcSXC6QSqCvIJ7DEMOnh63g0R6AO5aBBJtaKXNKjDDI=;
 b=aj5iz5F+BTuKIWj7UGo2UHGGF1s2rySrC18Si0DexcmjLX1F6vKm0BMMFjUyf4pvqJ7/
 LCZv9fEQL5NgKVRX4yO0HJQy9eQbuJRU+XQ1JgCA9JQu8FkavItQ4ctWReIEhEwgOxet
 PUmMYi2uAI6al6RXCWkKQqjiGnMOU6rR2UJSDLFwfEujG+yGH0ZN+gXZVWTZYbVPNINV
 Mslq8tD9/kSfmVBIGnklFOsAFANvtyd+FYqGGTOm2CCCNbNABGVy+NG5tYBelWfLUi/l
 5lKSGJFDxna6kYLwsoHmiZudErOra0gbHznPbjoB6choCo4zQU56zs5idQwlqrznP65b Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w6g57a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:52:32 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AO5ddG2014493;
 Thu, 24 Nov 2022 05:52:32 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w6g56s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:52:32 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AO5pTkK005520;
 Thu, 24 Nov 2022 05:52:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3kxps95hq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 05:52:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2AO5r9Rw1966594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Nov 2022 05:53:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E050B4C046;
 Thu, 24 Nov 2022 05:52:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A0C24C040;
 Thu, 24 Nov 2022 05:52:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Nov 2022 05:52:27 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1BC1B6005B;
 Thu, 24 Nov 2022 16:52:20 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org,
 victor.colombo@eldorado.org.br,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>
Subject: [PATCH 0/2] target/ppc: Implement Dynamic Execution Control Registers
Date: Thu, 24 Nov 2022 05:51:41 +0000
Message-Id: <20221124055143.752601-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HRaVIklYWn6SIqZyHDT1BwIdG6SJspme
X-Proofpoint-ORIG-GUID: vc-TFYgk85wLn9Mm1g91k2P5PDrT_0zb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_03,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=311 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240041
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=nicholas@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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

Implements the Dynamic Execution Control Register (DEXCR) and the
Hypervisor Dynamic Execution Control Register (HDEXCR) in TCG as 
defined in Power ISA 3.1B. Only aspects 5 (Non-privileged hash instruction 
enable) and 6 (Privileged hash instruction enable) have architectural 
effects. Other aspects can be manipulated but have no effect on execution.

Adds checks to these registers in the hashst and hashchk instructions so
that they are executed as nops when not enabled.

Nicholas Miehlbradt (2):
  target/ppc: Implement the DEXCR and HDEXCR
  target/ppc: Check DEXCR on hash{st, chk} instructions

 target/ppc/cpu.h         | 19 +++++++++++++
 target/ppc/cpu_init.c    | 25 +++++++++++++++++
 target/ppc/excp_helper.c | 58 +++++++++++++++++++++++++++++-----------
 target/ppc/spr_common.h  |  1 +
 target/ppc/translate.c   |  9 +++++++
 5 files changed, 97 insertions(+), 15 deletions(-)

-- 
2.34.1


