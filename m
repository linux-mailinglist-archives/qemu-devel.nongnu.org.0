Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682ED4B7964
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:46:30 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5eX-0005zc-1o
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:46:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aM-00035D-T1; Tue, 15 Feb 2022 16:42:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38706
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nK5aI-0002TC-K3; Tue, 15 Feb 2022 16:42:08 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FLaxgW017725; 
 Tue, 15 Feb 2022 21:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=djftOloPk83R+MpEVwtW6C6aWMWUY8ufrYhJcEyhgQo=;
 b=LfvAUd83LY2U4nSEvrJ5bV4+myJCUY/4lVtwd0q89Q2/6TOaYe9ySUpLWeOApwDvCUUx
 1amU9VG+8hdmZw9fFBhP2SggMRZDI4tVYytYJaUvpnTDxGsK10BPqrzmymE063MWP+m4
 3C9IpOxwadXUtbLJ82nPJGtkSxwgAkinIbCVlsQOkuiW1S2NLXlWyGYzlrTxhyKsn+BU
 x9NNsHJsbsHwq13EfjbVA/ZvkK5bzj05TJrqM05GzlAPcRFGPZ/pJ6pE1RQ0psx4NH2w
 7liIVHH+jKBVWTzDTHo6dGawC14X9LxjS+b1qHeTmmVuNjzBovMASoRg/saS3JZzw9ww ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8ku68g6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:41:58 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21FLcUHp026161;
 Tue, 15 Feb 2022 21:41:58 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8ku68g6e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:41:58 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21FLNQqD003706;
 Tue, 15 Feb 2022 21:41:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3e877fhb6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 21:41:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21FLfuZT40436042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 21:41:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A60A4BE058;
 Tue, 15 Feb 2022 21:41:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 225AEBE04F;
 Tue, 15 Feb 2022 21:41:55 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.143.123])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Feb 2022 21:41:54 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/27] target/ppc: SPR registration cleanups
Date: Tue, 15 Feb 2022 18:41:21 -0300
Message-Id: <20220215214148.1848266-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 95k5ko4w-U0eu6e_3f9p_DoZHhJq8ulM
X-Proofpoint-ORIG-GUID: 6DWoAVCohSQTVNT1eNTHZ6KGm8xT_jQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_06,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=489
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150122
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

The goal of this series is to do some untangling of SPR registration
code in cpu_init.c and prepare for moving the CPU initialization into
separate files for each CPU family.

The first 23 patches are all simple cleanups:
 - Remove unnecessary comments/code;
 - Reuse some pieces of code where it makes sense;
 - Group spr_register calls;
 - Remove bare spr_register calls from init_proc;
 - Separate code that affects different CPU families;

The last 4 patches move common SPR registration routines out of
cpu_init.c so that the cpu-specific code that uses them can move to
other files.

After this series we'll have only cpu-specific SPR code in cpu_init.c,
i.e. code that can be split and moved as a unit into other
files. Common/generic SPR code will be in helper_regs.c, exposed via
spr_tcg.h.

This series is based on legoater/ppc7.0.

Fabiano Rosas (27):
  target/ppc: cpu_init: Remove not implemented comments
  target/ppc: cpu_init: Remove G2LE init code
  target/ppc: cpu_init: Group registration of generic SPRs
  target/ppc: cpu_init: Move Timebase registration into the common
    function
  target/ppc: cpu_init: Avoid nested SPR register functions
  target/ppc: cpu_init: Move 405 SPRs into register_405_sprs
  target/ppc: cpu_init: Move G2 SPRs into register_G2_sprs
  target/ppc: cpu_init: Decouple G2 SPR registration from 755
  target/ppc: cpu_init: Decouple 74xx SPR registration from 7xx
  target/ppc: cpu_init: Deduplicate 440 SPR registration
  target/ppc: cpu_init: Deduplicate 603 SPR registration
  target/ppc: cpu_init: Deduplicate 604 SPR registration
  target/ppc: cpu_init: Deduplicate 7xx SPR registration
  target/ppc: cpu_init: Deduplicate 755 SPR registration
  target/ppc: cpu_init: Move 755 L2 cache SPRs into a function
  target/ppc: cpu_init: Move e300 SPR registration into a function
  target/ppc: cpu_init: Move 604e SPR registration into a function
  target/ppc: cpu_init: Reuse init_proc_603 for the e300
  target/ppc: cpu_init: Reuse init_proc_604 for the 604e
  target/ppc: cpu_init: Reuse init_proc_745 for the 755
  target/ppc: cpu_init: Rename software TLB function
  target/ppc: cpu_init: Rename register_ne_601_sprs
  target/ppc: cpu_init: Remove register_usprg3_sprs
  target/ppc: cpu_init: Expose some SPR registration helpers
  target/ppc: cpu_init: Move SPR registration macros to a header
  target/ppc: cpu_init: Move check_pow and QOM macros to a header
  target/ppc: Move common SPR functions out of cpu_init

 target/ppc/cpu.h         |   57 ++
 target/ppc/cpu_init.c    | 1901 ++++++++++++--------------------------
 target/ppc/helper_regs.c |  402 ++++++++
 target/ppc/spr_tcg.h     |   65 ++
 4 files changed, 1115 insertions(+), 1310 deletions(-)

-- 
2.34.1


