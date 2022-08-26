Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736825A305C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:14:49 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRfj6-0004ry-Cz
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRfh3-0002vb-P4
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:12:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRfgx-0005Br-NV
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:12:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661544755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyQwhEtgprk3kKjqa+kOaCMyCDw7XVOmK7qNdrar+sE=;
 b=dw20S8ve8RfzYsHsJ/k8Kkk0P/1WvofwjhGMm5BfOTIclXXZrnck6b/jMLTrXWNCLi3tjp
 xIUG2FNfWX7T/5EKqNGD+IfIUbatoGSH5MOll67C02YcNhtNh0OlysADYUXq0p5lefCPsS
 6esIGZZAPV0lUW4HWEZq+MXQ1LJI8+8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-hl57m8EtO9Knl-zLK2HAig-1; Fri, 26 Aug 2022 16:12:33 -0400
X-MC-Unique: hl57m8EtO9Knl-zLK2HAig-1
Received: by mail-lf1-f71.google.com with SMTP id
 i27-20020a056512007b00b00492dd93ca9dso351194lfo.8
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uyQwhEtgprk3kKjqa+kOaCMyCDw7XVOmK7qNdrar+sE=;
 b=dOc4Ya4d50ChN+4uLRvQQFi+liPE5paEsoqhkeO4cZkmQGoKYJ9jLOo8tf3hthGpIq
 sHk3WKNTbZUmJ2OImWFBP0pCU7PoPNXrJMuqtImiLxr34oKiLKloxlVHyrZzzBcREKTN
 1MZ5Z6QCCP58rtvGokvBD2hvzEfWw1ajKrQijmR13KJS1q2baH6aVa7sEdApiqc4Gs2p
 DY2PYO66DOFKHFCPKsPt+a4pOoP2mgWDvo2Ns8CDWWM/s+/TPSlRgiXaJ+vuQJmIIOKc
 m2nEgzMin7hboFxGHSyViiEVLhCZySH3EkJ3JkE7pbLUl2UCpRVxH8tF6zaIQU0RiSok
 xebw==
X-Gm-Message-State: ACgBeo3du1ojJLqUgQC6E/uVJQMdACVdJ8M2FZvaYkSDvVrDgKqED8Mo
 /pktUpNZoEId4fWm8X68FGrCU1XUrB3ob6NX6ooO5rI4SH6XpVpHwQOcORbcUVPl+oKj9k2sYlT
 WTXEL2mwpIZa9khY82Nr+y7vAzgc61ss=
X-Received: by 2002:a05:6512:da:b0:492:e48e:b4c0 with SMTP id
 c26-20020a05651200da00b00492e48eb4c0mr3033839lfp.7.1661544752074; 
 Fri, 26 Aug 2022 13:12:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Qome/VaiFVimZ5gzA/R2h7mRkV9nfBeCvGl2As/kTLJAMHMk96A3fjhQ6gYSysJI+5BFrzas6652JeIUuKgo=
X-Received: by 2002:a05:6512:da:b0:492:e48e:b4c0 with SMTP id
 c26-20020a05651200da00b00492e48eb4c0mr3033831lfp.7.1661544751829; Fri, 26 Aug
 2022 13:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220826110029.59382-1-pbonzini@redhat.com>
 <CAAdtpL6QSx0DFCACP_=+UAx_CO4g3gEcHmXKsrxvDp1MC3PXiw@mail.gmail.com>
In-Reply-To: <CAAdtpL6QSx0DFCACP_=+UAx_CO4g3gEcHmXKsrxvDp1MC3PXiw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Aug 2022 22:12:20 +0200
Message-ID: <CABgObfYrT6r+6nMscud4rC9KTqQwgSRq6ZssN8BMwR9ECM0vEg@mail.gmail.com>
Subject: Re: [PATCH] KVM: dirty ring: add missing memory barrier
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b6309905e72a88a4"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b6309905e72a88a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yikes no, the patch is obviously bogus.

Paolo

Il ven 26 ago 2022, 17:59 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> Hi Paolo,
>
> On Fri, Aug 26, 2022 at 1:17 PM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>
>> The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.  If
>> the read of the fields are not ordered after the read of the flag,
>> QEMU might see stale values.
>>
>> Cc: Peter Xu <peterx@redhat.com>
>> Cc: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  accel/kvm/kvm-all.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
>> index 8d81ab74de..f49643cd24 100644
>> --- a/accel/kvm/kvm-all.c
>> +++ b/accel/kvm/kvm-all.c
>> @@ -719,7 +719,7 @@ static void kvm_dirty_ring_mark_page(KVMState *s,
>> uint32_t as_id,
>>
>>  static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>>  {
>> -    return gfn->flags =3D=3D KVM_DIRTY_GFN_F_DIRTY;
>> +    return qatomic_load_acquire(&gfn->flags, KVM_DIRTY_GFN_F_DIRTY);
>>
>
> Is this patch based on another which changes the qatomic_load_acquire()
> prototype?
>
>
>>  }
>>
>>  static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
>> --
>> 2.37.1
>>
>>
>>

--000000000000b6309905e72a88a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yikes no, the patch is obviously bogus.<div dir=3D"auto">=
<br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Il ven 26 ago 2022, 17:59 Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a=
>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr">Hi Paolo,</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 1:17 PM Paolo Bonzini &lt=
;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noreferrer=
">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry =
is valid.=C2=A0 If<br>
the read of the fields are not ordered after the read of the flag,<br>
QEMU might see stale values.<br>
<br>
Cc: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"_blank" rel=
=3D"noreferrer">peterx@redhat.com</a>&gt;<br>
Cc: Gavin Shan &lt;<a href=3D"mailto:gshan@redhat.com" target=3D"_blank" re=
l=3D"noreferrer">gshan@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0accel/kvm/kvm-all.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
index 8d81ab74de..f49643cd24 100644<br>
--- a/accel/kvm/kvm-all.c<br>
+++ b/accel/kvm/kvm-all.c<br>
@@ -719,7 +719,7 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint3=
2_t as_id,<br>
<br>
=C2=A0static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return gfn-&gt;flags =3D=3D KVM_DIRTY_GFN_F_DIRTY;<br>
+=C2=A0 =C2=A0 return qatomic_load_acquire(&amp;gfn-&gt;flags, KVM_DIRTY_GF=
N_F_DIRTY);<br></blockquote><div><br></div><div>Is this patch based on anot=
her which changes the=C2=A0qatomic_load_acquire() prototype?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)<br>
-- <br>
2.37.1<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000b6309905e72a88a4--


