Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799A693A1C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 22:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRJSr-00021f-BN; Sun, 12 Feb 2023 16:00:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pRJSm-0001yy-Hj
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 16:00:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pRJSH-0004GR-OH
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 16:00:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676235611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IJIp+l4KASpWqL/IUzqjMmqfJv/LFG1qTd7v9CQxS4k=;
 b=Bx9hv8ttNUVtnKyDJKLw+N7OFE0f/2rYciOIFpMTvt4zY7yRWo4tWupk6oj8dGj3ZdB02+
 nKwRzST7osc3JTVZb2RKS44vglcdz8aAK4rMAQVKAMtFujGo0Pe7/dAMkYHPSu73gkO0C2
 mTWhZ0jdnWwDvSchjgnyeP4BkcSMFt0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-ZMluWKjOMnu_fHmiv-qiMg-1; Sun, 12 Feb 2023 16:00:09 -0500
X-MC-Unique: ZMluWKjOMnu_fHmiv-qiMg-1
Received: by mail-ej1-f70.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso6332967ejz.15
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 13:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IJIp+l4KASpWqL/IUzqjMmqfJv/LFG1qTd7v9CQxS4k=;
 b=E8C635OGDoNmi8vdtSRVpTbfFRLRquNttTlofCzz8kTSK7s7Nl/6VfUJgb9olm5YKC
 +bncdN2tjSuRdQcT8XwcAIhrxEwwULIoibrKHVmytEmAz62BqscCGYHr2FuXGIz1/LCS
 +QzFHQUoShbquU5VWxBIQX8nM1eTRsxy3qeB7GWPoAtMmcQXQ6gzx3hxgVTJ2DqUAxGO
 7xdkQcyN7gWn/40iueWqvSAzDIsZFOUWo5bsuRQkqvWriUTjoThsmToIyK7pZ25e8Lia
 mt2SwWWvOGn6BptT5MTGqT8cRE+UzEkdvyqOxspca39AYd9f1FvQE4wn9W+0JW6MAO32
 U+UQ==
X-Gm-Message-State: AO0yUKV7lQASJpvVOh5X+epbXacBwdOAVVKDIrJOdQEF2RfLRqWYVo+o
 s0KsdfpI6EzDQzSuR/RDBld3My1btMgo+I0TI/hxDO1DVJ/8ftnODnAT8XUk4uTOSJCmjCqqNt9
 s1BvBXFC21dKGDEiW6NxACrBYikRfEDQ=
X-Received: by 2002:a17:907:366:b0:88d:ba79:4310 with SMTP id
 rs6-20020a170907036600b0088dba794310mr4204906ejb.0.1676235608326; 
 Sun, 12 Feb 2023 13:00:08 -0800 (PST)
X-Google-Smtp-Source: AK7set+GnwqI5cdKNquNVG0kxl4QpQiLnSJKg0mYeERtmFzQPYDSkobv8Z3v3+PVMSguyV43toaofXkehYt/tB3gU7o=
X-Received: by 2002:a17:907:366:b0:88d:ba79:4310 with SMTP id
 rs6-20020a170907036600b0088dba794310mr4204887ejb.0.1676235608163; Sun, 12 Feb
 2023 13:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87sfff3t9l.fsf@pond.sub.org>
In-Reply-To: <87sfff3t9l.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 13 Feb 2023 00:59:56 +0400
Message-ID: <CAMxuvayJup9Ld+HfcTiq1CG-JQqzujsvjQAGBjoJZjcz7jZPXg@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fc1c9905f48703d5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

--000000000000fc1c9905f48703d5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus

On Thu, Feb 9, 2023 at 4:42 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The generated code doesn't quite handle the conditional arguments.
> > For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #if
> > conditions. See generated code in qmp_marshal_test_if_cmd().
> >
> > Note that if there are multiple optional arguments at the last position=
,
> > there might be compilation issues due to extra comas. I left an assert
> > and FIXME for later.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Fails "make check" for me:
>
> 2/2 qemu:qapi-schema+qapi-frontend / QAPI schema regression tests
> FAIL            0.09s   exit status 1
> >>> MALLOC_PERTURB_=3D241 PYTHONPATH=3D/work/armbru/qemu/scripts
> /usr/bin/python3 [...]
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95
> stdout:
> --- /work/armbru/qemu/bld-clang/../tests/qapi-schema/qapi-schema-test.out
> +++
> @@ -297,6 +297,7 @@
>      member foo: TestIfStruct optional=3DFalse
>      member bar: TestIfEnumList optional=3DFalse
>          if TEST_IF_EVT_BAR
> +    member baz: int optional=3DFalse
>      if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
>  event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
>      boxed=3DFalse
> stderr:
> qapi-schema-test FAIL
>

This is trivially fixed. Can you review the patch, and in particular
comment on the FIXME left, whether it is acceptable?

thanks

--000000000000fc1c9905f48703d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Markus<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 9, 2023 at 4:42 =
PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcan=
dre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The generated code doesn&#39;t quite handle the conditional arguments.=
<br>
&gt; For example, &#39;bar&#39; in &#39;test-if-cmd&#39; is not correctly s=
urrounded by #if<br>
&gt; conditions. See generated code in qmp_marshal_test_if_cmd().<br>
&gt;<br>
&gt; Note that if there are multiple optional arguments at the last positio=
n,<br>
&gt; there might be compilation issues due to extra comas. I left an assert=
<br>
&gt; and FIXME for later.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
Fails &quot;make check&quot; for me:<br>
<br>
2/2 qemu:qapi-schema+qapi-frontend / QAPI schema regression tests=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.09s=C2=A0=
 =C2=A0exit status 1<br>
&gt;&gt;&gt; MALLOC_PERTURB_=3D241 PYTHONPATH=3D/work/armbru/qemu/scripts /=
usr/bin/python3 [...]<br>
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80=C2=A0 =E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95<br>
stdout:<br>
--- /work/armbru/qemu/bld-clang/../tests/qapi-schema/qapi-schema-test.out<b=
r>
+++ <br>
@@ -297,6 +297,7 @@<br>
=C2=A0 =C2=A0 =C2=A0member foo: TestIfStruct optional=3DFalse<br>
=C2=A0 =C2=A0 =C2=A0member bar: TestIfEnumList optional=3DFalse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if TEST_IF_EVT_BAR<br>
+=C2=A0 =C2=A0 member baz: int optional=3DFalse<br>
=C2=A0 =C2=A0 =C2=A0if {&#39;all&#39;: [&#39;TEST_IF_EVT&#39;, &#39;TEST_IF=
_STRUCT&#39;]}<br>
=C2=A0event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg<br>
=C2=A0 =C2=A0 =C2=A0boxed=3DFalse<br>
stderr:<br>
qapi-schema-test FAIL<br></blockquote><div><br></div><div>This is trivially=
 fixed. Can you review the patch, and in particular comment on the FIXME le=
ft, whether it is acceptable?</div><div><br></div><div>thanks <br></div></d=
iv></div>

--000000000000fc1c9905f48703d5--


