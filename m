Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A4020A384
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 19:02:37 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joVGm-00039L-53
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 13:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ljp@linux.ibm.com>)
 id 1joVEl-0000zb-0W; Thu, 25 Jun 2020 13:00:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ljp@linux.ibm.com>)
 id 1joVEj-0007Nj-2b; Thu, 25 Jun 2020 13:00:30 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05PGX1mx010675; Thu, 25 Jun 2020 13:00:21 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vvkxg14v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 13:00:21 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05PGxe2T005470;
 Thu, 25 Jun 2020 17:00:21 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 31uurq90am-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 17:00:20 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05PH0IEQ7733520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 17:00:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB599136053;
 Thu, 25 Jun 2020 17:00:19 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E875213604F;
 Thu, 25 Jun 2020 17:00:18 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.117.167])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jun 2020 17:00:18 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] Add several Power ISA 3.1 32/64-bit vector instructions
Date: Thu, 25 Jun 2020 12:00:10 -0500
Message-Id: <20200625170018.64265-1-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_11:2020-06-25,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 cotscore=-2147483648
 spamscore=0 mlxlogscore=930 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006250102
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ljp@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 13:00:26
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Lijun Pan <ljp@linux.ibm.com>, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series add several newly introduced 32/64-bit vector
instructions in Power ISA 3.1. Power ISA 3.1 flag is introduced in
this version. In v3 version, coding style issues are fixed, community
reviews/suggestions are taken into consideration.

Lijun Pan (8):
  target/ppc: Introduce Power ISA 3.1 flag
  target/ppc: add byte-reverse br[dwh] instructions
  target/ppc: convert vmuluwm to tcg_gen_gvec_mul
  target/ppc: add vmulld instruction
  target/ppc: add vmulh{su}w instructions
  fix the prototype of muls64/mulu64
  target/ppc: add vmulh{su}d instructions
  target/ppc: add vdiv{su}{wd} vmod{su}{wd} instructions

 include/qemu/host-utils.h           |  4 +-
 target/ppc/cpu.h                    |  4 +-
 target/ppc/helper.h                 | 13 ++++-
 target/ppc/int_helper.c             | 74 ++++++++++++++++++++++++-----
 target/ppc/translate.c              | 41 ++++++++++++++++
 target/ppc/translate/vmx-impl.inc.c | 26 +++++++++-
 target/ppc/translate/vmx-ops.inc.c  | 27 +++++++++--
 target/ppc/translate_init.inc.c     |  2 +-
 tcg/ppc/tcg-target.h                |  2 +
 tcg/ppc/tcg-target.inc.c            |  7 ++-
 10 files changed, 175 insertions(+), 25 deletions(-)

-- 
2.23.0


