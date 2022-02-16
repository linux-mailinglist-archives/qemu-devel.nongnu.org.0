Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC92E4B8E0C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:32:34 +0100 (CET)
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNEH-0002Bt-OP
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:32:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6r-0001FG-Vd; Wed, 16 Feb 2022 11:24:53 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN6m-0001BY-5o; Wed, 16 Feb 2022 11:24:53 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GFbJpb025098; 
 Wed, 16 Feb 2022 16:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Qbufmw+XRZiKtUB2Lywv4uoj3Sl2YFOIK2Are87/1dM=;
 b=Pkn/qbn94z/XwyWD8cjETXjU83sHr7RTWi6BfxyRtqJartt5jriohmZ5LbXzPKXGyKlV
 TZ2j7kKYw72a57J5NNAxmZ/Xow556NNEigX65QKUGM8cAxfLHSJ30ZQ+8FSmU6TADFGX
 k21UYB1P4yDL5OnNlfeA1yIFuY2qmQd0FCTeItLp8Gg0vT44db5youPJhOZ+mn2Lssev
 ZK7IoizmTHr2/yUFEHBDNuWE32YYgigmGsimgIzAXRWN+DEypZbg1JzxqebVW2X1N+H9
 qeI/+hzAhN2sqD0xOJCAI7GC0VbOnNxxnODBhhL6KRe52qG4+D9ioGlHaCebzYO1zSvQ TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e912ce9e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:36 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GFbPgc025333;
 Wed, 16 Feb 2022 16:24:36 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e912ce9dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:36 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCBDB028880;
 Wed, 16 Feb 2022 16:24:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 3e64hbksp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:24:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGOXYo30540198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:24:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80ED578070;
 Wed, 16 Feb 2022 16:24:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15EBC78060;
 Wed, 16 Feb 2022 16:24:32 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:24:31 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/27] target/ppc: SPR registration cleanups
Date: Wed, 16 Feb 2022 13:23:59 -0300
Message-Id: <20220216162426.1885923-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KYA6oLJUwtLlWFIKD3zoRMkunRq069s6
X-Proofpoint-GUID: l0B8mHsnMzpvidxYaruWJfaxDa5er1_h
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=490 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
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

The goal of this series is to do some untangling of SPR registration
code in cpu_init.c and prepare for moving the CPU initialization into
separate files for each CPU family.

After this series we'll have only cpu-specific SPR code in cpu_init.c,
i.e. code that can be split and moved as a unit into other
files. Common/generic SPR code will be in helper_regs.c, exposed via
spr_common.h.

Changes from v1:

- Some commit message improvements suggested by David;

- Removed the soft_tlb rename patch. Kept the old name;

- Left the specific check_pow functions behind, they can be dealt with
  in the next series;

- Added a new patch to rename spr_tcg to spr_common.

Patches 23 and 26 still need review.

This series is based on legoater/ppc7.0.

v1:
https://lists.nongnu.org/archive/html/qemu-ppc/2022-02/msg00313.html

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
  target/ppc: cpu_init: Deduplicate 745/755 SPR registration
  target/ppc: cpu_init: Deduplicate 7xx SPR registration
  target/ppc: cpu_init: Move 755 L2 cache SPRs into a function
  target/ppc: cpu_init: Move e300 SPR registration into a function
  target/ppc: cpu_init: Move 604e SPR registration into a function
  target/ppc: cpu_init: Reuse init_proc_603 for the e300
  target/ppc: cpu_init: Reuse init_proc_604 for the 604e
  target/ppc: cpu_init: Reuse init_proc_745 for the 755
  target/ppc: cpu_init: Rename register_ne_601_sprs
  target/ppc: cpu_init: Remove register_usprg3_sprs
  target/ppc: Rename spr_tcg.h to spr_common.h
  target/ppc: cpu_init: Expose some SPR registration helpers
  target/ppc: cpu_init: Move SPR registration macros to a header
  target/ppc: cpu_init: Move check_pow and QOM macros to a header
  target/ppc: Move common SPR functions out of cpu_init

 target/ppc/cpu.h                       |   39 +
 target/ppc/cpu_init.c                  | 1879 ++++++++----------------
 target/ppc/helper_regs.c               |  402 +++++
 target/ppc/{spr_tcg.h => spr_common.h} |   69 +-
 target/ppc/translate.c                 |    2 +-
 5 files changed, 1098 insertions(+), 1293 deletions(-)
 rename target/ppc/{spr_tcg.h => spr_common.h} (72%)

-- 
2.34.1


