Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9610583F99
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:07:03 +0200 (CEST)
Received: from localhost ([::1]:51992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3EE-0004Hq-Qq
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oH3BD-0001zz-0d
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oH3B7-0000np-AU
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659013425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjX7F0je3ZQRZMBnG7VxuWRZqS38qDQ2l6YQrWCgTik=;
 b=V0Q+0SdWEmvMyXY0xG2uikBSm+zC36mUrfoSNTiLTjqUPYeo9fou9dkhNkBNSiMfc7s384
 HTqk35qX+Vmt2KI5b5eFo3yfFkMudyi1KVTbrRnDUM+kMj7mFApAsCgtwyN/pFxIpn0ASA
 wuwHDhHJaEaMNOnC0Njwso0J/UeYdN0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-4RsIuL3-PNWXX9RVvkJthw-1; Thu, 28 Jul 2022 09:03:43 -0400
X-MC-Unique: 4RsIuL3-PNWXX9RVvkJthw-1
Received: by mail-oi1-f200.google.com with SMTP id
 s19-20020a056808209300b0033ac2da4062so710773oiw.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QjX7F0je3ZQRZMBnG7VxuWRZqS38qDQ2l6YQrWCgTik=;
 b=v2vgirttErQREkgAVUDYo/6Akbr5k61CaTEFRYG/KF4Jd2MoyfR6W3xciHfmColeJF
 XbKkgpTePQ8dGLLa8yJvJ1gOJdv9DaGWncH0994/9lQO3Py3VnFi9wbmDZnGIexkYkDq
 9Ebpai27d/PHGrXPiDPoFgUAMGUohjgOjCsaOXhcwid63rUbkzGoaHYtT81fDn77x9RJ
 0xSsL3tKlDDePT2mC85nGcKbIxmPNn2+X+FVVXOWt+sVJ9UZ1lrcaddWEQuLNVfDPO20
 1T35h9UBN6efJTqUAr3meaHYegBdsUV+GpIvjN64vzSsAZQWbAADGree2c748lJaTTDl
 na8g==
X-Gm-Message-State: AJIora8ixCiE64Ud/KlGDw/PTOE78kt4Zdrm+sNFPPnVJcCVZJ4CtMZC
 HnwNcDSOzBoRxJvyyWCJiq/nGQ09ijEZ1RaxsCcELg6NH8kt9MQcebcQBqYYt0/JiPOk9gv/O2+
 S5EiXkgZGLkdFegGQ5YBq+5u2IcqwPaY=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr4007735oib.205.1659013421091; 
 Thu, 28 Jul 2022 06:03:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vG906vlMYciUBfOnIbcbS1Aa4gQT/2827uPGd9uO9lmbajsMh4OVzuA5ONsdFZPeQPUh8kTPbPaoHtoCdSmnM=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr4007712oib.205.1659013420825; Thu, 28
 Jul 2022 06:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220727132802.812580-1-bmeng.cn@gmail.com>
 <20220727132802.812580-6-bmeng.cn@gmail.com>
In-Reply-To: <20220727132802.812580-6-bmeng.cn@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 28 Jul 2022 17:03:29 +0400
Message-ID: <CAMxuvaxziJCNcEACKYngBuHDYU5fm7SojOeNk+PvWf=8ZyU2=A@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] chardev/char-socket: Update AF_UNIX for Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi

On Wed, Jul 27, 2022 at 5:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Now that AF_UNIX has come to Windows, update the existing logic in
> qemu_chr_compute_filename() and qmp_chardev_open_socket() for Windows.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

lgtm,

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>
> Changes in v2:
> - drop #include <afunix.h> as it is now already included in osdep.h
>
>  chardev/char-socket.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index dc4e218eeb..14a56b7b13 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -557,7 +557,7 @@ static char *qemu_chr_compute_filename(SocketChardev =
*s)
>      const char *left =3D "", *right =3D "";
>
>      switch (ss->ss_family) {
> -#ifndef _WIN32
> +#ifdef CONFIG_AF_UNIX
>      case AF_UNIX:
>          return g_strdup_printf("unix:%s%s",
>                                 ((struct sockaddr_un *)(ss))->sun_path,
> @@ -1372,10 +1372,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
>      }
>
>      qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_RECONNECTABLE);
> +#ifndef _WIN32
>      /* TODO SOCKET_ADDRESS_FD where fd has AF_UNIX */
>      if (addr->type =3D=3D SOCKET_ADDRESS_TYPE_UNIX) {
>          qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
>      }
> +#endif
>
>      /*
>       * In the chardev-change special-case, we shouldn't register a new y=
ank
> --
> 2.34.1
>


