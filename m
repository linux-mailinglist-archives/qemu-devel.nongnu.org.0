Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5508A4140D1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:47:39 +0200 (CEST)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuAT-0004qT-A5
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSu9V-00044o-1v
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:46:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mSu9T-00073W-EN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632285993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUvjpj4VecKYZq87cYI3dJcc6ljbzVpji8Qs8a6sfFw=;
 b=MOA1nPj0A22QgKrEnOMEx/c7gy8e110icwidRXjUBh7+LrbnIUeYMVuxOI7YR+hjjbo46c
 xm4OjJAiVpMl5PGxqJo9oT8ll4baBeqFwtBdNC+C/FIbxSW2pvEvi20wanM6lHvgDar3Q3
 g+AMzHLS9rTh6p7bLcnPLQ/Yt6y32m8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-MSKwRW9iPBu51V8PGGCYwg-1; Wed, 22 Sep 2021 00:46:29 -0400
X-MC-Unique: MSKwRW9iPBu51V8PGGCYwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B19581006AA7;
 Wed, 22 Sep 2021 04:46:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 703F160C7F;
 Wed, 22 Sep 2021 04:46:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A1CB113865F; Wed, 22 Sep 2021 06:46:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ensuring a machine's buses have unique names
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
 <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
Date: Wed, 22 Sep 2021 06:46:27 +0200
In-Reply-To: <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
 (Peter Maydell's message of "Tue, 14 Sep 2021 16:25:49 +0100")
Message-ID: <87r1dhrzdo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

[...]

> I'm not sure how best to sort this tangle out. We could:
>  * make controller devices pass in NULL as bus name; this
>    means that some bus names will change, which is an annoying
>    breakage but for these minor bus types we can probably
>    get away with it. This brings these buses into line with
>    how we've been handling uniqueness for ide and scsi.
>  * drop the 'name' argument for buses like ide that don't
>    actually have any callsites that need to pass a name
>  * split into foo_bus_new() and foo_bus_new_named() so that
>    the "easy default" doesn't pass a name, and there's at least
>    a place to put a doc comment explaining that the name passed
>    into the _named() version should be unique ??
>  * something else ?

A possible work-around for non-unique bus IDs is QOM paths.  Precedence,
kind of:

commit 6287d827d494b5850049584c3f7fb1a589dbb1de
Author: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Date:   Fri Sep 11 13:33:56 2015 +0100

    monitor: allow device_del to accept QOM paths
   =20
    Currently device_del requires that the client provide the
    device short ID. device_add allows devices to be created
    without giving an ID, at which point there is no way to
    delete them with device_del. The QOM object path, however,
    provides an alternative way to identify the devices.
   =20
    Allowing device_del to accept an object path ensures all
    devices are deletable regardless of whether they have an
    ID.
   =20
     (qemu) device_add usb-mouse
     (qemu) qom-list /machine/peripheral-anon
     device[0] (child<usb-mouse>)
     type (string)
     (qemu) device_del /machine/peripheral-anon/device[0]
   =20
    Devices are required to be marked as hotpluggable
    otherwise an error is raised
   =20
     (qemu) device_del /machine/unattached/device[4]
     Device 'PIIX3' does not support hotplugging
   =20
    Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
    Message-Id: <1441974836-17476-1-git-send-email-berrange@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    [Commit message touched up, accidental white-space change dropped]
    Signed-off-by: Markus Armbruster <armbru@redhat.com>

Their length makes QOM paths inconvenient for humans, but machines won't
care.

However, we already burned /-separated paths for paths within the qdev
tree (the thing info qtree shows).  Friends don't let friends use them
(I should be able to dig up a critique if you're curious).

Without that, it could be made to work like

    -device virtio-scsi,id=3Dvscsi
    -device scsi-cd,bus=3D/machine/peripheral/vscsi/virtio-backend/vscsi.0

We should consult with libvirt developers before we go down this route.


