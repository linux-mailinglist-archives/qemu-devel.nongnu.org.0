Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E6C3A7D82
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:47:11 +0200 (CEST)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7XC-0001v2-VE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lt7Uo-0007w2-AZ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:44:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:19451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lt7Uk-00067Q-JA
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:44:40 -0400
IronPort-SDR: hd3zMRAZF3ykIeJRgsvTg9l0rFuBm8Lr93VQz162Ya7KYK2HsmqmONsj6uTHqPyNn7266SMqJz
 sWvr/9zmtBNw==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="205790909"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="205790909"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:44:32 -0700
IronPort-SDR: KVg+TCZvoTlp4Fa5tqKRb32LKZ9oLVZ8MIBhBWBdKRi+oTtGe92Tj+85gPaoG8JJmkM796rBzA
 gB8l5T9fSdzg==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="450224063"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 04:44:29 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V8 0/6] Passthrough specific network traffic in COLO
Date: Tue, 15 Jun 2021 19:37:34 +0800
Message-Id: <20210615113740.2278015-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
  qapi/net: Add IPFlowSpec and QMP command for COLO passthrough
  util/qemu-sockets.c: Add inet_parse_base to handle
    InetSocketAddressBase
  hmp-commands: Add new HMP command for COLO passthrough
  net/colo-compare: Move data structure and define to .h file.
  net/colo-compare: Add passthrough list to CompareState
  net/net.c: Add handler for COLO passthrough connection

 hmp-commands.hx        |  26 +++++++
 include/monitor/hmp.h  |   2 +
 include/qemu/sockets.h |   1 +
 monitor/hmp-cmds.c     |  82 ++++++++++++++++++++
 net/colo-compare.c     | 160 +++++++++++++--------------------------
 net/colo-compare.h     |  98 ++++++++++++++++++++++++
 net/net.c              | 168 +++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |  74 ++++++++++++++++++
 util/qemu-sockets.c    |  14 ++++
 9 files changed, 516 insertions(+), 109 deletions(-)

-- 
2.25.1


