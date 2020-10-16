Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42F29044D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 13:47:40 +0200 (CEST)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTOCx-0006ux-Jc
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 07:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO99-0002Kn-N5
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kTO97-0002Et-UJ
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 07:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602848621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jFeXj/rHB6bo9Wt7HTyYP6TC5aBPvcBdhU1KmLPp3AY=;
 b=P3pMIXFR7mGg/TgFF2/I2ifOvrBMfqSgpgb33wT0POccov78oBB7Ewzh0gIhZz9bz3tT4+
 Dz/2YvT3CPynHy9ebcgS9Ln+IYndzyzmszWrUtBTUWY7L4hVvvucbTqNwG8Aydj2FRFqOG
 mCzqAWzkiHmgp7gM3EN1j7/WtzuLT6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-J3RiGWq2PA6j-hF2WDYPnw-1; Fri, 16 Oct 2020 07:43:39 -0400
X-MC-Unique: J3RiGWq2PA6j-hF2WDYPnw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AFCC86ABD1;
 Fri, 16 Oct 2020 11:43:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3184E6EF58;
 Fri, 16 Oct 2020 11:43:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 46BB511AB5; Fri, 16 Oct 2020 13:43:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] RfC: microvm: add second ioapic
Date: Fri, 16 Oct 2020 13:43:24 +0200
Message-Id: <20201016114328.18835-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 03:57:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a second ioapic to microvm.  Gives us more IRQ lines we can=0D
use for virtio-mmio devices.  Bump number of possible virtio-mmio=0D
devices from 8 to 24.=0D
=0D
Gerd Hoffmann (4):=0D
  microvm: make number of virtio transports runtime configurable=0D
  microvm: make pcie irq base runtime configurable=0D
  microvm: add second ioapic=0D
  microvm: reconfigure irqs if second ioapic is available=0D
=0D
 include/hw/i386/ioapic_internal.h |  2 +-=0D
 include/hw/i386/microvm.h         |  4 +--=0D
 include/hw/i386/x86.h             |  1 +=0D
 hw/i386/acpi-common.c             | 12 ++++++-=0D
 hw/i386/microvm.c                 | 54 +++++++++++++++++++++++++------=0D
 5 files changed, 60 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.27.0=0D
=0D


