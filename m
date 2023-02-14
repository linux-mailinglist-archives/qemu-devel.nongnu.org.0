Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5822696EB4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 21:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2IW-0004Dt-SB; Tue, 14 Feb 2023 15:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pS2IS-0004D0-D4
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:53:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pS2IQ-0006Gw-RU
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676407981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oPB4nEisn5ruMTIupilldJ+EyZhIhtxPmv/YXkSOczo=;
 b=go0Rr61tYfST0O0R8DG0GTxJvjlVdJnisT2aU7ImmOy2I5x2eahSleRAxj8OByPnm2Urc9
 moyVCC9f0MwLIzv+2UYouX31jOV6OG2nYMhqtu3Sv8qJe6CAM4It6oDhhdku9bX1s8RNCG
 aSmlaj4UTmEaM7WeReq6T9kq1Bmv2ZI=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-YHeQKPIYNfuWpcC6AsKYwA-1; Tue, 14 Feb 2023 15:52:57 -0500
X-MC-Unique: YHeQKPIYNfuWpcC6AsKYwA-1
Received: by mail-vs1-f70.google.com with SMTP id
 z8-20020a056102020800b004124fe134e1so1108506vsp.23
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 12:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oPB4nEisn5ruMTIupilldJ+EyZhIhtxPmv/YXkSOczo=;
 b=Q+bXy5PXQAojOKIhP/ZtSPlGxDJu27VxLkLWrmC9lBg0NmkoUrs/mdzvzrqAyMkzCu
 qx0fqPKYjsZ1WaZeBq4oN5s+pvZlPUTelKdAk3Mzih3vKfcFfmINadir08gvYPr+J3Qd
 NiV6lXzqXSLnQ88EdKa0AZXqaChTpZWdhWYQj0bEbY/0+/uWWnK/Z0ZmMB9RMQ7iywmU
 XQg/uIbyJgwfa979BhMEVN6/Fb1v4gNAAhRTr3S+mXds7IMGQ3oLsgVsBYu6QthU7ona
 v0MHpT9Gw6JUjbIEzXyrIy9zn48kY/p2JVOGA9Z2asTfCWtA5zAc8S6/EEBJGVg1oQeJ
 YAzw==
X-Gm-Message-State: AO0yUKWKySCXVxIi/RfBgSRlBqcSCjueYs/n49vx33jaev7KcPlTTE6K
 nq1xQJDMHwyCfVdpb0+fwwMD2iYcX1Dty+uLlVAFod8V9BoGwpQYBbPL47+Tj3US0FIUfjZEXCc
 HnUSYiOmTLnjlDfkn9NL5ydiB6wR2plQ=
X-Received: by 2002:a1f:9895:0:b0:3e5:c4d5:fa3f with SMTP id
 a143-20020a1f9895000000b003e5c4d5fa3fmr615495vke.41.1676407976553; 
 Tue, 14 Feb 2023 12:52:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+6SaZ++FVx/Rg7KgK722N1oMGW5v6GAtO8bKXL7yGh355wye00DUGblBDqr1WmVL8t8lWThb2TW99PLQrk7qg=
X-Received: by 2002:a1f:9895:0:b0:3e5:c4d5:fa3f with SMTP id
 a143-20020a1f9895000000b003e5c4d5fa3fmr615486vke.41.1676407976255; Tue, 14
 Feb 2023 12:52:56 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
 <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
 <Y+vEKTgwoPtj86Z1@redhat.com>
In-Reply-To: <Y+vEKTgwoPtj86Z1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 14 Feb 2023 21:52:44 +0100
Message-ID: <CABgObfbsoOGU5v-xw3LzsnknS_TFJWZBA3LGCAmOOF-uBcXziQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ec799405f4af2514"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000ec799405f4af2514
Content-Type: text/plain; charset="UTF-8"

Il mar 14 feb 2023, 18:26 Kevin Wolf <kwolf@redhat.com> ha scritto:

> Am 14.02.2023 um 15:03 hat Paolo Bonzini geschrieben:
> > In the case of Python the issue is not the interpreter per se, though
> > there are a couple new feature in Python 3.7 that are quite nice (for
> > example improved data classes[1] or context variables[2]). The main
> > problem as far as I understood (and have seen in my experience) is
> > linting tools. New versions fix bugs that caused false positives, but
> > also become more strict at the same time. The newer versions at the
> > same time are very quick at dropping support for old versions of
> > Python; while older versions sometimes throw deprecation warnings on
> > new versions of Python. This makes it very hard to support a single
> > version of, say, mypy that works on all versions from RHEL8 and SLE15
> > to Fedora 38 and Ubuntu 23.04.
>
> Why do we have to support a single version of mypy? What is wrong with
> running an old mypy version with old Python version, and a newer mypy
> with newer Python versions?
>
> Sure, they will complain about different things, but it doesn't feel
> that different from supporting multiple C compilers in various versions.
>

It's more like having to support only C++03 on RHEL 8 and only C++20 in
Fedora 37, without even being able to use a preprocessor.

For example old versions might not understand some type annotations and
will fail mypy altogether, therefore even with newer versions you can't
annotate the whole source and have to fall back to non-strict mode.

Paolo


> Kevin
>
>

--000000000000ec799405f4af2514
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 14 feb 2023, 18:26 Kevin Wolf &lt;<a href=3D"ma=
ilto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Am 14.02.2023 um 15:03 hat Paolo Bonzini geschrieb=
en:<br>
&gt; In the case of Python the issue is not the interpreter per se, though<=
br>
&gt; there are a couple new feature in Python 3.7 that are quite nice (for<=
br>
&gt; example improved data classes[1] or context variables[2]). The main<br=
>
&gt; problem as far as I understood (and have seen in my experience) is<br>
&gt; linting tools. New versions fix bugs that caused false positives, but<=
br>
&gt; also become more strict at the same time. The newer versions at the<br=
>
&gt; same time are very quick at dropping support for old versions of<br>
&gt; Python; while older versions sometimes throw deprecation warnings on<b=
r>
&gt; new versions of Python. This makes it very hard to support a single<br=
>
&gt; version of, say, mypy that works on all versions from RHEL8 and SLE15<=
br>
&gt; to Fedora 38 and Ubuntu 23.04.<br>
<br>
Why do we have to support a single version of mypy? What is wrong with<br>
running an old mypy version with old Python version, and a newer mypy<br>
with newer Python versions?<br>
<br>
Sure, they will complain about different things, but it doesn&#39;t feel<br=
>
that different from supporting multiple C compilers in various versions.<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It&=
#39;s more like having to support only C++03 on RHEL 8 and only C++20 in Fe=
dora 37, without even being able to use a preprocessor.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">For example old versions might not understa=
nd some type annotations and will fail mypy altogether, therefore even with=
 newer versions you can&#39;t annotate the whole source and have to fall ba=
ck to non-strict mode.</div><div dir=3D"auto"><br></div><div dir=3D"auto">P=
aolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
Kevin<br>
<br>
</blockquote></div></div></div>

--000000000000ec799405f4af2514--


