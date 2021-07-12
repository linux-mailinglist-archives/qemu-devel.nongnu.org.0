Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3303C614E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:59:20 +0200 (CEST)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zH5-0007hp-Fa
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2zEH-0003lU-SB
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:56:25 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2zEG-0006Ka-5n
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:56:25 -0400
Received: by mail-pl1-x636.google.com with SMTP id b12so6627049plh.10
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 09:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uIZKoZPp5CWR2buQP3TQQOyLQPlpPeNWKjjJXsZ3qC0=;
 b=aikP91qdpulAAXnMiDm5PEOS0hAWJSjqMFsAw/FbXnIo48QRX0PxYv1dm9HExT9g6/
 z7vOEi7o208gGPSWAFqyeaKabYn/2axUqZ1AYVW2/me0lT/+JkdfDhcnVOluE9yTmLYx
 1ZFfRb/Rw6I0shm2L9sBN7Sds7V190rxS5WCYLWG6EJbMphyZ+M/YJ1aU3jfxQ4H6P4q
 tbJA0rEulKAX8tEm/xqpGdJ6s/Nf4zmBhzpsqtH+5cMYFbqR5DuaVBiGm8Tu/m+bLoX0
 pu9UJkVUp6dOovGMfqlDNn3wTthagjKF02aO5083BBov0yf5Oxkv9wrp3KcWMzeInjw8
 8Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uIZKoZPp5CWR2buQP3TQQOyLQPlpPeNWKjjJXsZ3qC0=;
 b=RxuPXNuDnC0x2uHkACB4xvqj81MTHOV6hJmBA7cXn4a51qz8/+YUhFk0Tucc3hRBDu
 m+2MT72TbQ/oRPfe1k7Va1f4jA+ogSfXZsLsT3lokiqhURZQPe64cqcdXVNjkEkj8NQF
 1Um2nhMABt20/PAdypyaETBGlHuSuwX9tcHpDhnAjKVRTD7GKbV17Y+LNEhimMM0v2rU
 ZBtAV2FwzXlDnt49HYqyLetPlh89EZUtJfQXuxzHeiPkztbL4ASRXpE2IaTP6+Ar3coe
 t/jlRBPl+LUg4c9tpB6Qw5JJFCexd735BZ71g7LjgJoPJRRTaWbp3Dh7tDCWmae7alJU
 A5iA==
X-Gm-Message-State: AOAM530S49mZVO+UBsh8OkNCw2fz7v2xqKB8oun75JFLAod/KUPLyIl9
 uwjMXA0rUbBjf7MtITJhozL/zg==
X-Google-Smtp-Source: ABdhPJwOEa/Q5DXv2YUqe7jn539IbMKotv//MciOBJStJC2gp9xOp72GKNyXIm2GaUtCR3mqC+4tAw==
X-Received: by 2002:a17:90a:1c02:: with SMTP id s2mr7720pjs.172.1626108982154; 
 Mon, 12 Jul 2021 09:56:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v21sm16168109pfu.192.2021.07.12.09.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 09:56:21 -0700 (PDT)
Subject: Re: [PATCH] linux-user: Handle EXCP10_COPR properly for i386
To: Xu Zou <sendtozouxu@gmail.com>, qemu-devel@nongnu.org
References: <20210514084619.129020-1-sendtozouxu@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17510cb3-8f55-ca64-f050-330bd31ea404@linaro.org>
Date: Mon, 12 Jul 2021 09:56:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210514084619.129020-1-sendtozouxu@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.479,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 1:46 AM, Xu Zou wrote:
> +        case EXCP10_COPR:
> +            si_code = 0;
> +            status = env->fp_status.float_exception_flags;
> +            if (status & float_flag_invalid) {
> +                si_code = TARGET_FPE_FLTINV;
> +            }

This isn't correct.  You want the set of unmasked exceptions.  But target/i386 is not 
providing those.  You need much more than this one patch to fixed unmasked exceptions.


r~

