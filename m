Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EE629396
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 09:50:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ourdh-0000S6-S4; Tue, 15 Nov 2022 03:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ourdg-0000QJ-4J
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 03:49:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppolawsk@redhat.com>)
 id 1ourde-0006MX-3E
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 03:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668502189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NGyvjxn4ZA4xGm707FeZUKUHRpVjdDwUH5q7HtD7+ZY=;
 b=XYWa1JHg0qUAWGBnA6IXg03+hVgdRFCzV3beQUT4CYZ+Z3nxoRZPa4w2WGGVZOejGHdv36
 v3VBivFPGDNgl9ktD6/XUR/O2UO4/i19UvaFe10EPot0TVmPpqkBO+OO23BeDb0I1uhk7Z
 wTsLKWR5Gp7EScHBaI/JemGoAVxhr7w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-s-ZcVP5JPJuOnRwMx4oR0g-1; Tue, 15 Nov 2022 03:49:47 -0500
X-MC-Unique: s-ZcVP5JPJuOnRwMx4oR0g-1
Received: by mail-wr1-f70.google.com with SMTP id
 k1-20020adfb341000000b00238745c9b1aso2548780wrd.5
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 00:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NGyvjxn4ZA4xGm707FeZUKUHRpVjdDwUH5q7HtD7+ZY=;
 b=jbS77Weo9RYfnLMCK7wc2QNlCnjVtYcW8MFiI/Daxmqj4BURMDpu6Lbfcj5gjkSG+a
 sZVTdfOZ1pDAUx/+lO4WZJQUGqulRf8BnIGJnw+MMZ4EliMtnieHgzdJE45WXaKhGzSC
 j461z9MNOtjLBlMcIxFbytzwF2PWbG5f38W4g4AC2ouQd6aHrp8/FZTzQownvkcM0A/Y
 RQYd3ta/7gvXIAscnnwYXUS1Nb/00krn5e1D39gR8G9XIdyy73nvW3cfk39pkuu+SlKM
 ExzK0H/vEA8j8T0mVnE52+IQCIQWhh0t0wX6/p3P0NcEKDkgzABwgntZhCcSCPDmiJNb
 +DNQ==
X-Gm-Message-State: ANoB5pkRf3bzsetKwrhd0qR8Z2hqKEfULkEAosP3SvmaJj/DIWUXvTKU
 n1GftPW7cwEqHwQLAguPEkpfmxhOazCv7iYJOxBea/oyHbiWvjNxgllucA/81q4NjmMHeC9NJfj
 XJAnW2p3TmEiSSiTcWyzxdQ2DUOI/j5Y=
X-Received: by 2002:a05:600c:4a9a:b0:3cf:a895:a9cb with SMTP id
 b26-20020a05600c4a9a00b003cfa895a9cbmr35134wmp.96.1668502186218; 
 Tue, 15 Nov 2022 00:49:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf66lA9hm2a6RrukO3K7Y+ifZeEkiEYC2odwWAntefPhwz/K4oKFBhdb9+lAgx3wYAqR/5BkhSNpkSJJwx5Z/Oo=
X-Received: by 2002:a05:600c:4a9a:b0:3cf:a895:a9cb with SMTP id
 b26-20020a05600c4a9a00b003cfa895a9cbmr35116wmp.96.1668502185864; Tue, 15 Nov
 2022 00:49:45 -0800 (PST)
MIME-Version: 1.0
References: <CABchEG1Prh-Emo6LoVR4Zmx9NYeigZnYFPce7=jPCZMT3=Mj5w@mail.gmail.com>
 <Y3NSPcnMwQ5j2gCm@redhat.com>
In-Reply-To: <Y3NSPcnMwQ5j2gCm@redhat.com>
From: Pawel Polawski <ppolawsk@redhat.com>
Date: Tue, 15 Nov 2022 09:49:34 +0100
Message-ID: <CABchEG14iPxGxoQ-h=3KCow-hunUpqvyvfCLvO17y0-hQoJRzw@mail.gmail.com>
Subject: Re: Qemu virtual CPU limitation to 1024
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000188e5f05ed7e7046"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppolawsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_REMOTE_IMAGE=0.01 autolearn=ham autolearn_force=no
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

--000000000000188e5f05ed7e7046
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thank you for the answer.
Also I realized that somehow my email has split into two different threads,
sorry for the confusion.

Best,
Pawel

On Tue, Nov 15, 2022 at 9:48 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Tue, Nov 15, 2022 at 12:19:35AM +0100, Pawel Polawski wrote:
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
> > (1025) exceeds the recommended cpus supported by KVM (8)
> > Number of SMP cpus requested (1025) exceeds the maximum cpus supported =
by
> > KVM (1024)
> >
> > It is not clear to me if I am hitting qemu limitation or KVM limitation
> > here.
>
> As per the error message, this is a KVM limit. QEMU queries the KVM
> kernel module for this limit at runtime.
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
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

--000000000000188e5f05ed7e7046
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Daniel,</div><div><br></div><div>Thank you for the=
 answer.</div><div>Also I realized that somehow my email has split into two=
 different threads, sorry for the confusion.</div><div><br></div><div>Best,=
</div><div>Pawel<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Nov 15, 2022 at 9:48 AM Daniel P. Berrang=
=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue=
, Nov 15, 2022 at 12:19:35AM +0100, Pawel Polawski wrote:<br>
&gt; Hi Everyone,<br>
&gt; <br>
&gt; I am trying to check qemu virtual cpu boundaries when running a custom=
<br>
&gt; edk2 based firmware build. For that purpose I want to run qemu with mo=
re<br>
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
&gt; qemu-system-x86_64: -accel kvm: warning: Number of SMP cpus requested<=
br>
&gt; (1025) exceeds the recommended cpus supported by KVM (8)<br>
&gt; Number of SMP cpus requested (1025) exceeds the maximum cpus supported=
 by<br>
&gt; KVM (1024)<br>
&gt; <br>
&gt; It is not clear to me if I am hitting qemu limitation or KVM limitatio=
n<br>
&gt; here.<br>
<br>
As per the error message, this is a KVM limit. QEMU queries the KVM<br>
kernel module for this limit at runtime.<br>
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
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

--000000000000188e5f05ed7e7046--


