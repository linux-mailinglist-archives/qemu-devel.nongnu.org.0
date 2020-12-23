Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B22E2259
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:14:36 +0100 (CET)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCOx-00068v-Ab
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCLg-0004IN-B4
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ksCLd-0001fU-AH
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608761467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gWOkpTKcmD/3GMyjOFNC2SOmUz4EBHMKTYJMgShgS28=;
 b=ePjFSn5eN/zhgQDBBLCOPQCZ2Kt8AQF0v/CaLL9bASHk1WILyAHSMb8MWYrLFbpt7F1wml
 AlVnHwcwT4blgBqr7WPcDFSxTOK39c9kkcOpYRk+x+NjONacTaMTN2ubDvSmoYyPCMLgo5
 stZZT7wJ1612WQpsYZV8UzLRCeYYjg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-ENQnfTGPNHWObcr5vLokMQ-1; Wed, 23 Dec 2020 17:11:04 -0500
X-MC-Unique: ENQnfTGPNHWObcr5vLokMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53BEC1005D4E
 for <qemu-devel@nongnu.org>; Wed, 23 Dec 2020 22:11:03 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-9.phx2.redhat.com [10.3.113.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 113EB5D739;
 Wed, 23 Dec 2020 22:11:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] Common macros for QAPI list growth
Date: Wed, 23 Dec 2020 16:10:55 -0600
Message-Id: <20201223221102.390740-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I worked on rebasing this while not checking my emails, and now that
I'm writing it up, I see that Markus already has incorporated earlier
patches in the v2 series into his tree.  So I may have to rebase yet
again, but it's at least time for me to get this on list again.

v2 was here:
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03457.html

Since then: address review comments, use the name 'tail' in more
places, rebase to master

Eric Blake (7):
  net: Clarify early exit condition
  rocker: Revamp fp_port_get_info
  migration: Refactor migrate_cap_add
  qapi: Use QAPI_LIST_PREPEND() where possible
  qapi: Introduce QAPI_LIST_APPEND
  qapi: Use QAPI_LIST_APPEND in trivial cases
  qapi: More complex uses of QAPI_LIST_APPEND

 docs/devel/writing-qmp-commands.txt |  12 +-
 hw/net/rocker/rocker_fp.h           |   2 +-
 include/qapi/util.h                 |  13 +++
 backends/hostmem.c                  |  10 +-
 block/dirty-bitmap.c                |   8 +-
 block/export/export.c               |   7 +-
 block/gluster.c                     |  17 +--
 block/qapi.c                        |  44 ++-----
 block/qcow2-bitmap.c                |  15 +--
 block/vmdk.c                        |   9 +-
 blockdev.c                          |  13 +--
 chardev/char.c                      |  20 ++--
 crypto/block-luks.c                 |   9 +-
 dump/dump.c                         |  22 +---
 hw/acpi/cpu.c                       |   8 +-
 hw/acpi/memory_hotplug.c            |   9 +-
 hw/core/machine-qmp-cmds.c          | 131 +++++++++------------
 hw/core/machine.c                   |  11 +-
 hw/mem/memory-device.c              |  12 +-
 hw/net/rocker/rocker.c              |   8 +-
 hw/net/rocker/rocker_fp.c           |  17 +--
 hw/net/rocker/rocker_of_dpa.c       |  20 +---
 hw/net/virtio-net.c                 |  21 ++--
 hw/pci/pci.c                        |  60 +++-------
 iothread.c                          |  12 +-
 job-qmp.c                           |  13 +--
 migration/migration.c               |  56 ++++-----
 migration/postcopy-ram.c            |   7 +-
 monitor/hmp-cmds.c                  |  48 ++++----
 monitor/misc.c                      |  25 ++--
 monitor/qmp-cmds-control.c          |  19 ++-
 net/net.c                           |  15 +--
 qemu-img.c                          |  13 +--
 qga/commands-posix-ssh.c            |   7 +-
 qga/commands-posix.c                | 172 +++++++++-------------------
 qga/commands-win32.c                | 131 +++++++--------------
 qga/commands.c                      |   6 +-
 qom/qom-qmp-cmds.c                  |  29 ++---
 scsi/pr-manager.c                   |  10 +-
 softmmu/tpm.c                       |  38 +-----
 target/arm/helper.c                 |   6 +-
 target/arm/monitor.c                |  13 +--
 target/i386/cpu.c                   |  29 ++---
 target/mips/cpu.c                   |   6 +-
 target/s390x/cpu_models.c           |  12 +-
 tests/test-clone-visitor.c          |   7 +-
 tests/test-qobject-output-visitor.c | 126 +++++++-------------
 tests/test-string-output-visitor.c  |   6 +-
 tests/test-visitor-serialization.c  | 113 +++---------------
 trace/qmp.c                         |  22 ++--
 ui/input.c                          |  16 ++-
 ui/spice-core.c                     |  27 ++---
 ui/vnc.c                            |  21 +---
 util/qemu-config.c                  |  14 +--
 target/ppc/translate_init.c.inc     |  12 +-
 55 files changed, 478 insertions(+), 1051 deletions(-)

-- 
2.29.2


