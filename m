Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55644193FA6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 14:24:35 +0100 (CET)
Received: from localhost ([::1]:51484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHSUs-00077u-DF
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 09:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jHSTn-0005ot-CO
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jHSTm-0002UL-CU
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:23:27 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:29932)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jHSTm-0002UF-1i
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 09:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585229005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAksK0cApWjz3rYuvl1Wzp9hhiFAIOZbGLE3FLHfEt8=;
 b=bDp5puXww+3glGJg/6ghgUwyd4sbk6pRipbwxj3XuO4gDlfxF/BgMc+8a+d0dZzOrO6I3H
 WSr46TH7kY/dBmDVv7HDiDNzWB+Lgemq9p/4e62eZR03cxTjJC37Fm4MR0Y0+9+h8p4h7J
 nbtrc9Uu28atOyMkKzC1QIeN5wbBpy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-2fY6K8pEN1yH4Uw4xWEJlg-1; Thu, 26 Mar 2020 09:23:24 -0400
X-MC-Unique: 2fY6K8pEN1yH4Uw4xWEJlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D24E8010F2;
 Thu, 26 Mar 2020 13:23:23 +0000 (UTC)
Received: from localhost (unknown [10.40.208.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E92FD5E008;
 Thu, 26 Mar 2020 13:23:18 +0000 (UTC)
Date: Thu, 26 Mar 2020 14:23:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: acpi_pcihp_eject_slot() bug if passed 'slots == 0'
Message-ID: <20200326142317.018c13e1@redhat.com>
In-Reply-To: <CAFEAcA-oWBjOXWmnLvPww9wrty_QbSc+Xv3BY3sQAnEXFkfQbA@mail.gmail.com>
References: <CAFEAcA-oWBjOXWmnLvPww9wrty_QbSc+Xv3BY3sQAnEXFkfQbA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Mar 2020 11:52:36 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Hi; Coverity spots that if hw/acpi/pcihp.c:acpi_pcihp_eject_slot()
> is passed a zero 'slots' argument then ctz32(slots) will return 32,
> and then the code that does '1U << slot' is C undefined behaviour
> because it's an oversized shift. (This is CID 1421896.)
> 
> Since the pci_write() function in this file can call
> acpi_pcihp_eject_slot() with an arbitrary value from the guest,
> I think we need to handle 'slots == 0' safely. But what should
> the behaviour be?

it also uncovers a bug, where we are not able to eject slot 0 on bridge,
can be reproduced with:

 -enable-kvm -m 4G -device pci-bridge,chassis_nr=1 -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=on -device virtio-net-pci,bus=pci.1,addr=0,id=netdev12

(monitor) device_del netdev12
(monitor) qtree # still shows the device

reason is that acpi_pcihp_eject_slot()
   if (PCI_SLOT(dev->devfn) == slot) { # doesn't  match (0 != 32)

so device is not deleted

> thanks
> -- PMM
> 


