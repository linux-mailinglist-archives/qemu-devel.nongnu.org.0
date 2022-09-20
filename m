Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D837E5BF267
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:46:04 +0200 (CEST)
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oansJ-00038m-Fx
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oalds-0004Io-Du
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaldo-0005TE-PZ
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663712575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=03yklO8QM9lGvioUvtdUt8YctcQBrs02y2FcyrFxlwA=;
 b=H1bnAMfwCSe81CBUC/r5G0JS3utBoYmAwebC1fyc6WMoKUd7N/uP3FOY76d4Y8MJXe2gf6
 e1orbHmwZkBgm3GZ7lWiW3k1FSk6Ei8DH5+GNoI2Ge7nBwxQbr0PoyFnCBSZOfHIAdnvIr
 oTDHKE+JfXPMWa7EEIG5ot0/s/oP9No=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-TLUoF_7RP1629zOCqz8yuQ-1; Tue, 20 Sep 2022 18:22:54 -0400
X-MC-Unique: TLUoF_7RP1629zOCqz8yuQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so2879252edz.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=03yklO8QM9lGvioUvtdUt8YctcQBrs02y2FcyrFxlwA=;
 b=sw4Cqd1yJ/iqv28aKcQsYmyVblwvvaoMARERIYhY4VtP893yv9nu6HQMxlklg+sWWQ
 RGsm4xR5ZAfztP14cUT/b4hd2hBhiUB/YKJB1yxdZQ+XBSnl4e0alaF9QQlbd3d+IIJF
 dIiRgVBmmubUGydfJuWYoH0RDKSiZAXNJuZKYB3EMJwRO/5bTdnnm9Wd/MFG09A+dcr9
 ALIwSeBcY5RK5RM5gEtsHvxTyD/WoEZQxXowXZtRke2ixhsYZj4Cu4m3uKGIsrBHvPJy
 z4jRT2YJKsqbmyJXidp7x2oVru2g7MkOjSvMrjVW6OWss/lWP94E9JSM4Y8EFsyonOm4
 SWMA==
X-Gm-Message-State: ACrzQf1dhkfqF3zVfqg1vI2JU6JKe+lEtKqdm7U9xB84XejX+DmxYDrO
 MYAbMlCDvHCWZyOfGblENPNIqHvD3P03eUJFM4NUEewhg2ZJPoGZuNiCA6+TnfuOUSjma83oRyd
 TrW9AVChSueT/NhoqIQTrlE9zlPU00TE=
X-Received: by 2002:a17:907:7203:b0:781:c89b:c779 with SMTP id
 dr3-20020a170907720300b00781c89bc779mr4018689ejc.396.1663712573084; 
 Tue, 20 Sep 2022 15:22:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Rs7h2pDq1WLv9idaMkBPSX9w5asQAVnG6IxvqZJNFmqAXi8LO4mkXgE24FF0SILOrqk3UA1zi0qAfowxtL3c=
X-Received: by 2002:a17:907:7203:b0:781:c89b:c779 with SMTP id
 dr3-20020a170907720300b00781c89bc779mr4018676ejc.396.1663712572858; Tue, 20
 Sep 2022 15:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220919134126.75656-1-pbonzini@redhat.com>
 <CAHmME9rkethn5PHDkB8CupEBOYWFnzfA9c_YkmB_YMt64ci3pQ@mail.gmail.com>
 <Yyooji0KGTpZxzL1@zx2c4.com>
 <CABgObfZyb6t5iTMvXu+VfKx27dXDt1_RnPuL2tvK74evL0138Q@mail.gmail.com>
 <Yyo6l8hq7TzRDSBv@zx2c4.com>
In-Reply-To: <Yyo6l8hq7TzRDSBv@zx2c4.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 00:22:40 +0200
Message-ID: <CABgObfbgQyF14tvv7zr+N8VHJf7rgWvwZomcK0ed_D-aj0SCBg@mail.gmail.com>
Subject: Re: [PATCH] qboot: update to latest submodule
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Hajnoczi, Stefan" <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e9fca105e92344ca"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e9fca105e92344ca
Content-Type: text/plain; charset="UTF-8"

Il mer 21 set 2022, 00:11 Jason A. Donenfeld <Jason@zx2c4.com> ha scritto:

> On Tue, Sep 20, 2022 at 11:57:09PM +0200, Paolo Bonzini wrote:
> > It should have been automatic, there's mirroring set up.
>
> Hm, something is weird. Gitlab says "This project is mirrored from
> https://gitlab.com/bonzini/qboot.git. Pull mirroring updated 28 minutes
> ago." yet the commit is much older than 28 minutes ago. Backend issue of
> sorts?
>

Yeah the mirroring from GitHub to (my personal fork on) Gitlab was failing
because git:// is not supported anymore. Changed to https:// and everybody
is happy.

Btw I saw your other patches, will get to it tomorrow.

Paolo

>

--000000000000e9fca105e92344ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 21 set 2022, 00:11 Jason A. Donenfeld &lt;<a hr=
ef=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; ha scritto:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On Tue, Sep 20, 2022 at 11:57:09PM +0200, Pa=
olo Bonzini wrote:<br>
&gt; It should have been automatic, there&#39;s mirroring set up.<br>
<br>
Hm, something is weird. Gitlab says &quot;This project is mirrored from<br>
<a href=3D"https://gitlab.com/bonzini/qboot.git" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://gitlab.com/bonzini/qboot.git</a>. Pull mirror=
ing updated 28 minutes<br>
ago.&quot; yet the commit is much older than 28 minutes ago. Backend issue =
of<br>
sorts?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Yeah the mirroring from GitHub to (my personal fork on) Gitlab was fa=
iling because git:// is not supported anymore. Changed to https:// and ever=
ybody is happy.<br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Btw =
I saw your other patches, will get to it tomorrow.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000e9fca105e92344ca--


