Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D35FB329
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:17:58 +0200 (CEST)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiF8v-0007nO-61
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oiDvE-0003ga-JP
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:59:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oiDv8-0001kK-HN
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665489574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JSnNY3G0vdAXeoyDXzDef85QUislhBw0H0GwiRkSw8E=;
 b=Bi5Lscl9PfxjpoZ6odf8d63958fkXDR99oMKH+s2BRg0zUIaquikcP/pcUm6PznrjSCaJj
 W7NcJ/OEoDcLQoqevIYo3mNGV+5uAbHHJoOnkprwWEGhJVuFMhE3rCHZtcJLuoGu5V4RWF
 IUwURhs7TPGH0DADyTcWLG89Y5DYjmA=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-QBJS-nAqPLumpMtRoIaR0A-1; Tue, 11 Oct 2022 07:59:32 -0400
X-MC-Unique: QBJS-nAqPLumpMtRoIaR0A-1
Received: by mail-oo1-f69.google.com with SMTP id
 z3-20020a4a6543000000b004805f23e3b1so4136807oog.12
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 04:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JSnNY3G0vdAXeoyDXzDef85QUislhBw0H0GwiRkSw8E=;
 b=axX18oFerk0p03r3DHOMA1lrLrD49Hrb0kwvsKeyigMrSlXGou2t0OHPO053I8qQ2Y
 tS50R/MNTjQ8riDGPnGOmccMWmyqdcGpa3O6NQtR3uDW3HiuF9OJ7iYwP9ccgsueq8OG
 Y8qcsPLm0X+ijAjTHWRyvuxFLDirBlXx/iQilnB4UXy+e7+8ArmaosEglbskpXq4qHE6
 WIB0lNtQZiqvXfmx5G7/zYDWNq543r87aWEKyBRcoMCCtC9b0E+pjHr5kDB1hjL7AJUD
 59azfeUzJpA5iEVsOE5eMmt8dF5OC5SG3O6aciMt+6lLD8VW1Oe4uD+9lUzAGbjCc20R
 6uKA==
X-Gm-Message-State: ACrzQf3yMc4WhUbQycKnK6xs2OtECBb9Z8+WiszlAfswZn8tV5mWMzD5
 Hx2xxIkoP6T6EflyaaIfeSMKctHp6omT52NYDpAgHAPJVB2x4b5VB7wIOFHH1DxmsHNRoiI55mD
 5dmi/lcv4GC/EB3kQvDY3FPLmDy1kUgI=
X-Received: by 2002:a05:6830:4a6:b0:661:8587:7000 with SMTP id
 l6-20020a05683004a600b0066185877000mr8679893otd.378.1665489572265; 
 Tue, 11 Oct 2022 04:59:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5P67UcyqiQlqOQkPROf/rXbH0gx49X10G16WzHjo3Ow3jzFFysQHnf9IruVjmNQOFWd881EMVidDkriEg/NsQ=
X-Received: by 2002:a05:6830:4a6:b0:661:8587:7000 with SMTP id
 l6-20020a05683004a600b0066185877000mr8679884otd.378.1665489572061; Tue, 11
 Oct 2022 04:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221011090835.3534934-1-marcandre.lureau@redhat.com>
 <CAEUhbmWNkLbt7ik2REQ4w+2FRCAr9NwFm+aGw85LHAzbQ9-n6Q@mail.gmail.com>
In-Reply-To: <CAEUhbmWNkLbt7ik2REQ4w+2FRCAr9NwFm+aGw85LHAzbQ9-n6Q@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 11 Oct 2022 15:59:20 +0400
Message-ID: <CAMxuvayCds1Mzf64JCSawkZADcBrMw4z=2KD8MnQzu-+iq5guQ@mail.gmail.com>
Subject: Re: [PATCH v4] win32: set threads name
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, 
 richard.henderson@linaro.org, Stefan Weil <sw@weilnetz.de>
Content-Type: multipart/alternative; boundary="00000000000051f72905eac10230"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000051f72905eac10230
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Oct 11, 2022 at 2:33 PM Bin Meng <bmeng.cn@gmail.com> wrote:

> On Tue, Oct 11, 2022 at 5:29 PM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > As described in:
> >
> https://learn.microsoft.com/en-us/visualstudio/debugger/how-to-set-a-thre=
ad-name-in-native-code?view=3Dvs-2022
> >
> > SetThreadDescription() is available since Windows 10, version 1607 and
> > in some versions only by "Run Time Dynamic Linking". Its declaration is
> > not yet in mingw, so we lookup the function the same way glib does.
> >
> > Tested with Visual Studio Community 2022 debugger.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Acked-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  util/qemu-thread-win32.c | 55 ++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 53 insertions(+), 2 deletions(-)
> >
> > diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c
> > index a2d5a6e825..b20bfa9c1f 100644
> > --- a/util/qemu-thread-win32.c
> > +++ b/util/qemu-thread-win32.c
> > @@ -19,12 +19,39 @@
> >
> >  static bool name_threads;
> >
> > +typedef HRESULT (WINAPI *pSetThreadDescription) (HANDLE hThread,
> > +                                                 PCWSTR
> lpThreadDescription);
> > +static pSetThreadDescription SetThreadDescriptionFunc;
> > +static HMODULE kernel32_module;
> > +
> > +static bool load_set_thread_description(void)
> > +{
> > +    static gsize _init_once =3D 0;
> > +
> > +    if (g_once_init_enter(&_init_once)) {
> > +        kernel32_module =3D LoadLibrary("kernel32.dll");
> > +        if (kernel32_module) {
> > +            SetThreadDescriptionFunc =3D
> > +                (pSetThreadDescription)GetProcAddress(kernel32_module,
> > +
> "SetThreadDescription");
> > +            if (!SetThreadDescriptionFunc) {
> > +                FreeLibrary(kernel32_module);
> > +            }
> > +        }
> > +        g_once_init_leave(&_init_once, 1);
> > +    }
> > +
> > +    return !!SetThreadDescriptionFunc;
> > +}
> > +
> >  void qemu_thread_naming(bool enable)
> >  {
> > -    /* But note we don't actually name them on Windows yet */
> >      name_threads =3D enable;
> >
> > -    fprintf(stderr, "qemu: thread naming not supported on this host\n"=
);
> > +    if (enable && !load_set_thread_description()) {
> > +        fprintf(stderr, "qemu: thread naming not supported on this
> host\n");
> > +        name_threads =3D false;
> > +    }
> >  }
> >
> >  static void error_exit(int err, const char *msg)
> > @@ -400,6 +427,26 @@ void *qemu_thread_join(QemuThread *thread)
> >      return ret;
> >  }
> >
> > +static bool
>
> This is still not fixed
>
> > +set_thread_description(HANDLE h, const char *name)
> > +{
> > +  HRESULT hr;
>
> and the 4 spaces here ...
>

good catch, thanks

>
> > +  g_autofree wchar_t *namew =3D NULL;
> > +
> > +  if (!load_set_thread_description()) {
> > +      return false;
> > +  }
> > +
> > +  namew =3D g_utf8_to_utf16(name, -1, NULL, NULL, NULL);
> > +  if (!namew) {
> > +      return false;
> > +  }
> > +
> > +  hr =3D SetThreadDescriptionFunc(h, namew);
> > +
> > +  return SUCCEEDED(hr);
> > +}
> > +
> >  void qemu_thread_create(QemuThread *thread, const char *name,
> >                         void *(*start_routine)(void *),
> >                         void *arg, int mode)
> > @@ -423,7 +470,11 @@ void qemu_thread_create(QemuThread *thread, const
> char *name,
> >      if (!hThread) {
> >          error_exit(GetLastError(), __func__);
> >      }
> > +    if (name_threads && name && !set_thread_description(hThread, name)=
)
> {
> > +        fprintf(stderr, "qemu: failed to set thread description: %s\n"=
,
> name);
> > +    }
> >      CloseHandle(hThread);
> > +
> >      thread->data =3D data;
> >  }
> >
>
> Regards,
> Bin
>
>

--00000000000051f72905eac10230
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 11, 2022 at 2:33 PM Bin=
 Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, O=
ct 11, 2022 at 5:29 PM &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" t=
arget=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; As described in:<br>
&gt; <a href=3D"https://learn.microsoft.com/en-us/visualstudio/debugger/how=
-to-set-a-thread-name-in-native-code?view=3Dvs-2022" rel=3D"noreferrer" tar=
get=3D"_blank">https://learn.microsoft.com/en-us/visualstudio/debugger/how-=
to-set-a-thread-name-in-native-code?view=3Dvs-2022</a><br>
&gt;<br>
&gt; SetThreadDescription() is available since Windows 10, version 1607 and=
<br>
&gt; in some versions only by &quot;Run Time Dynamic Linking&quot;. Its dec=
laration is<br>
&gt; not yet in mingw, so we lookup the function the same way glib does.<br=
>
&gt;<br>
&gt; Tested with Visual Studio Community 2022 debugger.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 util/qemu-thread-win32.c | 55 ++++++++++++++++++++++++++++++++++=
++++--<br>
&gt;=C2=A0 1 file changed, 53 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/util/qemu-thread-win32.c b/util/qemu-thread-win32.c<br>
&gt; index a2d5a6e825..b20bfa9c1f 100644<br>
&gt; --- a/util/qemu-thread-win32.c<br>
&gt; +++ b/util/qemu-thread-win32.c<br>
&gt; @@ -19,12 +19,39 @@<br>
&gt;<br>
&gt;=C2=A0 static bool name_threads;<br>
&gt;<br>
&gt; +typedef HRESULT (WINAPI *pSetThreadDescription) (HANDLE hThread,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCWSTR lpThreadDescription);<br>
&gt; +static pSetThreadDescription SetThreadDescriptionFunc;<br>
&gt; +static HMODULE kernel32_module;<br>
&gt; +<br>
&gt; +static bool load_set_thread_description(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 static gsize _init_once =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (g_once_init_enter(&amp;_init_once)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel32_module =3D LoadLibrary(&quot;ker=
nel32.dll&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kernel32_module) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SetThreadDescriptionFunc =
=3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (pSetThreadDe=
scription)GetProcAddress(kernel32_module,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SetThreadDescription&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!SetThreadDescriptionFu=
nc) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FreeLibrary(k=
ernel32_module);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_once_init_leave(&amp;_init_once, 1);<br=
>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return !!SetThreadDescriptionFunc;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 void qemu_thread_naming(bool enable)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 /* But note we don&#39;t actually name them on Windows =
yet */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 name_threads =3D enable;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 fprintf(stderr, &quot;qemu: thread naming not supported=
 on this host\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 if (enable &amp;&amp; !load_set_thread_description()) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;qemu: thread naming=
 not supported on this host\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 name_threads =3D false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void error_exit(int err, const char *msg)<br>
&gt; @@ -400,6 +427,26 @@ void *qemu_thread_join(QemuThread *thread)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static bool<br>
<br>
This is still not fixed<br>
<br>
&gt; +set_thread_description(HANDLE h, const char *name)<br>
&gt; +{<br>
&gt; +=C2=A0 HRESULT hr;<br>
<br>
and the 4 spaces here ...<br></blockquote><div><br></div><div>good catch, t=
hanks <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 g_autofree wchar_t *namew =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 if (!load_set_thread_description()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 namew =3D g_utf8_to_utf16(name, -1, NULL, NULL, NULL);<br>
&gt; +=C2=A0 if (!namew) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 hr =3D SetThreadDescriptionFunc(h, namew);<br>
&gt; +<br>
&gt; +=C2=A0 return SUCCEEDED(hr);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 void qemu_thread_create(QemuThread *thread, const char *name,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0void *(*start_routine)(void *),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0void *arg, int mode)<br>
&gt; @@ -423,7 +470,11 @@ void qemu_thread_create(QemuThread *thread, const=
 char *name,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!hThread) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit(GetLastError(), __func__)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 if (name_threads &amp;&amp; name &amp;&amp; !set_thread=
_description(hThread, name)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;qemu: failed to set=
 thread description: %s\n&quot;, name);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CloseHandle(hThread);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 thread-&gt;data =3D data;<br>
&gt;=C2=A0 }<br>
&gt;<br>
<br>
Regards,<br>
Bin<br>
<br>
</blockquote></div></div>

--00000000000051f72905eac10230--


