Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FA863C3B7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:27:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02Vo-0006Pj-7u; Tue, 29 Nov 2022 10:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1p02Vk-0006PK-RH
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:27:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1p02Vi-0000xv-8J
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669735620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IPq+fAzFsVPtFAmjDxmqak6HeabpUAoVOIvAxQ/q7J0=;
 b=SDNJdmHsH+XMevY14bi4BmiaP+ipQA4AOuQl4KxmsnM2KpNgvnwW71oRYFR8m6747QmNcf
 YOznFfx1TxGQGBPXlUfDf/GqF2RVwS9dvqrNJvt6FNM5OIeJMQKM2c60yn3vx7Y11Pqfr+
 31Ee4kmDhixrV+vPbP+qDTcXWXnfl5Y=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-goWsO6ZENEujw5tN-YPXuQ-1; Tue, 29 Nov 2022 10:26:56 -0500
X-MC-Unique: goWsO6ZENEujw5tN-YPXuQ-1
Received: by mail-il1-f197.google.com with SMTP id
 d19-20020a056e020c1300b00300b5a12c44so12304408ile.15
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:26:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IPq+fAzFsVPtFAmjDxmqak6HeabpUAoVOIvAxQ/q7J0=;
 b=cn0WiwxDnJIxP62j1EH21Qv3cqA0CfoxMfGRJZ0YprUytcV7jN0cXqJczY9r9B4dt0
 mfckagfv+DML0fKLJTnw60OIOQJHvj6CBeHFxgfUKExHUqetMu36Aq9XYCLkfj2SkKfI
 nf2yoB6APe+eqMRFeqej2L2u7hMvMUOOUl7dis+BrZPhgFqtpDA2+IoYeGujq/GCYidH
 XzPnLxR7d3sJ6OxwVj3c63CTV1Ie6bAU2V2lg739Euf2sTwNvjh7NKmv7XvzgF60BHHD
 A/f1QjQ01btCVg+R6RWy+v9OPcTHNNoUopqbCnL1poWA7gzYUKaWdpsDLTHasxyDbPZM
 Fu9w==
X-Gm-Message-State: ANoB5pnz99pdy+i8yu+tgjgGT5NLefzkiliLq1/rDHF1UGZHji4b3ogV
 cfZzfrDlOYHrWah4I+rIupogJOZUuwH5QtVDAic+swQl9k3wGFIgEQVQihdlAwHkSzYDxh8J9oF
 ZVMGC70MN+ijkWZUQJ2f+jvfBBTW7C9E=
X-Received: by 2002:a92:cb89:0:b0:302:3c43:20b9 with SMTP id
 z9-20020a92cb89000000b003023c4320b9mr17720160ilo.300.1669735616087; 
 Tue, 29 Nov 2022 07:26:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4unvzBhDfeSFiz5Lq5N+dqCRvNokaBr/7F4RxiRpOQrLBxeQ2oM0pg33dH+cDXWg0Lydyl19fuXvCL89cQstA=
X-Received: by 2002:a92:cb89:0:b0:302:3c43:20b9 with SMTP id
 z9-20020a92cb89000000b003023c4320b9mr17720151ilo.300.1669735615890; Tue, 29
 Nov 2022 07:26:55 -0800 (PST)
MIME-Version: 1.0
References: <878rjtretb.fsf@pond.sub.org>
In-Reply-To: <878rjtretb.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 29 Nov 2022 19:26:43 +0400
Message-ID: <CAMxuvawocVQ7Fva1CwA9JCO+i+A5a-_AJ+V+ivOwfKo68bREHg@mail.gmail.com>
Subject: Re: Who / what uses QMP command add_client?
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Krempa <pkrempa@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000041249f05ee9d9eec"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000041249f05ee9d9eec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Nov 29, 2022 at 6:55 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> QMP command add_client's schema:
>
>     ##
>     # @add_client:
>     #
>     # Allow client connections for VNC, Spice and socket based
>     # character devices to be passed in to QEMU via SCM_RIGHTS.
>     #
>     # @protocol: protocol name. Valid names are "vnc", "spice",
> "@dbus-display" or
>     #            the name of a character device (eg. from -chardev id=3DX=
XXX)
>     #
>     # @fdname: file descriptor name previously passed via 'getfd' command
>     #
>     # @skipauth: whether to skip authentication. Only applies
>     #            to "vnc" and "spice" protocols
>     #
>     # @tls: whether to perform TLS. Only applies to the "spice"
>     #       protocol
>     #
>     # Returns: nothing on success.
>     #
>     # Since: 0.14
>     #
>     # Example:
>     #
>     # -> { "execute": "add_client", "arguments": { "protocol": "vnc",
>     #                                              "fdname": "myclient" }=
 }
>     # <- { "return": {} }
>     #
>     ##
>     { 'command': 'add_client',
>       'data': { 'protocol': 'str', 'fdname': 'str', '*skipauth': 'bool',
>                 '*tls': 'bool' } }
>
> Spot the design flaw!
>
> It's overloaded @protocol.  Two issues.
>
> One, character device IDs "vnc", "spice", "@dbus-display" don't work
> here.  If we ever add another protocol, we make another device ID not
> work.  Perhaps this is why Marc-Andr=C3=A9 chose "@dbus-display", which
> otherwise looks like a typo :)
>

That's right, I tried to avoid conflicting with chardev ID namespace. IDs
can't start with '@'.

btw, I have a few patches pending to extend add_client for windows sockets.

I also have patches to check if fds are actually sockets, since that
command doesn't make much sense with other fds.


> Two, introspection can't tell us what protocols are supported.
>

Hmm, not really a big deal I suppose. You would have both compile-time and
run-time config. There are other means to introspect the display protocol,
like query-vnc or query-spice. I thought I had something covering dbus as
well, but I can't find it, I'll look at it.

Let me know if you plan to touch that command, it will likely conflict with
my work. I plan to submit it soon after the release, but I might do it
earlier.

--00000000000041249f05ee9d9eec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 29, 2022 at 6:55 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">QM=
P command add_client&#39;s schema:<br>
<br>
=C2=A0 =C2=A0 ##<br>
=C2=A0 =C2=A0 # @add_client:<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # Allow client connections for VNC, Spice and socket based<br=
>
=C2=A0 =C2=A0 # character devices to be passed in to QEMU via SCM_RIGHTS.<b=
r>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # @protocol: protocol name. Valid names are &quot;vnc&quot;, =
&quot;spice&quot;, &quot;@dbus-display&quot; or<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the name of a char=
acter device (eg. from -chardev id=3DXXXX)<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # @fdname: file descriptor name previously passed via &#39;ge=
tfd&#39; command<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # @skipauth: whether to skip authentication. Only applies<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to &quot;vnc&quot;=
 and &quot;spice&quot; protocols<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # @tls: whether to perform TLS. Only applies to the &quot;spi=
ce&quot;<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0protocol<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # Returns: nothing on success.<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # Since: 0.14<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # Example:<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 # -&gt; { &quot;execute&quot;: &quot;add_client&quot;, &quot;=
arguments&quot;: { &quot;protocol&quot;: &quot;vnc&quot;,<br>
=C2=A0 =C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;fdname&quot;: &quot;myclient&quot; } }<br=
>
=C2=A0 =C2=A0 # &lt;- { &quot;return&quot;: {} }<br>
=C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 ##<br>
=C2=A0 =C2=A0 { &#39;command&#39;: &#39;add_client&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 &#39;data&#39;: { &#39;protocol&#39;: &#39;str&#39;, &=
#39;fdname&#39;: &#39;str&#39;, &#39;*skipauth&#39;: &#39;bool&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*tls&#39;: &#3=
9;bool&#39; } }<br>
<br>
Spot the design flaw!<br>
<br>
It&#39;s overloaded @protocol.=C2=A0 Two issues.<br>
<br>
One, character device IDs &quot;vnc&quot;, &quot;spice&quot;, &quot;@dbus-d=
isplay&quot; don&#39;t work<br>
here.=C2=A0 If we ever add another protocol, we make another device ID not<=
br>
work.=C2=A0 Perhaps this is why Marc-Andr=C3=A9 chose &quot;@dbus-display&q=
uot;, which<br>
otherwise looks like a typo :)<br></blockquote><div><br></div><div>That&#39=
;s right, I tried to avoid conflicting with chardev ID namespace. IDs can&#=
39;t start with &#39;@&#39;.</div><div>=C2=A0</div><div>btw, I have a few p=
atches pending to extend add_client for windows sockets.</div><div><br></di=
v><div>I also have patches to check if fds are actually sockets, since that=
 command doesn&#39;t make much sense with other fds.</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Two, introspection can&#39;t tell us what protocols are supported.<br></blo=
ckquote><div><br></div><div>Hmm, not really a big deal I suppose. You would=
 have both compile-time and run-time config. There are other means to intro=
spect the display protocol, like query-vnc or query-spice. I thought I had =
something covering dbus as well, but I can&#39;t find it, I&#39;ll look at =
it. <br></div></div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">Let me know if you plan to touch that command, it will likely conf=
lict with my work. I plan to submit it soon after the release, but I might =
do it earlier.<br></div></div>

--00000000000041249f05ee9d9eec--


