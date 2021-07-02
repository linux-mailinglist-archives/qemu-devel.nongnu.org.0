Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00F13BA54E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:54:42 +0200 (CEST)
Received: from localhost ([::1]:45076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzR7R-0003Ts-CN
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5k-0001M9-6R; Fri, 02 Jul 2021 17:52:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5g-0001qA-Vv; Fri, 02 Jul 2021 17:52:55 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162LY4nU180970; Fri, 2 Jul 2021 17:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=r7f1v9AXbGq4m357apmUNaeRRf8IASNl7VfdeOi+YT4=;
 b=dk/uNON67wrzKxoLa6s+mB2YLCnVBVf5PWeMygwd3FgPQskBta7C8boBqmpbqnSx67eo
 TYTDKCuZXfEA9e7z9BrUeeUug1z2bPrlQi7ESyGie+Vp0jZ3hiwKsNZJE7k/N8iDkA9g
 +G66aFv52W57y2h9ZpA9wW8AaWbrvOOEv63ooKBrl+wimKf6Jk5sFrngo1ZbbgeEYTQi
 VodsZBXj/T9+gYc+O3BvePOBy4DAK+XMcPP2ca3NVvmxIM2Vsn/Wj4vTKQUsSQtDQQnF
 d8s4FUquNsCA3HbXToUH05Y0rGdHkKMq2mwWCT8EDCPa0IV/Gm4sxStTkAkkR5VwBO6r SA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39j97pa76p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 17:52:43 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162LfGaO003635;
 Fri, 2 Jul 2021 21:52:42 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 39duvex4x5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 21:52:42 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162Lqf6c29557032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 21:52:41 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75BBBBE056;
 Fri,  2 Jul 2021 21:52:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B6E6BE04F;
 Fri,  2 Jul 2021 21:52:40 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.44.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 21:52:39 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/ppc: MMU debug fixes
Date: Fri,  2 Jul 2021 18:52:32 -0300
Message-Id: <20210702215235.1941771-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tCReGHM3HOXhTaH3KIjQyy99u0kW3ydC
X-Proofpoint-ORIG-GUID: tCReGHM3HOXhTaH3KIjQyy99u0kW3ydC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_10:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=756 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some fixes for the commented-out debug options in MMU code.

Since v2:
  - added a fix for DEBUG_BATS

  v1: https://lists.nongnu.org/archive/html/qemu-ppc/2021-07/msg00004.html

Fabiano Rosas (3):
  target/ppc: Fix compilation with DUMP_PAGE_TABLES debug option
  target/ppc: Fix compilation with FLUSH_ALL_TLBS debug option
  target/ppc: Fix compilation with DEBUG_BATS debug option

 target/ppc/mmu-hash32.c |  5 ++++-
 target/ppc/mmu-hash32.h |  2 ++
 target/ppc/mmu_helper.c | 10 +---------
 3 files changed, 7 insertions(+), 10 deletions(-)

--
2.29.2

