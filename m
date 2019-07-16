Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE46A2AF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 09:11:24 +0200 (CEST)
Received: from localhost ([::1]:45778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnHcR-0006U6-Qb
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 03:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41662)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hnHcG-00065g-97
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:11:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hnHcC-0001JL-PG
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:11:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:16826)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hnHc9-00018Y-QZ
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:11:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 00:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,496,1557212400"; d="scan'208";a="161338225"
Received: from joy-desktop.sh.intel.com ([10.239.13.126])
 by orsmga008.jf.intel.com with ESMTP; 16 Jul 2019 00:10:53 -0700
From: Yan Zhao <yan.y.zhao@intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 15:10:42 +0800
Message-Id: <1563261042-15974-1-git-send-email-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH] migration: notify runstate immediately before
 vcpu stops
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
Cc: kevin.tian@intel.com, cohuck@redhat.com, Yan Zhao <yan.y.zhao@intel.com>,
 quintela@redhat.com, crosthwaite.peter@gmail.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

for some devices to do live migration, it is needed to do something
immediately before vcpu stops. add a notification here.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
---
 cpus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cpus.c b/cpus.c
index b09b702..d5d4abe 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1068,6 +1068,7 @@ static int do_vm_stop(RunState state, bool send_stop)
     int ret = 0;
 
     if (runstate_is_running()) {
+        vm_state_notify(1, state);
         cpu_disable_ticks();
         pause_all_vcpus();
         runstate_set(state);
-- 
2.7.4


