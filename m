Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D18D43B9FC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:51:23 +0200 (CEST)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRXd-0008JC-Bb
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRAB-0007rN-Nb
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:09 -0400
Received: from mga11.intel.com ([192.55.52.93]:17186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mfRA8-0007AP-1v
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:27:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="227438567"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="227438567"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="497480947"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 11:26:49 -0700
From: Zhang Chen <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH V4 0/3] net/filter: Optimize filters vnet_hdr support
Date: Wed, 27 Oct 2021 02:17:27 +0800
Message-Id: <20211026181730.3102184-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
 helo=mga11.intel.com
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
Cc: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series make filters and colo-compare module support vnet_hdr by
default. And also support -device non-virtio-net(like e1000.) at the same time.
It can adapt -device automatically to avoid wrong setting between
different filters when enable/disable virtio-net-pci. So no need to keep the
"vnet_hdr_support" flag in filter's property. 

Optimize the filter transfer protocol from:
1.size -----> 2.real network payload.
to:
1.size -----> 2.vnet_hdr_len. -----> 3.real network payload.

When receiving node get the network packet, it will compare with
the local vnet_hdr_len. If they are not the same, report a error.
because this kind of packet cannot be correctly parsed by receiving
node. For the colo-compare, it need to compare whether the two sides
vnet_hdr_len are equal.


v4:
    Rewrite patches to impliment it in filter transfer protocol payload.
    Remove filters and colo-compare's "vnet_hdr_support" flag.

v3:
    Fix some typos.
    Rebased for Qemu 6.2.

v2:
    Detect virtio-net driver and apply vnet_hdr_support
    automatically. (Jason)

Zhang Chen (3):
  net/filter: Remove vnet_hdr from filter-mirror and filter-redirector
  net/filter: Remove vnet_hdr from filter-rewriter
  net/colo-compare.c: Remove vnet_hdr and check in payload from
    colo-compare

 net/colo-compare.c    | 41 +++++++-------------
 net/filter-mirror.c   | 88 ++++++++++---------------------------------
 net/filter-rewriter.c | 26 +------------
 qemu-options.hx       | 25 ++++++------
 4 files changed, 45 insertions(+), 135 deletions(-)

-- 
2.25.1


