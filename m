Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32E612BFF
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 18:39:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opCGS-00011a-51; Sun, 30 Oct 2022 13:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opCGP-00010X-1Q
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:38:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opCGM-0003dW-BN
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 13:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667151501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MNySpBctSmiZhHIWnX1Q0sHaFk7y0dEv9m6MYrF9GKs=;
 b=f60kL5Kbn4X8kNzV5QR3QORE9RRWZ3e+ouArMvEVrKEUUmnWoOp31jpDpqUmmkZEXCgaHG
 If1xtYDG4d3NEzhplKsnEehgOqfQgQqxFXS3TEDsx00RXKxGHad1aSGKJkM7AJ1DuzV5bf
 TnIwDZHZtDmHOypnWkXXh0wbENazvOA=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-qGgdGuF5OI-Np-rQxm6_nw-1; Sun, 30 Oct 2022 13:38:20 -0400
X-MC-Unique: qGgdGuF5OI-Np-rQxm6_nw-1
Received: by mail-io1-f71.google.com with SMTP id
 v18-20020a5d9412000000b006bfdf74fa3bso6858864ion.3
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 10:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MNySpBctSmiZhHIWnX1Q0sHaFk7y0dEv9m6MYrF9GKs=;
 b=KmeawlrhfN3B6uimCOv7WPuHrj+7Y64RiupsSzlcAYs1mJz2Xj+ZTQicH79NQ7QUPA
 f3KNFl6laiEjZD57esuw74fADe+L32CPD8zPYm97d5uCgOsLBkgpfg2KUSt9aI4NFiIM
 0wpuNXcjo7Y50PzHpzDZHt1/OZw5JEisoNmruXEaaq7dMqhtRMWwk+s8I43NuBowWGtW
 0YGNdfTFI6FCjWdNbxDxMnZf5ZqP5nWKcW/SowB/FCKucVwe1VbJr8QleDxKnN+Dsm22
 6KlmMQj7zMwDwekV1Bv3P/I1wsBjnIkBNW6QMsvFHIQ7FiafKBcGuJBj6rwNDce624mm
 WwDw==
X-Gm-Message-State: ACrzQf0FCuSSnm8iwqGoa151FNGqafTokqimeLCtzIWHC88JSU2ToxXY
 C+Aw7Hxcfq5CLwTnuCg1oL2BUOT8U9xKui/9Z2rrEbd/arjRBKhpA5lppIXtRwwEPf1bYnB4PCZ
 Cd2S7OCGQXfd+OFyMl4eJrUgVDdzu9yk=
X-Received: by 2002:a05:6602:29d1:b0:6a9:d284:74a7 with SMTP id
 z17-20020a05660229d100b006a9d28474a7mr4829490ioq.22.1667151499530; 
 Sun, 30 Oct 2022 10:38:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM55HaEoVQ/5RefD5QlH0m9DhB+y7oWV9jOhH6iMTr/JOl5z1E7EZkBuAWEjW7IVfoa9eSdQLIQr4rAm9yzs650=
X-Received: by 2002:a05:6602:29d1:b0:6a9:d284:74a7 with SMTP id
 z17-20020a05660229d100b006a9d28474a7mr4829479ioq.22.1667151499211; Sun, 30
 Oct 2022 10:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-3-nsoffer@redhat.com>
 <81bd7016-70e7-b3de-2181-5610724f55d8@redhat.com>
In-Reply-To: <81bd7016-70e7-b3de-2181-5610724f55d8@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 30 Oct 2022 19:38:03 +0200
Message-ID: <CAMRbyysLRw6oLpagLyQR3KeRNcW_aPuckMvqVviWiHhhENNH2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] iotests: Test qemu-img checksum
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e5d60905ec43f415"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e5d60905ec43f415
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2022 at 4:31 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 01.09.22 16:32, Nir Soffer wrote:
> > Add simple tests creating an image with all kinds of extents, different
> > formats, different backing chain, different protocol, and different
> > image options. Since all images have the same guest visible content the=
y
> > must have the same checksum.
> >
> > To help debugging in case of failures, the output includes a json map o=
f
> > every test image.
> >
> > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> > ---
> >   tests/qemu-iotests/tests/qemu-img-checksum    | 149 +++++++++++++++++=
+
> >   .../qemu-iotests/tests/qemu-img-checksum.out  |  74 +++++++++
> >   2 files changed, 223 insertions(+)
> >   create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
> >   create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out
> >
> > diff --git a/tests/qemu-iotests/tests/qemu-img-checksum
> b/tests/qemu-iotests/tests/qemu-img-checksum
> > new file mode 100755
> > index 0000000000..3a85ba33f2
> > --- /dev/null
> > +++ b/tests/qemu-iotests/tests/qemu-img-checksum
> > @@ -0,0 +1,149 @@
> > +#!/usr/bin/env python3
> > +# group: rw auto quick
> > +#
> > +# Test cases for qemu-img checksum.
> > +#
> > +# Copyright (C) 2022 Red Hat, Inc.
> > +#
> > +# This program is free software; you can redistribute it and/or modify
> > +# it under the terms of the GNU General Public License as published by
> > +# the Free Software Foundation; either version 2 of the License, or
> > +# (at your option) any later version.
> > +#
> > +# This program is distributed in the hope that it will be useful,
> > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > +# GNU General Public License for more details.
> > +#
> > +# You should have received a copy of the GNU General Public License
> > +# along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
> > +
> > +import re
> > +
> > +import iotests
> > +
> > +from iotests import (
> > +    filter_testfiles,
> > +    qemu_img,
> > +    qemu_img_log,
> > +    qemu_io,
> > +    qemu_nbd_popen,
> > +)
> > +
> > +
> > +def checksum_available():
> > +    out =3D qemu_img("--help").stdout
> > +    return re.search(r"\bchecksum .+ filename\b", out) is not None
> > +
> > +
> > +if not checksum_available():
> > +    iotests.notrun("checksum command not available")
> > +
> > +iotests.script_initialize(
> > +    supported_fmts=3D["raw", "qcow2"],
> > +    supported_cache_modes=3D["none", "writeback"],
>
> It doesn=E2=80=99t work with writeback, though, because it uses -T none b=
elow.
>

Good point


>
> Which by the way is a heavy cost, because I usually run tests in tmpfs,
> where this won=E2=80=99t work.  Is there any way of not doing the -T none=
 below?
>

Testing using tempfs is problematic since you cannot test -T none. In oVirt
we alway use /var/tmp which usually uses something that supports direct I/O=
.

Do we have a way to specify cache mode in the tests, so we can use -T none
only when the option is set?


>
> > +    supported_protocols=3D["file", "nbd"],
> > +    required_fmts=3D["raw", "qcow2"],
> > +)
> > +
> > +print()
> > +print("=3D=3D=3D Test images =3D=3D=3D")
> > +print()
> > +
> > +disk_raw =3D iotests.file_path('raw')
> > +qemu_img("create", "-f", "raw", disk_raw, "10m")
> > +qemu_io("-f", "raw",
> > +        "-c", "write -P 0x1 0 2m",      # data
> > +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
> > +        "-c", "write -z 4m 2m",         # zero allocated
> > +        "-c", "write -z -u 6m 2m",      # zero hole
> > +                                        # unallocated
> > +        disk_raw)
> > +print(filter_testfiles(disk_raw))
> > +qemu_img_log("map", "--output", "json", disk_raw)
> > +
> > +disk_qcow2 =3D iotests.file_path('qcow2')
> > +qemu_img("create", "-f", "qcow2", disk_qcow2, "10m")
> > +qemu_io("-f", "qcow2",
> > +        "-c", "write -P 0x1 0 2m",      # data
> > +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
> > +        "-c", "write -z 4m 2m",         # zero allocated
> > +        "-c", "write -z -u 6m 2m",      # zero hole
> > +                                        # unallocated
> > +        disk_qcow2)
> > +print(filter_testfiles(disk_qcow2))
> > +qemu_img_log("map", "--output", "json", disk_qcow2)
>
> This isn=E2=80=99t how iotests work, generally.  When run with -qcow2 -fi=
le, it
> should only test qcow2 on file, not raw on file, not raw on nbd. Perhaps
> this way this test could even support other formats than qcow2 and raw.
>

For this type of tests, running the same code with raw, qcow2 (and other
formats)
and using file or nbd is the best way to test this feature - one test
verifies all the
use cases.

I can change this to use the current format (raw, qcow2, ...), protocol
(file, nbd, ...)
and cache value (none, writeback), but I'm not sure how this can work with
the
out files. The output from nbd is different from file. Maybe we need
different out
files for file and nbd (qemu-img-checksum.file.out,
qemu-img-checksum.nbd.out)?

Nir

--000000000000e5d60905ec43f415
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 26, 2022 at 4:31 PM Hanna Rei=
tz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 01.09.22 16:32, Nir Soffer wrote:<br>
&gt; Add simple tests creating an image with all kinds of extents, differen=
t<br>
&gt; formats, different backing chain, different protocol, and different<br=
>
&gt; image options. Since all images have the same guest visible content th=
ey<br>
&gt; must have the same checksum.<br>
&gt;<br>
&gt; To help debugging in case of failures, the output includes a json map =
of<br>
&gt; every test image.<br>
&gt;<br>
&gt; Signed-off-by: Nir Soffer &lt;<a href=3D"mailto:nsoffer@redhat.com" ta=
rget=3D"_blank">nsoffer@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/tests/qemu-img-checksum=C2=A0 =C2=A0 | =
149 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../qemu-iotests/tests/qemu-img-checksum.out=C2=A0 |=C2=A0=
 74 +++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 223 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100755 tests/qemu-iotests/tests/qemu-img-check=
sum<br>
&gt;=C2=A0 =C2=A0create mode 100644 tests/qemu-iotests/tests/qemu-img-check=
sum.out<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/tests/qemu-img-checksum b/tests/qemu-i=
otests/tests/qemu-img-checksum<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..3a85ba33f2<br>
&gt; --- /dev/null<br>
&gt; +++ b/tests/qemu-iotests/tests/qemu-img-checksum<br>
&gt; @@ -0,0 +1,149 @@<br>
&gt; +#!/usr/bin/env python3<br>
&gt; +# group: rw auto quick<br>
&gt; +#<br>
&gt; +# Test cases for qemu-img checksum.<br>
&gt; +#<br>
&gt; +# Copyright (C) 2022 Red Hat, Inc.<br>
&gt; +#<br>
&gt; +# This program is free software; you can redistribute it and/or modif=
y<br>
&gt; +# it under the terms of the GNU General Public License as published b=
y<br>
&gt; +# the Free Software Foundation; either version 2 of the License, or<b=
r>
&gt; +# (at your option) any later version.<br>
&gt; +#<br>
&gt; +# This program is distributed in the hope that it will be useful,<br>
&gt; +# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<=
br>
&gt; +# GNU General Public License for more details.<br>
&gt; +#<br>
&gt; +# You should have received a copy of the GNU General Public License<b=
r>
&gt; +# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://ww=
w.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.or=
g/licenses/</a>&gt;.<br>
&gt; +<br>
&gt; +import re<br>
&gt; +<br>
&gt; +import iotests<br>
&gt; +<br>
&gt; +from iotests import (<br>
&gt; +=C2=A0 =C2=A0 filter_testfiles,<br>
&gt; +=C2=A0 =C2=A0 qemu_img,<br>
&gt; +=C2=A0 =C2=A0 qemu_img_log,<br>
&gt; +=C2=A0 =C2=A0 qemu_io,<br>
&gt; +=C2=A0 =C2=A0 qemu_nbd_popen,<br>
&gt; +)<br>
&gt; +<br>
&gt; +<br>
&gt; +def checksum_available():<br>
&gt; +=C2=A0 =C2=A0 out =3D qemu_img(&quot;--help&quot;).stdout<br>
&gt; +=C2=A0 =C2=A0 return re.search(r&quot;\bchecksum .+ filename\b&quot;,=
 out) is not None<br>
&gt; +<br>
&gt; +<br>
&gt; +if not checksum_available():<br>
&gt; +=C2=A0 =C2=A0 iotests.notrun(&quot;checksum command not available&quo=
t;)<br>
&gt; +<br>
&gt; +iotests.script_initialize(<br>
&gt; +=C2=A0 =C2=A0 supported_fmts=3D[&quot;raw&quot;, &quot;qcow2&quot;],<=
br>
&gt; +=C2=A0 =C2=A0 supported_cache_modes=3D[&quot;none&quot;, &quot;writeb=
ack&quot;],<br>
<br>
It doesn=E2=80=99t work with writeback, though, because it uses -T none bel=
ow.<br></blockquote><div><br></div><div>Good point</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Which by the way is a heavy cost, because I usually run tests in tmpfs, <br=
>
where this won=E2=80=99t work.=C2=A0 Is there any way of not doing the -T n=
one below?<br></blockquote><div><br></div><div>Testing using tempfs is prob=
lematic since you cannot test -T none. In oVirt=C2=A0</div><div>we alway us=
e /var/tmp which usually uses something that supports direct I/O.</div><div=
><br></div><div>Do we have a way to specify cache mode in the tests, so we =
can use -T none</div><div>only when the option is set?</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 supported_protocols=3D[&quot;file&quot;, &quot;nbd&quot=
;],<br>
&gt; +=C2=A0 =C2=A0 required_fmts=3D[&quot;raw&quot;, &quot;qcow2&quot;],<b=
r>
&gt; +)<br>
&gt; +<br>
&gt; +print()<br>
&gt; +print(&quot;=3D=3D=3D Test images =3D=3D=3D&quot;)<br>
&gt; +print()<br>
&gt; +<br>
&gt; +disk_raw =3D iotests.file_path(&#39;raw&#39;)<br>
&gt; +qemu_img(&quot;create&quot;, &quot;-f&quot;, &quot;raw&quot;, disk_ra=
w, &quot;10m&quot;)<br>
&gt; +qemu_io(&quot;-f&quot;, &quot;raw&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -P 0x1 0 2m&q=
uot;,=C2=A0 =C2=A0 =C2=A0 # data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -P 0x0 2m 2m&=
quot;,=C2=A0 =C2=A0 =C2=A0# data with zeroes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -z 4m 2m&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# zero allocated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -z -u 6m 2m&q=
uot;,=C2=A0 =C2=A0 =C2=A0 # zero hole<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # un=
allocated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_raw)<br>
&gt; +print(filter_testfiles(disk_raw))<br>
&gt; +qemu_img_log(&quot;map&quot;, &quot;--output&quot;, &quot;json&quot;,=
 disk_raw)<br>
&gt; +<br>
&gt; +disk_qcow2 =3D iotests.file_path(&#39;qcow2&#39;)<br>
&gt; +qemu_img(&quot;create&quot;, &quot;-f&quot;, &quot;qcow2&quot;, disk_=
qcow2, &quot;10m&quot;)<br>
&gt; +qemu_io(&quot;-f&quot;, &quot;qcow2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -P 0x1 0 2m&q=
uot;,=C2=A0 =C2=A0 =C2=A0 # data<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -P 0x0 2m 2m&=
quot;,=C2=A0 =C2=A0 =C2=A0# data with zeroes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -z 4m 2m&quot=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# zero allocated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;-c&quot;, &quot;write -z -u 6m 2m&q=
uot;,=C2=A0 =C2=A0 =C2=A0 # zero hole<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # un=
allocated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 disk_qcow2)<br>
&gt; +print(filter_testfiles(disk_qcow2))<br>
&gt; +qemu_img_log(&quot;map&quot;, &quot;--output&quot;, &quot;json&quot;,=
 disk_qcow2)<br>
<br>
This isn=E2=80=99t how iotests work, generally.=C2=A0 When run with -qcow2 =
-file, it <br>
should only test qcow2 on file, not raw on file, not raw on nbd. Perhaps <b=
r>
this way this test could even support other formats than qcow2 and raw.<br>=
</blockquote><div><br></div><div>For this type of tests, running the same c=
ode with raw, qcow2 (and other formats)</div><div>and using file or nbd is =
the best way to test this feature - one test verifies all the=C2=A0</div><d=
iv>use cases.</div><div><br></div><div>I can change this to use the current=
 format (raw, qcow2, ...), protocol (file, nbd, ...)</div><div>and cache va=
lue (none, writeback), but I&#39;m not sure how this can work with the</div=
><div>out files. The output from nbd is different from file. Maybe we need =
different out</div><div>files for file and nbd (qemu-img-checksum.file.out,=
 qemu-img-checksum.nbd.out)?</div><div><br></div><div>Nir</div></div></div>

--000000000000e5d60905ec43f415--


