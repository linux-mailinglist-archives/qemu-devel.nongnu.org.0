Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E04AF538
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:29:27 +0100 (CET)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHouM-0005t7-HW
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHneR-0004mH-Mj
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHneH-0003lh-JT
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644415714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6+jJBMP1X4w0Jx63DM7/p/Vg0kmVgapmnx8TPpStSU=;
 b=EsmXpIVKp31okT0Wv9iYmx/nTyqt8BpBSoN+8BelcL2wF1N7/4yhE77Qg9H6DYCeHtL6b7
 W+/V+7ocNH56LzJqS3rkMJNyl8fUKSBBglHlT/Vq80tPKqcy4ydIuZX47iw9LPiKsD2/8E
 MGO3fmn3+c4vZQSi5RRniAWl+D5iI/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-wHV5N-yiN3amW0Lg3Duqvw-1; Wed, 09 Feb 2022 09:08:26 -0500
X-MC-Unique: wHV5N-yiN3amW0Lg3Duqvw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4EA192CC45;
 Wed,  9 Feb 2022 14:08:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB6E7611B;
 Wed,  9 Feb 2022 14:07:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B18721E6A00; Wed,  9 Feb 2022 15:07:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v8 3/3] qapi/monitor: allow VNC display id in
 set/expire_password
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-4-f.ebner@proxmox.com>
Date: Wed, 09 Feb 2022 15:07:46 +0100
In-Reply-To: <20220204101220.343526-4-f.ebner@proxmox.com> (Fabian Ebner's
 message of "Fri, 4 Feb 2022 11:12:20 +0100")
Message-ID: <875ypogmkt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> From: Stefan Reiter <s.reiter@proxmox.com>
>
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

Did I suggest this feature?  I don't remember...  Most likely, I merely
suggested using a union.  Mind if I drop this tag?

> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> [FE: update "Since: " from 6.2 to 7.0
>      set {has_}connected for VNC in hmp_set_password]
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---
>
> v7 -> v8:
> * add missing # in the description for @ExpirePasswordOptions
> * other changes are already mentioned above
>
>  hmp-commands.hx    |  24 +++++-----
>  monitor/hmp-cmds.c |  39 ++++++++++++----
>  monitor/qmp-cmds.c |  34 ++++++--------
>  qapi/ui.json       | 110 ++++++++++++++++++++++++++++++++++++---------
>  4 files changed, 145 insertions(+), 62 deletions(-)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 70a9136ac2..cc2f4bdeba 100644
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

This is the first flag with an argument in HMP.  The alternative is
another optional argument.

PRO optional argument: no need for PATCH 1.

PRO flag with argument: can specify the display without
action-if-connected.

Dave, this is your call to make.

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
> index ff78741b75..be0d919b64 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1396,13 +1396,17 @@ void hmp_set_password(Monitor *mon, const QDict *=
qdict)
>  {
>      const char *protocol  =3D qdict_get_str(qdict, "protocol");
>      const char *password  =3D qdict_get_str(qdict, "password");
> +    const char *display =3D qdict_get_try_str(qdict, "display");
>      const char *connected =3D qdict_get_try_str(qdict, "connected");
>      Error *err =3D NULL;
> -    DisplayProtocol proto;
>      SetPasswordAction conn;
> =20
> -    proto =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> -                            DISPLAY_PROTOCOL_VNC, &err);
> +    SetPasswordOptions opts =3D {
> +        .password =3D (char *)password,
> +    };
> +
> +    opts.protocol =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                                    DISPLAY_PROTOCOL_VNC, &err);
>      if (err) {
>          goto out;
>      }
> @@ -1413,7 +1417,17 @@ void hmp_set_password(Monitor *mon, const QDict *q=
dict)
>          goto out;
>      }
> =20
> -    qmp_set_password(proto, password, !!connected, conn, &err);
> +    if (opts.protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
> +        opts.u.vnc.has_display =3D !!display;
> +        opts.u.vnc.display =3D (char *)display;
> +        opts.u.vnc.has_connected =3D !!connected;
> +        opts.u.vnc.connected =3D conn;
> +    } else if (opts.protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
> +        opts.u.spice.has_connected =3D !!connected;
> +        opts.u.spice.connected =3D conn;
> +    }
> +
> +    qmp_set_password(&opts, &err);
> =20
>  out:
>      hmp_handle_error(mon, err);
> @@ -1423,16 +1437,25 @@ void hmp_expire_password(Monitor *mon, const QDic=
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
> +        .time =3D (char *)whenstr,
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
> +        opts.u.vnc.display =3D (char *)display;
> +    }
> +
> +    qmp_expire_password(&opts, &err);
> =20
>  out:
>      hmp_handle_error(mon, err);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index b6e8b57fcc..37db941fd3 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -168,35 +168,27 @@ void qmp_system_wakeup(Error **errp)
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
>      int rc;
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
> -                                   disconnect_if_connected);
> +        rc =3D qemu_spice.set_passwd(opts->password,
> +                opts->u.spice.connected =3D=3D SET_PASSWORD_ACTION_FAIL,
> +                opts->u.spice.connected =3D=3D SET_PASSWORD_ACTION_DISCO=
NNECT);
>      } else {
> -        assert(protocol =3D=3D DISPLAY_PROTOCOL_VNC);
> -        if (fail_if_connected || disconnect_if_connected) {
> +        assert(opts->protocol =3D=3D DISPLAY_PROTOCOL_VNC);
> +        if (opts->u.vnc.connected !=3D SET_PASSWORD_ACTION_KEEP) {
>              /* vnc supports "connected=3Dkeep" only */
>              error_setg(errp, QERR_INVALID_PARAMETER, "connected");
>              return;
>          }
>          /* Note that setting an empty password will not disable login th=
rough
>           * this interface. */
> -        rc =3D vnc_display_password(NULL, password);
> +        rc =3D vnc_display_password(opts->u.vnc.display, opts->password)=
;
>      }
> =20
>      if (rc !=3D 0) {
> @@ -204,11 +196,11 @@ void qmp_set_password(DisplayProtocol protocol, con=
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
> +    const char *whenstr =3D opts->time;
> =20
>      if (strcmp(whenstr, "now") =3D=3D 0) {
>          when =3D 0;
> @@ -220,14 +212,14 @@ void qmp_expire_password(DisplayProtocol protocol, =
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
>      } else {
> -        assert(protocol =3D=3D DISPLAY_PROTOCOL_VNC);
> -        rc =3D vnc_display_pw_expire(NULL, when);
> +        assert(opts->protocol =3D=3D DISPLAY_PROTOCOL_VNC);
> +        rc =3D vnc_display_pw_expire(opts->u.vnc.display, when);
>      }
> =20
>      if (rc !=3D 0) {
> diff --git a/qapi/ui.json b/qapi/ui.json
> index e112409211..089f05c702 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -38,20 +38,61 @@
>    'data': [ 'keep', 'fail', 'disconnect' ] }
> =20
>  ##
> -# @set_password:
> +# @SetPasswordOptions:
>  #
> -# Sets the password of a remote display session.
> +# General options for set_password.

Actually, all the options there are.  Let's drop "General".

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
> +# Since: 7.0
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
> +# Since: 7.0
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

Neglects to document the default, unlike SetPasswordOptionsSpice above.

> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'SetPasswordOptionsVnc',
> +  'data': { '*display': 'str',
> +            '*connected': 'SetPasswordAction' }}

@connected could be made a common member.  Untested incremental patch
appended for your consideration.

> +
> +##
> +# @set_password:
> +#
> +# Set the password of a remote display server.
>  #
>  # Returns: - Nothing on success
>  #          - If Spice is not enabled, DeviceNotFound
> @@ -65,17 +106,15 @@
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
> +# General options for expire_password.
>  #
> -# @protocol: the name of the remote display protocol 'vnc' or 'spice'
> +# @protocol: - 'vnc' to modify the VNC server expiration
> +#            - 'spice' to modify the Spice server expiration
>  #
>  # @time: when to expire the password.
>  #
> @@ -84,16 +123,45 @@
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
> +# Since: 7.0
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
> +# Since: 7.0
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
> @@ -101,9 +169,7 @@
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

diff --git a/qapi/ui.json b/qapi/ui.json
index 089f05c702..bcc69896ed 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -47,29 +47,18 @@
 #
 # @password: the new password
 #
+# @connected: How to handle existing clients when changing the
+#             password.
+#
 # Since: 7.0
 #
 ##
 { 'union': 'SetPasswordOptions',
   'base': { 'protocol': 'DisplayProtocol',
-            'password': 'str' },
+            'password': 'str',
+            '*connected': 'SetPasswordAction' },
   'discriminator': 'protocol',
-  'data': { 'vnc': 'SetPasswordOptionsVnc',
-            'spice': 'SetPasswordOptionsSpice' } }
-
-##
-# @SetPasswordOptionsSpice:
-#
-# Options for set_password specific to the SPICE procotol.
-#
-# @connected: How to handle existing clients when changing the
-#             password. If nothing is specified, defaults to 'keep'.
-#
-# Since: 7.0
-#
-##
-{ 'struct': 'SetPasswordOptionsSpice',
-  'data': { '*connected': 'SetPasswordAction' } }
+  'data': { 'vnc': 'SetPasswordOptionsVnc' } }
=20
 ##
 # @SetPasswordOptionsVnc:
@@ -79,15 +68,11 @@
 # @display: The id of the display where the password should be changed.
 #           Defaults to the first.
 #
-# @connected: How to handle existing clients when changing the
-#             password.
-#
 # Since: 7.0
 #
 ##
 { 'struct': 'SetPasswordOptionsVnc',
-  'data': { '*display': 'str',
-            '*connected': 'SetPasswordAction' }}
+  'data': { '*display': 'str' } }
=20
 ##
 # @set_password:
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index be0d919b64..54762a9396 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1401,8 +1401,16 @@ void hmp_set_password(Monitor *mon, const QDict *qdi=
ct)
     Error *err =3D NULL;
     SetPasswordAction conn;
=20
+    conn =3D qapi_enum_parse(&SetPasswordAction_lookup, connected,
+                           SET_PASSWORD_ACTION_KEEP, &err);
+    if (err) {
+        goto out;
+    }
+
     SetPasswordOptions opts =3D {
         .password =3D (char *)password,
+        .has_connected =3D !!connected,
+        .connected =3D conn,
     };
=20
     opts.protocol =3D qapi_enum_parse(&DisplayProtocol_lookup, protocol,
@@ -1411,20 +1419,9 @@ void hmp_set_password(Monitor *mon, const QDict *qdi=
ct)
         goto out;
     }
=20
-    conn =3D qapi_enum_parse(&SetPasswordAction_lookup, connected,
-                           SET_PASSWORD_ACTION_KEEP, &err);
-    if (err) {
-        goto out;
-    }
-
     if (opts.protocol =3D=3D DISPLAY_PROTOCOL_VNC) {
         opts.u.vnc.has_display =3D !!display;
         opts.u.vnc.display =3D (char *)display;
-        opts.u.vnc.has_connected =3D !!connected;
-        opts.u.vnc.connected =3D conn;
-    } else if (opts.protocol =3D=3D DISPLAY_PROTOCOL_SPICE) {
-        opts.u.spice.has_connected =3D !!connected;
-        opts.u.spice.connected =3D conn;
     }
=20
     qmp_set_password(&opts, &err);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 37db941fd3..df97582dd4 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -177,11 +177,11 @@ void qmp_set_password(SetPasswordOptions *opts, Error=
 **errp)
             return;
         }
         rc =3D qemu_spice.set_passwd(opts->password,
-                opts->u.spice.connected =3D=3D SET_PASSWORD_ACTION_FAIL,
-                opts->u.spice.connected =3D=3D SET_PASSWORD_ACTION_DISCONN=
ECT);
+                opts->connected =3D=3D SET_PASSWORD_ACTION_FAIL,
+                opts->connected =3D=3D SET_PASSWORD_ACTION_DISCONNECT);
     } else {
         assert(opts->protocol =3D=3D DISPLAY_PROTOCOL_VNC);
-        if (opts->u.vnc.connected !=3D SET_PASSWORD_ACTION_KEEP) {
+        if (opts->connected !=3D SET_PASSWORD_ACTION_KEEP) {
             /* vnc supports "connected=3Dkeep" only */
             error_setg(errp, QERR_INVALID_PARAMETER, "connected");
             return;


