Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799B142688
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 10:02:58 +0100 (CET)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itSxV-0001Nf-6g
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 04:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52543)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itSuT-0007C0-KI
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 03:59:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itSuP-0006N3-Lt
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 03:59:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44898
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itSuP-0006Mn-IH
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 03:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579510785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNhC8hwtl/1FPJC2imyTzqEZ0J+7xO+BBk87oqlLbMM=;
 b=HkjiUwJEKfariOyrOCPMe6sXKDu70LGccUbIeLV6hL0bDoC/h+EowYTGnuEVZv8JjOtx7E
 v6ClutYDtj5o0rOBQnAKHpOSJxd5m2VOOkoMaMnV8Pv9z1MvgmdardwOP7uD2Srp5O3alE
 sSYCczXBK7etS6ebhbjzLK7I/Q0Pu8I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288--HN2qt7iNz65plUD6oD7cw-1; Mon, 20 Jan 2020 03:59:42 -0500
Received: by mail-wr1-f72.google.com with SMTP id b13so13802806wrx.22
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 00:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bkxxr2XVDsI6mwKAIokXjZ2VM+KSHgrBoDYMwPFpTDI=;
 b=S91qm5CDI81pyxV5sxHkNg/nEnTpDorvEib8QU4vYl5GSjHhsZXqecWhDnCrwt5Ywi
 ozYjARW1Q3DcCzS4Ftbj3fAiCTaza3UNmRpLVehgivqus+3Vlm/GlkB6grMz4stODKMT
 LP2S8ulzzSEOKop+PaK7qu/ZeUcFV1McDGlDg3szcEbxmeUZX9JcrJY92sXoJJPapTuT
 tFN4bKj5G3LE6ahV7F/aZwCMyoVU2sIgoJxbJ4IVr83k4l3yy+BTxFwvzGecLNQywtXi
 MT6T4s3ySkfMujzRs2DxlvVqwEUJBLpmXFA6xjQvEJDZXa9sbjmYWnX3/W40LVnDfo6Q
 aY9Q==
X-Gm-Message-State: APjAAAWWb+LiT0TbpFLNSRcnW5SOaO9Vz3Nix6qvIVbzmfB/DZ6eUlLk
 rmOClEx3fm4RvrxNsNT0Emu0au4/FYFCDcPnw8alBD9Y0EbNS5mmYDsbZdxgowmpjkkzX5kkT78
 rVGyjLVrLAH+CEec=
X-Received: by 2002:a7b:c775:: with SMTP id x21mr17801633wmk.59.1579510779504; 
 Mon, 20 Jan 2020 00:59:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNjo9daEtRNvVQkENrimFPspnjPNNt3bvekqwrnxv0tvCt8jAnP9qWXWM6r04NTZzpV1/2Bg==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr17801617wmk.59.1579510779198; 
 Mon, 20 Jan 2020 00:59:39 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id r15sm6688568wmh.21.2020.01.20.00.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 00:59:38 -0800 (PST)
Subject: Re: [PATCH 6/9] cputlb: Split out tlb_mmu_flush_locked
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200109024907.2730-1-richard.henderson@linaro.org>
 <20200109024907.2730-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <84e28d3b-e059-ca17-9e9c-c20cf28c2b3e@redhat.com>
Date: Mon, 20 Jan 2020 09:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109024907.2730-7-richard.henderson@linaro.org>
Content-Language: en-US
X-MC-Unique: -HN2qt7iNz65plUD6oD7cw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/20 3:49 AM, Richard Henderson wrote:
> We will want to be able to flush a tlb without resizing.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   accel/tcg/cputlb.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index eff427f137..e60e501334 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -228,12 +228,8 @@ static void tlb_mmu_resize_locked(CPUTLBDesc *desc, =
CPUTLBDescFast *fast)
>       }
>   }
>  =20
> -static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
> +static void tlb_mmu_flush_locked(CPUTLBDesc *desc, CPUTLBDescFast *fast)
>   {
> -    CPUTLBDesc *desc =3D &env_tlb(env)->d[mmu_idx];
> -    CPUTLBDescFast *fast =3D &env_tlb(env)->f[mmu_idx];
> -
> -    tlb_mmu_resize_locked(desc, fast);
>       desc->n_used_entries =3D 0;
>       desc->large_page_addr =3D -1;
>       desc->large_page_mask =3D -1;
> @@ -242,6 +238,15 @@ static void tlb_flush_one_mmuidx_locked(CPUArchState=
 *env, int mmu_idx)
>       memset(desc->vtable, -1, sizeof(desc->vtable));
>   }
>  =20
> +static void tlb_flush_one_mmuidx_locked(CPUArchState *env, int mmu_idx)
> +{
> +    CPUTLBDesc *desc =3D &env_tlb(env)->d[mmu_idx];
> +    CPUTLBDescFast *fast =3D &env_tlb(env)->f[mmu_idx];
> +
> +    tlb_mmu_resize_locked(desc, fast);
> +    tlb_mmu_flush_locked(desc, fast);
> +}
> +
>   static inline void tlb_n_used_entries_inc(CPUArchState *env, uintptr_t =
mmu_idx)
>   {
>       env_tlb(env)->d[mmu_idx].n_used_entries++;
>=20


