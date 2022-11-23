Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB4D63510C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 08:23:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxk4Q-0007MC-FL; Wed, 23 Nov 2022 02:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oxk48-0007Ln-0y
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oxk45-000501-Vy
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669188060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=egGcawA2PCKhy1KU+TAfioAzRv6F5pXfdenPHYTwOx8=;
 b=SVVdJrdtoasa4eLPN2fKs8/wPW5fiTMuB3dt0RNrvwQ4GQprVsZ94FjUGA1lsWJcGJPw8L
 87CWPKtKJKcb85RCkAmerjqCUSJm59GluwwA8IXIJAkI9GkqARSqWQ39eCHafiuj3IyVdX
 R4dfSIO/GMMatr5w+Vj3ID+BGXO17Lo=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-lxqSwTQdO_iNVgKUR8PPEw-1; Wed, 23 Nov 2022 02:20:53 -0500
X-MC-Unique: lxqSwTQdO_iNVgKUR8PPEw-1
Received: by mail-il1-f198.google.com with SMTP id
 j20-20020a056e02219400b00300a22a7fe0so12395791ila.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 23:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=egGcawA2PCKhy1KU+TAfioAzRv6F5pXfdenPHYTwOx8=;
 b=y0XetIzcKwt21gWPZdDFFO9gaz70W+pUEjk+rBvqN50ZkGFWDNA5zhgUsu8piGZ/RG
 TS5yeJmtYa1hF+xM7Jn9+U0Qp8STXmrrZ3yoqSq3OdpHcOStrqwM1tibR1mGhMEiOuQ4
 SvNgh01K/UGC8DB0h52BHGpqol6B79RSmqs4PmnV1o3Sv0Ov3J59O0ahY31bGyyDgArd
 q284w/mmHie0E7kXbBEwbptw0M1eLz3CUAORG2XWFGwFZ9oeuhaORUv50lLR2vxqRI9L
 N+yYQqCiHJtC6V6ozeDjV9ytHl55IEJmOb2Cn6TN61p5bOjhwA9ydTjNC7s43jezVo9y
 HWXA==
X-Gm-Message-State: ANoB5pmbTsMrUu04ldHHCFvEkHXxBp53VztKMhbehk3xzgvmxh6L/j9U
 Yxti4IK6FTus99MCPCr8lbE3E+I70+IrWaHkJdK9F408qdbdZ5JnCAlWryXNebTRcDv6JydXtJM
 kL0JDQKNjI97FLAtL8z18dTfoXAwdTvE=
X-Received: by 2002:a05:6602:200c:b0:6de:90a6:6b04 with SMTP id
 y12-20020a056602200c00b006de90a66b04mr10770633iod.101.1669188052677; 
 Tue, 22 Nov 2022 23:20:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Kmpq3iABZBR5+3LycKLuQo9F8MfGv/8J/YL5CJwdKPsS0G8zrSegS+qVUI9Blm8Wn9BqAlVOWPVLs4IpHm6k=
X-Received: by 2002:a05:6602:200c:b0:6de:90a6:6b04 with SMTP id
 y12-20020a056602200c00b006de90a66b04mr10770623iod.101.1669188052421; Tue, 22
 Nov 2022 23:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
 <20221122152944-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221122152944-mutt-send-email-mst@kernel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 23 Nov 2022 11:20:41 +0400
Message-ID: <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, eperezma@redhat.com, eric.auger@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000edab6705ee1e200d"
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

--000000000000edab6705ee1e200d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Nov 23, 2022 at 12:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:

> On Tue, Nov 22, 2022 at 06:53:49PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> > warning") removed the warning on vfio_listener_region_add() path.
> >
> > An error is reported for vhost-vdpa case:
> > qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
> >
> > Skip the CRB device.
> >
> > Fixes:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2141965
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 7468e44b87..9d7206e4b8 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -19,6 +19,7 @@
> >  #include "hw/virtio/virtio-net.h"
> >  #include "hw/virtio/vhost-shadow-virtqueue.h"
> >  #include "hw/virtio/vhost-vdpa.h"
> > +#include "sysemu/tpm.h"
> >  #include "exec/address-spaces.h"
> >  #include "migration/blocker.h"
> >  #include "qemu/cutils.h"
> > @@ -46,6 +47,11 @@ static bool
> vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> >  {
> >      Int128 llend;
> >
> > +    if (TPM_IS_CRB(section->mr->owner)) {
> > +        /* The CRB command buffer has its base address unaligned. */
> > +        return true;
> > +    }
> > +
>
> Quite a hack. We can't really keep adding dependency on random devices
>

Agree it's not great. but it's not strictly a dependency. At least you can
still build with !CONFIG_TPM.

to vhost. And would you add hacks like this to listeners?
> Pls figure out what's special about this buffer.
> Also if this section is unaligned then doesn't it break up
> other aligned sections?
>

See the original discussion:
https://patchew.org/QEMU/20220208133842.112017-1-eric.auger@redhat.com/2022=
0208133842.112017-2-eric.auger@redhat.com/

It is not clear whether aligning the tpm-crb-cmd region would work
(overlapping tpm-crb-mmio).

Peter Maydell said: "There's nothing that guarantees alignment for memory
regions at all, whether they're RAM, IO or anything else.".

Maybe vfio/vhost should simply skip those odd regions silently.



>
> >      if ((!memory_region_is_ram(section->mr) &&
> >           !memory_region_is_iommu(section->mr)) ||
> >          memory_region_is_protected(section->mr) ||
> > --
> > 2.38.1
>
>

--000000000000edab6705ee1e200d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 23, 2022 at 12:32 AM Mi=
chael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue=
, Nov 22, 2022 at 06:53:49PM +0400, <a href=3D"mailto:marcandre.lureau@redh=
at.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; 851d6d1a0f (&quot;vfio/common: remove spurious tpm-crb-cmd misalignmen=
t<br>
&gt; warning&quot;) removed the warning on vfio_listener_region_add() path.=
<br>
&gt; <br>
&gt; An error is reported for vhost-vdpa case:<br>
&gt; qemu-kvm: vhost_vdpa_listener_region_add received unaligned region<br>
&gt; <br>
&gt; Skip the CRB device.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2141965" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D2141965</a><br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 hw/virtio/vhost-vdpa.c | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c<br>
&gt; index 7468e44b87..9d7206e4b8 100644<br>
&gt; --- a/hw/virtio/vhost-vdpa.c<br>
&gt; +++ b/hw/virtio/vhost-vdpa.c<br>
&gt; @@ -19,6 +19,7 @@<br>
&gt;=C2=A0 #include &quot;hw/virtio/virtio-net.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/virtio/vhost-shadow-virtqueue.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/virtio/vhost-vdpa.h&quot;<br>
&gt; +#include &quot;sysemu/tpm.h&quot;<br>
&gt;=C2=A0 #include &quot;exec/address-spaces.h&quot;<br>
&gt;=C2=A0 #include &quot;migration/blocker.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/cutils.h&quot;<br>
&gt; @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(Mem=
oryRegionSection *section,<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Int128 llend;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (TPM_IS_CRB(section-&gt;mr-&gt;owner)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The CRB command buffer has its base ad=
dress unaligned. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
<br>
Quite a hack. We can&#39;t really keep adding dependency on random devices<=
br></blockquote><div><br></div><div>Agree it&#39;s not great. but it&#39;s =
not strictly a dependency. At least you can still build with !CONFIG_TPM.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
to vhost. And would you add hacks like this to listeners?<br>
Pls figure out what&#39;s special about this buffer.<br>
Also if this section is unaligned then doesn&#39;t it break up<br>
other aligned sections?<br></blockquote><div><br></div><div>See the origina=
l discussion:<br></div><div><a href=3D"https://patchew.org/QEMU/20220208133=
842.112017-1-eric.auger@redhat.com/20220208133842.112017-2-eric.auger@redha=
t.com/">https://patchew.org/QEMU/20220208133842.112017-1-eric.auger@redhat.=
com/20220208133842.112017-2-eric.auger@redhat.com/</a></div><div><br> </div=
><div>It is not clear whether aligning the tpm-crb-cmd region would work (o=
verlapping tpm-crb-mmio).</div><div><br></div><div>Peter Maydell said: &quo=
t;There&#39;s nothing that guarantees alignment for memory regions at all, =
whether they&#39;re RAM, IO or anything else.&quot;. <br></div><div><br></d=
iv><div>Maybe vfio/vhost should simply skip those odd regions silently.<br>=
</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ((!memory_region_is_ram(section-&gt;mr) &amp;&a=
mp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!memory_region_is_iommu(sectio=
n-&gt;mr)) ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_is_protected(section-&=
gt;mr) ||<br>
&gt; -- <br>
&gt; 2.38.1<br>
<br>
</blockquote></div></div>

--000000000000edab6705ee1e200d--


