Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B354AC942
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 20:14:24 +0100 (CET)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH9Sx-0004gt-DR
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 14:14:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8nd-0004CS-Fw; Mon, 07 Feb 2022 13:31:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nH8n3-0001H5-91; Mon, 07 Feb 2022 13:31:20 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IQ4Rl001237; 
 Mon, 7 Feb 2022 18:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Z+IVLomRjIRzQiiBojg3Tnfg/J1ykoFSeYEJ9m2q1iA=;
 b=SlZYdEdCsWKTuJHUAFmw5BqC05ztYAV0uI+bthNf+O8/E8hZnXNcRN2oWy3DGyQAoPw2
 RgwdostgDERLKQ6MOraE8vHRuWB6JBJ3svZog8A7hMIzHKKqWCz8GxwZLq+uIcX9vI6L
 6HdemBYsCtYEkKWGGpfTF1jgIwiSV21JmZHYNYTuLeS+cHDiGnwfo5sR2if6yLZITPMU
 5Yo5Xpe793f+Jisdax/ljiRu4p5mROpIlGHZsjS5r2ZnM7YqEv8jOGT8eRchfhdHoYIp
 W3rOOU8bL8aPvYeCVJE84RasF1btn4437yj7w8Hb8g87Hx1HkSuntTZsYthr3le8GeOw Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22st41e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:46 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217IR160010061;
 Mon, 7 Feb 2022 18:30:46 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22st41dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:45 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217I87GY029595;
 Mon, 7 Feb 2022 18:30:45 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 3e1gvakt22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:30:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217IUhg821823768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 18:30:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B22AABE058;
 Mon,  7 Feb 2022 18:30:43 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B43BBE05A;
 Mon,  7 Feb 2022 18:30:42 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.16.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 18:30:42 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/ppc: powerpc_excp improvements (9/9)
Date: Mon,  7 Feb 2022 15:30:32 -0300
Message-Id: <20220207183036.1507882-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EzyY1fqFmxRAhFVJF4WimRPynfzZ8ghe
X-Proofpoint-ORIG-GUID: isjyjXIJcpY61gEQlEbnpTOMrKfAsQbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=934 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070111
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the last part of this series of changes to the exceptions
code.

First two patches remove the powerpc_excp_legacy function which is not
needed anymore and move some of the common code from the individual
powerpc_excp_* functions into powerpc_excp.

Third patch makes the sanity check against msr_mask generic to check
all MSR bits.

Last patch removes excp_model from the AIL code for BookS. We now have
only two instances left of excp_model being used as an identifier for
specific CPUs.

== Next steps ==

I'll work on the next steps which include some cleanups to cpu_init
and hopefully moving into separate files for each CPU family.

I'm also thinking about some changes to the POWERPC_FAMILY macro to
remove the _FAMILY part, since this code has been used for a long time
to create single CPUs instead of a whole family. I think the
separation we have now with the exception models better represents the
concept of family. So I would rather call the macro POWERPC_CPU and
add (if needed) a new field 'family' to the class. With that and
having one family per file, we would be able to remove the excp_model
enum altogether by adding a pointer to powerpc_excp like we have for
init_proc.

I'll put all of that in an RFC so we can discuss.

Thanks

Fabiano Rosas (4):
  target/ppc: Remove powerpc_excp_legacy
  target/ppc: powerpc_excp: Move common code to the caller function
  target/ppc: Assert if MSR bits differ from msr_mask during exceptions
  target/ppc: books: Remove excp_model argument from ppc_excp_apply_ail

 target/ppc/excp_helper.c | 623 ++-------------------------------------
 1 file changed, 31 insertions(+), 592 deletions(-)

-- 
2.34.1


