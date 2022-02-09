Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89D4AF3EC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:19:13 +0100 (CET)
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHnoN-00014I-KB
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:19:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHnG4-0007Zh-I2
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:43:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nHnG0-0000Hv-6Z
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 08:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644414217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X1e3BSraEzDjN1P9/W6HnhAYKQNhXqmB/VtmNoxs31M=;
 b=Jg16Zhhq4lZVoMWeBWMaelUEzVa5Llje78vU1Pkf1irgp+Yc/Yowu9VDR27PgMwrNiZy9H
 czHH1CAGw4N0YShQBBg4EfSX5IoRJ9CSbA0WmSWuTB34sHjW0p1ZaSkZWNl1OGMRp15eqh
 iM0lydZZdi/N5j18/QmYqJEb8viY4eY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-HhIbbpdjPkGy7llRCdBCcw-1; Wed, 09 Feb 2022 08:43:34 -0500
X-MC-Unique: HhIbbpdjPkGy7llRCdBCcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 447071091DA1;
 Wed,  9 Feb 2022 13:43:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6158B7B037;
 Wed,  9 Feb 2022 13:43:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E3ED921E6A00; Wed,  9 Feb 2022 14:43:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v8 2/3] qapi/monitor: refactor set/expire_password with
 enums
References: <20220204101220.343526-1-f.ebner@proxmox.com>
 <20220204101220.343526-3-f.ebner@proxmox.com>
Date: Wed, 09 Feb 2022 14:43:13 +0100
In-Reply-To: <20220204101220.343526-3-f.ebner@proxmox.com> (Fabian Ebner's
 message of "Fri, 4 Feb 2022 11:12:19 +0100")
Message-ID: <87o83ggnpq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 armbru@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fabian Ebner <f.ebner@proxmox.com> writes:

> From: Stefan Reiter <s.reiter@proxmox.com>
>
> 'protocol' and 'connected' are better suited as enums than as strings,
> make use of that. No functional change intended.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> [FE: update "Since: " from 6.2 to 7.0
>      put 'keep' first in enum to ease use as a default]
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---
>
> v7 -> v8:
> * drop if conditionals for DisplayProtocol enum, so compilation with
>   --disable-{spice,vnc} works
>
>  monitor/hmp-cmds.c | 29 +++++++++++++++++++++++++++--
>  monitor/qmp-cmds.c | 37 ++++++++++++-------------------------
>  qapi/ui.json       | 36 ++++++++++++++++++++++++++++++++++--
>  3 files changed, 73 insertions(+), 29 deletions(-)
>
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 8c384dc1b2..ff78741b75 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1398,8 +1398,24 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
>      const char *password  = qdict_get_str(qdict, "password");
>      const char *connected = qdict_get_try_str(qdict, "connected");
>      Error *err = NULL;
> +    DisplayProtocol proto;
> +    SetPasswordAction conn;
>  
> -    qmp_set_password(protocol, password, !!connected, connected, &err);
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                            DISPLAY_PROTOCOL_VNC, &err);
> +    if (err) {
> +        goto out;
> +    }
> +
> +    conn = qapi_enum_parse(&SetPasswordAction_lookup, connected,
> +                           SET_PASSWORD_ACTION_KEEP, &err);
> +    if (err) {
> +        goto out;
> +    }
> +
> +    qmp_set_password(proto, password, !!connected, conn, &err);
> +
> +out:
>      hmp_handle_error(mon, err);
>  }
>  
> @@ -1408,8 +1424,17 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
>      const char *protocol  = qdict_get_str(qdict, "protocol");
>      const char *whenstr = qdict_get_str(qdict, "time");
>      Error *err = NULL;
> +    DisplayProtocol proto;
> +
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> +                            DISPLAY_PROTOCOL_VNC, &err);
> +    if (err) {
> +        goto out;
> +    }
>  
> -    qmp_expire_password(protocol, whenstr, &err);
> +    qmp_expire_password(proto, whenstr, &err);
> +
> +out:
>      hmp_handle_error(mon, err);
>  }
>  
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index db4d186448..b6e8b57fcc 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -168,33 +168,27 @@ void qmp_system_wakeup(Error **errp)
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
> +    } else {
> +        assert(protocol == DISPLAY_PROTOCOL_VNC);
>          if (fail_if_connected || disconnect_if_connected) {
>              /* vnc supports "connected=keep" only */
>              error_setg(errp, QERR_INVALID_PARAMETER, "connected");
> @@ -203,10 +197,6 @@ void qmp_set_password(const char *protocol, const char *password,
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
> @@ -214,7 +204,7 @@ void qmp_set_password(const char *protocol, const char *password,
>      }
>  }
>  
> -void qmp_expire_password(const char *protocol, const char *whenstr,
> +void qmp_expire_password(DisplayProtocol protocol, const char *whenstr,
>                           Error **errp)
>  {
>      time_t when;
> @@ -230,17 +220,14 @@ void qmp_expire_password(const char *protocol, const char *whenstr,
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
> -        rc = vnc_display_pw_expire(NULL, when);
>      } else {
> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol",
> -                   "'vnc' or 'spice'");
> -        return;
> +        assert(protocol == DISPLAY_PROTOCOL_VNC);
> +        rc = vnc_display_pw_expire(NULL, when);
>      }
>  
>      if (rc != 0) {
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..e112409211 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -9,6 +9,34 @@
>  { 'include': 'common.json' }
>  { 'include': 'sockets.json' }
>  
> +##
> +# @DisplayProtocol:
> +#
> +# Display protocols which support changing password options.

This is correct now: the enum is only used in that role.  If we ever use
DisplayReloadType for other purposes, the comment will become wrong.
Let's not worry about that now.

> +#
> +# Since: 7.0
> +#
> +##
> +{ 'enum': 'DisplayProtocol',
> +  'data': [ 'vnc', 'spice' ] }
> +
> +##
> +# @SetPasswordAction:
> +#
> +# An action to take on changing a password on a connection with active clients.
> +#
> +# @keep: maintain existing clients
> +#
> +# @fail: fail the command if clients are connected
> +#
> +# @disconnect: disconnect existing clients
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'enum': 'SetPasswordAction',
> +  'data': [ 'keep', 'fail', 'disconnect' ] }
> +
>  ##
>  # @set_password:
>  #
> @@ -38,7 +66,9 @@
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
> @@ -71,7 +101,9 @@
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

Reviewed-by: Markus Armbruster <armbru@redhat.com>


