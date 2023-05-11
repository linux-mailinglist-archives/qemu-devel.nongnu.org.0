Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0766FF07D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 13:23:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px4OC-0003vr-KO; Thu, 11 May 2023 07:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px4OA-0003ve-E4
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:23:14 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px4O6-000140-SH
 for qemu-devel@nongnu.org; Thu, 11 May 2023 07:23:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f42bcf5df1so30817025e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683804188; x=1686396188;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLh2cashjEcWwR2ahB3PSINGSDHRZy0wdQIZleozWQI=;
 b=w4MmfKJEHsXYQrauMcyhQQpx6bn24H7wX9qCENfP20Epg6328cY6HaLvePlGV0vBmF
 p1pd4dcAWJXg4wax35lUaHjS/klIukiACiimdhzxO+gsuZIKotDexg0j8Xgdm9DrDhPd
 NJ68k/WKwviD3lvfxlQcARM6wMHKl1yjRyWUUIYzW0XlV11yHJLVboFSu+tW8FqKcTOj
 yts2p/Dxu6d9FzsDRgHXiPYvlNStohy32j+g2n6A3l8K0Bu1sj//IvWM8xjHQXe5nqd2
 c2YGBPkc7VWyWtnemYHkaMJPPmapxTPnDhh6LGmkdmSsuPsr45rAUmEvyK3qZWPOdc/c
 bo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683804188; x=1686396188;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TLh2cashjEcWwR2ahB3PSINGSDHRZy0wdQIZleozWQI=;
 b=MTexfYCYgPmeBGQdUlCHVjyrXouSv50WgAgftOyF7quEi2coC6Iaz1x1LVn5yQnjD3
 wPNWZ6flz5xn8DVWeLkT1XnXwD97/qT1WYZq0zpgVnCAUQW2HFNeRoTqtnXGBg5K16uB
 DAybbrx5pp8cI+ztx8PXDP6V1EDjUpsEaBXypfBj/fDdT9K6dEKXM/832X4FEpJqa7QX
 XoU30DC7SVxx1xNXg9vkD615YIKrGtRA9fcBBOz3aIP3hlj2ftUcnGWkF/dubNvfwqMU
 AFtbDHdP7XinAAPR4kY7HhvKFgLTyeLnFbmjKg4MmWgN9aXMLYj/XSM0P1Kemm5bGp7R
 CAYw==
X-Gm-Message-State: AC+VfDxO+Fast5aBEeylq0nztpB7p3e5fSDHHcQTySBFi62NL2o6D8rL
 nXFRZPSxbcjaHw6cN1dEDHDCfA==
X-Google-Smtp-Source: ACHHUZ7NsxcPMDY7O2BNn68gk4/jg0qnyI574jHdgWypJ+kHgwQJq9VQPf4jPS4ulSoAT84pfMXxzA==
X-Received: by 2002:a7b:c357:0:b0:3ee:19b4:a2e6 with SMTP id
 l23-20020a7bc357000000b003ee19b4a2e6mr13345244wmj.19.1683804188649; 
 Thu, 11 May 2023 04:23:08 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 10-20020a05600c024a00b003f423dfc686sm12686099wmj.45.2023.05.11.04.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 04:23:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCD1F1FFBB;
 Thu, 11 May 2023 12:23:07 +0100 (BST)
References: <20230425224850.2116064-1-iii@linux.ibm.com>
 <20230425224850.2116064-2-iii@linux.ibm.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 1/2] tests/tcg/multiarch: Make the system memory test
 work on big-endian
Date: Thu, 11 May 2023 12:20:17 +0100
In-reply-to: <20230425224850.2116064-2-iii@linux.ibm.com>
Message-ID: <8735433yec.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> Store the bytes in descending order on big-endian.
> Invert the logic in the multi-byte signed tests on big-endian.
> Make the checks in the multi-byte signed tests stricter.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/multiarch/system/memory.c | 64 +++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 22 deletions(-)
>
> diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/sy=
stem/memory.c
> index 214f7d4f54b..eaae6929cb3 100644
> --- a/tests/tcg/multiarch/system/memory.c
> +++ b/tests/tcg/multiarch/system/memory.c
> @@ -40,18 +40,21 @@ static void pdot(int count)
>  }
>=20=20
>  /*
> - * Helper macros for shift/extract so we can keep our endian handling
> - * in one place.
> + * Helper macros for endian handling.
>   */
> -#define BYTE_SHIFT(b, pos) ((uint64_t)b << (pos * 8))
> -#define BYTE_EXTRACT(b, pos) ((b >> (pos * 8)) & 0xff)
> +#if __BYTE_ORDER__ =3D=3D __ORDER_LITTLE_ENDIAN__
> +#define BYTE_SHIFT(b, pos) (b << (pos * 8))
> +#define BYTE_NEXT(b) ((b)++)
> +#elif __BYTE_ORDER__ =3D=3D __ORDER_BIG_ENDIAN__
> +#define BYTE_SHIFT(b, pos) (b << ((sizeof(b) - 1 - (pos)) * 8))
> +#define BYTE_NEXT(b) ((b)--)

I guess we don't want to start count high so we'll see:

255, 254, 253

instead of

0, 255, 254, 253?

> +#else
> +#error Unsupported __BYTE_ORDER__
> +#endif
>=20=20
>  /*
> - * Fill the data with ascending value bytes.
> - *
> - * Currently we only support Little Endian machines so write in
> - * ascending address order. When we read higher address bytes should
> - * either be zero or higher than the lower bytes.
> + * Fill the data with ascending (for little-endian) or descending (for
> + * big-endian) value bytes.
>   */

There is also a comment later on that needs fixing:

  /*
   * Read the test data and verify at various offsets
   *
   * For everything except bytes all our reads should be either positive
   * or negative depending on what offset we are reading from. Currently
   * we only handle LE systems.
   */

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Would you be able to re-base and respin v3 so I can pull it cleanly?


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

