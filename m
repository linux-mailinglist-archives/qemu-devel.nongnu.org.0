Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EE3413F4
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 05:03:20 +0100 (CET)
Received: from localhost ([::1]:55422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN6M2-0008VA-PI
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 00:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jf-0006sf-UL
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:00:51 -0400
Received: from mga18.intel.com ([134.134.136.126]:65152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lN6Jd-0004In-Gg
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 00:00:51 -0400
IronPort-SDR: oXF6B7x/eOxLAmPBQz2WXFoSxvHaKAW7qeIlK3ZZMjhUc02mSSxARNAW3BDLwrwCr+F2+ZVsPu
 gmTqyVV2HeFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="177409901"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="177409901"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:42 -0700
IronPort-SDR: qfVWMIyecR2dyLMaqPp551XrpV54UYmUVmNmQkklPZwjXPkFkwAGyHz6Eke0UGVGepFnrPEQZa
 CDFBrwgXEOlg==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606456607"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 21:00:40 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: [PATCH V4 0/7] Bypass specific network traffic in COLO
Date: Fri, 19 Mar 2021 11:55:01 +0800
Message-Id: <20210319035508.113741-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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
This series give user ability to bypass kinds of COLO network stream.

For example, windows guest user want to enable windows remote desktop
to touch guest(UDP/TCP 3389), This case use UDP and TCP mixed, and the
tcp part payload always different caused by real desktop display
data(for guest time/ mouse display....).

Another case is some real user application will actively transmit information
include guest time part, primary guest send data with time 10:01.000,
At the same time secondary guest send data with time 10:01.001,
it will always trigger COLO checkpoint(live migrate) to drop guest performance.

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


Zhang Chen (7):
  qapi/net.json: Add IP_PROTOCOL definition
  qapi/net.json: Add L4_Connection definition
  qapi/net: Add new QMP command for COLO passthrough
  hmp-commands: Add new HMP command for COLO passthrough
  net/colo-compare: Move data structure and define to .h file.
  net/colo-compare: Add passthrough list to CompareState
  net/net.c: Add handler for COLO passthrough connection

 hmp-commands.hx       |  26 +++++++
 include/monitor/hmp.h |   2 +
 monitor/hmp-cmds.c    |  34 +++++++++
 net/colo-compare.c    | 135 ++++++++--------------------------
 net/colo-compare.h    | 117 ++++++++++++++++++++++++++++++
 net/net.c             | 163 ++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json         |  97 +++++++++++++++++++++++++
 7 files changed, 468 insertions(+), 106 deletions(-)

-- 
2.25.1


