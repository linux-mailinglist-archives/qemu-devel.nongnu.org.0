Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E050A6B2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:11:54 +0200 (CEST)
Received: from localhost ([::1]:44330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaLS-0005jY-02
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZMO-0004QU-Py
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:08:48 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:41556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZMN-0005xp-3L
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:08:48 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id w20so3395216ybi.8
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HMZ5Me4DLCE/vsvCUUQqGOqyXRn94mqeii3A9nas1B4=;
 b=jSZFN3blJ2850prCXj75C4hVDKWl52Rb0GQ4LWGoBGOrnLy4SQSmD0RJIHMMjojGAh
 eEnXh9ENfGbZRS2HLqzid8CZVNhvMr9N033FkCO+1ELqBlFu1nG+IOtYjt84rnzVefxJ
 ubWRLAXBJMXnomDU3mqQ3Mg30IFppA+TBNUzhRIQPOO1G0EIYdkhucbHT2gegCkU82lA
 hTSh9xB0i+eJ4laZNmm5hrV4X37FGCcIjaX70Bh44yo5XVStWCIfp0y2oZBU0xmDvD+r
 G5dyBJNKkabmRbPxuoJevHrZ1DLfjtt8bal4anh+5YEoZqy5dL2yeIbNNbs3gHrKR+CE
 rD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HMZ5Me4DLCE/vsvCUUQqGOqyXRn94mqeii3A9nas1B4=;
 b=01F4p1Cy25bSwL78L7vRhsReXDHbUM3r6FNLxpPUApIDokBVmiupneS1mk7t4x784/
 GmaxgDvub4bAgtkrE8ZYeu/wQNSZ0j5qqWfuuJZmnqttNm/4tp0ddscuC+DKRcIFZyH1
 M6eUM4rTV2U6P8vZGmbeOIveMMYf4uYLiLZfG4vtufX0S52iQ86OQCs6NsoBAdBMCK20
 bw39qPGDBx9c7TCu07diRNaNCZeBdmZo1Cw52OwrNip2qyPPv4YWe8cLs5GKhgbNXXxD
 Q6SBX6eKpdoXkixK2Zj3VtH852inJ1MnQlWJYqttlkoqTKcId/ArMR9H5F44ntm+RTVG
 hLAQ==
X-Gm-Message-State: AOAM53130WPpUiOii/RpCaqrnILZdsxcNJuO2UbcUIHZ+vxl9coLsFZH
 /VNEOps3VeyelwH6YiniJw197uVojVJGar42pgJf8g==
X-Google-Smtp-Source: ABdhPJybx1U3YsDqrNL7giTyaDsv0WYkgk2E5Y7MdP6tG56SpNQ+301crRQppa6YZv8OEc2/EFUIcQpViWx56vOZnI8=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr388421ybs.85.1650557325978; Thu, 21 Apr
 2022 09:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220421160118.2386364-1-wei.huang2@amd.com>
In-Reply-To: <20220421160118.2386364-1-wei.huang2@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:08:34 +0100
Message-ID: <CAFEAcA9MLba1b=ZPeWkRqp4nE3dZUJ7q73MALeSHXdsOUnrjug@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/i386/amd_iommu: Fix IOMMU event log encoding errors
To: Wei Huang <wei.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Cc: eduardo@habkost.net, Suravee.Suthikulpanit@amd.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:01, Wei Huang <wei.huang2@amd.com> wrote:
>
> Coverity issues several UNINIT warnings against AMD IOMMU device [1]. This
> patch fixes them by initializing the variables. On top of it, this patch
> changes the event log size to 16 bytes per IOMMU specification. Also the
> event encoding function incorrectly defines the format of event log entry,
> which is also fixed.
>
> [1] CID 1487116/1487200/1487190/1487232/1487115/1487258
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Wei Huang <wei.huang2@amd.com>
> ---
>  hw/i386/amd_iommu.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index ea8eaeb330b6..0f7f8929a687 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -208,8 +208,8 @@ static void amdvi_encode_event(uint64_t *evt, uint16_t devid, uint64_t addr,
>                                 uint16_t info)
>  {
>      amdvi_setevent_bits(evt, devid, 0, 16);
> -    amdvi_setevent_bits(evt, info, 55, 8);
> -    amdvi_setevent_bits(evt, addr, 63, 64);
> +    amdvi_setevent_bits(evt, info, 48, 16);
> +    amdvi_setevent_bits(evt, addr, 64, 64);

There's a comment just above this function which also needs updating.

Would it be better to have this function start with
  evt[0] = 0;
  evt[1] = 0;

rather than requiring every caller to zero-initialize the buffer?

thanks
-- PMM

