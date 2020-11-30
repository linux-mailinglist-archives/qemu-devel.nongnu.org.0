Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4282C841B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:29:34 +0100 (CET)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiJB-0002RW-Vl
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiFv-0000In-Se
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiFp-0002Ly-5y
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YteyWP64KdM4YsYlYkrhaKo6YOh3N5NJJ7tDa8+LDow=;
 b=isV68XtQbzz+W/jjKfFvi9uDJ+G9hdnZoqWB99tp6u0b59dnZZvRVkBvrAu4iwYf9XqNdD
 5pOmtxr5ytSzJ4dSmyUeSYSb7gVzFR4/W3dWwN1XVBFdWY08WcQ9Eru56FcwKgj4ZJ6nHI
 gQwW+3Bbb+f+SIFuhoWV17mJHP/DhCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-5153lLunOMGEdoSUcNvdyA-1; Mon, 30 Nov 2020 07:26:01 -0500
X-MC-Unique: 5153lLunOMGEdoSUcNvdyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD34A1084C85;
 Mon, 30 Nov 2020 12:26:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 721A119C71;
 Mon, 30 Nov 2020 12:25:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/18] qapi/qom: QAPIfy object-add
Date: Mon, 30 Nov 2020 13:25:20 +0100
Message-Id: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a QAPI type for the properties of all user creatable
QOM types and finally makes QMP object-add use the new ObjectOptions
union so that QAPI introspection can be used for user creatable objects.

If you are in the CC list and didn't expect this series, it's probably
because you're the maintainer of one of the objects for which I'm adding
a QAPI schema description. Please just have a look at the specific patch
for your object and check whether the schema and its documentation make
sense to you. You can ignore all other patches.


After this series, there is least one obvious next step that needs to be
done: Change HMP and all of the command line parser to use
ObjectOptions, too, so that the QAPI schema is consistently enforced in
all external interfaces. I am planning to send another series to address
this.

In a third step, we can try to start deduplicating and integrating things
better between QAPI and the QOM implementation, e.g. by generating parts
of the QOM boilerplate from the QAPI schema.

Kevin Wolf (18):
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
  qapi/qom: Add ObjectOptions for sev-guest
  qapi/qom: Add ObjectOptions for input-*
  tests: Drop 'props' from object-add calls
  qapi/qom: Drop deprecated 'props' from object-add
  qapi/qom: QAPIfy object-add

 qapi/authz.json                      |  62 +++
 qapi/block-core.json                 |  12 +
 qapi/common.json                     |  52 +++
 qapi/crypto.json                     | 159 +++++++
 qapi/machine.json                    |  22 +-
 qapi/net.json                        |  20 -
 qapi/qom.json                        | 609 ++++++++++++++++++++++++++-
 qapi/ui.json                         |  13 +-
 docs/system/deprecated.rst           |  29 +-
 include/qom/object_interfaces.h      |   7 -
 hw/block/xen-block.c                 |  16 +-
 monitor/misc.c                       |   2 -
 qom/qom-qmp-cmds.c                   |  44 +-
 tests/qtest/qmp-cmd-test.c           |  16 +-
 tests/qtest/test-netfilter.c         |  54 ++-
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
 25 files changed, 993 insertions(+), 173 deletions(-)

-- 
2.28.0


