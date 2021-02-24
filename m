Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CAC323F3B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:46:55 +0100 (CET)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvRG-0001Yw-0b
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvOx-0000Ih-Nx
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvOv-0002fX-Hs
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JOIn4NM3nCqj5cOZqnD5QNieHgpCpq0X6JOqjCiAINI=;
 b=f6zu6n3oN/NKvgkJTL1o69dbl6ABAgkaKpfjxng3G50/ZQqPK2DjEuh4FKtEwsZNxRe+9M
 zm5MSVdkviQGC8fbTFqouB97M36x5IUZ/Uo6BHJJP5+oUo7ixT36XA+OJgN9e/eS1PsFyK
 LvUUODxzbgEi1ICaTLRfDhJIz3LOpH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-_tPxcZ8PMf6tvyONM_cDwg-1; Wed, 24 Feb 2021 09:44:25 -0500
X-MC-Unique: _tPxcZ8PMf6tvyONM_cDwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E39E133FF5;
 Wed, 24 Feb 2021 13:53:11 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0AC25D6D3;
 Wed, 24 Feb 2021 13:53:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/31] qapi/qom: QAPIfy --object and object-add
Date: Wed, 24 Feb 2021 14:52:24 +0100
Message-Id: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a QAPI type for the properties of all user creatable
QOM types and finally makes the --object command line option (in all
binaries) and the object-add monitor commands (in QMP and HMP) use the
new ObjectOptions union.

This change improves things in more than just one way:

1. Documentation for QOM object types has always been lacking. Adding
   the schema, we get documentation for every property.

2. It prevents bugs by performing parts of the input validation (e.g.
   checking presence of mandatory properties) already in QAPI instead of
   relying on separate manual implementations in each class.

3. It provides QAPI introspection for user creatable objects.

4. Non-scalar properties are now supported everywhere because the
   command line parsers (including HMP) use the keyval parser now.


If you are in the CC list and didn't expect this series, it's probably
because you're the maintainer of one of the objects for which I'm adding
a QAPI schema description. Please just have a look at the specific patch
for your object and check whether the schema and its documentation make
sense to you. You can ignore all other patches.


In a next step after this series, we can add make use of the QAPI
structs in the implementation of the object and separate their
configuration from the runtime state. Specifically, the plan is to
add a .configure() callback to ObjectClass that allows configuring the
object in one place at creation time and keeping QOM property setters
only for properties that can actually be changed at runtime. Paolo made
an example of what the state could look like after this:

    https://wiki.qemu.org/Features/QOM-QAPI_integration

Finally, the intention is to extend the QAPI schema to have separate
'object' entities and generate some of the code that was written
manually in the intermediate state before.


This series is available as a git tag at:

    https://repo.or.cz/qemu/kevin.git qapi-object-v2


v2:
- Convert not only object-add, but all external interfaces so that the
  schema will always be enforced and mismatch between implementation and
  schema can't go unnoticed.
- Rebased, covering properties and object types added since v1 (yes,
  things do become outdated rather quickly when you touch all user
  creatable objects)
- Changed the "Since:" version number in the schema documentation to
  refer to the version when the object was introduced rather than 6.0
  where the schema will (hopefully) be added
- Probably some other minor changes

Kevin Wolf (31):
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
  qemu-img: Use user_creatable_process_cmdline() for --object
  qemu-nbd: Use user_creatable_process_cmdline() for --object
  qom: Add user_creatable_add_from_str()
  hmp: QAPIfy object_add
  qom: Add user_creatable_parse_str()
  vl: QAPIfy -object
  qom: Drop QemuOpts based interfaces

 qapi/authz.json                      |  62 +++
 qapi/block-core.json                 |  27 ++
 qapi/common.json                     |  52 +++
 qapi/crypto.json                     | 159 +++++++
 qapi/machine.json                    |  22 +-
 qapi/net.json                        |  20 -
 qapi/qom.json                        | 639 ++++++++++++++++++++++++++-
 qapi/ui.json                         |  13 +-
 docs/system/deprecated.rst           |  25 +-
 docs/system/removed-features.rst     |   5 +
 include/qom/object_interfaces.h      | 106 ++---
 hw/block/xen-block.c                 |  16 +-
 monitor/hmp-cmds.c                   |  17 +-
 monitor/misc.c                       |   2 -
 qemu-img.c                           | 239 ++--------
 qemu-io.c                            |  33 +-
 qemu-nbd.c                           |  34 +-
 qom/object_interfaces.c              | 168 +++----
 qom/qom-qmp-cmds.c                   |  28 +-
 softmmu/vl.c                         | 109 +++--
 storage-daemon/qemu-storage-daemon.c |  25 +-
 tests/check-qom-proplist.c           |  42 +-
 tests/qtest/qmp-cmd-test.c           |  16 +-
 tests/qtest/test-netfilter.c         |  54 +--
 hmp-commands.hx                      |   2 +-
 storage-daemon/qapi/qapi-schema.json |   1 +
 tests/qemu-iotests/087               |   8 +-
 tests/qemu-iotests/184               |  18 +-
 tests/qemu-iotests/218               |   2 +-
 tests/qemu-iotests/235               |   2 +-
 tests/qemu-iotests/245               |   4 +-
 tests/qemu-iotests/258               |   6 +-
 tests/qemu-iotests/258.out           |   4 +-
 tests/qemu-iotests/295               |   2 +-
 tests/qemu-iotests/296               |   2 +-
 35 files changed, 1270 insertions(+), 694 deletions(-)

-- 
2.29.2


