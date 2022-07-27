Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74FB582794
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:23:51 +0200 (CEST)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGh0w-0000Gf-PM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGgvk-0004ZC-2J
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oGgvf-0000Kx-D1
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658927902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hn6Ns6YMQVXNJ1pgGxIrawhHlM2ZMm18ENzBEGQMsy8=;
 b=CxpbbQlJOgl9qg3kVrtnBc04a12+V96ZBdsL8D5LxLGLjiP9IbEFVFwW01wWA7AnpfqP9W
 tui++Thd+ekU8mzUHsz9B3/VL//E8FF7kLAMdXjzILLvUjTUj5e07JCRKzrg9wN4Vo5ISJ
 ujRbDek4Sb66IItrTwhDE+Us6dizthw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-mBo4gBd1O8erQPh5XnfdpA-1; Wed, 27 Jul 2022 09:18:20 -0400
X-MC-Unique: mBo4gBd1O8erQPh5XnfdpA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-31ea3f0e357so108679787b3.16
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hn6Ns6YMQVXNJ1pgGxIrawhHlM2ZMm18ENzBEGQMsy8=;
 b=GRBqq0R3MjuxoSy6Uam98Dd+VJqrHAF66cxUKy1xEu0HRBjaTVHffZUWsou7hnGRds
 FHKGtZSMkmfLExOY2Nvo2Nee6qwIgC/rXNfUAb/Ob+TxUiJ/0JLJuB77QBTJhRAGxIEu
 r7pdi/uiVUOyOFup2pfz2OT0IovySZSUxaCDMTPh7zYb8fmdecXR8BF7vAHPp2KuEW5J
 +46LqaoQFC0vKqVQnuvMVaWUMT0J/HDj9vPqnaWOMwtFk0fV7zYqHQUwh8ZXaDouha50
 C62h9EyvCEq712HzuBwRSMjLbNV4WH4LT0tJN1bswpFvL3dcV3p9R7GwlEcUUOvUDBkA
 Dt2A==
X-Gm-Message-State: AJIora/7prfELt6k/gyE/8b6ZeZZrdhxGTK1arPzWg09v/E4EzGuialP
 nl0hSO4uFqYqEsxvlhkuIQDHsZiF7Tmt1hKn9A8qZwdGpxMNxMMMzCEQZ8KP73WAhqqdGY5gQJx
 FvNV4dmCsTb327YpYeFtnBuEZ8yPWvOA=
X-Received: by 2002:a0d:d655:0:b0:31f:417c:2187 with SMTP id
 y82-20020a0dd655000000b0031f417c2187mr9391820ywd.385.1658927900250; 
 Wed, 27 Jul 2022 06:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uwZKAm5sbdchpOVqSXB/pZL6eC2//106ECC8hXDKrIBP0xxjTD5CyUkobrduDYymdAsKIs7pJCaYQiGEkVCg0=
X-Received: by 2002:a0d:d655:0:b0:31f:417c:2187 with SMTP id
 y82-20020a0dd655000000b0031f417c2187mr9391796ywd.385.1658927899979; Wed, 27
 Jul 2022 06:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
 <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
 <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
 <YuEMnI/Sji1/r7bk@redhat.com>
 <CAEUhbmVT6bwMObhW59Oxf6nfPazDziXYbuqxC=pLBEbd26r_NQ@mail.gmail.com>
In-Reply-To: <CAEUhbmVT6bwMObhW59Oxf6nfPazDziXYbuqxC=pLBEbd26r_NQ@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 27 Jul 2022 16:18:07 +0300
Message-ID: <CAPMcbCr_hS1apvgH8-mpguEps1Q0P7wtGp_u_fSZ6TxMFRvitQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Yan Vugenfirer <yvugenfi@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="0000000000002fcc3605e4c940f7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002fcc3605e4c940f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 2:58 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Wed, Jul 27, 2022 at 6:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> wrote:
> >
> > On Wed, Jul 27, 2022 at 05:38:27PM +0800, Bin Meng wrote:
> > > On Wed, Jul 27, 2022 at 4:50 PM Yan Vugenfirer <yvugenfi@redhat.com>
> wrote:
> > > >
> > > > On Wed, Jul 27, 2022 at 10:43 AM Bin Meng <bmeng.cn@gmail.com>
> wrote:
> > > > >
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > This adds a helper to get the Windows version via the RtlGetVersi=
on
> > > > > call, for QEMU codes to determine the Windows version at run-time=
.
> > > > >
> > > > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > ---
> > > > >
> > > > >  include/sysemu/os-win32.h |  2 ++
> > > > >  util/oslib-win32.c        | 15 +++++++++++++++
> > > > >  2 files changed, 17 insertions(+)
> > > > >
> > > > > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.=
h
> > > > > index edc3b38a57..1e324026a4 100644
> > > > > --- a/include/sysemu/os-win32.h
> > > > > +++ b/include/sysemu/os-win32.h
> > > > > @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf,
> size_t len, int flags);
> > > > >  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, in=
t
> flags,
> > > > >                             struct sockaddr *addr, socklen_t
> *addrlen);
> > > > >
> > > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
> > > > > +
> > > > >  #ifdef __cplusplus
> > > > >  }
> > > > >  #endif
> > > > > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > > > > index 5723d3eb4c..6d2387b9ff 100644
> > > > > --- a/util/oslib-win32.c
> > > > > +++ b/util/oslib-win32.c
> > > > > @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, in=
t
> fd)
> > > > >       */
> > > > >      return qemu_fdatasync(fd);
> > > > >  }
> > > > > +
> > > > > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
> > > > > +{
> > > > > +    typedef LONG (WINAPI
> *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW);
> > > > > +
> > > > > +    /* RtlGetVersion is available starting with Windows 2000 */
> > > > > +    HMODULE module =3D GetModuleHandle("ntdll");
> > > > > +    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> > > > > +    rtl_get_version_t rtl_get_version =3D (rtl_get_version_t)fun=
;
> > > > > +
> > > > > +    info->dwOSVersionInfoSize =3D sizeof(RTL_OSVERSIONINFOEXW);
> > > > > +    rtl_get_version(info);
> > > > The original function, when it was present in qemu-ga, tested that
> > > > getting the function address succeeded.
> > > > I think this test should be kept.
> > > > See below:
> > > > -    PVOID fun =3D GetProcAddress(module, "RtlGetVersion");
> > > > -    if (fun =3D=3D NULL) {
> > > > -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
> > > > -            "Failed to get address of RtlGetVersion");
> > > > -        return;
> > > > -    }
> > > >
> > >
> > > Please see the comment:
> > >
> > > /* RtlGetVersion is available starting with Windows 2000 */
> > >
> > > I don't think we need that check.
> >
> > In include/qemu/osdep.h we have
> >
> > /* as defined in sdkddkver.h */
> > #ifndef _WIN32_WINNT
> > #define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with
> glib) */
> > #endif
> >
> > so do we even need to have the GetProcAddress calls at all ?
> >
> > Surely we can just  '#include <ddk/ntddk.h>' and call
> > RtlGetVersion directly at compile time ?
> >
>
> I believe #include <ddk/ntddk.h> is used in the kernel mode driver
> programming environment.
> In the user space we will have to use the ntdll exported symbol.
>
> I cannot locate a Microsoft doc that tells us to call RtlGetVersion
> directly in the user space.
>

From MS docs: RtlGetVersion is the kernel-mode equivalent of the user-mode
GetVersionEx function in the Windows SDK.
So you can use GetVersionEx instread.


>
> Regards,
> Bin
>
>

--0000000000002fcc3605e4c940f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 2:58 PM Bin M=
eng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jul=
 27, 2022 at 6:00 PM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange=
@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Jul 27, 2022 at 05:38:27PM +0800, Bin Meng wrote:<br>
&gt; &gt; On Wed, Jul 27, 2022 at 4:50 PM Yan Vugenfirer &lt;<a href=3D"mai=
lto:yvugenfi@redhat.com" target=3D"_blank">yvugenfi@redhat.com</a>&gt; wrot=
e:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Jul 27, 2022 at 10:43 AM Bin Meng &lt;<a href=3D"mai=
lto:bmeng.cn@gmail.com" target=3D"_blank">bmeng.cn@gmail.com</a>&gt; wrote:=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; From: Bin Meng &lt;<a href=3D"mailto:bin.meng@windriver=
.com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This adds a helper to get the Windows version via the R=
tlGetVersion<br>
&gt; &gt; &gt; &gt; call, for QEMU codes to determine the Windows version a=
t run-time.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Xuzhou Cheng &lt;<a href=3D"mailto:xuzho=
u.cheng@windriver.com" target=3D"_blank">xuzhou.cheng@windriver.com</a>&gt;=
<br>
&gt; &gt; &gt; &gt; Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@=
windriver.com" target=3D"_blank">bin.meng@windriver.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 include/sysemu/os-win32.h |=C2=A0 2 ++<br>
&gt; &gt; &gt; &gt;=C2=A0 util/oslib-win32.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
5 +++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 2 files changed, 17 insertions(+)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/include/sysemu/os-win32.h b/include/sysemu=
/os-win32.h<br>
&gt; &gt; &gt; &gt; index edc3b38a57..1e324026a4 100644<br>
&gt; &gt; &gt; &gt; --- a/include/sysemu/os-win32.h<br>
&gt; &gt; &gt; &gt; +++ b/include/sysemu/os-win32.h<br>
&gt; &gt; &gt; &gt; @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, =
void *buf, size_t len, int flags);<br>
&gt; &gt; &gt; &gt;=C2=A0 ssize_t qemu_recvfrom_wrap(int sockfd, void *buf,=
 size_t len, int flags,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct sockaddr *addr, sock=
len_t *addrlen);<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);<b=
r>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 #ifdef __cplusplus<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;=C2=A0 #endif<br>
&gt; &gt; &gt; &gt; diff --git a/util/oslib-win32.c b/util/oslib-win32.c<br=
>
&gt; &gt; &gt; &gt; index 5723d3eb4c..6d2387b9ff 100644<br>
&gt; &gt; &gt; &gt; --- a/util/oslib-win32.c<br>
&gt; &gt; &gt; &gt; +++ b/util/oslib-win32.c<br>
&gt; &gt; &gt; &gt; @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t =
length, int fd)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return qemu_fdatasync(fd);<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)<br=
>
&gt; &gt; &gt; &gt; +{<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 typedef LONG (WINAPI *rtl_get_version_t)=
(PRTL_OSVERSIONINFOEXW);<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 /* RtlGetVersion is available starting w=
ith Windows 2000 */<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 HMODULE module =3D GetModuleHandle(&quot=
;ntdll&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 PVOID fun =3D GetProcAddress(module, &qu=
ot;RtlGetVersion&quot;);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 rtl_get_version_t rtl_get_version =3D (r=
tl_get_version_t)fun;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 info-&gt;dwOSVersionInfoSize =3D sizeof(=
RTL_OSVERSIONINFOEXW);<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 rtl_get_version(info);<br>
&gt; &gt; &gt; The original function, when it was present in qemu-ga, teste=
d that<br>
&gt; &gt; &gt; getting the function address succeeded.<br>
&gt; &gt; &gt; I think this test should be kept.<br>
&gt; &gt; &gt; See below:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 PVOID fun =3D GetProcAddress(module, &quot;Rt=
lGetVersion&quot;);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 if (fun =3D=3D NULL) {<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, QERR_QGA_COMMA=
ND_FAILED,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to g=
et address of RtlGetVersion&quot;);<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Please see the comment:<br>
&gt; &gt;<br>
&gt; &gt; /* RtlGetVersion is available starting with Windows 2000 */<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think we need that check.<br>
&gt;<br>
&gt; In include/qemu/osdep.h we have<br>
&gt;<br>
&gt; /* as defined in sdkddkver.h */<br>
&gt; #ifndef _WIN32_WINNT<br>
&gt; #define _WIN32_WINNT 0x0601 /* Windows 7 API (should be in sync with g=
lib) */<br>
&gt; #endif<br>
&gt;<br>
&gt; so do we even need to have the GetProcAddress calls at all ?<br>
&gt;<br>
&gt; Surely we can just=C2=A0 &#39;#include &lt;ddk/ntddk.h&gt;&#39; and ca=
ll<br>
&gt; RtlGetVersion directly at compile time ?<br>
&gt;<br>
<br>
I believe #include &lt;ddk/ntddk.h&gt; is used in the kernel mode driver<br=
>
programming environment.<br>
In the user space we will have to use the ntdll exported symbol.<br>
<br>
I cannot locate a Microsoft doc that tells us to call RtlGetVersion<br>
directly in the user space.<br></blockquote><div><br></div><div>From MS doc=
s: RtlGetVersion is the kernel-mode equivalent of the user-mode GetVersionE=
x function in the Windows SDK. <br></div><div>So you can use GetVersionEx i=
nstread.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Regards,<br>
Bin<br>
<br>
</blockquote></div></div>

--0000000000002fcc3605e4c940f7--


