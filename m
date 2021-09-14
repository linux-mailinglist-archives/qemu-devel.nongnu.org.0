Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A4340AAB7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:23:21 +0200 (CEST)
Received: from localhost ([::1]:34606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4eu-0007za-CK
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ4cJ-0006yF-7I
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:20:39 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ4cG-000645-TE
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:20:38 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso1475477wms.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jldrsfm0pnB1bf1KdKDN/O0IDpxroUJS/77jL63B2LA=;
 b=ovrFEC3y8tnejc0QP59D57dbi3hue+9hLf7U052C5oXNVcnIllaI3DwoSpKY+h0HAP
 6ra242OQwLB83PGo5y5X6TBb1/qvm03iWALxN7b5VoYh/XrXniBkHpoTJAouFK04cVXx
 EaJebrWFLR+N0sIUXD3YuyBwjngRH3tapvRbmrs4FR7u9cwRLEz2tVb/YSryhw1GXjUV
 aE4+xEHqHlcnJd27B6ZFaBs3sb9veC9NTn+2zTqhY1Olys3InOE4arQO10qjs+YJ9W6Y
 q+eDDl84SiEoxY1nR0IxsQ6uvBOqTQNOpJqqg0K4Mph1iVaVqdbSQHWorX74yWOAVOdZ
 m4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jldrsfm0pnB1bf1KdKDN/O0IDpxroUJS/77jL63B2LA=;
 b=lco4e02O93zxm3F0hRBgwn7rXNl6J19OiBfWNeNpX+AFpO4Au6a81oHkhzhynbVOAm
 aH6k6Mr3ZFBPGXxwGT5CzvZtQKU77kliYR6NPS7yCPNYKJJnScUBxS25BeqatbovpyhF
 bAJJYI1q0MUwzwVUt0QW1GqFqALR1ftYbt9oga2zGEYd3/7UHNziBvYuy5bsRko61IhB
 51Om8MpWGWWhdm9QiSn1xHj2sy2GQJ3AjwMV6bAFLcq8FXWvmojhNZdtMX3dQSnkLri6
 /bBgZcTB/Gx7fn9RlzwxKlgxxK43IK0PeIIz1iGt+s1j2RmQ1O0ffof9ffgePzeZogZd
 IQEA==
X-Gm-Message-State: AOAM531EXOIpRvfiS4iWwnbrQ9vWYCvExhsXt1lsdaNECya7UJai3epQ
 AZreKKb3FQcaOh+HiqV+GyJSxnbwXxprcwpJOdCViw==
X-Google-Smtp-Source: ABdhPJx19x245IpDZMuvE/T+OuFRU9Ku6oI9MZQWzfGOe5rjekmZo6taWWWbYAgmDf280xMzD44SJadd15FTfyYvP1A=
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr1017281wmq.21.1631611232583; 
 Tue, 14 Sep 2021 02:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210914085404.3889441-1-clg@kaod.org>
In-Reply-To: <20210914085404.3889441-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 10:19:42 +0100
Message-ID: <CAFEAcA9epGAoHPNV=N+x2TWbFoRPgQSUML-RCDkMhvtYK5SEFQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/ppc: Fix 64-bit decrementer
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sept 2021 at 09:56, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The current way the mask is built can overflow with a 64-bit decrementer.
> Use sextract64() instead.
>
> Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for=
 TCG")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  v2: replaced MAKE_64BIT_MASK by sextract64
>
>  hw/ppc/ppc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 7375bf4fa910..4f14464c9220 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -876,7 +876,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uin=
t64_t *nextp,
>      bool negative;
>
>      /* Truncate value to decr_width and sign extend for simplicity */
> -    value &=3D ((1ULL << nr_bits) - 1);
> +    value =3D sextract64(value, 0, nr_bits);
>      negative =3D !!(value & (1ULL << (nr_bits - 1)));
>      if (negative) {
>          value |=3D (0xFFFFFFFFULL << nr_bits);

I think these lines that say "if negative then force all the
high bits to one" are also no longer required. That is, this
entire section of code:
    value &=3D ((1ULL << nr_bits) - 1);
    negative =3D !!(value & (1ULL << (nr_bits - 1)));
    if (negative) {
        value |=3D (0xFFFFFFFFULL << nr_bits);
    }

is an open-coded sign-extension, which can all be replaced with
the single line
    value =3D sextract64(value, 0, nr_bits);

(and also: if nr_bits is 64 then the "<< nr_bits"
is undefined behaviour.)

thanks
-- PMM

