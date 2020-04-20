Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1341B0E0B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 16:14:23 +0200 (CEST)
Received: from localhost ([::1]:36606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQXBm-0006uB-U0
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 10:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43836 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jQXAf-0005py-Aj
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:13:14 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jQXAe-0000jJ-8Q
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:13:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31040
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jQXAd-0000e3-L2
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 10:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=upgZfHQPc+HrjbtbJkZjyDq2+PrCjWbIWR0YLVu16rw=;
 b=ZZo7vKIe+td996Y2/ENiM+iEZKg8lgZ/zA9Cgg17UcLFuWSpC+cWByHfmuNUrP+XS6fk2l
 jotvu2QLAq32zTBC2fulWYbMEWjGJ+2Gz9oSxaY9nXrnOSBfUAFeS1z7r2+7vdoMRZlSNZ
 p2k1JHkkE7qpKH7JWhkaBBEnMXcFwRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-aZFES6-QMNyPYIpW7JL0fw-1; Mon, 20 Apr 2020 10:13:07 -0400
X-MC-Unique: aZFES6-QMNyPYIpW7JL0fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62F37800D5C;
 Mon, 20 Apr 2020 14:13:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B72B60C80;
 Mon, 20 Apr 2020 14:13:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BC83516E2C; Mon, 20 Apr 2020 16:13:03 +0200 (CEST)
Date: Mon, 20 Apr 2020 16:13:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [edk2-discuss] Load Option passing. Either bugs or my confusion.
Message-ID: <20200420141303.dxjqgvmzglrjtsly@sirius.home.kraxel.org>
References: <623b1855-285c-cce3-c806-c17e5fd217ea@redhat.com>
 <5211.1586899245384995995@groups.io>
 <a972450d-8834-ae87-e4e3-5263a41d1735@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a972450d-8834-ae87-e4e3-5263a41d1735@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 04:32:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Hou Qiming <hqm03ster@gmail.com>,
 edk2-devel-groups-io <devel@edk2.groups.io>,
 qemu devel list <qemu-devel@nongnu.org>, discuss@edk2.groups.io,
 valerij zaporogeci <vlrzprgts@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> So I would say that the symptom you see is a QEMU v4.1.0 regression. The
> QemuRamfbGraphicsOutputSetMode() function in the OVMF ramfb driver
> certainly needs the QemuFwCfgWriteBytes() call to work, for changing the
> resolution.

Oh?  QemuRamfbGraphicsOutputSetMode() can be called multiple times?
How does that happen?

> (1) Registering a device reset handler in QEMU seems sufficient, so that
> QEMU forget about the currently shared RAMFB area at platform reset.

That happens.  After system reset you can write configuration again (once).

The guest os should not play with ramfb.  It is supposed to be setup by
the firmware (ovmf driver or vgabios rom) as boot display, then never be
re-configured again ...

cheers,
  Gerd


