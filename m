Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832DA1B40BB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 12:48:02 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRCvB-0001O1-J7
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 06:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCuI-0000rh-Mz
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jRCuH-0005Vf-Oa
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:47:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32661
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jRCuH-0005KJ-8i
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 06:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587552423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5OBL1VQVXIVmfADztb/txwmyRshzsNv/etQ+VrCI0Q=;
 b=AWTygc7L0aMeZvlyCJ4+z7cb9ouC82KgJga0+ZWOtS5tdpHG4qwlqyyGZOeKCmxEsOdVuR
 imGWZ56BSDKtWlNwrJZwMrpeKoZ4UvbO7hIYUfZTexoCqovXMa+AsgNtSCSHMusowuBkKq
 f/d1vcNQoAgEKOQwIZLdVdVbCooJnDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-g6NnuAZsMZSOG-tbQ3eCmA-1; Wed, 22 Apr 2020 06:47:02 -0400
X-MC-Unique: g6NnuAZsMZSOG-tbQ3eCmA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29B49801503;
 Wed, 22 Apr 2020 10:47:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DFEB600D2;
 Wed, 22 Apr 2020 10:46:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0B73316E2C; Wed, 22 Apr 2020 12:46:57 +0200 (CEST)
Date: Wed, 22 Apr 2020 12:46:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
Subject: Re: [PATCH] virtio-vga: fix virtio-vga bar ordering
Message-ID: <20200422104657.4fnzkp66l2c2m2cw@sirius.home.kraxel.org>
References: <20200421214853.14412-1-anthoine.bourgeois@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200421214853.14412-1-anthoine.bourgeois@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:57:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This fix exchange the modern io bar with the modern memory bar,
> replacing the msix bar that is never impacted anyway.

Well, msix was placed in bar 4 intentionally.  That keeps bar 1 (default
msix location) free, so we have the option to turn bar 0 (vga compat
vram) into a 64bit bar without shuffling around things.

> -    vpci_dev->msix_bar_idx =3D 4;

Please don't.

> +    vpci_dev->modern_io_bar_idx =3D 4;

We can use bar 5 instead.

Alternatively just throw an error saying that modern-pio-notify is not
supported.

> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 4cb784389c..9c5efaa06e 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1705,6 +1705,7 @@ static void virtio_pci_realize(PCIDevice *pci_dev, =
Error **errp)
>       *
>       *   region 0   --  virtio legacy io bar
>       *   region 1   --  msi-x bar
> +     *   region 2   --  virtio modern io bar
>       *   region 4+5 --  virtio modern memory (64bit) bar

Separate patch please.  Also worth noting that the modern io bar is off
by default.

cheers,
  Gerd


