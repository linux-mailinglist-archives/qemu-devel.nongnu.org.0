Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B86297530
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 18:52:09 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW0IS-0000xK-F5
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 12:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kVzhO-0008Dx-Qy
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 12:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kVzhJ-0007jv-3o
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 12:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603469622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MhrldX+0iATiPyQ82FfRx/4RRTcI/HbHi5PqTLkbhDE=;
 b=iqatvAEB5MS6pMvDkS3/eMr94FsYSnIJf+zFCjU15Rs6sau3ve8c7YExnByUcpJnF/ffbz
 jjdwTwelFJiE2JAAvLvwCjKngmPJoaoDDmY52H6UVh6QTZ/k6B67K694s+f0yg+nE89e/v
 MsJZ/o3AoDLJBIMEGgRCMoh400gnevw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-CRMoppyzMaewFOQJe2wZfg-1; Fri, 23 Oct 2020 12:13:41 -0400
X-MC-Unique: CRMoppyzMaewFOQJe2wZfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA47D195D579;
 Fri, 23 Oct 2020 16:13:29 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-206.ams2.redhat.com [10.36.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3CA5C1CF;
 Fri, 23 Oct 2020 16:13:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/6] qemu-storage-daemon: QAPIfy --chardev
Date: Fri, 23 Oct 2020 18:13:06 +0200
Message-Id: <20201023161312.460406-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the qemu-storage-daemon command line is still considered unstable,
let's change --chardev from the old QemuOpts-based parser to QAPI, so
that it becomes a simple mapping of chardev-add to the command line and
will fit in a future fully QAPIfied command line without later
incompatible changes or additional compatibility glue.

v2:
- Use g_autoptr in qemu_chr_print_types() [Marc-André]
- Fixed build failures with spice [Marc-André]
- Fixed documentation generation [Markus]
- Make sure that no simple union variant contains a 'data' branch that
  would make conversion to flat representation much more complicated

Kevin Wolf (6):
  char/stdio: Fix QMP default for 'signal'
  char: Factor out qemu_chr_print_types()
  qapi: Remove wrapper struct for simple unions
  qapi: Optionally parse simple unions as flat
  tests/qapi-schema: Flat representation of simple unions
  qemu-storage-daemon: Use qmp_chardev_add() for --chardev

 qapi/char.json                                |  6 +-
 docs/devel/qapi-code-gen.txt                  | 43 +++++++---
 docs/sphinx/qapidoc.py                        | 14 ++--
 include/chardev/char.h                        |  1 +
 include/qapi/visitor-impl.h                   |  3 +
 include/qapi/visitor.h                        | 10 +++
 backends/tpm/tpm_emulator.c                   |  3 +-
 backends/tpm/tpm_passthrough.c                |  4 +-
 block/crypto.c                                |  3 +-
 block/qcow2.c                                 |  9 +-
 block/vmdk.c                                  | 14 ++--
 blockdev.c                                    | 36 ++++----
 chardev/char-file.c                           |  5 +-
 chardev/char-mux.c                            |  5 +-
 chardev/char-parallel.c                       |  5 +-
 chardev/char-pipe.c                           |  7 +-
 chardev/char-ringbuf.c                        |  5 +-
 chardev/char-serial.c                         |  5 +-
 chardev/char-socket.c                         | 13 ++-
 chardev/char-stdio.c                          |  9 +-
 chardev/char-udp.c                            | 11 +--
 chardev/char.c                                | 26 +++---
 chardev/msmouse.c                             |  4 +-
 chardev/spice.c                               | 10 +--
 chardev/wctablet.c                            |  4 +-
 hw/core/numa.c                                |  6 +-
 hw/display/xenfb.c                            |  8 +-
 hw/input/hid.c                                |  8 +-
 hw/input/ps2.c                                |  6 +-
 hw/input/virtio-input-hid.c                   |  8 +-
 hw/mem/pc-dimm.c                              | 18 ++--
 hw/virtio/virtio-mem-pci.c                    |  3 +-
 hw/virtio/virtio-pmem-pci.c                   |  3 +-
 monitor/hmp-cmds.c                            | 14 ++--
 qapi/qapi-visit-core.c                        | 10 +++
 qemu-keymap.c                                 |  2 +-
 replay/replay-input.c                         | 46 +++++-----
 storage-daemon/qemu-storage-daemon.c          | 47 +++++++++--
 tests/test-char.c                             | 12 ++-
 tests/test-clone-visitor.c                    | 14 ++--
 tests/test-qmp-cmds.c                         |  2 +-
 tests/test-qobject-input-visitor.c            | 24 +++---
 tests/test-qobject-output-visitor.c           | 24 +++---
 ui/console.c                                  |  5 +-
 ui/input-keymap.c                             | 12 +--
 ui/input-legacy.c                             | 12 +--
 ui/input.c                                    | 43 +++++-----
 ui/spice-app.c                                |  5 +-
 util/qemu-sockets.c                           |  8 +-
 scripts/qapi/expr.py                          |  7 +-
 scripts/qapi/introspect.py                    |  7 +-
 scripts/qapi/schema.py                        | 74 +++++++++++++---
 scripts/qapi/visit.py                         | 36 ++++++++
 tests/qapi-schema/doc-good.out                |  8 +-
 tests/qapi-schema/flat-union-allow-flat.err   |  2 +
 tests/qapi-schema/flat-union-allow-flat.json  | 10 +++
 tests/qapi-schema/flat-union-allow-flat.out   |  0
 tests/qapi-schema/meson.build                 |  5 ++
 tests/qapi-schema/qapi-schema-test.json       | 10 +++
 tests/qapi-schema/qapi-schema-test.out        | 84 +++++++------------
 tests/qapi-schema/union-allow-flat-bad.err    |  2 +
 tests/qapi-schema/union-allow-flat-bad.json   |  5 ++
 tests/qapi-schema/union-allow-flat-bad.out    |  0
 .../union-allow-flat-builtin-type.err         |  2 +
 .../union-allow-flat-builtin-type.json        |  5 ++
 .../union-allow-flat-builtin-type.out         |  0
 tests/qapi-schema/union-clash-member-data.err |  2 +
 .../qapi-schema/union-clash-member-data.json  |  6 ++
 tests/qapi-schema/union-clash-member-data.out |  0
 tests/qapi-schema/union-clash-member-type.err |  2 +
 .../qapi-schema/union-clash-member-type.json  |  6 ++
 tests/qapi-schema/union-clash-member-type.out |  0
 72 files changed, 517 insertions(+), 351 deletions(-)
 create mode 100644 tests/qapi-schema/flat-union-allow-flat.err
 create mode 100644 tests/qapi-schema/flat-union-allow-flat.json
 create mode 100644 tests/qapi-schema/flat-union-allow-flat.out
 create mode 100644 tests/qapi-schema/union-allow-flat-bad.err
 create mode 100644 tests/qapi-schema/union-allow-flat-bad.json
 create mode 100644 tests/qapi-schema/union-allow-flat-bad.out
 create mode 100644 tests/qapi-schema/union-allow-flat-builtin-type.err
 create mode 100644 tests/qapi-schema/union-allow-flat-builtin-type.json
 create mode 100644 tests/qapi-schema/union-allow-flat-builtin-type.out
 create mode 100644 tests/qapi-schema/union-clash-member-data.err
 create mode 100644 tests/qapi-schema/union-clash-member-data.json
 create mode 100644 tests/qapi-schema/union-clash-member-data.out
 create mode 100644 tests/qapi-schema/union-clash-member-type.err
 create mode 100644 tests/qapi-schema/union-clash-member-type.json
 create mode 100644 tests/qapi-schema/union-clash-member-type.out

-- 
2.28.0


