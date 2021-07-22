Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93543D265C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:02:42 +0200 (CEST)
Received: from localhost ([::1]:53208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aDh-0000EA-EV
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6aCC-0007FM-W8
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:01:09 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6aC8-0004Ao-VJ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:01:08 -0400
Received: by mail-ej1-x632.google.com with SMTP id qa36so8793779ejc.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dbglzk0SpYyrlFCiNkK0gx+ft7PwKYtJWDIoK7xvN7M=;
 b=O35MaVz7mlwgJ1cRGK677TOSzpV23mZpk2AzPh6fLKoDL1b02K7tuxalbHSTxzIjI3
 /CylDQV1L/AFnNPvfuo6h8BZW0gnpEkNTpbxwCm+zT2gDLXewjHNzZNfXNf1gNysrnWR
 hZ1u3nwqjMxvpj1SYjMX3dKU0JVbiVv+9q7snVAfXAcmZJGOqDanHccTVxn6L9cDtZJI
 dnLZc44AExRnXNLC8G24zzrcWpMissXmhTADz05oZQrDViGADjBTy9b9ElnZBo74OsNW
 qfCHUu0stNyp+n05SbWT1VpgtUrAF7tavOHP8dBpT6bJjMMgzuo0NLc8wgUcfKuxWg7E
 JYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dbglzk0SpYyrlFCiNkK0gx+ft7PwKYtJWDIoK7xvN7M=;
 b=QnBAkta3GGc91A/cZ5PSbJmYfz2fR2Jc98xO3uk5Ksgy5DgXHFZKhRg8QVOjMMCZ2r
 aLh1Wd8rKQU06fGh2XHX4XMtzmZ8rpzj+44977wFkMbca4y3M8v12natoY8R6KXICsWC
 W2MfoFYudd8LJczJBMMns3kcpI5+0E57dBK0P6tuPcR+GG7bhJa2fZLhPJGtPUXrFCpC
 xQ1dlzq/9XP3Q24OsHj5xd/lmFqkgoUa+ObI07q2p+F6LXqlgUcyvXQyEH0hK989U47A
 zmAdQdzAjuPPxmY+xXtUZQVbaXfcXZK5+tr8uV39pBjOaMWEQMMQI7rebO1Sk5uwUmSR
 NEwA==
X-Gm-Message-State: AOAM530mT6R5eFjNTBoFQhrMUalTHZv6GyzJCh5vhWbIYFMSfEZpBBHq
 Y2tLK2auEFsBntMN5r5ZhKWlJCVsgcwlinuVbcYPlg==
X-Google-Smtp-Source: ABdhPJzDlsGHaNOXuEWTksqseT/lvZuauVJJ95anE1jj9sJcKABtLbFnHf0VC48YKQgVTPtvA5i1sXzT1voh89nWS2c=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr319276ejb.382.1626966063303; 
 Thu, 22 Jul 2021 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <1626728232-134665-1-git-send-email-joe.komlodi@xilinx.com>
 <1626728232-134665-2-git-send-email-joe.komlodi@xilinx.com>
In-Reply-To: <1626728232-134665-2-git-send-email-joe.komlodi@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 16:00:21 +0100
Message-ID: <CAFEAcA95O=y9qxmMe-ZtiGRxi+2inV+Y_sGnequ4-Pc44ik+KA@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/smmuv3: Check 31st bit to see if CD is valid
To: Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 22:03, Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> The bit to see if a CD is valid is the last bit of the first word of the CD.
>
> Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>
> ---
>  hw/arm/smmuv3-internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 3dac576..d1885ae 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -570,7 +570,7 @@ static inline int pa_range(STE *ste)
>
>  /* CD fields */
>
> -#define CD_VALID(x)   extract32((x)->word[0], 30, 1)
> +#define CD_VALID(x)   extract32((x)->word[0], 31, 1)
>  #define CD_ASID(x)    extract32((x)->word[1], 16, 16)
>  #define CD_TTB(x, sel)                                      \
>      ({                                                      \



Applied to target-arm.next (should get into rc1), thanks.

-- PMM

