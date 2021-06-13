Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5263A5A92
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 23:17:34 +0200 (CEST)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsXU5-0006he-A9
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 17:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXSk-0005CF-7c
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:10 -0400
Received: from mr85p00im-ztdg06021101.me.com ([17.58.23.180]:54319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thorpej@me.com>) id 1lsXSi-00017K-KE
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 17:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1623618967; bh=2tKfRPFAteLev1x5GP/ILSK9OIseIfvQWSCHpPHYx7E=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=j0KxbSnGf4TbhPEsh2oBJBIMNARdLNySU069hFzLPSPza2RSq7xizVuAtM7LVg8Ol
 +P+AZJqxJsd5FSTi2lr43UoreIUu6/JBTe6HkGcxg1Irl7ZtNtBO6E5lrf+aU+VYhF
 zc2bk5Mq+K0iOmWScBqxW+XzegH18JtTJHoMbHKaEim9JDO/jYlGJ+MSSYJdKXe9ar
 MJiK495Dnvqu6VjxxqNhkcLiQlouogfZXNyZXnTZqDvCKoc17TSqZQf6qIWGlq0ZJ3
 yOJbbKyRtQhb1VqCeQJWC/7mQvtoXx+uhQABxtaB306DDkdgRzwI4YN3zGd/yIq8vM
 aJXueI8Uk+aVQ==
Received: from the-ripe-vessel.ktnet (c-67-180-181-196.hsd1.ca.comcast.net
 [67.180.181.196])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id 144903400D8;
 Sun, 13 Jun 2021 21:16:06 +0000 (UTC)
From: Jason Thorpe <thorpej@me.com>
To: qemu-devel@nongnu.org
Cc: Jason Thorpe <thorpej@me.com>,
	richard.henderson@linaro.org
Subject: [PATCH 0/4] Emulator fixes to enable running NetBSD/alpha
Date: Sun, 13 Jun 2021 14:15:45 -0700
Message-Id: <20210613211549.18094-1-thorpej@me.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.761,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-06-13=5F09:2021-06-11=5F06,2021-06-13=5F09,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=899 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2106130151
Received-SPF: pass client-ip=17.58.23.180; envelope-from=thorpej@me.com;
 helo=mr85p00im-ztdg06021101.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following are a set of fixes to device and system emulation that
allow NetBSD/alpha to run in qemu-system-alpha.

The first change fixes behavior in the mc146818rtc emulation to more
accurately reflect how the real hardware vis a vis the PF status bit
(specifically, that it is independent of the PIE control bit).  The
behavior of PF now matches the data sheet for the part.  This documented
behavior is relied upon by NetBSD/alpha to calibrate some timing loops.

The next two fix up a couple of aspects of the emulated device topology
for the "Clipper" system emulation.

The fourth passes console configuration information to the PALcode
at start-up, which in turn will reflect this information in the
Console Terminal Block to the guest operating system, and relies
on a corresponding PALcode change, although older PALcode will still
work if the "-nographics" option is not specified.

Jason Thorpe (4):
  mc146818rtc: Make PF independent of PIE
  alpha: Set minimum PCI device ID to 1 to match Clipper IRQ mappings.
  alpha: Provide a PCI-ISA bridge device node for guest OS's that expect
    it
  alpha: Provide console information to the PALcode at start-up.

 hw/alpha/alpha_sys.h |   2 +-
 hw/alpha/dp264.c     |  16 +++++-
 hw/alpha/typhoon.c   | 116 +++++++++++++++++++++++++++++++++++++++++--
 hw/rtc/mc146818rtc.c |   4 --
 4 files changed, 127 insertions(+), 11 deletions(-)

-- 
2.30.2


