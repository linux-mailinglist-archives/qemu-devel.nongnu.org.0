Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FC72B13B8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:15:40 +0100 (CET)
Received: from localhost ([::1]:52064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNgh-00033B-1t
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNey-0001h6-2i
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:13:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kdNeu-00035v-SL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 20:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605230027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=swMnZ4Asvjj/WudrxKq08Jyj0H6yYOvlLjmLkPnrnxM=;
 b=O/0o2zjo4HYbYgOa3JCXHvyf9atE3H3tlNJuG+CN+x+Yu+/1RiQc6ZRpVgqGAkiCcKEpSy
 fTTqmgDO72qjZCtF6dBJ+1f2/2KnroqBNVWhikygGr/xHJFPvEqjHBlO+9vhIXtfQtowhI
 WrbtfYPo6OfNZw2tMdKyp5pTJrKOm5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-SG4b9qNxOzy25rPSH0_iRw-1; Thu, 12 Nov 2020 20:13:44 -0500
X-MC-Unique: SG4b9qNxOzy25rPSH0_iRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 540531842154
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 01:13:43 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-51.phx2.redhat.com [10.3.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35FB719C59;
 Fri, 13 Nov 2020 01:13:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] Common macros for QAPI list growth
Date: Thu, 12 Nov 2020 19:13:33 -0600
Message-Id: <20201113011340.463563-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

v1, as such, was here:
https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg08003.html
(v6 11/11 qapi: Use QAPI_LIST_ADD() where possible)

since then, I've rebased that patch (upstream went with PREPEND
instead of ADD), split things out for easier review, added
QAPI_LIST_APPEND, caught a lot more places that can use PREPEND, and
even fixed a years-old memory leak that might be worth having in 5.2.
But patches 2-7 are 6.0 material.

Eric Blake (7):
  net: Fix memory leak on error
  rocker: Revamp fp_port_get_info
  migration: Refactor migrate_cap_add
  qapi: Use QAPI_LIST_PREPEND() where possible
  qapi: Introduce QAPI_LIST_APPEND
  qapi: Use QAPI_LIST_APPEND in trivial cases
  qapi: More complex uses of QAPI_LIST_APPEND

 docs/devel/writing-qmp-commands.txt |  12 +--
 hw/net/rocker/rocker_fp.h           |   2 +-
 include/qapi/util.h                 |  13 +++
 backends/hostmem.c                  |   8 +-
 block/dirty-bitmap.c                |   6 +-
 block/export/export.c               |   5 +-
 block/gluster.c                     |  17 +--
 block/qapi.c                        |  40 ++-----
 block/qcow2-bitmap.c                |  11 +-
 block/vmdk.c                        |   5 +-
 blockdev.c                          |  11 +-
 chardev/char.c                      |  20 ++--
 crypto/block-luks.c                 |   9 +-
 dump/dump.c                         |  22 ++--
 hw/acpi/cpu.c                       |   6 +-
 hw/acpi/memory_hotplug.c            |   7 +-
 hw/core/machine-qmp-cmds.c          | 131 +++++++++--------------
 hw/core/machine.c                   |  11 +-
 hw/mem/memory-device.c              |  12 +--
 hw/net/rocker/rocker.c              |   8 +-
 hw/net/rocker/rocker_fp.c           |  17 +--
 hw/net/rocker/rocker_of_dpa.c       |  20 +---
 hw/net/virtio-net.c                 |  21 ++--
 hw/pci/pci.c                        |  60 ++++-------
 iothread.c                          |   8 +-
 job-qmp.c                           |  11 +-
 migration/migration.c               |  49 +++------
 migration/postcopy-ram.c            |   7 +-
 monitor/hmp-cmds.c                  |  44 ++++----
 monitor/misc.c                      |  25 ++---
 monitor/qmp-cmds-control.c          |  19 ++--
 net/net.c                           |  15 +--
 qemu-img.c                          |  11 +-
 qga/commands-posix-ssh.c            |   7 +-
 qga/commands-posix.c                | 160 +++++++++-------------------
 qga/commands-win32.c                | 127 +++++++---------------
 qga/commands.c                      |   6 +-
 qom/qom-qmp-cmds.c                  |  29 ++---
 scsi/pr-manager.c                   |   8 +-
 softmmu/tpm.c                       |  38 ++-----
 target/arm/helper.c                 |   6 +-
 target/arm/monitor.c                |  13 +--
 target/i386/cpu.c                   |  25 ++---
 target/mips/helper.c                |   6 +-
 target/s390x/cpu_models.c           |  12 +--
 tests/test-clone-visitor.c          |   7 +-
 tests/test-qobject-output-visitor.c | 102 ++++++------------
 tests/test-string-output-visitor.c  |   4 +-
 tests/test-visitor-serialization.c  | 113 +++-----------------
 trace/qmp.c                         |  22 ++--
 ui/input.c                          |  16 ++-
 ui/spice-core.c                     |  27 ++---
 ui/vnc.c                            |  21 ++--
 util/qemu-config.c                  |  14 +--
 target/ppc/translate_init.c.inc     |  12 +--
 55 files changed, 431 insertions(+), 1007 deletions(-)

-- 
2.28.0


