Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A4360768
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:45:40 +0200 (CEST)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzVD-0005Ib-3O
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzRC-0000sq-Tw
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:30 -0400
Received: from mga06.intel.com ([134.134.136.31]:54482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzR6-00029d-3C
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:41:30 -0400
IronPort-SDR: HG8pHytdIVQZagdozVgRxwJB0z1O0wo/iQC6qN0T9jUnCu6n9qqbiRsOg3h4k2wyqbZpIPedps
 ep0YpbJRIScg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="256146904"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="256146904"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:14 -0700
IronPort-SDR: CNrOeaVKlN3ivqmxBONB7SslU2+8CnDvA4pUtu8SJCppK/6+vhK6HojXGzBSuqYgriZ87mX8OK
 lB6mDz9WuOuA==
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="425134918"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:41:11 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V5 0/6] Passthrough specific network traffic in COLO
Date: Thu, 15 Apr 2021 18:35:09 +0800
Message-Id: <20210415103515.1251386-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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
 monitor/hmp-cmds.c     |  84 +++++++++++++++++++++
 net/colo-compare.c     | 163 +++++++++++-----------------------------
 net/colo-compare.h     | 117 +++++++++++++++++++++++++++++
 net/net.c              | 164 +++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |  98 ++++++++++++++++++++++++
 util/qemu-sockets.c    |  14 ++++
 9 files changed, 549 insertions(+), 120 deletions(-)

-- 
2.25.1


