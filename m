Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A98601B04
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:09:34 +0200 (CEST)
Received: from localhost ([::1]:37976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXMb-00016w-Vg
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXIX-0003T8-LP
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:05:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXIW-0001SQ-43
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:05:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bp11so20390391wrb.9
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mm9ZNA55oBmFJKRLFyg+CqkOyFyYte7z4MaQiLXG9Y4=;
 b=utCfxaUBLovNrk3YXE8Oj4jcN63nMzeNRdJ5D5HgTbI1bkhDMw3FC0P9v6t47+DhTP
 ia2+ARKNklw6EVHZIM1u4zZTNl9XBtkANf4lLeihoZdgKjQGxGF1F1eNThJmJloEzs7i
 d1bBZviHOH16rzCmGFh3KECaB3K4CBnxlIp5wW0oaQlZKaaJB1bYbmGDwXu1BVghNiXd
 gAYoD23OoHm4TkR3azd68aOyy8J6c3O3/JwxXkvalpUdg8qhEAhsgFt2JEoIyn09igZC
 cc7fZRieJ64VsS5H/ycuiFDDdV1eOjki86KCF3X3FXogZoColFD4xH0NOe0AQYnkPQFM
 EQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mm9ZNA55oBmFJKRLFyg+CqkOyFyYte7z4MaQiLXG9Y4=;
 b=VUuh73giwWT9zI+iiP1P7GL9ntvYrOAYNwXIzrtC2nlaJUlefn2WOXkbwOv6raJGBZ
 +nt5yX9N4H6WbaJsrL9k255cZ6magCXKxIFKDldCNCOsY9eNJlbN2wL2iRKSpy6kxkl4
 i2B3/kQszRP6/m7PlwggCgNGu5mtcqi+sCoTQP3W498Cxr9JTBpLuFhlPpVxNkYAmcF+
 N6LPvAt63ZVKK8e3Ol0qfcgEqDPAj1cg+uH5Z2uYOzCG/oKoJGF4vGwk9b0rDbej40UM
 J68rPgZw/MMzTDVHvsikb0yCP+zSguBh0JkjZ2OFFuJXwhizMCmbzru0/TxpsH+EaNZ4
 sUcg==
X-Gm-Message-State: ACrzQf1wc12Kgrm4DmGCSuPMSs2iCAyHg6Q6t2iu+cI6UH2I4QU0l29t
 13Ly/bNHS+04U/4IrmaWl0ihBA==
X-Google-Smtp-Source: AMsMyM7sL1AGbB9AjfDz+XetD90veYH5sxQD9GnP+oZiNpETm/TIHQxdtMAdwxcJKijQVp0t6+BwPQ==
X-Received: by 2002:a05:6000:1a87:b0:22e:580d:9cee with SMTP id
 f7-20020a0560001a8700b0022e580d9ceemr7009031wry.608.1666040718143; 
 Mon, 17 Oct 2022 14:05:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a5d5348000000b0022ac119fcc5sm9236021wrv.60.2022.10.17.14.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:05:17 -0700 (PDT)
Message-ID: <b093ee20-7f66-cc51-ae3c-ff785eb955ca@linaro.org>
Date: Mon, 17 Oct 2022 23:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] hw/audio/intel-hda: don't reset codecs twice
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <20221014142632.2092404-1-peter.maydell@linaro.org>
 <20221014142632.2092404-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221014142632.2092404-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/10/22 16:26, Peter Maydell wrote:
> Currently the intel-hda device has a reset method which manually
> resets all the codecs by calling device_legacy_reset() on them.  This
> means they get reset twice, once because child devices on a qbus get
> reset before the parent device's reset method is called, and then
> again because we're manually resetting them.
> 
> Drop the manual reset call, and ensure that codecs are still reset
> when the guest does a reset via ICH6_GCTL_RESET by using
> device_cold_reset() (which resets all the devices on the qbus as well
> as the device itself) instead of a direct call to the reset function.
> 
> This is a slight ordering change because the (only) codec reset now
> happens before the controller registers etc are reset, rather than
> once before and then once after, but the codec reset function
> hda_audio_reset() doesn't care.
> 
> This lets us drop a use of device_legacy_reset(), which is
> deprecated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/audio/intel-hda.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

