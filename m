Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C47C4345EB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 09:33:22 +0200 (CEST)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md66C-0002Ay-HD
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 03:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1md64O-0001Rp-7B
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1md64L-0005ap-Rd
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 03:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634715084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NvEuJbNRbLoRvWtjtTU5Ghz9Ey0PVvkntBrGhJmHTZk=;
 b=NZQMVbwpVm3X/ayHOxX8iiH0j16EohHk9btzqO8IG9grO3FhrjW1mRv+0crWKi2cY/nFQf
 fYx5ncOqM9cedv8CIRI2BKbji5I815fTf/n7RaeOkepsPpWz21odIz+fW/ErFf+KPQgDPp
 3q4gnqZwe820ZnjODqOs+MYjYflRKK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-UI4GELuUN5KIAYqSCcrPoA-1; Wed, 20 Oct 2021 03:31:21 -0400
X-MC-Unique: UI4GELuUN5KIAYqSCcrPoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79CE81800D41;
 Wed, 20 Oct 2021 07:31:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 889BB1B5B7;
 Wed, 20 Oct 2021 07:31:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CA3C11380A7; Wed, 20 Oct 2021 09:31:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v5 3/4] qapi/monitor: allow VNC display id in
 set/expire_password
References: <20211019155443.1447372-1-s.reiter@proxmox.com>
 <20211019155443.1447372-4-s.reiter@proxmox.com>
Date: Wed, 20 Oct 2021 09:31:18 +0200
In-Reply-To: <20211019155443.1447372-4-s.reiter@proxmox.com> (Stefan Reiter's
 message of "Tue, 19 Oct 2021 17:54:42 +0200")
Message-ID: <87tuhcqhix.fsf@dusky.pond.sub.org>
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
>  monitor/hmp-cmds.c |  51 ++++++++++++++++++---
>  monitor/qmp-cmds.c |  44 +++++++++---------
>  qapi/ui.json       | 112 +++++++++++++++++++++++++++++++++++----------
>  4 files changed, 170 insertions(+), 61 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index cf723c69ac..d78e4cfc47 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1514,33 +1514,35 @@ ERST
> =20
>      {
>          .name       =3D "set_password",
> -        .args_type  =3D "protocol:s,password:s,connected:s?",
> -        .params     =3D "protocol password action-if-connected",
> +        .args_type  =3D "protocol:s,password:s,display:-dS,connected:s?"=
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
> +        .args_type  =3D "protocol:s,time:s,display:-dS",
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
> index 0ff18ebb3c..79549596e4 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1451,19 +1451,40 @@ void hmp_set_password(Monitor *mon, const QDict *=
qdict)
>  {
>      const char *protocol  =3D qdict_get_str(qdict, "protocol");
>      const char *password  =3D qdict_get_str(qdict, "password");
> +    const char *display =3D qdict_get_try_str(qdict, "display");
>      const char *connected =3D qdict_get_try_str(qdict, "connected");
>      Error *err =3D NULL;
>      DisplayProtocol proto;
> -    SetPasswordAction conn;
> +
> +    SetPasswordOptions opts =3D {
> +        .password =3D g_strdup(password),
> +        .u.vnc.display =3D NULL,
> +    };
> =20
>      proto =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>                              DISPLAY_PROTOCOL_VNC, &err);
> -    if (!!connected) {
> -        conn =3D qapi_enum_parse(&SetPasswordAction_lookup, connected,
> -                               SET_PASSWORD_ACTION_KEEP, &err);
> +    if (err) {
> +        goto out;
> +    }
> +    opts.protocol =3D proto;
> +
> +    if (proto =3D=3D DISPLAY_PROTOCOL_VNC) {
> +        opts.u.vnc.has_display =3D !!display;
> +        opts.u.vnc.display =3D g_strdup(display);
> +    } else if (proto =3D=3D DISPLAY_PROTOCOL_SPICE) {
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
> +
> +out:

Aha, you're fixing the crash bug I pointed out in review of PATCH 2.
Also in hmp_expire_password() below.

> +    qapi_free_SetPasswordOptions(&opts);
>      hmp_handle_error(mon, err);
>  }
> =20
> @@ -1471,13 +1492,31 @@ void hmp_expire_password(Monitor *mon, const QDic=
t *qdict)
>  {
>      const char *protocol  =3D qdict_get_str(qdict, "protocol");
>      const char *whenstr =3D qdict_get_str(qdict, "time");
> +    const char *display =3D qdict_get_try_str(qdict, "display");
>      Error *err =3D NULL;
>      DisplayProtocol proto;
> =20
> +    ExpirePasswordOptions opts =3D {
> +        .time =3D g_strdup(whenstr),
> +        .u.vnc.display =3D NULL,
> +    };
> +
>      proto =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>                              DISPLAY_PROTOCOL_VNC, &err);
> +    if (err) {
> +        goto out;
> +    }
> +    opts.protocol =3D proto;
> =20
> -    qmp_expire_password(proto, whenstr, &err);
> +    if (proto =3D=3D DISPLAY_PROTOCOL_VNC) {
> +        opts.u.vnc.has_display =3D !!display;
> +        opts.u.vnc.display =3D g_strdup(display);
> +    }

Attempts to use -d with spice are silently ignored.  Do we care?

> +
> +    qmp_expire_password(&opts, &err);
> +
> +out:
> +    qapi_free_ExpirePasswordOptions(&opts);
>      hmp_handle_error(mon, err);
>  }
> =20
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index f1746a31fb..b0630d00ab 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -163,34 +163,35 @@ void qmp_system_wakeup(Error **errp)
>      qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
>  }
> =20
> -void qmp_set_password(DisplayProtocol protocol, const char *password,
> -                      bool has_connected, SetPasswordAction connected,
> -                      Error **errp)
> +void qmp_set_password(SetPasswordOptions *opts, Error **errp)
>  {
> -    int disconnect_if_connected =3D 0;
> -    int fail_if_connected =3D 0;
> -    int rc;
> +    bool disconnect_if_connected =3D false;
> +    bool fail_if_connected =3D false;
> +    int rc =3D 0;
> =20
> -    if (has_connected) {
> -        fail_if_connected =3D connected =3D=3D SET_PASSWORD_ACTION_FAIL;
> -        disconnect_if_connected =3D connected =3D=3D SET_PASSWORD_ACTION=
_DISCONNECT;
> -    }
> -
> -    if (protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
> +    if (opts->protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
>          if (!qemu_using_spice(errp)) {
>              return;
>          }
> -        rc =3D qemu_spice.set_passwd(password, fail_if_connected,
> +        if (opts->u.spice.has_connected) {
> +            fail_if_connected =3D
> +                opts->u.spice.connected =3D=3D SET_PASSWORD_ACTION_FAIL;
> +            disconnect_if_connected =3D
> +                opts->u.spice.connected =3D=3D SET_PASSWORD_ACTION_DISCO=
NNECT;
> +        }

For an optional member FOO, you may rely on "!has_FOO implies FOO is all
zero bits".  When FOO is an enum, "is all zero bits" means "first
member".  In this case: !has_connected implies connected =3D=3D
SET_PASSWORD_ACTION_FAIL.

This lets you simplify the code to

    bool disconnect_if_connected =3D connected =3D=3D SET_PASSWORD_ACTION_D=
ISCONNECT;
    bool fail_if_connected =3D connected =3D=3D SET_PASSWORD_ACTION_FAIL;

I'd go one step further, and eliminate the variables, just like you did
already for VNC...

> +        rc =3D qemu_spice.set_passwd(opts->password, fail_if_connected,
>                                     disconnect_if_connected);
> -    } else if (protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
> -        if (fail_if_connected || disconnect_if_connected) {
> +    } else if (opts->protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
> +        if (opts->u.vnc.connected !=3D SET_PASSWORD_ACTION_KEEP) {

... here.

>              /* vnc supports "connected=3Dkeep" only */
>              error_setg(errp, QERR_INVALID_PARAMETER, "connected");
>              return;
>          }
>          /* Note that setting an empty password will not disable login th=
rough
>           * this interface. */
> -        rc =3D vnc_display_password(NULL, password);
> +        rc =3D vnc_display_password(
> +                opts->u.vnc.has_display ? opts->u.vnc.display : NULL,
> +                opts->password);

When FOO is a pointer, "is all zero bits" means "null pointer".  In this
case: !ops->u.vnc.has_display implies opts->u.vnc.display =3D=3D NULL.
Simplify:

           rc =3D vnc_display_password(opts->u.vnc.display, opts->password)=
;

>      }
> =20
>      if (rc !=3D 0) {
> @@ -198,11 +199,11 @@ void qmp_set_password(DisplayProtocol protocol, con=
st char *password,
>      }
>  }
> =20
> -void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
> -                         Error **errp)
> +void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
>  {
>      time_t when;
>      int rc;
> +    const char* whenstr =3D opts->time;

Style: const char *whenstr

> =20
>      if (strcmp(whenstr, "now") =3D=3D 0) {
>          when =3D 0;
> @@ -214,13 +215,14 @@ void qmp_expire_password(DisplayProtocol protocol, =
const char *whenstr,
>          when =3D strtoull(whenstr, NULL, 10);
>      }
> =20
> -    if (protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
> +    if (opts->protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
>          if (!qemu_using_spice(errp)) {
>              return;
>          }
>          rc =3D qemu_spice.set_pw_expire(when);
> -    } else if (protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
> -        rc =3D vnc_display_pw_expire(NULL, when);
> +    } else if (opts->protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
> +        rc =3D vnc_display_pw_expire(
> +                opts->u.vnc.has_display ? opts->u.vnc.display : NULL, wh=
en);
>      }
> =20
>      if (rc !=3D 0) {
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 15cc19dcc5..17939d0dda 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -39,20 +39,61 @@
>    'data': [ 'fail', 'disconnect', 'keep' ] }
> =20
>  ##
> -# @set_password:
> +# @SetPasswordOptions:
>  #
> -# Sets the password of a remote display session.
> +# Data required to set a new password on a display server protocol.

Suggest "Options for set_password", for consistency with how you
document SetPasswordOptionsSpice and SetPasswordOptionsVnc.

>  #
>  # @protocol: - 'vnc' to modify the VNC server password
>  #            - 'spice' to modify the Spice server password
>  #
>  # @password: the new password
>  #
> -# @connected: how to handle existing clients when changing the
> -#             password.  If nothing is specified, defaults to 'keep'
> -#             'fail' to fail the command if clients are connected
> -#             'disconnect' to disconnect existing clients
> -#             'keep' to maintain existing clients
> +# Since: 6.2
> +#
> +##
> +{ 'union': 'SetPasswordOptions',
> +  'base': { 'protocol': 'DisplayProtocol',
> +            'password': 'str' },
> +  'discriminator': 'protocol',
> +  'data': { 'vnc': 'SetPasswordOptionsVnc',
> +            'spice': 'SetPasswordOptionsSpice' } }
> +
> +##
> +# @SetPasswordOptionsSpice:
> +#
> +# Options for set_password specific to the SPICE procotol.
> +#
> +# @connected: How to handle existing clients when changing the
> +#             password. If nothing is specified, defaults to 'keep'.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'struct': 'SetPasswordOptionsSpice',
> +  'data': { '*connected': 'SetPasswordAction' } }
> +
> +##
> +# @SetPasswordOptionsVnc:
> +#
> +# Options for set_password specific to the VNC procotol.
> +#
> +# @display: The id of the display where the password should be changed.
> +#           Defaults to the first.
> +#
> +# @connected: How to handle existing clients when changing the
> +#             password.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'struct': 'SetPasswordOptionsVnc',
> +  'data': { '*display': 'str',
> +            '*connected': 'SetPasswordAction' }}
> +
> +##
> +# @set_password:
> +#
> +# Sets the password of a remote display session.

Good opportunity to make the docs a bit more consistent: "of a remote
display server".  Matches expire_password, and feels like an improvement
to me.

>  #
>  # Returns: - Nothing on success
>  #          - If Spice is not enabled, DeviceNotFound
> @@ -66,18 +107,16 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'set_password',
> -  'data': { 'protocol': 'DisplayProtocol',
> -            'password': 'str',
> -            '*connected': 'SetPasswordAction' } }
> +{ 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOptions'=
 }
> =20
>  ##
> -# @expire_password:
> +# @ExpirePasswordOptions:
>  #
> -# Expire the password of a remote display server.
> -#
> -# @protocol: the name of the remote display protocol 'vnc' or 'spice'
> +# Data required to set password expiration on a display server protocol.

Suggest "Options for expire_password", for consistency with how you
document ExpirePasswordOptionsVnc.

>  #
> +# @protocol: - 'vnc' to modify the VNC server expiration
> +#            - 'spice' to modify the Spice server expiration
> +
>  # @time: when to expire the password.
>  #
>  #        - 'now' to expire the password immediately
> @@ -85,16 +124,45 @@
>  #        - '+INT' where INT is the number of seconds from now (integer)
>  #        - 'INT' where INT is the absolute time in seconds
>  #
> -# Returns: - Nothing on success
> -#          - If @protocol is 'spice' and Spice is not active, DeviceNotF=
ound
> -#
> -# Since: 0.14
> -#
>  # Notes: Time is relative to the server and currently there is no way to
>  #        coordinate server time with client time.  It is not recommended=
 to
>  #        use the absolute time version of the @time parameter unless you=
're
>  #        sure you are on the same machine as the QEMU instance.
>  #
> +# Since: 6.2
> +#
> +##
> +{ 'union': 'ExpirePasswordOptions',
> +  'base': { 'protocol': 'DisplayProtocol',
> +            'time': 'str' },
> +  'discriminator': 'protocol',
> +  'data': { 'vnc': 'ExpirePasswordOptionsVnc' } }
> +
> +##
> +# @ExpirePasswordOptionsVnc:
> +#
> +# Options for expire_password specific to the VNC procotol.
> +#
> +# @display: The id of the display where the expiration should be changed=
.
> +#           Defaults to the first.
> +#
> +# Since: 6.2
> +#
> +##
> +
> +{ 'struct': 'ExpirePasswordOptionsVnc',
> +  'data': { '*display': 'str' } }
> +
> +##
> +# @expire_password:
> +#
> +# Expire the password of a remote display server.
> +#
> +# Returns: - Nothing on success
> +#          - If @protocol is 'spice' and Spice is not active, DeviceNotF=
ound
> +#
> +# Since: 0.14
> +#
>  # Example:
>  #
>  # -> { "execute": "expire_password", "arguments": { "protocol": "vnc",
> @@ -102,9 +170,7 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'expire_password',
> -  'data': { 'protocol': 'DisplayProtocol',
> -            'time': 'str' } }
> +{ 'command': 'expire_password', 'boxed': true, 'data': 'ExpirePasswordOp=
tions' }
> =20
>  ##
>  # @screendump:


