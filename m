Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4015F7909
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 15:33:26 +0200 (CEST)
Received: from localhost ([::1]:55088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ognTg-0001kj-Nd
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 09:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogkvX-0006je-PI
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogkvW-0003QW-8A
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r/BAgIzClzAGx5jh6u6jtBMGZR9/zeToWliBhmBv7Xg=;
 b=BHKiCDopr9nA78Acnnju+Sa6T2fWRyRAymXLeODN3igoJYa/dLD8HCgmFjlShEMxzYhQUc
 i2OpAQ3XtrodT3sxfg01agmU9uKFf5rb//emIep6yDrDdgFFsVRUhv9WLkMehaasD9RP9f
 PASAeeTX7j2BS3gxzOeUqADE+C2R5UA=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-6som78jAMmqA2_eFmoxD7Q-1; Fri, 07 Oct 2022 06:49:54 -0400
X-MC-Unique: 6som78jAMmqA2_eFmoxD7Q-1
Received: by mail-vs1-f69.google.com with SMTP id
 j17-20020a056102001100b003a71f301ad9so359058vsp.5
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r/BAgIzClzAGx5jh6u6jtBMGZR9/zeToWliBhmBv7Xg=;
 b=ddqGesIJKR2kkbdBonGgzh4eb375AeyO6K4YsY5qTW754la7GfmVq5RBalGtoVnfXe
 G8uGj/j7Od6n5Vl9NFDrGd7N7zmuN42pThe7U2pua0dXWo62DQ4DJwAf2MgI9DoYCWyZ
 AMHTT8IVm54oAz6H5eWWWwaiAVxlq9N15hiWkP9tRFSR9Kqt20vPX3gXIcLPxGhyYXcX
 IMVOL33v46aTn4RGLiXVmqkVSBhtWxk1uh8NtBshjUVPZQiWLu6LdnIyF4b1gMaIfWRj
 RNgfv5AZ0EwQXHXAvtxXjiVTOuR2AQ3Zrq26oxnC17hyQVPY5616ScRXZh8nqFVqITL/
 F8dQ==
X-Gm-Message-State: ACrzQf35F60F4nKBeU5KEVDyocIVBt1MAJ2bdQl33P3Iw9/Bq541EN/i
 5fNa2VzgCZPNOH9kjNuogjmpzIHYfnQrE7fRuO4xi44iyjsA07cXxjhNOsz9BESrQyFq4EsotWx
 BwErPxEiyYKe+YrGFSFghRdinVN7YzFs=
X-Received: by 2002:ab0:1e8d:0:b0:3d9:6cb0:4a87 with SMTP id
 o13-20020ab01e8d000000b003d96cb04a87mr2524547uak.42.1665139794005; 
 Fri, 07 Oct 2022 03:49:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6lLy5j2cb3DAv949NR0JmsX4+GEM67JLk+ipLX3BP9mP49lFs0m+murif24VtU7b3fKSYM6VSZhn2Ei7hIjac=
X-Received: by 2002:ab0:1e8d:0:b0:3d9:6cb0:4a87 with SMTP id
 o13-20020ab01e8d000000b003d96cb04a87mr2524541uak.42.1665139793817; Fri, 07
 Oct 2022 03:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220920144024.3559708-1-vkuznets@redhat.com>
 <87wn9pkv6e.fsf@redhat.com> <87sfk07znt.fsf@redhat.com>
In-Reply-To: <87sfk07znt.fsf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 7 Oct 2022 06:49:42 -0400
Message-ID: <CABgObfaAFnnJDmgtsF69qUrayYf9+yg6GTX7wfCTkk1r1DkCdQ@mail.gmail.com>
Subject: Re: [PATCH] i386: Fix KVM_CAP_ADJUST_CLOCK capability check
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Marcelo Tosatti <mtosatti@redhat.com>, 
 Oliver Upton <oupton@google.com>, Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e9879c05ea6f91a5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000e9879c05ea6f91a5
Content-Type: text/plain; charset="UTF-8"

Hi, a similar patch is now in.

Paolo

Il ven 7 ott 2022, 05:26 Vitaly Kuznetsov <vkuznets@redhat.com> ha scritto:

> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
>
> > Vitaly Kuznetsov <vkuznets@redhat.com> writes:
> >
> >> KVM commit c68dc1b577ea ("KVM: x86: Report host tsc and realtime values
> in
> >> KVM_GET_CLOCK") broke migration of certain workloads, e.g. Win11 + WSL2
> >> guest reboots immediately after migration. KVM, however, is not to
> >> blame this time. When KVM_CAP_ADJUST_CLOCK capability is checked, the
> >> result is all supported flags (which the above mentioned KVM commit
> >> enhanced) but kvm_has_adjust_clock_stable() wants it to be
> >> KVM_CLOCK_TSC_STABLE precisely. The result is that 'clock_is_reliable'
> >> is not set in vmstate and the saved clock reading is discarded in
> >> kvmclock_vm_state_change().
> >>
> >> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> >> ---
> >>  target/i386/kvm/kvm.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> >> index a1fd1f53791d..c33192a87dcb 100644
> >> --- a/target/i386/kvm/kvm.c
> >> +++ b/target/i386/kvm/kvm.c
> >> @@ -157,7 +157,7 @@ bool kvm_has_adjust_clock_stable(void)
> >>  {
> >>      int ret = kvm_check_extension(kvm_state, KVM_CAP_ADJUST_CLOCK);
> >>
> >> -    return (ret == KVM_CLOCK_TSC_STABLE);
> >> +    return ret & KVM_CLOCK_TSC_STABLE;
> >>  }
> >>
> >>  bool kvm_has_adjust_clock(void)
> >
> > Ping) This issue seems to introduce major migration issues with KVM >=
> v5.16
>
> Ping)
>
> --
> Vitaly
>
>

--000000000000e9879c05ea6f91a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi, a similar patch is now in.<div dir=3D"auto"><br></div=
><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il ven 7 ott 2022, 05:26 Vitaly Kuznetsov &lt=
;<a href=3D"mailto:vkuznets@redhat.com">vkuznets@redhat.com</a>&gt; ha scri=
tto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Vitaly Kuznetsov &lt;<a href=
=3D"mailto:vkuznets@redhat.com" target=3D"_blank" rel=3D"noreferrer">vkuzne=
ts@redhat.com</a>&gt; writes:<br>
<br>
&gt; Vitaly Kuznetsov &lt;<a href=3D"mailto:vkuznets@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">vkuznets@redhat.com</a>&gt; writes:<br>
&gt;<br>
&gt;&gt; KVM commit c68dc1b577ea (&quot;KVM: x86: Report host tsc and realt=
ime values in<br>
&gt;&gt; KVM_GET_CLOCK&quot;) broke migration of certain workloads, e.g. Wi=
n11 + WSL2<br>
&gt;&gt; guest reboots immediately after migration. KVM, however, is not to=
<br>
&gt;&gt; blame this time. When KVM_CAP_ADJUST_CLOCK capability is checked, =
the<br>
&gt;&gt; result is all supported flags (which the above mentioned KVM commi=
t<br>
&gt;&gt; enhanced) but kvm_has_adjust_clock_stable() wants it to be<br>
&gt;&gt; KVM_CLOCK_TSC_STABLE precisely. The result is that &#39;clock_is_r=
eliable&#39;<br>
&gt;&gt; is not set in vmstate and the saved clock reading is discarded in<=
br>
&gt;&gt; kvmclock_vm_state_change().<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Vitaly Kuznetsov &lt;<a href=3D"mailto:vkuznets@red=
hat.com" target=3D"_blank" rel=3D"noreferrer">vkuznets@redhat.com</a>&gt;<b=
r>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 target/i386/kvm/kvm.c | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c<br>
&gt;&gt; index a1fd1f53791d..c33192a87dcb 100644<br>
&gt;&gt; --- a/target/i386/kvm/kvm.c<br>
&gt;&gt; +++ b/target/i386/kvm/kvm.c<br>
&gt;&gt; @@ -157,7 +157,7 @@ bool kvm_has_adjust_clock_stable(void)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 int ret =3D kvm_check_extension(kvm_state, KVM=
_CAP_ADJUST_CLOCK);<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; -=C2=A0 =C2=A0 return (ret =3D=3D KVM_CLOCK_TSC_STABLE);<br>
&gt;&gt; +=C2=A0 =C2=A0 return ret &amp; KVM_CLOCK_TSC_STABLE;<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 bool kvm_has_adjust_clock(void)<br>
&gt;<br>
&gt; Ping) This issue seems to introduce major migration issues with KVM &g=
t;=3D v5.16<br>
<br>
Ping)<br>
<br>
-- <br>
Vitaly<br>
<br>
</blockquote></div>

--000000000000e9879c05ea6f91a5--


