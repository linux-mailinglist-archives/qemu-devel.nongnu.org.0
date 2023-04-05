Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626626D84CE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 19:23:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk6qJ-00079w-OQ; Wed, 05 Apr 2023 13:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pk6qI-00079D-9t
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:22:42 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pk6qG-0006Kp-55
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:22:42 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id u97so1322519ybi.10
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680715359;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aDvNImywioGKQ3Blipd+sdYnVW9Y31hRCnLJu6Y027k=;
 b=bHJQqRD1LxqN5oDV/M5uk0KT63fxvgvE4pnznRAN1e/AGxQKMjw/Z3v7hmLQctyQEb
 oMJapzbf3Lgta/ErOso381eMowqIOohkpYTaXfXKbC638lMQPNH3SgInqqUWU01miOEP
 ER6Qeqqf+K/gwtu4/NZFQTtoSh86E9IajC7P7OU52Y5I5ea8GYh/nt7cwElPdMY1hQdq
 tAKVoO3b8EriRmofMV1LzoNEUFN/Wp5fxVnvU73C8rqOWmJQzn3KB5GczSZW6+bQs1F9
 QbdnxduxGxsfkXHvZnvbMqlX3c8E/F5GXqdCO2VVXAHD7KfS46p+DX0bNYauIUym68GQ
 AdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680715359;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aDvNImywioGKQ3Blipd+sdYnVW9Y31hRCnLJu6Y027k=;
 b=PGADfFxLk70fib+xDn5nJqB20NN5S7wtwN0qm/W5ZtUao+fFWHASsBFh9dTqm3l5wA
 aCJ7zU2rL1AkdLRQQ45tK3B/CsT6g2FfNt3akUikmyXTTEPe5V02C71Cl0Bklsu/4ZAh
 pteLU+id8Xfeps0HCWiHG9rLc2BYplapD+Ub0NbMPc3bBoXmJ+BN4vT24MiZ5PzwHlnr
 vrBQFqq0vFmta4szYePnJKsEzPspSfrvy9fwj59edq2IyiOAEvXE71fgCtNpnz9UnxQ2
 /pHBfBlD2Mc3zA1Et6kI5XllTJKl7Ohtluri7MCYf2YqoXnXscwwjqc2w42KFNwTNgrO
 Cqxw==
X-Gm-Message-State: AAQBX9cnQcQ/KFvtl5scH+lY9L38OgjifgMFRWVMtxrQDHEAQW+FXQOH
 yL0mh5F4MfmZTFK9a4BclxWjwbGLFd6dvvGXvvN6UqcBhuc7PClMvaQ=
X-Google-Smtp-Source: AKy350bn20alDiZkgYjMXmMUH6EotGv5fTS+BjuHGDaLrhLt5hNQvmBedFw3f34dv65Vtd4LsfInM8q6kKxlJ6H6bEE=
X-Received: by 2002:a25:d0c8:0:b0:a6b:bc64:a0af with SMTP id
 h191-20020a25d0c8000000b00a6bbc64a0afmr12185ybg.4.1680715358745; Wed, 05 Apr
 2023 10:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230405125920.2951721-1-digit@google.com>
 <20230405125920.2951721-3-digit@google.com>
 <87h6tuqy0f.fsf@redhat.com>
 <CACnJMqrf-YH6P0zBC4FSSp_LcO=pxDOrx-P3MGGFDj_uWbWjvg@mail.gmail.com>
 <87mt3mxr2v.fsf@redhat.com>
 <CAFEAcA8_ki+4WeZLB4a3S8rQBs-OOsYynU0ci2k-HoNtsAjrXQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8_ki+4WeZLB4a3S8rQBs-OOsYynU0ci2k-HoNtsAjrXQ@mail.gmail.com>
From: David Turner <digit@google.com>
Date: Wed, 5 Apr 2023 19:22:25 +0200
Message-ID: <CACnJMqq9YSLXFTf6vnTcue-SukasAwSdzO=YzTzJzedHM9_xag@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add missing Linux kernel headers.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000edb11205f89a0916"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=digit@google.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000edb11205f89a0916
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 5, 2023 at 6:41=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Wed, 5 Apr 2023 at 16:55, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > On Wed, Apr 05 2023, David Turner <digit@google.com> wrote:
> >
> > > On Wed, Apr 5, 2023 at 3:06=E2=80=AFPM Cornelia Huck <cohuck@redhat.c=
om>
> wrote:
> > >
> > >> On Wed, Apr 05 2023, "David 'Digit' Turner" <digit@google.com> wrote=
:
> > >> > The script has then been run against the official
> > >> > 6.2.8 kernel source tree (current stable release),
> > >> > which explains why comments in <linux/vfio.h>
> > >> > have been updated too.
> > >>
> > >> I think we usually run the script against a release or release
> > >> candidate, not stable.
> > >>
> > >> I meant that this was run against the headers of the 6.2.8 official
> > > release, which was listed as "stable" on https://kernel.org/ (that
> page now
> > > lists the 6.2.9 release btw)
> > > I'd be happy to re-run it against a different set if you can tell me
> which
> > > one (and where to get it, just in case).
> >
> > I think most people actually run it against a checkout of Linus' git
> > tree, preferrably either the latest -rc version (or the latest release
> > during the kernel merge window) -- people usually run the script becaus=
e
> > they want to use some new interfaces that were recently introduced to
> > the kernel. (This also ensures linear history, although I don't think
> > that's too much of a problem.)
>
> Yeah, I think the requirement is just "it has to be against some commit
> that is on the mainline of the upstream kernel", it doesn't inherently
> have to be an rc or a full point release. The assumption we're making
> here is that ABI is stable once a change hits Linus' git tree, and
> not stable before that.
>
> The other requirement is "don't go backwards", ie don't sync to a
> commit that pre-dates whatever the last commit we synced to is.
>
> The last sync we did was to ceaa837f96ad ("Linux 6.2-rc8").
>
> Thank you, that makes perfect sense, I have sent another series of patche=
s
(with the headers updade as a separate patch for consistency)

thanks
> -- PMM
>

--000000000000edb11205f89a0916
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 5, 2023 at 6:41=E2=80=AFP=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Wed, 5 Apr 2023 at 16:55, Cornelia Huck &lt;<a href=3D"mail=
to:cohuck@redhat.com" target=3D"_blank">cohuck@redhat.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; On Wed, Apr 05 2023, David Turner &lt;<a href=3D"mailto:digit@google.c=
om" target=3D"_blank">digit@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Wed, Apr 5, 2023 at 3:06=E2=80=AFPM Cornelia Huck &lt;<a href=
=3D"mailto:cohuck@redhat.com" target=3D"_blank">cohuck@redhat.com</a>&gt; w=
rote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Wed, Apr 05 2023, &quot;David &#39;Digit&#39; Turner&quot;=
 &lt;<a href=3D"mailto:digit@google.com" target=3D"_blank">digit@google.com=
</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; The script has then been run against the official<br>
&gt; &gt;&gt; &gt; 6.2.8 kernel source tree (current stable release),<br>
&gt; &gt;&gt; &gt; which explains why comments in &lt;linux/vfio.h&gt;<br>
&gt; &gt;&gt; &gt; have been updated too.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I think we usually run the script against a release or releas=
e<br>
&gt; &gt;&gt; candidate, not stable.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I meant that this was run against the headers of the 6.2.8 of=
ficial<br>
&gt; &gt; release, which was listed as &quot;stable&quot; on <a href=3D"htt=
ps://kernel.org/" rel=3D"noreferrer" target=3D"_blank">https://kernel.org/<=
/a> (that page now<br>
&gt; &gt; lists the 6.2.9 release btw)<br>
&gt; &gt; I&#39;d be happy to re-run it against a different set if you can =
tell me which<br>
&gt; &gt; one (and where to get it, just in case).<br>
&gt;<br>
&gt; I think most people actually run it against a checkout of Linus&#39; g=
it<br>
&gt; tree, preferrably either the latest -rc version (or the latest release=
<br>
&gt; during the kernel merge window) -- people usually run the script becau=
se<br>
&gt; they want to use some new interfaces that were recently introduced to<=
br>
&gt; the kernel. (This also ensures linear history, although I don&#39;t th=
ink<br>
&gt; that&#39;s too much of a problem.)<br>
<br>
Yeah, I think the requirement is just &quot;it has to be against some commi=
t<br>
that is on the mainline of the upstream kernel&quot;, it doesn&#39;t inhere=
ntly<br>
have to be an rc or a full point release. The assumption we&#39;re making<b=
r>
here is that ABI is stable once a change hits Linus&#39; git tree, and<br>
not stable before that.<br>
<br>
The other requirement is &quot;don&#39;t go backwards&quot;, ie don&#39;t s=
ync to a<br>
commit that pre-dates whatever the last commit we synced to is.<br>
<br>
The last sync we did was to ceaa837f96ad (&quot;Linux 6.2-rc8&quot;).<br>
<br></blockquote><div>Thank you, that makes perfect sense, I have sent anot=
her series of patches (with the headers updade as a separate patch for cons=
istency)<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000edb11205f89a0916--

