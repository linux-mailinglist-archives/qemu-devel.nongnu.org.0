Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59C64F869
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 10:11:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6TDa-0001Kp-Hy; Sat, 17 Dec 2022 04:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TDZ-0001Iy-2v
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6TDX-0007Ad-Ig
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 04:10:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671268251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aJkcJBIFn93pBruIEJtoayNcArHYHZTX34v73SqM1JE=;
 b=a55hWRYezwLdT9AzqpT/9Q6bVIoAeKOcbHWBilo4qNV2IRHjUdrc9k8NlYVyfho5iH0He/
 gxn/k/Z0DGsBiUTuMRsPMDHfSUAnHASl1nNEFSLwRBkUSVKq2V1Ayz2L4vCi6VxEAhhwB2
 JX/yF1eI0Yh8gFAMdumKqUdq6MF0eiw=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-mHkUGfhgP22vZwiV9rH3mw-1; Sat, 17 Dec 2022 04:10:46 -0500
X-MC-Unique: mHkUGfhgP22vZwiV9rH3mw-1
Received: by mail-vs1-f72.google.com with SMTP id
 190-20020a6707c7000000b003b134bce1dbso1250765vsh.21
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 01:10:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJkcJBIFn93pBruIEJtoayNcArHYHZTX34v73SqM1JE=;
 b=cmmgabUMJKpa4w5z5s8nTY1UTOCkb0bAaUDVHjikZa8qO/AdoHFQPoXeUiZ8FbSoiz
 n5eam9996BL4H6V6F7m1evBKeWRATJKF6yVp3pyT414DAhsulk3T/hi+UE+uq+uMo0AX
 zTULZlh1XVdYJSHNVFH794VoZVZFt9idTIr1UZnd3g5QvZFQA/6MRPN96I8zcQYPHAID
 sLisuoRyufPcAmkl7EhCqxLJzg4MpFrsoQYXi7oIOVQ0y9XXQLeKv/D1q2428aAaR/lq
 V/Eoov1Avd1H4vu6K0OKfXLfMrVCLECGyhWZKpF7IHQrVTaaMojYUw0xH2qC+hHXvd9m
 0Viw==
X-Gm-Message-State: ANoB5pkdIJr5eCtqKStFlHzEVQRASKKcSHaUR6c5WxKa3Dlji+kzb2UL
 0e50ng6NXuBQEOOopP+PMXf+MWmnmqTehwJ0fa/Tfz6yVSapZ+vaU1M4stP/hJf1ZYihG9JUv0w
 J/SEwfT+W7YDGywhoNx7FQr2/eZNGFYw=
X-Received: by 2002:a67:fb14:0:b0:3b3:6e28:a58c with SMTP id
 d20-20020a67fb14000000b003b36e28a58cmr3230409vsr.87.1671268245947; 
 Sat, 17 Dec 2022 01:10:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4mnOepYuEQYzPUdGOqlfUJAK94D0Kter0pAo997AJBd0tLVpJSlfPJQ7sGa+V6pGasdmr3mb3OBvkDUfO4/L0=
X-Received: by 2002:a67:fb14:0:b0:3b3:6e28:a58c with SMTP id
 d20-20020a67fb14000000b003b36e28a58cmr3230406vsr.87.1671268245712; Sat, 17
 Dec 2022 01:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20221216135439.465033-1-kkostiuk@redhat.com>
 <CAFEAcA_=WichNB8qeJJdhrwrkHc_M9zm0+E0XfZ417aGiZ-cYw@mail.gmail.com>
In-Reply-To: <CAFEAcA_=WichNB8qeJJdhrwrkHc_M9zm0+E0XfZ417aGiZ-cYw@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Sat, 17 Dec 2022 11:10:34 +0200
Message-ID: <CAPMcbCoSufc8+9-DoWZFzUw3rGBNHJK1aZ7nQZdMan9Yrd-mig@mail.gmail.com>
Subject: Re: [PULL 0/8] QEMU Guest Agent misc patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001c566505f0027657"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--0000000000001c566505f0027657
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 16, 2022 at 11:47 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Fri, 16 Dec 2022 at 13:54, Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
> >
> > The following changes since commit
> edc93f455fa823a9a5fcb3a8da430104c7375a0a:
> >
> >   Revert "hw/loongarch/virt: Add cfi01 pflash device" (2022-12-05
> 11:24:35 -0500)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-16
> >
> > for you to fetch changes up to 10d83e7d59af4464ba4382bcbf31ed162db87656:
> >
> >   qga: map GLib log levels to system levels (2022-12-16 14:24:36 +0200)
> >
> > ----------------------------------------------------------------
> > qga-pull-2022-12-16
>
> Hi; I'm afraid this doesn't apply because Markus' qapi pullreq
> has changed the implementation of qmp_guest_fstrim() to not use
> the no-longer-existing 'has_*' fields in QAPI-generated structs;
> can you rebase and resend, please?
>
>
> resend without patches that don't apply

Best Regards,
Konstantin Kostiuk.



> thanks
> -- PMM
>
>

--0000000000001c566505f0027657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 16, 2022 at 11:47 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Fri, 16 Dec 2022 at 13:54, Konstantin Kostiuk &lt;<a href=3D"mail=
to:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; The following changes since commit edc93f455fa823a9a5fcb3a8da430104c73=
75a0a:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Revert &quot;hw/loongarch/virt: Add cfi01 pflash device&qu=
ot; (2022-12-05 11:24:35 -0500)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-1=
6<br>
&gt;<br>
&gt; for you to fetch changes up to 10d83e7d59af4464ba4382bcbf31ed162db8765=
6:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0qga: map GLib log levels to system levels (2022-12-16 14:2=
4:36 +0200)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; qga-pull-2022-12-16<br>
<br>
Hi; I&#39;m afraid this doesn&#39;t apply because Markus&#39; qapi pullreq<=
br>
has changed the implementation of qmp_guest_fstrim() to not use<br>
the no-longer-existing &#39;has_*&#39; fields in QAPI-generated structs;<br=
>
can you rebase and resend, please?<br>
<br>
<br></blockquote><div>resend without patches that don&#39;t apply </div><di=
v><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div di=
r=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div=
></div></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div>

--0000000000001c566505f0027657--


