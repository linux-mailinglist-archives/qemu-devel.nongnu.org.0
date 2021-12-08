Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0F446D363
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 13:34:54 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muw9t-00013v-IL
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 07:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw7y-0007F4-Nt; Wed, 08 Dec 2021 07:32:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw7x-0005iI-8H; Wed, 08 Dec 2021 07:32:54 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8CJSNf025002; 
 Wed, 8 Dec 2021 12:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=MFhqy/bE5to/0V66ruDxSWDX42VKyo4XuU/opBtp7Ko=;
 b=FXUGzwKTxfRqb8J1whtxeT+wwZ6qqRG/XlAzZSzlDGvAkhrlkdvFe9gCXYHD93rmeKQh
 hn+J4f78/lGw2iqVWCglXOasFrdjqxGD/zBfL5ehCZCXAs6/kT5d6u467htVcsdHTOIi
 wZwDI75dTQLsRxR3+YeVaB6fCj4uBy1b1HpFyxxGo2HdZZ6kHS5WVUaDLC1hgB16AZmY
 LEHUKrZQ7k3lmpQzfReFQtlmThdSP/E0RKWEgUW0nvDA6TQWz05O7QEOWUJlf9GDhjK2
 RXu7BCds6zAjrRPp/naoMY2AMbu4m3wSPZawFE3LtH1rYjSJisInAjP0Q0fNSmExtZl1 fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctvkp07m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8CNcIT007743;
 Wed, 8 Dec 2021 12:32:39 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctvkp07kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:39 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8CWRQp008145;
 Wed, 8 Dec 2021 12:32:38 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3cqyyb0vye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8CWbNM49480008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 12:32:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC89378063;
 Wed,  8 Dec 2021 12:32:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46D7978067;
 Wed,  8 Dec 2021 12:32:36 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.43.72])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 12:32:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/ppc: Minor fixes to exception code
Date: Wed,  8 Dec 2021 09:30:26 -0300
Message-Id: <20211208123029.2052625-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bn42XhW26f-ONEf_-urctAzWW9ymv9xq
X-Proofpoint-ORIG-GUID: BZQ6732DD4A_Wnymsfh6MFIg9yBw5v_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=682
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are just some minor fixes to the exception code that I collected
over the past few months.

Fabiano Rosas (3):
  target/ppc: Fix MPCxxx FPU interrupt address
  target/ppc: Remove 603e exception model
  target/ppc: Set 601v exception model id

 target/ppc/cpu-qom.h     |  2 --
 target/ppc/cpu_init.c    | 37 +++++--------------------------------
 target/ppc/excp_helper.c |  1 -
 3 files changed, 5 insertions(+), 35 deletions(-)

-- 
2.33.1


