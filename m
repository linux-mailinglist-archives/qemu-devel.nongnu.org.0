Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6992F9403
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:49:26 +0100 (CET)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BEz-0003lm-J1
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1BDS-00038U-CC
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:47:50 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1BDQ-0001dP-Q6
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:47:50 -0500
Received: by mail-ed1-x533.google.com with SMTP id dj23so12356613edb.13
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ol7Pplt1QX2TgzlDXq8iDZsLGkuYBPVKYlMm0bYXch0=;
 b=cU4mnCYcWX7ZvgizqQfW04ayZT3cvqSMD/GGJNRQh4eCPxNA/oYFFGWQHYu5GnaeRg
 p0nSfp4OEplOSxxfykTsR6Elc5U99cXySt0yygbhR0AeiX36YhgHBKE8YJLVmpGYXzts
 jM8JIK38058iiXgKI50yrw3uf9dC/liK5y+9tM8liozNsMei7X9RxMmBqIkzREyeOxRb
 AjYkbS32SbYPUHrQDAqmsSOR3S9X8etc5sn8dsMev7uwqR5YhE0oSbWja6iY0z2M7r1P
 weDyPY5vdQqHL4J5HznfxzdlE6C0PNAVUhQJyNVf0D5Kz6VcmdnoBhe/bb1WeL41ElUK
 xyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ol7Pplt1QX2TgzlDXq8iDZsLGkuYBPVKYlMm0bYXch0=;
 b=hQ882gk3I4Ogcgs18Wj+Im9DP50ddqWidqtRWxDZW9QuC6wDQbBGqae2Gv7ej2UpTX
 zsFjwDthK5pX9pJmLzYPRqynidN1LYJiSb/ZasfvPNQhnFE3UpYzxzwwMfux3Ofhtcp8
 h28N5PzshELDQ2sB7XSrwyoM4UGrHnG4XaJDGHtv17wLtfKw8K5d0xHG865Ymj59A7Nc
 MJ9cFGx4U3rMPD7R2jkh0AQsdbDTvK/WvX3KlTinOUnhjWFvgz8pMIG78Km5H4BH7RYJ
 SffXYmoB1Mn+HAvcKwGCOy1yAsS11/OB6du6vIyJevPrMTXg9Een0/LU/K4hcspIXm6I
 4zpg==
X-Gm-Message-State: AOAM532EdhF9zg3/PqmWzWihMHk7NB+z76O/ncXgkqE14ZO82nNz/sQI
 ZWekM0yE3yklWsYXvWLmAnNC4FKhh1w0/BvCviUdOQ==
X-Google-Smtp-Source: ABdhPJwvXj5aquDdO+E66/EFJhOkJMmJCWbXBPXMUgCED2z49wFyF9vTjG0PXg4YYavy4aBW5zZFzRVpr0JOrGHV7oQ=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr4081379edf.44.1610902066131; 
 Sun, 17 Jan 2021 08:47:46 -0800 (PST)
MIME-Version: 1.0
References: <20210117160754.4086411-1-f4bug@amsat.org>
In-Reply-To: <20210117160754.4086411-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 17 Jan 2021 16:47:35 +0000
Message-ID: <CAFEAcA8U74GifK08MtY8xU25EgfMxQf2kJO_Mn_yKeoabQokaA@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Hint notifier is not NULL in
 as_translate_for_iotlb()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Jan 2021 at 16:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When using GCC 10.2 configured with --extra-cflags=3D-Os, we get:
>
>   softmmu/physmem.c: In function =E2=80=98address_space_translate_for_iot=
lb=E2=80=99:
>   softmmu/physmem.c:643:26: error: =E2=80=98notifier=E2=80=99 may be used=
 uninitialized in this function [-Werror=3Dmaybe-uninitialized]
>     643 |         notifier->active =3D true;
>         |                          ^
>   softmmu/physmem.c:608:23: note: =E2=80=98notifier=E2=80=99 was declared=
 here
>     608 |     TCGIOMMUNotifier *notifier;
>         |                       ^~~~~~~~
>
> Insert assertions as hint to the compiler that 'notifier' can
> not be NULL there.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Yet another hole in our CI.
> ---
>  softmmu/physmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 6301f4f0a5c..65602ed548e 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -605,7 +605,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
>       * when the IOMMU tells us the mappings we've cached have changed.
>       */
>      MemoryRegion *mr =3D MEMORY_REGION(iommu_mr);
> -    TCGIOMMUNotifier *notifier;
> +    TCGIOMMUNotifier *notifier =3D NULL;
>      int i;
>
>      for (i =3D 0; i < cpu->iommu_notifiers->len; i++) {
> @@ -638,6 +638,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu=
,
>          memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
,
>                                                &error_fatal);
>      }
> +    assert(notifier !=3D NULL);
>
>      if (!notifier->active) {
>          notifier->active =3D true;

Is the assert() necessary to prevent the compiler complaining?
Usually we don't bother if it's about to be dereferenced anyway.

thanks
-- PMM

