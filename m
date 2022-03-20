Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6814E1E01
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 22:40:45 +0100 (CET)
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3I3-0008Mx-U4
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 17:40:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Gm-0007Bh-PM
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:39:25 -0400
Received: from smtp96.iad3a.emailsrvr.com ([173.203.187.96]:42119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nW3Gl-0003hH-BH
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 17:39:24 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp21.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id ACC1221EC1; 
 Sun, 20 Mar 2022 17:38:58 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qga: Implement guest-network-get-interfaces for Solaris
Date: Sun, 20 Mar 2022 16:38:40 -0500
Message-Id: <20220320213843.4544-1-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
X-Classification-ID: 24b37eb1-89c9-490c-a9ff-4b3c6c12b24b-1-1
Received-SPF: pass client-ip=173.203.187.96;
 envelope-from=adeason@sinenomine.net; helo=smtp96.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This implements the guest agent guest-network-get-interfaces command on
Solaris. Solaris provides a getifaddrs() that's very similar to the Linux one,
so the implementation is mostly the same.

Andrew Deason (3):
  qga/commands-posix: Use getifaddrs when available
  qga/commands-posix: Fix iface hw address detection
  qga/commands-posix: Fix listing ifaces for Solaris

 meson.build          |   1 +
 qga/commands-posix.c | 488 +++++++++++++++++++++++++++------------------------
 2 files changed, 260 insertions(+), 229 deletions(-)

-- 
2.11.0


