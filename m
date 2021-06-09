Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406913A1DCE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:42:02 +0200 (CEST)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr45Q-0007xV-Nr
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr44L-000734-70
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:40:53 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr44J-0002uu-0W
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:40:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id u126so15324425pfu.13
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 12:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BTqzqwCNU0udHe0CYM8LfO1O6KdaDS0cyohMnohYAaQ=;
 b=C1sydXpoMFXZvcfdrsbU8gbZMIfiWIBmdyUJZ0HhvW9xaTeq9cn/mlUq5dQvTI4bnr
 hLO1vlGnZoB3fiIihe6wdSJyUwr2j4S02gVwuSzeNPwdGbF8tZeQK6NN72+RfUC4mKQQ
 Q0lgdi6ncpv080q78cm7VEoTodSgSP3GIgEptgFNd8WZxam8o3dbl6F48R3NFNv0DVlF
 NlDXELKJCMSvzDnOcmxhOJ9QT/2AdtQ5H+9cSPFT1aeRsY5gbXoGWYqU85QRwbVbZ/7r
 PKThqfRIU7Sn8/Gp89y2D2PWeyec83BNJxbKjIPie8Jh/+RVGd6xVy6NNUWdxgqo8/tV
 OpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BTqzqwCNU0udHe0CYM8LfO1O6KdaDS0cyohMnohYAaQ=;
 b=NmFYdedFWFHshFPhKAQJ3Sx41v52ZQmiCk1ow4hk8/rBzuACZDMSXybUqg2DumyUVc
 oLXUWrtEpqHxUWvmdldoRrajantYrZnV5CFwQRr8Mq18muhoTn8IqPGVv9CTlTxe/9OP
 w3vlBgJ7ZR2+IbT44y3Uzy70P9nDqpiW1EPQLrMR5NKIvT5ZXMV93KrAHvN5dJxpUAPE
 iQzv64Ez0VQs597vCjr0ecTMWCykiulUlJmdqPK5fwr5U/OvZ433VIz2SyjrzfKbY7Bo
 vGk6c2Uo1N6mXT9J2UXUVVsjXucDPFrAC1TuwjUQyKqLV+NoNrwpac1SK3U211YpFHV+
 thMg==
X-Gm-Message-State: AOAM531EZtkPSLL+mB3+ozaRtUiEd2vNBC1BeTqZ89gGumHBIZIGfXMT
 Ukb+U8yXc6zrdyvp+bseWiPLZiVrPhzeag==
X-Google-Smtp-Source: ABdhPJxlZ3eoPImw+kpzKpFZlMz4Sr03baRwodp1M0a9mKYcuzSsXm5m5dmX/94AjPpycLRiYjVH5w==
X-Received: by 2002:a62:b401:0:b029:2ec:a3ed:9494 with SMTP id
 h1-20020a62b4010000b02902eca3ed9494mr1077158pfn.56.1623267649199; 
 Wed, 09 Jun 2021 12:40:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 gd3sm5638373pjb.39.2021.06.09.12.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:40:48 -0700 (PDT)
Subject: Re: [PATCH 45/55] target/arm: Implement MVE VSHL insn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-46-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c64bf3f-7b68-f30e-5076-4b6dc8b8ace4@linaro.org>
Date: Wed, 9 Jun 2021 12:40:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-46-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +static inline uint32_t do_ushl(uint32_t n, int8_t shift, int esize)
> +{
> +    if (shift >= esize || shift <= -esize) {
> +        return 0;
> +    } else if (shift < 0) {
> +        return n >> -shift;
> +    } else {
> +        return n << shift;
> +    }
> +}

Current form uses the helpers.

#define NEON_FN(dest, src1, src2) \
     (dest = do_uqrshl_bhs(src1, (int8_t)src2, 16, false, NULL))
NEON_VOP(shl_u16, neon_u16, 2)
#undef NEON_FN

etc.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

