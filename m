Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B0F48AFF5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:56:15 +0100 (CET)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7IZK-0003pN-6b
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1n7Hyz-0005UA-23
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:18:41 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:37806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1n7Hyw-0003Bg-M1
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 09:18:40 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A865446C53;
 Tue, 11 Jan 2022 15:18:27 +0100 (CET)
Message-ID: <ef0fd05c-7eab-ee0f-812c-1a3095da058c@proxmox.com>
Date: Tue, 11 Jan 2022 15:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <20211021100135.4146766-1-s.reiter@proxmox.com>
 <87fssl3emb.fsf@dusky.pond.sub.org> <87r1c5lz4s.fsf@dusky.pond.sub.org>
From: Fabian Ebner <f.ebner@proxmox.com>
In-Reply-To: <87r1c5lz4s.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.10.21 um 21:37 schrieb Markus Armbruster:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> Stefan Reiter <s.reiter@proxmox.com> writes:
>>
>>> Since the removal of the generic 'qmp_change' command, one can no longer replace
>>> the 'default' VNC display listen address at runtime (AFAIK). For our users who
>>> need to set up a secondary VNC access port, this means configuring a second VNC
>>> display (in addition to our standard one for web-access), but it turns out one
>>> cannot set a password on this second display at the moment, as the
>>> 'set_password' call only operates on the 'default' display.
>>>
>>> Additionally, using secret objects, the password is only read once at startup.
>>> This could be considered a bug too, but is not touched in this series and left
>>> for a later date.
>>
>> Queued, thanks!
> 
> Unqueued, because it fails to compile with --disable-vnc and with
> --disable-spice.  I failed to catch this in review, sorry.
> 
> Making it work takes a tiresome amount of #ifdeffery (sketch appended).
> Missing: removal of stubs that are no longer used,
> e.g. vnc_display_password() in ui/vnc-stubs.c.  Feels like more trouble
> than it's worth.
> 
> To maximize our chances to get this into 6.2, please respin without the
> 'if' conditionals.  Yes, this makes introspection less useful, but it's
> no worse than before the patch.
> 

Unfortunately, Stefan is no longer working with Proxmox, so I would pick 
up these patches instead.

Since the 6.2 ship has long sailed, I suppose the way forward is using 
the #ifdefs then?

 From my understanding what should be done is:

* In the first patch, fix the typo spotted by Eric Blake and add the R-b 
tags from this round.

* Replace "since 6.2" with "since 7.0" everywhere.

* Incorporate the #ifdef handling from below. I had to add another one 
for the when/whenstr handling in qmp_expire_password to avoid an error 
with -Werror=unused-but-set-variable.

* Add #ifdefs for the unused stubs too? If yes, how to best find them?

> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 5292617b44..39ca0b5ead 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -69,8 +69,10 @@
>     'base': { 'protocol': 'DisplayProtocol',
>               'password': 'str' },
>     'discriminator': 'protocol',
> -  'data': { 'vnc': 'SetPasswordOptionsVnc',
> -            'spice': 'SetPasswordOptionsSpice' } }
> +  'data': { 'vnc': { 'type': 'SetPasswordOptionsVnc',
> +                     'if': 'CONFIG_VNC' },
> +            'spice': { 'type': 'SetPasswordOptionsSpice',
> +                       'if': 'CONFIG_SPICE' } } }
>   
>   ##
>   # @SetPasswordOptionsSpice:
> @@ -155,7 +157,8 @@
>     'base': { 'protocol': 'DisplayProtocol',
>               'time': 'str' },
>     'discriminator': 'protocol',
> -  'data': { 'vnc': 'ExpirePasswordOptionsVnc' } }
> +  'data': { 'vnc': { 'type': 'ExpirePasswordOptionsVnc',
> +                     'if': 'CONFIG_VNC' } } }
>   
>   ##
>   # @ExpirePasswordOptionsVnc:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index f0f0c82d59..f714b2d316 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1451,24 +1451,40 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
>   {
>       const char *protocol  = qdict_get_str(qdict, "protocol");
>       const char *password  = qdict_get_str(qdict, "password");
> +#if defined(CONFIG_SPICE) || defined(CONFIG_VNC)
>       const char *display = qdict_get_try_str(qdict, "display");
> +#endif
> +#ifdef CONFIG_SPICE
>       const char *connected = qdict_get_try_str(qdict, "connected");
> +#endif
>       Error *err = NULL;
> +    int proto;
>   
>       SetPasswordOptions opts = {
>           .password = (char *)password,
>       };
>   
> -    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> -                                    DISPLAY_PROTOCOL_VNC, &err);
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol, -1, &err);
>       if (err) {
>           goto out;
>       }
>   
> -    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
> +    switch (proto) {
> +#ifdef CONFIG_VNC
> +    case -1:
> +        proto = DISPLAY_PROTOCOL_VNC;
> +        /* fall through */
> +    case DISPLAY_PROTOCOL_VNC:
>           opts.u.vnc.has_display = !!display;
>           opts.u.vnc.display = (char *)display;
> -    } else if (opts.protocol == DISPLAY_PROTOCOL_SPICE) {
> +        break;
> +#else
> +    case -1:
> +        error_setg(&err, "FIXME");
> +        goto out;
> +#endif
> +#ifdef CONFIG_SPICE
> +    case DISPLAY_PROTOCOL_SPICE:
>           opts.u.spice.has_connected = !!connected;
>           opts.u.spice.connected =
>               qapi_enum_parse(&SetPasswordAction_lookup, connected,
> @@ -1476,8 +1492,13 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
>           if (err) {
>               goto out;
>           }
> +        break;
> +#endif
> +    default:
> +        ;
>       }
>   
> +    opts.protocol = proto;
>       qmp_set_password(&opts, &err);
>   
>   out:
> @@ -1488,22 +1509,34 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
>   {
>       const char *protocol  = qdict_get_str(qdict, "protocol");
>       const char *whenstr = qdict_get_str(qdict, "time");
> +#if defined(CONFIG_SPICE) || defined(CONFIG_VNC)
>       const char *display = qdict_get_try_str(qdict, "display");
> +#endif
>       Error *err = NULL;
> +    int proto;
>   
>       ExpirePasswordOptions opts = {
>           .time = (char *)whenstr,
>       };
>   
> -    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
> -                                    DISPLAY_PROTOCOL_VNC, &err);
> +    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol, -1, &err);
>       if (err) {
>           goto out;
>       }
>   
> -    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
> +    switch (proto) {
> +#ifdef CONFIG_VNC
> +    case -1:
> +        proto = DISPLAY_PROTOCOL_VNC;
> +        /* fall through */
> +    case DISPLAY_PROTOCOL_VNC:
>           opts.u.vnc.has_display = !!display;
>           opts.u.vnc.display = (char *)display;
> +#else
> +    case -1:
> +        error_setg(&err, "FIXME");
> +        goto out;
> +#endif
>       }
>   
>       qmp_expire_password(&opts, &err);
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 4825d0cbea..69a9c2977a 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -167,18 +167,26 @@ void qmp_set_password(SetPasswordOptions *opts, Error **errp)
>   {
>       int rc = 0;
>   
> -    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
> +    switch (opts->protocol) {
> +#ifdef CONFIG_SPICE
> +    case DISPLAY_PROTOCOL_SPICE:
>           if (!qemu_using_spice(errp)) {
>               return;
>           }
>           rc = qemu_spice.set_passwd(opts->password,
>                   opts->u.spice.connected == SET_PASSWORD_ACTION_FAIL,
>                   opts->u.spice.connected == SET_PASSWORD_ACTION_DISCONNECT);
> -    } else {
> -        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
> +        break;
> +#endif
> +#ifdef CONFIG_VNC
> +    case DISPLAY_PROTOCOL_VNC:
>           /* Note that setting an empty password will not disable login through
>            * this interface. */
>           rc = vnc_display_password(opts->u.vnc.display, opts->password);
> +        break;
> +#endif
> +    default:
> +        abort();
>       }
>   
>       if (rc != 0) {
> @@ -202,14 +210,22 @@ void qmp_expire_password(ExpirePasswordOptions *opts, Error **errp)
>           when = strtoull(whenstr, NULL, 10);
>       }
>   
> -    if (opts->protocol == DISPLAY_PROTOCOL_SPICE) {
> +    switch (opts->protocol) {
> +#ifdef CONFIG_SPICE
> +    case DISPLAY_PROTOCOL_SPICE:
>           if (!qemu_using_spice(errp)) {
>               return;
>           }
>           rc = qemu_spice.set_pw_expire(when);
> -    } else {
> -        assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
> +        break;
> +#endif
> +#ifdef CONFIG_VNC
> +    case DISPLAY_PROTOCOL_VNC:
>           rc = vnc_display_pw_expire(opts->u.vnc.display, when);
> +        break;
> +#endif
> +    default:
> +        abort();
>       }
>   
>       if (rc != 0) {
> 
> 
> 


