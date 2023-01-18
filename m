Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D5672516
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 18:37:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pICM2-0002WG-NN; Wed, 18 Jan 2023 12:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pICLx-0002Vm-BH
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:36:03 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pICLu-0001mz-Fu
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 12:36:00 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s3so12472493edd.4
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zkzCPhFO7SUtvHOAjwwEyGAroxf6nn+TwI53ZbMMMPA=;
 b=E22TuM0GlKKJ0HUU1t7uGSbuCQrIIdHIASm89TPEskCOyNe3tSLMXrRprUBMbP5yZG
 JIYkG1yLvLABaQ7worMsGtgZeMKmJGmTKMre8ERpEuwXvGGcOK2vHS+V5PoBL7cioC7o
 4PrKHOSvf/Zcs3astASALTeJ0Fh0M09G5IlrqURWTn0SYOiLpjZfw0kWpSiYbGNj1WfY
 Xl0U22h5D8s8MurOf1M575evBz5SiG8R8nC3iRBY5mhoG0DKkh1z4O1CAPGudQMWhUES
 sVmkeW5g22QVDcJ0dMqYIiq5wwT8G6MaGGODsOU88FWqolJmRbuMuEiprNzRqOqQ3GBu
 ZYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zkzCPhFO7SUtvHOAjwwEyGAroxf6nn+TwI53ZbMMMPA=;
 b=ZiDEGRLGRJHwkKxsYwGpogrNXM8ddyu89fQmizbifqxx1Z1BMwWBs2W61MvfgPYnOq
 wGxl8X/nTtp9B0okFAfPjCJ340O3cCKCDmLEDd4hbYGIAZU6fmIsFxSMSpEth6vMOgLu
 11lm05l/xPNIYCfJfRO5G3ucBuEwactw5WTqbbN26Df47/Hw2GhNEvou3UjqcLdbrWHh
 GVq9ez7xyGom17o8XrA5k7HslGXRlN6lvThMGShEdww5UD9pFAd527L9Dsn5driuJGCq
 42q6AXm6I33oOYGmD0ntKBynT53OGim7BUGp0winQofgsQwSeP2oyfXgaolxTgXVTEWk
 qRUw==
X-Gm-Message-State: AFqh2kpG8JpBOZYdLF9HjumWoLt7j17VjxfZ6JveGE4Dr4MperY+3C08
 VaFU6PagPqlI6snD3e+qn/JAesuJHvqZNod3vdu25A==
X-Google-Smtp-Source: AMrXdXvZs30jADZ9GCa90lMvNlmILYQZMwgaXMcxXh4/Y+tAUYJE7Dmf3qtv0/qgMhJ0LvT+IcrKQXtY/4/zdI0ymEo=
X-Received: by 2002:a05:6402:90f:b0:499:ed85:a354 with SMTP id
 g15-20020a056402090f00b00499ed85a354mr713696edz.241.1674063355604; Wed, 18
 Jan 2023 09:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
 <Y8bMBZFqVP+EFzA8@redhat.com>
 <CANCZdfrg+S-EsjzcJe78aWr3pBaESv1+MUkLa-H6i=o-S0LaqQ@mail.gmail.com>
 <Y8bYI4RgV4F5b1ht@redhat.com>
 <c2c62083-1e04-b70c-baac-cf2bf1a21660@redhat.com>
In-Reply-To: <c2c62083-1e04-b70c-baac-cf2bf1a21660@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 18 Jan 2023 10:35:44 -0700
Message-ID: <CANCZdfpswRtiivGNSwW6FhEe=oOqv=C2+dspoEtWLq7eXkMqHg@mail.gmail.com>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, 
 Kyle Evans <kevans@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a481d805f28d3ff1"
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000a481d805f28d3ff1
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 18, 2023 at 8:12 AM Emanuele Giuseppe Esposito <
eesposit@redhat.com> wrote:

>
>
> Am 17/01/2023 um 18:17 schrieb Kevin Wolf:
> > Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:
> >> On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >>
> >>> Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
> >>>> On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
> >>>> eesposit@redhat.com> wrote:
> >>>>
> >>>>> QEMU does not compile when enabling clang's thread safety analysis
> >>>>> (TSA),
> >>>>> because some functions create wrappers for pthread mutexes but do
> >>>>> not use any TSA macro. Therefore the compiler fails.
> >>>>>
> >>>>> In order to make the compiler happy and avoid adding all the
> >>>>> necessary macros to all callers (lock functions should use
> >>>>> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers
> of
> >>>>> pthread_mutex_lock/pthread_mutex_unlock),
> >>>>> simply use TSA_NO_TSA to supppress such warnings.
> >>>>
> >>>> I'm not sure I understand this quite right. Maybe a clarifying
> question
> >>>> will help me understand: Why is this needed for bsd-user but not
> >>>> linux-user? How are they different here?
> >>>
> >>> FreeBSD's pthread headers include TSA annotations for some functions
> >>> that force us to do something about them (for now: suppress the
> warnings
> >>> in their callers) before we can enable -Wthread-safety for the purposes
> >>> where we really want it. Without this, calling functions like
> >>> pthread_mutex_lock() would cause compiler errors.
> >>>
> >>> glibc's headers don't contain such annotations, so the same is not
> >>> necessary on Linux
> >>>
> >>
> >> Thanks Kevin. With that explanation, these patches and their explanation
> >> make perfect sense now. Often when there's a patch to bsd-user but not
> >> linux-user, it's because bsd-user needs to do more in some way (which I
> try
> >> to keep up on).
> >>
> >> In this case, it's because FreeBSD's libc is a bit ahead of the curve.
> So I
> >> understand why it's needed, and what I need to do next (though I think
> that
> >> I may have to wait for the rest of qemu to be annotated)...
> >
> > I assume that the bsd-user part is actually sufficiently independent
> > that you could do proper annotations there if you want.
> >
> > However, be aware that TSA has some serious limitations with C, so you
> > can't express certain things, and it isn't as strict as it could be (in
> > particular, function pointers bypass it). As long as you have global
> > locks (as opposed to locks in structs), it kind of works, though.
> > Certainly better than nothing.
> >
> > But it probably means that some of the rest of QEMU may never get the
> > annotations. Also, our primary goal is protecting the block layer, so
> > someone else would have to work on other locks. With checks disabled on
> > individual functions like in this series, it should at least be possible
> > to work on it incrementally.
> >
> >> It might be better, though, to put some of this information in the
> commit
> >> message so it isn't just on the mailing list.
> >
> > Yes, I agree. We can tweak the commit messages before merging it.
>
> New proposed commit message:
>
> bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA warnings in FreeBSD
>
> FreeBSD implements pthread headers using TSA (thread safety analysis)
> annotations, therefore when an application is compiled with -Wthread-safety
> there are some locking/annotation requirements that the user of the
> pthread API has to follow.
>
> This will also be the case in QEMU, since bsd-user/mmap.c uses the
> pthread API. Therefore when building it with -Wthread-safety the
> compiler will throw warnings because the functions are not properly
> annotated. We need TSA to be enabled because it ensures
> that the critical sections of an annotated variable are properly
> locked.
>
> In order to make the compiler happy and avoid adding all the
> necessary macros to all callers (lock functions should use
> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to all
> users of pthread_mutex_lock/pthread_mutex_unlock),
> simply use TSA_NO_TSA to supppress such warnings.
>

Looks good to me.

Warner


> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>
> Same message could be applied to patch 1, substituting bsd-user/mmap
> with util/qemu-thread-posix.
>
>
> Thank you,
> Emanuele
>
> >
> >> Just a suggestion:
> >>
> >> Reviewed-by: Warner Losh <imp@bsdimp.com>
> >
> > Thanks!
> >
> > Kevin
> >
>
>

--000000000000a481d805f28d3ff1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 18, 2023 at 8:12 AM Emanu=
ele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@redhat.com">eesposit@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
Am 17/01/2023 um 18:17 schrieb Kevin Wolf:<br>
&gt; Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:<br>
&gt;&gt; On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf &lt;<a href=3D"mailto:k=
wolf@redhat.com" target=3D"_blank">kwolf@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:<br>
&gt;&gt;&gt;&gt; On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito=
 &lt;<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:eesposit@redhat.com" target=3D"_blank">e=
esposit@redhat.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; QEMU does not compile when enabling clang&#39;s thread=
 safety analysis<br>
&gt;&gt;&gt;&gt;&gt; (TSA),<br>
&gt;&gt;&gt;&gt;&gt; because some functions create wrappers for pthread mut=
exes but do<br>
&gt;&gt;&gt;&gt;&gt; not use any TSA macro. Therefore the compiler fails.<b=
r>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; In order to make the compiler happy and avoid adding a=
ll the<br>
&gt;&gt;&gt;&gt;&gt; necessary macros to all callers (lock functions should=
 use<br>
&gt;&gt;&gt;&gt;&gt; TSA_ACQUIRE, while unlock TSA_RELEASE, and this applie=
s to allusers of<br>
&gt;&gt;&gt;&gt;&gt; pthread_mutex_lock/pthread_mutex_unlock),<br>
&gt;&gt;&gt;&gt;&gt; simply use TSA_NO_TSA to supppress such warnings.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I&#39;m not sure I understand this quite right. Maybe a cl=
arifying question<br>
&gt;&gt;&gt;&gt; will help me understand: Why is this needed for bsd-user b=
ut not<br>
&gt;&gt;&gt;&gt; linux-user? How are they different here?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; FreeBSD&#39;s pthread headers include TSA annotations for some=
 functions<br>
&gt;&gt;&gt; that force us to do something about them (for now: suppress th=
e warnings<br>
&gt;&gt;&gt; in their callers) before we can enable -Wthread-safety for the=
 purposes<br>
&gt;&gt;&gt; where we really want it. Without this, calling functions like<=
br>
&gt;&gt;&gt; pthread_mutex_lock() would cause compiler errors.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; glibc&#39;s headers don&#39;t contain such annotations, so the=
 same is not<br>
&gt;&gt;&gt; necessary on Linux<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks Kevin. With that explanation, these patches and their expla=
nation<br>
&gt;&gt; make perfect sense now. Often when there&#39;s a patch to bsd-user=
 but not<br>
&gt;&gt; linux-user, it&#39;s because bsd-user needs to do more in some way=
 (which I try<br>
&gt;&gt; to keep up on).<br>
&gt;&gt;<br>
&gt;&gt; In this case, it&#39;s because FreeBSD&#39;s libc is a bit ahead o=
f the curve. So I<br>
&gt;&gt; understand why it&#39;s needed, and what I need to do next (though=
 I think that<br>
&gt;&gt; I may have to wait for the rest of qemu to be annotated)...<br>
&gt; <br>
&gt; I assume that the bsd-user part is actually sufficiently independent<b=
r>
&gt; that you could do proper annotations there if you want.<br>
&gt; <br>
&gt; However, be aware that TSA has some serious limitations with C, so you=
<br>
&gt; can&#39;t express certain things, and it isn&#39;t as strict as it cou=
ld be (in<br>
&gt; particular, function pointers bypass it). As long as you have global<b=
r>
&gt; locks (as opposed to locks in structs), it kind of works, though.<br>
&gt; Certainly better than nothing.<br>
&gt; <br>
&gt; But it probably means that some of the rest of QEMU may never get the<=
br>
&gt; annotations. Also, our primary goal is protecting the block layer, so<=
br>
&gt; someone else would have to work on other locks. With checks disabled o=
n<br>
&gt; individual functions like in this series, it should at least be possib=
le<br>
&gt; to work on it incrementally.<br>
&gt; <br>
&gt;&gt; It might be better, though, to put some of this information in the=
 commit<br>
&gt;&gt; message so it isn&#39;t just on the mailing list.<br>
&gt; <br>
&gt; Yes, I agree. We can tweak the commit messages before merging it.<br>
<br>
New proposed commit message:<br>
<br>
bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA warnings in FreeBSD<br>
<br>
FreeBSD implements pthread headers using TSA (thread safety analysis)<br>
annotations, therefore when an application is compiled with -Wthread-safety=
<br>
there are some locking/annotation requirements that the user of the<br>
pthread API has to follow.<br>
<br>
This will also be the case in QEMU, since bsd-user/mmap.c uses the<br>
pthread API. Therefore when building it with -Wthread-safety the<br>
compiler will throw warnings because the functions are not properly<br>
annotated. We need TSA to be enabled because it ensures<br>
that the critical sections of an annotated variable are properly<br>
locked.<br>
<br>
In order to make the compiler happy and avoid adding all the<br>
necessary macros to all callers (lock functions should use<br>
TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to all<br>
users of pthread_mutex_lock/pthread_mutex_unlock),<br>
simply use TSA_NO_TSA to supppress such warnings.<br></blockquote><div><br>=
</div><div>Looks good to me.</div><div><br></div><div>Warner</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Emanuele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@re=
dhat.com" target=3D"_blank">eesposit@redhat.com</a>&gt;<br>
<br>
Same message could be applied to patch 1, substituting bsd-user/mmap<br>
with util/qemu-thread-posix.<br>
<br>
<br>
Thank you,<br>
Emanuele<br>
<br>
&gt; <br>
&gt;&gt; Just a suggestion:<br>
&gt;&gt;<br>
&gt;&gt; Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" tar=
get=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; Kevin<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000a481d805f28d3ff1--

