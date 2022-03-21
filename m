Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938D64E2DCD
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:24:18 +0100 (CET)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKpN-0001nL-44
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:24:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWKm7-0007RZ-PO
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWKm5-0003c3-J9
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647879652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DV80UT0zkm1u+vklCus3q/t03wpQeiegUDJUpHtc7XQ=;
 b=Lr8uxCsltnjQ8Sl2O2jSPHBceU3pfqEEK/DXOphBONUBF0RYKQtEptWJNm2jPA5Ox215jr
 6YeY5Ls6tI5CZ/CVDuvrdcBfLivzI2XlFeeQYsGEL6TJsITt8O8433GTwlbED9fadYuYW0
 Gm8wLS4jDkgzopqZYGx26NJLZLZQASM=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-eKCLBoD8MjKx1aZ1BXfalw-1; Mon, 21 Mar 2022 12:20:51 -0400
X-MC-Unique: eKCLBoD8MjKx1aZ1BXfalw-1
Received: by mail-vs1-f72.google.com with SMTP id
 n7-20020a0561020a8700b00322bc971ed4so1417102vsg.15
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DV80UT0zkm1u+vklCus3q/t03wpQeiegUDJUpHtc7XQ=;
 b=RKeGJvR3bwqHWVzRrWAQKsnssuq/zCrRJlhnIRBeOnPwzaMmZ30tLa6uJII2XCIMjo
 wsLwma/L8QwHuJeIdcmam+tCN4Of7Zls/UcpuLspq2FwsdIhRf8KagllueGLQYu3uLGx
 c/Ynh/gfQPBMAHuKoGO+BguVDhTrqVhtY9TFbirQD/MHSdR7v57DdWNjr8CItVvOuQL8
 AABaPB4zCAMxyH9HHuEvCzJ5t8wXGRfrZkF+Jcdi8YQ+OndD1DxXVRd8dphvP/zjG1Nf
 xWzPpI7ijMOVEv3YgJHSYtmbYxP+v4dXpp6CvKIt8H2eOmheVfDUm9aSynYwLR29nECh
 mbFA==
X-Gm-Message-State: AOAM531oqteXx0WfFfEBs5wUi3nFV90jvRsQiY7YeDPcLyUUQ1TCKqa0
 NaZPtm+UIDxyEHmyQ5zTu/21FiWS9G3HrMvnseZsFcxE2D4xcg6f0ZECqa0IN8wXQnjje0/FBt7
 +kDWjp8Dv2cXxX9yggB6IBiVpLdJYPGU=
X-Received: by 2002:a05:6122:992:b0:33f:2253:436 with SMTP id
 g18-20020a056122099200b0033f22530436mr1769786vkd.3.1647879650291; 
 Mon, 21 Mar 2022 09:20:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZuZs0lhkS4XXku8sMSwMCBuUrapKWTGsoKObxofsglUb8PhFEW/oObhVNxlAisGwzAYl0aZCte6xseCLai2I=
X-Received: by 2002:a05:6122:992:b0:33f:2253:436 with SMTP id
 g18-20020a056122099200b0033f22530436mr1769771vkd.3.1647879650019; Mon, 21 Mar
 2022 09:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-6-jsnow@redhat.com>
 <20220321151307.mvf4zob2sr4fqobq@redhat.com>
In-Reply-To: <20220321151307.mvf4zob2sr4fqobq@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 21 Mar 2022 12:20:40 -0400
Message-ID: <CAFn=p-b4nzc0RGBfs84wxKXDis4gczmxodoutAfPQ8sr34h9eQ@mail.gmail.com>
Subject: Re: [PATCH 05/15] iotests: create generic qemu_tool() function
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002c20a505dabce145"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002c20a505dabce145
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022, 11:13 AM Eric Blake <eblake@redhat.com> wrote:

> On Fri, Mar 18, 2022 at 04:36:45PM -0400, John Snow wrote:
> > reimplement qemu_img() in terms of qemu_tool() in preparation for doing
> > the same with qemu_io().
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/iotests.py | 37 +++++++++++++++++++++++------------
> >  1 file changed, 24 insertions(+), 13 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/iotests.py
> b/tests/qemu-iotests/iotests.py
> > index 6cd8374c81..974a2b0c8d 100644
> > --- a/tests/qemu-iotests/iotests.py
> > +++ b/tests/qemu-iotests/iotests.py
> > @@ -207,15 +207,13 @@ def qemu_img_create_prepare_args(args: List[str])
> -> List[str]:
> >
> >      return result
> >
> > -def qemu_img(*args: str, check: bool =3D True, combine_stdio: bool =3D=
 True
> > +
> > +def qemu_tool(*args: str, check: bool =3D True, combine_stdio: bool =
=3D True
> >               ) -> subprocess.CompletedProcess[str]:
>
> Does this line need reindentation?
>

Huh, I'll check. Maybe I fixed this by accident in a later patch and didn't
notice. Or maybe git diff is playing tricks on me.


> > @@ -227,14 +225,13 @@ def qemu_img(*args: str, check: bool =3D True,
> combine_stdio: bool =3D True
> >          handled, the command-line, return code, and all console output
> >          will be included at the bottom of the stack trace.
> >
> > -    :return: a CompletedProcess. This object has args, returncode, and
> > -        stdout properties. If streams are not combined, it will also
> > -        have a stderr property.
> > +    :return:
> > +        A CompletedProcess. This object has args, returncode, and stdo=
ut
> > +        properties. If streams are not combined, it will also have a
> > +        stderr property.
>
> Should this reflow be squashed in some earlier patch?
>

Aw, you caught me. =F0=9F=98=85

I need to respin the qemu-img stuff anyway due to CI failures, so I can fix
it where it appears first.

(When I wrote this, I didn't realize that the qemu-img series was failing
CI yet.)


> As those are both cosemetic only,
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--0000000000002c20a505dabce145
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Mar 21, 2022, 11:13 AM Eric Blake &lt;<a href=
=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Fri, Mar 18, 2022 at 04:36:45PM -0400, John =
Snow wrote:<br>
&gt; reimplement qemu_img() in terms of qemu_tool() in preparation for doin=
g<br>
&gt; the same with qemu_io().<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/qemu-iotests/iotests.py | 37 +++++++++++++++++++++++------=
------<br>
&gt;=C2=A0 1 file changed, 24 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotest=
s.py<br>
&gt; index 6cd8374c81..974a2b0c8d 100644<br>
&gt; --- a/tests/qemu-iotests/iotests.py<br>
&gt; +++ b/tests/qemu-iotests/iotests.py<br>
&gt; @@ -207,15 +207,13 @@ def qemu_img_create_prepare_args(args: List[str]=
) -&gt; List[str]:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return result<br>
&gt;=C2=A0 <br>
&gt; -def qemu_img(*args: str, check: bool =3D True, combine_stdio: bool =
=3D True<br>
&gt; +<br>
&gt; +def qemu_tool(*args: str, check: bool =3D True, combine_stdio: bool =
=3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0) -&gt; subproce=
ss.CompletedProcess[str]:<br>
<br>
Does this line need reindentation?<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Huh, I&#39;ll check. Maybe I fixed this b=
y accident in a later patch and didn&#39;t notice. Or maybe git diff is pla=
ying tricks on me.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; @@ -227,14 +225,13 @@ def qemu_img(*args: str, check: bool =3D True, c=
ombine_stdio: bool =3D True<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handled, the command-line, return co=
de, and all console output<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 will be included at the bottom of th=
e stack trace.<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 :return: a CompletedProcess. This object has args, retu=
rncode, and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdout properties. If streams are not com=
bined, it will also<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 have a stderr property.<br>
&gt; +=C2=A0 =C2=A0 :return:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 A CompletedProcess. This object has args,=
 returncode, and stdout<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 properties. If streams are not combined, =
it will also have a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr property.<br>
<br>
Should this reflow be squashed in some earlier patch?<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Aw, you caught me. =F0=
=9F=98=85</div><div dir=3D"auto"><br></div><div dir=3D"auto">I need to resp=
in the qemu-img stuff anyway due to CI failures, so I can fix it where it a=
ppears first.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(When I wr=
ote this, I didn&#39;t realize that the qemu-img series was failing CI yet.=
)</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
<br>
As those are both cosemetic only,<br>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">eblake@redhat.com</a>&gt;<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div></div>

--0000000000002c20a505dabce145--


