Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99B04E445A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:39:19 +0100 (CET)
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhXS-0000qG-Ui
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:39:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhVR-0007t5-2h
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhVL-00006H-V4
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647967027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRrsHg+ZqVZ0y13DygtR9DKXuy6BNBZ6aoR7zhiUdX4=;
 b=LUXxW7btsSjNUP1DmVz2ACMxpz1cELLO00gSIwfGTr/F+dUUAloJvJDmptbQW9AkPIAnrT
 bq+O9JsoLLv6gxPSJeE76CVp5MTVBkQ6l6TyXLCQ5av2bZ1HxZvzxQ3JavV7SW4W8F1XIq
 BzRpvqhKWzZ5fBQqesyjxgm997ovDnM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-PNdLM0G6OvOpneLq6SN6Cw-1; Tue, 22 Mar 2022 12:37:05 -0400
X-MC-Unique: PNdLM0G6OvOpneLq6SN6Cw-1
Received: by mail-vk1-f199.google.com with SMTP id
 e14-20020ac5c14e000000b0033ef6f852dcso1064344vkk.19
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HRrsHg+ZqVZ0y13DygtR9DKXuy6BNBZ6aoR7zhiUdX4=;
 b=evlw2hJ7F2o3qhTmDqf0ZSjheel4GQCwPceJjuYWH77MCSC1fcjOltJwbYFE/+4gvL
 ixHdyNvxxeuD5HeNrXGBJmLD8CJYDBTQ3vLx10xQ9x7Yy5E8IEUj00wIrz21wvelNK8v
 1PNYIM0zUSN8un2lwKLcS+SnUKWTvucnnBeJA/80EXTkhASMQhXBDFD43S4pExilzqHo
 meif3EVqBgQ9q2zlsLGvShEaTODXNeMul47ejmb0uyjZWCpRpoNovtSmx68H+rdf75m2
 Axb21cAafaN0HKSom6eIXje3mh6ZUbV6MJ1pzAoGqVcZNtX0JpdBh70/r3TNClDUx3lN
 P2YA==
X-Gm-Message-State: AOAM532MNma73A3GPJBt3XBmj0NRNAV+g1H1TQHj7bukJlpUPRQaQVot
 VE1Do9IQiLiZkHZNQebd2ttTfGqpC9zJRk7wd0kRL0lQRS/+jcrAW/421EtMUC6aT0QwN9f1Z7+
 God4BvQ0aocL2UUmmb9w5ULNL3AvbMFU=
X-Received: by 2002:a05:6122:21aa:b0:33f:1889:b254 with SMTP id
 j42-20020a05612221aa00b0033f1889b254mr4085472vkd.26.1647967024909; 
 Tue, 22 Mar 2022 09:37:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzCdKcgWjcmEn3PFEwW1KUEtfLQj43SJR/vmIvoTYs+TqauHKkITgygLna/S5biLXBezZmWOr8Tw5LpB9WdlU=
X-Received: by 2002:a05:6122:21aa:b0:33f:1889:b254 with SMTP id
 j42-20020a05612221aa00b0033f1889b254mr4085464vkd.26.1647967024676; Tue, 22
 Mar 2022 09:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-11-jsnow@redhat.com>
 <258fcd46-38a6-2258-a39f-4126be26c8ce@redhat.com>
In-Reply-To: <258fcd46-38a6-2258-a39f-4126be26c8ce@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 12:36:55 -0400
Message-ID: <CAFn=p-Z2fEck2Zd2VYFCOPcYjbfGBt4gkDU0Lvx8ATFaHULeaQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] iotests/245: fixup
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001b9cca05dad139e5"
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001b9cca05dad139e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022, 12:30 PM Hanna Reitz <hreitz@redhat.com> wrote:

> On 18.03.22 21:36, John Snow wrote:
> > (Merge with prior patch.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/242 | 2 +-
> >   tests/qemu-iotests/245 | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
> > index 4b7ec16af6..ecc851582a 100755
> > --- a/tests/qemu-iotests/242
> > +++ b/tests/qemu-iotests/242
> > @@ -22,7 +22,7 @@
> >   import iotests
> >   import json
> >   import struct
> > -from iotests import qemu_img_create, qemu_io, qemu_img_info, \
> > +from iotests import qemu_img_create, qemu_io_log, qemu_img_info, \
> >       file_path, img_info_log, log, filter_qemu_io
> >
> >   iotests.script_initialize(supported_fmts=3D['qcow2'],
> > diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
> > index 8cbed7821b..efdad1a0c4 100755
> > --- a/tests/qemu-iotests/245
> > +++ b/tests/qemu-iotests/245
> > @@ -217,7 +217,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
> >       # Reopen an image several times changing some of its options
> >       def test_reopen(self):
> >           # Check whether the filesystem supports O_DIRECT
> > -        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c',
> 'quit', hd_path[0]):
> > +        if 'O_DIRECT' in qemu_io('-f', 'raw', '-t', 'none', '-c',
> 'quit', hd_path[0]).stdout:
>
> This is to verify that O_DIRECT works or not.  If it doesn=E2=80=99t work=
, this
> will fail, so we need to pass check=3DFalse here.
>
> (Or this test fails on tmpfs.)
>
> Hanna
>

Oh, I didn't realize a solitary "quit" command could still fail. Thanks for
the tip.

--0000000000001b9cca05dad139e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 22, 2022, 12:30 PM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 18.03.22 21:36, John Snow wrote:<br>
&gt; (Merge with prior patch.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/242 | 2 +-<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/245 | 2 +-<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242<br>
&gt; index 4b7ec16af6..ecc851582a 100755<br>
&gt; --- a/tests/qemu-iotests/242<br>
&gt; +++ b/tests/qemu-iotests/242<br>
&gt; @@ -22,7 +22,7 @@<br>
&gt;=C2=A0 =C2=A0import iotests<br>
&gt;=C2=A0 =C2=A0import json<br>
&gt;=C2=A0 =C2=A0import struct<br>
&gt; -from iotests import qemu_img_create, qemu_io, qemu_img_info, \<br>
&gt; +from iotests import qemu_img_create, qemu_io_log, qemu_img_info, \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file_path, img_info_log, log, filter_qemu_io=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0iotests.script_initialize(supported_fmts=3D[&#39;qcow2&#39=
;],<br>
&gt; diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245<br>
&gt; index 8cbed7821b..efdad1a0c4 100755<br>
&gt; --- a/tests/qemu-iotests/245<br>
&gt; +++ b/tests/qemu-iotests/245<br>
&gt; @@ -217,7 +217,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Reopen an image several times changing som=
e of its options<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0def test_reopen(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check whether the filesystem=
 supports O_DIRECT<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;O_DIRECT&#39; in qemu_io(&#39;-f&=
#39;, &#39;raw&#39;, &#39;-t&#39;, &#39;none&#39;, &#39;-c&#39;, &#39;quit&=
#39;, hd_path[0]):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;O_DIRECT&#39; in qemu_io(&#39;-f&=
#39;, &#39;raw&#39;, &#39;-t&#39;, &#39;none&#39;, &#39;-c&#39;, &#39;quit&=
#39;, hd_path[0]).stdout:<br>
<br>
This is to verify that O_DIRECT works or not.=C2=A0 If it doesn=E2=80=99t w=
ork, this <br>
will fail, so we need to pass check=3DFalse here.<br>
<br>
(Or this test fails on tmpfs.)<br>
<br>
Hanna<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Oh, I didn&#39;t realize a solitary &quot;quit&quot; command could sti=
ll fail. Thanks for the tip.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><br></div></div>

--0000000000001b9cca05dad139e5--


