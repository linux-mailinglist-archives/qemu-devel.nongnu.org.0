Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95816435D3D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:46:16 +0200 (CEST)
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTiJ-0007GS-52
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdTez-0004ch-N7
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:42:50 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:17388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdTew-0006xI-M2
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 04:42:49 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 52E4245CDB;
 Thu, 21 Oct 2021 10:42:33 +0200 (CEST)
Subject: Re: [PATCH v6 3/5] qapi/monitor: allow VNC display id in
 set/expire_password
To: Markus Armbruster <armbru@redhat.com>
References: <20211020135500.2384930-1-s.reiter@proxmox.com>
 <20211020135500.2384930-4-s.reiter@proxmox.com>
 <87zgr3ezmj.fsf@dusky.pond.sub.org>
From: Stefan Reiter <s.reiter@proxmox.com>
Message-ID: <f562acca-2c34-cce5-f918-f94f7962b33e@proxmox.com>
Date: Thu, 21 Oct 2021 10:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87zgr3ezmj.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 7:05 AM, Markus Armbruster wrote:
> Stefan Reiter <s.reiter@proxmox.com> writes:
> 
>> It is possible to specify more than one VNC server on the command line,
>> either with an explicit ID or the auto-generated ones à la "default",
>> "vnc2", "vnc3", ...
>>
>> It is not possible to change the password on one of these extra VNC
>> displays though. Fix this by adding a "display" parameter to the
>> "set_password" and "expire_password" QMP and HMP commands.
>>
>> For HMP, the display is specified using the "-d" value flag.
>>
>> For QMP, the schema is updated to explicitly express the supported
>> variants of the commands with protocol-discriminated unions.
>>
>> Suggested-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>> ---
>>   hmp-commands.hx    |  24 +++++-----
>>   monitor/hmp-cmds.c |  51 +++++++++++++++------
>>   monitor/qmp-cmds.c |  36 ++++++---------
>>   qapi/ui.json       | 112 +++++++++++++++++++++++++++++++++++----------
>>   4 files changed, 154 insertions(+), 69 deletions(-)
>>
>> diff --git a/hmp-commands.hx b/hmp-commands.hx
>> index cf723c69ac..9fbb207b35 100644
>> --- a/hmp-commands.hx
>> +++ b/hmp-commands.hx
>> @@ -1514,33 +1514,35 @@ ERST
>>   
>>       {
>>           .name       = "set_password",
>> -        .args_type  = "protocol:s,password:s,connected:s?",
>> -        .params     = "protocol password action-if-connected",
>> +        .args_type  = "protocol:s,password:s,display:-dV,connected:s?",
>> +        .params     = "protocol password [-d display] [action-if-connected]",
>>           .help       = "set spice/vnc password",
>>           .cmd        = hmp_set_password,
>>       },
>>   
>>   SRST
>> -``set_password [ vnc | spice ] password [ action-if-connected ]``
>> -  Change spice/vnc password.  *action-if-connected* specifies what
>> -  should happen in case a connection is established: *fail* makes the
>> -  password change fail.  *disconnect* changes the password and
>> +``set_password [ vnc | spice ] password [ -d display ] [ action-if-connected ]``
>> +  Change spice/vnc password.  *display* can be used with 'vnc' to specify
>> +  which display to set the password on.  *action-if-connected* specifies
>> +  what should happen in case a connection is established: *fail* makes
>> +  the password change fail.  *disconnect* changes the password and
>>     disconnects the client.  *keep* changes the password and keeps the
>>     connection up.  *keep* is the default.
>>   ERST
>>   
>>       {
>>           .name       = "expire_password",
>> -        .args_type  = "protocol:s,time:s",
>> -        .params     = "protocol time",
>> +        .args_type  = "protocol:s,time:s,display:-dV",
>> +        .params     = "protocol time [-d display]",
>>           .help       = "set spice/vnc password expire-time",
>>           .cmd        = hmp_expire_password,
>>       },
>>   
>>   SRST
>> -``expire_password [ vnc | spice ]`` *expire-time*
>> -  Specify when a password for spice/vnc becomes
>> -  invalid. *expire-time* accepts:
>> +``expire_password [ vnc | spice ] expire-time [ -d display ]``
>> +  Specify when a password for spice/vnc becomes invalid.
>> +  *display* behaves the same as in ``set_password``.
>> +  *expire-time* accepts:
>>   
>>     ``now``
>>       Invalidate password instantly.
>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> index b8abe69609..daa4a8e106 100644
>> --- a/monitor/hmp-cmds.c
>> +++ b/monitor/hmp-cmds.c
>> @@ -1451,26 +1451,39 @@ void hmp_set_password(Monitor *mon, const QDict *qdict)
>>   {
>>       const char *protocol  = qdict_get_str(qdict, "protocol");
>>       const char *password  = qdict_get_str(qdict, "password");
>> +    const char *display = qdict_get_try_str(qdict, "display");
>>       const char *connected = qdict_get_try_str(qdict, "connected");
>>       Error *err = NULL;
>> -    DisplayProtocol proto;
>> -    SetPasswordAction conn;
>>   
>> -    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>> -                            DISPLAY_PROTOCOL_VNC, &err);
>> +    SetPasswordOptions opts = {
>> +        .password = g_strdup(password),
>> +        .u.vnc.display = NULL,
>> +    };
>> +
>> +    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>> +                                    DISPLAY_PROTOCOL_VNC, &err);
>>       if (err) {
>>           goto out;
>>       }
>>   
>> -    conn = qapi_enum_parse(&SetPasswordAction_lookup, connected,
>> -                           SET_PASSWORD_ACTION_KEEP, &err);
>> -    if (err) {
>> -        goto out;
>> +    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
>> +        opts.u.vnc.has_display = !!display;
>> +        opts.u.vnc.display = g_strdup(display);
>> +    } else if (opts.protocol == DISPLAY_PROTOCOL_SPICE) {
>> +        opts.u.spice.has_connected = !!connected;
>> +        opts.u.spice.connected =
>> +            qapi_enum_parse(&SetPasswordAction_lookup, connected,
>> +                            SET_PASSWORD_ACTION_KEEP, &err);
>> +        if (err) {
>> +            goto out;
>> +        }
>>       }
>>   
>> -    qmp_set_password(proto, password, !!connected, conn, &err);
>> +    qmp_set_password(&opts, &err);
>>   
>>   out:
>> +    g_free(opts.password);
>> +    g_free(opts.u.vnc.display);
> 
> Uh-oh...
> 
> For DISPLAY_PROTOCOL_SPICE, we execute
> 
>             .u.vnc.display = NULL,
>             opts.u.spice.has_connected = !!connected;
>             opts.u.spice.connected =
>                 qapi_enum_parse(&SetPasswordAction_lookup, connected,
>                                 SET_PASSWORD_ACTION_KEEP, &err);
>             opts.u.vnc.has_display = !!display;
>         g_free(opts.u.vnc.display);
> 
> The assignments to opts.u.spice.has_connected and opts.u.spice_connected
> clobber opts.u.vnc.display.
> 
> The simplest fix is to pass @display directly.  Precedence:
> hmp_drive_mirror().

With "directly", I assume you mean without g_strdup, so:

   opts.u.vnc.display = (char *)display;

right? Does it matter that we drop the 'const'?

> 
> Do the same for @password, of course.
> 
>>       hmp_handle_error(mon, err);
>>   }
>>   
>> @@ -1478,18 +1491,30 @@ void hmp_expire_password(Monitor *mon, const QDict *qdict)
>>   {
>>       const char *protocol  = qdict_get_str(qdict, "protocol");
>>       const char *whenstr = qdict_get_str(qdict, "time");
>> +    const char *display = qdict_get_try_str(qdict, "display");
>>       Error *err = NULL;
>> -    DisplayProtocol proto;
>>   
>> -    proto = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>> -                            DISPLAY_PROTOCOL_VNC, &err);
>> +    ExpirePasswordOptions opts = {
>> +        .time = g_strdup(whenstr),
>> +        .u.vnc.display = NULL,
>> +    };
>> +
>> +    opts.protocol = qapi_enum_parse(&DisplayProtocol_lookup, protocol,
>> +                                    DISPLAY_PROTOCOL_VNC, &err);
>>       if (err) {
>>           goto out;
>>       }
>>   
>> -    qmp_expire_password(proto, whenstr, &err);
>> +    if (opts.protocol == DISPLAY_PROTOCOL_VNC) {
>> +        opts.u.vnc.has_display = !!display;
>> +        opts.u.vnc.display = g_strdup(display);
>> +    }
> 
> Use of -d with spice are silently ignored.  Do we care?  Same for
> hmp_set_password() above.

Depends on you, I don't. I think it's not worth catching even more
in HMP, since it's clear there's only one SPICE display anyway, and
it's all documented.

> 
>> +
>> +    qmp_expire_password(&opts, &err);
>>   
>>   out:
>> +    g_free(opts.time);
>> +    g_free(opts.u.vnc.display);
> 
> No uh-oh here, since opts.u.vnc is actually the only member of opts.u.
> Still, let's pass @time and @display directly for consistency and
> robustness.
> 
>>       hmp_handle_error(mon, err);
>>   }
>>   
> 
> [...]
> 
> 


