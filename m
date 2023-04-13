Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD56E10C8
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:15:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmye2-0003FU-MZ; Thu, 13 Apr 2023 11:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1pmydy-0003F0-Rh; Thu, 13 Apr 2023 11:13:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1pmydu-0006o6-E5; Thu, 13 Apr 2023 11:13:49 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33DEx54c006857; Thu, 13 Apr 2023 15:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=vomo2Irr02Ujrdz+za4ckwF4iWVyUg0FC4KM41rPV4c=;
 b=phvvE7KQ+vTAsTFyg6Lc7FivamsO0NISnxsy/FBsBsuJqhBfzOHYLMPqwxCl6s6TewlL
 aIrezhGi0DJp46lFiSHT8PUSDchU0tNvCld0C0d0DU8p1KcBaLKnPLTtVj5jQeZin+85
 FLGqJXaNmg8mraJOCIXcPdDEFPSL+8o4k4TQltVIDKI6/v5aH+rrm5XGEFId3H0bJo0G
 DLpYI6O5rq0Eom7Mo8e5vFKY2zQs7fexZ6x5TThgHCMVtVfLpU7KkLAAHp3R1ADe9uaK
 F0TDTUwHfeus6TI3UgK75NXRxsUvnzxJyq7FZf11k6qgHBzMJxu2pqS9y1DDlbjj4x4y cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxkym8s4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:13:26 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33DExnRd009440;
 Thu, 13 Apr 2023 15:13:25 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxkym8s2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:13:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33D3GgGD022808;
 Thu, 13 Apr 2023 15:13:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pu0hdk4bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:13:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33DFDLGe47973118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Apr 2023 15:13:21 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22F8820040;
 Thu, 13 Apr 2023 15:13:21 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E18620043;
 Thu, 13 Apr 2023 15:13:19 +0000 (GMT)
Received: from ltc-boston1.aus.stglabs.ibm.com (unknown [9.40.193.18])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 13 Apr 2023 15:13:19 +0000 (GMT)
Subject: [PATCH 0/2] tcg: ppc64: Fix mask generation for vextractdm
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: philmd@linaro.org, richard.henderson@linaro.org, danielhb413@gmail.com,
 lucas.araujo@eldorado.org.br, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-ppc@nongnu.org
Cc: john_platts@hotmail.com, sbhat@linux.ibm.com, qemu-devel@nongnu.org
Date: Thu, 13 Apr 2023 15:00:41 -0400
Message-ID: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ex4YkEOKuxXDRxM7QfyiXZQ9SqZgxVJz
X-Proofpoint-GUID: Hr4TH-TnB6oNyMYRQQX-lmKqksNzhEiJ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_10,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=875 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130134
Received-SPF: pass client-ip=148.163.158.5; envelope-from=sbhat@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_03_06=3.027,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Let me know if both patches should be squashed into single
patch. Checkpatch flagged me to avoid use of __BYTE_ORDER__
in the test file(second patch), however I see it being
used in multiarch/sha1.c also this being arch specific
test, I think it is appropriate to use it here. Let me
know if otherwise.

References:
[1] : https://gitlab.com/qemu-project/qemu/-/issues/1536

---

Shivaprasad G Bhat (2):
      tcg: ppc64: Fix mask generation for vextractdm
      tests: tcg: ppc64: Add tests for Vector Extract Mask Instructions


 target/ppc/translate/vmx-impl.c.inc |  2 +-
 tests/tcg/ppc64/Makefile.target     |  6 +++-
 tests/tcg/ppc64/vector.c            | 50 +++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/ppc64/vector.c

--
Signature


