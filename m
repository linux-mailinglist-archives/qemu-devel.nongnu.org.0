Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72AE571FD9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:46:41 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBI5w-00056T-LX
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBI2h-00088u-SD
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:43:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oBI2b-0007d2-VL
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657640593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xWwFXR+vAGcoiUrUOf/JaE54KwNo/NjIeWaDAekm2jU=;
 b=BJT34mrROonkw1qI8QPJR5Qvb+ACeDRHJzmEo4MwMNwQVVp4L8NHFNrgmXOT8Ko+p+b8ZL
 ZqffZuARUgBmFHpDcoxpFsCR/GV5R1f+BvrdIqPVqrDmMOKOQ/ujXS5Rq7P1yLo5OOQZLp
 NimrjSTXiPnZ4PlWpLagpS/2k8YqTUY=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-okICmJLEM0ucw_9OI4Pf8w-1; Tue, 12 Jul 2022 11:43:11 -0400
X-MC-Unique: okICmJLEM0ucw_9OI4Pf8w-1
Received: by mail-vk1-f198.google.com with SMTP id
 w12-20020a1f300c000000b00374862e7711so2815609vkw.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xWwFXR+vAGcoiUrUOf/JaE54KwNo/NjIeWaDAekm2jU=;
 b=IHunRU3sFvX5ePtdy3UdnkT6+bLwcV6dFkydBM3iT1U6p39GOBKs+MBS0xwAX/u8U2
 ik5Cc85q/j6vXCbTZ3oFJVJZpaarpiabXdRRC7Y74iioffW0mOaC6PqppT2uvLtZA7Vx
 NRkeSjOUqdEJbv13bTJTrdlbCxYP/papqsvZdEabIM3A1toEg3SvY6NxVB8+4CKtQCxT
 t8g9sAi3s8I/m6+XA03uKov8Ip5SrTazsPwFK0NCGpR8ziHC8kzwAaGDydk3mLtLElv4
 ba6ojciVSihWfqFGnn8xjVHXHjTHFmsn+mM1qlgjy69JP4BETSbGWKiBC5O0xLsHhoRR
 fHyg==
X-Gm-Message-State: AJIora/Pe5S1qEpyiK8EydbjO+hYECLCLXE1nf8iPLB24/o3YCdadhTO
 xlSOZoZ6zahkXsrHkTSqmd/b6WbCJuzGYI22UKNZOl3P0HwyRyQ+YUHnMIupGyqy5VBjit4vddi
 eB8RIA6Qcp5/3szfJIOwpkb3AKgPCEBg=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr8504604uar.109.1657640591176; 
 Tue, 12 Jul 2022 08:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vAlJMvIxIMtXXDMXlEGgEEqXlprACwNAsmEDbMQK+BGKDHyOL0ZXKGphLJDvL3NSvADaD24jK/7ALMr+N+93Q=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr8504561uar.109.1657640590861; Tue, 12
 Jul 2022 08:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-2-ani@anisinha.ca>
 <CAFn=p-bcY7xuT-wAZqShhTD9KeVu52OM6-kh3XFNkWgKXbDYUA@mail.gmail.com>
 <alpine.DEB.2.22.394.2207121246490.1824593@anisinha-lenovo>
 <CAFn=p-bTwoj7+0o0jKVSirwA3cU316XmiOD316NsB0m5yQ_dnw@mail.gmail.com>
 <alpine.DEB.2.22.394.2207122105530.1972389@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2207122105530.1972389@anisinha-lenovo>
From: John Snow <jsnow@redhat.com>
Date: Tue, 12 Jul 2022 11:42:59 -0400
Message-ID: <CAFn=p-bm+o=gBpnBKmmGpfg85MqApi8A9+R9J1ukMpd-u5jpiA@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] acpi/tests/bits: initial commit of test scripts
 that are run by biosbits
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Daniel Berrange <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000957fa605e39d8650"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--000000000000957fa605e39d8650
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022, 11:38 AM Ani Sinha <ani@anisinha.ca> wrote:

>
>
> On Tue, 12 Jul 2022, John Snow wrote:
>
> > On Tue, Jul 12, 2022, 3:17 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > >
> > >
> > > On Mon, 11 Jul 2022, John Snow wrote:
> > >
> > > > On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > > This is initial commit of cpuid, acpi and smbios python test
> scripts
> > > for
> > > > > biosbits to execute. No change has been made to them from the
> original
> > > code
> > > > > written by the biosbits author Josh Triplett. They are required to
> be
> > > installed
> > > > > into the bits iso file and then run from within the virtual machine
> > > booted off
> > > > > with biosbits iso.
> > > > >
> > > > > The original location of these tests are here:
> > > > > https://github.com/biosbits/bits/blob/master/python/testacpi.py
> > > > > https://github.com/biosbits/bits/blob/master/python/smbios.py
> > > > > https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> > > > >
> > > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > > ---
> > > > >  tests/pytest/acpi-bits/bits-tests/meson.build |   11 +
> > > > >  tests/pytest/acpi-bits/bits-tests/smbios.py   | 2430
> +++++++++++++++++
> > > > >  tests/pytest/acpi-bits/bits-tests/testacpi.py |  283 ++
> > > > >  .../pytest/acpi-bits/bits-tests/testcpuid.py  |   83 +
> > > > >  4 files changed, 2807 insertions(+)
> > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/meson.build
> > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testacpi.py
> > > > >  create mode 100644 tests/pytest/acpi-bits/bits-tests/testcpuid.py
> > > > >
> > > > > diff --git a/tests/pytest/acpi-bits/bits-tests/meson.build
> > > b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > > > new file mode 100644
> > > > > index 0000000000..3056731a53
> > > > > --- /dev/null
> > > > > +++ b/tests/pytest/acpi-bits/bits-tests/meson.build
> > > > > @@ -0,0 +1,11 @@
> > > > > +test_files = ['smbios.py', 'testacpi.py', 'testcpuid.py']
> > > > > +
> > > > > +copytestfiles = custom_target('copy test files',
> > > > > +  input : test_files,
> > > > > +  output :  test_files,
> > > > > +  command : ['cp', '@INPUT@', '@OUTDIR@'],
> > > > > +  install : true,
> > > > > +  install_dir : 'bits-tests',
> > > > > +  build_by_default : true)
> > > > > +
> > > > > +other_deps += copytestfiles
> > > > > diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > > new file mode 100644
> > > > > index 0000000000..9667d0542c
> > > > > --- /dev/null
> > > > > +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py
> > > > > @@ -0,0 +1,2430 @@
> > > > > +# Copyright (c) 2015, Intel Corporation
> > > > > +# All rights reserved.
> > > > > +#
> > > > > +# Redistribution and use in source and binary forms, with or
> without
> > > > > +# modification, are permitted provided that the following
> conditions
> > > are met:
> > > > > +#
> > > > > +#     * Redistributions of source code must retain the above
> > > copyright notice,
> > > > > +#       this list of conditions and the following disclaimer.
> > > > > +#     * Redistributions in binary form must reproduce the above
> > > copyright notice,
> > > > > +#       this list of conditions and the following disclaimer in
> the
> > > documentation
> > > > > +#       and/or other materials provided with the distribution.
> > > > > +#     * Neither the name of Intel Corporation nor the names of its
> > > contributors
> > > > > +#       may be used to endorse or promote products derived from
> this
> > > software
> > > > > +#       without specific prior written permission.
> > > > > +#
> > > > > +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
> CONTRIBUTORS
> > > "AS IS" AND
> > > > > +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
> TO,
> > > THE IMPLIED
> > > > > +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> PURPOSE
> > > ARE
> > > > > +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
> CONTRIBUTORS
> > > BE LIABLE FOR
> > > > > +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> > > CONSEQUENTIAL DAMAGES
> > > > > +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> OR
> > > SERVICES;
> > > > > +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
> > > CAUSED AND ON
> > > > > +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> OR
> > > TORT
> > > > > +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
> THE
> > > USE OF THIS
> > > > > +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > > > > +
> > > > > +"""SMBIOS/DMI module."""
> > > > > +
> > > > > +import bits
> > > > > +import bitfields
> > > >
> > > > New deps?
> > > >
> > > > > +import ctypes
> > > > > +import redirect
> > > >
> > > > Also a new dep?
> > > >
> > > > > +import struct
> > > > > +import uuid
> > > > > +import unpack
> > > >
> > > > And another?
> > > >
> > > > > +import ttypager
> > > > > +import sys
> > > >
> > > > What's the proposed strategy for dependency management for these
> > > > tests? I know there's some mail I'm backlogged on ...
> > > >
> > >
> > > For some reason I did not need to add those libraries as dependencies.
> If
> > > needed we can add them in requirements.txt for pyenv.
> > >
> >
> > Probably pulled in as deps to what you do install; pinning them may be
> > helpful for repeatability reasons and to avoid playing whackamole with
> new
> > pypi releases during the rc testing phase - speaking from experience with
> > the other python test packages in the tree.
>
>
> Actually wait, I completely forgot something. These test scrips are run
> *inside* bios-bits VM, That is, we need not worry about ensuring the
> availability of these libraries and the deps they introduce ourselves.
> Bios bits takes care of it. It is a software written and maintained
> outside of QEMU.
>
> The only python script whose deps we need to worry about is the one I
> wrote myself - acpi-bits-test.py .
>

Aha. Could I please ask for a comment in each .py file that isn't designed
to run directly in the host v/environment? Just a small nod to the fact
that it runs in a special VM so I can exclude it from other regular
maintenance operations / considerations for dependency management in the
host testing env.

# Designed to run only in the biosbits VM.

would be more than sufficient.

--js

--000000000000957fa605e39d8650
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jul 12, 2022, 11:38 AM Ani Sinha &lt;<a href=
=3D"mailto:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
<br>
On Tue, 12 Jul 2022, John Snow wrote:<br>
<br>
&gt; On Tue, Jul 12, 2022, 3:17 AM Ani Sinha &lt;<a href=3D"mailto:ani@anis=
inha.ca" target=3D"_blank" rel=3D"noreferrer">ani@anisinha.ca</a>&gt; wrote=
:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 11 Jul 2022, John Snow wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Sun, Jul 10, 2022 at 1:01 PM Ani Sinha &lt;<a href=3D"mai=
lto:ani@anisinha.ca" target=3D"_blank" rel=3D"noreferrer">ani@anisinha.ca</=
a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This is initial commit of cpuid, acpi and smbios python=
 test scripts<br>
&gt; &gt; for<br>
&gt; &gt; &gt; &gt; biosbits to execute. No change has been made to them fr=
om the original<br>
&gt; &gt; code<br>
&gt; &gt; &gt; &gt; written by the biosbits author Josh Triplett. They are =
required to be<br>
&gt; &gt; installed<br>
&gt; &gt; &gt; &gt; into the bits iso file and then run from within the vir=
tual machine<br>
&gt; &gt; booted off<br>
&gt; &gt; &gt; &gt; with biosbits iso.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The original location of these tests are here:<br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/biosbits/bits/blob/master=
/python/testacpi.py" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/biosbits/bits/blob/master/python/testacpi.py</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/biosbits/bits/blob/master=
/python/smbios.py" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
github.com/biosbits/bits/blob/master/python/smbios.py</a><br>
&gt; &gt; &gt; &gt; <a href=3D"https://github.com/biosbits/bits/blob/master=
/python/testcpuid.py" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://github.com/biosbits/bits/blob/master/python/testcpuid.py</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Ani Sinha &lt;<a href=3D"mailto:ani@anis=
inha.ca" target=3D"_blank" rel=3D"noreferrer">ani@anisinha.ca</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 tests/pytest/acpi-bits/bits-tests/meson.build |=
=C2=A0 =C2=A011 +<br>
&gt; &gt; &gt; &gt;=C2=A0 tests/pytest/acpi-bits/bits-tests/smbios.py=C2=A0=
 =C2=A0| 2430 +++++++++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 tests/pytest/acpi-bits/bits-tests/testacpi.py |=
=C2=A0 283 ++<br>
&gt; &gt; &gt; &gt;=C2=A0 .../pytest/acpi-bits/bits-tests/testcpuid.py=C2=
=A0 |=C2=A0 =C2=A083 +<br>
&gt; &gt; &gt; &gt;=C2=A0 4 files changed, 2807 insertions(+)<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-te=
sts/meson.build<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-te=
sts/smbios.py<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-te=
sts/testacpi.py<br>
&gt; &gt; &gt; &gt;=C2=A0 create mode 100644 tests/pytest/acpi-bits/bits-te=
sts/testcpuid.py<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/tests/pytest/acpi-bits/bits-tests/meson.bu=
ild<br>
&gt; &gt; b/tests/pytest/acpi-bits/bits-tests/meson.build<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..3056731a53<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/tests/pytest/acpi-bits/bits-tests/meson.build<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,11 @@<br>
&gt; &gt; &gt; &gt; +test_files =3D [&#39;smbios.py&#39;, &#39;testacpi.py&=
#39;, &#39;testcpuid.py&#39;]<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +copytestfiles =3D custom_target(&#39;copy test files&#=
39;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 input : test_files,<br>
&gt; &gt; &gt; &gt; +=C2=A0 output :=C2=A0 test_files,<br>
&gt; &gt; &gt; &gt; +=C2=A0 command : [&#39;cp&#39;, &#39;@INPUT@&#39;, &#3=
9;@OUTDIR@&#39;],<br>
&gt; &gt; &gt; &gt; +=C2=A0 install : true,<br>
&gt; &gt; &gt; &gt; +=C2=A0 install_dir : &#39;bits-tests&#39;,<br>
&gt; &gt; &gt; &gt; +=C2=A0 build_by_default : true)<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +other_deps +=3D copytestfiles<br>
&gt; &gt; &gt; &gt; diff --git a/tests/pytest/acpi-bits/bits-tests/smbios.p=
y<br>
&gt; &gt; b/tests/pytest/acpi-bits/bits-tests/smbios.py<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..9667d0542c<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/tests/pytest/acpi-bits/bits-tests/smbios.py<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,2430 @@<br>
&gt; &gt; &gt; &gt; +# Copyright (c) 2015, Intel Corporation<br>
&gt; &gt; &gt; &gt; +# All rights reserved.<br>
&gt; &gt; &gt; &gt; +#<br>
&gt; &gt; &gt; &gt; +# Redistribution and use in source and binary forms, w=
ith or without<br>
&gt; &gt; &gt; &gt; +# modification, are permitted provided that the follow=
ing conditions<br>
&gt; &gt; are met:<br>
&gt; &gt; &gt; &gt; +#<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0* Redistributions of source code =
must retain the above<br>
&gt; &gt; copyright notice,<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0this list of conditions an=
d the following disclaimer.<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0* Redistributions in binary form =
must reproduce the above<br>
&gt; &gt; copyright notice,<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0this list of conditions an=
d the following disclaimer in the<br>
&gt; &gt; documentation<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0and/or other materials pro=
vided with the distribution.<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0* Neither the name of Intel Corpo=
ration nor the names of its<br>
&gt; &gt; contributors<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0may be used to endorse or =
promote products derived from this<br>
&gt; &gt; software<br>
&gt; &gt; &gt; &gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0without specific prior wri=
tten permission.<br>
&gt; &gt; &gt; &gt; +#<br>
&gt; &gt; &gt; &gt; +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS A=
ND CONTRIBUTORS<br>
&gt; &gt; &quot;AS IS&quot; AND<br>
&gt; &gt; &gt; &gt; +# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NO=
T LIMITED TO,<br>
&gt; &gt; THE IMPLIED<br>
&gt; &gt; &gt; &gt; +# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PART=
ICULAR PURPOSE<br>
&gt; &gt; ARE<br>
&gt; &gt; &gt; &gt; +# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR=
 CONTRIBUTORS<br>
&gt; &gt; BE LIABLE FOR<br>
&gt; &gt; &gt; &gt; +# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY=
, OR<br>
&gt; &gt; CONSEQUENTIAL DAMAGES<br>
&gt; &gt; &gt; &gt; +# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBST=
ITUTE GOODS OR<br>
&gt; &gt; SERVICES;<br>
&gt; &gt; &gt; &gt; +# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPT=
ION) HOWEVER<br>
&gt; &gt; CAUSED AND ON<br>
&gt; &gt; &gt; &gt; +# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT=
 LIABILITY, OR<br>
&gt; &gt; TORT<br>
&gt; &gt; &gt; &gt; +# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY W=
AY OUT OF THE<br>
&gt; &gt; USE OF THIS<br>
&gt; &gt; &gt; &gt; +# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH=
 DAMAGE.<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +&quot;&quot;&quot;SMBIOS/DMI module.&quot;&quot;&quot;=
<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +import bits<br>
&gt; &gt; &gt; &gt; +import bitfields<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; New deps?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +import ctypes<br>
&gt; &gt; &gt; &gt; +import redirect<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Also a new dep?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +import struct<br>
&gt; &gt; &gt; &gt; +import uuid<br>
&gt; &gt; &gt; &gt; +import unpack<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; And another?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +import ttypager<br>
&gt; &gt; &gt; &gt; +import sys<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What&#39;s the proposed strategy for dependency management f=
or these<br>
&gt; &gt; &gt; tests? I know there&#39;s some mail I&#39;m backlogged on ..=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; For some reason I did not need to add those libraries as dependen=
cies. If<br>
&gt; &gt; needed we can add them in requirements.txt for pyenv.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Probably pulled in as deps to what you do install; pinning them may be=
<br>
&gt; helpful for repeatability reasons and to avoid playing whackamole with=
 new<br>
&gt; pypi releases during the rc testing phase - speaking from experience w=
ith<br>
&gt; the other python test packages in the tree.<br>
<br>
<br>
Actually wait, I completely forgot something. These test scrips are run<br>
*inside* bios-bits VM, That is, we need not worry about ensuring the<br>
availability of these libraries and the deps they introduce ourselves.<br>
Bios bits takes care of it. It is a software written and maintained<br>
outside of QEMU.<br>
<br>
The only python script whose deps we need to worry about is the one I<br>
wrote myself - acpi-bits-test.py .<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Aha. Could I please ask for a comment in =
each .py file that isn&#39;t designed to run directly in the host v/environ=
ment? Just a small nod to the fact that it runs in a special VM so I can ex=
clude it from other regular maintenance operations / considerations for dep=
endency management in the host testing env.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"># Designed to run only in the biosbits VM.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">would be more than sufficient.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">--js</div></div>

--000000000000957fa605e39d8650--


