Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D821397BEC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:53:26 +0200 (CEST)
Received: from localhost ([::1]:58830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loCKD-0003nb-Cg
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCED-000227-Ck; Tue, 01 Jun 2021 17:47:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loCE9-0004PD-Nn; Tue, 01 Jun 2021 17:47:13 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151LX3Es122156; Tue, 1 Jun 2021 17:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=t1RDGb/gzHKKDYWfpQg6If2C/ggxk3lRE7SbxiIoLxc=;
 b=qCpJY+3jBLhTj0Q8KuOC6fqM3/QiFXtF0/hRyAuhQZACbF9EhG9/325rY3PqNKJkcpER
 n3J3hfMcWbtUe6SCQJvnsnjnwI4Uxadcfi56I9eoeC2fgBitPu5DU3bEB7V66JHTiIma
 HmbvHx4D5OdxHiTk/Wi4pe7MAPOFwvvSCR0dj/+Hiuf38X6nmGXbL4kbanDywBoXXC2v
 Q+eQdUS0kyTLuUsiFN3wJGeK5HThDoWa4cj5hFumMgL842B9QDy8NSDCiED2lgaOREAd
 litPVMbcqYI9xrz7jr8uem5zbs/gmggpy8pv3WIJQsMXYsarCkecRhNvZytvlKHdJQYJ kw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38wte04cb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 17:46:56 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 151LgduO031846;
 Tue, 1 Jun 2021 21:46:55 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 38ud8a1c51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 21:46:55 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 151Lks8Y24838412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Jun 2021 21:46:54 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3449F78067;
 Tue,  1 Jun 2021 21:46:54 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF51078064;
 Tue,  1 Jun 2021 21:46:52 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.142.192])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Jun 2021 21:46:52 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/5] target/ppc: powerpc_excp improvements - part I
Date: Tue,  1 Jun 2021 18:46:44 -0300
Message-Id: <20210601214649.785647-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pc1LLbapJRo16q_rNlFOdZuQa-6HRSo-
X-Proofpoint-ORIG-GUID: pc1LLbapJRo16q_rNlFOdZuQa-6HRSo-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_10:2021-06-01,
 2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=564 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010143
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is my attempt at reducing the size of powerpc_excp and cleaning
it up a bit. It has two parts:

part I (this series) tackles the big switch statement that runs the
interrupt emulation code. Each interrupt now gets its own callback
function that is kept within QOM. The per-processor code still
registers the interrupts in a similar manner to what is done today and
powerpc_excp replaces its switch statement for a function call.

part II (still WIP: https://github.com/farosas/qemu/commits/powerpc_excp)
tries to make powerpc_excp processor agnostic by removing the excp_model
checks and moving processor-specific interrupt properties to
per-processor QOM classes.

I think it would be nice if we could at the end have separate
interrupts and interrupt model implementations. That way we could
start moving things into well defined per-processor files, CONFIGs,
etc.

(So far tested on x86 emulating P9 and compile-only 32-bit and
linux-user. I still need to gather some command lines for the older
cpus.)

Based-on: eb22196316ee653178ae517de83b490ad3636b91 # ppc-for-6.1

Fabiano Rosas (5):
  target/ppc: powerpc_excp: Move lpes code to where it is used
  target/ppc: powerpc_excp: Remove dump_syscall_vectored
  target/ppc: powerpc_excp: Consolidade TLB miss code
  target/ppc: powerpc_excp: Standardize arguments to interrupt code
  target/ppc: powerpc_excp: Move interrupt raising code to QOM

 target/ppc/cpu.h         |  29 +-
 target/ppc/cpu_init.c    | 640 +++++++++++++++++++------------------
 target/ppc/excp_helper.c | 670 +++++----------------------------------
 target/ppc/interrupts.c  | 638 +++++++++++++++++++++++++++++++++++++
 target/ppc/machine.c     |   2 +-
 target/ppc/meson.build   |   1 +
 target/ppc/ppc_intr.h    |  55 ++++
 target/ppc/translate.c   |   3 +-
 8 files changed, 1117 insertions(+), 921 deletions(-)
 create mode 100644 target/ppc/interrupts.c
 create mode 100644 target/ppc/ppc_intr.h

--
2.29.2

