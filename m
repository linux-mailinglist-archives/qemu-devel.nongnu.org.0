Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD1E626737
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:51:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjPs-00057a-US; Sat, 12 Nov 2022 00:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjPo-00054g-V8
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:50:52 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjPn-0005yW-D4
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:50:52 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso9427708pjg.5
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DAYTtz+504aAggg5ibGQAbkU6An+gkmt1QECOoffExk=;
 b=tQk+nL53qgzoWvc5TFyFxJ+ltXDLZcY2hkpB38yqsD32yMzC7qqkCHW5vjr47Z3grE
 adNpYb4Z/hWbRwB3asGt5fEudfH29iUI2r+l4lVkW21TfkfClOsHOGomlLaoOjKsBiNj
 u9UY05OzLcnrAxmCU6RWK1xHLssKvLdbnySTSjuo4IScY/nCJJanu3sfmKvST5Rof9Gc
 guM0AGnJCd0CFsp2km3ijQYoqKO/Lr71J//kKOxjS/ez89gza8mwtQnrSSKMZvP/U6l1
 65xqHKwlIZ8Nn7RmaB1GpOhSO4922bb0vG+XqfGt2BJqeldDJUtIxLQfmu7+XFKUf0KD
 T6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DAYTtz+504aAggg5ibGQAbkU6An+gkmt1QECOoffExk=;
 b=CubD7eqMc05TBAGDo//X0iJJ5MLi+OtjgMd5DT7Kzyo6VL+78AgmuEWTITSXaXZTww
 myLmJgv56oha+efk2VmcRa8A8xRLPVXomwHBBQof8WoqllOJrVoIZle3sSfuYlRVS+ES
 bCXAKZ2V/q0bQsbqf85oBocoA0w6ktAN4kLD+eOLpGY/chyEw+UqkAdrEr89Eoc9asp4
 uxmoR/45v1f2PvHkIrm9MVBM1Q02uDeYFbhZ7OHBEnCLUUmWbDZcbPaIjUNzU//E1uWW
 xfzz935OnD2juyJd4OZZRnXwP9hmrss17U2OMXzcG/31WZxnCPBzd2FsHOSAE0nor6SP
 h1yg==
X-Gm-Message-State: ANoB5pnznbV+wckHcuqkDzOckNMYdq4WpAQhB/NWFxhAYOD7hQs1bBK7
 QzANnvFJGec5KaBJv/S3gTscrA==
X-Google-Smtp-Source: AA0mqf5lSJbI2ruL9xPYhZRR3v6IbOCN+sLsEas/uqmcVPmoJ2131vFgda7JfF8v7ONDSGYIYTCSoQ==
X-Received: by 2002:a17:90b:2d81:b0:213:5d6:8280 with SMTP id
 sj1-20020a17090b2d8100b0021305d68280mr5043459pjb.185.1668232249967; 
 Fri, 11 Nov 2022 21:50:49 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 c27-20020a631c5b000000b0046ec7beb53esm2178935pgm.8.2022.11.11.21.50.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:50:49 -0800 (PST)
Message-ID: <182cca04-5df7-b844-f6d4-049ec3e811fd@linaro.org>
Date: Sat, 12 Nov 2022 15:50:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 14/20] hw/audio: explicitly set .requester_type for
 intel-hda
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-15-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/12/22 04:25, Alex Bennée wrote:
> This is simulating a bus master writing data back into system memory.
> Mark it as such.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/audio/intel-hda.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
> index f38117057b..95c28b315c 100644
> --- a/hw/audio/intel-hda.c
> +++ b/hw/audio/intel-hda.c
> @@ -345,7 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
>   
>   static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
>   {
> -    const MemTxAttrs attrs = { .memory = true };
> +    const MemTxAttrs attrs = { .requester_type = MTRT_PCI, .memory = true };

MEMTXATTRS_PCI?


r~

