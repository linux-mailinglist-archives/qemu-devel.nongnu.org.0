Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06433CD02D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:10:44 +0200 (CEST)
Received: from localhost ([::1]:49822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PIR-000467-M9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5PGX-0001Wt-NV
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:08:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:20929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m5PGU-0004GK-Ln
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:08:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="296581711"
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="296581711"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:08:40 -0700
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; d="scan'208";a="499842089"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 02:08:38 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL V3 for 6.2 0/6] COLO-Proxy patches for 2021-06-25 
Date: Mon, 19 Jul 2021 17:00:45 +0800
Message-Id: <20210719090051.3824672-1-chen.zhang@intel.com>
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Zhang Chen <chen.zhang@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

Please help to queue COLO-proxy patches to net branch.

Thanks
Chen


The following changes since commit fd79f89c76c8e2f409dd9db5d7a367b1f64b6dc6:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210718' into staging (2021-07-18 13:46:39 +0100)

are available in the Git repository at:

  https://github.com/zhangckid/qemu.git master-colo-21jun25-pull-request-v3

for you to fetch changes up to 91176794e3a72c74b01e149638ac1a7e2dee73fc:

  net/net.c: Add handler for passthrough filter command (2021-07-19 16:50:44 +0800)


----------------------------------------------------------------

This series add passthrough support frame to object with network
processing function. The first object is colo-compare.

V3: Fix memory leak issue.

V2: Optimize HMP code from Dave's comment.

----------------------------------------------------------------
Zhang Chen (6):
      qapi/net: Add IPFlowSpec and QMP command for filter passthrough
      util/qemu-sockets.c: Add inet_parse_base to handle InetSocketAddressBase
      hmp-commands: Add new HMP command for filter passthrough
      net/colo-compare: Move data structure and define to .h file.
      net/colo-compare: Add passthrough list to CompareState
      net/net.c: Add handler for passthrough filter command

 hmp-commands.hx        |  26 ++++++++
 include/monitor/hmp.h  |   2 +
 include/qemu/sockets.h |   1 +
 monitor/hmp-cmds.c     |  63 +++++++++++++++++++
 net/colo-compare.c     | 160 ++++++++++++++++--------------------------------
 net/colo-compare.h     |  98 ++++++++++++++++++++++++++++++
 net/net.c              | 205 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json          |  78 ++++++++++++++++++++++++
 util/qemu-sockets.c    |  14 +++++
 9 files changed, 538 insertions(+), 109 deletions(-)

-- 
2.25.1


