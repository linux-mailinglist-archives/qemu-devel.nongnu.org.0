Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB0A44D70C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:14:30 +0100 (CET)
Received: from localhost ([::1]:40834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml9uP-0002VW-UM
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:14:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pN-0006Vi-IQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pH-0004zC-Mh
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636636150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kOO7aie4Bxiir4M6QJYLSohRKYFDep6q63/QLMulHrU=;
 b=dWTXghucI4WQoxKNyiKWBLuqrXqJ8L7QqQCnrGJED4ARvyePD7S/XZ+BHFv4MaMA/eCHGv
 4KbIHhQuMSUibuYhMLpYZ0SELJ58wDV2U/XtFgzv8GTasdCqVjsuYISTUU+g3ODXQu6Tyu
 Gd3QnpA6f91++z7CRUvwg6S4ytZMJW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-zdB_OadwNTW_M5y50YFPVw-1; Thu, 11 Nov 2021 08:09:09 -0500
X-MC-Unique: zdB_OadwNTW_M5y50YFPVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50201802DF1;
 Thu, 11 Nov 2021 13:09:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5B156A8F;
 Thu, 11 Nov 2021 13:09:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0AD41800925; Thu, 11 Nov 2021 14:08:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] try improve native hotplug for pcie root ports
Date: Thu, 11 Nov 2021 14:08:53 +0100
Message-Id: <20211111130859.1171890-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:=0D
 - rebase to latest master, solve conflicts.=0D
 - drop 'RfC' from subject.=0D
=0D
Gerd Hoffmann (6):=0D
  pci: implement power state=0D
  pcie: implement slot power control for pcie root ports=0D
  pcie: add power indicator blink check=0D
  pcie: factor out pcie_cap_slot_unplug()=0D
  pcie: fast unplug when slot power is off=0D
  pcie: expire pending delete=0D
=0D
 include/hw/pci/pci.h   |  2 ++=0D
 include/hw/qdev-core.h |  1 +=0D
 hw/pci/pci.c           | 25 +++++++++++--=0D
 hw/pci/pci_host.c      |  6 ++--=0D
 hw/pci/pcie.c          | 79 +++++++++++++++++++++++++++++++++++-------=0D
 softmmu/qdev-monitor.c |  4 ++-=0D
 6 files changed, 100 insertions(+), 17 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


