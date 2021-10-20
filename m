Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125E4344D8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:49:05 +0200 (CEST)
Received: from localhost ([::1]:49912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md4TH-0003Ta-ON
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1md4Ri-00023e-Il
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1md4Re-0004pL-Pw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634708840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nuZb2fh/2j+WtoTRn3SmjplQPAkjTff2koC9QN+Ol+E=;
 b=ClE2w3mfZodFRO0hOD3hzqPWG2V637ZBQfTs2McLbsrz1j4+vn/OgHruXFpBoGd03kjEWt
 IWY7MIC9D11J44mhrDTlrEm621dUgwwXn9G8HsBn4bnowyI+zRzV7Ge6pmeArkls3sDHbC
 0TRKwEYsYnpe6iymGGJVto6UrGH3pW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-ccNLDP15O-6tihK-bsQgTQ-1; Wed, 20 Oct 2021 01:47:18 -0400
X-MC-Unique: ccNLDP15O-6tihK-bsQgTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EFAA10A8E01;
 Wed, 20 Oct 2021 05:47:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAB5860657;
 Wed, 20 Oct 2021 05:47:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7EF9911380A7; Wed, 20 Oct 2021 07:47:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH v5 2/4] qapi/monitor: refactor set/expire_password with
 enums
References: <20211019155443.1447372-1-s.reiter@proxmox.com>
 <20211019155443.1447372-3-s.reiter@proxmox.com>
Date: Wed, 20 Oct 2021 07:47:09 +0200
In-Reply-To: <20211019155443.1447372-3-s.reiter@proxmox.com> (Stefan Reiter's
 message of "Tue, 19 Oct 2021 17:54:41 +0200")
Message-ID: <87a6j4s0wy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> 'protocol' and 'connected' are better suited as enums than as strings,
> make use of that. No functional change intended.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
>  monitor/hmp-cmds.c | 17 +++++++++++++++--
>  monitor/qmp-cmds.c | 35 ++++++++++-------------------------
>  qapi/ui.json       | 37 +++++++++++++++++++++++++++++++++++--
>  3 files changed, 60 insertions(+), 29 deletions(-)
>
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index bcaa41350e..0ff18ebb3c 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1453,8 +1453,17 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
>      const char *password  = qdict_get_str(qdict, "password");
>      const char *connected = qdict_get_try_str(qdict, "connected");
>      Error *err = NULL;
> +    DisplayProtocol proto;
> +    SetPasswordAction conn;
>  
> -    qmp_set_password(protocol, password, !!connected, connected, &err);
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                            DISPLAY_PROTOCOL_VNC, &err);
> +    if (!!connected) {
> +        conn = qapi_enum_parse(&SetPasswordAction_lookup, connected,
> +                               SET_PASSWORD_ACTION_KEEP, &err);
> +    }

@conn is left uninitialized when @connected is null.

> +
> +    qmp_set_password(proto, password, !!connected, conn, &err);
>      hmp_handle_error(mon, err);

Crash bug when more than one of the three functions fail.  See "Receive
and accumulate multiple errors (first one wins):" in qapi/error.h's big
comment.

You need to do something like

       proto = qapi_enum_parse(...);
       if (err) {
           goto out;
       }
       conn = qapi_enum_parse(...);
       if (err) {
           goto out;
       }
       qmp_set_password(...);

   out:
       hmp_handle_error(mon, err);

No need to guard the second qapi_enum_parse(): a null second argument is
fine, and the function returns its third argument then.

>  }
>  
> @@ -1463,8 +1472,12 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
>      const char *protocol  = qdict_get_str(qdict, "protocol");
>      const char *whenstr = qdict_get_str(qdict, "time");
>      Error *err = NULL;
> +    DisplayProtocol proto;
>  
> -    qmp_expire_password(protocol, whenstr, &err);
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                            DISPLAY_PROTOCOL_VNC, &err);
> +
> +    qmp_expire_password(proto, whenstr, &err);
>      hmp_handle_error(mon, err);

Similar crash bug.

>  }
>  
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 5c0d5e116b..f1746a31fb 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -163,33 +163,26 @@ void qmp_system_wakeup(Error **errp)
>      qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, errp);
>  }
>  
> -void qmp_set_password(const char *protocol, const char *password,
> -                      bool has_connected, const char *connected, Error **errp)
> +void qmp_set_password(DisplayProtocol protocol, const char *password,
> +                      bool has_connected, SetPasswordAction connected,
> +                      Error **errp)
>  {
>      int disconnect_if_connected = 0;
>      int fail_if_connected = 0;
>      int rc;
>  
>      if (has_connected) {
> -        if (strcmp(connected, "fail") == 0) {
> -            fail_if_connected = 1;
> -        } else if (strcmp(connected, "disconnect") == 0) {
> -            disconnect_if_connected = 1;
> -        } else if (strcmp(connected, "keep") == 0) {
> -            /* nothing */
> -        } else {
> -            error_setg(errp, QERR_INVALID_PARAMETER, "connected");
> -            return;
> -        }
> +        fail_if_connected = connected == SET_PASSWORD_ACTION_FAIL;
> +        disconnect_if_connected = connected == SET_PASSWORD_ACTION_DISCONNECT;
>      }
>  
> -    if (strcmp(protocol, "spice") == 0) {
> +    if (protocol == DISPLAY_PROTOCOL_SPICE) {
>          if (!qemu_using_spice(errp)) {
>              return;
>          }
>          rc = qemu_spice.set_passwd(password, fail_if_connected,
>                                     disconnect_if_connected);
> -    } else if (strcmp(protocol, "vnc") == 0) {
> +    } else if (protocol == DISPLAY_PROTOCOL_VNC) {
>          if (fail_if_connected || disconnect_if_connected) {
>              /* vnc supports "connected=keep" only */
>              error_setg(errp, QERR_INVALID_PARAMETER, "connected");
> @@ -198,10 +191,6 @@ void qmp_set_password(const char *protocol, const char *password,
>          /* Note that setting an empty password will not disable login through
>           * this interface. */
>          rc = vnc_display_password(NULL, password);
> -    } else {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
> -                   "'vnc' or 'spice'");
> -        return;
>      }
>  
>      if (rc != 0) {
> @@ -209,7 +198,7 @@ void qmp_set_password(const char *protocol, const char *password,
>      }
>  }
>  
> -void qmp_expire_password(const char *protocol, const char *whenstr,
> +void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
>                           Error **errp)
>  {
>      time_t when;
> @@ -225,17 +214,13 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
>          when = strtoull(whenstr, NULL, 10);
>      }
>  
> -    if (strcmp(protocol, "spice") == 0) {
> +    if (protocol == DISPLAY_PROTOCOL_SPICE) {
>          if (!qemu_using_spice(errp)) {
>              return;
>          }
>          rc = qemu_spice.set_pw_expire(when);
> -    } else if (strcmp(protocol, "vnc") == 0) {
> +    } else if (protocol == DISPLAY_PROTOCOL_VNC) {
>          rc = vnc_display_pw_expire(NULL, when);
> -    } else {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
> -                   "'vnc' or 'spice'");
> -        return;
>      }

More robust:

       } else {
           assert(protocol == DISPLAY_PROTOCOL_VNC);
           rc = vnc_display_pw_expire(NULL, when);
       }

Same for qmp_set_password() above.

>  
>      if (rc != 0) {
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d7567ac866..15cc19dcc5 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -9,6 +9,35 @@
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
>  ##
>  # @set_password:
>  #
   [...]
   # @connected: how to handle existing clients when changing the
   #             password.  If nothing is specified, defaults to 'keep'
   #             'fail' to fail the command if clients are connected
   #             'disconnect' to disconnect existing clients
   #             'keep' to maintain existing clients

We explain the actions twice, in SetPasswordAction above and here.  Fine
with me.  Shortening this one would also be fine.  You might prefer not
to rock the boat at this stage ;)

> @@ -38,7 +67,9 @@
>  #
>  ##
>  { 'command': 'set_password',
> -  'data': {'protocol': 'str', 'password': 'str', '*connected': 'str'} }
> +  'data': { 'protocol': 'DisplayProtocol',
> +            'password': 'str',
> +            '*connected': 'SetPasswordAction' } }
>  
>  ##
>  # @expire_password:
> @@ -71,7 +102,9 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'expire_password', 'data': {'protocol': 'str', 'time': 'str'} }
> +{ 'command': 'expire_password',
> +  'data': { 'protocol': 'DisplayProtocol',
> +            'time': 'str' } }
>  
>  ##
>  # @screendump:


