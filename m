Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3653E38BC
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:51:55 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCamw-0001Mb-Mv
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCakJ-0006ze-Ui
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:49:11 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCakG-0003kD-TY
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:49:11 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so20157605pjn.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sxZNvcB87E0my4fmlSRnPzBQmOBwzpPUpsuC7K7HXUA=;
 b=EJ5bK69uzUAXb5+nOEJSp5Y6ydY2GXcH8z+gVmvs9XmPIwcIlBOs7rYmch7gGAJ+YA
 F+vEoPwPf3qrSC2Skk2c455KSs6FJwGrB0S7K7BTgDYfm66RGMZ+gH3eptZSeV4jGKMp
 YQ0YSeB7NekHYvVkuerlxco48zQcfhsW4gCP/2+kLHFnvjX+XF5Es9ZMmunHjkyEDh04
 ClpySXjJpyhFiAgKVoZZ4kCC/H/V4olvqZMMJd53gycPXPmX7j1vlAtC0IfRGQ0E6h2x
 6uny7Y7RiOSp+3z4717lSMoyjpbWQaDsrbzIICwPmOamE3tEFVqu/zPg/Mouz0OKPiO6
 9hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sxZNvcB87E0my4fmlSRnPzBQmOBwzpPUpsuC7K7HXUA=;
 b=NIFHij3qp+Ct19Nwl0WGI/9ZHObo9hCi6QscHfTUq6m0bsk4TFiwbHsRkIAfBH+591
 CBGH4+YniB4/jBj3UrMl1VzVQbrRZ4aaSPc7TNlj/+yRgQQjZVgP8BV5pe8VY7CX4l6f
 pfS8m++NMvOrKfet3Z11SeMmPuDEq2a5o4ky7M978vksRrKeE59lbOSrcRuQdAM4oQmA
 E/ccOMHEQwNQlKmBL5QQXXRWa91zUHFl2kBEyIZPPKniHYRMoa13E+5lCe9iKRHCgRCe
 /Lftjn3MTimhPKqNlu3bbYVx6r3Y0s1wowc5eEU3RrGVuw0XM//NIV8PozohCOloXIdj
 PWtA==
X-Gm-Message-State: AOAM530bFNoQE0LYFUU1WBeeclPnjKKvEfjKWKN5/bLKo4H47Z6/HGnq
 IyCJd5MODxzFVGV7UHpcILDMdg==
X-Google-Smtp-Source: ABdhPJxUxxpb9FFgBG6fk+IE7wZ2NMna44SnJD4OWnPM6QN8o7MiFAuSe5NgWNuGN7ECopMzsDhh8A==
X-Received: by 2002:a17:902:a604:b029:12c:dda2:30c4 with SMTP id
 u4-20020a170902a604b029012cdda230c4mr3368141plq.73.1628398147564; 
 Sat, 07 Aug 2021 21:49:07 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x13sm14013169pjh.30.2021.08.07.21.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:49:07 -0700 (PDT)
Subject: Re: [PATCH for 6.2 11/49] bsd-user: Fix calculation of size to
 allocate
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20a99520-a439-16ae-318c-188bf026a33e@linaro.org>
Date: Sat, 7 Aug 2021 18:49:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-12-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> It was incorrect to subtract off the size of an unsigned int here.  In
> bsd-user fork, this change was made when moving the arch specific items
> to specific files.  The size in BSD that's available for the arguments
> does not need a return address subtracted from it.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

