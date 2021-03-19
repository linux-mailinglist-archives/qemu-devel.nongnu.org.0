Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D7E341822
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:23:14 +0100 (CET)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBLd-0008Fe-Fy
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lNBJG-00077b-NX
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lNBJE-0002p8-Kv
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616145643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vSf+ojheZupWaovPQBVflCRxWs7fROrcp2D5HKQDPlU=;
 b=WJQalmKhTT12d0H9fk2qPifSPtSRRH8lIakCz81Ui3OrBjjLyEllEuq7JU/3vkS36zLCmK
 FDFRrWcMKwrJjWhdY/0riDXVjpWsdSiyImKVvEuK0YlV5zLYhpn8PwiusUx32tjMPGvNA1
 lCWpztGRceT33dCQFzU7fcj6U0hfMtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-8DzxcpjMOiOqMPubvKH08g-1; Fri, 19 Mar 2021 05:20:41 -0400
X-MC-Unique: 8DzxcpjMOiOqMPubvKH08g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BFFA81622;
 Fri, 19 Mar 2021 09:20:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-35.ams2.redhat.com [10.36.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 448AF5D74A;
 Fri, 19 Mar 2021 09:20:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v5 00/42] Block layer patches and object-add QAPIfication
Date: Fri, 19 Mar 2021 10:20:36 +0100
Message-Id: <20210319092036.9744-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The following changes since commit 8a40754bca14df63c6d2ffe473b68a270dc50679:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-18 19:55:37 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 009ff89328b1da3ea8ba316bf2be2125bc9937c5:

  vl: allow passing JSON to -object (2021-03-19 10:18:17 +0100)

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


