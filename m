Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E1A10CE0F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 18:45:03 +0100 (CET)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaNqf-0003XG-Or
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 12:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iaMkC-000241-QX
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:34:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iaMk7-0001go-5a
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:34:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28055
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iaMk3-0001b9-J2
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:34:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574958845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NkDMTgVN8cc1e+3USgYsQx31NoASuCGnlr9IQKkez8=;
 b=f9k+4/3Ar8DRPtAT4e2k3StiPAaMwOqwJ6V7bLucfTPsmxK+bIcUKmUSUYXuTYlRkQCieA
 y1Vl++l6oY8yqHR5xFyjIGiyHy/TCM0gLrsFfBCOXGAc9X8R1bidOkGOE15b4Z5gayo2jW
 4+MhhtJkmOTmbr/joT/m/AQ5LBiUQ3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-BXUGQm77MYypLN5StSgbkg-1; Thu, 28 Nov 2019 11:34:04 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C1FDB93;
 Thu, 28 Nov 2019 16:34:02 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9877A600C8;
 Thu, 28 Nov 2019 16:33:59 +0000 (UTC)
Date: Thu, 28 Nov 2019 13:33:58 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: qom device lifecycle interaction with hotplug/hotunplug ?
Message-ID: <20191128163358.GC14595@habkost.net>
References: <CAFEAcA9E-Z-RPwFsAiz9Pi3_MtBUFEU7enJFVrpOQ7UKW8e1DQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9E-Z-RPwFsAiz9Pi3_MtBUFEU7enJFVrpOQ7UKW8e1DQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BXUGQm77MYypLN5StSgbkg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 28, 2019 at 04:00:06PM +0000, Peter Maydell wrote:
> Hi; this is a question which came up in Damien's reset series
> which I don't know the answer to:
>=20
> What is the interaction of the QOM device lifecycle (instance_init/realiz=
e/
> unrealize/instance_finalize) with hotplug and hot-unplug ? I couldn't
> find any documentation of this but maybe I was looking in the wrong
> place...
>=20
> Looking at device_set_realized() it seems like we treat "realize"
> as meaning "and also do the hot-plug if this is a device we're
> trying to hotplug". On the other hand hot-unplug is I think the
> other way around: when we get a hot-unplug event we assume that
> it should also imply an "unrealize" (but just unrealizing doesn't
> auto-hot-unplug) ?

Your description seems accurate, and I agree it is confusing.

It would be more consistent if realized=3Dtrue didn't plug the
device automatically, and qdev_device_add() asked the hotplug
handler to plug the device instead.

>=20
> Once a device is hot-unplugged (and thus unrealized) is it valid
> for it to be re-hot-plugged, or is the assumption that it's then
> destroyed and a fresh device is created if the user wants to plug
> something in again later ? Put another way, is it valid for a qdev
> device to see state transitions realize -> unrealize -> realize ?

My interpretation is that this is valid in theory, but likely to
crash a large portion of our devices if we tried it.

--=20
Eduardo


