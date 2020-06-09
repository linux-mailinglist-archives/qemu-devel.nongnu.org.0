Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5189B1F451B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 20:12:19 +0200 (CEST)
Received: from localhost ([::1]:35520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiijS-00082E-Ba
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 14:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jiihn-0006bf-NH; Tue, 09 Jun 2020 14:10:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:20082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1jiihk-0003Tr-Tc; Tue, 09 Jun 2020 14:10:35 -0400
IronPort-SDR: rgSGiJSQb3lCSwQ+PDQgBZ45XA8l9fgqRPDjeAQMrIK7mZzAU5Ja4AwwDWs839QzBnKKi6aW3q
 x2JnlJF5ZvBw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 11:10:30 -0700
IronPort-SDR: uF/OldnBkkhEpu+VUcac+lVz022PM4h3vIoogB2y3KJ8DXaaGk06mwnF1XJbR2p6YlDP23y1UY
 y+J/B94K/JNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,492,1583222400"; d="scan'208";a="259883676"
Received: from unknown (HELO localhost.ch.intel.com) ([10.2.28.117])
 by orsmga007.jf.intel.com with ESMTP; 09 Jun 2020 11:10:29 -0700
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
To: kbusch@kernel.org,
	kwolf@redhat.com,
	mreitz@redhat.com
Subject: [PATCH v2] nvme: allow cmb and pmr emulation on same device
Date: Tue,  9 Jun 2020 11:11:28 -0700
Message-Id: <20200609181130.20936-1-andrzej.jakowski@linux.intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=andrzej.jakowski@linux.intel.com; helo=mga04.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 14:10:30
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series does following:
 - Fixes problem where CMBS bit was not set in controller capabilities
   register, so support for CMB was not correctly advertised to guest.
   This is resend of patch that has been submitted and reviewed by
   Klaus [1]
 - Introduces BAR4 sharing between MSI-X vectors and CMB. This allows
   to have CMB and PMR emulated on the same device. This extension
   was indicated by Keith [2]

v2:
 - rebase on Kevin's latest block branch (Klaus [3])
 - improved comments section (Klaus [3])
 - simplified calculation of BAR4 size (Klaus [4])

v1:
 - initial push of the patch

[1]: https://lore.kernel.org/qemu-devel/20200408055607.g2ii7gwqbnv6cd3w@apples.localdomain/
[2]: https://lore.kernel.org/qemu-devel/20200330165518.GA8234@redsun51.ssa.fujisawa.hgst.com/
[3]: https://lore.kernel.org/qemu-devel/20200605181043.28782-1-andrzej.jakowski@linux.intel.com/a



