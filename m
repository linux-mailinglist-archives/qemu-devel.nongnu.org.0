Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C533998BE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 05:55:18 +0200 (CEST)
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loeRx-0002G7-BS
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 23:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQN-0008Bq-3I
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:39 -0400
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185]:48971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1loeQL-0004R9-I3
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 23:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1622692411; bh=dL+zcZZiU/CnjMPQcQH05c+x5HsV2lQKbnc4gX3WvfA=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=qER24Qoo8OIRLm9pZ3LlykTDzrG2Aa5hX6tmHaLglKD5RsiEVAg64CcoQ8YJESeU+
 smJ6iSAH6sMmjOBV47SGhJ89uxhjiFPUkg/t7JTsuDFer0zC6nXi32aYNnFBkBTK3E
 pRYVPptHlbmpnmZlYL8KErJOp6bsPuirJpxZoyNLea5JFFsvz8FDGsD1zgordoTLbU
 W7Ga+T66MOf9AFe/rmOXh40Kk8iEFoK8YJ/ZnrIL7Xop1psONKgecSg8mCdATX3Aem
 Kqh6ZOq0KErVquOJ9MJpPRrGPWaY0M8AXjoOdIAMYwDQLdyk64bOoOEtvx70sC/IIu
 qAwrIPuiv52Qg==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id C30894A011E;
 Thu,  3 Jun 2021 03:53:30 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>
Subject: [PATCH 0/8] PALcode fixes required to run NetBSD/alpha.
Date: Wed,  2 Jun 2021 20:53:09 -0700
Message-Id: <20210603035317.6814-1-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-03=5F01:2021-06-02=5F03,2021-06-03=5F01,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106030024
Received-SPF: pass client-ip=17.58.23.185; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06011101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included here are a set of patches that fix issues in qemu-palcode needed
to run NetBSD/alpha under Qemu.  Some fix garden-variety bugs, some fix
deviations from the architecture specification or behavior of the SRM
console on real Alpha hardware.

Two of the changes (patch 6 and patch 7) also require other fixes in
Qemu itself, which will be submitted separately.  However, the changes
are fully compatible with existing Qemu alpha VMs because Linux does
not use the the SRM PCI interrupt mapping information (it has its own
tables for the system variations it supports) or the Console Terminal
Block in the HWRPB.

Jason Thorpe (8):
  Make qemu-palcode build environment standalone. NFC.
  Fix delivery of unaligned access exceptions.
  Fix initialization of the hwrpb.hwrpb.cpuid field.
  Make some PCI macros available to other files.  NFC.
  Fix incorrect initialization of PCI BARs.
  Provide interrupt mapping information in PCI config registers.
  Provide a Console Terminal Block in the HWRPB.
  Fixes for seconday CPU start-up.

 hwrpb.h       | 54 +++++++++++++++++++++++++++++++
 init.c        | 88 +++++++++++++++++++++++++++++++++++++++------------
 memcpy.c      |  2 +-
 memset.c      |  2 +-
 pal.S         | 15 ++++++---
 pci.c         | 31 +++++++++++++-----
 pci.h         |  5 +++
 printf.c      |  4 +--
 protos.h      | 30 +++++++++++++++---
 sys-clipper.h | 27 ++++++++++++++++
 vgaio.c       |  2 ++
 11 files changed, 218 insertions(+), 42 deletions(-)

-- 
2.30.2


