Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F02152E0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 09:10:23 +0200 (CEST)
Received: from localhost ([::1]:54516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsLGg-00062W-EF
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 03:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsLFv-0005be-Px
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:09:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35788
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsLFt-0001R8-L7
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 03:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594019372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKtcDlc4XXKZHMBvWcBxVIuXns8M1NiBGZYD99+1xbk=;
 b=JtBBgewZ/opjGjw1vIN0uBUmliM/M1RrN8pS324UI5kT8U33MiI+hgi7RNhugaoeaM3eKM
 1cQtGO//5jjm+d+aAMJvXEYwfTwb4bHj4jxLEWsX64TT6vm9GobigC9ajfdNs6J2hxxVBk
 fR5GgKifWIceS1+BOx0cqOMJC0hMFZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-KCGs6n8BPj65LkdRCvjWDw-1; Mon, 06 Jul 2020 03:09:30 -0400
X-MC-Unique: KCGs6n8BPj65LkdRCvjWDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6F10BFC1;
 Mon,  6 Jul 2020 07:09:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A13928550;
 Mon,  6 Jul 2020 07:09:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CA97F1138648; Mon,  6 Jul 2020 09:09:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] hw/core/qdev: Increase qdev_realize() kindness
References: <20200705221430.30207-1-f4bug@amsat.org>
Date: Mon, 06 Jul 2020 09:09:27 +0200
In-Reply-To: <20200705221430.30207-1-f4bug@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 6 Jul 2020 00:14:30
 +0200")
Message-ID: <87fta5glw8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:59:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Since commit 510ef98dca5, qdev_realize() aborts if bus-less
> device is realized on a bus. Be kind with the developer by
> displaying a hint about what is wrong.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> v2: Use errp (bonzini suggestion)
>
> Paolo, I was tempted to check errp is really &error_abort else
> it is an error! :P
>
>     } else if (DEVICE_GET_CLASS(dev)->bus_type) {
>         error_setg(errp, "%s: Unexpected bus '%s' for bus-less device '%s=
'",
>                    __func__, DEVICE_GET_CLASS(dev)->bus_type,
>                    object_get_typename(OBJECT(dev)));
>         assert(errp =3D=3D &error_abort); // <--------------

Don't!

Functions taking an Error **errp parameter to report errors should never
examine the argument.

The Error API is for separating concerns.  The callee's concern is
detecting errors and failing cleanly.  *Handling* the errors is the
caller's concern.

To simplify common handling patterns, we provide convenience arguments
&error_abort, &error_fatal, and NULL.  Their use is exclusively the
caller's concern.

Examining the argument undermines the separation of concerns.

>         return false;
>     }
> ---
>  hw/core/qdev.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 2131c7f951..9d1530c39d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -392,8 +392,11 @@ bool qdev_realize(DeviceState *dev, BusState *bus, E=
rror **errp)
> =20
>      if (bus) {
>          qdev_set_parent_bus(dev, bus);
> -    } else {
> -        assert(!DEVICE_GET_CLASS(dev)->bus_type);
> +    } else if (DEVICE_GET_CLASS(dev)->bus_type) {
> +        error_setg(errp, "%s: Unexpected bus '%s' for bus-less device '%=
s'",
> +                   __func__, DEVICE_GET_CLASS(dev)->bus_type,
> +                   object_get_typename(OBJECT(dev)));
> +        return false;
>      }
> =20
>      object_property_set_bool(OBJECT(dev), true, "realized", &err);

Scratch __func__.  error_setg() records __FILE__, __LINE__ and __func__,
and error_handle_fatal() prints them.

Always, always, always test your error messages.  If they are impossible
to test, mock up the error.  If mocking up is too much trouble, then
reporting the error nicely is, too.

That said, this one matters to me only insofar as it sets a bad example.
I don't actually care how impossible error messages come out :)


