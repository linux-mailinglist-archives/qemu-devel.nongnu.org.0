Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D937381F2E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:00:02 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHJJ-0007z4-0N
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1liGLS-00085U-FQ
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:58:10 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kenta@lithdew.net>) id 1liGLQ-0004MI-2D
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:58:10 -0400
Received: by mail-vs1-xe34.google.com with SMTP id o192so1794132vsd.7
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lithdew-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ifyi6HTBvBxrmElLxlfoUzK6bVdYCAE7BBef6VbPxOI=;
 b=WdWFQIJafNzzR+BNMd4Rynv1Dye3FSv7i4o+8RKwdZOEaswhSWCDExMzMg5K664DH+
 o0VbLsl/4+C8yO5EdgxiTOon+Aa6GaTRyQ+zHUtm0nYEUnVCqm5kSD6WQpB1CSQPz/5r
 uXFOjrqRfZecWsPjCwdQ6mcV3OORON5bxJ26TH/uZtkXYKhlXEk+AtOech6AOXx6f/ZB
 juKe5RNfjWoMfAIjN0NcNV9Q3Isc3KkjZ85Ndd2DZNUWU79sGD+ryEH3zO1yDxGmxq6/
 lufRRtVVjd+amK/0Cc5HSIO8FwND219YxQSycKplh1p5vSUJmkfPhJkDN2GeaL6neX8V
 8Pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ifyi6HTBvBxrmElLxlfoUzK6bVdYCAE7BBef6VbPxOI=;
 b=oC4gdVoYa1jVha81++U24qd44a+NWBbc3GaGN8xfF/Fm7Tcx9vB/o4t6m/nQXemOBc
 dx+NuY56rWIZ0xB76ANo8ZH6fGaxVQdQAqXKBazQLKgkobe4+75uN4owRjIFWLm2y/Wa
 0SqDGRMzXhSVow9aB2boUh1OLDeTszcg4EMODl3xYaSF0cFJPjK/yitUpWTlyjr01HqO
 Wi1xocvQqUh0JMGSJlf39QLDwkLh6AzkrQabhaHDh9ts8r0ZGJKPGixVV3qAJR9L0esi
 vFRgASBnXnCSKXbY919yx7be3Losw8TjT9I94TPbvvanZVHOtzcFckRRF/sSHz68VefU
 p/Hw==
X-Gm-Message-State: AOAM5321JjSITg6smlLL9ONxRNo3YZAfv4ef5ews8P+7smY8fRpBPRxw
 ZufCQivPIZYFRkZ5mObk5n83UTen4+qC9g8FDqE1GUD2NTJYcXeP5lQ=
X-Google-Smtp-Source: ABdhPJyrKdPg08ObZcX8UV7C2uq/b97d4wJVj9zhim4MI4uLIA0aMvO2apiojGFG2dDGIc9NbLKxHoeA9Wum+lwR+wY=
X-Received: by 2002:a67:64c5:: with SMTP id y188mr46334028vsb.19.1621169886835; 
 Sun, 16 May 2021 05:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210516091536.1042693-1-kenta@lithdew.net>
 <aee50099-14a8-1c6b-6142-a4363f75812d@vivier.eu>
In-Reply-To: <aee50099-14a8-1c6b-6142-a4363f75812d@vivier.eu>
From: Kenta Iwasaki <kenta@lithdew.net>
Date: Sun, 16 May 2021 21:57:55 +0900
Message-ID: <CAO4V76-aCeNq8OpTptSxywj+pV22EHNF-osWtR3onWMvGSSX+Q@mail.gmail.com>
Subject: Re: [PATCH] linux-user/syscall: zero-init msghdr in
 do_sendrecvmsg_locked
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000039c81705c27207c9"
Received-SPF: none client-ip=2607:f8b0:4864:20::e34;
 envelope-from=kenta@lithdew.net; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 May 2021 09:58:24 -0400
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000039c81705c27207c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure,

The bytes of `msghdr` need to be cleared because the `msghdr` struct layout
specified in QEMU appears to generalize between the definitions of `msghdr`
across different libc's and kernels. To appropriately generalize `msghdr`
across libc's and kernels would either:

1. require specializing code in do_sendrecvmsg_locked() for each individual
libc and kernel version, or
2. zeroing out all bytes of `msghdr`, b/c certain libc or kernel versions
may misinterpret the undefined padding bytes that come from misalignment in
the struct as actual syscall params.

The patch I provided would be going for route #2, given that it's a simpler
fix for the underlying problem for the short term.

What I believe is the background behind why the struct layout has been a
problem is because, since the beginning, the Linux kernel has always
specified the layout of `msghdr` differently from POSIX. Given that this
implies incompatibility between kernels on how `msghdr` is specified,
different libc projects such as musl and glibc provide different
workarounds by laying out `msghdr` differently amongst one another.

A few projects running tests/applications through QEMU have been bitten by
this, and a solution that one of the projects discovered was that patching
QEMU to zero-initialize the bytes msghdr the same way my patch does allow
for compatibility between different `msghdr` layouts across glibc, musl,
and the Linux kernel:
https://github.com/void-linux/void-packages/issues/23557#issuecomment-71839=
2360

For some additional useful context, here's a link pointing changes musl
libc made to laying out `msghdr` b/c of Linux incorrectly laying out
`msghdr` against the POSIX standard:
http://git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e3b=
39fbb021c5a64

Also, here is a link to the `msghdr` struct layout in musl libc's bleeding
edge branch as of now:
https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22

As for my rationale for sending in this patch, it is because I'm currently
implementing cross-platform networking in the standard library for the Zig
programming language, and have run into this exact same problem with
EMSGSIZE being returned by sendmsg() when tests are run through QEMU on
x86_64-linux-musl.

My discussions with the Zig community about it alongside debug logs
regarding the exact parameters being fed to the sendmsg() syscall can be
found here: https://github.com/ziglang/zig/pull/8750#issuecomment-841641576

Hope this gives enough context about the problem and patch, but please do
let me know if there is any more information that I could provide which
would help.

Best regards,
Kenta Iwasaki


On Sun, 16 May 2021 at 19:53, Laurent Vivier <laurent@vivier.eu> wrote:

> Le 16/05/2021 =C3=A0 11:15, Kenta Iwasaki a =C3=A9crit :
> > The mixing of libc and kernel versions of the layout of the `msghdr`
> > struct causes EMSGSIZE to be returned by sendmsg if the `msghdr` struct
> > is not zero-initialized (such that padding bytes comprise of
> > uninitialized memory).
> >
> > Other parts of the QEMU codebase appear to zero-initialize the `msghdr`
> > struct to workaround these struct layout issues, except for
> > do_sendrecvmsg_locked in linux-user/syscall.c.
> >
> > This patch zero-initializes the `msghdr` struct in
> > do_sendrecvmsg_locked.
> >
> > Signed-off-by: Kenta Iwasaki <kenta@lithdew.net>
> > ---
> >  linux-user/syscall.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 95d79ddc43..f60b7e04d5 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -3337,7 +3337,7 @@ static abi_long do_sendrecvmsg_locked(int fd,
> struct target_msghdr *msgp,
> >                                        int flags, int send)
> >  {
> >      abi_long ret, len;
> > -    struct msghdr msg;
> > +    struct msghdr msg =3D { 0 };
> >      abi_ulong count;
> >      struct iovec *vec;
> >      abi_ulong target_vec;
> >
>
> It seems do_sendrecvmsg_locked() initializes all the fields of the
> structure, I don't see why we
> need to clear it before use.
>
> Could you explain more?
>
> Thanks,
> Laurent
>

--00000000000039c81705c27207c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure,<div><br></div><div>The bytes of `msghdr` need to be =
cleared because the `msghdr` struct layout specified in QEMU appears to gen=
eralize between the definitions of `msghdr` across different libc&#39;s and=
 kernels. To appropriately=C2=A0generalize `msghdr` across libc&#39;s and k=
ernels would either:</div><div><br></div><div>1. require specializing code =
in do_sendrecvmsg_locked() for each individual libc and kernel version, or<=
/div><div>2. zeroing out all bytes of `msghdr`, b/c certain libc or kernel =
versions may misinterpret the undefined padding bytes that come from misali=
gnment in the struct as actual syscall params.</div><div><br></div><div>The=
 patch I provided would be going for route #2, given that it&#39;s a simple=
r fix for the underlying problem for the short term.</div><div><br></div><d=
iv>What I believe is the background behind why the struct layout has been a=
 problem is because, since the beginning, the Linux kernel has always speci=
fied the layout of `msghdr` differently from POSIX. Given that this implies=
 incompatibility between kernels on how `msghdr` is specified, different li=
bc projects such as musl and glibc provide different workarounds by laying =
out `msghdr` differently amongst one another.</div><div><br></div><div><div=
>A few projects running tests/applications through QEMU have been bitten by=
 this, and a solution that one of the projects discovered was that patching=
 QEMU to zero-initialize the bytes msghdr the same way my patch does allow =
for compatibility between different `msghdr` layouts across glibc, musl, an=
d the Linux kernel: <a href=3D"https://github.com/void-linux/void-packages/=
issues/23557#issuecomment-718392360">https://github.com/void-linux/void-pac=
kages/issues/23557#issuecomment-718392360</a></div><div></div></div><div><b=
r></div><div>For some additional useful context, here&#39;s a link pointing=
 changes musl libc made to laying out `msghdr` b/c of Linux incorrectly lay=
ing out `msghdr` against the POSIX standard: <a href=3D"http://git.musl-lib=
c.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e3b39fbb021c5a64">http=
://git.musl-libc.org/cgit/musl/commit/?id=3D7168790763cdeb794df52be6e3b39fb=
b021c5a64</a></div><div><br></div><div>Also, here is a link to the `msghdr`=
 struct layout in musl libc&#39;s bleeding edge branch as of now:=C2=A0<a h=
ref=3D"https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22">h=
ttps://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n22</a></div><=
div><br></div><div>As for my rationale for sending in this patch, it is bec=
ause I&#39;m currently implementing cross-platform networking in the standa=
rd library for the Zig programming language, and have run into this exact s=
ame problem with EMSGSIZE being returned by sendmsg() when tests are run th=
rough QEMU on x86_64-linux-musl.</div><div><br></div><div>My discussions wi=
th the Zig community about it alongside debug logs regarding the exact para=
meters being fed to the sendmsg() syscall can be found here:=C2=A0<a href=
=3D"https://github.com/ziglang/zig/pull/8750#issuecomment-841641576">https:=
//github.com/ziglang/zig/pull/8750#issuecomment-841641576</a></div><div><br=
></div><div>Hope this gives enough context about the problem and patch, but=
 please do let me know if there is any more information that I could provid=
e which would help.</div><div><br></div><div>Best regards,</div><div>Kenta =
Iwasaki</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, 16 May 2021 at 19:53, Laurent Vivier =
&lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 16/05/2021 =C3=
=A0 11:15, Kenta Iwasaki a =C3=A9crit=C2=A0:<br>
&gt; The mixing of libc and kernel versions of the layout of the `msghdr`<b=
r>
&gt; struct causes EMSGSIZE to be returned by sendmsg if the `msghdr` struc=
t<br>
&gt; is not zero-initialized (such that padding bytes comprise of<br>
&gt; uninitialized memory).<br>
&gt; <br>
&gt; Other parts of the QEMU codebase appear to zero-initialize the `msghdr=
`<br>
&gt; struct to workaround these struct layout issues, except for<br>
&gt; do_sendrecvmsg_locked in linux-user/syscall.c.<br>
&gt; <br>
&gt; This patch zero-initializes the `msghdr` struct in<br>
&gt; do_sendrecvmsg_locked.<br>
&gt; <br>
&gt; Signed-off-by: Kenta Iwasaki &lt;<a href=3D"mailto:kenta@lithdew.net" =
target=3D"_blank">kenta@lithdew.net</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/syscall.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
&gt; index 95d79ddc43..f60b7e04d5 100644<br>
&gt; --- a/linux-user/syscall.c<br>
&gt; +++ b/linux-user/syscall.c<br>
&gt; @@ -3337,7 +3337,7 @@ static abi_long do_sendrecvmsg_locked(int fd, st=
ruct target_msghdr *msgp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int f=
lags, int send)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 abi_long ret, len;<br>
&gt; -=C2=A0 =C2=A0 struct msghdr msg;<br>
&gt; +=C2=A0 =C2=A0 struct msghdr msg =3D { 0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 abi_ulong count;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct iovec *vec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 abi_ulong target_vec;<br>
&gt; <br>
<br>
It seems do_sendrecvmsg_locked() initializes all the fields of the structur=
e, I don&#39;t see why we<br>
need to clear it before use.<br>
<br>
Could you explain more?<br>
<br>
Thanks,<br>
Laurent<br>
</blockquote></div>

--00000000000039c81705c27207c9--

