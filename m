Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D83732FF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 02:16:14 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le5D3-0003qk-JL
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 20:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le58l-0000KR-GT; Tue, 04 May 2021 20:11:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2360
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le58i-0002vG-H2; Tue, 04 May 2021 20:11:47 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14502rVg068879; Tue, 4 May 2021 20:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ieQY2AAmueOxHGoBFuysWkrvd9LJUc9FNM25dZ9Bwgc=;
 b=jUqFM+Dc3xadu+wSd4yvyc+QFwJjShz/wNoxp+NyzkpJ5npGLr6z9n0njTFcebiPFzzy
 B+6s4DODXczjMAcFCDOno3CTm/Z6HJaVSCbRY0gJOQvYn1lxJL0t8WHaE5TgSToobDTL
 9+WRI/SuaqDXvgTDhALFFeuqYnV8hNdRk8G9N/oKq5oo2qWKOsCxNp1VT9ePQbaQT4V6
 600HhZ3dfcjDUdmDKjVww0gUu6dKQNPARcy5lGdn9iP7Rn0ZaGw8okcbs0+OV3SEUwCx
 DAUSJ/OtdUqh3lt4EuOnJGrpOuPSxppIYbYJja+KjHa+EoeqtaBJzFRXC5wC7YFjG49J hg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38bfx7rt3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 20:11:36 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1450BZ3B016297;
 Wed, 5 May 2021 00:11:36 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 38bedr0ns8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 00:11:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1450BZsQ29950440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 May 2021 00:11:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47EE5C605D;
 Wed,  5 May 2021 00:11:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56FDBC6057;
 Wed,  5 May 2021 00:11:34 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.49.100])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 May 2021 00:11:34 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix for compat mode in P9 < 2.2
Date: Tue,  4 May 2021 21:11:28 -0300
Message-Id: <20210505001130.3999968-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ay0fSd5pGjFHbKu0rZlck5_o4Iklfqjs
X-Proofpoint-ORIG-GUID: ay0fSd5pGjFHbKu0rZlck5_o4Iklfqjs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_15:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=764 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040166
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We dropped support in KVM for mixing MMU modes in machines that have
old POWER9 processors which don't support mixing. As usual I forgot
that compat mode exists:

  $ lscpu | grep pvr
  Model:               2.1 (pvr 004e 1201)

  $ ~/qemu-system-ppc64 -machine pseries,accel=kvm,max-cpu-compat=power8 ...
  error: kvm run failed Invalid argument
  NIP 0000000000000100   LR 0000000000000000 CTR 0000000000000000 XER 0000000000000000 CPU#0
  MSR 8000000000001000 HID0 0000000000000000  HF 8000000000000000 iidx 3 didx 3
  TB 00000000 00000000 DECR 0
  GPR00 0000000000000000 0000000000000000 0000000000000000 000000007ff00000
  GPR04 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR08 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR12 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR16 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR20 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR24 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  GPR28 0000000000000000 0000000000000000 0000000000000000 0000000000000000
  CR 00000000  [ -  -  -  -  -  -  -  -  ]             RES ffffffffffffffff
   SRR0 0000000000000000  SRR1 0000000000000000    PVR 00000000004e1201 VRSAVE 0000000000000000
  SPRG0 0000000000000000 SPRG1 0000000000000000  SPRG2 0000000000000000  SPRG3 0000000000000000
  SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
  HSRR0 0000000000000000 HSRR1 0000000000000000
   CFAR 0000000000000000
   LPCR 000000000004f01f
   PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000

This series reuses some code we already have to abort and print a
proper message if the chosen MMU mode is not supported by the host.

Fabiano Rosas (2):
  hw/ppc/spapr.c: Extract MMU mode error reporting into a function
  hw/ppc/spapr.c: Make sure the host supports the selected MMU mode

 hw/ppc/spapr.c         | 17 +++++++++++++++++
 hw/ppc/spapr_hcall.c   | 14 ++------------
 include/hw/ppc/spapr.h |  1 +
 3 files changed, 20 insertions(+), 12 deletions(-)

--
2.29.2

