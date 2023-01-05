Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBC65EFBC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 16:13:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRuf-0001tr-4S; Thu, 05 Jan 2023 10:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRua-0001tN-Ff
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:12:08 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRuY-0004CW-My
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 10:12:08 -0500
Received: by mail-pg1-x52c.google.com with SMTP id f3so24705701pgc.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 07:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bkaE0LEBcl2+UKhpdPTxir9P+Zq8HpLovlsuyNwQyCg=;
 b=fn+yVd3RMDMt/itv1sjgrRAoc+om7ou6AiMSZRD4AsgcJMJd3PwcV0ggqEdeW69OKG
 +tUS71fznpWnsv1pcGDMx0PChP4himp3j27YIQSoiYRCdE/DDfcHOaMl6f2M6F/SuP2F
 wcPTWugB68FuLL29TQoXP4PAInqg74svGoIVpKWLvevdv61nrGZv+h4wztFlKvtFnU5I
 8Fbl4NG1N7937FaSmebImpp/hbAuTjUFTyx/y4VQ1oMiQQZFsMX3sSQd5SWciocJMOna
 hI1e0XfaDPzD1/d13taZIoobmgigfZpzSLg7qai8XMhazz2o+25ird7hUYEfMrIBG7Hd
 JY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkaE0LEBcl2+UKhpdPTxir9P+Zq8HpLovlsuyNwQyCg=;
 b=RU4j8OfnEkKaB2b3RktnBFt6Timuz2PA49ihQgE/coHq+Igvat7+s1hQaTcl6pvLHm
 0grO8NCa7Eu3V/DhCib09d4r9dypwb11/uRbLxfphlv4kaENVMtjvDS6PgE+6pfS9Tfb
 VZq8hrEn8+4RVmnXVosFYUUhcnJwym6RRPtDT5uatNlCvtCYrp1Kw+OxuSeU6to6lT6g
 n1A3OT524gU+YaorKMA79QSSKXlG4mBufdCY2hsLbr3sAI5mMBctICdk5OAy++lRd1sO
 8znYURX2OHSMhyZJ8a6crhY5ap+gZXUiOHQrjlvBaLPWvr58nsUC+Q1pnqcMH65zALOs
 jOIQ==
X-Gm-Message-State: AFqh2koBNb1qAS/z5ojUArCY0hCQ9kd/Qs6uRxAZC0tCQJx66rbhFTLb
 V4YBrJPcGu/MvrA/2/iP8pnsC+yf8LkUn4sfZHty1rBElMT0h91a
X-Google-Smtp-Source: AMrXdXsG8qW67V7CJm5P+ErA01VvI1T3rug9uRl/jL3DLEbWmPan+JGEYkp4QPMltQndfV2MrM2Yjt6hx8ueSrZ0Kdc=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr2345250pgd.192.1672931524559; Thu, 05
 Jan 2023 07:12:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671548388.git.jcd@tribudubois.net>
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 15:11:53 +0000
Message-ID: <CAFEAcA-ogofwCvR1fAJ5+PiGv4Z2+FGqxhcw54AH19CaBdv-dA@mail.gmail.com>
Subject: Re: [PATCH] Fix i.MX GPT timers for i.MX6UL and i.MX7 processors
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 20 Dec 2022 at 18:18, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> This patch series allow GPT timers to be used on Qemu emulated i.MX7.
>
> In particular it allows GPT timer to raise interrupts in i.MX7 processor
> and supports some of the fixed frequency clocks.
>
> Note: CCM generated clock sources will be added with a later patch.
>
> This also brings some fixes to the i.MX6UL GPT timer as its clock sources
> differ slightly from the i.MX7 version.
>
> Tested by running =C2=B5COS application on i.MX7D emulated processor. =C2=
=B5COS
> is using the GPT timer as its tick source.
>
> Jean-Christophe Dubois (3):
>   i.MX7D: Connect GPT timers to IRQ
>   i.MX7D: Compute clock frequency for the fixed frequency clocks.
>   i.MX6UL: Add a specific GPT timer instance for the i.MX6UL
>
>  hw/arm/fsl-imx6ul.c        |  2 +-
>  hw/arm/fsl-imx7.c          | 10 ++++++++
>  hw/misc/imx6ul_ccm.c       |  6 -----
>  hw/misc/imx7_ccm.c         | 49 +++++++++++++++++++++++++++++++-------
>  hw/timer/imx_gpt.c         | 25 +++++++++++++++++++
>  include/hw/arm/fsl-imx7.h  |  5 ++++
>  include/hw/timer/imx_gpt.h |  1 +
>  7 files changed, 82 insertions(+), 16 deletions(-)

Thanks, I've applied this series to target-arm.next.

Something slightly odd seems to have happened to the threading
of this series -- on the archive you can see that the patchmails
are correctly followups to the cover letter:
https://lore.kernel.org/qemu-devel/cover.1671548388.git.jcd@tribudubois.net=
/
but patchew and patches don't identify the whole thing as a single
series and they show up as separate patches:
https://patchew.org/search?q=3Dproject%3AQEMU+from%3Ajean-christophe

This might be because the subject [PATCH] tags don't have the usual
"0/3" for the cover letter and "1/3" "2/3" "3/3" for each patch.
git format-patch ought to be able to do this automatically.

thanks
-- PMM

