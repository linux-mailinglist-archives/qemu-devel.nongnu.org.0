Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035D340270
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:50:07 +0100 (CET)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpI5-0004gt-VU
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMpGM-0002h5-3d
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:48:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lMpGJ-0004gU-DQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616060893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZHq3LNMJLH29zziczN/J+K7DJwC5jxK9Sb13RzZSyv0=;
 b=BHyAldI51y0m3uzj9TtlKqoXKE1ffXN9S8xtoNrl6DDLawzAMnrpVtx1QYPVZt6c1evxOL
 okb7lnfNoT0Pa3MXv8JmGgdzK+fOXiV/SPzSY+xM9KK73dbXWNDElN+YBJamr5/c3y2XjA
 efZuInz1lQdX1/8c7DVno3OiW9DIYKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-LcjuNq8KOX6jF9xph20ytw-1; Thu, 18 Mar 2021 05:48:11 -0400
X-MC-Unique: LcjuNq8KOX6jF9xph20ytw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6815F107ACCD;
 Thu, 18 Mar 2021 09:48:10 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-127.ams2.redhat.com [10.36.114.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73709669F2;
 Thu, 18 Mar 2021 09:48:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v4 00/42] Block layer patches and object-add QAPIfication
Date: Thu, 18 Mar 2021 10:48:07 +0100
Message-Id: <20210318094807.10472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 571d413b5da6bc6f1c2aaca8484717642255ddb0:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210316' into staging (2021-03-17 21:02:37 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to ef11a2d8972147994492c36cd3d26677e831e4d7:

  vl: allow passing JSON to -object (2021-03-18 10:45:01 +0100)

----------------------------------------------------------------
Block layer patches and object-add QAPIfication

- QAPIfy object-add and --object
- stream: Fail gracefully if permission is denied
- storage-daemon: Fix crash on quit when job is still running
- curl: Fix use after free
- char: Deprecate backend aliases, fix QMP query-chardev-backends
- Fix image creation option defaults that exist in both the format and
  the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
  default was incorrectly applied to the rbd layer)

----------------------------------------------------------------
Kevin Wolf (35):
      storage-daemon: Call job_cancel_sync_all() on shutdown
      stream: Don't crash when node permission is denied
      tests: Drop 'props' from object-add calls
      qapi/qom: Drop deprecated 'props' from object-add
      qapi/qom: Add ObjectOptions for iothread
      qapi/qom: Add ObjectOptions for authz-*
      qapi/qom: Add ObjectOptions for cryptodev-*
      qapi/qom: Add ObjectOptions for dbus-vmstate
      qapi/qom: Add ObjectOptions for memory-backend-*
      qapi/qom: Add ObjectOptions for rng-*, deprecate 'opened'
      qapi/qom: Add ObjectOptions for throttle-group
      qapi/qom: Add ObjectOptions for secret*, deprecate 'loaded'
      qapi/qom: Add ObjectOptions for tls-*, deprecate 'loaded'
      qapi/qom: Add ObjectOptions for can-*
      qapi/qom: Add ObjectOptions for colo-compare
      qapi/qom: Add ObjectOptions for filter-*
      qapi/qom: Add ObjectOptions for pr-manager-helper
      qapi/qom: Add ObjectOptions for confidential-guest-support
      qapi/qom: Add ObjectOptions for input-*
      qapi/qom: Add ObjectOptions for x-remote-object
      qapi/qom: QAPIfy object-add
      qom: Make "object" QemuOptsList optional
      qemu-storage-daemon: Implement --object with qmp_object_add()
      qom: Remove user_creatable_add_dict()
      qom: Factor out user_creatable_process_cmdline()
      qemu-io: Use user_creatable_process_cmdline() for --object
      qemu-nbd: Use user_creatable_process_cmdline() for --object
      qom: Add user_creatable_add_from_str()
      qemu-img: Use user_creatable_process_cmdline() for --object
      hmp: QAPIfy object_add
      qom: Add user_creatable_parse_str()
      char: Skip CLI aliases in query-chardev-backends
      char: Deprecate backend aliases 'tty' and 'parport'
      char: Simplify chardev_name_foreach()
      qom: Support JSON in HMP object_add and tools --object

Max Reitz (2):
      curl: Store BDRVCURLState pointer in CURLSocket
      curl: Disconnect sockets from CURLState

Paolo Bonzini (3):
      tests: convert check-qom-proplist to keyval
      qom: move user_creatable_add_opts logic to vl.c and QAPIfy it
      vl: allow passing JSON to -object

Stefan Hajnoczi (1):
      block/export: disable VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD for now

Stefano Garzarella (1):
      block: remove format defaults from QemuOpts in bdrv_create_file()

 qapi/authz.json                       |  61 +++-
 qapi/block-core.json                  |  27 ++
 qapi/common.json                      |  52 +++
 qapi/crypto.json                      | 159 +++++++++
 qapi/machine.json                     |  22 +-
 qapi/net.json                         |  20 --
 qapi/qom.json                         | 646 +++++++++++++++++++++++++++++++++-
 qapi/ui.json                          |  13 +-
 docs/system/deprecated.rst            |  31 +-
 docs/system/removed-features.rst      |   5 +
 docs/tools/qemu-img.rst               |   2 +-
 include/qom/object_interfaces.h       |  98 ++----
 block.c                               |  36 +-
 block/curl.c                          |  50 +--
 block/export/vhost-user-blk-server.c  |   3 +-
 block/stream.c                        |  15 +-
 chardev/char.c                        |  19 +-
 hw/block/xen-block.c                  |  16 +-
 monitor/hmp-cmds.c                    |  17 +-
 monitor/misc.c                        |   2 -
 qemu-img.c                            | 251 +++----------
 qemu-io.c                             |  33 +-
 qemu-nbd.c                            |  34 +-
 qom/object_interfaces.c               | 172 ++++-----
 qom/qom-qmp-cmds.c                    |  28 +-
 softmmu/vl.c                          |  84 ++++-
 storage-daemon/qemu-storage-daemon.c  |  28 +-
 tests/qtest/qmp-cmd-test.c            |  16 +-
 tests/qtest/test-netfilter.c          |  54 ++-
 tests/unit/check-qom-proplist.c       |  77 ++--
 tests/unit/test-char.c                |   6 -
 hmp-commands.hx                       |   2 +-
 storage-daemon/qapi/qapi-schema.json  |   1 +
 tests/qemu-iotests/tests/qsd-jobs     |  86 +++++
 tests/qemu-iotests/tests/qsd-jobs.out |  32 ++
 35 files changed, 1517 insertions(+), 681 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/qsd-jobs
 create mode 100644 tests/qemu-iotests/tests/qsd-jobs.out


