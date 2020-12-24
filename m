Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659392E235D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 02:17:23 +0100 (CET)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksFFp-0002iV-Qm
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 20:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ksFCD-0001Uk-0f
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:13:37 -0500
Received: from mga06.intel.com ([134.134.136.31]:46595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ksFC8-0004bX-Gs
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 20:13:35 -0500
IronPort-SDR: 5HEgyUAHT4fMELkDt+kd6IIq0wgINjzUrknKC1ieFydUMWCQXHjI60A7/4kUbcj4iA6xw5caoe
 l9swyRkyqCdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="237651999"
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; d="scan'208";a="237651999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 17:13:16 -0800
IronPort-SDR: H7TypFyvLQeu58qjMBKN+vRmlT3Dun59SzM6gvZ7pa17UsGHDFQwpKxAZksOdQcUPAQeViZ5g9
 Gu8RYfGRxb7Q==
X-IronPort-AV: E=Sophos;i="5.78,443,1599548400"; d="scan'208";a="565580008"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 17:13:14 -0800
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 0/3] Bypass specific network traffic in COLO
Date: Thu, 24 Dec 2020 09:09:15 +0800
Message-Id: <20201224010918.19275-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, FROM_ADDR_WS=2.999,
 FROM_WSP_TRAIL=2.3, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Zhang Chen (3):
  qapi/net: Add new QMP command for COLO passthrough
  hmp-commands: Add new HMP command for COLO passthrough
  net/colo-compare: Add handler for passthrough connection

 hmp-commands.hx       | 26 +++++++++++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 20 ++++++++++++++++++
 net/colo-compare.c    | 49 +++++++++++++++++++++++++++++++++++++++++++
 net/colo-compare.h    |  2 ++
 net/net.c             | 39 ++++++++++++++++++++++++++++++++++
 qapi/net.json         | 46 ++++++++++++++++++++++++++++++++++++++++
 7 files changed, 184 insertions(+)

-- 
2.17.1


