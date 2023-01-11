Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBC66584D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 10:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFXpv-0000Mu-P0; Wed, 11 Jan 2023 04:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pFXps-0000M2-A3
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:55:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pFXpq-0001ST-N3
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 04:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673430953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6VA5T9v95vypbI3p6n7Rw0tKEUtIHJNO3nLbllmRDY=;
 b=QGvjj1KdCoNgasq0JgJ7TofxZuNHJwJ3nXnkggoomv+XcqpNVV7uXj5kLsAU1OBy20HzG8
 YrVjaLEGd17fNtvxNdCbSYKmvgwILNfjNTCu1B+roL6LPq8BZXF3MEfQ1a6q9gv1p3rhJT
 4WHC79bCW73kRmCn35pUEkOLEK43tIE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-kPhiOgzgPuKFvrZWzrALNg-1; Wed, 11 Jan 2023 04:55:49 -0500
X-MC-Unique: kPhiOgzgPuKFvrZWzrALNg-1
Received: by mail-ej1-f71.google.com with SMTP id
 dr5-20020a170907720500b00808d17c4f27so9694252ejc.6
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 01:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H6VA5T9v95vypbI3p6n7Rw0tKEUtIHJNO3nLbllmRDY=;
 b=1eHe8jMl4pdYRm82G81pkhhDBHmTp/gT8VkNnDPPBrwQHFPpypppaSDneXIvsvEjqV
 faRdU5u/SWMgFeC9uAPT3fSAALkzDSiP2I3bOh2Po7cqQXmKu3EOokV2JtEb7t7YQizg
 FLE0ONMYzL0RxXQUI91AU3rtjkzP/iQNMExcRGPkIPt1YBsdiTO+EM87U8SDP8yXyEl9
 4/jczGf8aYmIFH/3Zwu8akGG8kFlgfrV6JtKzk7+JuJhZBdx08UE7GolE+luAkseUjum
 p59mUC0SI+rewui/Y36LLGMJjgKMniqiO8lgnfWkd9MZrceo/69spWJT2k/LUF8Z62oj
 peNw==
X-Gm-Message-State: AFqh2kpchxEivCbvyyHfX/3eL/wb8uYS+J5wDeMMGjd6zz0tpINw4pvK
 CGbSU+pbaLbWg5Pb6ueB/BHePSn4z5qjxhSkgAjsQ/YpNeFxDH/9xpMsAW+mEFBWFAVt/uUEyo/
 OLBj98L2/sGkM78zT5HYgniZq9mwwUqg=
X-Received: by 2002:a05:6402:5293:b0:497:c96b:4de9 with SMTP id
 en19-20020a056402529300b00497c96b4de9mr1277004edb.237.1673430948648; 
 Wed, 11 Jan 2023 01:55:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxpjriK0SOYAZhNC4p7bqUJSvbMxknKV4ef944gnnAbe30GugRSuLTUqXlMFne5ChY0wZL2MOuspb+Z8+8S5E=
X-Received: by 2002:a05:6402:5293:b0:497:c96b:4de9 with SMTP id
 en19-20020a056402529300b00497c96b4de9mr1276997edb.237.1673430948476; Wed, 11
 Jan 2023 01:55:48 -0800 (PST)
MIME-Version: 1.0
References: <20230110174901.2580297-1-berrange@redhat.com>
In-Reply-To: <20230110174901.2580297-1-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 11 Jan 2023 13:55:36 +0400
Message-ID: <CAMxuvazv0EGDytTzK2Ex5810YYUJaXau1TSxm4=S5d7wigVttA@mail.gmail.com>
Subject: Re: [PATCH 0/2] linux-user: revert previous workaround for glibc >=
 2.36
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003d8b2a05f1fa013b"
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

--0000000000003d8b2a05f1fa013b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jan 10, 2023 at 9:49 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> It didn't appear that glibc was going to fix the problem
> breaking includes of linux/mount.h vs sys/mount.h, so
> QEMU applied a workaround copying the symbols/structs we
> need into a local header.
>
> Since then Linux modified linux/btrfs.h to pull in
> linux/fs.h which caused a clash with our workaround.
> Rather than invent workarounds for our workarounds,
> we can luckily just drop our previous workarounds.
> glibc has been fixed after all, and backported this
> fix to the stable 2.36 release series too. We should
> just expect distros to pull in the stable fix, which
> Fedora at least has already done.
>
> Daniel P. Berrang=C3=A9 (2):
>   Revert "linux-user: add more compat ioctl definitions"
>   Revert "linux-user: fix compat with glibc >=3D 2.36 sys/mount.h"
>
>  linux-user/syscall.c | 43 -------------------------------------------
>  meson.build          |  2 --
>  2 files changed, 45 deletions(-)
>
> --
> 2.38.1
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--0000000000003d8b2a05f1fa013b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jan 10, 2023 at 9:49 PM Daniel P. Ber=
rang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It=
 didn&#39;t appear that glibc was going to fix the problem<br>
breaking includes of linux/mount.h vs sys/mount.h, so<br>
QEMU applied a workaround copying the symbols/structs we<br>
need into a local header.<br>
<br>
Since then Linux modified linux/btrfs.h to pull in<br>
linux/fs.h which caused a clash with our workaround.<br>
Rather than invent workarounds for our workarounds,<br>
we can luckily just drop our previous workarounds.<br>
glibc has been fixed after all, and backported this<br>
fix to the stable 2.36 release series too. We should<br>
just expect distros to pull in the stable fix, which<br>
Fedora at least has already done.<br>
<br>
Daniel P. Berrang=C3=A9 (2):<br>
=C2=A0 Revert &quot;linux-user: add more compat ioctl definitions&quot;<br>
=C2=A0 Revert &quot;linux-user: fix compat with glibc &gt;=3D 2.36 sys/moun=
t.h&quot;<br>
<br>
=C2=A0linux-user/syscall.c | 43 -------------------------------------------=
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 --<br>
=C2=A02 files changed, 45 deletions(-)<br>
<br>
-- <br>
2.38.1<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lur=
eau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@red=
hat.com</a>&gt;</div><div>=C2=A0<br></div></div></div>

--0000000000003d8b2a05f1fa013b--


