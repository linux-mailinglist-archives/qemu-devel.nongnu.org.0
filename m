Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA16853B0D8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 02:42:46 +0200 (CEST)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwYvF-0006xN-Kk
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 20:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwYpH-0003vZ-0h; Wed, 01 Jun 2022 20:36:35 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:39921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwYpF-00047y-J0; Wed, 01 Jun 2022 20:36:34 -0400
Received: by mail-oi1-x22b.google.com with SMTP id y131so4759328oia.6;
 Wed, 01 Jun 2022 17:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XdrfdHxaWmx9gsIN6gbPRflPZPVQ08Xrb0jXEispltE=;
 b=AE+nOJlblaJS8PgPgYZlqDaDVpdncUptCJEXs5IPqGzVkOdN0BbDvv+8HBIwUOE1O3
 X/Ma6i64ZOJBHom0r+jZIEQn1s6WeXc70odQFp9JHXT4+2ObBTc6lo457u4/xO8YiziE
 cjvvZPJkHrU5Unb7LDcayAvAw9XhAWJk0GWlh1cTCiJmlZkLSGH2+faP6DXQugiDgvVO
 2mg7kfC+ejn804tBUKHI1TgL7iDQ15S/5lTuq3x2DjtYkJA9WcHqq0wgCBsiVuQ73CfA
 iTAQ863J4yie9h0Io+69YKx867/TFPpnIQIKqML5e7RqvUhe6uA0zb6xQdi/eaMBUDEH
 J8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XdrfdHxaWmx9gsIN6gbPRflPZPVQ08Xrb0jXEispltE=;
 b=S5wZHBbnT/76s5xDUdaxBttTsFHfLIS+dG8c8ApmyktoTUCI7xz5M223rznpLYYUDA
 KJD1fYHch1RezcqbWKC+Bq7jy0DbJJgWLmlP3PYN151wOfUVbo3t/vLuaIgJlfucXzlN
 RpsnqcxIJjdyp8u0V9yyI7aIwYcK6IubYapyGIL7xzPMls/iFRPVW4+l6D6PQr2Kx0qL
 k31393/XEuoGRSBYG4EfT8b/pLzV6FDFCPPg1maPdBU0+pyJoxPRzumXBgz6gh5nhZDI
 CTU99Ue6cPIB/mSxr7ZLJZSOE1MWx1elvXDUMZONA5KLFbTaWnaEiGr+delOFwt1hovY
 obkg==
X-Gm-Message-State: AOAM532e58Uc+Eddnp0EM6MUmjvcnCDsWHMZ5ri5WNGpVGH8SRQCXQvZ
 EGzNvT42uaASnqzC8TND5eqZ4lZww55VzoPDvNs=
X-Google-Smtp-Source: ABdhPJwBX97R7qN6NdItfHswSe9TPIqKKAPJqx9eTibw/Ll6YW2cuL+A6/07OhpOJLDJ624EeHWY7cZrfyWInvvySuY=
X-Received: by 2002:a05:6808:19a6:b0:32b:90c4:d1af with SMTP id
 bj38-20020a05680819a600b0032b90c4d1afmr17086632oib.64.1654130189184; Wed, 01
 Jun 2022 17:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
 <20220601172353.3220232-4-fkonrad@xilinx.com>
In-Reply-To: <20220601172353.3220232-4-fkonrad@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 10:36:03 +1000
Message-ID: <CAKmqyKNDSbMFziFs8_Z1vpJGyAtc6g+cFHyXGv1GE7guHfaKDQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] xlnx_dp: Fix the interrupt disable logic
To: frederic.konrad@xilinx.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>, fkonrad@amd.com, 
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jun 2, 2022 at 3:32 AM <frederic.konrad@xilinx.com> wrote:
>
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Fix interrupt disable logic. Mask value 1 indicates that interrupts are
> disabled.
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index d0bea512bd..eed705219e 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -889,7 +889,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          xlnx_dp_update_irq(s);
>          break;
>      case DP_INT_DS:
> -        s->core_registers[DP_INT_MASK] |= ~value;
> +        s->core_registers[DP_INT_MASK] |= value;
>          xlnx_dp_update_irq(s);
>          break;
>      default:
> --
> 2.25.1
>
>

