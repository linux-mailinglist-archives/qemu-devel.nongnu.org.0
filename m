Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9652F2F4EFC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:42:56 +0100 (CET)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziIR-000539-Nr
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kziHG-0004WT-1P
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:41:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kziHC-0004HS-Nu
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eyzS+Nbwn9/YU5ehTSTOi/WQ7gnzwqPumqtmMxjq0t0=;
 b=bs+8I3TTVyAxBh5SjJDutAg6N1JgrFiQugvh1xeOPo6WPYq2VQRQFrp133az3ZuPUQ96uQ
 HeNygozw/DO7m4M+xFXP/pYMfL8k12HZKJWPjWXua1aMvWZFxU2XKaWvCISuvVQjjsQpXq
 UUckZAfCVSZnP4BxcT274ci9ZlI3mkQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-jL8S14SFMnGBPyYZwWMoqA-1; Wed, 13 Jan 2021 10:41:34 -0500
X-MC-Unique: jL8S14SFMnGBPyYZwWMoqA-1
Received: by mail-pj1-f71.google.com with SMTP id s14so1559949pjk.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyzS+Nbwn9/YU5ehTSTOi/WQ7gnzwqPumqtmMxjq0t0=;
 b=iX8nETv9D3HveXDzxgjZJXeKTPt6PCd0BGbUFEXs7u1D/HxTEQc/7L0/U/TjYMfSqy
 QvQqO2Q0cXTjKnsa+Mw4M3vkOmQ4wRC19wykZwTZgryTD3bmJr1O6GBlEt7FgmvZUE5t
 jfZs6+kNq6+IpJZcRkDgZCjn7joCHo9xb7SXt4Tp2g+X3q5KTU9+PP3vi485HBaSMKi6
 3VX2pumYXE7X6+K4Qty8ZUNO8f7zwGDU0Qz1e1YLTtIhYmsXtrKZHKLsuq3twCHFRSo3
 6eVUEhHyOO5yoNhpyRDlhgWfsu4MJzNRIbw9himf1SvJJNJKm5pH0cO1q3eLN6WHJWVS
 kAew==
X-Gm-Message-State: AOAM531rljdbwAerl/QtmOrWJel1ODBbndS2c+sWPz+ghjKNSDE/5SKm
 PPi4QDuwVTK9W4WJgYzpRJwLZsSJ872yD4wMMIL+HCvPegZ1tpWzsESXN7Tqs/Qmwmzx59fhqtr
 BHM/8vKDQJckaWrMOW+nPawqxwHludoU=
X-Received: by 2002:a62:fc4a:0:b029:19e:3b99:d584 with SMTP id
 e71-20020a62fc4a0000b029019e3b99d584mr2870998pfh.59.1610552493144; 
 Wed, 13 Jan 2021 07:41:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQF/3tgwZLfSOo70KOQQSZe9VfU0EAdaqZEWGRAJfcEOcn2gPc7h3deD5DipkKZ1hlRbzSzjgudzth+Zj5E6E=
X-Received: by 2002:a62:fc4a:0:b029:19e:3b99:d584 with SMTP id
 e71-20020a62fc4a0000b029019e3b99d584mr2870980pfh.59.1610552492866; Wed, 13
 Jan 2021 07:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20210113090430.26394-1-weijiang.yang@intel.com>
 <5dd8016f-dc18-ee4d-c150-5deabe60e559@redhat.com>
 <20210113150429.GA29878@local-michael-cet-test.sh.intel.com>
In-Reply-To: <20210113150429.GA29878@local-michael-cet-test.sh.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 13 Jan 2021 16:41:20 +0100
Message-ID: <CABgObfaw2kGhxzDLPJ2wpeoN=tnwafzFwB9suBuMZNfZrfJc+w@mail.gmail.com>
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
To: Yang Weijiang <weijiang.yang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003ad77205b8c9f941"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Sean Christopherson <seanjc@google.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003ad77205b8c9f941
Content-Type: text/plain; charset="UTF-8"

Yes, thanks.

Paolo


Il mer 13 gen 2021, 15:52 Yang Weijiang <weijiang.yang@intel.com> ha
scritto:

> On Wed, Jan 13, 2021 at 11:06:09AM +0100, Paolo Bonzini wrote:
> > On 13/01/21 10:04, Yang Weijiang wrote:
> > > QEMU option -cpu max(max_features) means "Enables all features
> supported by
> > > the accelerator in the current host", this looks true for all the
> features
> > > except guest max physical address width, so add this patch to enable
> it.
> > >
> > > Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> > > ---
> > >   target/i386/cpu.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > index 35459a38bb..b5943406f7 100644
> > > --- a/target/i386/cpu.c
> > > +++ b/target/i386/cpu.c
> > > @@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *dev,
> Error **errp)
> > >                   warned = true;
> > >               }
> > > -            if (cpu->host_phys_bits) {
> > > +            if (cpu->host_phys_bits || cpu->max_features) {
> > >                   /* The user asked for us to use the host physical
> bits */
> > >                   cpu->phys_bits = host_phys_bits;
> > >                   if (cpu->host_phys_bits_limit &&
> > >
> >
> > Can you check if this works?
> >
> Hi, Paolo,
> Yes, below change works for kvm-unit-test/access. Would you add the
> patch?
>
> Thanks!
>
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 35459a38bb..72a79e6019 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -4319,6 +4319,7 @@ static void max_x86_cpu_initfn(Object *obj)
> >          if (lmce_supported()) {
> >              object_property_set_bool(OBJECT(cpu), "lmce", true,
> > &error_abort);
> >          }
> > +        object_property_set_bool(OBJECT(cpu), "host-phys-bits", true,
> > &error_abort);
> >      } else {
> >          object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
> >                                  &error_abort);
> >
> >
> > It should allow people to use -cpu max,host-phys-bits=false.
> >
> > Thanks,
> >
> > Paolo
>
>

--0000000000003ad77205b8c9f941
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, thanks.<div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div><div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 13 gen 2021, 15:52 Yang Weij=
iang &lt;<a href=3D"mailto:weijiang.yang@intel.com">weijiang.yang@intel.com=
</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Jan 13=
, 2021 at 11:06:09AM +0100, Paolo Bonzini wrote:<br>
&gt; On 13/01/21 10:04, Yang Weijiang wrote:<br>
&gt; &gt; QEMU option -cpu max(max_features) means &quot;Enables all featur=
es supported by<br>
&gt; &gt; the accelerator in the current host&quot;, this looks true for al=
l the features<br>
&gt; &gt; except guest max physical address width, so add this patch to ena=
ble it.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Yang Weijiang &lt;<a href=3D"mailto:weijiang.yang@=
intel.com" target=3D"_blank" rel=3D"noreferrer">weijiang.yang@intel.com</a>=
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0target/i386/cpu.c | 2 +-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/target/i386/cpu.c b/target/i386/cpu.c<br>
&gt; &gt; index 35459a38bb..b5943406f7 100644<br>
&gt; &gt; --- a/target/i386/cpu.c<br>
&gt; &gt; +++ b/target/i386/cpu.c<br>
&gt; &gt; @@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *=
dev, Error **errp)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0warned =3D true;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;host_phys_=
bits) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;host_phys_=
bits || cpu-&gt;max_features) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* The user asked for us to use the host physical bits */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cpu-&gt;phys_bits =3D host_phys_bits;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (cpu-&gt;host_phys_bits_limit &amp;&amp;<br>
&gt; &gt; <br>
&gt; <br>
&gt; Can you check if this works?<br>
&gt; <br>
Hi, Paolo,<br>
Yes, below change works for kvm-unit-test/access. Would you add the<br>
patch? <br>
<br>
Thanks!<br>
<br>
&gt; diff --git a/target/i386/cpu.c b/target/i386/cpu.c<br>
&gt; index 35459a38bb..72a79e6019 100644<br>
&gt; --- a/target/i386/cpu.c<br>
&gt; +++ b/target/i386/cpu.c<br>
&gt; @@ -4319,6 +4319,7 @@ static void max_x86_cpu_initfn(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (lmce_supported()) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bo=
ol(OBJECT(cpu), &quot;lmce&quot;, true,<br>
&gt; &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bool(OBJECT(cpu), &qu=
ot;host-phys-bits&quot;, true,<br>
&gt; &amp;error_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_str(OBJECT(cpu),=
 &quot;vendor&quot;, CPUID_VENDOR_AMD,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; <br>
&gt; <br>
&gt; It should allow people to use -cpu max,host-phys-bits=3Dfalse.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Paolo<br>
<br>
</blockquote></div>

--0000000000003ad77205b8c9f941--


