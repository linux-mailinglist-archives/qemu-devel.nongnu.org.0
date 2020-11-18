Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE82B81B5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:25:48 +0100 (CET)
Received: from localhost ([::1]:49510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQHD-0001rF-F7
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfQEf-0000WQ-Jk
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfQEZ-0002Vn-UZ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605716582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vfzRPygP+tyqgpHHw09dfR94SEW6XXp6aTVg6jCrX5U=;
 b=hbxTNOCntVwQHAxPSgudr3kI9f5JAg4GUqcRu8iG6CZF3uYkcyu2VZIM7PVl9Ua98saE1r
 0u20m25kUimq4IdnR7VhWw3o4VlVgj+G99n+AYirgYQFEQyRPBhAN4eBke+rUQejbA7Zac
 /h2/WkGMK5Q09Z0ijccqM3EPGuxw1OE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-ftfaiygsO-u3uxWCz5AI-g-1; Wed, 18 Nov 2020 11:22:59 -0500
X-MC-Unique: ftfaiygsO-u3uxWCz5AI-g-1
Received: by mail-pg1-f197.google.com with SMTP id a8so1574272pgh.18
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 08:22:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfzRPygP+tyqgpHHw09dfR94SEW6XXp6aTVg6jCrX5U=;
 b=Eeo938Mkl3Ju3dNaD4bq29X0XIS5fk9si10CCw96EVYs3XxuB/XITN+mqa3aFbwn3w
 r6J2DOEF3eP05VtHOU4ZPJzl/npx2ly8CKRNsvV9i0DqzMTem47CzzmtHYfgNYj9A72Y
 lwMkOlbbL8cz3IpJLZ3silm277z3xR9ojKj2nM9rw0J3u6qdsk493VgV7DUxCeTTQDPD
 62lLA7OLBUViQClKxjx1GSmsjVFn20aXpYEf85xvxqLpOJ8ge8WOxg0X0TA+FLEbUJt1
 8nkZV5bYnHTqQ9ey2EPS6TpfEN+qIDHTm3Ul340/UxtdN07thV2LL/7PFwdv0BnWu4Am
 TWlQ==
X-Gm-Message-State: AOAM533bJgCiJofuFHopTxi78cOlMszt72f1dbAq1f+YfJhFYvw066xz
 Vao491CoGpQzPLhM+ugSEC4IHTDe/gXp1oGQO/M4m7PR3YxB5LpIvGGhdU1Z80zLbfCx+Ov6Or1
 kLcKF3Jn22zK3esjvJyaRrhHqdep1a7w=
X-Received: by 2002:aa7:9e88:0:b029:18b:c1b7:a8cd with SMTP id
 p8-20020aa79e880000b029018bc1b7a8cdmr5188388pfq.21.1605716578747; 
 Wed, 18 Nov 2020 08:22:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxlvfGkEzTfSETdakOdzsjcN9z/zm0AYFgxL5hH7YorduDpP7NSvYejhI+r8DBWExV0rtMXp7XJOJHxw2PKnk=
X-Received: by 2002:aa7:9e88:0:b029:18b:c1b7:a8cd with SMTP id
 p8-20020aa79e880000b029018bc1b7a8cdmr5188353pfq.21.1605716578471; Wed, 18 Nov
 2020 08:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
 <20201118143643.GF1509407@habkost.net>
 <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
 <20201118152552.GG1509407@habkost.net>
 <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
 <20201118161119.GJ1509407@habkost.net>
In-Reply-To: <20201118161119.GJ1509407@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Nov 2020 17:22:46 +0100
Message-ID: <CABgObfb2Fim=7j3z7ApTuW=R0dWam2F_JRuOoxhP=XZXdsWe7g@mail.gmail.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000045289805b46406df"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Olaf Hering <ohering@suse.de>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045289805b46406df
Content-Type: text/plain; charset="UTF-8"

Il mer 18 nov 2020, 17:11 Eduardo Habkost <ehabkost@redhat.com> ha scritto:

> On Wed, Nov 18, 2020 at 04:43:19PM +0100, Paolo Bonzini wrote:
> > Il mer 18 nov 2020, 16:26 Eduardo Habkost <ehabkost@redhat.com> ha
> scritto:
> >
> > >
> > > > The alternative is to store the (type, function) tuple directly,
> with the
> > > > type as a string.  Then you can just use type_init.
> > >
> > > Right.  Let's build on top of that:
> > >
> > > Another alternative would be to store a (type, X86CPUAccel) tuple
> > > directly, with the type as string.  This would save the extra
> > > indirection of the x86_cpu_accel_init() call.
> > >
> > > It turns out we already have a mechanism to register and store
> > > (type, StructContainingFunctionPointers) tuples at initialization
> > > time: QOM.
> > >
> > > X86CPUAccel can become X86CPUAccelClass, and be registered as a
> > > QOM type.  It could be a subtype of TYPE_ACCEL or not, it
> > > shouldn't matter.
> > >
> >
> > It would be a weird type that isn't instantiated, and/or that does
> nothing
> > but monkey patching other classes. I don't think it's a good fit.
>
> The whole point of this would be to avoid monkey patching other
> classes.
>

Adding a layer of indirect calls is not very different from monkey patching
though.

You also have to consider that accel currently does not exist in usermode
emulators, so that's an issue too. I would rather get a simple change in
quickly, instead of designing the perfect class hierarchy.

Perhaps another idea would be to allow adding interfaces to classes
*separately from the registration of the types*. Then we can use it to add
SOFTMMU_ACCEL and I386_ACCEL interfaces to a bare bones accel class, and
add the accel object to usermode emulators.

Why wouldn't we instantiate it?  There's a huge number of static
> variables in target/i386/kvm.c that could be moved to that
> object.  Sounds like a perfect fit for me.
>

Most of those are properties of the running kernel so there's no need to
move them inside an object.

Paolo

I won't try to stop you if you really want to invent a brand new
> (name => CollectionOfFunctionPointers) registry, but it seems
> unnecessary.
>
> >
> > Yet another possibility is to use GHashTable. It is limited to one value
> > per key, but it's enough if everything is kept local to {hw,target}/i386.
> > If needed a new function pointer can be added to MachineClass,
> implemented
> > in X86MachineState (where the GHashTable would also be) and called in
> > accel.c.
> >
> > Paolo
> >
> > Paolo
> >
> >
> > > I remember this was suggested in a previous thread, but I don't
> > > remember if there were any objections.
> > >
> > > >
> > > > > Making sure module_call_init() is called at the correct moment is
> > > > > not easier or safer than just making sure accel_init_machine()
> > > > > (or another init function you create) is called at the correct
> > > > > moment.
> > > >
> > > > Since there is a way to do it without a new level, that would of
> course
> > > be
> > > > fine for me too.  Let me explain however why I think Claudio's
> design had
> > > > module_call_init() misplaced and what the fundamental difference
> is.  The
> > > > basic phases in qemu_init() are:
> > > >
> > > > - initialize stuff
> > > > - parse command line
> > > > - create machine
> > > > - create accelerator
> > > > - initialize machine
> > > > - create devices
> > > > - start
> > > >
> > > > with a mess of other object creation sprinkled between the various
> phases
> > > > (but we don't care about those).
> > > >
> > > > What I object to, is calling module_call_init() after the "initialize
> > > stuff"
> > > > phase.  Claudio was using it to call the function directly, so it
> had to
> > > be
> > > > exactly at "create accelerator".  This is different from all other
> > > > module_call_init() calls, which are done very early.
> > >
> > > I agree.
> > >
> > > >
> > > > With the implementation I sketched, accel_register_call must still be
> > > done
> > > > after type_init, so there's still an ordering constraint, but all
> it's
> > > doing
> > > > is registering a callback in the "initialize stuff" phase.
> > >
> > > Makes sense, if we really want to introduce a new accel_register_call()
> > > abstraction.  I don't think we need it, though.
> > >
> > > --
> > > Eduardo
> > >
> > >
>
> --
> Eduardo
>
>

--00000000000045289805b46406df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 18 nov 2020, 17:11 Eduardo Habkost &lt;<a href=
=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Wed, Nov 18, 2020 at 04:43:19PM +01=
00, Paolo Bonzini wrote:<br>
&gt; Il mer 18 nov 2020, 16:26 Eduardo Habkost &lt;<a href=3D"mailto:ehabko=
st@redhat.com" target=3D"_blank" rel=3D"noreferrer">ehabkost@redhat.com</a>=
&gt; ha scritto:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; &gt; The alternative is to store the (type, function) tuple direc=
tly, with the<br>
&gt; &gt; &gt; type as a string.=C2=A0 Then you can just use type_init.<br>
&gt; &gt;<br>
&gt; &gt; Right.=C2=A0 Let&#39;s build on top of that:<br>
&gt; &gt;<br>
&gt; &gt; Another alternative would be to store a (type, X86CPUAccel) tuple=
<br>
&gt; &gt; directly, with the type as string.=C2=A0 This would save the extr=
a<br>
&gt; &gt; indirection of the x86_cpu_accel_init() call.<br>
&gt; &gt;<br>
&gt; &gt; It turns out we already have a mechanism to register and store<br=
>
&gt; &gt; (type, StructContainingFunctionPointers) tuples at initialization=
<br>
&gt; &gt; time: QOM.<br>
&gt; &gt;<br>
&gt; &gt; X86CPUAccel can become X86CPUAccelClass, and be registered as a<b=
r>
&gt; &gt; QOM type.=C2=A0 It could be a subtype of TYPE_ACCEL or not, it<br=
>
&gt; &gt; shouldn&#39;t matter.<br>
&gt; &gt;<br>
&gt; <br>
&gt; It would be a weird type that isn&#39;t instantiated, and/or that does=
 nothing<br>
&gt; but monkey patching other classes. I don&#39;t think it&#39;s a good f=
it.<br>
<br>
The whole point of this would be to avoid monkey patching other<br>
classes.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Adding a layer of indirect calls is not very different from monke=
y patching though.</div><div dir=3D"auto"><br></div><div dir=3D"auto">You a=
lso have to consider that accel currently does not exist in usermode emulat=
ors, so that&#39;s an issue too. I would rather get a simple change in quic=
kly, instead of designing the perfect class hierarchy.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Perhaps another idea would be to allow addin=
g interfaces to classes *separately from the registration of the types*. Th=
en we can use it to add SOFTMMU_ACCEL and I386_ACCEL interfaces to a bare b=
ones accel class, and add the accel object to usermode emulators.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">Why wouldn&#39;t we instantiate it?=C2=A0 There&#3=
9;s a huge number of static<br>
variables in target/i386/kvm.c that could be moved to that<br>
object.=C2=A0 Sounds like a perfect fit for me.<br></blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Most of those are properties=
 of the running kernel so there&#39;s no need to move them inside an object=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">I won&#39;t try to stop you if you really want to invent =
a brand new<br>
(name =3D&gt; CollectionOfFunctionPointers) registry, but it seems<br>
unnecessary.<br>
<br>
&gt; <br>
&gt; Yet another possibility is to use GHashTable. It is limited to one val=
ue<br>
&gt; per key, but it&#39;s enough if everything is kept local to {hw,target=
}/i386.<br>
&gt; If needed a new function pointer can be added to MachineClass, impleme=
nted<br>
&gt; in X86MachineState (where the GHashTable would also be) and called in<=
br>
&gt; accel.c.<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; <br>
&gt; &gt; I remember this was suggested in a previous thread, but I don&#39=
;t<br>
&gt; &gt; remember if there were any objections.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Making sure module_call_init() is called at the correct=
 moment is<br>
&gt; &gt; &gt; &gt; not easier or safer than just making sure accel_init_ma=
chine()<br>
&gt; &gt; &gt; &gt; (or another init function you create) is called at the =
correct<br>
&gt; &gt; &gt; &gt; moment.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Since there is a way to do it without a new level, that woul=
d of course<br>
&gt; &gt; be<br>
&gt; &gt; &gt; fine for me too.=C2=A0 Let me explain however why I think Cl=
audio&#39;s design had<br>
&gt; &gt; &gt; module_call_init() misplaced and what the fundamental differ=
ence is.=C2=A0 The<br>
&gt; &gt; &gt; basic phases in qemu_init() are:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; - initialize stuff<br>
&gt; &gt; &gt; - parse command line<br>
&gt; &gt; &gt; - create machine<br>
&gt; &gt; &gt; - create accelerator<br>
&gt; &gt; &gt; - initialize machine<br>
&gt; &gt; &gt; - create devices<br>
&gt; &gt; &gt; - start<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; with a mess of other object creation sprinkled between the v=
arious phases<br>
&gt; &gt; &gt; (but we don&#39;t care about those).<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; What I object to, is calling module_call_init() after the &q=
uot;initialize<br>
&gt; &gt; stuff&quot;<br>
&gt; &gt; &gt; phase.=C2=A0 Claudio was using it to call the function direc=
tly, so it had to<br>
&gt; &gt; be<br>
&gt; &gt; &gt; exactly at &quot;create accelerator&quot;.=C2=A0 This is dif=
ferent from all other<br>
&gt; &gt; &gt; module_call_init() calls, which are done very early.<br>
&gt; &gt;<br>
&gt; &gt; I agree.<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; With the implementation I sketched, accel_register_call must=
 still be<br>
&gt; &gt; done<br>
&gt; &gt; &gt; after type_init, so there&#39;s still an ordering constraint=
, but all it&#39;s<br>
&gt; &gt; doing<br>
&gt; &gt; &gt; is registering a callback in the &quot;initialize stuff&quot=
; phase.<br>
&gt; &gt;<br>
&gt; &gt; Makes sense, if we really want to introduce a new accel_register_=
call()<br>
&gt; &gt; abstraction.=C2=A0 I don&#39;t think we need it, though.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Eduardo<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
-- <br>
Eduardo<br>
<br>
</blockquote></div></div></div>

--00000000000045289805b46406df--


