Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCC2B0022
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:09:34 +0100 (CET)
Received: from localhost ([::1]:55338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd6jd-0005QV-8U
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kd6iW-0004yg-QN
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:08:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kd6iU-0002Mz-KV
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605164901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NWr4S7tk2PqD6e1bOvS654Dym96oiBv9TrLlI7gHHAs=;
 b=SSLKxOVrvCts9bNIagu1ISE8DTStZa4eWtfbBMhb3HwGgWPv8pleqhiubovht4r0hXUG3E
 aGR6OFmcy8qCQEfJVay8x3mEby1fPpTC0tLzB3oQtc4Q4EjTwI2lth9mANugAdbbTptzvG
 WJUfx2JlwKFvc5Ut4S99kMQp1cM89xs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-gHb6d_SKPSiJw3lA0ogLjA-1; Thu, 12 Nov 2020 02:08:18 -0500
X-MC-Unique: gHb6d_SKPSiJw3lA0ogLjA-1
Received: by mail-pf1-f200.google.com with SMTP id u3so2006232pfm.22
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 23:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NWr4S7tk2PqD6e1bOvS654Dym96oiBv9TrLlI7gHHAs=;
 b=DY7wJneM9+29oPrdydJD0utXxK+6ZiPeFJB5iJHKk5x+YfiIyVjvfoKW/2gxAgIPbF
 5DVluiGBiw8kEwvEoL7PUoI37atcgz29FSecLHswvNGOEr2WycMPba+UaPTUlm5e7nux
 OA3U/EBRzGg9bIMl43n7eaRh9kx186jvn85XtPLcvCyWhdqO7bASOlhKSycz3So93fSg
 rSMa3sR7vzkA6ufKNGb54gDIbkvQE+3JWMOVlNfOQ3611kpMiVYfWa/UMr0XDEn6mJQg
 KQ9Tu7u8DqP2qw9bPKtM4VESTZ8TUnAj7SnHqjgvKAwQqH0nc0LFp5AjjsX8d3xJ/MVj
 0dTw==
X-Gm-Message-State: AOAM530AQw+wnJkRivoAztyJyx2wVpbJknBGmhTjMBayP9TOIRB3szJN
 dxt+UfPPdYNzEGTbVDVx2k2C49r9PMie048KvCSzX9HA9yqV8RmRu/8LQqDwVZZg3fh1cDNjIwM
 Nh3/nZU5Jlq4N7L0qa3di59wZ47eSvP4=
X-Received: by 2002:aa7:9e88:0:b029:18b:c1b7:a8cd with SMTP id
 p8-20020aa79e880000b029018bc1b7a8cdmr1305312pfq.21.1605164897563; 
 Wed, 11 Nov 2020 23:08:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBnqc418WEBHotRnGAvbkgxb5IU98sDBKn+xMwy7dje1s89DnTuQMstjL6IpYx3tC5Ry5mL8MFcEPldnas+G8=
X-Received: by 2002:aa7:9e88:0:b029:18b:c1b7:a8cd with SMTP id
 p8-20020aa79e880000b029018bc1b7a8cdmr1305295pfq.21.1605164897302; Wed, 11 Nov
 2020 23:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20201111135716.1209421-1-pbonzini@redhat.com>
 <20201111150336.GF906488@redhat.com>
 <a210eaa2-6d2c-0d7c-d7e3-96c73acaf6b0@redhat.com>
 <87blg3kqs9.fsf@dusky.pond.sub.org>
In-Reply-To: <87blg3kqs9.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Nov 2020 08:08:04 +0100
Message-ID: <CABgObfadfLN8TTJxF05tWdR8PaeGOMjxkfgk2uEKmHoO=cxuxg@mail.gmail.com>
Subject: Re: [PATCH] vl, qemu-config: remove -set
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000082956a05b3e393ab"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082956a05b3e393ab
Content-Type: text/plain; charset="UTF-8"

Il gio 12 nov 2020, 07:55 Markus Armbruster <armbru@redhat.com> ha scritto:

> Immediate removal of -set / rejection of -set for some option groups
> needs more justification than just "I think we can get away with it":
> there has to be a tangible benefit.


The benefit is being able to switch parsers (for everything but -device to
begin with) away from QemuOpts. Non-scalar priorities have a use for
machine, accel and object, but for now not for device. Alternatively I can:

1) keep QemuOpts as the parser, and turn the options into qdict, instead of
using keyval

2) move -set out of config-file.c and into vl.c, so that I can special case
the monkey patching.

What would immediate removal buy us
> over the orthodox "deprecate, wait for grace period to expire, remove"?
>

The problem is that, at least for -device, I don't think we can reasonably
remove it without a replacement.

Paolo


>

--00000000000082956a05b3e393ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 12 nov 2020, 07:55 Markus Armbruster &lt;<a hre=
f=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; ha scritto:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Immediate removal of -set / rejection of =
-set for some option groups<br>
needs more justification than just &quot;I think we can get away with it&qu=
ot;:<br>
there has to be a tangible benefit.=C2=A0 </blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">The benefit is being able to switch p=
arsers (for everything but -device to begin with) away from QemuOpts. Non-s=
calar priorities have a use for machine, accel and object, but for now not =
for device. Alternatively I can:</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">1) keep QemuOpts as the parser, and turn the options into qdict, =
instead of using keyval</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
2) move -set out of config-file.c and into vl.c, so that I can special case=
 the monkey patching.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">What would immediat=
e removal buy us<br>
over the orthodox &quot;deprecate, wait for grace period to expire, remove&=
quot;?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">The problem is that, at least for -device, I don&#39;t think we can r=
easonably remove it without a replacement.</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--00000000000082956a05b3e393ab--


