Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B413022A0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 09:02:19 +0100 (CET)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3wpF-0006iy-Rv
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 03:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3wm3-0005yo-5H
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:59:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3wm0-0004YD-0T
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611561534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T+7WjiOmDR+iRM8h23QCGyeWUjgzrOVXBEkOoR1Jzpc=;
 b=e2/Z9AV7GsW90ff0/9Gt5EfPcOPMbxk8+PvdAEntTFFTolUS8EdfJm/Ov5pqGlXiuAugfH
 V8tl0vuF94+Mc9lfKQw2tras3FGAq1GXrJeN/BPwQ8kQ3FeSx9RyOUR6pTZ4fJLc4F2E9a
 FZEiFpQBPu2kULKY7NrJTS9kLtrajYQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-faHdP4_TPLGiUeNrw78dSA-1; Mon, 25 Jan 2021 02:58:51 -0500
X-MC-Unique: faHdP4_TPLGiUeNrw78dSA-1
Received: by mail-pg1-f198.google.com with SMTP id 18so7508942pgp.22
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 23:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+7WjiOmDR+iRM8h23QCGyeWUjgzrOVXBEkOoR1Jzpc=;
 b=OzM/7PHigtZnMzJq5wc9MK1g7QojzjPm3PGt240QOQYkgio0bG32bZmcxQC2dLM840
 kI0c0IdllzyfvPRPsAGpA8D9CLKlrOl2OWqzNx5JkDYeusdXnslbQGoVIXZRXsg9MQtf
 8AEnRrzj5+dyTfX4wffOOKqTTsLgSkKRHybXChCoYRnRfUCw5qat9BBN6PUna4Sc+ysY
 U7LjQzEtwQT8P4Nn7XvYOG68cwE/W1QBYqh1KNQdUQRClP9ZzOJ+Ksv1+50+nM3nfO71
 /GBFQJ0jiUYIljeCkdxj/rxLdReuAubd3OGnA91BTnO7T1tP2CMFf45dEMXkDIhcCrEZ
 rkOg==
X-Gm-Message-State: AOAM531bwNF5HZlfp41VO0xsG66nwLLQCaBuUpV3+EKo1kzlGQT3+vMq
 KljkLpNtH1QVcrKM6j9iRfaweeAshhAAWX1krxYbKstE48uTLwrY63equPHS3XWVR7GUb3J3g0z
 e4eK1OOQFf3Qct+bfEQ564QjCvJJRGbM=
X-Received: by 2002:a63:cb06:: with SMTP id p6mr33472pgg.146.1611561530330;
 Sun, 24 Jan 2021 23:58:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS87XsqtPxf2gJbrD4hqTwqrP45JJpuDQVQ/0GYM6o12IEj8GnfQKy/V8E3YmrA06bLvwkNi6kDc6ABBjKzDY=
X-Received: by 2002:a63:cb06:: with SMTP id p6mr33457pgg.146.1611561530091;
 Sun, 24 Jan 2021 23:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-30-pbonzini@redhat.com>
 <878s8hqx7u.fsf@dusky.pond.sub.org>
In-Reply-To: <878s8hqx7u.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 08:58:37 +0100
Message-ID: <CABgObfYva0+p1TP52MoTsaOBKv4=BcfAyYOT0QC=GhVR1dLD5w@mail.gmail.com>
Subject: Re: [PULL 29/31] qemu-option: clean up id vs. list->merge_lists
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000088ff6505b9b4e855"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000088ff6505b9b4e855
Content-Type: text/plain; charset="UTF-8"

Too late but I will point it out in the commit that cleans up the iteration.

Paolo

Il lun 25 gen 2021, 08:42 Markus Armbruster <armbru@redhat.com> ha scritto:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
> > Looking at all merge-lists QemuOptsList, here is how they access their
> > QemuOpts:
> >
> > reopen_opts in qemu-io-cmds.c ("qemu-img reopen -o")
> >       qemu_opts_find(&reopen_opts, NULL)
> >
> > empty_opts in qemu-io.c ("qemu-io open -o")
> >       qemu_opts_find(&empty_opts, NULL)
> >
> > qemu_rtc_opts ("-rtc")
> >       qemu_find_opts_singleton("rtc")
> >
> > qemu_machine_opts ("-M")
> >       qemu_find_opts_singleton("machine")
> >
> > qemu_action_opts ("-name")
>
> Pasto: it's "-action".
>
> >       qemu_opts_foreach->process_runstate_actions
> >
> > qemu_boot_opts ("-boot")
> >       in hw/nvram/fw_cfg.c and hw/s390x/ipl.c:
> >         QTAILQ_FIRST(&qemu_find_opts("bootopts")->head)
> >       in softmmu/vl.c:
> >         qemu_opts_find(qemu_find_opts("boot-opts"), NULL)
> >
> > qemu_name_opts ("-name")
> >       qemu_opts_foreach->parse_name
> >       parse_name does not use id
> >
> > qemu_mem_opts ("-m")
> >       qemu_find_opts_singleton("memory")
> >
> > qemu_icount_opts ("-icount")
> >       qemu_opts_foreach->do_configure_icount
> >       do_configure_icount->icount_configure
> >       icount_configure does not use id
> >
> > qemu_smp_opts ("-smp")
> >       qemu_opts_find(qemu_find_opts("smp-opts"), NULL)
> >
> > qemu_spice_opts ("-spice")
> >       QTAILQ_FIRST(&qemu_spice_opts.head)
> >
> > i.e. they don't need an id.  Sometimes its presence is ignored
> > (e.g. when using qemu_opts_foreach), sometimes all the options
> > with the id are skipped, sometimes only the first option on the
>
> Let's insert
>
>     (when using qemu_find_opts_singleton() or qemu_opts_find(list, NULL))
>
> right after skipped, and
>
> > command line is considered.  -boot does two different things
>
>     (when using QTAILQ_FIRST)
>
> right after considered.
>
> > depending on who's looking at the options.
> >
> > With this patch we just forbid id on merge-lists QemuOptsLists; if the
> > command line still works, it has the same semantics as before.
> >
> > qemu_opts_create's fail_if_exists parameter is now unnecessary:
> >
> > - it is unused if id is NULL
> >
> > - opts_parse only passes false if reached from qemu_opts_set_defaults,
> > in which case this patch enforces that id must be NULL
> >
> > - other callers that can pass a non-NULL id always set it to true
> >
> > Assert that it is true in the only case where "fail_if_exists" matters,
> > i.e. "id && !lists->merge_lists".  This means that if an id is present,
> > duplicates are always forbidden, which was already the status quo.
> >
> > Discounting the case that aborts as it's not user-controlled (it's
> > "just" a matter of inspecting qemu_opts_create callers), the paths
> > through qemu_opts_create can be summarized as:
> >
> > - merge_lists = true: singleton opts with NULL id; non-NULL id fails
> >
> > - merge_lists = false: always return new opts; non-NULL id fails if dup
> >
> > Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
>

--00000000000088ff6505b9b4e855
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Too late but I will point it out in the=
 commit that cleans up the iteration.</div><div dir=3D"auto"><br></div>Paol=
o<div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"=
ltr" class=3D"gmail_attr">Il lun 25 gen 2021, 08:42 Markus Armbruster &lt;<=
a href=3D"mailto:armbru@redhat.com" target=3D"_blank" rel=3D"noreferrer">ar=
mbru@redhat.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt; writes:<br>
<br>
&gt; Looking at all merge-lists QemuOptsList, here is how they access their=
<br>
&gt; QemuOpts:<br>
&gt;<br>
&gt; reopen_opts in qemu-io-cmds.c (&quot;qemu-img reopen -o&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_find(&amp;reopen_opts, NULL)<br>
&gt;<br>
&gt; empty_opts in qemu-io.c (&quot;qemu-io open -o&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_find(&amp;empty_opts, NULL)<br>
&gt;<br>
&gt; qemu_rtc_opts (&quot;-rtc&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_find_opts_singleton(&quot;rtc&quot;)<br=
>
&gt;<br>
&gt; qemu_machine_opts (&quot;-M&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_find_opts_singleton(&quot;machine&quot;=
)<br>
&gt;<br>
&gt; qemu_action_opts (&quot;-name&quot;)<br>
<br>
Pasto: it&#39;s &quot;-action&quot;.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_foreach-&gt;process_runstate_actio=
ns<br>
&gt;<br>
&gt; qemu_boot_opts (&quot;-boot&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in hw/nvram/fw_cfg.c and hw/s390x/ipl.c:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTAILQ_FIRST(&amp;qemu_find_opts(&quo=
t;bootopts&quot;)-&gt;head)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0in softmmu/vl.c:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_find(qemu_find_opts(&quot;b=
oot-opts&quot;), NULL)<br>
&gt;<br>
&gt; qemu_name_opts (&quot;-name&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_foreach-&gt;parse_name<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0parse_name does not use id<br>
&gt;<br>
&gt; qemu_mem_opts (&quot;-m&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_find_opts_singleton(&quot;memory&quot;)=
<br>
&gt;<br>
&gt; qemu_icount_opts (&quot;-icount&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_foreach-&gt;do_configure_icount<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0do_configure_icount-&gt;icount_configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0icount_configure does not use id<br>
&gt;<br>
&gt; qemu_smp_opts (&quot;-smp&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_opts_find(qemu_find_opts(&quot;smp-opts=
&quot;), NULL)<br>
&gt;<br>
&gt; qemu_spice_opts (&quot;-spice&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QTAILQ_FIRST(&amp;qemu_spice_opts.head)<br>
&gt;<br>
&gt; i.e. they don&#39;t need an id.=C2=A0 Sometimes its presence is ignore=
d<br>
&gt; (e.g. when using qemu_opts_foreach), sometimes all the options<br>
&gt; with the id are skipped, sometimes only the first option on the<br>
<br>
Let&#39;s insert<br>
<br>
=C2=A0 =C2=A0 (when using qemu_find_opts_singleton() or qemu_opts_find(list=
, NULL))<br>
<br>
right after skipped, and<br>
<br>
&gt; command line is considered.=C2=A0 -boot does two different things<br>
<br>
=C2=A0 =C2=A0 (when using QTAILQ_FIRST)<br>
<br>
right after considered.<br>
<br>
&gt; depending on who&#39;s looking at the options.<br>
&gt;<br>
&gt; With this patch we just forbid id on merge-lists QemuOptsLists; if the=
<br>
&gt; command line still works, it has the same semantics as before.<br>
&gt;<br>
&gt; qemu_opts_create&#39;s fail_if_exists parameter is now unnecessary:<br=
>
&gt;<br>
&gt; - it is unused if id is NULL<br>
&gt;<br>
&gt; - opts_parse only passes false if reached from qemu_opts_set_defaults,=
<br>
&gt; in which case this patch enforces that id must be NULL<br>
&gt;<br>
&gt; - other callers that can pass a non-NULL id always set it to true<br>
&gt;<br>
&gt; Assert that it is true in the only case where &quot;fail_if_exists&quo=
t; matters,<br>
&gt; i.e. &quot;id &amp;&amp; !lists-&gt;merge_lists&quot;.=C2=A0 This mean=
s that if an id is present,<br>
&gt; duplicates are always forbidden, which was already the status quo.<br>
&gt;<br>
&gt; Discounting the case that aborts as it&#39;s not user-controlled (it&#=
39;s<br>
&gt; &quot;just&quot; a matter of inspecting qemu_opts_create callers), the=
 paths<br>
&gt; through qemu_opts_create can be summarized as:<br>
&gt;<br>
&gt; - merge_lists =3D true: singleton opts with NULL id; non-NULL id fails=
<br>
&gt;<br>
&gt; - merge_lists =3D false: always return new opts; non-NULL id fails if =
dup<br>
&gt;<br>
&gt; Reviewed-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" rel=3D=
"noreferrer noreferrer" target=3D"_blank">kwolf@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&g=
t;<br>
<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
<br>
</blockquote></div></div></div>

--00000000000088ff6505b9b4e855--


