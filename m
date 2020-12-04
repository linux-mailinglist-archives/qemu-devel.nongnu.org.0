Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544B42CF750
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 00:08:58 +0100 (CET)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klKC9-0003It-6B
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 18:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klK9l-0002HW-Hk
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:29 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1klK9j-0004L1-B7
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 18:06:29 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4N3QVH092565
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=FppXVjYml4GZWEkhmQET+SVHkzUGqoG6Ie+ysZcPmis=;
 b=Vrx88SrRBqV0q6kboTBiRw9efZEkDiNBSiko3YbQBtni+uN2PwtE7bNX1lQjCOh88TKB
 Che6XYlhP3aZ5I8KXSgGj1kPCEGd7Cm7iegdjCFTrxfnUOpvftors0vLEsjaT7oOf+h+
 j0jr85m7n0NBuN6oOqu4Owf+vXMC+rYpPkVA2pJsym1zgYGjcWegL6qxaXP81EXvDN6Q
 xet1okChnt2DzDc7OHOjDcwP/tz5hHJ5CiGvCdD2Be0mW/b9q/R7zZ8V3d7Typr10pux
 YxGvuvDspbUrLqaYlYH2eKYvC7moKFhPX6u1i52/UW4SJrX4XdFyJCY+6//hdojPhR8W kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uq6m4hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 18:06:23 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4N4Xr3102676
 for <qemu-devel@nongnu.org>; Fri, 4 Dec 2020 18:06:23 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357uq6m4h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 18:06:23 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4N1bON023574;
 Fri, 4 Dec 2020 23:06:22 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3569xv1shh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 23:06:22 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4N6LIs25952640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 23:06:21 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C2086A04D;
 Fri,  4 Dec 2020 23:06:21 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7FDB6A054;
 Fri,  4 Dec 2020 23:06:20 +0000 (GMT)
Received: from Buonos-Thinkpad-X1.ibm.com (unknown [9.160.122.174])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 23:06:20 +0000 (GMT)
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] Add support for Control-Flow Integrity
Date: Fri,  4 Dec 2020 18:06:10 -0500
Message-Id: <20201204230615.2392-1-dbuono@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_13:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012040132
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds supports for Control-Flow Integrity checks
on indirect function calls.

Requires the use of clang, and link-time optimizations

Since it's been a month, and some of the patches are being
merged independently, I thought of rebasing, retesting
and sending an updated version. Also, added a documentation
in docs/devel to explain CFI and how to handle CFI-sensitive
code.

Changes in v4:
- Removed patches to avoid clang warnings, since they are
being merged independently and are not really necessary
for CFI
- Added documentation in docs/devel to explain how to
compile with CFI, and how to disable CFI for incompatible
functions

Changes in v3:

- clang 11+ warnings are now handled directly at the source,
instead of disabling specific warnings for the whole code.
Some more work may be needed here to polish the patch, I
would kindly ask for a review from the corresponding
maintainers
- Remove configure-time checks for toolchain compatibility
with LTO.
- the decorator to disable cfi checks on functions has
been renamed and moved to include/qemu/compiler.h
- configure-time checks for cfi support and dependencies
has been moved from configure to meson

Link to v3: https://www.mail-archive.com/qemu-devel@nongnu.org/msg757930.html
Link to v2: https://www.mail-archive.com/qemu-devel@nongnu.org/msg753675.html
Link to v1: https://www.mail-archive.com/qemu-devel@nongnu.org/msg718786.html

Daniele Buono (5):
  configure,meson: add option to enable LTO
  cfi: Initial support for cfi-icall in QEMU
  check-block: enable iotests with cfi-icall
  configure,meson: support Control-Flow Integrity
  docs: Add CFI Documentation

 accel/tcg/cpu-exec.c                  |  11 +++
 configure                             |  26 +++++
 docs/devel/control-flow-integrity.rst | 137 ++++++++++++++++++++++++++
 include/qemu/compiler.h               |  12 +++
 meson.build                           |  46 +++++++++
 meson_options.txt                     |   4 +
 plugins/core.c                        |  37 +++++++
 plugins/loader.c                      |   7 ++
 tcg/tci.c                             |   7 ++
 tests/check-block.sh                  |  18 ++--
 util/main-loop.c                      |  11 +++
 util/oslib-posix.c                    |  11 +++
 12 files changed, 320 insertions(+), 7 deletions(-)
 create mode 100644 docs/devel/control-flow-integrity.rst

-- 
2.17.1


