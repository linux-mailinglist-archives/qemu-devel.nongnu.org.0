Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6EF30E628
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 23:39:25 +0100 (CET)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Qnw-0005Kk-TU
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 17:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l7QWa-0006mb-BV
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l7QWV-0002Cc-9H
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 17:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612390876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vbPiHZ7FnyNUJkUWBcMALPoTGuC73hIhYZKsj9JLSNo=;
 b=FGCuK6E03ctcYAYUNVSlooDksoH5huTMWC3kPYv+UkI9Z90hGRsZKZnhhbE/1TIH8LUM1m
 W5QiDJdrN5nn31gOsLqDfPklGq4e0/YcJTDHEvnE3BN1GhZS7zEtsCDRpAHudvQ43Avm8T
 FAuzsi1LQMD/wF+Rupqn9y1YLDFjlt0=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-0TSOwYVlOJO4mGwzlyi3Iw-1; Wed, 03 Feb 2021 17:21:14 -0500
X-MC-Unique: 0TSOwYVlOJO4mGwzlyi3Iw-1
Received: by mail-il1-f200.google.com with SMTP id y12so1081559ilu.14
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 14:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbPiHZ7FnyNUJkUWBcMALPoTGuC73hIhYZKsj9JLSNo=;
 b=h9G6NEAB/Ooc+Q2pMOC/rVcHZsoq7bZ1Tauza9B0y3YkkYuIFTiNlhAQE+GWsJ0tvP
 jgU979mFZke1wHI/BMEXeYAwXUG8giEKcF6QhY/JhfjGC6DyjAA3uWYLy0pOMFHfJn5C
 14EAS3cnR9Qa6QN4QXZgx3mF0rho5NFUh8FFuD9uKEcuKWhNNeLxsxU6E5VIz7qyQTcW
 rLRfawFdDPVDhLzCrBEK/+j/K3Ikve3oY+4yKKSFEKcYB1q3TjloymHXMAEwYLJ9O80R
 efa7Xq4wfQcf7wLS7WXlQia+mef3lY8ghE9V3Wym2P+zjdNSu28/Tm9iTF9YI+pyxDnH
 r6LA==
X-Gm-Message-State: AOAM530uWH46j/9V340t4RyaaJS77kB2/S2+0MDcPaR46pIEKU8nh+8L
 HDKD0t1fHvFAPyvSNqYa2RWCwcQU/4WxItI0rLeWZF7H0Pg4M8eCSvNkVVuligGJ9LDNkzfJQk1
 2IT8Olcl5E+VtLsyVxPKuVAE0RydVkpQ=
X-Received: by 2002:a02:6d09:: with SMTP id m9mr4910200jac.70.1612390873468;
 Wed, 03 Feb 2021 14:21:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ5fqvb94kpn9GQu6uEYwBIzmt/ld8WUM3LriPQ57LdQOLdi4ckmzTAWNoPRpRAKYqvTWSbxY08RgBhXX3Ufs=
X-Received: by 2002:a02:6d09:: with SMTP id m9mr4910188jac.70.1612390873320;
 Wed, 03 Feb 2021 14:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
 <20210202142625.609070-12-marcandre.lureau@redhat.com>
 <20210203154820.wolx57xxegwdw7q2@sirius.home.kraxel.org>
In-Reply-To: <20210203154820.wolx57xxegwdw7q2@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 4 Feb 2021 02:21:02 +0400
Message-ID: <CAMxuvaxDMR2a+mKFPjA29rQrTzbNPt7hpBWVqBvV3iAABTLeoA@mail.gmail.com>
Subject: Re: [PATCH 11/20] ui: add an optional get_flags callback to
 GraphicHwOps
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003e697b05ba7601bb"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003e697b05ba7601bb
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 3, 2021 at 7:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> > +static int
> > +virtio_gpu_get_flags(void *opaque)
> > +{
> > +    VirtIOGPUBase *g = opaque;
> > +    int flags = GRAPHIC_FLAGS_NONE;
> > +
> > +    if (virtio_gpu_virgl_enabled(g->conf))
> > +        flags |= GRAPHIC_FLAGS_GL;
> > +
> > +    if (virtio_gpu_dmabuf_enabled(g->conf))
> > +        flags |= GRAPHIC_FLAGS_DMABUF;
>
> fbe6ba76ac01 ui: add an optional get_flags callback to GraphicHwOps
> ERROR: braces {} are necessary for all arms of this statement
> #50: FILE: hw/display/virtio-gpu-base.c:123:
> +    if (virtio_gpu_virgl_enabled(g->conf))
> [...]
>
> ERROR: braces {} are necessary for all arms of this statement
> #53: FILE: hw/display/virtio-gpu-base.c:126:
> +    if (virtio_gpu_dmabuf_enabled(g->conf))
> [...]
>
> total: 2 errors, 0 warnings, 68 lines checked
>

If you queued the series, do you mind squashing a style fix? Otherwise I
can resend.

Thanks

--0000000000003e697b05ba7601bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 3, 2021 at 7:48 PM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +sta=
tic int<br>
&gt; +virtio_gpu_get_flags(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 VirtIOGPUBase *g =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 int flags =3D GRAPHIC_FLAGS_NONE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (virtio_gpu_virgl_enabled(g-&gt;conf))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D GRAPHIC_FLAGS_GL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (virtio_gpu_dmabuf_enabled(g-&gt;conf))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D GRAPHIC_FLAGS_DMABUF;<br>
<br>
fbe6ba76ac01 ui: add an optional get_flags callback to GraphicHwOps<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#50: FILE: hw/display/virtio-gpu-base.c:123:<br>
+=C2=A0 =C2=A0 if (virtio_gpu_virgl_enabled(g-&gt;conf))<br>
[...]<br>
<br>
ERROR: braces {} are necessary for all arms of this statement<br>
#53: FILE: hw/display/virtio-gpu-base.c:126:<br>
+=C2=A0 =C2=A0 if (virtio_gpu_dmabuf_enabled(g-&gt;conf))<br>
[...]<br>
<br>
total: 2 errors, 0 warnings, 68 lines checked<br></blockquote><div><br></di=
v><div>If you queued the series, do you mind squashing a style fix? Otherwi=
se I can resend.</div><div><br></div><div>Thanks<br></div></div></div>

--0000000000003e697b05ba7601bb--


