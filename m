Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FE3B26E2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 07:34:44 +0200 (CEST)
Received: from localhost ([::1]:42384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwI0h-0006dV-6L
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 01:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwHzU-0005gx-Iy
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 01:33:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwHzQ-00058N-U0
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 01:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624512803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VzgWy/Dg66BVore40hBFt2bDYBLrsDGL4+MtbGME5u8=;
 b=bqvOucjl/vQPKLifX/y4KvVAcCOuWaUJTGr4UMf+4eple4pK9vAHRsIL57XH6ZjD503tuJ
 bJHpGB5VcNtrXHczVtAMw5NlHi4Omfd9ixyWWt/UjrxE8bhQOoa8X7AXdQAQ8WxJrG/FId
 mGBEqNtzb8tQIpkEH413iedlCi5kk/U=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-5q4DX9TDNZes5ls5DFykDA-1; Thu, 24 Jun 2021 01:33:19 -0400
X-MC-Unique: 5q4DX9TDNZes5ls5DFykDA-1
Received: by mail-pl1-f198.google.com with SMTP id
 e19-20020a170902ed93b0290110a7ccff51so1732111plj.20
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 22:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VzgWy/Dg66BVore40hBFt2bDYBLrsDGL4+MtbGME5u8=;
 b=FR6kMmNUcRP0FYRaWoxvxIi1t6znn9ZgFd8C/4fFZs0jw96qEoFQEaNVtpzYueFLay
 l7Wo6xaQba3zIezu99wV+rMMsvVBVE39ya3fPHj9teiWXqLoDlJl4Fm0u0/C6j2B1Jpx
 jc8hz3CqsxhBlMqFoIpWzKVdSRafXxEl28a9klgr4mzSlX6bgLx7RrEcbgXoEmjNEy1u
 N6s/WSO9tbZwdSutVui0Ad7hX2b4vyHjbXUIQc4CTQoyPT4cTbOxLrobsMSQrJFGlny4
 YZUQiIFnOnM3VySQfo/QaoxbwXMAWKj4Sdg3tp6U2b3IFjylGmcbNsaEURpWDPyesUEy
 tHUg==
X-Gm-Message-State: AOAM532pdR3WHq2y+3V2xKKg8KFahf6+vfSB1wtWBdq6c6a4iRKVpnBs
 gJVQZWbVhF2C+tnloytFbao/QRZG7iBCNmJUWKnhz6o2LU5pdMMuwpiOsq7Sxq/L5eDqGCrQO6C
 PE3aqehz0LMUHSwSb2AFuPepjhq4oFTY=
X-Received: by 2002:a62:ee16:0:b029:2fe:ffcf:775a with SMTP id
 e22-20020a62ee160000b02902feffcf775amr3277077pfi.59.1624512798174; 
 Wed, 23 Jun 2021 22:33:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdometDJ/hc7/wZxF9GRivLtkqa2OcS6t5kG1rcBbIVFOQZTocs7zrAuclR4G1/k3nb6fN5YFi25iRaMFxLFs=
X-Received: by 2002:a62:ee16:0:b029:2fe:ffcf:775a with SMTP id
 e22-20020a62ee160000b02902feffcf775amr3277045pfi.59.1624512797889; Wed, 23
 Jun 2021 22:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <eeadb47b-d35c-2608-7970-8f754a34258c@redhat.com>
 <20210623073612.ysrtxtpag4wm7k7e@sirius.home.kraxel.org>
In-Reply-To: <20210623073612.ysrtxtpag4wm7k7e@sirius.home.kraxel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 24 Jun 2021 07:33:05 +0200
Message-ID: <CABgObfYR4XMtNaQqxpWc7DZCB2KydrXuwnkccaG56nJaWCotRQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/24] modules: collect module meta-data
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000406e9505c57c5ce6"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Peter Lieven <pl@kamp.de>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Halil Pasic <pasic@linux.vnet.ibm.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000406e9505c57c5ce6
Content-Type: text/plain; charset="UTF-8"

Oh well. Let's add a to-do marker.

Paolo

Il mer 23 giu 2021, 09:36 Gerd Hoffmann <kraxel@redhat.com> ha scritto:

> On Tue, Jun 22, 2021 at 06:03:45PM +0200, Paolo Bonzini wrote:
> > On 21/06/21 14:52, Gerd Hoffmann wrote:
> > > ninja: error: 'libui-curses.a.p/meson-generated_.._config-host.h.o',
> needed by 'ui-curses.modinfo.test', missing and no known rule to make it
> > >
> > > Hmm, not sure where this comes from.  meson doesn't try to link
> > > config-host.h.o into libui-curses.a, so why does extract_all_objects()
> > > return it?
> > >
> > > Test patch (incremental to this series) below.
> >
> > Bug in Meson, fix at https://github.com/mesonbuild/meson/pull/8900.
> You can
> > just ignore missing files.
>
> Well, it's ninja throwing the error not the modinfo script, the script
> doesn't even run ...
>
> take care,
>   Gerd
>
>

--000000000000406e9505c57c5ce6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oh well. Let&#39;s add a to-do marker.<div dir=3D"auto"><=
br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il mer 23 giu 2021, 09:36 Gerd Hoffma=
nn &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; ha sc=
ritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Tue, Jun 22, 2021 at 06:0=
3:45PM +0200, Paolo Bonzini wrote:<br>
&gt; On 21/06/21 14:52, Gerd Hoffmann wrote:<br>
&gt; &gt; ninja: error: &#39;libui-curses.a.p/meson-generated_.._config-hos=
t.h.o&#39;, needed by &#39;ui-curses.modinfo.test&#39;, missing and no know=
n rule to make it<br>
&gt; &gt; <br>
&gt; &gt; Hmm, not sure where this comes from.=C2=A0 meson doesn&#39;t try =
to link<br>
&gt; &gt; config-host.h.o into libui-curses.a, so why does extract_all_obje=
cts()<br>
&gt; &gt; return it?<br>
&gt; &gt; <br>
&gt; &gt; Test patch (incremental to this series) below.<br>
&gt; <br>
&gt; Bug in Meson, fix at <a href=3D"https://github.com/mesonbuild/meson/pu=
ll/8900" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/mesonbuild/meson/pull/8900</a>.=C2=A0 You can<br>
&gt; just ignore missing files.<br>
<br>
Well, it&#39;s ninja throwing the error not the modinfo script, the script<=
br>
doesn&#39;t even run ...<br>
<br>
take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div>

--000000000000406e9505c57c5ce6--


