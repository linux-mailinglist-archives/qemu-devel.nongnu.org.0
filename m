Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F200949607F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 15:11:11 +0100 (CET)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAudC-0000wS-9V
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 09:11:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nAtqt-0003ed-28
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:21:18 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:25974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nAtqo-0002ex-T6
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:21:14 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id D0D4D46D10;
 Fri, 21 Jan 2022 14:21:03 +0100 (CET)
Message-ID: <17e5677f-b20d-7b48-5946-54297ebf9780@proxmox.com>
Date: Fri, 21 Jan 2022 14:20:50 +0100
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

----8<----

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

So I decided to give the #ifdef approach a go, but if I configure with 
--disable-spice --disable-vnc, even with the above conditionals, it is 
still be possible to issue a set_password qmp command, which will then 
lead to an abort() in the generated code (and the patched 
qmp_set_password below would do the same if it could be reached):

Thread 1 (Thread 0x7f4a86701ec0 (LWP 40487) "qemu-system-x86"):
#0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
#1  0x00007f4a90d72537 in __GI_abort () at abort.c:79
#2  0x00005583ca03cef3 in visit_type_SetPasswordOptions_members 
(v=v@entry=0x5583cc6cccc0, obj=obj@entry=0x7ffe5bfc3ee0, 
errp=errp@entry=0x0) at qapi/qapi-visit-ui.c:71
#3  0x00005583ca5df72f in qmp_marshal_set_password (args=<optimized 
out>, ret=<optimized out>, errp=0x7f4a85d96ea0) at 
qapi/qapi-commands-ui.c:49
#4  0x00005583ca5e89e9 in do_qmp_dispatch_bh (opaque=0x7f4a85d96eb0) at 
../qapi/qmp-dispatch.c:129
#5  0x00005583ca605494 in aio_bh_call (bh=0x7f4a78009270) at 
../util/async.c:141

Is that expected? Should I add a conditional for {set,expire}_password 
in the schema too, and add an
#if defined(CONFIG_SPICE) || defined(CONFIG_VNC)
around the whole {hmp,qmp}_{set,expire}_password functions/declarations 
in C?

Or maybe that's a good indication that it's really not worth it ;)?

P.S. Thank you for the QAPI-related explanation in the other mail!

----8<----

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


