Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495F76D0AE9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 18:21:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phv0g-0003t0-Ot; Thu, 30 Mar 2023 12:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv0a-0003pT-Dp; Thu, 30 Mar 2023 12:20:19 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1phv0Y-0001R3-VQ; Thu, 30 Mar 2023 12:20:16 -0400
Received: by mail-qt1-x832.google.com with SMTP id p2so13892493qtw.13;
 Thu, 30 Mar 2023 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680193213; x=1682785213;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ihk8ouV74hpolFYfVKD5mH/m2ndJQUvUzL2pMMiZl4A=;
 b=HLkKnGjJ5EEjshXhT249g8ws4uWsfDVAAvNtwgarNVYzKOphU/aoQeuhBgUgB2r3TE
 8Uk2Swjrl774I/IFTvGF8fLpCNR6UwXT2zdJmkRC2dCQDx40U4FWPF4i5tAtKTQ7fkDa
 Wohrbz68JLuQeKvSId3Dmyi/GFDdH8UKrGE8x5Yfnl1DtddUvCsQlSlZOpHsW/Kl3wTy
 tI8IST1aWJ32H5n+wBV03UfQ1iZDPKcIKAp0LY5bQcKYZZ0bjg7+lrBnpz+LZ6X3Xv/W
 SsIkjZ8CqwToAKL0KK+otIci5mqvbIa9h0DIgW4aKZzM2PXeBnsxUqNote+B/6laa4B3
 pfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680193213; x=1682785213;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ihk8ouV74hpolFYfVKD5mH/m2ndJQUvUzL2pMMiZl4A=;
 b=DkLNj7mlfy+BC9xOoI8I/mk75typQqHWGeWGTZl6Msv2vq+af+Rse0EwbuvlUdsZ3f
 JCXCceEBSupf9RXSAi3KZr/aGyovUSANMPT0W9gNvSZ/6YuvML5O8Jqani/ZcvoD/cjs
 PzZ7inVCs0++NLChk+y8LobSoN6ObgD4AdhZyRgDxCGLVCnESZZm4/xSniYqFop1yuod
 gdWSfmeEOHQ/0U0G2qc9TR/Ib3ZHfRrRMGPmtrHx8QXqb3GS/eIDo+KM0r3BrKJ5um5I
 896+gNBBC/jH03qyQVoOLb8ZoknY9VEuXaslrQQnmPKYsUfNwst6pQXFMHp5ivI871RL
 /Hgw==
X-Gm-Message-State: AO0yUKXJnonMQeilB47KWlS2iZ3SvYCmHmMwROo5eTHQ/1Q9XRE2T1vG
 LeUOV7wtHrv/NvzbErH1+w==
X-Google-Smtp-Source: AK7set9RSdvC+L+Xp5DIvkZ9qsBIKPJG1Ho0yRs+HxwWPWb6Ob7S0OHdyCibVDbZOWZgD9NAoxjy8w==
X-Received: by 2002:ac8:5f4a:0:b0:3e3:90bb:ad9b with SMTP id
 y10-20020ac85f4a000000b003e390bbad9bmr39823350qta.34.1680193213070; 
 Thu, 30 Mar 2023 09:20:13 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 123-20020a370381000000b00746a7945d87sm10397775qkd.52.2023.03.30.09.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 09:20:12 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:92e9:7a86:2720:254b])
 by serve.minyard.net (Postfix) with ESMTPSA id 94D2A1800BD;
 Thu, 30 Mar 2023 16:20:11 +0000 (UTC)
Date: Thu, 30 Mar 2023 11:20:10 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 2/5] hw/i2c: pmbus: add vout mode bitfields
Message-ID: <ZCW2ukFFNenXQzY2@minyard.net>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-3-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322175513.1550412-3-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=tcminyard@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I almost never say this, as patches are usually too large :), but it
would be nice if you combined this with the patch that uses the
structure so we can see what it's used for.  Especially since that patch
is several patches down the line.

-corey

On Wed, Mar 22, 2023 at 05:55:10PM +0000, Titus Rwantare wrote:
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>  include/hw/i2c/pmbus_device.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
> index 7dc00cc4d9..2e95164aa1 100644
> --- a/include/hw/i2c/pmbus_device.h
> +++ b/include/hw/i2c/pmbus_device.h
> @@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
>      int32_t R;     /* exponent */
>  } PMBusCoefficients;
>  
> +/**
> + * VOUT_Mode bit fields
> + */
> +typedef struct PMBusVoutMode {
> +    uint8_t  mode:3;
> +    int8_t   exp:5;
> +} PMBusVoutMode;
> +
>  /**
>   * Convert sensor values to direct mode format
>   *
> -- 
> 2.40.0.rc1.284.g88254d51c5-goog
> 

