Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1AB6293C7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 10:03:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ourph-0003ln-RW; Tue, 15 Nov 2022 04:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ourpd-0003lC-BE
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ourpV-0008RJ-7w
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668502920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yc4GxpTnTiSXXXF7uviFsPJ6I0zVHbRaUQI1UQyjzaE=;
 b=NS1NsTThCtnJpc8qK/Xa0UIB02sI30EBMNk4G/oXFEmkbqOIFuatpbeUXh6NSI9fq8zc1n
 aXlm0yEuV2d2U/xBVqcfI2J0Gfu4Fpp7oSt6LmDMomJs5Fk/Rjmp/sJvW7uIgCbgh09ZT4
 hT4XCg1Fb6KsOKMRzRsMJT4tM8vLCf8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-_kbIJrLaPL2PfuYnCqxU0A-1; Tue, 15 Nov 2022 04:01:56 -0500
X-MC-Unique: _kbIJrLaPL2PfuYnCqxU0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso8039855wms.5
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 01:01:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yc4GxpTnTiSXXXF7uviFsPJ6I0zVHbRaUQI1UQyjzaE=;
 b=c1a29iWoq9D5wTCEyVDPswVwGJ4g0k0UHLisfqtXFKZp9D4lV2LFHLDpe8lZClMmDd
 6rmFIts+QJbe9TYbdzj6gZ6EwxlbZnt8cpuDvX1Qtng3agaPhldPu6ebNUO6Euj+9JXN
 1IkQ07ZAaDJ7JiqbnSwMbDnKzNzx/VSCdwGJLsgt8ICihMjYqfWLyVasMOBZaBffhDxR
 TLAT2JKl/jhmDGlCqLBO3dEOgV6kvj2loGN+JKqwUlsBjHxxt2zTsUb6h0kPmknSOoCp
 GSibp0CGg/1pYSaZ18k6N/ZSL035HA8LRi1qMV1ZcD9TZ20H6uuMAhW6SXl3pnGXR+gI
 QOVA==
X-Gm-Message-State: ANoB5pmZny73ZwHYTgWCCQ3OnXQ7bv85PhJRFUnSUGWnhtC8x7CdhsLI
 AT+j9i+9SByjMCIHuf92ZfHnT2Zb79U65OiFyaAU9Tc/7YimBUzDXlezQ/LcpXdwggS4BKDAFou
 VVIutPibDyqMit6/dZzlE/CFU1icMXjk=
X-Received: by 2002:a5d:4301:0:b0:236:8130:56e7 with SMTP id
 h1-20020a5d4301000000b00236813056e7mr9759790wrq.309.1668502915656; 
 Tue, 15 Nov 2022 01:01:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5CkcqWi9r++qt6HkyIEL0co+khXg2CEU27m0eWEv7fzc7fTCxOaRkjsT6NI/wRgpA7OOxoX4tLNJQ4GMnqP9s=
X-Received: by 2002:a5d:4301:0:b0:236:8130:56e7 with SMTP id
 h1-20020a5d4301000000b00236813056e7mr9759777wrq.309.1668502915394; Tue, 15
 Nov 2022 01:01:55 -0800 (PST)
MIME-Version: 1.0
References: <CABchEG2dNgOPnm9K6AJsiWb8z=dOaKe0yjrvxqyU3gdWygQaNw@mail.gmail.com>
 <13a59cf1-cb58-4a79-2182-64c53ac41a3f@redhat.com>
In-Reply-To: <13a59cf1-cb58-4a79-2182-64c53ac41a3f@redhat.com>
From: Pawel Polawski <ppolawsk@redhat.com>
Date: Tue, 15 Nov 2022 10:01:44 +0100
Message-ID: <CABchEG3WcThs-8sH1gX6Jm35Q8D6BWQw7Y2iTVZdSuUwyh1eVg@mail.gmail.com>
Subject: Re: [qemu-devel]
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, KVM <kvm@vger.kernel.org>
Content-Type: multipart/alternative; boundary="00000000000094498205ed7e9bfc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppolawsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_REMOTE_IMAGE=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--00000000000094498205ed7e9bfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for the suggestion about the next step.
Do you know if there is an option to change this parameter in the runtime?
While looking for answer I found this presentation from 2008 which makes me
think that this may not
be the only limit:
https://www.linux-kvm.org/images/b/be/KvmForum2008%24kdf2008_6.pdf
I will try to change this value in the kernel code, rebuild it and see if
it works.

PS: Just realized that my original message has split for some reason and
there are two copies on the mailing list,
each with different subjects.

Best,
Pawel

On Tue, Nov 15, 2022 at 8:44 AM Thomas Huth <thuth@redhat.com> wrote:

> On 14/11/2022 23.58, Pawel Polawski wrote:
> > Hi Everyone,
> >
> > I am trying to check qemu virtual cpu boundaries when running a custom
> > edk2 based firmware build. For that purpose I want to run qemu with mor=
e
> > than 1024 vCPU:
> > $QEMU
> > -accel kvm
> > -m 4G
> > -M q35,kernel-irqchip=3Don,smm=3Don
> > -smp cpus=3D1025,maxcpus=3D1025 -global mch.extended-tseg-mbytes=3D128
> > -drive if=3Dpflash,format=3Draw,file=3D${CODE},readonly=3Don
> > -drive if=3Dpflash,format=3Draw,file=3D${VARS}
> > -chardev stdio,id=3Dfwlog
> > -device isa-debugcon,iobase=3D0x402,chardev=3Dfwlog "$@"
> >
> > The result is as follows:
> > QEMU emulator version 7.0.50 (v7.0.0-1651-g9cc1bf1ebc-dirty)
> > Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developers
> > qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested
> (1025)
> > exceeds the recommended cpus supported by KVM (8)
> > Number of SMP cpus requested (1025) exceeds the maximum cpus supported
> by
> > KVM (1024)
> >
> > It is not clear to me if I am hitting qemu limitation or KVM limitation
> here.
> > I have changed hardcoded 1024 limits in hw/i386/* files but the
> limitation
> > is still presented.
> >
> > Can someone advise what I should debug next looking for those vCPU
> limits?
>
> Well, the error message says it: There is a limitation in KVM, i.e. in th=
e
> kernel code, too. I think it is KVM_MAX_VCPUS in the file
> arch/x86/include/asm/kvm_host.h of the Linux kernel sources... so if
> you're
> brave, you might want to increase that value there and rebuild your own
> kernel. Not sure whether that works, though.
>
>   Thomas
>
>

--=20

Pawe=C5=82 Po=C5=82awski

Red Hat <https://www.redhat.com/> Virtualization

ppolawsk@redhat.com
@RedHat <https://twitter.com/redhat>   Red Hat
<https://www.linkedin.com/company/red-hat>  Red Hat
<https://www.facebook.com/RedHatInc>
<https://red.ht/sig>

--00000000000094498205ed7e9bfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>Thank you for the=
 suggestion about the next step.</div><div>Do you know if there is an optio=
n to change this parameter in the runtime?</div><div>While looking for answ=
er I found this presentation from 2008 which makes me think that this may n=
ot</div><div>be the only limit: <a href=3D"https://www.linux-kvm.org/images=
/b/be/KvmForum2008%24kdf2008_6.pdf">https://www.linux-kvm.org/images/b/be/K=
vmForum2008%24kdf2008_6.pdf</a></div><div>I will try to change this value i=
n the kernel code, rebuild it and see if it=C2=A0works.</div><div><br></div=
><div>PS: Just realized that my original message has split for some reason =
and there are two copies on the mailing list,</div><div>each with different=
 subjects.<br></div><div><br></div><div>Best,</div><div>Pawel<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Nov 15, 2022 at 8:44 AM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.=
com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 14/11/2022 23.58, Pawel Polawski wrote:<br>
&gt; Hi Everyone,<br>
&gt; <br>
&gt; I am trying to check qemu virtual cpu boundaries when running a custom=
<br>
&gt; edk2 based firmware build. For that purpose I want to run qemu with mo=
re <br>
&gt; than 1024 vCPU:<br>
&gt; $QEMU<br>
&gt; -accel kvm<br>
&gt; -m 4G<br>
&gt; -M q35,kernel-irqchip=3Don,smm=3Don<br>
&gt; -smp cpus=3D1025,maxcpus=3D1025 -global mch.extended-tseg-mbytes=3D128=
<br>
&gt; -drive if=3Dpflash,format=3Draw,file=3D${CODE},readonly=3Don<br>
&gt; -drive if=3Dpflash,format=3Draw,file=3D${VARS}<br>
&gt; -chardev stdio,id=3Dfwlog<br>
&gt; -device isa-debugcon,iobase=3D0x402,chardev=3Dfwlog &quot;$@&quot;<br>
&gt; <br>
&gt; The result is as follows:<br>
&gt; QEMU emulator version 7.0.50 (v7.0.0-1651-g9cc1bf1ebc-dirty)<br>
&gt; Copyright (c) 2003-2022 Fabrice Bellard and the QEMU Project developer=
s<br>
&gt; qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested =
(1025) <br>
&gt; exceeds the recommended cpus supported by KVM (8)<br>
&gt; Number of SMP cpus requested (1025) exceeds the maximum cpus supported=
 by <br>
&gt; KVM (1024)<br>
&gt; <br>
&gt; It is not clear to me if I am hitting qemu limitation or KVM limitatio=
n here.<br>
&gt; I have changed hardcoded 1024 limits in hw/i386/* files but the limita=
tion <br>
&gt; is still presented.<br>
&gt; <br>
&gt; Can someone advise what I should debug next looking for those vCPU lim=
its?<br>
<br>
Well, the error message says it: There is a limitation in KVM, i.e. in the =
<br>
kernel code, too. I think it is KVM_MAX_VCPUS in the file <br>
arch/x86/include/asm/kvm_host.h of the Linux kernel sources... so if you&#3=
9;re <br>
brave, you might want to increase that value there and rebuild your own <br=
>
kernel. Not sure whether that works, though.<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font-family:R=
edHatText,sans-serif;font-weight:bold;margin:0px;padding:0px;font-size:14px=
;text-transform:capitalize"><span>Pawe=C5=82 Po=C5=82awski</span><span styl=
e=3D"text-transform:uppercase;color:rgb(170,170,170);margin:0px"></span></p=
><p style=3D"color:rgb(0,0,0);font-family:RedHatText,sans-serif;font-size:1=
2px;margin:0px;text-transform:capitalize"><span><span><span><a href=3D"http=
s://www.redhat.com/" target=3D"_blank">Red Hat</a> Virtualization<br></span=
></span></span></p><p style=3D"color:rgb(0,0,0);font-family:RedHatText,sans=
-serif;margin:0px;font-size:12px"><span style=3D"margin:0px;padding:0px"><a=
 href=3D"mailto:ppolawsk@redhat.com" style=3D"color:rgb(0,0,0);margin:0px" =
target=3D"_blank">ppolawsk@redhat.com</a>=C2=A0 =C2=A0</span> <span><br></s=
pan></p><div style=3D"color:rgb(0,0,0);font-family:RedHatText,sans-serif;fo=
nt-size:12px;margin-bottom:8px"><div><a href=3D"https://twitter.com/redhat"=
 title=3D"twitter" style=3D"background:transparent url(&quot;https://market=
ing-outfit-prod-images.s3-us-west-2.amazonaws.com/3780bd4ede961ef3cd4108b8c=
0e80186/web-icon-twitter.png&quot;) 0px 50%/13px no-repeat;color:rgb(0,0,0)=
;display:inline-block;line-height:20px;padding-left:13px" target=3D"_blank"=
><span style=3D"margin-left:2px">@RedHat</span></a>=C2=A0=C2=A0=C2=A0<a hre=
f=3D"https://www.linkedin.com/company/red-hat" title=3D"LinkedIn" style=3D"=
background:transparent url(&quot;https://marketing-outfit-prod-images.s3-us=
-west-2.amazonaws.com/8d3507e3c6b6c9ad10e301accf1a4af0/web-icon-linkedin.pn=
g&quot;) 0px 50%/12px no-repeat;color:rgb(0,0,0);display:inline-block;line-=
height:20px;padding-left:12px;margin:0px 4px 0px 3px;padding-top:1px" targe=
t=3D"_blank"><span style=3D"margin-left:4px">Red Hat</span></a>=C2=A0=C2=A0=
<a href=3D"https://www.facebook.com/RedHatInc" title=3D"Facebook" style=3D"=
background:transparent url(&quot;https://marketing-outfit-prod-images.s3-us=
-west-2.amazonaws.com/220b85e2f100025e94cb1bcd993bd51d/web-icon-facebook.pn=
g&quot;) 0px 50%/11px no-repeat;color:rgb(0,0,0);display:inline-block;line-=
height:20px;padding-left:13px" target=3D"_blank"><span>Red Hat</span></a></=
div></div><a href=3D"https://red.ht/sig" target=3D"_blank"><img src=3D"http=
s://static.redhat.com/libs/redhat/brand-assets/latest/corp/logo.png" width=
=3D"90" height=3D"auto"></a><br></div></div>

--00000000000094498205ed7e9bfc--


