Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71983325E5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:57:36 +0100 (CET)
Received: from localhost ([::1]:54564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbvb-0007A6-TW
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lJb0l-0001Hq-Gy
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:58:51 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lJb0k-0007jo-4F
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 06:58:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so5836912wmi.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 03:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NohMhn4XLK6qm/sKEcoQF9IHoo7QmfOoBWhBlYAPRlU=;
 b=rzux3CRipY61uG5R+5nAUW+HXtOsZYR4//cdai54TjoXcRsrjqo1kKZC/SCfitFLJH
 cDoPeHmAacWFhz8OT+BMvjs1nzFoOxOVqgmtVQxgeR5+6r9Csc1VDksAB80TaJpA8/Rb
 x4ZaeDalWWn2bJ1d/himg3ab2fxuRsOEUmlt2rcd2wRHlOdFo8wKJ/dmcTDC0VvzH9Qg
 tde9cN5p4/j+9BwRiNTkzdSTCbl4l6LkY9qHFjX0r+QXTcBODeliWrK2Dex4QRX7D0Pw
 tKe1vRSXs6KTgjIlce4Tkr6Nxa5CZwnML6y5WfeZb11eDGMYgV0ZP3aH5j/xt25iT+pw
 hEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=NohMhn4XLK6qm/sKEcoQF9IHoo7QmfOoBWhBlYAPRlU=;
 b=rGkMCf1SdCuCa+/JSzUhDczMs1Wy1Gr6A6uoQKinZCcK7YExrXxU90cNHfhNoougF6
 13cgFtwiUMc07QWtPR/JlrG5oV/gQWkEKnNddKvV/QoZYMm8E9JTpp6WWDgm0ZI/kxel
 S2Fbs5loZWfpRYRvSP2eFZb319cVDqycZLDnKoeyVeN6mJ0QT0WRYe7UGgtcjoYB8bED
 1EDSngG9ZmOuNQlqUMydqqPlZjIwY/ii78p7uvWaMvULy3wWMFJ+SIUp9VZqAT0xwMhp
 4aj/+HRzdX4a9AD5EyES/ntMaAfZLMkqWhYeDq85xfPsKuThRavswIza7JvaiRWgCSpN
 nmlg==
X-Gm-Message-State: AOAM531Io+dx1Mm7d5eSXTp6+WkD1SZQJavKPUR3GvD6GY5DjpMxtRLN
 SeB+O58M8K8I2K9acEXsohddDw==
X-Google-Smtp-Source: ABdhPJw65Lg16qCTvgkvj7f3dW9YrkpkyejqC/bOhuql52VO7Dh8QZUflekSQmtWPe8Zhy7n3IzN7Q==
X-Received: by 2002:a1c:9a09:: with SMTP id c9mr3570823wme.172.1615291128672; 
 Tue, 09 Mar 2021 03:58:48 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id z188sm4119321wme.32.2021.03.09.03.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 03:58:48 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id fab595dd;
 Tue, 9 Mar 2021 11:58:47 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/4] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
In-Reply-To: <34865f4c-dc32-4298-6ec9-c8690d738435@redhat.com>
References: <20210309102157.365356-1-david.edmondson@oracle.com>
 <20210309102157.365356-2-david.edmondson@oracle.com>
 <34865f4c-dc32-4298-6ec9-c8690d738435@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Tue, 09 Mar 2021 11:58:47 +0000
Message-ID: <m2mtvch72g.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::336;
 envelope-from=dme@dme.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-03-09 at 12:09:55 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> On 3/9/21 11:21 AM, David Edmondson wrote:
>> If a new bitmap entry is allocated, requiring the entire block to be
>> written, avoiding leaking the buffer allocated for the block should
>> the write fail.
>>=20
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks.

>> ---
>>  block/vdi.c | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/block/vdi.c b/block/vdi.c
>> index 5627e7d764..2a6dc26124 100644
>> --- a/block/vdi.c
>> +++ b/block/vdi.c
>> @@ -690,6 +690,7 @@ nonallocating_write:
>>=20=20
>>      logout("finished data write\n");
>>      if (ret < 0) {
>> +        g_free(block);
>>          return ret;
>>      }
>
> Alternative using g_autofree:

Newfangled witchy magic!

I'm happy to change it if you think it beneficial.

> -- >8 --
> diff --git a/block/vdi.c b/block/vdi.c
> index 5627e7d764a..1cd8ae2ba99 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -612,7 +612,7 @@ vdi_co_pwritev(BlockDriverState *bs, uint64_t
> offset, uint64_t bytes,
>      uint64_t data_offset;
>      uint32_t bmap_first =3D VDI_UNALLOCATED;
>      uint32_t bmap_last =3D VDI_UNALLOCATED;
> -    uint8_t *block =3D NULL;
> +    g_autofree uint8_t *block =3D NULL;
>      uint64_t bytes_done =3D 0;
>      int ret =3D 0;
>
> @@ -705,9 +705,6 @@ nonallocating_write:
>          *header =3D s->header;
>          vdi_header_to_le(header);
>          ret =3D bdrv_pwrite(bs->file, 0, block, sizeof(VdiHeader));
> -        g_free(block);
> -        block =3D NULL;
> -
>          if (ret < 0) {
>              return ret;
>          }
> ---

dme.
--=20
Tonight I think I'll walk alone, I'll find my soul as I go home.

