Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D670435E14
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 11:37:44 +0200 (CEST)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUW7-00083I-BA
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 05:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdUUc-000783-AP
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdUUW-0004O4-Ci
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634808962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tNh5j6nByuBahZFUIyGVwR+jPIfLJGfsi0wQzqugNY0=;
 b=V54vJ0FJRHbB0TezwREMcfKSw0ud8HTCdTdYOZmK/AO7MyJGfsi8NiLdXVu09tfkqNdYQc
 C8aBRMiS4Gu61berNB5M+Z1zxk5vf2isVf1JiN6SWuilkihNqaZHO0kCmhQn4lDVYBSLfO
 GdWftUALyrqYmXyRy0rD30JHlwM/9/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-bU5t3I3XMNySzd3zJOLzBw-1; Thu, 21 Oct 2021 05:35:59 -0400
X-MC-Unique: bU5t3I3XMNySzd3zJOLzBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DFBF19067FE;
 Thu, 21 Oct 2021 09:35:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 662E85C1D5;
 Thu, 21 Oct 2021 09:35:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EDBC511380A7; Thu, 21 Oct 2021 11:35:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v6 3/5] qapi/monitor: allow VNC display id in
 set/expire_password
References: <20211020135500.2384930-1-s.reiter@proxmox.com>
 <20211020135500.2384930-4-s.reiter@proxmox.com>
 <87zgr3ezmj.fsf@dusky.pond.sub.org>
 <f562acca-2c34-cce5-f918-f94f7962b33e@proxmox.com>
Date: Thu, 21 Oct 2021 11:35:37 +0200
In-Reply-To: <f562acca-2c34-cce5-f918-f94f7962b33e@proxmox.com> (Stefan
 Reiter's message of "Thu, 21 Oct 2021 10:42:31 +0200")
Message-ID: <87ee8een4m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> On 10/21/21 7:05 AM, Markus Armbruster wrote:
>> Stefan Reiter <s.reiter@proxmox.com> writes:
>>=20
>>> It is possible to specify more than one VNC server on the command line,
>>> either with an explicit ID or the auto-generated ones =C3=A0 la "defaul=
t",
>>> "vnc2", "vnc3", ...
>>>
>>> It is not possible to change the password on one of these extra VNC
>>> displays though. Fix this by adding a "display" parameter to the
>>> "set_password" and "expire_password" QMP and HMP commands.
>>>
>>> For HMP, the display is specified using the "-d" value flag.
>>>
>>> For QMP, the schema is updated to explicitly express the supported
>>> variants of the commands with protocol-discriminated unions.
>>>
>>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>>> ---

[...]

>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> index b8abe69609..daa4a8e106 100644
>>> --- a/monitor/hmp-cmds.c
>>> +++ b/monitor/hmp-cmds.c
>>> @@ -1451,26 +1451,39 @@ void hmp_set_password(Monitor *mon, const QDict=
 *qdict)
>>>   {
>>>       const char *protocol  =3D qdict_get_str(qdict, "protocol");
>>>       const char *password  =3D qdict_get_str(qdict, "password");
>>> +    const char *display =3D qdict_get_try_str(qdict, "display");
>>>       const char *connected =3D qdict_get_try_str(qdict, "connected");
>>>       Error *err =3D NULL;
>>> -    DisplayProtocol proto;
>>> -    SetPasswordAction conn;
>>>  =20
>>> -    proto =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>>> -                            DISPLAY_PROTOCOL_VNC, &err);
>>> +    SetPasswordOptions opts =3D {
>>> +        .password =3D g_strdup(password),
>>> +        .u.vnc.display =3D NULL,
>>> +    };
>>> +
>>> +    opts.protocol =3D qapi_enum_parse(&DisplayProtocol_lookup, protoco=
l,
>>> +                                    DISPLAY_PROTOCOL_VNC, &err);
>>>       if (err) {
>>>           goto out;
>>>       }
>>>  =20
>>> -    conn =3D qapi_enum_parse(&SetPasswordAction_lookup, connected,
>>> -                           SET_PASSWORD_ACTION_KEEP, &err);
>>> -    if (err) {
>>> -        goto out;
>>> +    if (opts.protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
>>> +        opts.u.vnc.has_display =3D !!display;
>>> +        opts.u.vnc.display =3D g_strdup(display);
>>> +    } else if (opts.protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
>>> +        opts.u.spice.has_connected =3D !!connected;
>>> +        opts.u.spice.connected =3D
>>> +            qapi_enum_parse(&SetPasswordAction_lookup, connected,
>>> +                            SET_PASSWORD_ACTION_KEEP, &err);
>>> +        if (err) {
>>> +            goto out;
>>> +        }
>>>       }
>>>  =20
>>> -    qmp_set_password(proto, password, !!connected, conn, &err);
>>> +    qmp_set_password(&opts, &err);
>>>  =20
>>>   out:
>>> +    g_free(opts.password);
>>> +    g_free(opts.u.vnc.display);
>>=20
>> Uh-oh...
>>=20
>> For DISPLAY_PROTOCOL_SPICE, we execute
>>=20
>>             .u.vnc.display =3D NULL,
>>             opts.u.spice.has_connected =3D !!connected;
>>             opts.u.spice.connected =3D
>>                 qapi_enum_parse(&SetPasswordAction_lookup, connected,
>>                                 SET_PASSWORD_ACTION_KEEP, &err);
>>             opts.u.vnc.has_display =3D !!display;
>>         g_free(opts.u.vnc.display);
>>=20
>> The assignments to opts.u.spice.has_connected and opts.u.spice_connected
>> clobber opts.u.vnc.display.
>>=20
>> The simplest fix is to pass @display directly.  Precedence:
>> hmp_drive_mirror().
>
> With "directly", I assume you mean without g_strdup, so:
>
>    opts.u.vnc.display =3D (char *)display;
>
> right?

Right.

>        Does it matter that we drop the 'const'?

It's ugly, but harmless.

qdict_get_try_str() returns const char * to discourage you from messing
with the string while it's in the QDict.

qmp_set_password() does not actually mess with its argument.

>> Do the same for @password, of course.
>>=20
>>>       hmp_handle_error(mon, err);
>>>   }
>>>  =20
>>> @@ -1478,18 +1491,30 @@ void hmp_expire_password(Monitor *mon, const QD=
ict *qdict)
>>>   {
>>>       const char *protocol  =3D qdict_get_str(qdict, "protocol");
>>>       const char *whenstr =3D qdict_get_str(qdict, "time");
>>> +    const char *display =3D qdict_get_try_str(qdict, "display");
>>>       Error *err =3D NULL;
>>> -    DisplayProtocol proto;
>>>  =20
>>> -    proto =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>>> -                            DISPLAY_PROTOCOL_VNC, &err);
>>> +    ExpirePasswordOptions opts =3D {
>>> +        .time =3D g_strdup(whenstr),
>>> +        .u.vnc.display =3D NULL,
>>> +    };
>>> +
>>> +    opts.protocol =3D qapi_enum_parse(&DisplayProtocol_lookup, protoco=
l,
>>> +                                    DISPLAY_PROTOCOL_VNC, &err);
>>>       if (err) {
>>>           goto out;
>>>       }
>>>  =20
>>> -    qmp_expire_password(proto, whenstr, &err);
>>> +    if (opts.protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
>>> +        opts.u.vnc.has_display =3D !!display;
>>> +        opts.u.vnc.display =3D g_strdup(display);
>>> +    }
>>=20
>> Use of -d with spice are silently ignored.  Do we care?  Same for
>> hmp_set_password() above.
>
> Depends on you, I don't. I think it's not worth catching even more
> in HMP, since it's clear there's only one SPICE display anyway, and
> it's all documented.

Up to the HMP maintainer, and we'll take silence as tacit agreement with
you :)

>>> +
>>> +    qmp_expire_password(&opts, &err);
>>>  =20
>>>   out:
>>> +    g_free(opts.time);
>>> +    g_free(opts.u.vnc.display);
>>=20
>> No uh-oh here, since opts.u.vnc is actually the only member of opts.u.
>> Still, let's pass @time and @display directly for consistency and
>> robustness.
>>=20
>>>       hmp_handle_error(mon, err);
>>>   }
>>>  =20
>>=20
>> [...]


