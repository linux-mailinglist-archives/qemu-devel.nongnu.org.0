Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEF3313EF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:59:08 +0100 (CET)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJDn-0005Q2-Fn
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJAB-00037g-GH
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJA4-0007s8-4x
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GCalvqlt6OEpp2wKgME9KJ6Rb1kaPbmIsuVYAR2MnlI=;
 b=IrvHWmv5wVBtbMMc/0IY9TcIgQbSdvyw4k5jtHqA0cpFSunjourPH7jwZyWR/JYtaKhq0h
 69u11y5s9IIF/WjIx9xkxJFqy8swepbpUSykzOItX3QNCR0/8ECu3veWz4GM4qy9hACoAl
 OJVhYVAoBQJpNPfynbdDKkiKDN4w0TA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-MzbYJq8jOpeai0EMk1ZNPQ-1; Mon, 08 Mar 2021 11:55:09 -0500
X-MC-Unique: MzbYJq8jOpeai0EMk1ZNPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D64E193F56A;
 Mon,  8 Mar 2021 16:55:08 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB02A5D9E3;
 Mon,  8 Mar 2021 16:54:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Date: Mon,  8 Mar 2021 17:54:10 +0100
Message-Id: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

    https://repo.or.cz/qemu/kevin.git qapi-object-v3


v3:
- Removed now useless QAuthZListRuleListHack
- Made some more ObjectOptions branches conditional
- Improved documentation for some properties
- Fixed 'qemu-img compare' exit code for option parsing failure

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

Kevin Wolf (30):
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
  vl: QAPIfy -object
  qom: Drop QemuOpts based interfaces

 qapi/authz.json                      |  61 ++-
 qapi/block-core.json                 |  27 ++
 qapi/common.json                     |  52 +++
 qapi/crypto.json                     | 159 +++++++
 qapi/machine.json                    |  22 +-
 qapi/net.json                        |  20 -
 qapi/qom.json                        | 644 ++++++++++++++++++++++++++-
 qapi/ui.json                         |  13 +-
 docs/system/deprecated.rst           |  25 +-
 docs/system/removed-features.rst     |   5 +
 include/qom/object_interfaces.h      | 106 ++---
 hw/block/xen-block.c                 |  16 +-
 monitor/hmp-cmds.c                   |  17 +-
 monitor/misc.c                       |   2 -
 qemu-img.c                           | 251 ++---------
 qemu-io.c                            |  33 +-
 qemu-nbd.c                           |  34 +-
 qom/object_interfaces.c              | 168 +++----
 qom/qom-qmp-cmds.c                   |  28 +-
 softmmu/vl.c                         | 109 +++--
 storage-daemon/qemu-storage-daemon.c |  27 +-
 tests/check-qom-proplist.c           |  42 +-
 hmp-commands.hx                      |   2 +-
 storage-daemon/qapi/qapi-schema.json |   1 +
 24 files changed, 1231 insertions(+), 633 deletions(-)

-- 
2.29.2


