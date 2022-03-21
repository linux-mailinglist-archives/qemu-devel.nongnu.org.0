Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8F4E2DDB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:26:11 +0100 (CET)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKrC-0004ts-KZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:26:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWKgy-0008DI-0A
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWKgs-00008q-CI
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P7dnso3UntHv5I7MNeZbmzuPCzzfv/ruH36Ko+2SjQs=;
 b=Eh0bxCLFCk4m9406s/8Msf4QLq82XQGVl2NYQCIttnAow/BCvPI+D1gG4l96wgo4F+a6kN
 tLw63kqk52r/cfJC2dwcZ+GC4CuWx260CJrs0WVor0XjQ3rAOYzaNCXfBoyyUth4GHSXAN
 Z46su3Hr9ppdgZNytUeYQAJ7PP7ytFo=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-dUfXDeCkOeqOGS63wXoACw-1; Mon, 21 Mar 2022 12:15:25 -0400
X-MC-Unique: dUfXDeCkOeqOGS63wXoACw-1
Received: by mail-vs1-f69.google.com with SMTP id
 d19-20020a67c493000000b00324db4e7285so932846vsk.12
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P7dnso3UntHv5I7MNeZbmzuPCzzfv/ruH36Ko+2SjQs=;
 b=g2rBgLnKFWnURFAUV3cQpjZilSbH8C6GsGPn1cUIPS5bSxIue9hZm7/rBBs7mNeaOm
 EjscwoAhzNA033pQvdaFmtx5/HesnjYHjUNNHj42Iw4CkrnmY1TruQsN133awR9H3w0f
 hKBy+Nlu8m7tY4e66kcTbgz18hhUmf03IXNgHex2zKQ+ojZyURh+H6WgRdo8usjJh/L0
 vimGeMQh0vKvo5CyUHy2LaDRkBR2pxQLTjLYKc3YK2XHkDP00+iZuXinhU8aD6H1mtcz
 CfnI7Qm89E1sob5zgWnbfriuhE5P57DIQImqyMtjIQejaLeQ5hj+JcBWEBuQDB5mY0NF
 XfWQ==
X-Gm-Message-State: AOAM533BdyKJ1hhNI0duJGXT++z0+6c1E5Y1Jwh5B6s2QFBJLQYI0uWa
 LD1lpYO7S+uXI+92AOdt8ndAi/tERRo6aBohVYybE4o+IRA2ADvA1Sqv5Jk0xGjQc+mgYVN11Gw
 aCjmQCxth/Q0p+DBWSm9SWNDD9j3XJ/E=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr6784777vsv.35.1647879325097; 
 Mon, 21 Mar 2022 09:15:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1SSxrWSBMAW3jzDFjmr018lLA/4eI+GtKKm9e3eJt/TG+6obkLC9jazfmakkAgzw4WfBcSu5SvlrqGKIfnJI=
X-Received: by 2002:a05:6102:1592:b0:324:d1a2:5718 with SMTP id
 g18-20020a056102159200b00324d1a25718mr6784697vsv.35.1647879323285; Mon, 21
 Mar 2022 09:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220317234937.569525-1-jsnow@redhat.com>
 <20220317234937.569525-11-jsnow@redhat.com>
 <20220321142437.tcbchgpht3mluhp6@redhat.com>
In-Reply-To: <20220321142437.tcbchgpht3mluhp6@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 21 Mar 2022 12:15:13 -0400
Message-ID: <CAFn=p-Y=seq40r=qMS-tsvmJQkRjgPgj-Ok8vYv2E773cYUDkA@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] iotests: add qemu_img_map() function
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b292b405dabccdd1"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b292b405dabccdd1
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022, 10:24 AM Eric Blake <eblake@redhat.com> wrote:

> On Thu, Mar 17, 2022 at 07:49:29PM -0400, John Snow wrote:
> > Add a qemu_img_map() function by analogy with qemu_img_measure(),
> > qemu_img_check(), and qemu_img_info() that all return JSON information.
> >
> > Replace calls to qemu_img_pipe('map', '--output=json', ...) with this
> > new function, which provides better diagnostic information on failure.
> >
> > Note: The output for iotest 211 changes, because logging JSON after it
> > was deserialized by Python behaves a little differently than logging the
> > raw JSON document string itself.
> > (iotests.log() sorts the keys for Python 3.6 support.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
>
> > +++ b/tests/qemu-iotests/211.out
>
> > @@ -55,9 +53,7 @@ file format: IMGFMT
> >  virtual size: 32 MiB (33554432 bytes)
> >  cluster_size: 1048576
> >
> > -[{ "start": 0, "length": 3072, "depth": 0, "present": true, "zero":
> false, "data": true, "offset": 1024},
> > -{ "start": 3072, "length": 33551360, "depth": 0, "present": true,
> "zero": true, "data": true, "offset": 4096}]
> > -
> > +[{"data": true, "depth": 0, "length": 3072, "offset": 1024, "present":
> true, "start": 0, "zero": false}, {"data": true, "depth": 0, "length":
> 33551360, "offset": 4096, "present": true, "start": 3072, "zero": true}]
>
> The change in format can produce really long lines for a more complex
> map, which can introduce its own problems in legibility. But I can
> live with it.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org


Yeah, we don't have to print out the entire thing, either. We could also
pretty-print it if we want to.

(Once we drop 3.6 (which I know is contested as to when we can do it) we
can remove a lot of our special QMP sorting code and just start printing
the raw JSON objects, which makes dealing with qmp a lot easier in
diff-based tests.)

The point was more just to remove any copy-pastables using the JSON and
provide only the "one good way". This patch in and of itself is otherwise
pretty lateral.


>

--000000000000b292b405dabccdd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Mar 21, 2022, 10:24 AM Eric Blake &lt;<a href=
=3D"mailto:eblake@redhat.com" target=3D"_blank" rel=3D"noreferrer">eblake@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, =
Mar 17, 2022 at 07:49:29PM -0400, John Snow wrote:<br>
&gt; Add a qemu_img_map() function by analogy with qemu_img_measure(),<br>
&gt; qemu_img_check(), and qemu_img_info() that all return JSON information=
.<br>
&gt; <br>
&gt; Replace calls to qemu_img_pipe(&#39;map&#39;, &#39;--output=3Djson&#39=
;, ...) with this<br>
&gt; new function, which provides better diagnostic information on failure.=
<br>
&gt; <br>
&gt; Note: The output for iotest 211 changes, because logging JSON after it=
<br>
&gt; was deserialized by Python behaves a little differently than logging t=
he<br>
&gt; raw JSON document string itself.<br>
&gt; (iotests.log() sorts the keys for Python 3.6 support.)<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
<br>
&gt; +++ b/tests/qemu-iotests/211.out<br>
<br>
&gt; @@ -55,9 +53,7 @@ file format: IMGFMT<br>
&gt;=C2=A0 virtual size: 32 MiB (33554432 bytes)<br>
&gt;=C2=A0 cluster_size: 1048576<br>
&gt;=C2=A0 <br>
&gt; -[{ &quot;start&quot;: 0, &quot;length&quot;: 3072, &quot;depth&quot;:=
 0, &quot;present&quot;: true, &quot;zero&quot;: false, &quot;data&quot;: t=
rue, &quot;offset&quot;: 1024},<br>
&gt; -{ &quot;start&quot;: 3072, &quot;length&quot;: 33551360, &quot;depth&=
quot;: 0, &quot;present&quot;: true, &quot;zero&quot;: true, &quot;data&quo=
t;: true, &quot;offset&quot;: 4096}]<br>
&gt; -<br>
&gt; +[{&quot;data&quot;: true, &quot;depth&quot;: 0, &quot;length&quot;: 3=
072, &quot;offset&quot;: 1024, &quot;present&quot;: true, &quot;start&quot;=
: 0, &quot;zero&quot;: false}, {&quot;data&quot;: true, &quot;depth&quot;: =
0, &quot;length&quot;: 33551360, &quot;offset&quot;: 4096, &quot;present&qu=
ot;: true, &quot;start&quot;: 3072, &quot;zero&quot;: true}]<br>
<br>
The change in format can produce really long lines for a more complex<br>
map, which can introduce its own problems in legibility. But I can<br>
live with it.<br>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">eblake@redhat.com</a>&gt;<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer noreferrer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.=
org" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">libvirt.org=
</a></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Yeah, we don&#39;t have to print out the entire thing, either. We could als=
o pretty-print it if we want to.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">(Once we drop 3.6 (which I know is contested as to when we can do=
 it) we can remove a lot of our special QMP sorting code and just start pri=
nting the raw JSON objects, which makes dealing with qmp a lot easier in di=
ff-based tests.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">The poi=
nt was more just to remove any copy-pastables using the JSON and provide on=
ly the &quot;one good way&quot;. This patch in and of itself is otherwise p=
retty lateral.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
</blockquote></div></div></div>

--000000000000b292b405dabccdd1--


