Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C098153F96A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 11:18:54 +0200 (CEST)
Received: from localhost ([::1]:35284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyVMS-0006N3-RH
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 05:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyVCM-0003Kl-9G
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:08:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nyVCJ-0007gI-Rb
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:08:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id a10so6406863wmj.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wRdkeZsWqeJa2kaycluG0XG2OYwK2p6fl5w8x5cwQl0=;
 b=P/ctc1lHbGzKAQno05JcrJDlL00AOHM1wRpABR9fLhvf9xnAlMIL4BC/TS/nuJVccD
 6tp5ii4OyYkug/IHragTZiRvannbLPK0D8dLdB/e/9ujq3VzwyDPPiJCNZR8UoK5zVxi
 Vd1Sv9XfxhXH86cKtCSql9sM5sU2/61qlmYHa/fCXt54LwP6bfdDoOQsMkXst4ZN+Dys
 td7hrDhvn82taL6Qzg5e9WwvZvbpz8QNb9ezLCGehZhqmISxY62XoYWdw4pPsRAica1E
 I48WZYyGiqgB4dY427LbOEdqRyRT+ghWFVQM86uwbO/+aDanbSU0mCwZsylxeaVUH5dS
 2+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wRdkeZsWqeJa2kaycluG0XG2OYwK2p6fl5w8x5cwQl0=;
 b=S5BiHK7DaPfZjllE8FhjD07tgQElgUjJuFZXZQNrJY21FkynW1w+UhMDeP3oe0EhUE
 bozREvW83USdTZ/ZmF4moBCTKnm7sucnbbDgZiewJuEqyxBm05T+YqPu13o0A9AqEtaE
 w4GWAYmm9xQzUls1CvW5L3ATeIJjnW+D3XaHFblSxKb2++8xyycJ8BOulwXVcrO3eJJh
 ELDQFPuMduitk7Wkzo0r1NR0Aa9uoNKuPSWqq6fCQJg4KC2QHu1muxhljtvpVNPVklG1
 PtEjhRQvH17J1V4Pcw6b6wV1cJ+PxGVRIanZbmU4gOjOANocf9prJjcDYzkYuzze4YAQ
 QLUQ==
X-Gm-Message-State: AOAM533Nh7mdQ19bF4bPhswXdA9oXIpaLK2Iiw3OBUE9MdTcTIyP1BEp
 wJ05xaKO43e3hnQzzguBefqIhg==
X-Google-Smtp-Source: ABdhPJw2H2LVuTcvmxusMS2cwK1jnWpvfbRZ4ayr/0qCm3Jv52BMlPDd5931q3pZZaN68svJLxmlPQ==
X-Received: by 2002:a05:600c:3209:b0:39c:51c7:58db with SMTP id
 r9-20020a05600c320900b0039c51c758dbmr8790654wmp.20.1654592901817; 
 Tue, 07 Jun 2022 02:08:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o34-20020a05600c512200b003944821105esm21912794wms.2.2022.06.07.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:08:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBEC91FFB7;
 Tue,  7 Jun 2022 10:08:19 +0100 (BST)
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-11-richard.henderson@linaro.org>
User-agent: mu4e 1.7.26; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH v3 10/49] semihosting: Clean up common_semi_flen_cb
Date: Tue, 07 Jun 2022 10:05:40 +0100
In-reply-to: <20220521000400.454525-11-richard.henderson@linaro.org>
Message-ID: <87h74wvo1o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Do not read from the gdb struct stat buffer if the callback is
> reporting an error. Use common_semi_cb to finish returning results.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 88e1c286ba..8792180974 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -346,15 +346,17 @@ static target_ulong common_semi_flen_buf(CPUState *=
cs)
>  static void
>  common_semi_flen_cb(CPUState *cs, target_ulong ret, target_ulong err)
>  {
> -    /* The size is always stored in big-endian order, extract
> -       the value. We assume the size always fit in 32 bits.  */
> -    uint32_t size;
> -    cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
> -                        (uint8_t *)&size, 4, 0);
> -    size =3D be32_to_cpu(size);
> -    common_semi_set_ret(cs, size);
> -    errno =3D err;
> -    set_swi_errno(cs, -1);
> +    if (!err) {
> +        /*
> +         * The size is always stored in big-endian order, extract
> +         * the value. We assume the size always fit in 32 bits.
> +         */
> +        uint32_t size;
> +        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
> +                            (uint8_t *)&size, 4, 0);

I did a double take but compared to the actual code it calls I guess
its fine. Technically I think:=20

        cpu_memory_rw_debug(cs, common_semi_flen_buf(cs) + 32,
                            (void *) &size, sizeof(size), 0);

might be slightly cleaner but whatever:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +        ret =3D be32_to_cpu(size);
> +    }
> +    common_semi_cb(cs, ret, err);
>  }
>=20=20
>  static int common_semi_open_guestfd;


--=20
Alex Benn=C3=A9e

