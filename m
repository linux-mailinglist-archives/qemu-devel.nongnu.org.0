Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B42D7D9A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:05:37 +0100 (CET)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmnQ-00046a-Nr
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxk-0007S3-DE
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knlxa-0003Qt-94
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:12:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O367y6556fykMhoFJUm54PqNrOpGP+td3HV0hIkAe3Y=;
 b=HAVWoJy2L94oJcaHG/6VtzjF5Lg+UaKdEd4jMATu9NCR1AtifSg5FMTpWXJ+6+UIW1G9xI
 1om7fLvSrPOBBSNTBzy2eyhx+KqBNwMnJdgAJtp6tC+0oy9RtVVqYETSLAAisY4nEyqd7x
 3lz8rWtKj8EPWgPB3g+u16+LyQ8bWGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-1n-DyEegNZyq9zriQyGYDA-1; Fri, 11 Dec 2020 12:11:56 -0500
X-MC-Unique: 1n-DyEegNZyq9zriQyGYDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C41B800FFC;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26A5719C78;
 Fri, 11 Dec 2020 17:11:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9E1EC11329A5; Fri, 11 Dec 2020 18:11:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/20] Immutable QString, and also one JSON writer less
Date: Fri, 11 Dec 2020 18:11:32 +0100
Message-Id: <20201211171152.146877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 mdroth@linux.vnet.ibm.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20201210161452.2813491-1-armbru@redhat.com>

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-block@nongnu.org

Markus Armbruster (20):
  hmp: Simplify how qmp_human_monitor_command() gets output
  monitor: Use GString instead of QString for output buffer
  qobject: Make qobject_to_json_pretty() take a pretty argument
  qobject: Use GString instead of QString to accumulate JSON
  qobject: Change qobject_to_json()'s value to GString
  Revert "qstring: add qstring_free()"
  hw/rdma: Replace QList by GQueue
  qobject: Move internals to qobject-internal.h
  qmp: Fix tracing of non-string command IDs
  block: Avoid qobject_get_try_str()
  Revert "qobject: let object_property_get_str() use new API"
  qobject: Drop qobject_get_try_str()
  qobject: Drop qstring_get_try_str()
  qobject: Factor quoted_str() out of to_json()
  qobject: Factor JSON writer out of qobject_to_json()
  migration: Replace migration's JSON writer by the general one
  json: Use GString instead of QString to accumulate strings
  keyval: Use GString to accumulate value strings
  block: Use GString instead of QString to build filenames
  qobject: Make QString immutable

 hw/rdma/rdma_backend_defs.h        |   2 +-
 hw/rdma/rdma_utils.h               |  15 +-
 include/migration/vmstate.h        |   7 +-
 include/qapi/qmp/json-writer.h     |  35 ++++
 include/qapi/qmp/qbool.h           |   2 -
 include/qapi/qmp/qdict.h           |   2 -
 include/qapi/qmp/qjson.h           |   4 +-
 include/qapi/qmp/qlist.h           |   2 -
 include/qapi/qmp/qnull.h           |   2 -
 include/qapi/qmp/qnum.h            |   3 -
 include/qapi/qmp/qobject.h         |   9 +-
 include/qapi/qmp/qstring.h         |  14 +-
 include/qemu/typedefs.h            |   4 +-
 migration/qjson.h                  |  29 ----
 monitor/monitor-internal.h         |   2 +-
 qobject/qobject-internal.h         |  39 +++++
 block.c                            |  23 +--
 block/rbd.c                        |   2 +-
 hw/display/virtio-gpu.c            |   2 +-
 hw/intc/s390_flic_kvm.c            |   2 +-
 hw/nvram/eeprom93xx.c              |   2 +-
 hw/nvram/fw_cfg.c                  |   2 +-
 hw/pci/msix.c                      |   2 +-
 hw/pci/pci.c                       |   4 +-
 hw/pci/shpc.c                      |   2 +-
 hw/rdma/rdma_backend.c             |  10 +-
 hw/rdma/rdma_utils.c               |  29 ++--
 hw/rtc/twl92230.c                  |   2 +-
 hw/scsi/scsi-bus.c                 |   2 +-
 hw/usb/redirect.c                  |   7 +-
 hw/virtio/virtio.c                 |   4 +-
 migration/qjson.c                  | 114 -------------
 migration/savevm.c                 |  53 ++++---
 migration/vmstate-types.c          |  38 ++---
 migration/vmstate.c                |  52 +++---
 monitor/misc.c                     |   6 +-
 monitor/monitor.c                  |  20 +--
 monitor/qmp.c                      |  46 +++---
 qemu-img.c                         |  33 ++--
 qga/main.c                         |  22 +--
 qobject/json-parser.c              |  30 ++--
 qobject/json-writer.c              | 247 +++++++++++++++++++++++++++++
 qobject/qbool.c                    |   1 +
 qobject/qdict.c                    |   1 +
 qobject/qjson.c                    | 144 ++++-------------
 qobject/qlist.c                    |   1 +
 qobject/qnull.c                    |   1 +
 qobject/qnum.c                     |   6 +-
 qobject/qobject.c                  |   1 +
 qobject/qstring.c                  | 117 +++-----------
 qom/object.c                       |   9 +-
 qom/object_interfaces.c            |   4 +-
 qom/qom-hmp-cmds.c                 |   7 +-
 target/alpha/machine.c             |   2 +-
 target/arm/machine.c               |   6 +-
 target/avr/machine.c               |   4 +-
 target/hppa/machine.c              |   4 +-
 target/microblaze/machine.c        |   2 +-
 target/mips/machine.c              |   4 +-
 target/openrisc/machine.c          |   2 +-
 target/ppc/machine.c               |  10 +-
 target/sparc/machine.c             |   2 +-
 tests/check-qjson.c                |  67 ++++----
 tests/check-qobject.c              |   3 +-
 tests/check-qstring.c              |  16 --
 tests/qtest/libqtest.c             |  20 ++-
 tests/test-visitor-serialization.c |   6 +-
 util/keyval.c                      |  11 +-
 migration/meson.build              |   1 -
 qobject/meson.build                |   5 +-
 70 files changed, 679 insertions(+), 705 deletions(-)
 create mode 100644 include/qapi/qmp/json-writer.h
 delete mode 100644 migration/qjson.h
 create mode 100644 qobject/qobject-internal.h
 delete mode 100644 migration/qjson.c
 create mode 100644 qobject/json-writer.c

-- 
2.26.2


