Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4C46C1C5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 18:30:46 +0100 (CET)
Received: from localhost ([::1]:37282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mueIf-0006x5-5M
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 12:30:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mueCE-0000Kh-Gv
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mueC7-0002Yi-5H
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 12:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638897836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w3OaevdVepH34xqC+h1dpnTR6KY9qnzkJPlzR5wpdOw=;
 b=Ocg5+3B/OxfdqoX1X+3xHfeEXRJIkhyd5cXKYwAdiIZRAlPK9kOe4pShRh4wVdK9O4sDTq
 pVBPF656H8Qv3JuEvIYmd7lKKk+CmeRcQURud/5yFcEQPFfC9J4TLqTngUNTqJ5iDFw/LH
 YD5usIlHij9lC4bMIbGjsqTWLl4Dabc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-JOST7YT6NY-bYaf8K8053w-1; Tue, 07 Dec 2021 12:23:53 -0500
X-MC-Unique: JOST7YT6NY-bYaf8K8053w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E45F181CCB4
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 17:23:50 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E16119EF9;
 Tue,  7 Dec 2021 17:23:43 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/4] tests/qtest: add some tests for virtio-net failover
Date: Tue,  7 Dec 2021 18:23:38 +0100
Message-Id: <20211207172342.4058491-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
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
v7:=0D
- merge patch 3 and 4 as the fix for ACPI unplug has been merged=0D
- address Thomas' comments=0D
- add a dependency on slirp in meson.build=0D
- check FAILOVER_NEGOCIATED device-id and MIGRATION status=0D
  on destination, update UNPLUG_PRIMARY event checking=0D
- fix an object_unref() in test_migrate_abort_active()=0D
- fix typo s/whan/when/=0D
=0D
v6:=0D
- manage more than 2 root ports=0D
- add a function to check if a card is available or not=0D
- check migration state=0D
- add cancelled migration test cases=0D
- rename tests=0D
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
  test/libqtest: add some virtio-net failover migration cancelling tests=0D
  tests/libqtest: add a migration test with two couples of failover=0D
    devices=0D
=0D
 include/hw/pci/pci_bridge.h       |    8 +=0D
 tests/qtest/libqos/pci.c          |  118 +++=0D
 tests/qtest/libqos/pci.h          |    1 +=0D
 tests/qtest/meson.build           |    4 +=0D
 tests/qtest/virtio-net-failover.c | 1324 +++++++++++++++++++++++++++++=0D
 5 files changed, 1455 insertions(+)=0D
 create mode 100644 tests/qtest/virtio-net-failover.c=0D
=0D
--=20=0D
2.33.1=0D
=0D


