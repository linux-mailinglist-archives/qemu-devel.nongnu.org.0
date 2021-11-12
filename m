Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6A44E0BE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 04:22:42 +0100 (CET)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlN9F-0008CZ-2B
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 22:22:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mlN82-0005pU-4B
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:21:26 -0500
Received: from mga03.intel.com ([134.134.136.65]:4405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mlN7z-0005Tn-DO
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 22:21:25 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="233009076"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="233009076"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 19:21:19 -0800
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="504711448"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 19:21:16 -0800
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH for 7.0 V10 0/6] Add passthrough support to object with
 network processing function
Date: Fri, 12 Nov 2021 11:11:06 +0800
Message-Id: <20211112031112.9303-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
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

  V10:
    - Rebased on uptream.
    - Fixed typo and addressed Markus's comments.

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
                                                           


This series add passthrough support frame to object with network
processing function. The first object is colo-compare.

V3: Fix memory leak issue.

V2: Optimize HMP code from Dave's comment.


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
 monitor/hmp-cmds.c     |  63 +++++++++++++
 net/colo-compare.c     | 160 ++++++++++----------------------
 net/colo-compare.h     |  98 ++++++++++++++++++++
 net/net.c              | 205 +++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |  73 +++++++++++++++
 util/qemu-sockets.c    |  14 +++
 9 files changed, 533 insertions(+), 109 deletions(-)

-- 
2.25.1


