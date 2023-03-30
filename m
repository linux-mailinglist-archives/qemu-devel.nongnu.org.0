Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7D76D07C3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:12:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phszy-0004zU-JE; Thu, 30 Mar 2023 10:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phszw-0004zM-Nj
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1phszv-0000v4-4S
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680185481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RvBY55LzZfbRc7qOGSd9HjuCVSamxUlditgrmAYo1Xw=;
 b=eGr/tSqY+76ttft4ZvhWt2NCWPL/2eHMWftPdxxHBA0wAbnMBu86wmcjYhPldP2McCdBd/
 3p4ufSRsLBgF6zpkbmh3Vz1EmBGro2PvbhNcvkhcLk86CWyHLNZhXxSKfIFYVAjUzWNh61
 i8c1vnPYXlqrE9fRTfg3vaARyG8/vfk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-aJLZMZ4uN5SCdNDg9BS08w-1; Thu, 30 Mar 2023 10:11:20 -0400
X-MC-Unique: aJLZMZ4uN5SCdNDg9BS08w-1
Received: by mail-pl1-f197.google.com with SMTP id
 f6-20020a170902ce8600b001a25ae310a9so5622089plg.10
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680185479;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RvBY55LzZfbRc7qOGSd9HjuCVSamxUlditgrmAYo1Xw=;
 b=4shwpXtsDU9DTNu39Pmie6uQ2pGosKiQ45BNIqAnxF/PgbhLe6gHoJO7voSxri9hKD
 T5Z/foVp/xsfxPgVNJmPK+Nq0giXfZCb+j1oTFNCuUG+oA6+OjYS6JqSiw256vdo93Ci
 Ym0Pc8yPTnFNpPidemdgAawvfJUkb/riY7hiw6xFTiDTAAtPcjDLkonP0ul1OTH7HzEz
 d3ihonZ7xtTSYzL6+Qhq1VS8VbxgW9wj8njX1VbrI/GsnSxXIirVztHeRMyojk18QHz9
 e7dmDfsoNCqU0SaeMR0gozh0BWTULayx1CUKCWr61gRvNpiNsVbuCxnFDWprVwOcB0AZ
 csYA==
X-Gm-Message-State: AAQBX9capXPVhpxx3o3gLIRYhoDVpxRcvOPa4y0Vc9RbX6GhbCmzehSQ
 eHzUs2RQ6QsJzYcgbF8WlH10J9CqQJWWNq0AZ2674d03Hu1EVpKl+9fQt5fcQ0VLCwow/AYOOXV
 0hBPjn+IliZcFZJnjmQwv1qIts5HydjU=
X-Received: by 2002:a17:902:ce83:b0:1a0:4321:920e with SMTP id
 f3-20020a170902ce8300b001a04321920emr8692412plg.12.1680185479006; 
 Thu, 30 Mar 2023 07:11:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350bH3k0FE4SsV7+3z/cyjQdzrM0X6FEbotqQKDeXZ2XjStsXVlbpfNRMgPmHP+I9TuN6yGMBkpJRT6ZeUOUPJZI=
X-Received: by 2002:a17:902:ce83:b0:1a0:4321:920e with SMTP id
 f3-20020a170902ce8300b001a04321920emr8692399plg.12.1680185478719; Thu, 30 Mar
 2023 07:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230328211119.2748442-1-jsnow@redhat.com>
 <44ed710a-f897-2be6-4f07-928ba4cb535e@redhat.com>
In-Reply-To: <44ed710a-f897-2be6-4f07-928ba4cb535e@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 30 Mar 2023 10:11:07 -0400
Message-ID: <CAFn=p-YC8rdv2QsU=aNcfDHvYGEtrze6CgSwJ-=9T6xaoAGoiA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] configure: create a python venv and install meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009dc49005f81eaa6e"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--0000000000009dc49005f81eaa6e
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 29, 2023, 9:02 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Thanks for posting this!
>
> On 3/28/23 23:11, John Snow wrote:
> > This series is in RFC state; some notable things:
> > - So far, only meson is included in this setup.
> > - There's a ton of debugging prints everywhere. It's extremely chatty
> right now.
> > - Sphinx and qemu.qmp are not yet included in this venv.
> >    (qemu.qmp isn't able to be removed from the tree yet.)
> > - Testing isn't yet*fully*  switched over.
> > - There is no online functionality yet, this series is *100% offline* -
> >    it's the harder option, so I tackled it first.
> >
> > Some known bugs as of now:
> > - venv-in-venv setups are not yet handled.
> > - python3.7 setups without setuptools/pip in the host environment may be
> >    unable to generate script file shims; a workaround is in development
> >    but wasn't ready today. I decided to exclude it.
>
> I don't think that's needed at all---requiring setuptools on those older
> Python versions is good enough and can be mentioned in either an error
> message or the release notes.  But out of curiosity what was the
> workaround?
>

Run the shim generation inside the venv, alongside checkpip.

That way we know we have setuptools.

(It broke for some other reason I didn't diagnose in time to send.)


> I think the steps for the first working version should be:
>
> * fix venv-in-venv using the .pth trick
>

Yep.


> * undo the meson parts from PATCH 3; make patch 3 create the venv +
> subsume the MKVENV parts of the Makefiles + always set
> explicit_python=yes (so that at this point the in-tree meson is always
> used).
>
> * add a patch that starts rejecting --meson=/path/to/meson and drops
> explicit_python (instead using pyvenv/bin/meson to check whether a
> system meson is usable)
>
> * make Meson use a sphinx-build binary from the virtual environment
> (i.e. pass -Dsphinx_build=$PWD/pyvenv/bin/sphinx-build)
>

Yep, let's talk about this part in particular.


> These are the bare minimum needed to drop Python 3.6 support in QEMU 8.1.
>
> Paolo
>
>

--0000000000009dc49005f81eaa6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 29, 2023, 9:02 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Thanks for posting this!<br>
<br>
On 3/28/23 23:11, John Snow wrote:<br>
&gt; This series is in RFC state; some notable things:<br>
&gt; - So far, only meson is included in this setup.<br>
&gt; - There&#39;s a ton of debugging prints everywhere. It&#39;s extremely=
 chatty right now.<br>
&gt; - Sphinx and qemu.qmp are not yet included in this venv.<br>
&gt;=C2=A0 =C2=A0 (qemu.qmp isn&#39;t able to be removed from the tree yet.=
)<br>
&gt; - Testing isn&#39;t yet*fully*=C2=A0 switched over.<br>
&gt; - There is no online functionality yet, this series is *100% offline* =
-<br>
&gt;=C2=A0 =C2=A0 it&#39;s the harder option, so I tackled it first.<br>
&gt; <br>
&gt; Some known bugs as of now:<br>
&gt; - venv-in-venv setups are not yet handled.<br>
&gt; - python3.7 setups without setuptools/pip in the host environment may =
be<br>
&gt;=C2=A0 =C2=A0 unable to generate script file shims; a workaround is in =
development<br>
&gt;=C2=A0 =C2=A0 but wasn&#39;t ready today. I decided to exclude it.<br>
<br>
I don&#39;t think that&#39;s needed at all---requiring setuptools on those =
older <br>
Python versions is good enough and can be mentioned in either an error <br>
message or the release notes.=C2=A0 But out of curiosity what was the worka=
round?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Run the shim generation inside the venv, alongside checkpip.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">That way we know we have setupto=
ols.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(It broke for some =
other reason I didn&#39;t diagnose in time to send.)</div><div dir=3D"auto"=
><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
I think the steps for the first working version should be:<br>
<br>
* fix venv-in-venv using the .pth trick<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Yep.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
* undo the meson parts from PATCH 3; make patch 3 create the venv + <br>
subsume the MKVENV parts of the Makefiles + always set <br>
explicit_python=3Dyes (so that at this point the in-tree meson is always <b=
r>
used).<br>
<br>
* add a patch that starts rejecting --meson=3D/path/to/meson and drops <br>
explicit_python (instead using pyvenv/bin/meson to check whether a <br>
system meson is usable)<br>
<br>
* make Meson use a sphinx-build binary from the virtual environment <br>
(i.e. pass -Dsphinx_build=3D$PWD/pyvenv/bin/sphinx-build)<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yep, let&#39;s tal=
k about this part in particular.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
These are the bare minimum needed to drop Python 3.6 support in QEMU 8.1.<b=
r>
<br>
Paolo<br>
<br>
</blockquote></div></div></div>

--0000000000009dc49005f81eaa6e--


