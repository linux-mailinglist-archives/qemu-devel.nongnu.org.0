Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5340456C25
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:11:36 +0100 (CET)
Received: from localhost ([::1]:47372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzvj-0005Hh-Cc
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:11:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnzsH-0003PV-Cf
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:08:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mnzsF-0003jg-A8
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:08:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637312878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5xNdXmgbCCfPfPFx/7UZit2eQi+15580AcgIWScTNqU=;
 b=giEl6kaiEcsWSiHMp7JfOc7Dxn3RtWStKBcEty8oubFHJQ/1GnfiLMYLXJrRTnH7UFwGyh
 oDsrrcwZHydcWygpJ5HmcXp/IpEmz6XMmAOofMBsKPB9N6n1TP5QElmy8yzf1Wd/a1XmZT
 jie9t9haIRsZgLeEtM0znA/pxjbJ3uQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-v-9A7Yp0Pb6nJhGXNEQK1g-1; Fri, 19 Nov 2021 04:07:55 -0500
X-MC-Unique: v-9A7Yp0Pb6nJhGXNEQK1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B0FF87504B;
 Fri, 19 Nov 2021 09:07:54 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 256845D740;
 Fri, 19 Nov 2021 09:07:19 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/4] tests/qtest: add some tests for virtio-net failover
Date: Fri, 19 Nov 2021 10:07:14 +0100
Message-Id: <20211119090718.440793-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
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
- check the migration triggers the unplug and the hotplug=0D
=0D
There is one preliminary patch in the series:=0D
=0D
- PATCH 1 introduces a function to enable PCI bridge.=0D
  Failover needs to be plugged on a pcie-root-port and while=0D
  the root port is not configured the cards behind it are not=0D
  available=0D
=0D
v5:=0D
- re-add the wait-unplug test that has been removed from v4 by mistake.=0D
=0D
v4:=0D
- rely on query-migrate status to know the migration state rather than=0D
  to wait the STOP event.=0D
- remove the patch to add time out to qtest_qmp_eventwait()=0D
=0D
v3:=0D
- fix a bug with ACPI unplug and add the related test=0D
=0D
v2:=0D
- remove PATCH 1 that introduced a function that can be replaced by=0D
  qobject_to_json_pretty() (Markus)=0D
- Add migration to a file and from the file to check the card is=0D
  correctly unplugged on the source, and hotplugged on the dest=0D
- Add an ACPI call to eject the card as the kernel would do=0D
=0D
Laurent Vivier (4):=0D
  qtest/libqos: add a function to initialize secondary PCI buses=0D
  tests/qtest: add some tests for virtio-net failover=0D
  failover: fix unplug pending detection=0D
  tests/libqtest: update virtio-net failover test=0D
=0D
 hw/acpi/pcihp.c                   |  30 +-=0D
 include/hw/pci/pci_bridge.h       |   8 +=0D
 tests/qtest/libqos/pci.c          | 118 ++++++=0D
 tests/qtest/libqos/pci.h          |   1 +=0D
 tests/qtest/meson.build           |   3 +=0D
 tests/qtest/virtio-net-failover.c | 681 ++++++++++++++++++++++++++++++=0D
 6 files changed, 838 insertions(+), 3 deletions(-)=0D
 create mode 100644 tests/qtest/virtio-net-failover.c=0D
=0D
--=20=0D
2.33.1=0D
=0D


