Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F84328C1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 23:08:07 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcZra-0004Ws-AW
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 17:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZnp-0001L9-8j
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:04:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZnn-00068p-Kp
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:04:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ls18so13078152pjb.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ejFGCHnSVcsHrtBEhA/HcjYZZbPwpEHB2I82ddo7sL8=;
 b=hd5uHKJQXAtcwIKhSwTwYvHO2m8obgxH+qEYYQCdRoaiZV6e2ELSoS3bCr40hdpaU3
 gOVUZIszXl3VODNnOGpBwX4KYEvB6sQrIFq/25PCnViJ2KzGvUGvmK7sdbkdB2xJmJlL
 Q4rdSV3eXtv+PaPdfiSAnSV5OKWQqE+pmIAooz287WcVqoFxIauRm9vD3jGfMKMT8TAZ
 30U/UlfeKIIfyEW7NiHvuU1jLBDYgp2ArJKbOUmRC35VdwWiOlm0ID/M/HiqzwS6/BAd
 AW+zctTTFO+gJ9rDDdu4HbBOvug3atWRf7Z9Rwv/mLgx0uVhuuXv6EKor214JNL1XQ90
 EYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ejFGCHnSVcsHrtBEhA/HcjYZZbPwpEHB2I82ddo7sL8=;
 b=21+FZfM9T8kPkiusW8J5uVVajJ6cbOdkzz10vqAYXWHUo6cMh52ek48Ky9GTmxcfmQ
 orgk3nc9NVEDUNIf62kq1qO0LunsNix/gWxyW6Hs9qwBDRJ+T6ew+dGtBlLWKW0SGPUQ
 CQoqvK5FuAwe/JSWFXNi4oIOoh3DGjXkqETkWG///bOGYH3YkIXfu03UGnUDooYV9ztg
 d12yKUMNjGGzerDyCuZ22lNCNBnm7kcJ/JvcpMfY+/JYjTh9CT+yARjjQKo3emP7V83a
 5QUw6Ou0q5bDJPr+1pIcmhKj3Dh6RC/3SS3kLYASKlTBAm3t59BTpNG0AAOZ+nIme6gs
 b0zw==
X-Gm-Message-State: AOAM530zsJlqgUMGtSzFlOUJpwHAczN41UVlaZvHhKarlGsNJ5fcNDv3
 GhvpqHNW7CaQL2y4GloAhIa7CA==
X-Google-Smtp-Source: ABdhPJz/KK/r1bxkBDzKo1CNDLFvCzTT3/GrxCajjrhqFqbPni+TaOM87xSN1YMIbGoobGNfvaBLWg==
X-Received: by 2002:a17:90a:4595:: with SMTP id
 v21mr1468897pjg.43.1634591050037; 
 Mon, 18 Oct 2021 14:04:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y14sm7151655pfi.202.2021.10.18.14.04.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 14:04:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] Hexagon (target/hexagon) put writes to USR into temp
 until commit
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634031081-25450-1-git-send-email-tsimpson@quicinc.com>
 <1634031081-25450-4-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48f9d98b-a1d3-4982-6dcf-12908fd255d3@linaro.org>
Date: Mon, 18 Oct 2021 14:04:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634031081-25450-4-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 2:31 AM, Taylor Simpson wrote:
> Change SET_USR_FIELD to write to hex_new_value[HEX_REG_USR] instead
> of hex_gpr[HEX_REG_USR].
> 
> Then, we need code to mark the instructions that can set implicitly
> set USR
> - Macros added to hex_common.py
> - A_FPOP added in translate.c
> 
> Test case added in tests/tcg/hexagon/overflow.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

