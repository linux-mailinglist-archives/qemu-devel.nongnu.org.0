Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ECB50018A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 00:06:20 +0200 (CEST)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nel7x-0000AL-Rh
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 18:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nel2Z-0001Aq-3j
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 18:00:43 -0400
Received: from smtp125.ord1d.emailsrvr.com ([184.106.54.125]:59229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nel2X-0004KC-Ad
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 18:00:42 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp8.relay.ord1d.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 410A5C01A3; 
 Wed, 13 Apr 2022 18:00:14 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] qga: Implement shutdown/network-get-interfaces on
 Solaris
Date: Wed, 13 Apr 2022 17:00:02 -0500
Message-Id: <20220413220007.14467-1-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
X-Classification-ID: 5647c629-c4e4-4626-ae9f-55e4ffbba697-1-1
Received-SPF: pass client-ip=184.106.54.125;
 envelope-from=adeason@sinenomine.net; helo=smtp125.ord1d.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, Andrew Deason <adeason@sinenomine.net>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This implements the guest agent commands guest-network-get-interfaces and
guest-shutdown on Solaris. The implementation for these on Solaris is very
similar as on Linux, since both platforms have a similar getifaddrs() and a
'shutdown' command.

Changes since v1:
- Add debug messages for failing to get network iface stats
- Add implementation for 'guest-shutdown'

Andrew Deason (5):
  qga/commands-posix: Use getifaddrs when available
  qga/commands-posix: Fix iface hw address detection
  qga/commands-posix: Fix listing ifaces for Solaris
  qga/commands-posix: Log all net stats failures
  qga/commands-posix: 'guest-shutdown' for Solaris

 meson.build          |   1 +
 qga/commands-posix.c | 513 ++++++++++++++++++++++++++++-----------------------
 2 files changed, 282 insertions(+), 232 deletions(-)

-- 
2.11.0


