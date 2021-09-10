Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E531C4072C3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:58:52 +0200 (CEST)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOnbn-0002A1-G1
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOnak-0001OO-E7
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOnah-0001zA-Es
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631307461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d+AaOreZL+xD1qLEh6cGdiTmqxvzkfZCY2+mHij6e80=;
 b=gOb0O6+zGZbEeOsfCpHkcNTtGBqPhmFFfv8NvQTEtmtqz0+F60ZZv+ltRgtzBo4ADWDI26
 7j5imErLAxPY7wo2BLB42PrvV8VvysT6ZKy1VGeUJLfyx6SEdehilk2mFe2xyHNYasWxCK
 Jzim2RcQkzttL6EBIpMURi/DNLRENx8=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-kbJdHPH6NDW0qB9L043y8g-1; Fri, 10 Sep 2021 16:57:39 -0400
X-MC-Unique: kbJdHPH6NDW0qB9L043y8g-1
Received: by mail-pj1-f72.google.com with SMTP id
 c2-20020a17090a558200b001873dcb7f09so2753992pji.7
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 13:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+AaOreZL+xD1qLEh6cGdiTmqxvzkfZCY2+mHij6e80=;
 b=X24enkHW7bAXpfodtsImCs9HGZ/zd7ngiHC0teYiOsqU7IStPnU5ubxllKckAaDuVT
 aDGV6LknsyNdE9Pex3lQ7zdS3o0YlekhrKcJd74FPYedUTvNV9oaTwrDhd4qvfmLWDnR
 jx4Zi9wNFITP4mPFt6lyGgtR9aEQPhJ01T6Io4Tx5DcQKSzQn5yo+aPRsK3Rx+fiD9yk
 7vyDHIW0bBzEfk+n880RmVyUuq45uSmXB6vyUhZA3FZ+55q3Znc6MSwN3/3V/YPnwOUS
 x9JuadRgXhl/eqKnNVNzCeoDWRowV4h0UfpVT0HrD7lcuJxalgWOuGlS2P5v0vy1sXON
 9MqA==
X-Gm-Message-State: AOAM533LX88M5CNsh+QRQyXDRr2junvQMBLNNwXo4TUG3naUoieKXWFa
 dW+sJDKocVMdrPNWnxcqBL1JcaKJarWVM4RVsIbgrj4/jdIQHQhyMxABhv1iv909quR1CFIaU2N
 vvntPF5q+UFXxm6YOCYy/H/J3yaSjs/I=
X-Received: by 2002:a05:6a00:189b:b0:410:2a10:17dc with SMTP id
 x27-20020a056a00189b00b004102a1017dcmr9989101pfh.4.1631307458843; 
 Fri, 10 Sep 2021 13:57:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqFPUFqJeZlcpNQEgTOHpEmO/yKHl2F4q8S7JmpDGnLBEIq9TsSbcgMRQWb05nJL88tOPHJ52/TN5rRtus/Ig=
X-Received: by 2002:a05:6a00:189b:b0:410:2a10:17dc with SMTP id
 x27-20020a056a00189b00b004102a1017dcmr9989068pfh.4.1631307458351; Fri, 10 Sep
 2021 13:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
 <YTt7H9ifqjeOQztl@google.com>
 <b940de84-7eac-59de-7b15-15060c31de52@redhat.com>
 <YTuXJUjR8noe34h6@google.com>
 <cfcf6570-79c2-f351-d651-2cb25f691165@redhat.com>
 <YTu+LG8v6eOhQBzi@google.com>
In-Reply-To: <YTu+LG8v6eOhQBzi@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Sep 2021 22:57:25 +0200
Message-ID: <CABgObfZh3pzktRbZf0+kvz=Vf0kbHTCGH=HK=DwyFsTQMbzfQA@mail.gmail.com>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
To: Sean Christopherson <seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000932cfd05cbaa5db2"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 "Blake, Eric" <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, "Huang,
 Kai" <kai.huang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000932cfd05cbaa5db2
Content-Type: text/plain; charset="UTF-8"

Il ven 10 set 2021, 22:21 Sean Christopherson <seanjc@google.com> ha
scritto:

> > It's also possible that QEMU handles failure, but the kernel does two
> > passes; then QEMU can just do two passes.  The kernel will overall do
> four
> > passes, but:
> >
> > 1) the second (SECS pinned by children in the same vEPC) would be cheaper
> > than a full second pass
>
> The problem is that this would require a list_head (or temp allocations)
> to track
> the SECS pages that failed the first time 'round.  For vEPC destruction,
> the kernel
> can use sgx_epc_page.list because it can take the pages off the
> active/allocated
> list, but that's not an option in this case because the
> presumably-upcoming EPC
> cgroup needs to keep pages on the list to handle OOM.
>

Good point, so yeah: let's go for a ioctl that does full removal, returning
the number of failures. I will try and cobble up a patch unless Kai beats
me to it.

Thanks for the quick discussion!

Paolo


> The kernel's ioctl/syscall/whatever could return the number of pages that
> were
> not freed, or maybe just -EAGAIN, and userspace could use that to know it
> needs
> to do another reset to free everything.
>
> My thought for QEMU was to do (bad pseudocode):
>
>         /* Retry to EREMOVE pinned SECS pages if necessary. */
>         ret = ioctl(SGX_VEPC_RESET, ...);
>         if (ret)
>                 ret = ioctl(SGX_VEPC_RESET, ...);
>
>         /*
>          * Tag the VM as needed yet another round of resets to ERMOVE SECS
> pages
>          * that were pinned across vEPC sections.
>          */
>         vm->sgx_epc_final_reset_needed = !!ret;
>
> > 2) the fourth would actually do nothing, because there would be no pages
> > failing the EREMOV'al.
> >
> > A hypothetical other SGX client that only uses one vEPC will do the right
> > thing with a single pass.
>
>

--000000000000932cfd05cbaa5db2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 10 set 2021, 22:21 Sean Christopherson &lt;<a h=
ref=3D"mailto:seanjc@google.com" target=3D"_blank" rel=3D"noreferrer">seanj=
c@google.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&g=
t; It&#39;s also possible that QEMU handles failure, but the kernel does tw=
o<br>
&gt; passes; then QEMU can just do two passes.=C2=A0 The kernel will overal=
l do four<br>
&gt; passes, but:<br>
&gt; <br>
&gt; 1) the second (SECS pinned by children in the same vEPC) would be chea=
per<br>
&gt; than a full second pass<br>
<br>
The problem is that this would require a list_head (or temp allocations) to=
 track<br>
the SECS pages that failed the first time &#39;round.=C2=A0 For vEPC destru=
ction, the kernel<br>
can use sgx_epc_page.list because it can take the pages off the active/allo=
cated<br>
list, but that&#39;s not an option in this case because the presumably-upco=
ming EPC<br>
cgroup needs to keep pages on the list to handle OOM.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">Good point, so yeah: l=
et&#39;s go for a ioctl that does full removal, returning the number of fai=
lures. I will try and cobble up a patch unless Kai beats me to it.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks for the quick discussion!=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"=
auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
The kernel&#39;s ioctl/syscall/whatever could return the number of pages th=
at were<br>
not freed, or maybe just -EAGAIN, and userspace could use that to know it n=
eeds<br>
to do another reset to free everything.<br>
<br>
My thought for QEMU was to do (bad pseudocode):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Retry to EREMOVE pinned SECS pages if necess=
ary. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(SGX_VEPC_RESET, ...);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(SGX_V=
EPC_RESET, ...);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Tag the VM as needed yet another round =
of resets to ERMOVE SECS pages<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* that were pinned across vEPC sections.<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vm-&gt;sgx_epc_final_reset_needed =3D !!ret;<br=
>
<br>
&gt; 2) the fourth would actually do nothing, because there would be no pag=
es<br>
&gt; failing the EREMOV&#39;al.<br>
&gt; <br>
&gt; A hypothetical other SGX client that only uses one vEPC will do the ri=
ght<br>
&gt; thing with a single pass.<br>
<br>
</blockquote></div></div></div>

--000000000000932cfd05cbaa5db2--


