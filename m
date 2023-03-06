Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651DC6ABC68
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ82Y-0004dX-E0; Mon, 06 Mar 2023 05:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ82R-0004cw-Ev
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:25:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ82P-00058G-Ih
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678098348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YrY1UuEWycHiOPJuBwXfmvpTCvt1fL+3qZrJ8d8YCsQ=;
 b=JgRrGKJbkyvWG+xrH1MBSq+3KBjPQFBfXd3qS01HY+24bqoW13UxkzCIsPF8kNjATifdze
 WQ16mjhkP9SizHX5kUjAEx2plX2WzgLUGSlG9BZL7Lep4jD6w1xI3NKPkWrTkBp0/eJ74A
 3+H0ejykBS1GxMGocQnZmtg6GBHNHpc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-BbPPnsoLPy2u1iXqQdqndQ-1; Mon, 06 Mar 2023 05:25:47 -0500
X-MC-Unique: BbPPnsoLPy2u1iXqQdqndQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso13131998edb.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 02:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YrY1UuEWycHiOPJuBwXfmvpTCvt1fL+3qZrJ8d8YCsQ=;
 b=ubKlkvep1fYVZ6XoReWr1mHCj+bHJtJ0BlzeUXSZxce6SREu03kSj3hpoibv20ohI0
 3FPnwYQKgnZkX4Y8xqNv2Fr8jk5BpORLKp6L6058Zhnye1qOgFGA9z/DQTohABf1hvgZ
 Vl/Sz6v4+yQ6j16R9gXS4Q/OW5Kwaw/S8lw529+sBtGYALdRZ4+vyfZgkBEebUoAx7r4
 mdqKFerxmEh3uZrq+zhwoBAFt5RNtvCZhVF+0+Or2GYOQIFcx2HAH0iIzobF+gNFB9BU
 VhN1f56a5Wy0xIKBwICNPA1YQkRuaF/h9yjgGuJaK+CL/HxJtw0GNQLaf5oEfq/65I2q
 BhOA==
X-Gm-Message-State: AO0yUKUFTPsHG2UuBufF0BGliv+RzT3TqWvWMpFmy6h5fEtvQ8EHvAml
 xvGwnCWtuHX030StSCV4r9R4ph1n8T+mnCqYnF+A7B1gpqMBMlrnSjVsq0hozCC1z+JKV+SmC14
 vZSjY2j2uikJwLf95zpuc6NuxNets2a8=
X-Received: by 2002:a17:906:a14:b0:8b1:38d6:9853 with SMTP id
 w20-20020a1709060a1400b008b138d69853mr4424447ejf.2.1678098346073; 
 Mon, 06 Mar 2023 02:25:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9Hb4t46CE1fTN4YVIUmsWnkXfGpWlCJZFwkCf/H0kPVeYK8TdyNP9d74s8qyLcKFI+2NzY120q/rJUePHxtBY=
X-Received: by 2002:a17:906:a14:b0:8b1:38d6:9853 with SMTP id
 w20-20020a1709060a1400b008b138d69853mr4424428ejf.2.1678098345809; Mon, 06 Mar
 2023 02:25:45 -0800 (PST)
MIME-Version: 1.0
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
 <ZAW7DcpRDcGF2VQx@redhat.com>
 <CAFEAcA8aKCw28yO6OMDiYm94PTJcmY7MCj_qdFhUCppwpOD4+g@mail.gmail.com>
In-Reply-To: <CAFEAcA8aKCw28yO6OMDiYm94PTJcmY7MCj_qdFhUCppwpOD4+g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Mar 2023 14:25:34 +0400
Message-ID: <CAMxuvayNp1hb=7qFAp_n6fvmc7RafHpue5Ugd4SFriQ_SBN2vg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ccee2f05f638b716"
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

--000000000000ccee2f05f638b716
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 6, 2023 at 2:18=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Mon, 6 Mar 2023 at 10:06, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
> wrote:
> >
> > On Thu, Mar 02, 2023 at 05:18:44PM +0400, marcandre.lureau@redhat.com
> wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Hi,
> > >
> > > Meson "wrap" is a mechanism to build dependencies that doesn't rely o=
n
> git
> > > submodules and integrate external dependencies as subproject()s.
> > >
> > > This offers developpers a simpler way to build QEMU with missing syst=
em
> > > dependencies (ex, libslirp in my case), but also simplify the fallbac=
k
> build
> > > definition of dtc/libfdt.
> >
> > Do we actually need this facility though ? We've already determined
> > that every platform we need has libslirp now, and IIUC Thomas determine=
d
> > recently that dtc is also available everywhere we need it to be.
> >
> > So why would we want to continue to special case these two libraries,
> > out of all the many many many other libraries we also have deps on.
>
> Also, it looks like the wrap mechanism is still basically "we have
> a file that indicates what the external git URL of the dependency
> is and specifies a commit hash to use", it's just changing the
> mechanism we use to get the source from git submodules to this
> new thing. Maybe the new thing really is better -- certainly
> git submodules are absolutely awful -- but we should have one
> mechanism, not two.
>

I think we all experienced git submodules are more intrusive and may break
various git workflows.

wrap files may indeed point to a git URL with a revision, but they are more
versatile than that and can download from released tarball instead, for
example.

Some projects, like glib, use both submodules and wrap files (
https://gitlab.gnome.org/GNOME/glib/-/tree/main/subprojects), there is no
incompatibility with both solutions. As often, use what fits best your
needs.

--000000000000ccee2f05f638b716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 6, 2023 at 2:18=E2=80=
=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.m=
aydell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Mon, 6 Mar 2023 at 10:06, Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Mar 02, 2023 at 05:18:44PM +0400, <a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:=
<br>
&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; Meson &quot;wrap&quot; is a mechanism to build dependencies that =
doesn&#39;t rely on git<br>
&gt; &gt; submodules and integrate external dependencies as subproject()s.<=
br>
&gt; &gt;<br>
&gt; &gt; This offers developpers a simpler way to build QEMU with missing =
system<br>
&gt; &gt; dependencies (ex, libslirp in my case), but also simplify the fal=
lback build<br>
&gt; &gt; definition of dtc/libfdt.<br>
&gt;<br>
&gt; Do we actually need this facility though ? We&#39;ve already determine=
d<br>
&gt; that every platform we need has libslirp now, and IIUC Thomas determin=
ed<br>
&gt; recently that dtc is also available everywhere we need it to be.<br>
&gt;<br>
&gt; So why would we want to continue to special case these two libraries,<=
br>
&gt; out of all the many many many other libraries we also have deps on.<br=
>
<br>
Also, it looks like the wrap mechanism is still basically &quot;we have<br>
a file that indicates what the external git URL of the dependency<br>
is and specifies a commit hash to use&quot;, it&#39;s just changing the<br>
mechanism we use to get the source from git submodules to this<br>
new thing. Maybe the new thing really is better -- certainly<br>
git submodules are absolutely awful -- but we should have one<br>
mechanism, not two.<br></blockquote><div><br></div><div>I think we all expe=
rienced git submodules are more intrusive and may break various git workflo=
ws.<br></div><div><br></div><div>wrap files may indeed point to a git URL w=
ith a revision, but they are more versatile than that and can download from=
 released tarball instead, for example.<br></div><div><br></div><div>Some p=
rojects, like glib, use both submodules and wrap files (<a href=3D"https://=
gitlab.gnome.org/GNOME/glib/-/tree/main/subprojects">https://gitlab.gnome.o=
rg/GNOME/glib/-/tree/main/subprojects</a>), there is no incompatibility wit=
h both solutions. As often, use what fits best your needs.</div><div><br></=
div></div></div>

--000000000000ccee2f05f638b716--


