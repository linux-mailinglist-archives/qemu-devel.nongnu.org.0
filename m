Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203941288E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:56:51 +0200 (CEST)
Received: from localhost ([::1]:35162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRHO-0005oL-85
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSQym-0006a9-2x
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mSQyi-000446-43
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:37:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632173850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UN03SYhaZzzfjePcKY52YlJLP7wHnut/SvacHqFU/b0=;
 b=P3Yb80WstX/pIyMeb3swSMNgtFdeIFY4cc9j7h4aVf7i19ximT62tXSrKS475THgaMkDm3
 afKlbCpi6f+Hv4fAMKnJNnMECd3epfio8BFJ5vFeHQ/bh4dl+xmAUmWEVA017+0maK93sd
 SzgyEacCUF1bKlnFah/8V3Ou47sa/pI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-49QQ_NEQPpu7zHQFGuN7SQ-1; Mon, 20 Sep 2021 17:37:29 -0400
X-MC-Unique: 49QQ_NEQPpu7zHQFGuN7SQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DC3E8145E6;
 Mon, 20 Sep 2021 21:37:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B86315C1B4;
 Mon, 20 Sep 2021 21:37:17 +0000 (UTC)
Date: Mon, 20 Sep 2021 16:37:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v3 3/3] monitor: refactor set/expire_password and allow
 VNC display id
Message-ID: <20210920213715.nraywxmxjs4jiqx2@redhat.com>
References: <20210920105641.258104-1-s.reiter@proxmox.com>
 <20210920105641.258104-4-s.reiter@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20210920105641.258104-4-s.reiter@proxmox.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 20, 2021 at 12:56:41PM +0200, Stefan Reiter wrote:
> It is possible to specify more than one VNC server on the command line,
> either with an explicit ID or the auto-generated ones à la "default",
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
> Suggested-by: Eric Blake <eblake@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
> 
> The union schema simplifies the QMP code, but makes the HMP part a bit more
> involved. Since the parameters are practically the same, is there a way to just
> pass the HMP generated qdict off to the qapi parser to get the correct struct
> for calling the qmp_ methods?

Possibly, but I don't know it off-hand.

> 
>  hmp-commands.hx    |  29 ++++----
>  monitor/hmp-cmds.c |  60 +++++++++++++++-
>  monitor/qmp-cmds.c |  62 ++++++-----------
>  qapi/ui.json       | 168 +++++++++++++++++++++++++++++++++++++--------
>  4 files changed, 235 insertions(+), 84 deletions(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8e45bce2cd..d78e4cfc47 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1514,34 +1514,35 @@ ERST
>  
>      {
>          .name       = "set_password",
> -        .args_type  = "protocol:s,password:s,connected:s?",
> -        .params     = "protocol password action-if-connected",
> +        .args_type  = "protocol:s,password:s,display:-dS,connected:s?",
> +        .params     = "protocol password [-d display] [action-if-connected]",

Puts your new -xS of patch 2/3 to use.

> +++ b/monitor/hmp-cmds.c
> @@ -1451,10 +1451,43 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
>  {
>      const char *protocol  = qdict_get_str(qdict, "protocol");
>      const char *password  = qdict_get_str(qdict, "password");
> +    const char *display = qdict_get_try_str(qdict, "display");
>      const char *connected = qdict_get_try_str(qdict, "connected");
>      Error *err = NULL;
> +    DisplayProtocol proto;
>  
> -    qmp_set_password(protocol, password, !!connected, connected, &err);
> +    SetPasswordOptions opts = {
> +        .password = g_strdup(password),
> +        .u.vnc.display = NULL,
> +    };
> +
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                            DISPLAY_PROTOCOL_VNC, &err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +    opts.protocol = proto;
> +
> +    if (proto == DISPLAY_PROTOCOL_VNC) {
> +        if ((opts.u.vnc.has_display = !!display)) {

Assignment as a side-effect of the 'if' is a bit unusual in qemu
style.

> +            opts.u.vnc.display = g_strdup(display);
> +        }

In fact, g_strdup(NULL) does what you want; you can just write:

opts.u.vnc.has_display = !!display;
opts.u.vnc.display = g_strdup(display);

without an 'if'.

> +    } else if (proto == DISPLAY_PROTOCOL_SPICE) {
> +        if ((opts.u.spice.has_connected = !!connected)) {

And again.

> +            opts.u.spice.connected =
> +                qapi_enum_parse(&SetPasswordAction_lookup, connected,
> +                                SET_PASSWORD_ACTION_KEEP, &err);
> +            if (err) {
> +                hmp_handle_error(mon, err);
> +                return;
> +            }
> +        }
> +    }
> +
> +    qmp_set_password(&opts, &err);
> +    g_free(opts.password);
> +    g_free(opts.u.vnc.display);
>      hmp_handle_error(mon, err);
>  }
>  
> @@ -1462,9 +1495,32 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
>  {
>      const char *protocol  = qdict_get_str(qdict, "protocol");
>      const char *whenstr = qdict_get_str(qdict, "time");
> +    const char *display = qdict_get_try_str(qdict, "display");
>      Error *err = NULL;
> +    DisplayProtocol proto;
>  
> -    qmp_expire_password(protocol, whenstr, &err);
> +    ExpirePasswordOptions opts = {
> +        .time = g_strdup(whenstr),
> +        .u.vnc.display = NULL,
> +    };
> +
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                            DISPLAY_PROTOCOL_VNC, &err);
> +    if (err) {
> +        hmp_handle_error(mon, err);
> +        return;
> +    }
> +    opts.protocol = proto;
> +
> +    if (proto == DISPLAY_PROTOCOL_VNC) {
> +        if ((opts.u.vnc.has_display = !!display)) {
> +            opts.u.vnc.display = g_strdup(display);

and again

> +        }
> +    }
> +
> +    qmp_expire_password(&opts, &err);
> +    g_free(opts.time);
> +    g_free(opts.u.vnc.display);
>      hmp_handle_error(mon, err);
>  }
>  
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 5c0d5e116b..cb229c01f8 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
...
> diff --git a/qapi/ui.json b/qapi/ui.json
> index b2cf7a6759..494c92a65e 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -9,22 +9,23 @@
>  { 'include': 'common.json' }
>  { 'include': 'sockets.json' }
>  
> +##
> +# @DisplayProtocol:
> +#
> +# Display protocols which support changing password options.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'enum': 'DisplayProtocol',
> +  'data': [ { 'name': 'vnc', 'if': 'CONFIG_VNC' },
> +            { 'name': 'spice', 'if': 'CONFIG_SPICE' } ] }
> +
>  ##
>  # @set_password:
>  #
>  # Sets the password of a remote display session.
>  #
> -# @protocol: - 'vnc' to modify the VNC server password
> -#            - 'spice' to modify the Spice server password
> -#
> -# @password: the new password
> -#
> -# @connected: how to handle existing clients when changing the
> -#             password.  If nothing is specified, defaults to 'keep'
> -#             'fail' to fail the command if clients are connected
> -#             'disconnect' to disconnect existing clients
> -#             'keep' to maintain existing clients
> -#
>  # Returns: - Nothing on success
>  #          - If Spice is not enabled, DeviceNotFound
>  #
> @@ -37,33 +38,101 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'set_password',
> -  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
> +{ 'command': 'set_password', 'boxed': true, 'data': 'SetPasswordOptions' }
> +
> +##
> +# @SetPasswordOptions:
> +#
> +# Data required to set a new password on a display server protocol.
> +#
> +# @protocol: - 'vnc' to modify the VNC server password
> +#            - 'spice' to modify the Spice server password
> +#
> +# @password: the new password
> +#
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
> +# @SetPasswordAction:
> +#
> +# An action to take on changing a password on a connection with active clients.
> +#
> +# @fail: fail the command if clients are connected
> +#
> +# @disconnect: disconnect existing clients
> +#
> +# @keep: maintain existing clients
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'enum': 'SetPasswordAction',
> +  'data': [ 'fail', 'disconnect', 'keep' ] }
> +
> +##
> +# @SetPasswordActionVnc:
> +#
> +# See @SetPasswordAction. VNC only supports the keep action. 'connection'
> +# should just be omitted for VNC, this is kept for backwards compatibility.
> +#
> +# @keep: maintain existing clients
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'enum': 'SetPasswordActionVnc',
> +  'data': [ 'keep' ] }
> +
> +##
> +# @SetPasswordOptionsSpice:
> +#
> +# Options for set_password specific to the VNC procotol.
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
> +#             password. Will always be 'keep' for VNC, parameter is
> +#             deprecated and should be omitted.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'struct': 'SetPasswordOptionsVnc',
> +  'data': { '*display': 'str', '*connected': 'SetPasswordActionVnc' } }

Doesn't have to be in this patch (as you are refactoring a
pre-existing problem), but we should consider a followup patch to
actually use the QAPI 'features':'deprected' ability to actually
declare the deprecation through introspection.

Overall, the QAPI changes look sane to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


