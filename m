Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9536416E84
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:08:23 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThBu-0005e6-PN
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh8g-000391-S2
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mTh8d-0002JA-Cv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:05:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sB0hRLRbVdlgABdmaU76HDPWCEWx1XWL+xXssrdQhiA=;
 b=hmOVw5wuCNh1jhvfQmpHBpeSGB4fP55wj6uTFSdoyOip3JzHmMYDqP6/XcLJU9tfVm6L/L
 4HckyJ7yBu/QBZWBuqfT/c4bR0lt2G58m+kqPXO/0aLTXVwHYfxJgw3bZlgjBOUhl5+N5k
 abozxIaXlYWsSqRGvFAiLzdACU7rpqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379--oj_-BNaPaKk8yQIvxXThQ-1; Fri, 24 Sep 2021 05:04:54 -0400
X-MC-Unique: -oj_-BNaPaKk8yQIvxXThQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A908450752;
 Fri, 24 Sep 2021 09:04:53 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F23F75D9DD;
 Fri, 24 Sep 2021 09:04:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] qdev: Add JSON -device and fix QMP device_add
Date: Fri, 24 Sep 2021 11:04:16 +0200
Message-Id: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
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
support non-scalar properties. This is a bug that is fixed during this
series, but that is technically an incompatible change. A similar change
was made for netdev_add in commit db2a380c84.

libvirt needs to make sure that it actually always passes the right
type, because passing a wrong type will start to fail after this
series. I hope that libvirt already does things correctly, so this
won't cause any trouble, but if it does, there is the option of using
the QemuOpts-less code path only for JSON -device and going through a
deprecation period for QMP device_add.

Kevin Wolf (11):
  qom: Reduce use of error_propagate()
  iotests/245: Fix type for iothread property
  iotests/051: Fix typo
  qdev: Avoid using string visitor for properties
  qdev: Make DeviceState.id independent of QemuOpts
  qdev: Add Error parameter to qdev_set_id()
  qemu-option: Allow deleting opts during qemu_opts_foreach()
  qdev: Base object creation on QDict rather than QemuOpts
  qdev: Avoid QemuOpts in QMP device_add
  vl: Enable JSON syntax for -device
  Deprecate stable non-JSON -device and -object

 qapi/qdev.json                      | 15 +++--
 docs/about/deprecated.rst           | 11 ++++
 include/hw/qdev-core.h              | 10 ++--
 include/monitor/qdev.h              |  2 +-
 hw/arm/virt.c                       |  2 +-
 hw/core/qdev.c                      |  6 +-
 hw/net/virtio-net.c                 |  4 +-
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/ppc/e500.c                       |  2 +-
 hw/vfio/pci.c                       |  4 +-
 hw/xen/xen-legacy-backend.c         |  3 +-
 qom/object.c                        |  7 +--
 qom/object_interfaces.c             | 17 ++----
 softmmu/qdev-monitor.c              | 90 +++++++++++++++++------------
 softmmu/vl.c                        | 58 ++++++++++++++++---
 util/qemu-option.c                  |  4 +-
 tests/qemu-iotests/051              |  2 +-
 tests/qemu-iotests/051.pc.out       |  4 +-
 tests/qemu-iotests/245              |  4 +-
 19 files changed, 161 insertions(+), 86 deletions(-)

-- 
2.31.1


