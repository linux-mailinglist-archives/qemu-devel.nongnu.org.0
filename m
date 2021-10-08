Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19D426BD0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:39:09 +0200 (CEST)
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYq5c-0004hV-03
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq30-0001A8-Ot
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq2x-0000u8-M3
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:36:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HCy1HrQdgYBR9jNg9soGMzKztHWdn+QEftTkVNbRWpA=;
 b=ecoWsCbJWtanIXt4hTrTIxj5GJyJxcxTFEgTvScHTJ/WAs0h51ZJrvSQY7RXz9FYEJn0Y3
 n3+uoDs5AfQLd+rMbd4yaZWv/vZnJzojAVOuX/MJ/XcFrgG08+JQt5S9tYjNW53X9dEbwu
 F0btIYB1Ch+Jhqam0kb9m0nVTtW89n8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-pbWJjEadNv6hS2cvMoxciA-1; Fri, 08 Oct 2021 09:36:19 -0400
X-MC-Unique: pbWJjEadNv6hS2cvMoxciA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCB76BD52D;
 Fri,  8 Oct 2021 13:35:01 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54FEA19724;
 Fri,  8 Oct 2021 13:34:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] qdev: Add JSON -device
Date: Fri,  8 Oct 2021 15:34:27 +0200
Message-Id: <20211008133442.141332-1-kwolf@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's still a long way until we'll have QAPIfied devices, but there are
some improvements that we can already make now to make the future switch
easier.

One important part of this is having code paths without QemuOpts, which
we want to get rid of and replace with the keyval parser in the long
run. This series adds support for JSON syntax to -device, which bypasses
QemuOpts.

While we're not using QAPI yet, devices are based on QOM, so we already
do have type checks and an implied schema. JSON syntax supported now can
be supported by QAPI later and regarding command line compatibility,
actually switching to it becomes an implementation detail this way (of
course, it will still add valuable user-visible features like
introspection and documentation).

Apart from making things more future proof, this also immediately adds
a way to do non-scalar properties on the command line. nvme could have
used list support recently, and the lack of it in -device led to some
rather unnatural solution in the first version (doing the relationship
between a device and objects backwards) and loss of features in the
following. With this series, using a list as a device property should be
possible without any weird tricks.

Unfortunately, even QMP device_add goes through QemuOpts before this
series, which destroys any type safety QOM provides and also can't
support non-scalar properties. This is a bug, but it turns out that
libvirt actually relies on it and passes only strings for everything.
So this series still leaves device_add alone until libvirt is fixed.

v2:
- Drop type safe QMP device_add because libvirt gets it wrong, too
- More network patches to eliminate dependencies on the legacy QemuOpts
  data structures which would not contain all devices any more after
  this series. Fix some bugs there as a side effect.
- Remove an unnecessary use of ERRP_GUARD()
- Replaced error handling patch for qdev_set_id() with Damien's
- Drop the deprecation patch until libvirt uses the new JSON syntax

Damien Hedde (1):
  softmmu/qdev-monitor: add error handling in qdev_set_id

Kevin Wolf (14):
  net: Introduce NetClientInfo.check_peer_type()
  net/vhost-user: Fix device compatibility check
  net/vhost-vdpa: Fix device compatibility check
  qom: Reduce use of error_propagate()
  iotests/245: Fix type for iothread property
  iotests/051: Fix typo
  qdev: Avoid using string visitor for properties
  qdev: Make DeviceState.id independent of QemuOpts
  qemu-option: Allow deleting opts during qemu_opts_foreach()
  qdev: Add Error parameter to hide_device() callbacks
  virtio-net: Store failover primary opts pointer locally
  virtio-net: Avoid QemuOpts in failover_find_primary_device()
  qdev: Base object creation on QDict rather than QemuOpts
  vl: Enable JSON syntax for -device

 qapi/qdev.json                      | 15 +++--
 include/hw/qdev-core.h              | 15 +++--
 include/hw/virtio/virtio-net.h      |  2 +
 include/monitor/qdev.h              | 27 +++++++-
 include/net/net.h                   |  2 +
 hw/arm/virt.c                       |  2 +-
 hw/core/qdev-properties-system.c    |  6 ++
 hw/core/qdev.c                      | 11 +++-
 hw/net/virtio-net.c                 | 85 ++++++++++++-------------
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/ppc/e500.c                       |  2 +-
 hw/vfio/pci.c                       |  4 +-
 hw/xen/xen-legacy-backend.c         |  3 +-
 net/vhost-user.c                    | 41 ++++--------
 net/vhost-vdpa.c                    | 37 ++++-------
 qom/object.c                        |  7 +-
 qom/object_interfaces.c             | 19 ++----
 softmmu/qdev-monitor.c              | 99 +++++++++++++++++++----------
 softmmu/vl.c                        | 63 ++++++++++++++++--
 util/qemu-option.c                  |  4 +-
 tests/qemu-iotests/051              |  2 +-
 tests/qemu-iotests/051.pc.out       |  4 +-
 tests/qemu-iotests/245              |  4 +-
 23 files changed, 278 insertions(+), 178 deletions(-)

-- 
2.31.1


