Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4C6AB7F6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5to-0006gY-LB; Mon, 06 Mar 2023 03:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ5tk-0006gF-Nu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ5tj-0006qd-Av
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:08:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678090122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kqy6fbSmP/E0Ec01gKm1PxPNrukPZvjAV93d2I4SPH0=;
 b=WjwIUL8/zwN5LzAUAdedIe91xsRWv8Z8WCtVKueHF/yYrW707IXm0VUon5oLiqFMhk7wB0
 L9TOEu3DRCx1zu2wTgkHc8IXxbz5iv1ui0m+gZHU5PP19B7uNlbtTaZKqDmygwAHwz8hny
 sbISEnZ2c16b03wqcoFNvjrGacCayQg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-TrrH-7IWMPeT0eQBOX5mmw-1; Mon, 06 Mar 2023 03:08:41 -0500
X-MC-Unique: TrrH-7IWMPeT0eQBOX5mmw-1
Received: by mail-ed1-f72.google.com with SMTP id
 dn8-20020a05640222e800b004bd35dd76a9so12664830edb.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 00:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kqy6fbSmP/E0Ec01gKm1PxPNrukPZvjAV93d2I4SPH0=;
 b=FgTmzu8lJFcMhAxQmdRPugdeHoHk3Ac2mRA9oGElBEpB4G3rTVdd59n8a6jF+I01T/
 akB6OFcnbwe+n3QhNwFIxx+9VoyvZnP3jeMsTiErjv7ErJ46SiiWH+EM0RQC3GoPGjOd
 UcKlHJ7cobtr9atJWxEXa0nZAPV+WVR2O3UnTxewuMuOnIr9BrlltraqKac0RuCqtcRr
 mPR0//0Q77lAskxm1xoFIcox3fuXNgF8oOVQ2ElCOjx0YkJD8DgZXn3k/ABIl7q4RQIy
 mXpRWDRnRc5+P4BjY+pp5vsEW820vCkNHpjyN/yrBh6r22vFBDiBXdD22RfLUPSpYPD5
 lp+Q==
X-Gm-Message-State: AO0yUKUmk4gMlVJ4Yn8Z/gWBh4pGPhHCQ3e+M3hpuDZXWKPR+3goj8B7
 16TvEE5ByOfhkYLJnW+uKf9O8HgrsT5oTN4Cvw6aPTGVJNVvScDcH67uytiTLd59dDh3yv5Ljrg
 x2fBaJORg4wPjwtNa4IdfR6TlPODlZOI=
X-Received: by 2002:a17:906:388d:b0:877:e539:810b with SMTP id
 q13-20020a170906388d00b00877e539810bmr4726134ejd.2.1678090120010; 
 Mon, 06 Mar 2023 00:08:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9J67mXdhvh26behEOQCYIDZHv6Kbs2eBG04TZT2apYkbICrELng2Mj+SxJk4MgknWf4B68tk+/qCcNcWaLrNY=
X-Received: by 2002:a17:906:388d:b0:877:e539:810b with SMTP id
 q13-20020a170906388d00b00877e539810bmr4726116ejd.2.1678090119757; Mon, 06 Mar
 2023 00:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <CAMxuvawu4EWKpw_8sHGU-hVKeX_wZzpWqaRJo6kjbkYB45VWjw@mail.gmail.com>
 <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
In-Reply-To: <cd4d82c4-6161-493b-073b-235141d6337a@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Mar 2023 12:08:28 +0400
Message-ID: <CAMxuvawL9VEGC5HL9OMwXhxeVY_qSKFfORsMaW9OeV=tQ0OH1A@mail.gmail.com>
Subject: Re: [PATCH v3 00/16] win32: do not mix SOCKET and fd space
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>, 
 Hanna Reitz <hreitz@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007d4fd805f636cd6e"
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

--0000000000007d4fd805f636cd6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo

On Mon, Mar 6, 2023 at 12:05=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:

> On 3/2/23 15:09, Marc-Andr=C3=A9 Lureau wrote:
> >
> >
> >     v3:
> >     - fix closesocket() to prevent CloseHandle() from close()
> >     - fix direct closesocket() usage (#undef closesocket before)
> >     - add a test for &error_warn
> >     - add r-b tags
> >
> > ping  (I am missing reviews, thanks)
>
> I'm going to queue this series today if that's fine for you---thanks for
> reminding!
>
>
Great, thanks! (I suppose you'll drop "RFC: build-sys: add slirp.wrap", and
perhaps queue the other meson/wrap series instead)

--0000000000007d4fd805f636cd6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 6, 2023 at 12:05=
=E2=80=AFPM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 3/2/23 15:09, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- fix closesocket() to prevent CloseHandle() from c=
lose()<br>
&gt;=C2=A0 =C2=A0 =C2=A0- fix direct closesocket() usage (#undef closesocke=
t before)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add a test for &amp;error_warn<br>
&gt;=C2=A0 =C2=A0 =C2=A0- add r-b tags<br>
&gt; <br>
&gt; ping=C2=A0 (I am missing reviews, thanks)<br>
<br>
I&#39;m going to queue this series today if that&#39;s fine for you---thank=
s for <br>
reminding!<br>
<br></blockquote><div><br></div><div>Great, thanks! (I suppose you&#39;ll d=
rop &quot;RFC: build-sys: add slirp.wrap&quot;, and perhaps queue the other=
 meson/wrap series instead)</div></div></div>

--0000000000007d4fd805f636cd6e--


