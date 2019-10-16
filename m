Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511ADD8FA8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 13:36:08 +0200 (CEST)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKhb5-0006kf-CX
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 07:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1iKhUA-00010C-LV
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:28:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1iKhU8-0005Oi-QJ
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:28:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:55307)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1iKhU8-0005Ng-I3
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:28:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 04:28:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; d="scan'208";a="208393358"
Received: from unknown (HELO localhost.localdomain) ([10.239.13.19])
 by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2019 04:28:47 -0700
From: Zhang Chen <chen.zhang@intel.com >
To: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>
Subject: [RFC PATCH 0/4] Introduce Advanced Watch Dog module
Date: Wed, 16 Oct 2019 19:22:05 +0800
Message-Id: <20191016112209.9024-1-chen.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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

Advanced Watch Dog is an universal monitoring module on VMM side, it can be used to detect network down(VMM to guest, VMM to VMM, VMM to another remote server) and do previously set operation.
for example: send message to admin, notify another VMM, send qmp command to qemu do some operation like restart the VM, build VMM heartbeat system, etc.
It make user have basic VM/Host network monitoring tools and basic false tolerance and recovery solution.

Demo usage(for COLO heartbeat):

In primary node:

-chardev socket,id=h1,host=3.3.3.3,port=9009,server,nowait
-chardev socket,id=heartbeat0,host=3.3.3.3,port=4445
-object iothread,id=iothread2
-object advanced-watchdog,id=heart1,server=on,awd_node=h1,notification_node=heartbeat0,opt_script=colo_opt_script_path,iothread=iothread1,pulse_interval=1000,timeout=5000

In secondary node:

-monitor tcp::4445,server,nowait 
-chardev socket,id=h1,host=3.3.3.3,port=9009,reconnect=1
-chardev socket,id=heart1,host=3.3.3.8,port=4445
-object iothread,id=iothread1
-object advanced-watchdog,id=heart1,server=off,awd_node=h1,notification_node=heart1,opt_script=colo_secondary_opt_script,iothread=iothread1,timeout=10000


Zhang Chen (4):
  net/awd.c: Introduce Advanced Watch Dog module framework
  net/awd.c: Initailize input/output chardev
  net/awd.c: Load advanced watch dog worker thread job
  vl.c: Make Advanced Watch Dog delayed initialization

 net/Makefile.objs |   1 +
 net/awd.c         | 486 ++++++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx   |   6 +
 vl.c              |   7 +
 4 files changed, 500 insertions(+)
 create mode 100644 net/awd.c

-- 
2.17.1


