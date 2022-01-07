Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF9487EF0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:31:54 +0100 (CET)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xm5-0007Dw-RU
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:31:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgw-0002bs-CO; Fri, 07 Jan 2022 17:26:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48252
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgg-0006cp-Ie; Fri, 07 Jan 2022 17:26:34 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207JbS6H007243; 
 Fri, 7 Jan 2022 22:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=XrnPkaaGzyZSB2P2sPLvKcsv1ED2moxDL31la5bZEVY=;
 b=QU8xfuWikG97nlD4cklQ0PoSrzxp8fVCgdCAdjQQLshaBOIlDoyrC/2dD1I/S0HrlQFy
 EnN88asZVX1nRqi9tgL3HBJvhJoUNAGFyDVjfMSPoo3tfFEVaMDds2ot2a6OoewzQOXi
 /UwqYqYQA3NQGpA18gy0RAPLYbK8pPRMi8FadYhghdMA3QkxjaFpRC80Akyeqh6d5Kvi
 Z2a/Q1sm5yy9ydXo/Yo+ahvFRV6kkoqlfT8U1E5Y6tpLTnlWKPvD5NH5sIurEGPxyae1
 tTW6agAUEXN4OkkNb7e8z4urqXaN5WR+IzXZz1317NIvcQ7PZuPxO2DE7ibQU48UaVui UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4y8a4xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:11 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207MPFhW003216;
 Fri, 7 Jan 2022 22:26:10 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3de4y8a4xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:10 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207MH02N018993;
 Fri, 7 Jan 2022 22:26:10 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3de5ccg5mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:10 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207MQ9f415925934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 22:26:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 389B6BE058;
 Fri,  7 Jan 2022 22:26:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99C90BE051;
 Fri,  7 Jan 2022 22:26:07 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 22:26:07 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] target/ppc: powerpc_excp improvements (2/n)
Date: Fri,  7 Jan 2022 19:25:53 -0300
Message-Id: <20220107222601.4101511-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6sEc_VexHwW36amssQX2gwC9ZtPYK1vj
X-Proofpoint-ORIG-GUID: Gc0Vkeve0Y1xrLdsYUldPWnkzUv2cz7a
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=545 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201070130
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Version 3:

- patches 1,3,4,5,6,7: unchanged, reviewed;

- patch 2: started using qemu_loglevel_mask(CPU_LOG_MMU) instead of
           qemu_log_enabled;

	   I decided to not rename the function at this point because
	   it is used for both 60x and 7x5 and these two will be split
	   in the near future, so allow me to postpone that;

- patch 8: new patch using env->has_hv_mode to fix the endianness of
           powernv dumps as suggested by David.

v2:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00139.html

v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-01/msg00054.html

RFC v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00026.html

RFC v2:
https://lists.nongnu.org/archive/html/qemu-ppc/2021-12/msg00542.html

Cleanups 1/n [already merged]:
https://mail.gnu.org/archive/html/qemu-ppc/2021-12/msg00696.html

Fabiano Rosas (8):
  target/ppc: powerpc_excp: Extract software TLB logging into a function
  target/ppc: powerpc_excp: Keep 60x/7x5 soft MMU logs active
  target/ppc: powerpc_excp: Group unimplemented exceptions
  target/ppc: Add HV support to ppc_interrupts_little_endian
  target/ppc: Add MSR_ILE support to ppc_interrupts_little_endian
  target/ppc: Use ppc_interrupts_little_endian in powerpc_excp
  target/ppc: Introduce a wrapper for powerpc_excp
  target/ppc: Set the correct endianness for powernv memory dumps

 target/ppc/arch_dump.c   |   2 +-
 target/ppc/cpu.h         |  25 ++++--
 target/ppc/excp_helper.c | 183 ++++++++++++---------------------------
 3 files changed, 73 insertions(+), 137 deletions(-)

-- 
2.33.1


