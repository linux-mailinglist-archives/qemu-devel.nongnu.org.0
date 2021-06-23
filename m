Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0953B172B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:46:50 +0200 (CEST)
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvzT7-0007Vu-Ns
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRa-0005QL-U1
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:12499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lvzRY-0007B8-Cm
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:45:14 -0400
IronPort-SDR: HLwLMxTPd8R1eneZDJBIiOByanm3B0zZ2QpMOjknPfD5TbSYd/AE7XVl8U0bQJc1Shdvdju2Wj
 pJoNkhDg76IQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="194369569"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="194369569"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:45:02 -0700
IronPort-SDR: DIcrhz0XWVl+//8oJv4jAxIGWyXVGfHnmeWK7YHAlq7Gy4ZAKAJAhFXvcZ2S34U3Lcl+eRD6fM
 ZMpPsAum0lJw==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="487242678"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 02:44:59 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V9 0/6] Add passthrough support to object with network
 processing function
Date: Wed, 23 Jun 2021 17:37:51 +0800
Message-Id: <20210623093757.2683226-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series add passthrough support frame to object with network
processing function. The first object is colo-compare.
Current colo-compare and net-filters attached on chardev or netdev.
It still need more fine-grained network control based on IPFlowSpec.
Due to some real user scenarios don't need to monitor all traffic.
And qemu net-filter also need function to more detailed flow control.
This series give user ability to passthrough kinds of COLO network stream.

For example, windows guest user want to enable windows remote desktop
to touch guest(UDP/TCP 3389), This case use UDP and TCP mixed, and the
tcp part payload always different caused by real desktop display
data(for guest time/ mouse display....).

Another case is some real user application will actively transmit information
include guest time part, primary guest send data with time 10:01.000,
At the same time secondary guest send data with time 10:01.001,
it will always trigger COLO checkpoint(live migrate) to drop guest performance.

  V9:
    - Change the qmp command to passthrough-filter-add/del.
    - Remove the colo* tag function in net.c.
    - Fix some comment issues.
    - Fix some bugs.

  V8:
    - Add more comments about QAPI IPFlowSpec.
    - Fix grammar issue on colo-passthrough-add/delete.
    - Rebased on upstream.

  V7:
    - Keep some data structure stay in .c (patch 4/6).
    - Fix mutex init issue (patch 5/6).
    - Make the IPFlowSpec 'protocol' field optional (patch 1/6).
    - Add compare_passthrough_find function in net.c (patch 6/6).

  V6:
    - Change QAPI IPFlowSpec protocol from enum to str.
    - Use getprotobyname to handle the protocols.
    - Optimize code in net.

  V5:
    - Squash original 1-3 QAPI patches together.
    - Rename some data structures to avoid misunderstanding.
    - Reuse InetSocketAddressBase in IPFlowSpec.
    - Add new function in util/qemu-sockets.c to parse
      InetSocketAddressBase.
    - Update HMP command define to reuse current code.
    - Add more comments.

  V4:
    - Fix QAPI code conflict for V6.0 merged patches.
    - Note this feature for V6.1.



Zhang Chen (6):
  qapi/net: Add IPFlowSpec and QMP command for filter passthrough
  util/qemu-sockets.c: Add inet_parse_base to handle
    InetSocketAddressBase
  hmp-commands: Add new HMP command for filter passthrough
  net/colo-compare: Move data structure and define to .h file.
  net/colo-compare: Add passthrough list to CompareState
  net/net.c: Add handler for passthrough filter command

 hmp-commands.hx        |  26 ++++++
 include/monitor/hmp.h  |   2 +
 include/qemu/sockets.h |   1 +
 monitor/hmp-cmds.c     |  76 +++++++++++++++
 net/colo-compare.c     | 160 ++++++++++----------------------
 net/colo-compare.h     |  98 ++++++++++++++++++++
 net/net.c              | 205 +++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |  78 ++++++++++++++++
 util/qemu-sockets.c    |  14 +++
 9 files changed, 551 insertions(+), 109 deletions(-)

-- 
2.25.1


