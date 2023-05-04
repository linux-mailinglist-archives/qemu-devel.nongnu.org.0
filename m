Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6726F6481
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 07:43:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puRji-0002HT-HN; Thu, 04 May 2023 01:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRjc-0002B4-Ge; Thu, 04 May 2023 01:42:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRjX-0002Hw-6R; Thu, 04 May 2023 01:42:32 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34459TSP019821; Thu, 4 May 2023 05:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=/CiasP2Wdw+jakds/07mfUlEVxqMwLtI0lszwn80eAU=;
 b=QKQ6G2TfsemQsCQgDFMbG+zuWgKqEP6B1ihhcq2sFTIYy6YQlmihEVm2a4ywCIdt02Rr
 3uRUgvEIoUQZipcJE+x1aLg+VfXWSXKZ1P2XWDdpmPk+dxWcykVr9P0wQiH+fy3tTj19
 jhdesLNaUjqCW0H+feKwW+y/W7qYRKLByGGYFYVC3gykjZ1xtDCrrUNMTe5hwO1VTLjQ
 zQwPQyudO4/kLQxpcisCwdpUcB1Pgmry+UbcLYV42D47QO8YVuI2yHFNktAl3BQr476p
 NrN+d74mcoKudrXcWPbKbUhax14IE7sZO1EX5kR86d1B32HvPtuiy/DJQhfE2YGIjaLD LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc5ms1skk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:42:11 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3445AUgn024578;
 Thu, 4 May 2023 05:42:10 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc5ms1sk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:42:10 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3444bDsh021944;
 Thu, 4 May 2023 05:42:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3q8tgft66w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:42:08 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3445g6Bq15598090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 May 2023 05:42:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3256720040;
 Thu,  4 May 2023 05:42:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62FD020043;
 Thu,  4 May 2023 05:42:04 +0000 (GMT)
Received: from ltc-boston1.aus.stglabs.ibm.com (unknown [9.40.193.18])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 May 2023 05:42:04 +0000 (GMT)
Subject: [PATCH v2 0/2] tcg: ppc64: Fix mask generation for vextractdm
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: philmd@linaro.org, richard.henderson@linaro.org, danielhb413@gmail.com,
 lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org
Cc: john_platts@hotmail.com, sbhat@linux.ibm.com, qemu-devel@nongnu.org
Date: Thu, 04 May 2023 05:35:19 -0400
Message-ID: <168319291781.1159309.7376486961333644798.stgit@ltc-boston1.aus.stglabs.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ENnyc4wqcnZHAK-WZwPKGwHZTYbcjoLl
X-Proofpoint-GUID: Nmm0kwwyims-g3S9MfMvrA--zQM2OQLv
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_02,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040046
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_03_06=3.027,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

While debugging gitlab issue[1] 1536, I happen to try the
vextract[X]m instructions on the real hardware. The test
used in [1] is failing for vextractdm.

On debugging it is seen, in function do_extractm() the
mask is calculated as dup_const(1 << (element_width - 1)).
'1' being signed int works fine for MO_8,16,32. For MO_64,
on PPC64 host this ends up becoming 0 on compilation. The
vextractdm uses MO_64, and it ends up having mask as 0.

The first patch here fixes that by explicitly using
1ULL instead of signed int 1 like its used everywhere else.
Second patch introduces the test case from [1] into qemu
tcg/ppc64 along with fixes/tweaks to make it work for both
big and little-endian targets.

References:
[1] : https://gitlab.com/qemu-project/qemu/-/issues/1536

---
Changelog:
Since v1 : https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01958.html
 - Added "Resolves: " to first patch description
 - Rebased to top of the tree. I see with d044b7c33a5, Alex has limited the
   scope of plugin tests to just the MULTIARCH_TESTS. So, removed the plugin
   tests for the test case added in the second patch.
 - Changed the test case to use the HOST_BIG_ENDIAN from compiler.h

Shivaprasad G Bhat (2):
      tcg: ppc64: Fix mask generation for vextractdm
      tests: tcg: ppc64: Add tests for Vector Extract Mask Instructions


 target/ppc/translate/vmx-impl.c.inc |  2 +-
 tests/tcg/ppc64/Makefile.target     |  6 +++-
 tests/tcg/ppc64/vector.c            | 51 +++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/ppc64/vector.c

--
Signature


