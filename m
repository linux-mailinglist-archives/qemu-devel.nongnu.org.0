Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738084D59C1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 05:45:57 +0100 (CET)
Received: from localhost ([::1]:35696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSXA4-00014u-0u
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 23:45:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nSX8Q-0000OR-MY
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 23:44:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nSX8M-0003pL-Ny
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 23:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646973848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u1sGsBtavNy6e3uzcZSoErW6YrIPiiEOqMhoGq2/wJM=;
 b=JyGfYYxXqh60aNgSrIkXwll3NLpb7npN5VHK4kWKgATg23stfDZcFJJovy/l+cT5ggAlge
 LxycaEMEWFaW7dmyWso3fHmMVNH8raZoVAvWA8RoIg9o+HoTZGRpgSEaDRcqNwMvIUgUAJ
 xUbyeRFQQYAXFLKJYS+uEFYM06XiDZc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-trCjWC_iO4mr4mTLXLnN7A-1; Thu, 10 Mar 2022 23:44:05 -0500
X-MC-Unique: trCjWC_iO4mr4mTLXLnN7A-1
Received: by mail-lf1-f71.google.com with SMTP id
 u2-20020a056512128200b004484c08894aso2660625lfs.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 20:44:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u1sGsBtavNy6e3uzcZSoErW6YrIPiiEOqMhoGq2/wJM=;
 b=KPHaiYy6EX4/1BxIJCWOePP66EztyjypjOVsSPE46Wxq9kdpe/PvWjMadtw8agNkE6
 haLJ79g9f48l2kjAd1cvLP1NY3pRvSpqv3w52rMDg1J2IuO6ynIHhi5Qw1atoDoANCmA
 tutwW8C/SITio3JPAzdn3xQQ5UFCBmWyMaHVlImJrTA72aFGXmiha7SOo6lGPjaXJwJt
 C1YCLRHYymDdH1YyVfv46gwirc0ev7ezNP3p3lkhamrNQ1+pAwycYrdDbfpuuPAc4+E2
 3MPXMxwdWVEQm92OZ5Z9Ht2FhECcRQ0+RuO5cWJWVPdWSgKNDjIschBv9s2bc64U42Ej
 EsYQ==
X-Gm-Message-State: AOAM531Rd+uq9snU6CBybfrnfqZB8u1tJYu4H51NYgJ0Z8Tr2vL7vbDG
 HM+bfszx9GFswXPW4pDQKpA2XlZa9V2z3+14cpjQjTDmvk0EjHtokcyXsh2FFtI2cDvgFqsb/7y
 WpMmeHlpG7kf5ABOXmmWZYV6Jiu349JE=
X-Received: by 2002:a05:6512:ba0:b0:448:60f9:ae45 with SMTP id
 b32-20020a0565120ba000b0044860f9ae45mr4264710lfv.257.1646973843860; 
 Thu, 10 Mar 2022 20:44:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgTBppi3WDIGGTDsROZGhni10D2BABzhWHHd3dBsqWvvzx73egBjR8CLmUfl0O5EIZpeiA9wLAQ/g1JJzngm0=
X-Received: by 2002:a05:6512:ba0:b0:448:60f9:ae45 with SMTP id
 b32-20020a0565120ba000b0044860f9ae45mr4264700lfv.257.1646973843613; Thu, 10
 Mar 2022 20:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20220310023907.2443-1-jasowang@redhat.com>
 <CAFEAcA9gqfve-qdYzP_VrA0=fcCXGnNpFbi82y0AWCRKpAz+-A@mail.gmail.com>
In-Reply-To: <CAFEAcA9gqfve-qdYzP_VrA0=fcCXGnNpFbi82y0AWCRKpAz+-A@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 11 Mar 2022 12:43:52 +0800
Message-ID: <CACGkMEsyUvO4YZVkhKpdDPq1YO6Nn6Z9Vqh9xxzuyiWuVTkrUw@mail.gmail.com>
Subject: Re: [PULL V2 00/15] Net patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e73cf505d9e9fa7c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e73cf505d9e9fa7c
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 11, 2022 at 1:07 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 10 Mar 2022 at 02:39, Jason Wang <jasowang@redhat.com> wrote:
> >
> > The following changes since commit
> d9ccf33f9479201e5add8db0af68ca9ca8da358b:
> >
> >   Merge remote-tracking branch
> 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging
> (2022-03-09 20:01:17 +0000)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to eea40402ecf895ed345f8e8eb07dbb484f4542c5:
> >
> >   vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-10 10:26:32 +0800)
> >
> > ----------------------------------------------------------------
> >
>
> Lots of 32-bit compile issues: this is 32-bit arm:
> https://gitlab.com/qemu-project/qemu/-/jobs/2188500721
> i386 the same:
> https://gitlab.com/qemu-project/qemu/-/jobs/2188500747
> and 32-bit mips:
> https://gitlab.com/qemu-project/qemu/-/jobs/2188500753


Eugenio, please fix those warnings and send a new version.

Thanks


>
>
> ../hw/virtio/vhost-shadow-virtqueue.c: In function
> 'vhost_svq_valid_features':
> ../hw/virtio/vhost-shadow-virtqueue.c:43:28: error: passing argument 2
> of 'set_bit' from incompatible pointer type
> [-Werror=incompatible-pointer-types]
> set_bit(b, &svq_features);
> ^~~~~~~~~~~~~
> In file included from /builds/qemu-project/qemu/include/qemu/bitmap.h:16,
> from /builds/qemu-project/qemu/include/hw/qdev-core.h:5,
> from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:18,
> from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
> from ../hw/virtio/vhost-shadow-virtqueue.c:11:
> /builds/qemu-project/qemu/include/qemu/bitops.h:36:52: note: expected
> 'long unsigned int *' but argument is of type 'uint64_t *' {aka 'long
> long unsigned int *'}
> static inline void set_bit(long nr, unsigned long *addr)
> ~~~~~~~~~~~~~~~^~~~
> ../hw/virtio/vhost-shadow-virtqueue.c:50:30: error: passing argument 2
> of 'clear_bit' from incompatible pointer type
> [-Werror=incompatible-pointer-types]
> clear_bit(b, &svq_features);
> ^~~~~~~~~~~~~
> In file included from /builds/qemu-project/qemu/include/qemu/bitmap.h:16,
> from /builds/qemu-project/qemu/include/hw/qdev-core.h:5,
> from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:18,
> from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
> from ../hw/virtio/vhost-shadow-virtqueue.c:11:
> /builds/qemu-project/qemu/include/qemu/bitops.h:62:54: note: expected
> 'long unsigned int *' but argument is of type 'uint64_t *' {aka 'long
> long unsigned int *'}
> static inline void clear_bit(long nr, unsigned long *addr)
> ~~~~~~~~~~~~~~~^~~~
> ../hw/virtio/vhost-shadow-virtqueue.c: In function
> 'vhost_svq_translate_addr':
> ../hw/virtio/vhost-shadow-virtqueue.c:91:32: error: cast from pointer
> to integer of different size [-Werror=pointer-to-int-cast]
> .translated_addr = (hwaddr)iovec[i].iov_base,
> ^
> ../hw/virtio/vhost-shadow-virtqueue.c:109:20: error: cast to pointer
> from integer of different size [-Werror=int-to-pointer-cast]
> addrs[i] = (void *)(map->iova + off);
> ^
> In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,
> from ../hw/virtio/vhost-shadow-virtqueue.c:10:
> ../hw/virtio/vhost-shadow-virtqueue.c:111:49: error: incompatible type
> for argument 1 of 'int128_add'
> if (unlikely(int128_gt(int128_add(needle.translated_addr,
> ~~~~~~^~~~~~~~~~~~~~~~
> /builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in
> definition of macro 'unlikely'
> #define unlikely(x) __builtin_expect(!!(x), 0)
> ^
> In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,
> from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,
> from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
> from ../hw/virtio/vhost-shadow-virtqueue.c:11:
> /builds/qemu-project/qemu/include/qemu/int128.h:313:40: note: expected
> 'Int128' {aka 'struct Int128'} but argument is of type 'hwaddr' {aka
> 'long long unsigned int'}
> static inline Int128 int128_add(Int128 a, Int128 b)
> ~~~~~~~^
> In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,
> from ../hw/virtio/vhost-shadow-virtqueue.c:10:
> ../hw/virtio/vhost-shadow-virtqueue.c:112:51: error: incompatible type
> for argument 2 of 'int128_add'
> iovec[i].iov_len),
> ~~~~~~~~^~~~~~~~
> /builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in
> definition of macro 'unlikely'
> #define unlikely(x) __builtin_expect(!!(x), 0)
> ^
> In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,
> from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,
> from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
> from ../hw/virtio/vhost-shadow-virtqueue.c:11:
> /builds/qemu-project/qemu/include/qemu/int128.h:313:50: note: expected
> 'Int128' {aka 'struct Int128'} but argument is of type 'size_t' {aka
> 'const unsigned int'}
> static inline Int128 int128_add(Int128 a, Int128 b)
> ~~~~~~~^
> In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,
> from ../hw/virtio/vhost-shadow-virtqueue.c:10:
> ../hw/virtio/vhost-shadow-virtqueue.c:113:53: error: incompatible type
> for argument 2 of 'int128_gt'
> map->translated_addr + map->size))) {
> ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
> /builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in
> definition of macro 'unlikely'
> #define unlikely(x) __builtin_expect(!!(x), 0)
> ^
> In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,
> from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,
> from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,
> from ../hw/virtio/vhost-shadow-virtqueue.c:11:
> /builds/qemu-project/qemu/include/qemu/int128.h:367:47: note: expected
> 'Int128' {aka 'struct Int128'} but argument is of type 'long long
> unsigned int'
> static inline bool int128_gt(Int128 a, Int128 b)
> ~~~~~~~^
> ../hw/virtio/vhost-shadow-virtqueue.c: In function
> 'vhost_vring_write_descs':
> ../hw/virtio/vhost-shadow-virtqueue.c:143:37: error: cast from pointer
> to integer of different size [-Werror=pointer-to-int-cast]
> descs[i].addr = cpu_to_le64((hwaddr)sg[n]);
> ^
> ../hw/virtio/vhost-shadow-virtqueue.c: In function
> 'vhost_svq_get_vring_addr':
> ../hw/virtio/vhost-shadow-virtqueue.c:465:28: error: cast from pointer
> to integer of different size [-Werror=pointer-to-int-cast]
> addr->desc_user_addr = (uint64_t)svq->vring.desc;
> ^
> ../hw/virtio/vhost-shadow-virtqueue.c:466:29: error: cast from pointer
> to integer of different size [-Werror=pointer-to-int-cast]
> addr->avail_user_addr = (uint64_t)svq->vring.avail;
> ^
> ../hw/virtio/vhost-shadow-virtqueue.c:467:28: error: cast from pointer
> to integer of different size [-Werror=pointer-to-int-cast]
> addr->used_user_addr = (uint64_t)svq->vring.used;
> ^
> cc1: all warnings being treated as errors
>
>
> -- PMM
>
>

--000000000000e73cf505d9e9fa7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 11, 2022 at 1:07 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 10 Mar 2022 at 02:39, Jason Wang &lt;<a href=3D"mailto:jasowa=
ng@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit d9ccf33f9479201e5add8db0af68ca9ca8d=
a358b:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/lvivier-gitlab/t=
ags/linux-user-for-7.0-pull-request&#39; into staging (2022-03-09 20:01:17 =
+0000)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/jasowang/qemu.git" rel=3D"no=
referrer" target=3D"_blank">https://github.com/jasowang/qemu.git</a> tags/n=
et-pull-request<br>
&gt;<br>
&gt; for you to fetch changes up to eea40402ecf895ed345f8e8eb07dbb484f4542c=
5:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-10 10:26:32 +=
0800)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt;<br>
<br>
Lots of 32-bit compile issues: this is 32-bit arm:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2188500721" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/21=
88500721</a><br>
i386 the same:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2188500747" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/21=
88500747</a><br>
and 32-bit mips:<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/2188500753" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/21=
88500753</a></blockquote><div><br></div><div>Eugenio, please fix those warn=
ings and send a new version.</div><div><br></div><div>Thanks</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
../hw/virtio/vhost-shadow-virtqueue.c: In function &#39;vhost_svq_valid_fea=
tures&#39;:<br>
../hw/virtio/vhost-shadow-virtqueue.c:43:28: error: passing argument 2<br>
of &#39;set_bit&#39; from incompatible pointer type<br>
[-Werror=3Dincompatible-pointer-types]<br>
set_bit(b, &amp;svq_features);<br>
^~~~~~~~~~~~~<br>
In file included from /builds/qemu-project/qemu/include/qemu/bitmap.h:16,<b=
r>
from /builds/qemu-project/qemu/include/hw/qdev-core.h:5,<br>
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:18,<br>
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,<br>
from ../hw/virtio/vhost-shadow-virtqueue.c:11:<br>
/builds/qemu-project/qemu/include/qemu/bitops.h:36:52: note: expected<br>
&#39;long unsigned int *&#39; but argument is of type &#39;uint64_t *&#39; =
{aka &#39;long<br>
long unsigned int *&#39;}<br>
static inline void set_bit(long nr, unsigned long *addr)<br>
~~~~~~~~~~~~~~~^~~~<br>
../hw/virtio/vhost-shadow-virtqueue.c:50:30: error: passing argument 2<br>
of &#39;clear_bit&#39; from incompatible pointer type<br>
[-Werror=3Dincompatible-pointer-types]<br>
clear_bit(b, &amp;svq_features);<br>
^~~~~~~~~~~~~<br>
In file included from /builds/qemu-project/qemu/include/qemu/bitmap.h:16,<b=
r>
from /builds/qemu-project/qemu/include/hw/qdev-core.h:5,<br>
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:18,<br>
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,<br>
from ../hw/virtio/vhost-shadow-virtqueue.c:11:<br>
/builds/qemu-project/qemu/include/qemu/bitops.h:62:54: note: expected<br>
&#39;long unsigned int *&#39; but argument is of type &#39;uint64_t *&#39; =
{aka &#39;long<br>
long unsigned int *&#39;}<br>
static inline void clear_bit(long nr, unsigned long *addr)<br>
~~~~~~~~~~~~~~~^~~~<br>
../hw/virtio/vhost-shadow-virtqueue.c: In function &#39;vhost_svq_translate=
_addr&#39;:<br>
../hw/virtio/vhost-shadow-virtqueue.c:91:32: error: cast from pointer<br>
to integer of different size [-Werror=3Dpointer-to-int-cast]<br>
.translated_addr =3D (hwaddr)iovec[i].iov_base,<br>
^<br>
../hw/virtio/vhost-shadow-virtqueue.c:109:20: error: cast to pointer<br>
from integer of different size [-Werror=3Dint-to-pointer-cast]<br>
addrs[i] =3D (void *)(map-&gt;iova + off);<br>
^<br>
In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,<br=
>
from ../hw/virtio/vhost-shadow-virtqueue.c:10:<br>
../hw/virtio/vhost-shadow-virtqueue.c:111:49: error: incompatible type<br>
for argument 1 of &#39;int128_add&#39;<br>
if (unlikely(int128_gt(int128_add(needle.translated_addr,<br>
~~~~~~^~~~~~~~~~~~~~~~<br>
/builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in<br>
definition of macro &#39;unlikely&#39;<br>
#define unlikely(x) __builtin_expect(!!(x), 0)<br>
^<br>
In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,<b=
r>
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,<br>
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,<br>
from ../hw/virtio/vhost-shadow-virtqueue.c:11:<br>
/builds/qemu-project/qemu/include/qemu/int128.h:313:40: note: expected<br>
&#39;Int128&#39; {aka &#39;struct Int128&#39;} but argument is of type &#39=
;hwaddr&#39; {aka<br>
&#39;long long unsigned int&#39;}<br>
static inline Int128 int128_add(Int128 a, Int128 b)<br>
~~~~~~~^<br>
In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,<br=
>
from ../hw/virtio/vhost-shadow-virtqueue.c:10:<br>
../hw/virtio/vhost-shadow-virtqueue.c:112:51: error: incompatible type<br>
for argument 2 of &#39;int128_add&#39;<br>
iovec[i].iov_len),<br>
~~~~~~~~^~~~~~~~<br>
/builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in<br>
definition of macro &#39;unlikely&#39;<br>
#define unlikely(x) __builtin_expect(!!(x), 0)<br>
^<br>
In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,<b=
r>
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,<br>
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,<br>
from ../hw/virtio/vhost-shadow-virtqueue.c:11:<br>
/builds/qemu-project/qemu/include/qemu/int128.h:313:50: note: expected<br>
&#39;Int128&#39; {aka &#39;struct Int128&#39;} but argument is of type &#39=
;size_t&#39; {aka<br>
&#39;const unsigned int&#39;}<br>
static inline Int128 int128_add(Int128 a, Int128 b)<br>
~~~~~~~^<br>
In file included from /builds/qemu-project/qemu/include/qemu/osdep.h:37,<br=
>
from ../hw/virtio/vhost-shadow-virtqueue.c:10:<br>
../hw/virtio/vhost-shadow-virtqueue.c:113:53: error: incompatible type<br>
for argument 2 of &#39;int128_gt&#39;<br>
map-&gt;translated_addr + map-&gt;size))) {<br>
~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~<br>
/builds/qemu-project/qemu/include/qemu/compiler.h:43:43: note: in<br>
definition of macro &#39;unlikely&#39;<br>
#define unlikely(x) __builtin_expect(!!(x), 0)<br>
^<br>
In file included from /builds/qemu-project/qemu/include/exec/memory.h:26,<b=
r>
from /builds/qemu-project/qemu/include/hw/virtio/virtio.h:17,<br>
from /builds/qemu-project/qemu/hw/virtio/vhost-shadow-virtqueue.h:14,<br>
from ../hw/virtio/vhost-shadow-virtqueue.c:11:<br>
/builds/qemu-project/qemu/include/qemu/int128.h:367:47: note: expected<br>
&#39;Int128&#39; {aka &#39;struct Int128&#39;} but argument is of type &#39=
;long long<br>
unsigned int&#39;<br>
static inline bool int128_gt(Int128 a, Int128 b)<br>
~~~~~~~^<br>
../hw/virtio/vhost-shadow-virtqueue.c: In function &#39;vhost_vring_write_d=
escs&#39;:<br>
../hw/virtio/vhost-shadow-virtqueue.c:143:37: error: cast from pointer<br>
to integer of different size [-Werror=3Dpointer-to-int-cast]<br>
descs[i].addr =3D cpu_to_le64((hwaddr)sg[n]);<br>
^<br>
../hw/virtio/vhost-shadow-virtqueue.c: In function &#39;vhost_svq_get_vring=
_addr&#39;:<br>
../hw/virtio/vhost-shadow-virtqueue.c:465:28: error: cast from pointer<br>
to integer of different size [-Werror=3Dpointer-to-int-cast]<br>
addr-&gt;desc_user_addr =3D (uint64_t)svq-&gt;vring.desc;<br>
^<br>
../hw/virtio/vhost-shadow-virtqueue.c:466:29: error: cast from pointer<br>
to integer of different size [-Werror=3Dpointer-to-int-cast]<br>
addr-&gt;avail_user_addr =3D (uint64_t)svq-&gt;vring.avail;<br>
^<br>
../hw/virtio/vhost-shadow-virtqueue.c:467:28: error: cast from pointer<br>
to integer of different size [-Werror=3Dpointer-to-int-cast]<br>
addr-&gt;used_user_addr =3D (uint64_t)svq-&gt;vring.used;<br>
^<br>
cc1: all warnings being treated as errors<br>
<br>
<br>
-- PMM<br>
<br>
</blockquote></div></div>

--000000000000e73cf505d9e9fa7c--


