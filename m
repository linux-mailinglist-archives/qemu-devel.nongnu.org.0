Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE7930BC0B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:32:35 +0100 (CET)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6sz5-0004wq-3D
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sy4-0004Ow-Gq
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:31:32 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6sy1-0004K6-Mz
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:31:32 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so29146191ejc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nn73uSUVH5yPYti5eVa0hD1TrkgyKYCxhklx9OwkBLM=;
 b=en+Uk6F81I9FDa10oTKmhrwCJQAi87Vw1pGPK3c4pVl6YmWxXG2r6ij+WAsxwDBvbZ
 ThY1dNCmLuSTC0SxxqrekuCzPo08QDhOj2Yk5gh0LSi7ER0+nDAAkjiFRB7oCy8HS3er
 d329DHQV//iUrRfO0nVcX5fJA1NwoZfyeUOx/pjqsVMKvc+LVDrsvg1Y0j/IpPLlVWMy
 YKGQRaqXQcwgab9DI/ifuui27AAhfDvlSyYzZcG9g5K67tC3NwJzJfppPe0ekx13kUoS
 cgeOEKr5rIA7AIPtt3hVav+/EMhrI3CDNz+2f+GgDzDVa9ISvaKwVENEpNbFZyh5e5rQ
 ZCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nn73uSUVH5yPYti5eVa0hD1TrkgyKYCxhklx9OwkBLM=;
 b=FknrLfIvQL3NcJ675XlftfU5d2neptjexxWiU+jkPq8AJwIsccvQM6LeqXreR8SGG3
 Q8vmeuOLXnfUZlhX5k8I1Ra0k8lHvQ9KyibXyfd+zRJ+aIaMSCenpsoEPtAlNlrX6TXb
 dIyz6Uhf7jv1jPZ13dE/fdJchAf7Ata6Qi+1NYqp14UkeJ+kYF5lG1lWcXJq0wG0YyKz
 sRh6JPb55ioeYGj4sgPutzKQWmy8fAWw8NTwmSwznA8rX9Wp23QJFvWk5U2FXuBUpzth
 oU79CLpU2Q3CJJ6kbvs1ScqIYDNuzDgv64OED2tTI+TRhmFietKE/E4DxHLhQiKN2gdr
 LHGg==
X-Gm-Message-State: AOAM530/S0cHbZy9UBNK+HW4e5/OBoNANPnbTnPxeSz63OMx0vXblze5
 +a8FOSGQZxmelOUetZzSAvq6D9jvlT9aFOzMa4RfyQ==
X-Google-Smtp-Source: ABdhPJxmBaDcDLZJ1ToKs0ti32mskrG7+35daIbjiI0gYmf7cwraDOJg2NmGdJH6bTsEsfVcPyV5X8DfCkbXSU0O2Zg=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr22057746ejt.56.1612261888209; 
 Tue, 02 Feb 2021 02:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-5-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-5-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:31:16 +0000
Message-ID: <CAFEAcA-j8TeozQLSTSK1ueVFKZ4J6tTCjMBNJMQTLQCeAnKkpw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] hw/intc: make gicv3_idreg() distinguish between
 gicv3/gicv4
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> Make gicv3_idreg() able to return either gicv3 or gicv4 data.
> Add a parameter to specify gic version.
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_dist.c   |  2 +-
>  hw/intc/arm_gicv3_redist.c |  2 +-
>  hw/intc/gicv3_internal.h   | 12 ++++++++++--
>  3 files changed, 12 insertions(+), 4 deletions(-)

> -static inline uint32_t gicv3_idreg(int regoffset)
> +static inline uint32_t gicv3_idreg(int regoffset, int revision)

I would prefer to pass in the GICv3State* and let the function
look at s->revision.

>  {
>      /* Return the value of the CoreSight ID register at the specified
>       * offset from the first ID register (as found in the distributor
> @@ -331,7 +331,15 @@ static inline uint32_t gicv3_idreg(int regoffset)
>      static const uint8_t gicd_ids[] = {
>          0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
>      };
> -    return gicd_ids[regoffset / 4];
> +    static const uint8_t gicdv4_ids[] = {
> +        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x4B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
> +    };
> +
> +    if (revision == 3) {
> +        return gicd_ids[regoffset / 4];
> +    } else {
> +        return gicdv4_ids[regoffset / 4];
> +    }
>  }

Updating the comment "These values indicate an ARM implementation of a GICv3"
to add a note about what the new values are indicating would be nice.

thanks
-- PMM

