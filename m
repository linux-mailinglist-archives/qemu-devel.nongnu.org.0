Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03933C2751
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:08:55 +0200 (CEST)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t3e-0006J5-SK
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1t0F-000865-O1; Fri, 09 Jul 2021 12:05:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45212
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1t0C-00079v-OG; Fri, 09 Jul 2021 12:05:23 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169G4aKk005665; Fri, 9 Jul 2021 12:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=/0IXAlkqOrLXPudqHp7O33mzp+YLH5qTn+cANq1nVoA=;
 b=NicOZxPYdiAmbt/v60K/zWKWqzGxV5SSGEr7TK7I4QamHi6FrUKwppMaNjuSNsKV0gu3
 5Bqr9s14RJhW6T1Sf+GcaqgzAU+vcE3smGsEfapiIm3a1clzFaAT82Fn9b1MxoTpHx6w
 BacwMLXpfDTYC38TzdqEYJC/qv8RKmYLPI5ckw0fpCU3RFf2NT1tu0XqQN8MsEwd7NYN
 XBllkQFeFWsWbTjVRuxaplXL4DSxHAcXlZDMZoGKRw2nyZj/M7N/Poc4/IAnPwUvEGgm
 3cI3+hsGfVHRp81F4XAaUIpsSi8wh/cWZop/RW9+Dxsa7m4sWCRzh6JmIcY1YIxDUqTG EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nwfd9aed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:05:18 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 169G5ICe007605;
 Fri, 9 Jul 2021 12:05:18 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nwfd9adt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:05:18 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 169FvB2j026911;
 Fri, 9 Jul 2021 16:05:17 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 39jfhe4v13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 16:05:17 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 169G5Gp633292768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jul 2021 16:05:16 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84B132805C;
 Fri,  9 Jul 2021 16:05:16 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E16652806A;
 Fri,  9 Jul 2021 16:05:15 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.65.254.146])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  9 Jul 2021 16:05:15 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Date: Fri,  9 Jul 2021 12:04:57 -0400
Message-Id: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _ftC3A-lv-tvKIlLz3PzXu43wKS2HNFA
X-Proofpoint-ORIG-GUID: 4ADthb72TvhpfenRsPuDkQ3U0ncA-qN_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_09:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107090081
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>, iii@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-s390x signals with SIGILL on compare-and-trap instructions. This
breaks OpenJDK which expects SIGFPE in its implementation of implicit
exceptions.

This patch depends on [PATCH v6 0/2] target/s390x: Fix SIGILL and SIGFPE
psw.addr reporting
https://lore.kernel.org/qemu-devel/20210705210434.45824-1-iii@linux.ibm.com/

Based-on: 20210705210434.45824-1-iii@linux.ibm.com

v1 -> v2:
- Update to latest version of '... psw.addr reporting' patch
- Rebase to master and fix conflicts in tests/tcg/s390x/Makefile.target

v2 -> v3:
- Check for non-simulated IEEE exception DXC codes explicitly when
  getting si_codes
- Ensure si_code is set in all cases
- Improve comments

Jonathan Albrecht (2):
  linux-user/s390x: signal with SIGFPE on compare-and-trap
  tests/tcg: Test that compare-and-trap raises SIGFPE

 linux-user/s390x/cpu_loop.c     |  54 ++++++++++-------
 tests/tcg/s390x/Makefile.target |   1 +
 tests/tcg/s390x/trap.c          | 102 ++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+), 20 deletions(-)
 create mode 100644 tests/tcg/s390x/trap.c

-- 
2.31.1


