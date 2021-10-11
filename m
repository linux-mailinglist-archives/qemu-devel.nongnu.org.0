Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F276428CB2
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:09:25 +0200 (CEST)
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZu7Q-0001o7-Dy
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu3a-0005oC-MZ
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZu3X-0003Co-Oz
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633953923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3GwinoEmzTDFxRrP5WggJE4T1pGwPDZKtW8zHB/BeJs=;
 b=Ov+mJ5nLuKpedhLx3SlJMVKxELeu3DTzjxBrFiHG7S43Uufedi7QDiGWGhE8IGOSFIZs9E
 j5CNJIOJ01/wMKInB993HszbJwCqjpUuufYJxfwQLpSYpEBawUAEBKXtX7rrdfveP+zkGJ
 NmflLYglsDTXVcnuOnd3PjpryxWmI8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-z258XEPTNKyYbtbQNfgT6g-1; Mon, 11 Oct 2021 08:05:21 -0400
X-MC-Unique: z258XEPTNKyYbtbQNfgT6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFCE0CC621;
 Mon, 11 Oct 2021 12:05:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FF1960938;
 Mon, 11 Oct 2021 12:05:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 731C018003BE; Mon, 11 Oct 2021 14:05:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Date: Mon, 11 Oct 2021 14:04:58 +0200
Message-Id: <20211011120504.254053-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=0D
=0D
Gerd Hoffmann (6):=0D
  pci: implement power state=0D
  pcie: implement slow power control for pcie root ports=0D
  pcie: add power indicator blink check=0D
  pcie: factor out pcie_cap_slot_unplug()=0D
  pcie: fast unplug when slot power is off=0D
  pcie: expire pending delete=0D
=0D
 include/hw/pci/pci.h   |  2 ++=0D
 include/hw/qdev-core.h |  1 +=0D
 hw/pci/pci.c           | 25 +++++++++++--=0D
 hw/pci/pci_host.c      |  6 ++--=0D
 hw/pci/pcie.c          | 82 ++++++++++++++++++++++++++++++++++--------=0D
 softmmu/qdev-monitor.c |  4 ++-=0D
 6 files changed, 101 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


