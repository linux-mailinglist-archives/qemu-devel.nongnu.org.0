Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4EB2CC2BC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 17:51:09 +0100 (CET)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkVLP-00065A-6E
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 11:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1kkVJw-00057g-Jh
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:49:36 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:44560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1kkVJu-0001Yy-Ag
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 11:49:36 -0500
Received: by mail-vs1-xe33.google.com with SMTP id u7so1269520vsq.11
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 08:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hFBaMnvRJp3xpkfuJMZXlCuPWFzFALbTrdV9H5xMTfA=;
 b=uRRXdqBb3S/vZFCRLER8IuFu57g+Dxt7yRRXCaBDFXUjJUbqpTkfrO8/bMwLBTgVCh
 l1HZy44uNjqnA9tkUCLX9vfbt8HhLRuQrPNPU8cRagrs7idTlM68wAFYcMnxM+8mK9sw
 vUBFFE0M/hOhnPqpnmHbLurTBaX5GivNlppb3k39LS33WE7yUfmMV+QsxfgUTyfAiqgP
 QoqiUkd3HzUwpFPxgwANVCTAqazT8RdadhDpG8go83h+h7lbrQ1blbJjt9JZ2h2R6Nfk
 3Puaq8cReRXvf4roE6aXWXDv2ChxmCof10QBPuvQ4+BBgkFv120a9FVrhUnu+XG78L+9
 KsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hFBaMnvRJp3xpkfuJMZXlCuPWFzFALbTrdV9H5xMTfA=;
 b=SyIBOj2SRwGtbEi2CsmAznNh1vbxXkrpzHtXKXQ2qfRcevFaMa+QndTiA230YCNElB
 Icq9b+rwrZUNb4pxRi+xnWFoFtjJVnxYlRAGEMek1C66RZAsORKyZ6yy6cbzr8UWLiu5
 jde2jb809i0AyHNR8zRMPAxfvc5qJyoyAx2xN0tnoCrrfGAUaDKOKYGJwIs3XhJmj9To
 ERx+x7LuupLePpxY9/Ag7XpK6moLFhvkx2Ymy0CK1YWQGX09EJPkIfji0xokPz9Qrg3r
 3ezDHZyLTzY2RowEmPPYUSoJ/ULis9hVZuYOGmsduCMAlbc8Hl3EQVwO1dH7iUvCuHT3
 1qGA==
X-Gm-Message-State: AOAM533JDM+5S4y5eM21b+z1UZSFTOth8RWkTPgLaiXBVl4ie4XnGry6
 DOH0iYmhOnwJt6jUcxSmMlXRhX98N7MxG7JUp9ouNw==
X-Google-Smtp-Source: ABdhPJwSytzaE1V1IWW4Y2nFE0mOtIr/0lo/q6eXaz6uq0bvmOaEMFuEfXxkaA/fNP8TC1uhA7zpiZl+sGrs5Ee5hwM=
X-Received: by 2002:a05:6102:d1:: with SMTP id u17mr2482760vsp.8.1606927771986; 
 Wed, 02 Dec 2020 08:49:31 -0800 (PST)
MIME-Version: 1.0
References: <160687065946.3791.11439184384818467145.malonedeb@soybean.canonical.com>
 <871rg87l7h.fsf@dusky.pond.sub.org>
In-Reply-To: <871rg87l7h.fsf@dusky.pond.sub.org>
From: Doug Evans <dje@google.com>
Date: Wed, 2 Dec 2020 08:48:55 -0800
Message-ID: <CADPb22S+3j_zpd0iVo=MNPO8=txhYt8iicBge6=B7wFq3ZO0eQ@mail.gmail.com>
Subject: Re: [Bug 1906463] [NEW] "-device help" does not report all devices
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000007be3c05b57e07b3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=dje@google.com; helo=mail-vs1-xe33.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000007be3c05b57e07b3
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 1, 2020 at 10:53 PM Markus Armbruster <armbru@redhat.com> wrote:

> Doug Evans <1906463@bugs.launchpad.net> writes:
>
> > Public bug reported:
> >
> > -device help doesn't report all devices.
> > E.g., devices that are instantiated by a board don't get printed in part
> because they don't exist when "-device help" is processed. As an experiment
> I deferred processing of "-device help" as long as possible and some
> devices were still not printed, so there's more going on here.
> >
> > QEMU commit hash: 944fdc5e27a5b5adbb765891e8e70e88ba9a00ec
> >
> > Repro:
> > $ configure --target-list=arm-softmmu
> > $ make
> > $ ./qemu-system-arm -device help | grep npcm7xx
> > <empty>
> >
> > I'd expect to see things like npcm7xx-rng in the output.
>
> Works as intended.
>
> "-device help" shows the devices that are available with -device.
> npcm7xx-rng isn't:
>
>     $ qemu-system-arm -M virt -device npcm7xx-rng
>     qemu-system-arm: -device npcm7xx-rng: Parameter 'driver' expects
> pluggable device type
>
> Monitor command "info qdm" shows all devices, including npcm7xx-rng:
>
>     $ qemu-system-arm -M virt -monitor stdio
>     QEMU 5.1.92 monitor - type 'help' for more information
>     (qemu) info qdm
>     [...]
>     name "npcm7xx-rng", bus System, desc "NPCM7xx Random Number
> Generator", no-user
>     [...]
>
> Note "no-user": it's not available with -device.
>
> > I can imagine enumerating board-provided devices is a challenge.
> > Still, it'd be really nice if "-device help" printed them, and having
> > "-device $driver,help" work as well.
>
> It works:
>
>     $ qemu-system-arm -M virt -device npcm7xx-rng,help
>     npcm7xx-rng options:
>       regs[0]=<child<qemu:memory-region>>
>
> Hope this helps!
>

Thanks for the reply. It does help, but it's odd that I can't use "-device
help" to discover a device, but once discovered I can use it to get help on
that device.
At least I get why now. Thanks again.

Btw, if I may ask another dumb question, I get this:

@ruffy:build-arm$ ./qemu-system-arm -M virt -monitor stdio
Unable to init server: Could not connect: Connection refused
QEMU 5.1.93 monitor - type 'help' for more information
(qemu) gtk initialization failed
<exit>

If I add "-display none" then it works, but it's odd that it's trying to
initialize with gtk here ($DISPLAY isn't set, there is no X present).
-help output says gtk is the default for -display, I'm guessing you didn't
configure with gtk so that's why it works for you.
Question: I'm not up on what the current state of the art is here, but
given that $DISPLAY is unset, why not punt on gtk and default to "none" ?
(printing a warning at startup explaining why if that helps)

--00000000000007be3c05b57e07b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Tue, Dec 1, 2020 at 10:53 PM Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Doug Evans &lt;<a href=3D"mailto:1906463@bugs.launchpad.net" target=3D=
"_blank">1906463@bugs.launchpad.net</a>&gt; writes:<br>
<br>
&gt; Public bug reported:<br>
&gt;<br>
&gt; -device help doesn&#39;t report all devices.<br>
&gt; E.g., devices that are instantiated by a board don&#39;t get printed i=
n part because they don&#39;t exist when &quot;-device help&quot; is proces=
sed. As an experiment I deferred processing of &quot;-device help&quot; as =
long as possible and some devices were still not printed, so there&#39;s mo=
re going on here.<br>
&gt;<br>
&gt; QEMU commit hash: 944fdc5e27a5b5adbb765891e8e70e88ba9a00ec<br>
&gt;<br>
&gt; Repro:<br>
&gt; $ configure --target-list=3Darm-softmmu<br>
&gt; $ make<br>
&gt; $ ./qemu-system-arm -device help | grep npcm7xx<br>
&gt; &lt;empty&gt;<br>
&gt;<br>
&gt; I&#39;d expect to see things like npcm7xx-rng in the output.<br>
<br>
Works as intended.<br>
<br>
&quot;-device help&quot; shows the devices that are available with -device.=
<br>
npcm7xx-rng isn&#39;t:<br>
<br>
=C2=A0 =C2=A0 $ qemu-system-arm -M virt -device npcm7xx-rng<br>
=C2=A0 =C2=A0 qemu-system-arm: -device npcm7xx-rng: Parameter &#39;driver&#=
39; expects pluggable device type<br>
<br>
Monitor command &quot;info qdm&quot; shows all devices, including npcm7xx-r=
ng:<br>
<br>
=C2=A0 =C2=A0 $ qemu-system-arm -M virt -monitor stdio<br>
=C2=A0 =C2=A0 QEMU 5.1.92 monitor - type &#39;help&#39; for more informatio=
n<br>
=C2=A0 =C2=A0 (qemu) info qdm<br>
=C2=A0 =C2=A0 [...]<br>
=C2=A0 =C2=A0 name &quot;npcm7xx-rng&quot;, bus System, desc &quot;NPCM7xx =
Random Number Generator&quot;, no-user<br>
=C2=A0 =C2=A0 [...]<br>
<br>
Note &quot;no-user&quot;: it&#39;s not available with -device.<br>
<br>
&gt; I can imagine enumerating board-provided devices is a challenge.<br>
&gt; Still, it&#39;d be really nice if &quot;-device help&quot; printed the=
m, and having<br>
&gt; &quot;-device $driver,help&quot; work as well.<br>
<br>
It works:<br>
<br>
=C2=A0 =C2=A0 $ qemu-system-arm -M virt -device npcm7xx-rng,help<br>
=C2=A0 =C2=A0 npcm7xx-rng options:<br>
=C2=A0 =C2=A0 =C2=A0 regs[0]=3D&lt;child&lt;qemu:memory-region&gt;&gt;<br>
<br>
Hope this helps!<br></blockquote><div><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Thanks for the reply. It does help, but it&#39;=
s odd that I can&#39;t use &quot;-device help&quot; to discover a device, b=
ut once discovered I can use it to get help on that device.</div><div class=
=3D"gmail_default" style=3D"font-size:small">At least I get why now. Thanks=
 again.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Btw, if I may ask=
 another dumb question, I get this:<br><br>@ruffy:build-arm$ ./qemu-system-=
arm -M virt -monitor stdio<br>Unable to init server: Could not connect: Con=
nection refused<br>QEMU 5.1.93 monitor - type &#39;help&#39; for more infor=
mation<br>(qemu) gtk initialization failed</div><div class=3D"gmail_default=
" style=3D"font-size:small">&lt;exit&gt;</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">If I add &quot;-display none&quot; then it works, but it&#3=
9;s odd that it&#39;s trying to initialize with gtk here ($DISPLAY isn&#39;=
t set, there is no X present).<br>-help output says gtk is the default for =
-display, I&#39;m guessing you didn&#39;t configure with gtk so that&#39;s =
why it works for you.<br>Question: I&#39;m not up on what the current state=
 of the art is here, but given that $DISPLAY is unset, why not punt on gtk =
and default to &quot;none&quot; ? (printing a warning at startup explaining=
 why if that helps)</div></div></div>

--00000000000007be3c05b57e07b3--

