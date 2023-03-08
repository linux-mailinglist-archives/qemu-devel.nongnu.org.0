Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7146B0A42
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 15:01:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZuL8-0006CD-3J; Wed, 08 Mar 2023 09:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZuL5-0006Bg-43
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZuL3-00059v-DF
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 09:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678284015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GuYiNgcm28/bpZaMeH4ok28hRMXbeNsV/uE5Z3O9VTc=;
 b=RtdXjC+SkyMCK6FIDUBE5X3FiWiXEKztQwcU6OT6xTCN0i8dSefdrYZSr/aIvx/xl6S+hC
 QYJL93tFLyO12aQ4y4y5lzGbZrHuZEu5qopvaSa2s03tCR5ihyUhpHqxNe7zEiY+p9LEtF
 kIBCp/QKPOdHRQl+/6UmDTn+ABJV4RA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-qaqYCHOYP4e7pUGBQUznaw-1; Wed, 08 Mar 2023 09:00:13 -0500
X-MC-Unique: qaqYCHOYP4e7pUGBQUznaw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a056402350700b004d2a3d5cd3fso18693654edd.8
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 06:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678284011;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GuYiNgcm28/bpZaMeH4ok28hRMXbeNsV/uE5Z3O9VTc=;
 b=A1YaiBCtG7zaGmRmHC0zl9fNMfJao/4XyLJbGL7WzuhV90xiUYFfX4QR6KyajSpzY+
 kz8M6RXPWoxo5w8QYaqZznR50M4WU36D/78DaYdjNTBX888XsgU2g1F9nBeRw4bs7qWe
 H4Y+gP8e5QsCy/0tEImdSq3fkLFOFO2m44ZywjtphPDKx3d7D1uJIGPahI9ZXEbNrf46
 We64JdxVwRaWrjaO4XHajWr/w+bDk+XiiWS3ID0uFFRGDNn8A+dM9pa7qXfkUVkLSnPu
 CXbuatb3SpNyO413lTeL4GA9YJ7PO1FNfir2Z5ctP6ZjfWTh21awQInuTqjbXVfsA3Id
 NaKA==
X-Gm-Message-State: AO0yUKVYyD1xY3yOe1EkziQ2QWoNZ0M/s4vdFUV7QCRqRNGgVk6Sp7xd
 y01+8FWYpTy8oAR6BElzZdgb9j/vTa+pJDNygScfBKrv5LTCo2cjwY6hXJJaVd7nIyRDfsuTgqa
 0swdpIFZ6fAebEgeZqaEQDvDJ0E/eRgE=
X-Received: by 2002:a50:d5d6:0:b0:4af:70a5:5609 with SMTP id
 g22-20020a50d5d6000000b004af70a55609mr9753264edj.1.1678284011431; 
 Wed, 08 Mar 2023 06:00:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8m0TUVidxMG2bCsDcYxl4QZgL2UPnsvLJXr9L6yY7YNL4PJSKqNoC+rTTuLzMXj9jjAiOsAFIjUcfuDFpdLUU=
X-Received: by 2002:a50:d5d6:0:b0:4af:70a5:5609 with SMTP id
 g22-20020a50d5d6000000b004af70a55609mr9753255edj.1.1678284011219; Wed, 08 Mar
 2023 06:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20230307145825.2544850-1-marcandre.lureau@redhat.com>
 <877cvrxs81.fsf@pond.sub.org>
In-Reply-To: <877cvrxs81.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Mar 2023 17:59:59 +0400
Message-ID: <CAMxuvawh0vwZrjnqiMs9atGpXVst5ew6FjBpcEWhsanJDHCUwA@mail.gmail.com>
Subject: Re: [PATCH v3] qapi: give available enum values as error hint
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="00000000000052484b05f663f27c"
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

--00000000000052484b05f663f27c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Mar 8, 2023 at 5:55=E2=80=AFPM Markus Armbruster <armbru@redhat.com=
> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This allows for a more pleasant user experience.
> >
> > Before:
> > $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> > qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does no=
t
> accept value ''
> >
> > After:
> > $ ./qemu-system-x86_64 -display egl-headless,gl=3D
> > qemu-system-x86_64: -display egl-headless,gl=3D: Parameter 'gl' does no=
t
> accept value ''
> > Acceptable values are 'off', 'on', 'core', 'es'
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Nice improvement here.
>
> Slightly ugly:
>
>     $ qemu-system-x86_64 -nic bad
>     upstream-qemu: -nic bad: Parameter 'type' does not accept value 'bad'
>     Acceptable values are 'none', 'nic', 'user', 'tap', 'l2tpv3',
> 'socket', 'stream', 'dgram', 'vde', 'bridge', 'hubport', 'netmap',
> 'vhost-user', 'vhost-vdpa'
>
> Outright annoying:
>
> $ upstream-qemu -object bad
> upstream-qemu: -object bad: Parameter 'qom-type' does not accept value
> 'bad'
> Acceptable values are 'authz-list', 'authz-listfile', 'authz-pam',
> 'authz-simple', 'can-bus', 'can-host-socketcan', 'colo-compare',
> 'cryptodev-backend', 'cryptodev-backend-builtin', 'cryptodev-backend-lkcf=
',
> 'dbus-vmstate', 'filter-buffer', 'filter-dump', 'filter-mirror',
> 'filter-redirector', 'filter-replay', 'filter-rewriter', 'input-barrier',
> 'input-linux', 'iothread', 'main-loop', 'memory-backend-epc',
> 'memory-backend-file', 'memory-backend-memfd', 'memory-backend-ram',
> 'pef-guest', 'pr-manager-helper', 'qtest', 'rng-builtin', 'rng-egd',
> 'rng-random', 'secret', 'secret_keyring', 'sev-guest', 'thread-context',
> 's390-pv-guest', 'throttle-group', 'tls-creds-anon', 'tls-creds-psk',
> 'tls-creds-x509', 'tls-cipher-suites', 'x-remote-object',
> 'x-vfio-user-server'
>
> Note we already let users ask for this information with -object help or
> -object qom-type=3Dhelp.  Sadly, we can't hint at that here, because it's
> implemented much further up the call chain, and other call chains don't.
>
> If HMP command sendkey didn't bypass the input visitor, the 26 screen
> lines of hint for QKeyCode would likely scroll the error message off the
> screen.
>
> Should we suppress this hint when it's too long to be useful?
>

I don't have strong opinions.. perhaps stop after first 5 with "..." ?
(Ideally, we would have shell completion scripts that would be able to help
us, but hey that's another level! :)

--00000000000052484b05f663f27c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 8, 2023 at 5:55=E2=80=
=AFPM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">mar=
candre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; This allows for a more pleasant user experience.<br>
&gt;<br>
&gt; Before:<br>
&gt; $ ./qemu-system-x86_64 -display egl-headless,gl=3D<br>
&gt; qemu-system-x86_64: -display egl-headless,gl=3D: Parameter &#39;gl&#39=
; does not accept value &#39;&#39;<br>
&gt;<br>
&gt; After:<br>
&gt; $ ./qemu-system-x86_64 -display egl-headless,gl=3D<br>
&gt; qemu-system-x86_64: -display egl-headless,gl=3D: Parameter &#39;gl&#39=
; does not accept value &#39;&#39;<br>
&gt; Acceptable values are &#39;off&#39;, &#39;on&#39;, &#39;core&#39;, &#3=
9;es&#39;<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
Nice improvement here.<br>
<br>
Slightly ugly:<br>
<br>
=C2=A0 =C2=A0 $ qemu-system-x86_64 -nic bad<br>
=C2=A0 =C2=A0 upstream-qemu: -nic bad: Parameter &#39;type&#39; does not ac=
cept value &#39;bad&#39;<br>
=C2=A0 =C2=A0 Acceptable values are &#39;none&#39;, &#39;nic&#39;, &#39;use=
r&#39;, &#39;tap&#39;, &#39;l2tpv3&#39;, &#39;socket&#39;, &#39;stream&#39;=
, &#39;dgram&#39;, &#39;vde&#39;, &#39;bridge&#39;, &#39;hubport&#39;, &#39=
;netmap&#39;, &#39;vhost-user&#39;, &#39;vhost-vdpa&#39;<br>
<br>
Outright annoying:<br>
<br>
$ upstream-qemu -object bad<br>
upstream-qemu: -object bad: Parameter &#39;qom-type&#39; does not accept va=
lue &#39;bad&#39;<br>
Acceptable values are &#39;authz-list&#39;, &#39;authz-listfile&#39;, &#39;=
authz-pam&#39;, &#39;authz-simple&#39;, &#39;can-bus&#39;, &#39;can-host-so=
cketcan&#39;, &#39;colo-compare&#39;, &#39;cryptodev-backend&#39;, &#39;cry=
ptodev-backend-builtin&#39;, &#39;cryptodev-backend-lkcf&#39;, &#39;dbus-vm=
state&#39;, &#39;filter-buffer&#39;, &#39;filter-dump&#39;, &#39;filter-mir=
ror&#39;, &#39;filter-redirector&#39;, &#39;filter-replay&#39;, &#39;filter=
-rewriter&#39;, &#39;input-barrier&#39;, &#39;input-linux&#39;, &#39;iothre=
ad&#39;, &#39;main-loop&#39;, &#39;memory-backend-epc&#39;, &#39;memory-bac=
kend-file&#39;, &#39;memory-backend-memfd&#39;, &#39;memory-backend-ram&#39=
;, &#39;pef-guest&#39;, &#39;pr-manager-helper&#39;, &#39;qtest&#39;, &#39;=
rng-builtin&#39;, &#39;rng-egd&#39;, &#39;rng-random&#39;, &#39;secret&#39;=
, &#39;secret_keyring&#39;, &#39;sev-guest&#39;, &#39;thread-context&#39;, =
&#39;s390-pv-guest&#39;, &#39;throttle-group&#39;, &#39;tls-creds-anon&#39;=
, &#39;tls-creds-psk&#39;, &#39;tls-creds-x509&#39;, &#39;tls-cipher-suites=
&#39;, &#39;x-remote-object&#39;, &#39;x-vfio-user-server&#39;<br>
<br>
Note we already let users ask for this information with -object help or<br>
-object qom-type=3Dhelp.=C2=A0 Sadly, we can&#39;t hint at that here, becau=
se it&#39;s<br>
implemented much further up the call chain, and other call chains don&#39;t=
.<br>
<br>
If HMP command sendkey didn&#39;t bypass the input visitor, the 26 screen<b=
r>
lines of hint for QKeyCode would likely scroll the error message off the<br=
>
screen.<br>
<br>
Should we suppress this hint when it&#39;s too long to be useful?<br></bloc=
kquote><div><br></div><div>I don&#39;t have strong opinions.. perhaps stop =
after first 5 with &quot;...&quot; ? (Ideally, we would have shell completi=
on scripts that would be able to help us, but hey that&#39;s another level!=
 :)<br></div></div></div>

--00000000000052484b05f663f27c--


