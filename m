Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC744E7B02
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 23:20:22 +0100 (CET)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXsI9-0005p3-QC
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 18:20:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXs9h-0005ER-52; Fri, 25 Mar 2022 18:11:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nXs9f-0003PW-Dm; Fri, 25 Mar 2022 18:11:36 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PJwXxQ029330; 
 Fri, 25 Mar 2022 22:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=EZXvvIWTDWgqzoBP5nsNw8NomuKEaDBcAvM1Omm0PMw=;
 b=IIfh9Bh8t+gzzir8qN4HCEpr6SBZhzktVD3/aIdEqz01T/EZ0J44TclqxWkTEf8UC4cX
 oYcQlcoFFWaBYRN/UZL77xYvWA36R7aQj2JJft+wJkjEA+Vnj+XDw2AMJCUq72yXi36V
 HFX+ftI/z+x06yVo0byoQLMrfGHVjkldN//eMKC+bYXMuc29pmwxmqT0dmJpL655CwUd
 n6zZ/4x9kmsmXwZ5yxK7Jj6DdDc8AdQEj3iy+hjN5kUNJtm1WVEk0BwnXmL5IHcMNcis
 MlAm4DKOOd9WO0pjRvUEYWA5Ih2Boi4vEQu5q86V0Adlgd4A2vySf8zhlCJ/5Dm87Lck 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f1f17123u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:21 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22PMBK0Z009201;
 Fri, 25 Mar 2022 22:11:20 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f1f17123m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:20 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22PM7Zaa019915;
 Fri, 25 Mar 2022 22:11:19 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3ew6t9pfeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 22:11:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22PMBIxX26411348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 22:11:18 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21A03AC05E;
 Fri, 25 Mar 2022 22:11:18 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4CD1AC05B;
 Fri, 25 Mar 2022 22:11:15 +0000 (GMT)
Received: from li-4707e44c-227d-11b2-a85c-f336a85283d9.ibm.com.com (unknown
 [9.77.145.9]) by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 25 Mar 2022 22:11:15 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] spapr: Make the nested code TCG only
Date: Fri, 25 Mar 2022 19:11:11 -0300
Message-Id: <20220325221113.255834-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QssE4BiENpXQIQyZBwi3iouKAU-wTmQx
X-Proofpoint-GUID: 5HsSns_6S23uPa-snuZUpEl8TNRy0ikY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_07,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=646 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250122
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spapr virtual hypervisor implementation of the nested KVM API
depends on the first level guest to be emulated by TCG. So move the
whole code under CONFIG_TCG.

v2:

- Created hypercall_register_nested instead of reusing
  hypercall_register_softmmu;

- Rearranged the ifdef a bit to keep the hypercall_register_*
  functions closer;

- Dropped the more paranoid patch that checked for KVM at every
  call. I couldn't convince myself anymore that it was necessary.

v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-03/msg00412.html

Fabiano Rosas (2):
  spapr: Move hypercall_register_softmmu
  spapr: Move nested KVM hypercalls under a TCG only config.

 hw/ppc/spapr_hcall.c | 74 ++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 30 deletions(-)

-- 
2.35.1


