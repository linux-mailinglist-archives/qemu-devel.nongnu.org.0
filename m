Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C62EC482
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 21:12:08 +0100 (CET)
Received: from localhost ([::1]:60242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxFA6-0004RI-Qe
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 15:12:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxF9A-00040d-Vr
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:11:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxF96-0000Ak-FM
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 15:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609963862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ss5O4HoV6m/ll40Z/tv/bIR98zoaYwlHu8D6/BLhGkM=;
 b=EsjtPMyKqgM3J3G8Esij8+H3dFNtJbpG+fqUJUaOOofhnrX1iUBgiWEGJ30mHZTDMebDh8
 HingdEhV5bv4tY3vYRCXM6t6XWohZuY7CFE7taVwwhhvcw1an9hMZPrvZKuJl2jGwSSfpH
 F6ZGGRFM3mNrQKwL2eMCjbMbkY9HfQQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-EoqDzaLyNWCNHdWDIm5oGw-1; Wed, 06 Jan 2021 15:11:00 -0500
X-MC-Unique: EoqDzaLyNWCNHdWDIm5oGw-1
Received: by mail-pj1-f72.google.com with SMTP id o23so2349459pji.9
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 12:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ss5O4HoV6m/ll40Z/tv/bIR98zoaYwlHu8D6/BLhGkM=;
 b=nWeJOTRGH4l3t0/gm4K3XhWnQP74XCVoYdIiVw4ZCBsDtUu9YQBakxXTZX2w0p4CcM
 kVGfCodkDlids/lIBn6/6wws8Oi4PK5DT6Q2qO8xyN5ElHCCU1xP/435e4pVocwso3SH
 MvabLK6Mmzn0Ovpb5/jeE2ysIpDYyjFMiNqKvQLi5Rekvod5NuT+HI16ImKgk94M3J+f
 k03KqEqLD26DO2sYB2kUcGrIvUsYkxThNubqv8JC9VQUNubnC2014d3ablMzDgrF9vec
 rSR6ZEqRgbu+ik/dsYFnxUGw85APoXFeJOe1gct2Z2il+HSFVqVt1d8YzH811aVUkMXm
 9kTQ==
X-Gm-Message-State: AOAM530BVaCeAX4P0hZWcuCjIIp152rUYPH/9+aAhTSDU0U+JxL0fmAJ
 cTC9DP0sg8dr9q89wuv2dhjZnSSrSNfdJJbntaKpzmRZNFoxjuMOcvEFdhd76H3pi8rDKhSzLjg
 hwB5IhWawU4B3ylxgtdknUUKQHXcrFfA=
X-Received: by 2002:a17:902:ff12:b029:db:d7b7:c99d with SMTP id
 f18-20020a170902ff12b02900dbd7b7c99dmr6096172plj.14.1609963859360; 
 Wed, 06 Jan 2021 12:10:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRJo92+aiqNoZghKTyCdHKfnnk5YLx6I+6zn+ulwnrk6iXf5jOy9tEH9wUmFdj9S0XvH1syusbhsoEx2qgbSg=
X-Received: by 2002:a17:902:ff12:b029:db:d7b7:c99d with SMTP id
 f18-20020a170902ff12b02900dbd7b7c99dmr6096152plj.14.1609963859121; Wed, 06
 Jan 2021 12:10:59 -0800 (PST)
MIME-Version: 1.0
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
 <1609861330-129855-6-git-send-email-steven.sistare@oracle.com>
 <20210105162708.GH724458@redhat.com>
 <d6c1b91e-9c49-3356-554d-39da53a11e16@oracle.com>
In-Reply-To: <d6c1b91e-9c49-3356-554d-39da53a11e16@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 6 Jan 2021 21:10:46 +0100
Message-ID: <CABgObfZT9wxJQ9DxVBxFRse7G8zKb6J=MF-Mh9X8p8kZOuBtOw@mail.gmail.com>
Subject: Re: [PATCH V2 05/22] vl: memfd-alloc option
To: Steven Sistare <steven.sistare@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ecb3ef05b840ebfa"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ecb3ef05b840ebfa
Content-Type: text/plain; charset="UTF-8"

Il mer 6 gen 2021, 17:37 Steven Sistare <steven.sistare@oracle.com> ha
scritto:

> Yes, I considered that, but there are other memory regions that cannot be
> controlled
> by the command line but which must be preserved, such as vram, bios, and
> rom.  If vram
> is not preserved, parts of the screen will be blank until the user
> performs some action
> which refreshes the display.  bios and rom should be preserved rather than
> re-recreated
> with potentially different contents from the firmware images in the
> updated qemu package.
>
> However, your comment reminds me that I must add a few lines of code to
> preserve the
> memory-backend-memfd.
>

A new option specific to memory is the wrong way to do this. If a special
mode must be specified when starting QEMU, you can make it a -machine
option and block the QMP commands unless it's specified. Otherwise you can
use "normal" migration to marshal and unmarshal across the update those
memory regions that aren't backed by shared memory or memfd.

Also, because of the mess that vl.c had grown into, adding new "simple"
options is going to be very very hard. In fact I am working on turning many
options like -smp or -m into syntactic sugar for -machine; at some point I
would like to (almost) forbid adding _any_ new option.

Paolo



> - Steve
>
>

--000000000000ecb3ef05b840ebfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 6 gen 2021, 17:37 Steven Sistare &lt;<a href=3D=
"mailto:steven.sistare@oracle.com" target=3D"_blank" rel=3D"noreferrer">ste=
ven.sistare@oracle.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Yes, I considered that, but there are other memory regions that can=
not be controlled<br>
by the command line but which must be preserved, such as vram, bios, and ro=
m.=C2=A0 If vram<br>
is not preserved, parts of the screen will be blank until the user performs=
 some action<br>
which refreshes the display.=C2=A0 bios and rom should be preserved rather =
than re-recreated<br>
with potentially different contents from the firmware images in the updated=
 qemu package.<br>
<br>
However, your comment reminds me that I must add a few lines of code to pre=
serve the <br>
memory-backend-memfd.<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">A new option specific to memory is the wrong way to do=
 this. If a special mode must be specified when starting QEMU, you can make=
 it a -machine option and block the QMP commands unless it&#39;s specified.=
 Otherwise you can use &quot;normal&quot; migration to marshal and unmarsha=
l across the update those memory regions that aren&#39;t backed by shared m=
emory or memfd.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Also, be=
cause of the mess that vl.c had grown into, adding new &quot;simple&quot; o=
ptions is going to be very very hard. In fact I am working on turning many =
options like -smp or -m into syntactic sugar for -machine; at some point I =
would like to (almost) forbid adding _any_ new option.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
- Steve<br>
<br>
</blockquote></div></div></div>

--000000000000ecb3ef05b840ebfa--


