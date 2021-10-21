Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE40435A51
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 07:23:42 +0200 (CEST)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQYH-0006D9-P1
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 01:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdQH7-0002Sy-J6
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 01:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mdQH3-0005Au-5x
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 01:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634792751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5Frv7rHrn1hm/YoURSmiKTVsjqfNyGzpCtJzeP2hN8=;
 b=dQ5cjLLuJ0NIKKer1H2LCl3ut1Og5IbPZ3/owLoGFPNBlyeVPTo4BHrNM2La59tKbxAzw4
 15gWP/arsh+ft9wA7BPAoyAn+bd4d/WFncKmImp2t925jlLFNSuYte5svvnxd34fhiVxZO
 d1Z9WkkMegf5I/2xMxNcpOvF+MM0PdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-Selk-HxINo20emSyDu4aaQ-1; Thu, 21 Oct 2021 01:05:49 -0400
X-MC-Unique: Selk-HxINo20emSyDu4aaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A23510A8E00;
 Thu, 21 Oct 2021 05:05:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 562B960D30;
 Thu, 21 Oct 2021 05:05:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CFAE711380A7; Thu, 21 Oct 2021 07:05:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v6 3/5] qapi/monitor: allow VNC display id in
 set/expire_password
References: <20211020135500.2384930-1-s.reiter@proxmox.com>
 <20211020135500.2384930-4-s.reiter@proxmox.com>
Date: Thu, 21 Oct 2021 07:05:40 +0200
In-Reply-To: <20211020135500.2384930-4-s.reiter@proxmox.com> (Stefan Reiter's
 message of "Wed, 20 Oct 2021 15:54:58 +0200")
Message-ID: <87zgr3ezmj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Reiter <s.reiter@proxmox.com> writes:

> It is possible to specify more than one VNC server on the command line,
> either with an explicit ID or the auto-generated ones =C3=A0 la "default"=
,
> "vnc2", "vnc3", ...
>
> It is not possible to change the password on one of these extra VNC
> displays though. Fix this by adding a "display" parameter to the
> "set_password" and "expire_password" QMP and HMP commands.
>
> For HMP, the display is specified using the "-d" value flag.
>
> For QMP, the schema is updated to explicitly express the supported
> variants of the commands with protocol-discriminated unions.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
>  hmp-commands.hx    |  24 +++++-----
>  monitor/hmp-cmds.c |  51 +++++++++++++++------
>  monitor/qmp-cmds.c |  36 ++++++---------
>  qapi/ui.json       | 112 +++++++++++++++++++++++++++++++++++----------
>  4 files changed, 154 insertions(+), 69 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index cf723c69ac..9fbb207b35 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1514,33 +1514,35 @@ ERST
> =20
>      {
>          .name       =3D "set_password",
> -        .args_type  =3D "protocol:s,password:s,connected:s?",
> -        .params     =3D "protocol password action-if-connected",
> +        .args_type  =3D "protocol:s,password:s,display:-dV,connected:s?"=
,
> +        .params     =3D "protocol password [-d display] [action-if-conne=
cted]",
>          .help       =3D "set spice/vnc password",
>          .cmd        =3D hmp_set_password,
>      },
> =20
>  SRST
> -``set_password [ vnc | spice ] password [ action-if-connected ]``
> -  Change spice/vnc password.  *action-if-connected* specifies what
> -  should happen in case a connection is established: *fail* makes the
> -  password change fail.  *disconnect* changes the password and
> +``set_password [ vnc | spice ] password [ -d display ] [ action-if-conne=
cted ]``
> +  Change spice/vnc password.  *display* can be used with 'vnc' to specif=
y
> +  which display to set the password on.  *action-if-connected* specifies
> +  what should happen in case a connection is established: *fail* makes
> +  the password change fail.  *disconnect* changes the password and
>    disconnects the client.  *keep* changes the password and keeps the
>    connection up.  *keep* is the default.
>  ERST
> =20
>      {
>          .name       =3D "expire_password",
> -        .args_type  =3D "protocol:s,time:s",
> -        .params     =3D "protocol time",
> +        .args_type  =3D "protocol:s,time:s,display:-dV",
> +        .params     =3D "protocol time [-d display]",
>          .help       =3D "set spice/vnc password expire-time",
>          .cmd        =3D hmp_expire_password,
>      },
> =20
>  SRST
> -``expire_password [ vnc | spice ]`` *expire-time*
> -  Specify when a password for spice/vnc becomes
> -  invalid. *expire-time* accepts:
> +``expire_password [ vnc | spice ] expire-time [ -d display ]``
> +  Specify when a password for spice/vnc becomes invalid.
> +  *display* behaves the same as in ``set_password``.
> +  *expire-time* accepts:
> =20
>    ``now``
>      Invalidate password instantly.
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index b8abe69609..daa4a8e106 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1451,26 +1451,39 @@ void hmp_set_password(Monitor *mon, const QDict *=
qdict)
>  {
>      const char *protocol  =3D qdict_get_str(qdict, "protocol");
>      const char *password  =3D qdict_get_str(qdict, "password");
> +    const char *display =3D qdict_get_try_str(qdict, "display");
>      const char *connected =3D qdict_get_try_str(qdict, "connected");
>      Error *err =3D NULL;
> -    DisplayProtocol proto;
> -    SetPasswordAction conn;
> =20
> -    proto =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> -                            DISPLAY_PROTOCOL_VNC, &err);
> +    SetPasswordOptions opts =3D {
> +        .password =3D g_strdup(password),
> +        .u.vnc.display =3D NULL,
> +    };
> +
> +    opts.protocol =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                                    DISPLAY_PROTOCOL_VNC, &err);
>      if (err) {
>          goto out;
>      }
> =20
> -    conn =3D qapi_enum_parse(&SetPasswordAction_lookup, connected,
> -                           SET_PASSWORD_ACTION_KEEP, &err);
> -    if (err) {
> -        goto out;
> +    if (opts.protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
> +        opts.u.vnc.has_display =3D !!display;
> +        opts.u.vnc.display =3D g_strdup(display);
> +    } else if (opts.protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
> +        opts.u.spice.has_connected =3D !!connected;
> +        opts.u.spice.connected =3D
> +            qapi_enum_parse(&SetPasswordAction_lookup, connected,
> +                            SET_PASSWORD_ACTION_KEEP, &err);
> +        if (err) {
> +            goto out;
> +        }
>      }
> =20
> -    qmp_set_password(proto, password, !!connected, conn, &err);
> +    qmp_set_password(&opts, &err);
> =20
>  out:
> +    g_free(opts.password);
> +    g_free(opts.u.vnc.display);

Uh-oh...

For DISPLAY_PROTOCOL_SPICE, we execute

           .u.vnc.display =3D NULL,
           opts.u.spice.has_connected =3D !!connected;
           opts.u.spice.connected =3D
               qapi_enum_parse(&SetPasswordAction_lookup, connected,
                               SET_PASSWORD_ACTION_KEEP, &err);
           opts.u.vnc.has_display =3D !!display;
       g_free(opts.u.vnc.display);

The assignments to opts.u.spice.has_connected and opts.u.spice_connected
clobber opts.u.vnc.display.

The simplest fix is to pass @display directly.  Precedence:
hmp_drive_mirror().

Do the same for @password, of course.

>      hmp_handle_error(mon, err);
>  }
> =20
> @@ -1478,18 +1491,30 @@ void hmp_expire_password(Monitor *mon, const QDic=
t *qdict)
>  {
>      const char *protocol  =3D qdict_get_str(qdict, "protocol");
>      const char *whenstr =3D qdict_get_str(qdict, "time");
> +    const char *display =3D qdict_get_try_str(qdict, "display");
>      Error *err =3D NULL;
> -    DisplayProtocol proto;
> =20
> -    proto =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> -                            DISPLAY_PROTOCOL_VNC, &err);
> +    ExpirePasswordOptions opts =3D {
> +        .time =3D g_strdup(whenstr),
> +        .u.vnc.display =3D NULL,
> +    };
> +
> +    opts.protocol =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                                    DISPLAY_PROTOCOL_VNC, &err);
>      if (err) {
>          goto out;
>      }
> =20
> -    qmp_expire_password(proto, whenstr, &err);
> +    if (opts.protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
> +        opts.u.vnc.has_display =3D !!display;
> +        opts.u.vnc.display =3D g_strdup(display);
> +    }

Use of -d with spice are silently ignored.  Do we care?  Same for
hmp_set_password() above.

> +
> +    qmp_expire_password(&opts, &err);
> =20
>  out:
> +    g_free(opts.time);
> +    g_free(opts.u.vnc.display);

No uh-oh here, since opts.u.vnc is actually the only member of opts.u.
Still, let's pass @time and @display directly for consistency and
robustness.

>      hmp_handle_error(mon, err);
>  }
> =20

[...]


