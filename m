Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C769655ADB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98Wk-00063b-Ou; Sat, 24 Dec 2022 12:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98Wj-000612-3B
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:41:41 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98Wh-0008MX-Jb
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:41:40 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so11457990pjj.2
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOrUZbv8luOSyl9Um6fasXK6PUTzABTFG7bcFSVjcIY=;
 b=Tq2W+HxgL2imRmabmMTe6k6MXy/rIq/hJB5XPJPV0++0Bb/v7TOS9s8VUFM/5/TilM
 A+jLmStyydnKF4BILGedtF57J7aglZFFlUm2UcbFIGquerjbu+VVoB+a+iElJ/AXkjqH
 l20VXwnwuKKZoHobGC8j0tBilsj0rA3W5Xn64DK5ZOB46QT8YCPSWGLX8v6Gqyd/Inu1
 r+WPy89qFjZCotNG5jlHWF6PID8ol4GjaEeGhTjxQI6JxCTg+hx9Pu+HcPDZajWRBVV1
 cAo1kBpx+pGAo7ownz+WLcEiqge2qIJ5Zf/pia9jQ+FQuVDg94sua6KXor09pN5Jg0y1
 dvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOrUZbv8luOSyl9Um6fasXK6PUTzABTFG7bcFSVjcIY=;
 b=h/nto/5MJ3qXAfuH9/7tG7I3klfWFmOwCPnx6UMaD3uVv/PlwNtg8Jnd+rx8894lMQ
 bOVWnacwfwHgoBYTI27bJ8RVHrAKgMEexTrcZjqQhE31lTDoT6SDRhR+wuIG2SAdQ2rv
 QzuVc2mzVfEFslRKuhdYCaXQFfVN2URMKn5rPksTxhOyXNSfL90wapphNQYTxkzmU5lU
 ltJTCcCppIG/mgKrxgeI12/uATotokCcCuvoxSOzfHYC4aciad/eDNdVXEToSZGEr6ry
 cC2Ga+/mlZebpUbFUtnR3HHqrRKGex4hGZSSsYHH36V/vhm7CfbQVy/Qi1wwTxmEFrml
 2Ryw==
X-Gm-Message-State: AFqh2krXwBd12VHa8qMxSkHHvIzl/iTfFrVmz6PQA037kT99idyd+Qkj
 MmiJKFaVFUt2sedTT5WG9tP1xQ==
X-Google-Smtp-Source: AMrXdXshpHjmX9B1V95Qt21pHb2DciMm34+A0c1yp7MrYtnaX/xf6rlf04upU3JwkeXSIApT2P/wyw==
X-Received: by 2002:a17:90b:4015:b0:221:5597:bfeb with SMTP id
 ie21-20020a17090b401500b002215597bfebmr29285345pjb.46.1671903697854; 
 Sat, 24 Dec 2022 09:41:37 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a17090ab00d00b00219220edf0dsm3855418pjq.48.2022.12.24.09.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:41:37 -0800 (PST)
Message-ID: <3d614ffc-367b-48d1-197c-f63395499a54@linaro.org>
Date: Sat, 24 Dec 2022 09:41:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 09/43] target/loongarch: Implement vhaddw/vhsubw
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-10-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-10-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:15, Song Gao wrote:
> +#define S_EVEN(a, bit) \
> +        ((((int64_t)(a)) << (64 - bit / 2)) >> (64 - bit / 2))
> +
> +#define U_EVEN(a, bit) \
> +        ((((uint64_t)(a)) << (64 - bit / 2)) >> (64 - bit / 2))
> +
> +#define S_ODD(a, bit) \
> +        ((((int64_t)(a)) << (64 - bit)) >> (64 - bit/ 2))
> +
> +#define U_ODD(a, bit) \
> +        ((((uint64_t)(a)) << (64 - bit)) >> (64 - bit / 2))
> +
> +#define S_EVEN_Q(a, bit) \
> +        ((((__int128)(a)) << (128 - bit / 2)) >> (128 - bit / 2))
> +
> +#define U_EVEN_Q(a, bit) \
> +        ((((unsigned __int128)(a)) << (128 - bit / 2)) >> (128 - bit / 2))
> +
> +#define S_ODD_Q(a, bit) \
> +        ((((__int128)(a)) << (128 - bit)) >> (128 - bit/ 2))
> +
> +#define U_ODD_Q(a, bit) \
> +        ((((unsigned __int128)(a)) << (128 - bit)) >> (128 - bit / 2))

I suspect all of these are wrong.  I believe bit is in [0-127], which means both (64 - 
bit) and (128 - bit) generate out-of range shifts.

Also, you can't use __int128 directly.

I'm somewhat surprised that you're shifting at all, rather than indexing the correct 
element from of the vec_t arrays.


r~

