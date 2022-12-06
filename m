Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE41644A53
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 18:32:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2bnA-0006fs-Px; Tue, 06 Dec 2022 12:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p2bn5-0006eE-Fb
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:31:35 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1p2bn3-00039X-Au
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:31:35 -0500
Received: by mail-ej1-x634.google.com with SMTP id x22so7882775ejs.11
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 09:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S/Y+6jA750OdkiUCkz7GPFVwYhD1W2MGlpMgDKjRgbY=;
 b=ZKqW/HeE2R/R1XgW27jQB6sa0N2NJLJI++vzaoBazlLUlbiWuM423Wp3yZuesIsfBh
 0usnE5c1CzJY1/0lrAkexb12YaXmmw0CCsAo8cNkvKjhZ/43NDMt1g9oy2koShydVEwb
 Sd0DHCBr0Wq14QuidTOpOePFMWVvcCKlLoXE8otdNwPWNIHScEBj4kS2ge8xu2wed1Jm
 rKCfd6pp3vntPmgITipX2Qy4kwE99vAV2jDlsRLH8izGs8Ka7vRjUvItg24CMXNssS/o
 NJEdkIe/vdz+zx5RXD+Y+9fcLuhDF5kHlBAp1l7PmVLA3nwwSWPi6yCXDKuuypGYrVxQ
 resw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S/Y+6jA750OdkiUCkz7GPFVwYhD1W2MGlpMgDKjRgbY=;
 b=n9zo52b9ARhruukIe32q3z2TT7ihwu2YS1hUtwrROTr+j92WjOe+vEMfY+Pj6ikXKm
 R9GxiaPmNdR/OcH/uo55TjgqjQGonQtLdk5hdkVJEBH15OZnyK81SXTCfakIs3OAhDvf
 qfksJH0xAGckFtnC6R+/XN2gJmcAoAQWoZpPWw60igH2Q/yW1gxshpxOaa9+SSBbLBzY
 c70rcdzCGy7uOiwK2R6CsNFByTIvPe7YnW+5EmE1St8pWH6dzGweecFNpugHzEw3azcz
 gMVmNsCAA9456EqMbx4dZZIveXexw2BHV/yZZPbr5AzFqy4qGXrwkYiWoccNSZ4oJBpn
 qS9Q==
X-Gm-Message-State: ANoB5pmfzSNb62cLNhiZjq09wqbuuntEUdUpt7uiiNLUUAYcgfGuWD4H
 qIOPlwl8Tnigen2tRetn98V7CZyyqyDTTblDYrBa7w==
X-Google-Smtp-Source: AA0mqf4ZUcnXDsHH0QMnxNEWkJ5bcYJhn4vb74qyBoIJ5JM+R78P/8PHsAozlE8xmzdpFBdVm/zphv7/beOOi3gESMM=
X-Received: by 2002:a17:906:29c3:b0:7c0:e0db:f136 with SMTP id
 y3-20020a17090629c300b007c0e0dbf136mr10836727eje.333.1670347890950; Tue, 06
 Dec 2022 09:31:30 -0800 (PST)
MIME-Version: 1.0
References: <fb95bd97-8d5f-b0eb-008b-47a96808a74f@linaro.org>
 <Y4818KfGO7Y9Tsn/@work-vm>
In-Reply-To: <Y4818KfGO7Y9Tsn/@work-vm>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 6 Dec 2022 10:31:19 -0700
Message-ID: <CANCZdfom6nJT_EaZWy4MJL0CJ8B8xw_ddtUe=yqxOOvfNc8o0w@mail.gmail.com>
Subject: Re: Thoughts on removing the TARGET_I386 part of
 hw/display/vga/vbe_portio_list[]
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Fabrice Bellard <fabrice@bellard.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 BALATON Zoltan <balaton@eik.bme.hu>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000b1134b05ef2c2c01"
Received-SPF: none client-ip=2a00:1450:4864:20::634;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000b1134b05ef2c2c01
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 6, 2022 at 5:32 AM Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> From intel arch manual 19.3:
>  '..16-bit ports should be aligned to even addresses (0, 2, 4, ...) so
> that all 16 bits can be transferred in a
>   single bus cycle. Likewise, 32-bit ports should be aligned to addresses
> that are multiples of four (0, 4, 8, ...). The
>   processor supports data transfers to unaligned ports, but there is a
> performance penalty because one or more
>   extra bus cycle must be used.'
>
> I think I've even seen it suggested that a 32bit access to ffff might be
> defined - although I'm not sure if that's legal.
>

I don't know how well defined it is from an Official Intel Bus Definition
perspective, but on at least one 486-era core and one Pentium-era core it
would wrap. So an inl(0xffff) would result in an inb(0xffff), inw(0),
inb(3) showing up on the bus. I hit this as a bug in debugging a custom
driver way too many years ago. The cores weren't from intel, but were AMD
and/or some other third party (I don't recall which ones). I'd rate my
surity of this knowledge as medium, so if there's some other resource that
contradicts this, I'd tend to believe that source for this edge-case
behavior.

Warner

--000000000000b1134b05ef2c2c01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 6, 2022 at 5:32 AM Dr. Da=
vid Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From intel arch manual 19.3:<br>
=C2=A0&#39;..16-bit ports should be aligned to even addresses (0, 2, 4, ...=
) so that all 16 bits can be transferred in a<br>
=C2=A0 single bus cycle. Likewise, 32-bit ports should be aligned to addres=
ses that are multiples of four (0, 4, 8, ...). The<br>
=C2=A0 processor supports data transfers to unaligned ports, but there is a=
 performance penalty because one or more<br>
=C2=A0 extra bus cycle must be used.&#39;<br>
<br>
I think I&#39;ve even seen it suggested that a 32bit access to ffff might b=
e<br>
defined - although I&#39;m not sure if that&#39;s legal.<br></blockquote><d=
iv><br></div><div>I don&#39;t know how well defined it is from an Official =
Intel Bus Definition perspective, but on at least one 486-era core and one =
Pentium-era core it would wrap. So an inl(0xffff) would result in an inb(0x=
ffff), inw(0), inb(3) showing up on the bus. I hit this as a bug in debuggi=
ng a custom driver way too many years ago. The cores weren&#39;t from intel=
, but were AMD and/or some other third party (I don&#39;t recall which ones=
). I&#39;d rate my surity of this knowledge as medium, so if there&#39;s so=
me other resource that contradicts this, I&#39;d tend to believe that sourc=
e for this edge-case behavior.</div><div><br></div><div>Warner</div></div><=
/div>

--000000000000b1134b05ef2c2c01--

