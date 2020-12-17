Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC52DD0B8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:48:26 +0100 (CET)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprlh-0001f5-RC
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:48:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprfc-0003tD-8x
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:42:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kprfZ-0008Sp-OL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608205325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=35MEgoCGEXEBgarujpqv4YXJI/R+hsr0zoaJuzaBByo=;
 b=RqKEAuP748ezKO/Jqb6RC0jwKDYaxYcJOaACyaaGcEVdwuDYeSMBRnDQul24KvkY+aotQn
 NPYNFHUAOszECjYSv/Pa/7MLvObJ1CKUs65u2wtkYY2o3/nLSf5xjpWJTcAipnRyq54jQ9
 iPOOBsvsWUmoQ5GP+TTSM0y6zkYRsTU=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-0XgSzFZIMyax2QvTJKGIZA-1; Thu, 17 Dec 2020 06:42:02 -0500
X-MC-Unique: 0XgSzFZIMyax2QvTJKGIZA-1
Received: by mail-io1-f69.google.com with SMTP id m9so26975807ioa.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 03:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=35MEgoCGEXEBgarujpqv4YXJI/R+hsr0zoaJuzaBByo=;
 b=t0sUdS6uJ5ku+lsyQZZkqagfJ8h2q/K2grfL1yDANI8woxmQLLAyndU+ddppXjABEW
 pxuMQ06jpEhf73695VVNswo5GywEdZngKgjSRp+X2z7em1WbZ/hP4L6mO2kDVzbOL8hu
 duRgnN8MCYzZp2k7FaBDJKKxvusrLznH6kAJ3uKiXxkLORVhKo/9moYoLdHSGnvtBuuR
 VAg1kRAxSI5fHejy7/aVoAGuldpKSou68G8PHRVp7EakyH1eqfHXLzXdGSSp2cVaMr/S
 5kzyiQEOGA+atGVWrmB2EO73sWWi4i7HXGmzM6sc9RtEMmBXcOGiO4hwuQtx6mD1eQ0Z
 AH+g==
X-Gm-Message-State: AOAM533XaDsKPR08WDjaYx8mrZrYKkiC1YuAYYlk3zARgbmHSV6hG0mb
 UTPdevmFOFv6uVwCtMz+BmOFAg6fOOfKW8zx1kTM0fTDmWw9X5s29y3yHkYHfXXzNjfis9zrbhD
 6AWtPlfmpE9wTS79ysxfjOq0RrevfQWo=
X-Received: by 2002:a05:6e02:cb:: with SMTP id
 r11mr50491428ilq.11.1608205321527; 
 Thu, 17 Dec 2020 03:42:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbHS7of6SwTPT77OIAllpW6n2x7cJfDecdJSeQipfk+mEPawSPRlok2jdN6Ro560oJdJ+H4kncwJwvlUOkgRc=
X-Received: by 2002:a05:6e02:cb:: with SMTP id
 r11mr50491420ilq.11.1608205321375; 
 Thu, 17 Dec 2020 03:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20201217104417.436508-1-marcandre.lureau@redhat.com>
 <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
In-Reply-To: <5c6d244b-1ed3-f065-88b6-7a007a224cc4@suse.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 17 Dec 2020 15:41:50 +0400
Message-ID: <CAMxuvazEL7f6oXKse0qQWoZvS_n31JEKX5_HLRQ+9LHyMOh6yA@mail.gmail.com>
Subject: Re: [PATCH] build-sys: fix win32 compilation with --target-list=''
To: Claudio Fontana <cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e8330205b6a77af9"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e8330205b6a77af9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 17, 2020 at 3:33 PM Claudio Fontana <cfontana@suse.de> wrote:

> On 12/17/20 11:44 AM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Fixes linking:
> > x86_64-w64-mingw32-gcc  -o tests/test-qapi-util.exe version.rc_version.=
o
> tests/test-qapi-util.exe.p/test-qapi-util.c.obj -Wl,--allow-shlib-undefin=
ed
> -Wl,--nxcompat -Wl,--no-seh -Wl,--dynamicbase -Wl,--warn-common -m64
> -fstack-protector-strong -Wl,--start-group libqemuutil.a -pthread
> -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -lgnutls -lwinmm -lm
> -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -lgthread-2.0 -lglib-2.0
> -lintl -lws2_32 -mconsole -lkernel32 -luser32 -lgdi32 -lwinspool -lshell3=
2
> -lole32 -loleaut32 -luuid -lcomdlg32 -ladvapi32 -Wl,--end-group
> >
> /usr/lib/gcc/x86_64-w64-mingw32/10.2.1/../../../../x86_64-w64-mingw32/bin=
/ld:
> libqemuutil.a(util_oslib-win32.c.obj): in function `qemu_try_set_nonblock=
':
> > /home/elmarco/src/qemu/buildw/../util/oslib-win32.c:224: undefined
> reference to `qemu_fd_register'
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  util/main-loop-stub.c | 26 ++++++++++++++++++++++++++
> >  util/meson.build      |  2 ++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 util/main-loop-stub.c
> >
> > diff --git a/util/main-loop-stub.c b/util/main-loop-stub.c
> > new file mode 100644
> > index 0000000000..b3e175ade5
> > --- /dev/null
> > +++ b/util/main-loop-stub.c
> > @@ -0,0 +1,26 @@
> > +/*
> > + * QEMU main loop stub impl
> > + *
> > + * Copyright (c) 2020 Red Hat, Inc.
> > + *
> > + * This library is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU Lesser General Public
> > + * License as published by the Free Software Foundation; either
> > + * version 2.1 of the License, or (at your option) any later version.
> > + *
> > + * This library is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > + * Lesser General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU Lesser General Public
> > + * License along with this library; if not, see <
> http://www.gnu.org/licenses/>.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +
> > +void qemu_fd_register(int fd)
> > +{
> > +}
> > diff --git a/util/meson.build b/util/meson.build
> > index f359af0d46..462b79a61a 100644
> > --- a/util/meson.build
> > +++ b/util/meson.build
> > @@ -79,4 +79,6 @@ if have_block
> >    util_ss.add(when: 'CONFIG_INOTIFY1', if_true:
> files('filemonitor-inotify.c'),
> >                                          if_false:
> files('filemonitor-stub.c'))
> >    util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
> > +else
> > +  util_ss.add(files('main-loop-stub.c'))
> >  endif
> >
>
> Is the root cause elsewhere though?
>
> I don't like stubs very much, because often they are introduced as the
> easy way out of a problem instead of doing the necessary refactoring,
> and they end up confusing the hell out of someone trying to understand
> what is actually used where, never mind trying to debug the linker errors=
.
>
> There is already an bunch of #ifndef _WIN32, #else , ... in
> util/main-loop.c (quite a bunch of them really),
> is that what actually needs reworking, and putting the pieces together in
> the build system in a way that makes sense?
>
>
I am not sure we can improve it so much.

qemu_fd_register() is called from qemu_set_nonblock() and net/slirp.c.

It is necessary for win32 util/main-loop.c.

Eventually, we could move qemu_fd_register() in its own unit, but then we
will probably need more stubs or configure knobs for the main-loop symbols.
I don't think it's worth, but maybe I am missing something and I should try
it.

--000000000000e8330205b6a77af9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 17, 2020 at 3:33 PM Cla=
udio Fontana &lt;<a href=3D"mailto:cfontana@suse.de">cfontana@suse.de</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/=
17/20 11:44 AM, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_b=
lank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Fixes linking:<br>
&gt; x86_64-w64-mingw32-gcc=C2=A0 -o tests/test-qapi-util.exe version.rc_ve=
rsion.o tests/test-qapi-util.exe.p/test-qapi-util.c.obj -Wl,--allow-shlib-u=
ndefined -Wl,--nxcompat -Wl,--no-seh -Wl,--dynamicbase -Wl,--warn-common -m=
64 -fstack-protector-strong -Wl,--start-group libqemuutil.a -pthread -L/usr=
/x86_64-w64-mingw32/sys-root/mingw/lib -lgnutls -lwinmm -lm -L/usr/x86_64-w=
64-mingw32/sys-root/mingw/lib -lgthread-2.0 -lglib-2.0 -lintl -lws2_32 -mco=
nsole -lkernel32 -luser32 -lgdi32 -lwinspool -lshell32 -lole32 -loleaut32 -=
luuid -lcomdlg32 -ladvapi32 -Wl,--end-group<br>
&gt; /usr/lib/gcc/x86_64-w64-mingw32/10.2.1/../../../../x86_64-w64-mingw32/=
bin/ld: libqemuutil.a(util_oslib-win32.c.obj): in function `qemu_try_set_no=
nblock&#39;:<br>
&gt; /home/elmarco/src/qemu/buildw/../util/oslib-win32.c:224: undefined ref=
erence to `qemu_fd_register&#39;<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 util/main-loop-stub.c | 26 ++++++++++++++++++++++++++<br>
&gt;=C2=A0 util/meson.build=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
&gt;=C2=A0 2 files changed, 28 insertions(+)<br>
&gt;=C2=A0 create mode 100644 util/main-loop-stub.c<br>
&gt; <br>
&gt; diff --git a/util/main-loop-stub.c b/util/main-loop-stub.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b3e175ade5<br>
&gt; --- /dev/null<br>
&gt; +++ b/util/main-loop-stub.c<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +/*<br>
&gt; + * QEMU main loop stub impl<br>
&gt; + *<br>
&gt; + * Copyright (c) 2020 Red Hat, Inc.<br>
&gt; + *<br>
&gt; + * This library is free software; you can redistribute it and/or<br>
&gt; + * modify it under the terms of the GNU Lesser General Public<br>
&gt; + * License as published by the Free Software Foundation; either<br>
&gt; + * version 2.1 of the License, or (at your option) any later version.=
<br>
&gt; + *<br>
&gt; + * This library is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
 GNU<br>
&gt; + * Lesser General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU Lesser General Public<b=
r>
&gt; + * License along with this library; if not, see &lt;<a href=3D"http:/=
/www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu=
.org/licenses/</a>&gt;.<br>
&gt; + *<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt; +<br>
&gt; +void qemu_fd_register(int fd)<br>
&gt; +{<br>
&gt; +}<br>
&gt; diff --git a/util/meson.build b/util/meson.build<br>
&gt; index f359af0d46..462b79a61a 100644<br>
&gt; --- a/util/meson.build<br>
&gt; +++ b/util/meson.build<br>
&gt; @@ -79,4 +79,6 @@ if have_block<br>
&gt;=C2=A0 =C2=A0 util_ss.add(when: &#39;CONFIG_INOTIFY1&#39;, if_true: fil=
es(&#39;filemonitor-inotify.c&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if_false: files(&#39;filemonitor-stub.c&#39;))<br>
&gt;=C2=A0 =C2=A0 util_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(=
&#39;vfio-helpers.c&#39;))<br>
&gt; +else<br>
&gt; +=C2=A0 util_ss.add(files(&#39;main-loop-stub.c&#39;))<br>
&gt;=C2=A0 endif<br>
&gt; <br>
<br>
Is the root cause elsewhere though?<br>
<br>
I don&#39;t like stubs very much, because often they are introduced as the =
easy way out of a problem instead of doing the necessary refactoring,<br>
and they end up confusing the hell out of someone trying to understand what=
 is actually used where, never mind trying to debug the linker errors.<br>
<br>
There is already an bunch of #ifndef _WIN32, #else , ... in util/main-loop.=
c (quite a bunch of them really),<br>
is that what actually needs reworking, and putting the pieces together in t=
he build system in a way that makes sense?<br>
<br></blockquote><div><br></div><div>I am not sure we can improve it so muc=
h.</div><div><br></div><div>qemu_fd_register() is called from qemu_set_nonb=
lock() and net/slirp.c.</div><div><br></div><div>It is necessary for win32 =
util/main-loop.c.</div><div><br></div><div>Eventually, we could move qemu_f=
d_register() in its own unit, but then we will probably need more stubs or =
configure knobs for the main-loop symbols. I don&#39;t think it&#39;s worth=
, but maybe I am missing something and I should try it.<br></div><div>=C2=
=A0</div></div></div>

--000000000000e8330205b6a77af9--


