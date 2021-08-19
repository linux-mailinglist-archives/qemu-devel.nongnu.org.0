Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999933F1B92
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:27:02 +0200 (CEST)
Received: from localhost ([::1]:42244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj0X-0007lU-Jp
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGivl-0004ku-U8
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:22:05 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGivk-0007R6-8d
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:22:05 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bq25so13243587ejb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bP4aV60OU/XNa7SPq6EjX9GCwPeYZ03RIxd9UgMiS3M=;
 b=nWXoXd3BXHy8v0vgVmQVCJCnZp+yWtyhoGqb4bKYpJiCkxZ2YtMZbAqVTBaTaEF35Q
 BBzVV3/GjBEOP7pxoDWfLmk57axMY0DWfON+b7WwFjnsBt0dUfcMOtB0c0wh5nn9EBsu
 uzRz4U6P8FtkNlCyhHvKN0LLC+l8RadsLHyJZ8SOE5tHnQu+8MzwIJlIQDrWHDDxU1Xv
 bYKNUPTPu80mR1Tg21hElXnMEpySgx2shruDiw2E5+fAafLRxF7hTi4cgowqEhDCHnn7
 Y4JAEXhVXzg/NrKnFRRsLJQf0aTe+GFoTeE3IvkrShSxpDEbyOqjXAMzqm1ujWptcWT8
 a/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bP4aV60OU/XNa7SPq6EjX9GCwPeYZ03RIxd9UgMiS3M=;
 b=LWlf7xyHN2pWS7iAoCNYwBMwTxNKxQNRkgQexy0WTmR+zV47lL4GNw9CUDWrGsMSTL
 DK05oi03HuZnWdjxhJ57RwBMqS0jszdlVmDJP2xEr1UjwQYDDoD8nrK5xuizSkSsS5my
 CjvJdHFWZgSzm078gPdJQE6+Sl7Z6ZBU/jppG5I6zYczTXxNCp1NI3a/8cxOCPiSmXd4
 ZF7ibrkQ6lAH/E/kviYofkG05gTwQY/TamOa5S69hhPUMN1RFtHww/hMocW8Y0qLbAVD
 4tYLDZaS2b5D5br1b4Md3+A5yM2Yhx0qEPLyTnTAgLHKQQYoWhv072lIJ+PBX/6CJv04
 yRlQ==
X-Gm-Message-State: AOAM530Ibu7eAsCEpYiYNPxsyJxkI9t0ATKB/VvIqheRIE5Rj8AN1kpd
 JFE27CwnB0xRNg1g6YTSbsebeMJhbFOeKXftwxPthw==
X-Google-Smtp-Source: ABdhPJysIDTcz8HSPXfGtJU3VzEewymL13kGMVOyYOg9yTOuRyettHndplo3pq5nZcupxf5tYfKVZQZ43jDACiv/kGg=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr15940539ejf.482.1629382922668; 
 Thu, 19 Aug 2021 07:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210819141527.2821842-1-philmd@redhat.com>
In-Reply-To: <20210819141527.2821842-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:21:16 +0100
Message-ID: <CAFEAcA-1aDG_DZDbWGy=uXDjPGdkcMaN8SRF9_i7KnbQes-_NQ@mail.gmail.com>
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Fix ptimer resource leak
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:15, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Fixes: 35593573b25 ("hw/dma: Implement a Xilinx CSU DMA model")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/dma/xlnx_csu_dma.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 797b4fed8f5..0c1c19cab5a 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -660,6 +660,13 @@ static void xlnx_csu_dma_realize(DeviceState *dev, E=
rror **errp)
>      s->r_size_last_word =3D 0;
>  }

This is a sysbus device -- when can it ever get unrealized ?

-- PMM

