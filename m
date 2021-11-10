Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0DB44C2A2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:59:29 +0100 (CET)
Received: from localhost ([::1]:59324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mko8O-0003LW-L4
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mko5U-0007wL-7h
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mko5R-0006ys-4e
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:56:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636552583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=24BlDxfagQyKFv/HBo2XI9MsFX0dLK513/DBIwKf61g=;
 b=i2q9b83R3/oXedXLWByMkghrSx4yBTe1i94pd/OsGNRpR+K12s7wqVzG+RyU4Ey+AxAAC9
 xEY7JouVgkkFqqNVg0Dx97alOERgQcaDIh3VDSKIK7/LF4w0A2R3ckOhjQx7ih0JMah9dj
 /UwrrDpkjZHJlZC4c6jmbkzbEhPOT64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-AyhOW9azMcmIma3GXLkQPA-1; Wed, 10 Nov 2021 08:56:20 -0500
X-MC-Unique: AyhOW9azMcmIma3GXLkQPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB5B710144E3;
 Wed, 10 Nov 2021 13:56:19 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BB5760854;
 Wed, 10 Nov 2021 13:56:17 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tests/qtest: add some tests for virtio-net failover
Date: Wed, 10 Nov 2021 14:56:13 +0100
Message-Id: <20211110135616.1188725-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a qtest entry to test virtio-net failover feature.=0D
=0D
We check following error cases:=0D
=0D
- check missing id on device with failover_pair_id triggers an error=0D
- check a primary device plugged on a bus that doesn't support hotplug=0D
  triggers an error=0D
=0D
We check the status of the machine before and after hotplugging cards and=
=0D
feature negotiation:=0D
=0D
- check we don't see the primary device at boot if failover is on=0D
- check we see the primary device at boot if failover is off=0D
- check we don't see the primary device if failover is on=0D
  but failover_pair_id is not the one with on (I think this should be chang=
ed)=0D
- check the primary device is plugged after the feature negotiation=0D
- check the result if the primary device is plugged before standby device a=
nd=0D
  vice-versa=0D
- check the if the primary device is coldplugged and the standy device=0D
  hotplugged and vice-versa=0D
- check the migration triggers the unplug=0D
  -> this one needs to be improved as we can't actualy unplug the=0D
     card as the qtest framework doesn't allow to really do=0D
     the OS level unplug. So we receive the UNPLUG_PRIMARY=0D
     event but nothing more.=0D
=0D
There are two preliminary patches in the series:=0D
=0D
- PATCH 1 makes available functions that helped me to debug=0D
  the qmp command result. I think it's a good point to have them=0D
  available widely=0D
=0D
- PATCH 2 introduces a function to enable PCI bridge.=0D
  Failover needs to be plugged on a pcie-root-port and while=0D
  the root port is not configured the cards behind it are not=0D
  available=0D
=0D
Laurent Vivier (3):=0D
  qdict: make available dump_qobject(), dump_qdict(), dump_qlist()=0D
  qtest/libqos: add a function to initialize secondary PCI buses=0D
  tests/qtest: add some tests for virtio-net failover=0D
=0D
 block/qapi.c                      |  82 +----=0D
 include/hw/pci/pci_bridge.h       |   8 +=0D
 include/qapi/qmp/qdict.h          |   2 +=0D
 include/qapi/qmp/qlist.h          |   1 +=0D
 include/qapi/qmp/qobject.h        |   1 +=0D
 qobject/qdict.c                   |  25 ++=0D
 qobject/qlist.c                   |  17 +=0D
 qobject/qobject.c                 |  35 ++=0D
 tests/qtest/libqos/pci.c          | 118 +++++++=0D
 tests/qtest/libqos/pci.h          |   1 +=0D
 tests/qtest/meson.build           |   3 +=0D
 tests/qtest/virtio-net-failover.c | 567 ++++++++++++++++++++++++++++++=0D
 12 files changed, 779 insertions(+), 81 deletions(-)=0D
 create mode 100644 tests/qtest/virtio-net-failover.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


