Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837474C8D25
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 14:59:51 +0100 (CET)
Received: from localhost ([::1]:51384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP32c-0000XD-B1
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 08:59:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2za-0005bZ-1N; Tue, 01 Mar 2022 08:56:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5384
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nP2zX-00020m-LZ; Tue, 01 Mar 2022 08:56:41 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DgOph002999; 
 Tue, 1 Mar 2022 13:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=AnjO4kgiKbXQWedfF7o+hc73FAyRR5VdBDmhJWUrTGw=;
 b=K1N3bPOKx9TxEeB7Iioky+dV/aMJTScA9K1fSjZ5pnJCqMyM+SXnxtQtB3zuh3qs2vCH
 D4XMVPIJGvVz8jZeTO66P3zv60xCHB4YFlJmrhJtlnuSfu5gUVLiwEkkrB7KasofaUA4
 qbWbHhJLdxWeDzw+tpzRJrJCwRP/ZofFav5+TEaiiHRSiFGmaY2B8ThtYmUS8svtNulc
 h3aAMNfglAinPEDG5MHHWM7AECxAMcCrCnLhIMnv84sYYaZzbIOIDdsj0cevocY10PBs
 Jnr6R0M0K6ldRY++2+h1rGgOZB6t4GNhmIDqQbtI+G8XPOEKIcvjhaivVTc812bO/DyT 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmku09jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:29 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221Dpdu8006250;
 Tue, 1 Mar 2022 13:56:29 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ehmku09jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:29 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221DtrL7002511;
 Tue, 1 Mar 2022 13:56:28 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3eftrreunr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 13:56:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221DuRHN31457768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 13:56:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89F3DBE054;
 Tue,  1 Mar 2022 13:56:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15591BE053;
 Tue,  1 Mar 2022 13:56:26 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.51.129])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 13:56:25 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] target/ppc: CPU families split
Date: Tue,  1 Mar 2022 10:56:03 -0300
Message-Id: <20220301135620.2411952-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3M8KK7puCkW45NU7s927T6e7_s2SuBAW
X-Proofpoint-ORIG-GUID: nM6LGwhkN7asUGJ7108uyAHVnz6ajBFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=877 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010074
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series introduces 6 new files, one for each big CPU family and
moves most the specific code from cpu_init and excp_helper into these
files.

We're left with cpu_init containing only generic CPU initialization
routines and QOM-related functions.

The excp_helper file still needs more work but we're close to having
only TCG-specific code in it, as the file name implies. I left this
for the next series.

Based on legoater/ppc-7.0

Fabiano Rosas (17):
  target/ppc: Add a tracepoint for System Calls
  target/ppc: Use trace-events instead of CPU_LOG_INT
  target/ppc: Move 40x CPUs code to their own file
  target/ppc: Move 6xx CPUs code to their own file
  target/ppc: Move 7xx CPUs code to their own file
  target/ppc: Move 74xx CPUs code to their own file
  target/ppc: Move BookE CPUs code to their own file
  target/ppc: Move BookS CPUs to their own file
  target/ppc: Remove leftover comments from cpu_init
  target/ppc: Expose some excp_helper functions
  target/ppc: Move powerpc_excp_40x into cpu_40x.c
  target/ppc: Move powerpc_excp_6xx into cpu_6xx.c
  target/ppc: Move powerpc_excp_7xx into cpu_7xx.c
  target/ppc: Move powerpc_excp_74xx into cpu_74xx.c
  target/ppc: Move powerpc_excp_booke into cpu_booke.c
  target/ppc: Move powerpc_excp_books into cpu_books.c
  target/ppc: Move powerpc_excp* to the PowerPCCPU Class

 target/ppc/cpu-qom.h     |    1 +
 target/ppc/cpu.h         |    6 +
 target/ppc/cpu_40x.c     |  412 +++
 target/ppc/cpu_6xx.c     | 1341 ++++++++
 target/ppc/cpu_74xx.c    | 1358 ++++++++
 target/ppc/cpu_7xx.c     | 1095 +++++++
 target/ppc/cpu_booke.c   | 1647 ++++++++++
 target/ppc/cpu_books.c   | 2299 +++++++++++++
 target/ppc/cpu_init.c    | 6593 --------------------------------------
 target/ppc/excp_helper.c | 1486 +--------
 target/ppc/meson.build   |    6 +
 target/ppc/misc_helper.c |    4 +-
 target/ppc/trace-events  |    4 +
 target/ppc/trace.h       |   18 +
 14 files changed, 8202 insertions(+), 8068 deletions(-)
 create mode 100644 target/ppc/cpu_40x.c
 create mode 100644 target/ppc/cpu_6xx.c
 create mode 100644 target/ppc/cpu_74xx.c
 create mode 100644 target/ppc/cpu_7xx.c
 create mode 100644 target/ppc/cpu_booke.c
 create mode 100644 target/ppc/cpu_books.c

-- 
2.34.1


