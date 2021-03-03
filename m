Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E7232B3F2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 05:25:01 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHJ4G-0001kD-Ny
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 23:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0X-0005B2-Cz
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:09 -0500
Received: from mga18.intel.com ([134.134.136.126]:42971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lHJ0U-000591-VN
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 23:21:09 -0500
IronPort-SDR: mWQbRSubToZcPDCubM0MUnUAfytPKu04TSdjGA+EJD6Vh4acquOVwKDdLPqKZMwfDOUE7MSiUD
 woFdToM6vxew==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174732185"
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="174732185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:20:59 -0800
IronPort-SDR: AC1Wnf46hw3hjwCnfS5Nmc90xsaZApCA//q0hTnndH0AfzDpf19Z6Hhy2vF323TiRDJFS/d+rK
 p6QYGpGw4pzg==
X-IronPort-AV: E=Sophos;i="5.81,218,1610438400"; d="scan'208";a="407059944"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 20:20:57 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH V2 0/7] Bypass specific network traffic in COLO
Date: Wed,  3 Mar 2021 12:15:32 +0800
Message-Id: <20210303041539.1032415-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=1.624,
 FROM_WSP_TRAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Zhang Chen <chen.zhang@intel.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Since the real user scenario does not need to monitor all traffic.
This series give user ability to bypass kinds of network stream.

  V2:
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
 net/colo-compare.c    | 131 +++++++----------------------------
 net/colo-compare.h    | 116 +++++++++++++++++++++++++++++++
 net/net.c             | 157 ++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json         |  96 ++++++++++++++++++++++++++
 7 files changed, 456 insertions(+), 106 deletions(-)

-- 
2.25.1


