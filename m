Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A46BC789
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:45:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciIE-0004Ze-GP; Thu, 16 Mar 2023 03:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pciIB-0004Yk-Fi; Thu, 16 Mar 2023 03:44:55 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <randrianasulu@gmail.com>)
 id 1pciI9-0002hS-8D; Thu, 16 Mar 2023 03:44:55 -0400
Received: by mail-pg1-x536.google.com with SMTP id h31so405044pgl.6;
 Thu, 16 Mar 2023 00:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678952691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V4LC09VJN9mQD6QD3QR+JAICHiwA9D8anoT8uuN8IkI=;
 b=n+k7YsR+rwl954QSYDZuNRcldbk5Y/uZ1WaMLkHHqOQGyylTZCFHP9omPOAXDYPhfn
 hucRBqD3gfdHyMhimg5vynt845ILojXHzF8C1nnQwt5yARAqHBKzkVCDJvPuYQW1v1vl
 JmNzY6jG6efTXIPcpz4HVILHtRuR5xI2NIvGnj2B09Gi3urrPDPnjYNtGOoh+SFbuaiv
 jQYy8pg1V7dOIubQ5pOONb8eBqaWBeCZpHUaD93Mns+MOTZxn7cz/uP+ycUJNlPqu7sV
 VlgdTz+eatwEYaY3Mw+4dwZCmq4zkpa5JG+7zLoZGUEKrC4SLQsyMUU6QVwlVqGwnv3z
 Sxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678952691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4LC09VJN9mQD6QD3QR+JAICHiwA9D8anoT8uuN8IkI=;
 b=NZ43a3nrPcfPIm7mFewNLdRoQQzpuQ1+XSk/0CSFwad+wUOQ0yIS+iCQVo/I5s+jbG
 371wqUGSx3L5wWtiJZE/hs2W4aXKoF69oK9/1MKwX/HRU+zP+4WTPdxQ68Kul9q2bC4H
 IPA7O9L/srQZi8T44uIkUFP0zTFuAaeSdiFRCkAT1EtBxjhKU0AePkmUtIyXnXv/hTUU
 FeeIOZtS9QLCt/gMIMZuCQrf7pNn9DM9bXZrQoo1mDVF9cNwJy73yPExBcoccrB587yy
 v+eAGZQRdtxvGc0Bsf0rsFcDzfuzep0TIsr3S/DH9PHIF5MJwoGqOdU6XcHk4rn3Nicw
 ZcxA==
X-Gm-Message-State: AO0yUKXhJgZO1QncbUn3hQFdgJQtPcb9szmz/udYxF7zbl5xxabvHsC8
 yddlxWku1KNVVnFOhaT0cVoIBu7/01LBv1kAg/M=
X-Google-Smtp-Source: AK7set/GyuhRd68/CxpyAh1vkp73akVyCpO4+JtoJyUii4xuFOx9ri9PYpPAdswaVVJua1NmMcJnuF5OiYyTsfKj388=
X-Received: by 2002:a05:6a00:2408:b0:624:c7cc:3d0e with SMTP id
 z8-20020a056a00240800b00624c7cc3d0emr1104463pfh.6.1678952691052; Thu, 16 Mar
 2023 00:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
In-Reply-To: <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Thu, 16 Mar 2023 10:44:38 +0300
Message-ID: <CA+rFky691rSqUUqaFgsS7TJKpkRNLXBuyWS+DsDFd5CakEZtAg@mail.gmail.com>
Subject: Re: dropping 32-bit host support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000beb52705f6ffa2f6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=randrianasulu@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000beb52705f6ffa2f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:36 Philippe Mathieu-D=
aud=C3=A9 <philmd@linaro.org>:

> On 16/3/23 08:17, Andrew Randrianasulu wrote:
> >
> >
> > =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Mathi=
eu-Daud=C3=A9 <philmd@linaro.org
> > <mailto:philmd@linaro.org>>:
> >
> >     Hi Andrew,
> >
> >     On 16/3/23 01:57, Andrew Randrianasulu wrote:
> >      > Looking at https://wiki.qemu.org/ChangeLog/8.0
> >     <https://wiki.qemu.org/ChangeLog/8.0>
> >      > <https://wiki.qemu.org/ChangeLog/8.0
> >     <https://wiki.qemu.org/ChangeLog/8.0>>
> >      >
> >      > =3D=3D=3D
> >      > System emulation on 32-bit x86 and ARM hosts has been deprecated=
.
> >     The
> >      > QEMU project no longer considers 32-bit x86 and ARM support for
> >     system
> >      > emulation to be an effective use of its limited resources, and
> thus
> >      > intends to discontinue.
> >      >
> >      >   =3D=3D
> >      >
> >      > well, I guess arguing from memory-consuption point on 32 bit x86
> >     hosts
> >      > (like my machine where I run 32 bit userspace on 64 bit kernel)
> >     is not
> >
> >     If you use a 64-bit kernel, then your host is 64-bit :)
> >
> >
> >
> > No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 32bit.
> > So, qemu naturally will be 32-bit binary on my system.
>
> This configuration is still supported!
>
> Thomas, should we clarify yet again? Maybe adding examples?
>
> >     host: hardware where you run QEMU
> >     guest: what is run within QEMU
> >
> >     Running 32-bit *guest* on your 64-bit *host* is still supported.
> >
> >     We don't plan to support running 32-bit WinXP x86 (guest) on 32-bit
> >     Raspberry Pi 2 (host) for example.
> >
> >      > going anywhere, but what about 32bit userspace on Android tablet=
s,
> >      > either via Limbo emulator or qemu itself in Termux?
> >
> >     *System* emulation [on 32-bit hosts] is deprecated. User emulation
> >     (such linux-user) is not. For example, you can still run 64-bit
> x86_64
> >     Linux binaries on a 32-bit ARM Raspberry Pi.
> >
> >
> >
> > Well, unrooted Android does not allow you to just load some perfectly
> > fine kernel module, so user-space emulation can't do all things
> > system-level one can. I also ran qemu-system-ppc on Huawei Matepad T8
> > (32 bit Android, too) for emulating old mac os 9. Yes, I can wait 10 mi=
n
> > per guest boot. Fedora 36 armhf boots even slower on emulation!
>
> Huawei MatePad T8 is based on a MediaTek MT8768 CPU which contains
> ARM Cortex-A53 cores. These cores implements the ARMv8-A 64-bit ISA,
> so theoretically it is able to run a 64-bit Android.
>

Good luck installing non-vendor Android on off the shelf device, also good
luck running 64bit Android in 2gb ram. To be honest yes before I had only
Android + termux setup for all my computer needs I cared less about
upstream removals - because I usually can revert things locally on
Slackware. But Termux is rolling distro, and there is not many
alternatives. So upstream decisions will hit here fast and hard.


> >      > At least I hope it will be not *actively* (intentionally) broken=
,
> >     just
> >      > ...unsupported (so users who know how to run git revert still
> >     will get
> >      > their build for some more time).
> >
> >     Unsupported code almost always unintentionally end bit-rotting...
> >
> >
> >
> > Well, sometimes simple patch restores functionality. I patched for
> > example olive-editor to run on 32 bit, and before this intel embree
> > (raytracing kernels for Lux renderer). So, _sometimes_ it really not
> > that costly. While if this CI thing really runs per-commit and thrown
> > away each result ... may be letting interested users to build things on
> > their own machines (and share patches, if they develop them, publicly)
> > actually good idea.
> >
> >
> >
> >     I hope this is clearer.
> >
> >     Regards,
> >
> >     Phil.
> >
>
>

--000000000000beb52705f6ffa2f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:=
36 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phi=
lmd@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 16/3/23 =
08:17, Andrew Randrianasulu wrote:<br>
&gt; <br>
&gt; <br>
&gt; =D1=87=D1=82, 16 =D0=BC=D0=B0=D1=80. 2023 =D0=B3., 10:05 Philippe Math=
ieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" r=
el=3D"noreferrer">philmd@linaro.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:philmd@linaro.org" target=3D"_blank" rel=
=3D"noreferrer">philmd@linaro.org</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Andrew,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 16/3/23 01:57, Andrew Randrianasulu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Looking at <a href=3D"https://wiki.qemu.org/C=
hangeLog/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.=
qemu.org/ChangeLog/8.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/Chan=
geLog/8.0</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;<a href=3D"https://wiki.qemu.org/ChangeLo=
g/8.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.qemu.or=
g/ChangeLog/8.0</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://wiki.qemu.org/ChangeLog/8.0"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://wiki.qemu.org/Chan=
geLog/8.0</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; System emulation on 32-bit x86 and ARM hosts =
has been deprecated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; QEMU project no longer considers 32-bit x86 a=
nd ARM support for<br>
&gt;=C2=A0 =C2=A0 =C2=A0system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; emulation to be an effective use of its limit=
ed resources, and thus<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; intends to discontinue.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; well, I guess arguing from memory-consuption =
point on 32 bit x86<br>
&gt;=C2=A0 =C2=A0 =C2=A0hosts<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (like my machine where I run 32 bit userspace=
 on 64 bit kernel)<br>
&gt;=C2=A0 =C2=A0 =C2=A0is not<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If you use a 64-bit kernel, then your host is 64-bi=
t :)<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; No, I mean *kernel* is 64 bit yet userspace (glibc, X , ...) all 32bit=
. <br>
&gt; So, qemu naturally will be 32-bit binary on my system.<br>
<br>
This configuration is still supported!<br>
<br>
Thomas, should we clarify yet again? Maybe adding examples?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0host: hardware where you run QEMU<br>
&gt;=C2=A0 =C2=A0 =C2=A0guest: what is run within QEMU<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Running 32-bit *guest* on your 64-bit *host* is sti=
ll supported.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0We don&#39;t plan to support running 32-bit WinXP x=
86 (guest) on 32-bit<br>
&gt;=C2=A0 =C2=A0 =C2=A0Raspberry Pi 2 (host) for example.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; going anywhere, but what about 32bit userspac=
e on Android tablets,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; either via Limbo emulator or qemu itself in T=
ermux?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0*System* emulation [on 32-bit hosts] is deprecated.=
 User emulation<br>
&gt;=C2=A0 =C2=A0 =C2=A0(such linux-user) is not. For example, you can stil=
l run 64-bit x86_64<br>
&gt;=C2=A0 =C2=A0 =C2=A0Linux binaries on a 32-bit ARM Raspberry Pi.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Well, unrooted Android does not allow you to just load some perfectly =
<br>
&gt; fine kernel module, so user-space emulation can&#39;t do all things <b=
r>
&gt; system-level one can. I also ran qemu-system-ppc on Huawei Matepad T8 =
<br>
&gt; (32 bit Android, too) for emulating old mac os 9. Yes, I can wait 10 m=
in <br>
&gt; per guest boot. Fedora 36 armhf boots even slower on emulation!<br>
<br>
Huawei MatePad T8 is based on a MediaTek MT8768 CPU which contains<br>
ARM Cortex-A53 cores. These cores implements the ARMv8-A 64-bit ISA,<br>
so theoretically it is able to run a 64-bit Android.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Good luck installing no=
n-vendor Android on off the shelf device, also good luck running 64bit Andr=
oid in 2gb ram. To be honest yes before I had only Android + termux setup f=
or all my computer needs I cared less about upstream removals - because I u=
sually can revert things locally on Slackware. But Termux is rolling distro=
, and there is not many alternatives. So upstream decisions will hit here f=
ast and hard.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; At least I hope it will be not *actively* (in=
tentionally) broken,<br>
&gt;=C2=A0 =C2=A0 =C2=A0just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ...unsupported (so users who know how to run =
git revert still<br>
&gt;=C2=A0 =C2=A0 =C2=A0will get<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; their build for some more time).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsupported code almost always unintentionally end =
bit-rotting...<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Well, sometimes simple patch restores functionality. I patched for <br=
>
&gt; example olive-editor to run on 32 bit, and before this intel embree <b=
r>
&gt; (raytracing kernels for Lux renderer). So, _sometimes_ it really not <=
br>
&gt; that costly. While if this CI thing really runs per-commit and thrown =
<br>
&gt; away each result ... may be letting interested users to build things o=
n <br>
&gt; their own machines (and share patches, if they develop them, publicly)=
=C2=A0 <br>
&gt; actually good idea.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I hope this is clearer.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Phil.<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000beb52705f6ffa2f6--

