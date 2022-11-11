Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE78625ED9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otWPF-0002Au-F0; Fri, 11 Nov 2022 10:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otWPC-0002Ad-Pk
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:57:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1otWPB-0000ok-61
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668182240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n4DBu4v0mJ6ndEvvgXqGRh2j4Tb0ovlaatvwNCJ5CYM=;
 b=gjyFh7woIyzJn1GvzT4D4vuSqUk+K90q1b/PRzSdmjNzmOwT1CX5LnPpIeMCNkhB9M9CBT
 dP4Gv29pbxweCTxnuM6DaHGL9/7LRL57qEy9SyJpePc5Rx7DVZAUhZRh6M+i04M2raoi9b
 gttsFDiQ4MMIGYgT0r5ae+eIJoakvkk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-324-OsGqAvvZNdK4b5BkhwYtBA-1; Fri, 11 Nov 2022 10:57:18 -0500
X-MC-Unique: OsGqAvvZNdK4b5BkhwYtBA-1
Received: by mail-ua1-f69.google.com with SMTP id
 z44-20020a9f372f000000b00390af225beaso2151572uad.12
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 07:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n4DBu4v0mJ6ndEvvgXqGRh2j4Tb0ovlaatvwNCJ5CYM=;
 b=6D9WHwToE4XiDyIynDEztOHmq9ADWKMqApdCkNKca9P1GnEljN2PF3Znd3tKuLO9sG
 7FaBQPQOlc17RoNQLPXHKb+UEeVUrF7aw76QIB8poBNROgStFUgf/7jqMu1mrJX1c5Nf
 LZTC02cHrMPpkBTWDegFin43SDY7tL0p/sVUVOr+wzCkWBBAzx+SKg3FtiL39tw0G+hu
 Rr9KKfMBHehpGUTAH+tv+7miEE7HH3bKqfaWdwWQvcFoWGk2jD1VkQIKpYyur7Mz2Zrk
 EZZ6j4EfPVXrzcv60GRMHbX0gu9z3PVsyO+ARaIllKx27NlRY3q1370KYSK3ZjgZNMbg
 vZiA==
X-Gm-Message-State: ANoB5pm37nlRDDNpGI220NnEW7KAO/W7uYM8or4tT3JWvBMDMCTVFCfG
 BeESJax7m2V02ygstguMNWAOL5MlDm6waLzug3EC2CMqr9+oXrPC0dXjvJEfyxk5fXnKRolSqJg
 8CVD3SIrskmGOix/L+Q+sMWSAn2Fntvo=
X-Received: by 2002:a67:d38c:0:b0:3aa:2354:b5d2 with SMTP id
 b12-20020a67d38c000000b003aa2354b5d2mr1207111vsj.16.1668182238134; 
 Fri, 11 Nov 2022 07:57:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Y9exQtjLYYIavJlqiTAOZamEQC2LQIjN+AVPykpodIIew4KfFgULGEVinTVa1mSbhbyANbTDxUi+X2R6VFrI=
X-Received: by 2002:a67:d38c:0:b0:3aa:2354:b5d2 with SMTP id
 b12-20020a67d38c000000b003aa2354b5d2mr1207090vsj.16.1668182237921; Fri, 11
 Nov 2022 07:57:17 -0800 (PST)
MIME-Version: 1.0
References: <874jv6enct.fsf@linaro.org> <87zgcyd70g.fsf@linaro.org>
 <Y21+VFqKpF6LGz2C@x1n> <87r0y9d623.fsf@linaro.org>
 <99a89e48-768c-4cc2-ead4-d2014aec7d44@redhat.com>
 <87iljld1vh.fsf@linaro.org>
In-Reply-To: <87iljld1vh.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 11 Nov 2022 16:57:07 +0100
Message-ID: <CABgObfZ0Kd+BRyqi0tnYoafevtkOAaWU6d6jJ-DJJoqHF9tooA@mail.gmail.com>
Subject: Re: should ioapic_service really be modelling cpu writes?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu-daude@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000b65cd305ed33f16b"
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

--000000000000b65cd305ed33f16b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 11 nov 2022, 15:03 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

>
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > On 11/11/22 13:26, Alex Benn=C3=A9e wrote:
> >>       if (addr > 0xfff || !index) {
> >>           switch (attrs.requester_type) {
> >>           }
> >>           MSIMessage msi =3D { .address =3D addr, .data =3D val };
> >>           apic_send_msi(&msi);
> >>           return MEMTX_OK;
> >>       }
> >
> >
> >> which at least gets things booting properly. Does this seem like a
> >> better modelling of the APIC behaviour?
> >
> > Yes and you don't even need the "if", just do MTRT_CPU vs everything
> > else.
>
> Can the CPU trigger MSIs by writing to this area of memory?


No, it's a different bus. If it can in QEMU that's a bug.

I went for
> the explicit switch for clarity but are you saying:
>
>         if (attrs.requester_type !=3D MTRT_CPU) {
>             MSIMessage msi =3D { .address =3D addr, .data =3D val };
>             apic_send_msi(&msi);
>             return MEMTX_OK;
>         } else {
>             return MEMTX_ACESSS_ERROR;
>         }
>
> for the MSI range?
>

Yes that would work. It can be tightened even further by removing the "if
(addr ...)" completely and only checking the requester type (which in turn
I would do with a function like "return APIC based on txattrs requester
type and id, or return NULL if requester not MTRT_CPU"), but no need to
hurry.

Thanks,

Paolo


>
> >
> > Paolo
>
>
> --
> Alex Benn=C3=A9e
>
>

--000000000000b65cd305ed33f16b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 11 nov 2022, 15:03 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; writes:<br>
<br>
&gt; On 11/11/22 13:26, Alex Benn=C3=A9e wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr &gt; 0xfff || !index) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attrs.requester_ty=
pe) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSIMessage msi =3D { .addr=
ess =3D addr, .data =3D val };<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0apic_send_msi(&amp;msi);<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return MEMTX_OK;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;<br>
&gt;&gt; which at least gets things booting properly. Does this seem like a=
<br>
&gt;&gt; better modelling of the APIC behaviour?<br>
&gt;<br>
&gt; Yes and you don&#39;t even need the &quot;if&quot;, just do MTRT_CPU v=
s everything<br>
&gt; else.<br>
<br>
Can the CPU trigger MSIs by writing to this area of memory?</blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">No, it&#39;s a diffe=
rent bus. If it can in QEMU that&#39;s a bug.</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"> I went for<br>
the explicit switch for clarity but are you saying:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (attrs.requester_type !=3D MTRT_CPU) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MSIMessage msi =3D { .address =3D=
 addr, .data =3D val };<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 apic_send_msi(&amp;msi);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return MEMTX_OK;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return MEMTX_ACESSS_ERROR;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
for the MSI range?<br></blockquote></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Yes that would work. It can be tightened even further by =
removing the &quot;if (addr ...)&quot; completely and only checking the req=
uester type (which in turn I would do with a function like &quot;return API=
C based on txattrs requester type and id, or return NULL if requester not M=
TRT_CPU&quot;), but no need to hurry.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Thanks,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pa=
olo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt;<br>
&gt; Paolo<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br>
</blockquote></div></div></div>

--000000000000b65cd305ed33f16b--


