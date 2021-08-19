Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DEA3F1B95
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:28:33 +0200 (CEST)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj20-0003nM-AW
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGixM-0001A7-6e
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:23:44 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGixK-0000JP-Hj
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:23:43 -0400
Received: by mail-ej1-x62a.google.com with SMTP id gr13so13319846ejb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mIGQ8U8i786FR1zep7CevtxmuInig+PDTXfDMPlOvEA=;
 b=gtyWdHMS7VtWCek66GvmBq4t6sHLW05ECmFn4aTzmxCOF+sC+ofphuEaDCtmHXJ1Mr
 tu5JtVWiIqdbeu1j/dAj2XCx+T/0zZ6Nk14hJg1xSSxv+YTpw0TOaCQLjq5/nplztA26
 ahX5fXLEuellvujHWzJCUC32QLpRF2lc3Ubo0Nsng9qjnlxiYbtxxtWlOQIC8uTKPGuN
 7rDyvV8FmIQKvRilSHC9GJXbLCAq8v5H01JYDeFpmSaQt5ZD3A/xBka8BaxRbqxoFX0d
 Tz/qVxp4RXitkjjY2t7bEr9D+FcZYuCflL00YXHgHg/RhBclf4pghJlv5c7NXAzxD9ZN
 tv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mIGQ8U8i786FR1zep7CevtxmuInig+PDTXfDMPlOvEA=;
 b=Gsnmc1nUYjxSMFwMwzIhMPYqxXw4GROwLZirQP8RL4ehXGiNir4sQsy3QbwZMCNjZM
 2C8fBGvnliDffl/j2q120NpZD9fO3pG3b3w73ByxJaWeASmWnhHrdQYtZLqfZ5jCaMUe
 PYpzOgE/AYc5NRTOywMwx6Ci6N8ppmQn44E6dkmEqQY/i6hEd4wkNGRn0352xouuS8a7
 7LIQPrpaJG0KBkD747VTrY3JAM+vTxLRfTXAWFB0pUB95xxRITsPyixt1Zjz5+KEwG3Q
 KzBIkFWvqyUQr43trl1mEpT0v0uzjs+WhlJhWGRYSYON4OrTQLLrpwm+bRjLLsfHqDY7
 k+0A==
X-Gm-Message-State: AOAM530s8ANl5mJC0Xiaxn08f5CL+XjbBxFEOQWHcJ2kAQ/HzaCLHPBf
 QEniodDtctGUgWq4Q4RFdgIkWbxLLIH2d3V8BFcgjQ==
X-Google-Smtp-Source: ABdhPJw0Dz6lipZ39p2BDlWkryGQXesCzAay+G3XBqDjPumFIIFs0dts+0GtR8QtqV9JaZ4NbqZcZIl2F8U508d9q2c=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr16276572ejz.250.1629383021060; 
 Thu, 19 Aug 2021 07:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-5-philmd@redhat.com>
In-Reply-To: <20210819142039.2825366-5-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:22:54 +0100
Message-ID: <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Replace g_malloc0() + address_space_init() by address_space_create().
> Release the resource in DeviceUnrealize().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/dma/xlnx-zdma.c    | 15 +++++++++------
>  hw/dma/xlnx_csu_dma.c |  9 ++-------
>  2 files changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index fa38a556341..9f6b3fa47c6 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error **=
errp)
>          };
>      }
>
> -    if (s->dma_mr) {
> -        s->dma_as =3D g_malloc0(sizeof(AddressSpace));
> -        address_space_init(s->dma_as, s->dma_mr, NULL);
> -    } else {
> -        s->dma_as =3D &address_space_memory;
> -    }
> +    s->dma_as =3D address_space_create(s->dma_mr ?: get_system_memory(),=
 NULL);
>      s->attr =3D MEMTXATTRS_UNSPECIFIED;
>  }

Why are these devices doing a heap allocation rather than
having an AddressSpace whatever field in their device struct ?

thanks
-- PMM

