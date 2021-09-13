Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98700408B78
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:00:54 +0200 (CEST)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlZt-00065P-D6
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFT-0000Ek-DS
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFP-0000gH-MN
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J4zq45m6gXcUr0csh6HoseEiEAJm902EtX3G3a+nxnQ=;
 b=WsHsX48grKQ4Jd/X9H90F6Qkiq33gVsQYCQo4M3KH8bMxYHCfcDIzPR+rhCmBYoUcTaFiv
 +ODT5jyg3A7uXZeOVHx/tqQO5yOWrgVTTwD8REwfUY8A1Q84m6EBCNvNF/4aW9lw3hCd+3
 ynnjhXisASlhi2v38UV8Nfz5/2HMHNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-kaC4XZHVOlSQbbyBWhS9rA-1; Mon, 13 Sep 2021 08:39:41 -0400
X-MC-Unique: kaC4XZHVOlSQbbyBWhS9rA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D24B980196C;
 Mon, 13 Sep 2021 12:39:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 835BF19724;
 Mon, 13 Sep 2021 12:39:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C21F113865F; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] qapi: Remove simple unions from the schema language
Date: Mon, 13 Sep 2021 14:39:10 +0200
Message-Id: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

Get rid of them.  We should've done this long ago.

This adds some boilerplate to the schema:

    $ git-diff --shortstat master qapi
     7 files changed, 461 insertions(+), 59 deletions(-)

Well worth the language simplification, in my opinion:

    $ git-diff --stat master scripts/ docs/
     docs/devel/qapi-code-gen.rst | 137 ++++++++++---------------------------------
     scripts/qapi/common.py       |  19 ++----
     scripts/qapi/expr.py         |  48 +++++++--------
     scripts/qapi/schema.py       | 101 +++++++------------------------
     4 files changed, 80 insertions(+), 225 deletions(-)

The complete diffstat looks even better, but is somewhat misleading,
because it's dominated by two tests rewritten in a much more compact
way.

This series is based on my "[PULL 0/5] QAPI patches patches for
2021-09-13".

Based-on: <20210913095038.3040776-1-armbru@redhat.com>

Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>

Markus Armbruster (22):
  qapi: Tidy up unusual line breaks
  qapi: Stop enforcing "type name should not end in 'Kind'
  qapi: Convert simple union KeyValue to flat one
  qapi: Convert simple union InputEvent to flat one
  qapi: Convert simple union TpmTypeOptions to flat one
  qapi: Convert simple union MemoryDeviceInfo to flat one
  qapi: Convert simple union ChardevBackend to flat one
  qapi: Convert simple union SocketAddressLegacy to flat one
  qapi: Convert simple union ImageInfoSpecific to flat one
  qapi: Convert simple union TransactionAction to flat one
  tests/qapi-schema: Prepare for simple union UserDefListUnion removal
  test-qobject-input-visitor: Wean off UserDefListUnion
  test-qobject-output-visitor: Wean off UserDefListUnion
  test-clone-visitor: Wean off UserDefListUnion
  tests/qapi-schema: Wean off UserDefListUnion
  tests/qapi-schema: Simple union UserDefListUnion is now unused, drop
  tests/qapi-schema: Rewrite simple union TestIfUnion to be flat
  test-clone-visitor: Wean off __org.qemu_x-Union1
  tests/qapi-schema: Drop simple union __org.qemu_x-Union1
  tests/qapi-schema: Purge simple unions from tests
  qapi: Drop simple unions
  test-clone-visitor: Correct an accidental rename

 docs/devel/qapi-code-gen.rst                  | 137 ++----
 qapi/block-core.json                          |  56 ++-
 qapi/char.json                                | 169 ++++++-
 qapi/machine.json                             |  42 +-
 qapi/sockets.json                             |  46 +-
 qapi/tpm.json                                 |  24 +-
 qapi/transaction.json                         | 111 ++++-
 qapi/ui.json                                  |  72 ++-
 backends/tpm/tpm_emulator.c                   |   2 +-
 backends/tpm/tpm_passthrough.c                |   2 +-
 chardev/char-socket.c                         |   6 +-
 chardev/char-udp.c                            |   4 +-
 monitor/hmp-cmds.c                            |   8 +-
 tests/unit/test-clone-visitor.c               |  98 ++--
 tests/unit/test-qmp-cmds.c                    |  18 +-
 tests/unit/test-qobject-input-visitor.c       | 460 ++++++------------
 tests/unit/test-qobject-output-visitor.c      | 391 ++++-----------
 tests/unit/test-yank.c                        |   6 +-
 util/qemu-sockets.c                           |   8 +-
 scripts/qapi/expr.py                          |  27 +-
 scripts/qapi/schema.py                        | 101 +---
 tests/qapi-schema/args-union.err              |   2 +-
 tests/qapi-schema/args-union.json             |   8 +-
 tests/qapi-schema/bad-base.err                |   2 +-
 tests/qapi-schema/bad-base.json               |   8 +-
 tests/qapi-schema/doc-good.json               |  13 +-
 tests/qapi-schema/doc-good.out                |  22 -
 tests/qapi-schema/doc-good.txt                |  20 -
 tests/qapi-schema/enum-if-invalid.json        |   4 +-
 .../qapi-schema/flat-union-array-branch.json  |   2 +-
 tests/qapi-schema/flat-union-base-union.err   |   2 +-
 tests/qapi-schema/flat-union-base-union.json  |   3 +
 tests/qapi-schema/flat-union-empty.json       |   2 +-
 tests/qapi-schema/flat-union-int-branch.json  |   2 +-
 tests/qapi-schema/flat-union-no-base.err      |   2 +-
 tests/qapi-schema/flat-union-no-base.json     |   2 +-
 tests/qapi-schema/meson.build                 |   5 -
 tests/qapi-schema/qapi-schema-test.json       |  49 +-
 tests/qapi-schema/qapi-schema-test.out        | 112 +----
 tests/qapi-schema/reserved-member-u.json      |   2 +-
 tests/qapi-schema/reserved-type-kind.err      |   2 -
 tests/qapi-schema/reserved-type-kind.json     |   2 -
 tests/qapi-schema/reserved-type-kind.out      |   0
 tests/qapi-schema/union-base-empty.json       |   2 +-
 .../union-base-no-discriminator.err           |   2 +-
 .../union-base-no-discriminator.json          |   2 +-
 tests/qapi-schema/union-branch-case.err       |   2 -
 tests/qapi-schema/union-branch-case.json      |   2 -
 tests/qapi-schema/union-branch-case.out       |   0
 .../qapi-schema/union-branch-invalid-dict.err |   2 +-
 .../union-branch-invalid-dict.json            |   4 +
 tests/qapi-schema/union-clash-branches.err    |   2 -
 tests/qapi-schema/union-clash-branches.json   |   7 -
 tests/qapi-schema/union-clash-branches.out    |   0
 tests/qapi-schema/union-empty.err             |   2 -
 tests/qapi-schema/union-empty.json            |   2 -
 tests/qapi-schema/union-empty.out             |   0
 tests/qapi-schema/union-optional-branch.err   |   2 -
 tests/qapi-schema/union-optional-branch.json  |   2 -
 tests/qapi-schema/union-optional-branch.out   |   0
 tests/qapi-schema/union-unknown.err           |   2 +-
 tests/qapi-schema/union-unknown.json          |   5 +-
 62 files changed, 936 insertions(+), 1158 deletions(-)
 delete mode 100644 tests/qapi-schema/reserved-type-kind.err
 delete mode 100644 tests/qapi-schema/reserved-type-kind.json
 delete mode 100644 tests/qapi-schema/reserved-type-kind.out
 delete mode 100644 tests/qapi-schema/union-branch-case.err
 delete mode 100644 tests/qapi-schema/union-branch-case.json
 delete mode 100644 tests/qapi-schema/union-branch-case.out
 delete mode 100644 tests/qapi-schema/union-clash-branches.err
 delete mode 100644 tests/qapi-schema/union-clash-branches.json
 delete mode 100644 tests/qapi-schema/union-clash-branches.out
 delete mode 100644 tests/qapi-schema/union-empty.err
 delete mode 100644 tests/qapi-schema/union-empty.json
 delete mode 100644 tests/qapi-schema/union-empty.out
 delete mode 100644 tests/qapi-schema/union-optional-branch.err
 delete mode 100644 tests/qapi-schema/union-optional-branch.json
 delete mode 100644 tests/qapi-schema/union-optional-branch.out

-- 
2.31.1


