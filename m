Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823E1F99A8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 16:09:55 +0200 (CEST)
Received: from localhost ([::1]:35038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkpoA-0005T6-Ab
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 10:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkpn4-0004W4-FF
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 10:08:46 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkpn2-0002Zm-TM
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 10:08:46 -0400
Received: by mail-oi1-x241.google.com with SMTP id b8so16028432oic.1
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3MpaN1jCIxflfOGDUVdhPjkDjs3e0RYl3Wl/DiuzogQ=;
 b=XrTYsF5L+2SbifvWsq2LLAPCNsXhJnF0lRiWvBBDy8KnfK8TRvht0f1+aI9rxfWUuz
 hsCaXglwe7Egf6g1zq/e5X919k3ul2KoBbbv2HUDlGa/NVuszb0IP4wgsJWUyUg+dNYy
 yIfTU8C4QiexF003OYz6jrouOZMYEjwa4JpnFamNr5N+g9Qk0NNNmpJknkoW6+kSFQ+Q
 xeJegjJDQjf1hpkEFJmF2y0ODYH6h4bfMog8NWUXuaFRzc3yWwbykoin/xI8hsjO1Sck
 2VMqBW4xBmJbzknLb+oJak2nbQ8kcWUqoIx/rH8lZLDCX1UFFOpuC/C9pj3uBSoMHnQB
 FfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3MpaN1jCIxflfOGDUVdhPjkDjs3e0RYl3Wl/DiuzogQ=;
 b=W5gHzdVYLOrEJdy7D/XMZ3FXcSvvQWwl/e55cJqxNtQrsjs21ibcEyNsxufWBARMUu
 3jSqPQHWDqbOLz0RIpUKL2UrRKLcrJSJdDTBt/vHmDC4lmu5vCKt1YLYE00zwNEshAb8
 WdZ0RghLPiaxUr5KGCkFFbe+xaS/fUPw5HrfJGxB4K2SGM+JLefEJNO+Ma+PslNixWiJ
 Ib4FRGeHnb7CvuFT1K+CUGfUkSGhy0gDl2r/CuOQcKE+BO/3d/MUpvVhIO+yQ3cQl4YN
 v22t+KHAGMUxqqeykWbvi8MLnMAY0RmFwghFoL9xV09XYnzxUc0yA4vwyRAUBWD+RUJf
 dPXQ==
X-Gm-Message-State: AOAM5326WFqqhbTUxwPNTK5odvlJDk7r6UnYO0Q1v2GA4eZV5a3Ut3qq
 BpXyl73kCLeDTMhNEsH+TQjAreU3khmqbS0ChRzn5w==
X-Google-Smtp-Source: ABdhPJxVh3VL+S/AfbYwtxTWol3rxb5iWuFbwMtnRJBqKcABc7g+E4nhAD0jmUKCedj54iZErrVY/SJh7BVV7UfsoaY=
X-Received: by 2002:aca:568c:: with SMTP id k134mr8376644oib.48.1592230123711; 
 Mon, 15 Jun 2020 07:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200605102230.21493-1-philmd@redhat.com>
 <20200605102230.21493-7-philmd@redhat.com>
In-Reply-To: <20200605102230.21493-7-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 15:08:32 +0100
Message-ID: <CAFEAcA_8v+4EBJ+RhrQeC_8TXH1iTL_StxSaFYT+27=yFGtQ-w@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] hw/sd/sdcard: Simplify cmd_valid_while_locked()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Jun 2020 at 11:27, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> cmd_valid_while_locked() only needs to read SDRequest->cmd,
> pass it directly and make it const.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

