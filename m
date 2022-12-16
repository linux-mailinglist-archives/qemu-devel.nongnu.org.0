Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9684864E90A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:03:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67X0-0000zH-3t; Fri, 16 Dec 2022 05:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p67Wu-0000yd-8U
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:01:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p67Wr-0008G7-UQ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671184880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rQ4tKwUZSSGy9gJ2bmTTWvz17FvuhuP8/KMUMdZVW5A=;
 b=YYdQDyFrYNa+Tlxsm7vdCwMURsLLCH8/yjJVidwSRarxo+8/J4T/Ul5f5T30G7kzoYhgGR
 PFebHUWx3y4A+pStUo+GTroWHNwW0koNp3LkX9fDfYUUjqzPU7peTOxd4O434EYfk/nQkq
 374b4kgySX8Rp5PREu+Hk+7bYEbb4so=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-euWRwfWHP6KGqT8E807vdw-1; Fri, 16 Dec 2022 05:01:18 -0500
X-MC-Unique: euWRwfWHP6KGqT8E807vdw-1
Received: by mail-vk1-f200.google.com with SMTP id
 n20-20020a1fa414000000b003bc585c7d50so780756vke.16
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 02:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQ4tKwUZSSGy9gJ2bmTTWvz17FvuhuP8/KMUMdZVW5A=;
 b=4o0roiEFGVnwcpTPqKrbtUH3PF8ian83bFh2OE9szGGspJMntexxlpcRsCeOEI/lZw
 PIuQeeHarRJ3PK+tILYP1lcfBWaGKK9PwTFX1w2Jy3S989+boN4wCtN4HQyO8StbmK7k
 gZp7pOYs50qXE0+qczEfTgOvQ+GjO3hpOwY7dm0RWHxQTI9YthMnhm0wAYsVn367ghk6
 jv+3n6Wa3oDpI/NjmZePUt4obxFDr4L8EghSPYBHK9GYTGYOH5xi6zRDKNIInFAgDeL5
 VWorBpoSYtoC08yEaRgq2XjIbnZwtBJYPbKDnuonda9WxYOZL7rjcaflxuZunyRXEDPD
 Ef6A==
X-Gm-Message-State: AFqh2kqJy55/+xfZbzwcjJf59VJqLNzMtHaaqWGpGXXwAzEJNs/WtU8E
 l+3ZkUccAUpKxTXaQhm5l2JoE4Eb+RJEQJ0l2pRlFtucXhbont5034+D3vBrjPv1Dt5DOfo1hFC
 EQXOz8CgEDFTNpNz/LXCFxHy7bgBgFbY=
X-Received: by 2002:a67:ce05:0:b0:3b5:3f84:287 with SMTP id
 s5-20020a67ce05000000b003b53f840287mr596561vsl.66.1671184877614; 
 Fri, 16 Dec 2022 02:01:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvc0k3uJK4JMer5dfHFcG2sc4YE+eMrQ/n6aLWN2OU+5n+/qOsByFw/UKRfAIenY+sPndyIl0ZXnxggIi6n69k=
X-Received: by 2002:a67:ce05:0:b0:3b5:3f84:287 with SMTP id
 s5-20020a67ce05000000b003b53f840287mr596556vsl.66.1671184877371; Fri, 16 Dec
 2022 02:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <a0d15083-c257-6170-a3c7-2baf1ec58a9a@virtuozzo.com>
 <CAPMcbCoEfeZW0YQRN1To6zdGEP4g4GV3PBS9EDGqs_dYFNTF4g@mail.gmail.com>
In-Reply-To: <CAPMcbCoEfeZW0YQRN1To6zdGEP4g4GV3PBS9EDGqs_dYFNTF4g@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Fri, 16 Dec 2022 12:01:05 +0200
Message-ID: <CAPMcbCp0Q9v5vfPXLyHoacQqcXrYLKb=jWmT4mX9krr02CkQaA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] qga: improve "syslog" domain logging
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, marcandre.lureau@gmail.com, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="000000000000f8558b05efef0ca4"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
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

--000000000000f8558b05efef0ca4
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Tested-by: Konstantin Kostiuk <kkostiuk@redhat.com>


Hi Andrey,
Do you expect Event Viewer to be empty by default in the current
implementation?
Currently, all logs that we write in the guest agent do not have "syslog"
domain
so we will have logs only in file.

On Mon, Dec 12, 2022 at 2:29 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Currently, there is a code freeze in QEMU for release 7.2.
> I will merge this after it https://wiki.qemu.org/Planning/7.2
>
> Best Regards,
> Konstantin Kostiuk.
>
>
> On Mon, Dec 12, 2022 at 2:17 PM Andrey Drobyshev <
> andrey.drobyshev@virtuozzo.com> wrote:
>
>> On 11/29/22 19:38, Andrey Drobyshev wrote:
>> > These patches extend QGA logging interface, primarily under Windows
>> > guests.  They enable QGA to write to Windows event log, much like
>> > syslog() on *nix.  In addition we get rid of hardcoded log level used by
>> > ga_log().
>> >
>> > v2:
>> > * Close event_log handle when doing cleanup_agent()
>> > * Fix switch cases indentation as reported by scripts/checkpatch.pl
>> >
>> > Andrey Drobyshev (2):
>> >   qga-win: add logging to Windows event log
>> >   qga: map GLib log levels to system levels
>> >
>> >  configure                 |  3 +++
>> >  qga/installer/qemu-ga.wxs |  5 ++++
>> >  qga/main.c                | 50 +++++++++++++++++++++++++++++++++++----
>> >  qga/meson.build           | 19 ++++++++++++++-
>> >  qga/messages-win32.mc     |  9 +++++++
>> >  5 files changed, 81 insertions(+), 5 deletions(-)
>> >  create mode 100644 qga/messages-win32.mc
>> >
>>
>> Could you please clarify the status of these patches?
>>
>>

--000000000000f8558b05efef0ca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Reviewed-by: Konstantin Kostiuk &lt;=
<a href=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.co=
m</a>&gt;</div><div>Tested-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kko=
stiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><div><=
br></div><div><br></div><div>Hi Andrey,</div><div>Do you expect Event Viewe=
r to be empty by default in the current implementation? <br></div><div>Curr=
ently, all logs that we write in the guest agent do not have &quot;syslog&q=
uot; domain <br></div><div>so we will have logs only in file.<br></div></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Dec 12, 2022 at 2:29 PM Konstantin Kostiuk &lt;<a href=3D"mailto:=
kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Currently, th=
ere is a code freeze in QEMU for release 7.2.<br></div>I will merge this af=
ter it <a href=3D"https://wiki.qemu.org/Planning/7.2" target=3D"_blank">htt=
ps://wiki.qemu.org/Planning/7.2</a><div><br clear=3D"all"><div><div><div di=
r=3D"ltr"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.=
</div></div></div></div><br></div></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 12, 2022 at 2:17 PM And=
rey Drobyshev &lt;<a href=3D"mailto:andrey.drobyshev@virtuozzo.com" target=
=3D"_blank">andrey.drobyshev@virtuozzo.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 11/29/22 19:38, Andrey Drobysh=
ev wrote:<br>
&gt; These patches extend QGA logging interface, primarily under Windows<br=
>
&gt; guests.=C2=A0 They enable QGA to write to Windows event log, much like=
<br>
&gt; syslog() on *nix.=C2=A0 In addition we get rid of hardcoded log level =
used by<br>
&gt; ga_log().<br>
&gt; <br>
&gt; v2:<br>
&gt; * Close event_log handle when doing cleanup_agent()<br>
&gt; * Fix switch cases indentation as reported by scripts/<a href=3D"http:=
//checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt; <br>
&gt; Andrey Drobyshev (2):<br>
&gt;=C2=A0 =C2=A0qga-win: add logging to Windows event log<br>
&gt;=C2=A0 =C2=A0qga: map GLib log levels to system levels<br>
&gt; <br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 qga/installer/qemu-ga.wxs |=C2=A0 5 ++++<br>
&gt;=C2=A0 qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 50 +++++++++++++++++++++++++++++++++++----<br>
&gt;=C2=A0 qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++=
+++++++++++-<br>
&gt;=C2=A0 qga/<a href=3D"http://messages-win32.mc" rel=3D"noreferrer" targ=
et=3D"_blank">messages-win32.mc</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++<br=
>
&gt;=C2=A0 5 files changed, 81 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 qga/<a href=3D"http://messages-win32.mc" rel=
=3D"noreferrer" target=3D"_blank">messages-win32.mc</a><br>
&gt; <br>
<br>
Could you please clarify the status of these patches?<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000f8558b05efef0ca4--


