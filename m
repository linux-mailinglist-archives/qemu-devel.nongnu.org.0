Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6464692857
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 21:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQa3a-0002W3-5i; Fri, 10 Feb 2023 15:31:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQa3U-0002VO-NT
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 15:31:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQa3P-0002ur-1A
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 15:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676061090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=37+SP7aohWlyOokGIfyhVoqX33Gb1snzlmetALNxkh8=;
 b=c8dvqu53qyhv/Tkuz2rhhiGfqKGm+J2i1YoJLUUQZlqSeU2MfWT50tpXkO2U1EbNehXTsi
 nDtG/N8HLb7OHokY4C/WDkTe5W1FsoFx/N/JlhMBQNGCIaSVXeN9woJtiIp/T99Z+6fWqZ
 0LB1HhFLvWNjKJFcCAiPV1FgX7ez0ec=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-J6DQqMMGNkmH2ZXPm9ftwQ-1; Fri, 10 Feb 2023 15:31:28 -0500
X-MC-Unique: J6DQqMMGNkmH2ZXPm9ftwQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 s6-20020a9f2986000000b00683c94d9881so2232610uas.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 12:31:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=37+SP7aohWlyOokGIfyhVoqX33Gb1snzlmetALNxkh8=;
 b=e4mkX6D5sK4iHqokneIo/LXCGXMmJkMktpTm6WnUeOtsQf8PoUegYr9Ee+RjPuEdEi
 +L/BfxmXk7LRkHdCVpyq19QTHjk6ceEFAs3qK+LsbAq7jhs55gXna4QXBI9MuI4q6hMd
 Jq/fafSx0WC1HGy/7OgbId0A5lvR4AFS/nqpBv5oqIc70IZfk2wr22+mENZPnDo4FbCF
 YOVY0t/KhphJ7O/JbXMbMlRX7FvPx9oXR/5M1/ojk5/nW0R55e6dlGFr73SrFviINx/l
 b3H4CYKr/MMQaOhgG/DRIJHHKsni4M0IFhLJ4WhqapCLiS21L6eI2IpsqNGGusLkUEKz
 E7pQ==
X-Gm-Message-State: AO0yUKX75Udt+nP6fy1AEJgmQOnxL0T8OMGJoKKeVE5/m4WCCttKPMgn
 aobQ36dvXd0P+ZkvV4DTlP2r3IySKcTN645pCFGKdKWyJVzQs1oOil7ZXNMhiCx5oRD78Z+WmT4
 svWt3ItNqWyOGm2cSfQXsCAI6MUe7Rpo=
X-Received: by 2002:a05:6102:162b:b0:3e8:ba0d:ffa9 with SMTP id
 cu43-20020a056102162b00b003e8ba0dffa9mr3886113vsb.85.1676061087630; 
 Fri, 10 Feb 2023 12:31:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9mTq2vh310q+OiwH67oBBM3tvLiMwy695ws6iZF4S7Jel65Hh/PAUyA+qhWyziBTlAucEssZRmLnHvwiAIoXU=
X-Received: by 2002:a05:6102:162b:b0:3e8:ba0d:ffa9 with SMTP id
 cu43-20020a056102162b00b003e8ba0dffa9mr3886096vsb.85.1676061087398; Fri, 10
 Feb 2023 12:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <CAFn=p-aLGgf-tWA5kXeTXWjKicCb+T0MZ3M6eFEP3YQxf4MKPg@mail.gmail.com>
 <CAFEAcA-FhKp7EitQ016dNc_6epra--pqnVOC8XtEdLEJnCZdXQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-FhKp7EitQ016dNc_6epra--pqnVOC8XtEdLEJnCZdXQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Feb 2023 21:31:15 +0100
Message-ID: <CABgObfY+g_OoUU3v1TTfK6WyMNFGe8Yg0csy-4HO1Cprqi2F0Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: Peter Maydell <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bc941205f45e6114"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--000000000000bc941205f45e6114
Content-Type: text/plain; charset="UTF-8"

Il ven 10 feb 2023, 19:09 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Fri, 10 Feb 2023 at 17:55, John Snow <jsnow@redhat.com> wrote:
> > (The problem with just allowing sphinx to be a black box and
> > continuing to happily use the 3.6-based versions is that we are
> > using QAPIDoc extensions from our own codebase, which would lock
> > those to 3.6. A big motivator for Markus is dropping some 3.6
> > kludges we're carrying for qapi, so I looked to the opposite
> > solution - nudging Sphinx forward instead.)
>
> Mmm. Where on the pain spectrum does "allow python 3.8
> because CentosOS ships that, except that where our python
> code gets run via Sphinx that part of the codebase must
> retain 3.6 compatibility" sit ?
>

As far as the build system is concerned no changes are required, however
Python 3.7 support was requested by Markus for scripts/qapi/ for quite some
time. So it would not be painful to implement but it would remove most of
the benefits of dropping support for 3.6.

Paolo


> thanks
> -- PMM
>
>

--000000000000bc941205f45e6114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 10 feb 2023, 19:09 Peter Maydell &lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Fri, 10 Feb 2023 at 17:55, J=
ohn Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"n=
oreferrer">jsnow@redhat.com</a>&gt; wrote:<br>
&gt; (The problem with just allowing sphinx to be a black box and<br>
&gt; continuing to happily use the 3.6-based versions is that we are<br>
&gt; using QAPIDoc extensions from our own codebase, which would lock<br>
&gt; those to 3.6. A big motivator for Markus is dropping some 3.6<br>
&gt; kludges we&#39;re carrying for qapi, so I looked to the opposite<br>
&gt; solution - nudging Sphinx forward instead.)<br>
<br>
Mmm. Where on the pain spectrum does &quot;allow python 3.8<br>
because CentosOS ships that, except that where our python<br>
code gets run via Sphinx that part of the codebase must<br>
retain 3.6 compatibility&quot; sit ?<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">As far as the build system is concern=
ed no changes are required, however Python 3.7 support was requested by Mar=
kus for scripts/qapi/ for quite some time. So it would not be painful to im=
plement but it would remove most of the benefits of dropping support for 3.=
6.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000bc941205f45e6114--


