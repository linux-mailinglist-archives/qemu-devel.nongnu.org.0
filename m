Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5456902C2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:03:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2oL-0003oA-Dg; Thu, 09 Feb 2023 04:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ2oI-0003nt-W4
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:01:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ2oG-0001YG-Rw
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675933299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9hnBHL/pBOFYYIMELTax65xaLNpCom4O26mRJQporA=;
 b=f1NE923/ACrjXggAS+TaEY5ksL0Fn520VBiSBvZQxOBjQumXMozh1uL40dC0E9nxUR5E7+
 Z7kkek+KiCFeTQal7x7/iMU/NWElrNZsBFMnVt0TiigxYjZNZBQFky/x5J5Qg8wNj5QJOL
 6oYsyGs3A4hU7A9v1flL0aB1id7aLb0=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-mXuMwPEzNzae-QTxiFqQ2w-1; Thu, 09 Feb 2023 04:01:37 -0500
X-MC-Unique: mXuMwPEzNzae-QTxiFqQ2w-1
Received: by mail-ua1-f72.google.com with SMTP id
 u5-20020a9f35c5000000b0068398735344so668133uad.15
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 01:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9hnBHL/pBOFYYIMELTax65xaLNpCom4O26mRJQporA=;
 b=bQfOiO/+fIwMIkD8qjI0B+SErmBQudkG/6SJfAisVRNJSkTv0lDPCgBazI1QAAbPUw
 0fVS1/GHN4hNHkKUPwJBmG8m40be6ZAuFEI+3iI3uGhZzsOM4wPAubHy6e2kaYPEHCLY
 F7n/I/9Rom4PSXWKpBcM7fAjGE7SV/CrvffCannZO5N8zPY2vHwvIjQsERk6/QJolZpf
 gvSNQsTEq1q0k5jH1lNaXpCgoysnbzyza/PtKfo3Hq3EHoBhAX/7zixyiXQa8nMwVugq
 RE0rweENIQd1kpl8cl6mgOxo+qCKAv33uC8FHw/WWXpKkMS7ObIr3oHmxPwm+01LGw37
 Hrzg==
X-Gm-Message-State: AO0yUKUQHjloS0cQL3Re7E5OOqQnk33NW34IQfraFc5qm/mbaU57wkJw
 mrRws8aHG7Jk++Wca2APgWiGvfQKsL2u9AHO7QbwlxotAWvmAvECDNCESXFtoM3ITgRgSR9Cl5n
 OkNh3caM+mMPyvkZ4ltpZWvM3vhkScIc=
X-Received: by 2002:ab0:6592:0:b0:683:cba5:ad90 with SMTP id
 v18-20020ab06592000000b00683cba5ad90mr2302957uam.59.1675933296357; 
 Thu, 09 Feb 2023 01:01:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9qxp+0viv03gbEMkWp+EC5GwAVObWikKfurhWg+laE6H2nslru+zCT2map26XiZJAkPQ9aGSpHo7OCUA0HP5w=
X-Received: by 2002:ab0:6592:0:b0:683:cba5:ad90 with SMTP id
 v18-20020ab06592000000b00683cba5ad90mr2302954uam.59.1675933296044; Thu, 09
 Feb 2023 01:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20230208171922.95048-1-pbonzini@redhat.com>
 <20230208171922.95048-8-pbonzini@redhat.com>
 <905f792c-bac7-f88f-a538-b5c10135944d@redhat.com>
In-Reply-To: <905f792c-bac7-f88f-a538-b5c10135944d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 9 Feb 2023 10:01:24 +0100
Message-ID: <CABgObfbJOm7ddrGzMNJZJ_v16gYsoCcGDCfYWRPT=cz=RFDP8w@mail.gmail.com>
Subject: Re: [PULL 07/11] readconfig-test: add test for accelerator
 configuration
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000c7453c05f440a0c5"
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

--000000000000c7453c05f440a0c5
Content-Type: text/plain; charset="UTF-8"

Oops yes I did. I will respin it.

Paolo

Il gio 9 feb 2023, 06:21 Thomas Huth <thuth@redhat.com> ha scritto:

> On 08/02/2023 18.19, Paolo Bonzini wrote:
> > Test that it does not cause a SIGSEGV, and cover a valid configuration
> > as well.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   tests/qtest/libqtest.c        | 28 +++++++++++++++++-----
> >   tests/qtest/libqtest.h        | 12 ++++++++++
> >   tests/qtest/readconfig-test.c | 45 ++++++++++++++++++++++++++++-------
> >   3 files changed, 70 insertions(+), 15 deletions(-)
> >
> > diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> > index ce5f235e25f1..4fba2bb27f06 100644
> > --- a/tests/qtest/libqtest.c
> > +++ b/tests/qtest/libqtest.c
> > @@ -420,6 +420,26 @@ static QTestState *G_GNUC_PRINTF(1, 2)
> qtest_spawn_qemu(const char *fmt, ...)
> >       return s;
> >   }
> >
> > +QTestState *G_GNUC_PRINTF(1, 0) qtest_init_bare(const char *args)
> > +{
> > +    QTestState *s = qtest_spawn_qemu("%s", args);
> > +
> > +    /*
> > +     * Stopping QEMU for debugging is not supported on Windows.
> > +     *
> > +     * Using DebugActiveProcess() API can suspend the QEMU process,
> > +     * but gdb cannot attach to the process. Using the undocumented
> > +     * NtSuspendProcess() can suspend the QEMU process and gdb can
> > +     * attach to the process, but gdb cannot resume it.
> > +     */
> > +#ifndef _WIN32
> > +    if (getenv("QTEST_STOP")) {
> > +        kill(s->qemu_pid, SIGSTOP);
> > +    }
> > +#endif
> > +    return s;
> > +}
>
> You missed my review comments here:
>
>
> https://lore.kernel.org/qemu-devel/2f17c06f-90a9-9bac-8e9a-a1a2842665d2@redhat.com/
>
>   Thomas
>
>

--000000000000c7453c05f440a0c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oops yes I did. I will respin it.<div dir=3D"auto"><br></=
div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Il gio 9 feb 2023, 06:21 Thomas Huth &lt;<=
a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On 08/02/2023 18.19, Paolo Bonzini wro=
te:<br>
&gt; Test that it does not cause a SIGSEGV, and cover a valid configuration=
<br>
&gt; as well.<br>
&gt; <br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qtest/libqtest.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 28 +++=
++++++++++++++-----<br>
&gt;=C2=A0 =C2=A0tests/qtest/libqtest.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++=
+++++++<br>
&gt;=C2=A0 =C2=A0tests/qtest/readconfig-test.c | 45 +++++++++++++++++++++++=
+++++-------<br>
&gt;=C2=A0 =C2=A03 files changed, 70 insertions(+), 15 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c<br>
&gt; index ce5f235e25f1..4fba2bb27f06 100644<br>
&gt; --- a/tests/qtest/libqtest.c<br>
&gt; +++ b/tests/qtest/libqtest.c<br>
&gt; @@ -420,6 +420,26 @@ static QTestState *G_GNUC_PRINTF(1, 2) qtest_spaw=
n_qemu(const char *fmt, ...)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return s;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +QTestState *G_GNUC_PRINTF(1, 0) qtest_init_bare(const char *args)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QTestState *s =3D qtest_spawn_qemu(&quot;%s&quot;, args=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Stopping QEMU for debugging is not supported on=
 Windows.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Using DebugActiveProcess() API can suspend the =
QEMU process,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* but gdb cannot attach to the process. Using the=
 undocumented<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* NtSuspendProcess() can suspend the QEMU process=
 and gdb can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* attach to the process, but gdb cannot resume it=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +#ifndef _WIN32<br>
&gt; +=C2=A0 =C2=A0 if (getenv(&quot;QTEST_STOP&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kill(s-&gt;qemu_pid, SIGSTOP);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 return s;<br>
&gt; +}<br>
<br>
You missed my review comments here:<br>
<br>
<a href=3D"https://lore.kernel.org/qemu-devel/2f17c06f-90a9-9bac-8e9a-a1a28=
42665d2@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//lore.kernel.org/qemu-devel/2f17c06f-90a9-9bac-8e9a-a1a2842665d2@redhat.co=
m/</a><br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div>

--000000000000c7453c05f440a0c5--


