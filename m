Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F06AB25E
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 22:02:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYvTo-0002He-C8; Sun, 05 Mar 2023 16:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pYvTl-0002HD-Vl
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 16:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pYvTk-0000Np-9M
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 16:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678050071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFqUWTtlgyIaKOReHibKVjnUYG2bC90CjUviezP7e9c=;
 b=NJT0RRb6r8q6FzNygWx9cI9IiAd2pxQLLqe2gardXIsMa1/XfF2gGyOG6Kr6e1ID2Wujjk
 HHYKESb5SMasoMCctFqL3OP26+HGMxCdB7XiIihXWUCx+FuPwrbcA7v7ZkuaTqMSF9LdSF
 4RLNt2AiFPB+OEM7CjTqgquFG1x2gNM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-NeE2JJ6zMcWxWzwU6jF82w-1; Sun, 05 Mar 2023 16:01:07 -0500
X-MC-Unique: NeE2JJ6zMcWxWzwU6jF82w-1
Received: by mail-ua1-f69.google.com with SMTP id
 b19-20020ab04813000000b0068fbb418f63so3962289uad.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 13:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFqUWTtlgyIaKOReHibKVjnUYG2bC90CjUviezP7e9c=;
 b=wAl/f9sQqRxhPLxRaloIvikv7TQLy4UJNC7/8ykMQaFEaoUFiVJ66HVs4GNUHDndvk
 4rl9ulq15P2m77AI+t6yfiCypOuNfTOuK9UNjY/T6S39d+v1wJ4PR90/RUYlkaExCUtC
 /WfcNYSn3cR8lP1boUv3a9jzoWgE5XyWvDoMoqJPO1ZbzC0DgHQzwzDQY9m2jffdKKXQ
 cGw6cWI+3GB8ztPgBUIY+8kdO1knNhpvsLgl2oPpfc+9MtSbOKaGlF1pqho0/UG0qrqn
 vJYSm1ZkeQpuULGdMuWL0U/iKRdjZ1E7DHZmmupZlna3UydHhfAvnPMny/u10RAZYL/s
 TkcA==
X-Gm-Message-State: AO0yUKXhfU3AFI/NRwElYAiZSAPnUDXLLYqsAvyU+cdKP5twFzCL4vo4
 AlIuaJ2oEtH+ZUT+hPp1I1rviXy7lQnPuCzqBLE846WCxGT1d6R/Es5HbRtfFSBPHjecQsn7/fa
 knUGnO0ftU1+BBTFZyPdy5w35QL6hb9I=
X-Received: by 2002:a67:b142:0:b0:412:bca:d304 with SMTP id
 z2-20020a67b142000000b004120bcad304mr5960860vsl.7.1678050067139; 
 Sun, 05 Mar 2023 13:01:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8T1gp5UlY4uGfYuMQyPLYkDBMm6j4SKL2XhE4onXqzH/6UJLwuB2sAUlPGoh34VvZ8CkVqVIkfgAg236f8owk=
X-Received: by 2002:a67:b142:0:b0:412:bca:d304 with SMTP id
 z2-20020a67b142000000b004120bcad304mr5960850vsl.7.1678050066859; Sun, 05 Mar
 2023 13:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-2-pbonzini@redhat.com>
 <4e6733c8-6bd8-9b35-df35-80ac5a729ace@linaro.org>
In-Reply-To: <4e6733c8-6bd8-9b35-df35-80ac5a729ace@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 5 Mar 2023 22:00:57 +0100
Message-ID: <CABgObfYwUXRAfMTU=VTZCNY2VZr9yR_58UG=AODM8agELimpQQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] qatomic: add smp_mb__before/after_rmw()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Guowen Shan <gshan@redhat.com>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 David Hildenbrand <david@redhat.com>, 
 "Hajnoczi, Stefan" <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Auger <eauger@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000026a2d405f62d7ac7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

--00000000000026a2d405f62d7ac7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il dom 5 mar 2023, 19:57 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> On 3/3/23 09:19, Paolo Bonzini wrote:
> > This nasty difference between Linux and C11 read-modify-write operation=
s
> > has already caused issues in util/async.c and more are being found.
> > Provide something similar to Linux smp_mb__before/after_atomic(); this
> > has the double function of documenting clearly why there is a memory
> > barrier, and avoiding a double barrier on x86 and s390x systems.
>
> It does make me question our choice to use neither the Linux nor the C11
> model.
>

We do use the C11 model. However, C11's "just use seqcst everywhere" is not
suitable to define higher-level primitives=E2=80=94including those that are=
 part of
the C11 or pthreads specifications.

For example, C11 implementations (such as glibc) have the same issue as
QEMU in their implementations of e.g. pthread_cond_wait or pthread_join.
The primitive itself could in principle be implemented using seqcst
atomics, but it has to assume that the caller uses not even relaxed
atomics, but just plain old non-atomic accesses.

If instead you mean using acqrel memory ordering instead of seqcst for the
RMW operations, honestly I think I understand acq and rel pretty well at
this point but I don't understand acqrel enough to be able to use it.

Paolo


> > +      +--------------------------------+
> > +      | QEMU (incorrect)               |
> > +      +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> > +      | ::                             |
> > +      |                                |
> > +      |   a =3D qatomic_fetch_add(&x, 2);|
> > +      |   smp_mb__after_rmw();         |
> > +      |   b =3D qatomic_read(&y);        |
> > +      +--------------------------------+
>
> Correct, surely.
>
> > +/*
> > + * SEQ_CST is weaker than the older __sync_* builtins and Linux
> > + * kernel read-modify-write atomics.  Provide a macro to obtain
> > + * the same semantics.
> > + */
> > +#if !defined(QEMU_SANITIZE_THREAD) && \
> > +    (defined(__i386__) || defined(__x86_64__) || defined(__s390x__))
> > +# define smp_mb__before_rmw() signal_barrier()
> > +# define smp_mb__after_rmw() signal_barrier()
> > +#else
> > +# define smp_mb__before_rmw() smp_mb()
> > +# define smp_mb__after_rmw() smp_mb()
> > +#endif
>
> I notice you never actually use smp_mb__before_rmw(), but I suppose since
> we're trying to
> mirror smp_mb__before(), we should keep the interface whole.
>
> Other than the "incorrect" above,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~
>
>

--00000000000026a2d405f62d7ac7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il dom 5 mar 2023, 19:57 Richard Henderson &lt;<a href=
=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 3/3/23 09:19, Pao=
lo Bonzini wrote:<br>
&gt; This nasty difference between Linux and C11 read-modify-write operatio=
ns<br>
&gt; has already caused issues in util/async.c and more are being found.<br=
>
&gt; Provide something similar to Linux smp_mb__before/after_atomic(); this=
<br>
&gt; has the double function of documenting clearly why there is a memory<b=
r>
&gt; barrier, and avoiding a double barrier on x86 and s390x systems.<br>
<br>
It does make me question our choice to use neither the Linux nor the C11 mo=
del.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">We do use the C11 model. However, C11&#39;s &quot;just use seqcst every=
where&quot; is not suitable to define higher-level primitives=E2=80=94inclu=
ding those that are part of the C11 or pthreads specifications.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">For example, C11 implementations (s=
uch as glibc) have the same issue as QEMU in their implementations of e.g. =
pthread_cond_wait or pthread_join. The primitive itself could in principle =
be implemented using seqcst atomics, but it has to assume that the caller u=
ses not even relaxed atomics, but just plain old non-atomic accesses.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">If instead you mean using acq=
rel memory ordering instead of seqcst for the RMW operations, honestly I th=
ink I understand acq and rel pretty well at this point but I don&#39;t unde=
rstand acqrel enough to be able to use it.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 +--------------------------------+<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 | QEMU (incorrect)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 | ::=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0a =3D qatomic_fetch_add(&amp;x, 2)=
;|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0smp_mb__after_rmw();=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0b =3D qatomic_read(&amp;y);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 +--------------------------------+<br>
<br>
Correct, surely.<br>
<br>
&gt; +/*<br>
&gt; + * SEQ_CST is weaker than the older __sync_* builtins and Linux<br>
&gt; + * kernel read-modify-write atomics.=C2=A0 Provide a macro to obtain<=
br>
&gt; + * the same semantics.<br>
&gt; + */<br>
&gt; +#if !defined(QEMU_SANITIZE_THREAD) &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 (defined(__i386__) || defined(__x86_64__) || defined(__=
s390x__))<br>
&gt; +# define smp_mb__before_rmw() signal_barrier()<br>
&gt; +# define smp_mb__after_rmw() signal_barrier()<br>
&gt; +#else<br>
&gt; +# define smp_mb__before_rmw() smp_mb()<br>
&gt; +# define smp_mb__after_rmw() smp_mb()<br>
&gt; +#endif<br>
<br>
I notice you never actually use smp_mb__before_rmw(), but I suppose since w=
e&#39;re trying to <br>
mirror smp_mb__before(), we should keep the interface whole.<br>
<br>
Other than the &quot;incorrect&quot; above,<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank" rel=3D"noreferrer">richard.henderson@linaro.org</=
a>&gt;<br>
<br>
<br>
r~<br>
<br>
</blockquote></div></div></div>

--00000000000026a2d405f62d7ac7--


