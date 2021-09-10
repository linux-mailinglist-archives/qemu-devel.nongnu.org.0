Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCC40706B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:18:19 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOkAM-00051x-J7
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mOk9G-0004MI-Me
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:17:10 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mOk9D-0004sj-On
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:17:10 -0400
Received: by mail-lj1-x229.google.com with SMTP id y6so4348170lje.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=DjXkWx+hlExdUxL6GWrmLOLkgcLq4gT4hUesH3FXH0U=;
 b=ouZqQP1vfTJk3p+Pd3YRldEcbuiTSIhu4kduzSpsrFmaWOKmXgkXQx+cpIKlbCiZWC
 HAEivib+PPC9jqnGTnpEXaTRoawlVyQlZZak52KZZDmsZkzQI4UP36QXHprunEw7mS+3
 2Qvq5BrNwhvp2/cJJv0zmBlD/pkT3Y81wgZQTOUInl6BhcrJRj4aKJutN7TcVyfrEvhv
 1+q65PjRx4+dbdGotHkK34aQcs1AkwCxamcrKgPhAEjaQGDquDXTi26Bh3YHByKG6KUx
 DVW44RM3e6jGsa0vuylDar9wb17iYFtXeUU4eZHN+aUmxW4FcPZBPY23jcK4dChFfsOZ
 rncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=DjXkWx+hlExdUxL6GWrmLOLkgcLq4gT4hUesH3FXH0U=;
 b=RTAEHidPhw51QngMZ+TbPCdt1k8DZXddqBQFD9mIsh37PKvEgusg9CU8yvAaGMfRuZ
 hX5+G+WaFkxu3GCGYUgc0DGYlNH//bdH+QRqkGhx0dHmzseAO7FLzbkcDWVJ9i/u/0c3
 FQETS16VZXEKJ7UgqylkvJ63PVDGTz91jXOcU5Sz/nmCBKlkldnqA5xDLUDQaGM7Umrh
 4o5mz2TRTGEEFhOU7OHIgpvUN+6Mcx8YxWzTrz8lJ3AG85CqZeT5QrxvOU4GCcOyIQUa
 LghKx4SkdMJW9aQFgFAKtDx4hus1z59FtF0bvnyQIfFuWyRbF0ywC8Tc/pKrzwDCsBty
 Qhsw==
X-Gm-Message-State: AOAM533RUwvHdchmcD7sDFHrDNfs12USWeQoyfhO9dRKTExMHPmfvN6Z
 bqADX911IrRLKISzFz0K8ekyBw==
X-Google-Smtp-Source: ABdhPJxB6Vvzy/LMpQuYkI+K+e/4yLy70zRo9pL+n4TAI92F3GAiEQuy7UjYmzAMF5DnwWyA3W0CGw==
X-Received: by 2002:a2e:9942:: with SMTP id r2mr5121735ljj.92.1631294225956;
 Fri, 10 Sep 2021 10:17:05 -0700 (PDT)
Received: from 192.168.1.7 ([2a00:1370:810e:18d4:6011:88a9:c1bb:af5f])
 by smtp.gmail.com with ESMTPSA id j1sm609511lfg.24.2021.09.10.10.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:17:05 -0700 (PDT)
Date: Fri, 10 Sep 2021 20:17:03 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] elf2dmp: Check curl_easy_setopt() return value
Message-ID: <20210910201703.28bd8174@192.168.1.7>
In-Reply-To: <20210910170656.366592-2-philmd@redhat.com>
References: <20210910170656.366592-1-philmd@redhat.com>
 <20210910170656.366592-2-philmd@redhat.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x229.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Fri, 10 Sep 2021 19:06:55 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> From: Peter Maydell <peter.maydell@linaro.org>
>=20
> Coverity points out that we aren't checking the return value
> from curl_easy_setopt().
>=20
> Fixes: Coverity CID 1458895
> Inspired-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Informal T-b tag on
> https://lore.kernel.org/qemu-devel/20210909004313.1dadb24e@192.168.1.7/
> Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
>=20
> v1 from Peter:
> https://lore.kernel.org/qemu-devel/20210901143910.17112-2-peter.maydell@l=
inaro.org/
> ---
>  contrib/elf2dmp/download.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>=20
> diff --git a/contrib/elf2dmp/download.c b/contrib/elf2dmp/download.c
> index d09e607431f..bd7650a7a27 100644
> --- a/contrib/elf2dmp/download.c
> +++ b/contrib/elf2dmp/download.c
> @@ -25,21 +25,19 @@ int download_url(const char *name, const char
> *url) goto out_curl;
>      }
> =20
> -    curl_easy_setopt(curl, CURLOPT_URL, url);
> -    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
> -    curl_easy_setopt(curl, CURLOPT_WRITEDATA, file);
> -    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
> -    curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0);
> -
> -    if (curl_easy_perform(curl) !=3D CURLE_OK) {
> -        err =3D 1;
> -        fclose(file);
> +    if (curl_easy_setopt(curl, CURLOPT_URL, url) !=3D CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL)
> !=3D CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_WRITEDATA, file) !=3D
> CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1) !=3D
> CURLE_OK
> +            || curl_easy_setopt(curl, CURLOPT_NOPROGRESS, 0) !=3D
> CURLE_OK
> +            || curl_easy_perform(curl) !=3D CURLE_OK) {
>          unlink(name);
> -        goto out_curl;
> +        fclose(file);
> +        err =3D 1;
> +    } else {
> +        err =3D fclose(file);
>      }
> =20
> -    err =3D fclose(file);
> -
>  out_curl:
>      curl_easy_cleanup(curl);
> =20

Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>

--=20
Viktor Prutyanov

