Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55964B7D6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:53:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56dS-00028O-RT; Tue, 13 Dec 2022 09:51:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1p56dI-000262-Az
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:51:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1p56dF-0003gw-SG
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670943103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AntN5PuhUeetAPK6hXnQ2i6R22TOK3qevw9aGj20VwQ=;
 b=ZMG3I4tu3o1ZmiBW9T5uM7o7BLPeOGRGE8FAxu46Wpb5/YKY1P/312SCtVTfqzBhg6ymx6
 VLOypCkVbjEhdFlK+L1GLxmm6eIYT9qfkVkMypqeP6la7pl8Z/JOLAkdyQ9hthewFwgh+x
 DeoQknOR9uGnJiAE3ZNdarx/4X/Ii4U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-fRs_ZfUsNO-Xk-g4ZDqKtw-1; Tue, 13 Dec 2022 09:51:40 -0500
X-MC-Unique: fRs_ZfUsNO-Xk-g4ZDqKtw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z16-20020a05640235d000b0046d0912ae25so7380918edc.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AntN5PuhUeetAPK6hXnQ2i6R22TOK3qevw9aGj20VwQ=;
 b=sxoDDdbfQxgidovaarInalJsQzIyAsFUei2X4uwMwyookHSlIsbcis5yNBUqFyH7ls
 /RyAzM0X8G1SKXbK4I329SBt7SwShyi5rQ5yxGlB3b/nzzcKyhBw60RQEr/I2PtubOBy
 4WPk0CiSAB//8sNt0qcRdyfAYUL0XQgQ3Js225XDgjB1n52/YyKDKoXuLOby6rfLScXK
 3KiVs5hdkLQ4BclPnRZm41uHZmFW850y2YZyRu7PvqsZsQR3m1dTwBS/n6bhtxgUtpqm
 6CbwYfYWduRFO0kZWFKnTWSU487DmI+vBIX0DuHGQxvGwjY97T/lUzrGKHCzdQZtgP4f
 McJQ==
X-Gm-Message-State: ANoB5pkP3cHNKF5Gfyjhdfrxcl1b93Ppt+J/UqscVW1nO2iS8Cjdsfsq
 7GmD9vRxcl2Nim9x1D9qOIAyb3EYYG0CpfBB+dRbww/yoz3svxCO208VqiDRssivP93vm9MjLrZ
 PJ/JgCJ0O56BAdI26MyNclOuM3hQ8ZFM=
X-Received: by 2002:a17:906:c052:b0:79a:101a:7e57 with SMTP id
 bm18-20020a170906c05200b0079a101a7e57mr81819234ejb.368.1670943099842; 
 Tue, 13 Dec 2022 06:51:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6V35VgDo6lisGjCJAiNHzX1s+qX4DNEbSEGeFiLy1HvPYYQEK6l7Gkro1w2TCpv7eQS+OnSZ2uCqi+H0Pk58Q=
X-Received: by 2002:a17:906:c052:b0:79a:101a:7e57 with SMTP id
 bm18-20020a170906c05200b0079a101a7e57mr81819169ejb.368.1670943099624; Tue, 13
 Dec 2022 06:51:39 -0800 (PST)
MIME-Version: 1.0
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <CAJSP0QUMRipTMiYMSftQQe+A3aaF553KpJeSgBaS9vY7X4aD0w@mail.gmail.com>
 <3a86be0b-1621-2a10-c5f5-080f6b8c98ea@kaod.org>
In-Reply-To: <3a86be0b-1621-2a10-c5f5-080f6b8c98ea@kaod.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 13 Dec 2022 18:51:27 +0400
Message-ID: <CAMxuvazoJ0H3r2WFFcOxHY3fqLd4cSX198fJJoRANZSxTg977Q@mail.gmail.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Brian Cain <bcain@quicinc.com>, 
 Warner Losh <imp@bsdimp.com>, Luc Michel <luc@lmichel.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di Federico <ale@rev.ng>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Anton Johansson <anjo@rev.ng>, Michal Privoznik <mprivozn@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, "Denis V. Lunev" <den@virtuozzo.com>,
 Cleber Rosa <cleber@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Dominik Csapak <d.csapak@proxmox.com>, 
 Christophe de Dinechin <dinechin@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>, afaerber@suse.de, 
 andrea.arcangeli@redhat.com, bazulay@redhat.com, bbauman@redhat.com, 
 cjia@nvidia.com, cw@f00f.org, digitaleric@google.com, 
 dustin.kirkland@canonical.com, Eric Blake <eblake@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, felipe@nutanix.com, iggy@theiggy.com, 
 Jan Kiszka <jan.kiszka@web.de>, Jason Gunthorpe <jgg@nvidia.com>,
 jidong.xiao@gmail.com, 
 jjherne@linux.vnet.ibm.com, Joao Martins <joao.m.martins@oracle.com>, 
 mburton@qti.qualcom.com, mdean@redhat.com, mimu@linux.vnet.ibm.com, 
 z.huo@139.com, zwu.kernel@gmail.com, Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e4b16e05efb6c153"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

--000000000000e4b16e05efb6c153
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Dec 13, 2022 at 6:44 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 12/13/22 15:17, Stefan Hajnoczi wrote:
> > On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org>
> wrote:
> >>
> >> On 12/12/22 00:41, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> Hi,
> >>>
> >>> In the last years we had few discussions on "simplifying" QEMU (syste=
m
> >>> emulation / virtualization), in particular for the "management layer"=
.
> >>>
> >>> Some of us are interested in having QEMU able to dynamically create
> >>> machine models. Mark Burton's current approach is via a Python script
> >>> which generates QMP commands. This is just another case of "managemen=
t
> >>> layer".
> >>>
> >>> Various problems have been raised regarding the current limitations o=
f
> >>> QEMU's APIs. We'd like to remember / get a broader idea on these limi=
ts
> >>> and look at some ideas / proposals which have been discussed / posted
> >>> on this list.
> >>>
> >>> Feel free to complete your thoughts on this public etherpad:
> >>> https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
> >>>
> >>> Topic I remember which can be good starters:
> >>>
> >>> - Current limitations of QAPI (& QMP) model (Markus Armbruster)
> >>>
> >>> - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
> >>>     limitations (Daniel P. Berrang=C3=A9 & Paolo Bonzini)
> >>>
> >>> - Problem with x-exit-preconfig, reworking MachinePhaseInit state
> >>>     machine (Paolo Bonzini)
> >>>
> >>> Markus / Daniel / Paolo expressed their ideas on the list (the
> >>> historical threads are referenced in the etherpad) so reading the
> >>> relevant threads before the call will help to get in the topic.
> >>> These people don't have to be in the call, but if they can attend
> >>> that would be very nice :)
> >>>
> >>> The call will be Tuesday, December 13 at 3pm CET on this Bluejeans
> link:
> >>> http://bluejeans.com/quintela
> >> We moved the call here:
> >>
> >>
> https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOG=
Y5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2
> >
> > Please use a video conferencing system that allows people to join
> > without logging in and works across browsers. I gave up on Teams.
>
> I also gave up after 27 or so clicks, redirections, emails checks, etc.
> Too complex. There are much simpler alternatives.
>
>
Sorry, similar situation here:

"Hmm. Your browser version isn't supported."

firefox-107.0.1-1.fc37.x86_64

--000000000000e4b16e05efb6c153
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 13, 2022 at 6:44 PM C=
=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/=
13/22 15:17, Stefan Hajnoczi wrote:<br>
&gt; On Tue, 13 Dec 2022 at 09:08, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; On 12/12/22 00:41, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In the last years we had few discussions on &quot;simplifying&=
quot; QEMU (system<br>
&gt;&gt;&gt; emulation / virtualization), in particular for the &quot;manag=
ement layer&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Some of us are interested in having QEMU able to dynamically c=
reate<br>
&gt;&gt;&gt; machine models. Mark Burton&#39;s current approach is via a Py=
thon script<br>
&gt;&gt;&gt; which generates QMP commands. This is just another case of &qu=
ot;management<br>
&gt;&gt;&gt; layer&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Various problems have been raised regarding the current limita=
tions of<br>
&gt;&gt;&gt; QEMU&#39;s APIs. We&#39;d like to remember / get a broader ide=
a on these limits<br>
&gt;&gt;&gt; and look at some ideas / proposals which have been discussed /=
 posted<br>
&gt;&gt;&gt; on this list.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Feel free to complete your thoughts on this public etherpad:<b=
r>
&gt;&gt;&gt; <a href=3D"https://etherpad.opendev.org/p/qemu-emulation-bof%4=
02022-12-13" rel=3D"noreferrer" target=3D"_blank">https://etherpad.opendev.=
org/p/qemu-emulation-bof%402022-12-13</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Topic I remember which can be good starters:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Current limitations of QAPI (&amp; QMP) model (Markus Armbru=
ster)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Adding a new qemu-runtime-$TARGET / QMP-only binary without =
today&#39;s<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0limitations (Daniel P. Berrang=C3=A9 &amp; =
Paolo Bonzini)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - Problem with x-exit-preconfig, reworking MachinePhaseInit st=
ate<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0machine (Paolo Bonzini)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Markus / Daniel / Paolo expressed their ideas on the list (the=
<br>
&gt;&gt;&gt; historical threads are referenced in the etherpad) so reading =
the<br>
&gt;&gt;&gt; relevant threads before the call will help to get in the topic=
.<br>
&gt;&gt;&gt; These people don&#39;t have to be in the call, but if they can=
 attend<br>
&gt;&gt;&gt; that would be very nice :)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The call will be Tuesday, December 13 at 3pm CET on this Bluej=
eans link:<br>
&gt;&gt;&gt; <a href=3D"http://bluejeans.com/quintela" rel=3D"noreferrer" t=
arget=3D"_blank">http://bluejeans.com/quintela</a><br>
&gt;&gt; We moved the call here:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://teams.microsoft.com/_#/pre-join-calling/19:meet=
ing_MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2" rel=3D"nore=
ferrer" target=3D"_blank">https://teams.microsoft.com/_#/pre-join-calling/1=
9:meeting_MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2</a><br=
>
&gt; <br>
&gt; Please use a video conferencing system that allows people to join<br>
&gt; without logging in and works across browsers. I gave up on Teams.<br>
<br>
I also gave up after 27 or so clicks, redirections, emails checks, etc.<br>
Too complex. There are much simpler alternatives.<br>
<br></blockquote><div><br></div><div>Sorry, similar situation here:</div><d=
iv><br></div><div>&quot;Hmm. Your browser version isn&#39;t supported.&quot=
;</div><div><br></div><div>firefox-107.0.1-1.fc37.x86_64</div></div><div cl=
ass=3D"gmail_quote"><br></div></div>

--000000000000e4b16e05efb6c153--


