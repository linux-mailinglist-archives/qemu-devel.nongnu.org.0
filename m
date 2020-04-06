Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096021A002C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 23:34:02 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLZNY-0002X6-Kz
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 17:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jLZM8-0001yN-HJ
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 17:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jLZM7-0001kH-0j
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 17:32:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44852
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jLZM6-0001k2-Tq
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 17:32:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IOdilOVJ0ZFuZqInR9eshu0baX3Gp2zkP93AuNlSoY=;
 b=fZPE76x5vOAdP2d6BmUIKUjCXckqtToDHIML1hpVXTIm3hCrGAcST405cwBZERnb5R3CyY
 6+fZIVEREGEkrlvhbb84uncE142cRR0Bdi+Fc0JnD88tZOAOSHqPgqeMyeQBWgidMgUGkO
 NiwtmIfFvuhLrsqIvFgL63yclKQ+9nc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-lgbCwWccO7i_a84JPNDCeA-1; Mon, 06 Apr 2020 17:32:28 -0400
X-MC-Unique: lgbCwWccO7i_a84JPNDCeA-1
Received: by mail-wr1-f72.google.com with SMTP id k11so562556wrm.19
 for <qemu-devel@nongnu.org>; Mon, 06 Apr 2020 14:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TUe1wXIN/bBmtlPyhV1bcLb7zBp2UnhdpxKjiyRuSBE=;
 b=FxGf1xBbOK6I/KaGXbLEcYcC+SwyFxAKbHruBYx5+Zz7FGWpA70tqPFtw9PWSpt8H2
 kVfTJxm6uN8dchuex6yW9UI8go5YlqvWlC88YtgBhXJMRG5CzdTTPARx9Gv5X+jAspFV
 ENVv21VEs6CSIZkI48iqZfkW57j3JM22UNphUqkm2fIjHQx+8LbyGvg1x1xLsGQ4EyMh
 o70wzdXnmbrKX+2vyKmZ4juj6CZVuPgkSh/tA417mKucqMdyFbYsDfkIniRUmiZz6aFY
 df/DLXfSiK28fjHLeEMLKPZSXoXEVR7v0EuaFVytvZsyQwmEFpz+Ivo8oRYa87cw+dau
 A6jw==
X-Gm-Message-State: AGi0PuZFILeh93OKJmq8pNG3c07zA2f7kNdIlUwZOOiO/dF4FH0qEuKk
 EQpj+iMWc/RvSwPXLTxF0HJX9LOTCHlY+PnJEe36wkfGEVB2J8aXKDtww/c0tAbwdwurDHytWQS
 XiBqaKS/8lYSnzKY=
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr1100355wmh.39.1586208747683;
 Mon, 06 Apr 2020 14:32:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypJr7+5DPRhHhiSRKYbNBo8bF4Do53ptKGTz7mv4jYnPIAj+MI23tRKQwxDuoFdHoqTupXM5kg==
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr1100339wmh.39.1586208747449;
 Mon, 06 Apr 2020 14:32:27 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id r15sm29954881wra.19.2020.04.06.14.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 14:32:26 -0700 (PDT)
Subject: Re: [PATCH v3 12/12] configure: Add -Werror to PIE probe
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200403191150.863-1-alex.bennee@linaro.org>
 <20200403191150.863-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4653925a-716c-e0b4-6901-f0ad34f5cfe8@redhat.com>
Date: Mon, 6 Apr 2020 23:32:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403191150.863-13-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/20 9:11 PM, Alex Benn=C3=A9e wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>=20
> Without -Werror, the probe may succeed, but then compilation fails
> later when -Werror is added for other reasons.  Shows up on windows,
> where the compiler complains about -fPIC.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20200401214756.6559-1-richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/configure b/configure
> index 22870f38672..233c671aaa9 100755
> --- a/configure
> +++ b/configure
> @@ -2119,7 +2119,7 @@ if compile_prog "-Werror -fno-pie" "-no-pie"; then
>   fi
>  =20
>   if test "$static" =3D "yes"; then
> -  if test "$pie" !=3D "no" && compile_prog "-fPIE -DPIE" "-static-pie"; =
then
> +  if test "$pie" !=3D "no" && compile_prog "-Werror -fPIE -DPIE" "-stati=
c-pie"; then
>       QEMU_CFLAGS=3D"-fPIE -DPIE $QEMU_CFLAGS"
>       QEMU_LDFLAGS=3D"-static-pie $QEMU_LDFLAGS"
>       pie=3D"yes"
> @@ -2132,7 +2132,7 @@ if test "$static" =3D "yes"; then
>   elif test "$pie" =3D "no"; then
>     QEMU_CFLAGS=3D"$CFLAGS_NOPIE $QEMU_CFLAGS"
>     QEMU_LDFLAGS=3D"$LDFLAGS_NOPIE $QEMU_LDFLAGS"
> -elif compile_prog "-fPIE -DPIE" "-pie"; then
> +elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
>     QEMU_CFLAGS=3D"-fPIE -DPIE $QEMU_CFLAGS"
>     QEMU_LDFLAGS=3D"-pie $QEMU_LDFLAGS"
>     pie=3D"yes"
>=20


