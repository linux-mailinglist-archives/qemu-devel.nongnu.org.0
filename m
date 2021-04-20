Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D2365C14
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 17:24:17 +0200 (CEST)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYsEa-0006pB-JJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 11:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCO-0005dw-9j
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:00 -0400
Received: from mga05.intel.com ([192.55.52.43]:37546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lYsCK-0004Sd-Rm
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 11:22:00 -0400
IronPort-SDR: 7dXe3/MunzsUoAngu+QXLNQo260dT7+BGCq7T0OZqp6kHsaBxIsSGKobM5M1/PIdp13ONWgk0O
 PitF6mDRzfTQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="280854197"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="280854197"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:21:53 -0700
IronPort-SDR: 0+Wak8ZCWzZUs5L3SR1NKjlTpYqZpfppWDwVw8SBODYbcPuf7NQaN3OB4NSfSFOMdYA6jypU4q
 gqDLwfg+wTpw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="523846676"
Received: from unknown (HELO tkid-nvme.lan) ([10.239.13.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 08:21:50 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V6 0/6] Passthrough specific network traffic in COLO
Date: Tue, 20 Apr 2021 23:15:31 +0800
Message-Id: <20210420151537.64360-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

  V3:
    - Add COLO passthrough list lock.
    - Add usage demo and more comments.

  V2:
    - Add the n-tuple support.
    - Add some qapi definitions.
    - Support multi colo-compare objects.
    - Support setup each rules for each objects individually.
    - Clean up COLO compare definition to .h file.
    - Rebase HMP command for stable tree.
    - Add redundant rules check.


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
 net/colo-compare.c     | 162 +++++++++++-----------------------------
 net/colo-compare.h     | 118 +++++++++++++++++++++++++++++
 net/net.c              | 166 +++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |  68 +++++++++++++++++
 util/qemu-sockets.c    |  14 ++++
 9 files changed, 519 insertions(+), 120 deletions(-)

-- 
2.25.1


