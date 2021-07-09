Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A620A3C2691
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:03:51 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1s2g-0001zr-Km
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ru0-0003fT-Mc
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:54:52 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1rtw-0007XC-Ju
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:54:50 -0400
Received: by mail-pg1-x532.google.com with SMTP id y4so7719449pgl.10
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6DLXXNgKWNvo3Ca1rHwRL3HqH1j0ZLdvm4mhFcWFB84=;
 b=PbAczMW6IB5kQcGGfIKJts86rsclSXebIKlNTl4zIiKrR2efPtpXT/8Wr5nisx1O0f
 5P1yUr4zLV+CYjExlbXsTIHMQFWjQdGz6uJu2jy0gQAaMaRKPh7ZKYB9Uqwb1roX/nnh
 GRBXZuf8bPNaHVkO6VOAE1/ztXQJauP8gTH3hYUScg8/vBbqMMAhQInSpXK+Q57MsrD5
 rtI8y13zd49fG/PAUczS1j2JonlJEF569ACKiG2RKQAibugyURsMvwRpcerGbM3P5FQq
 b2iiHLMrdABgZ4UteJXqSHq1laDkb5BQsi+3SXuYvGXxar+TD7NfUq8WQ8kv1y57b3JI
 MFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6DLXXNgKWNvo3Ca1rHwRL3HqH1j0ZLdvm4mhFcWFB84=;
 b=L5MlpGb+ACfznbWqa5K5AgA+5S7gSt5Nb3a4/2peQgu/WH4pYnIh7fZd5UE6fJQZz/
 iVsqFp6Pru/N11k8VeiqLpulEZb6VApKasBuHP2hNaR/NkVxWrDwHaB8EVcVOMlqN7ib
 M/dfq9E5oxM46yl9t5yG1yRilbPvTKWvmxObZVhAx1Wt2Mk8wfBm3VpSGE2SC6b/4udD
 HnhgXIuvj7gniXCAe0/6gvIvmQHIKvUVDtLKGACHp6SpkSGZOrTX8g0lZkSWAtZLobdn
 bBRxGDXtVPX0FuL+qg9cNISc9rfuohMco9ONfdwqTY2xwAJs6a8yWK+zphU75Vc3EJeR
 sdxw==
X-Gm-Message-State: AOAM530l8Ux0wY5SM4GgGB3aBxn2Cpgflx6ug9GEcMFBYmnbXVhU35cd
 66E1Z2TmXbyw5bkmCAS7f83ApA==
X-Google-Smtp-Source: ABdhPJzVq3hz8iqrrNDKPdzWOGK2coKGNQ2qDRVz8vbhN6LWuHvTdt1oORFx9+hd5oWPqm4SHSGrxA==
X-Received: by 2002:a62:148a:0:b029:30f:be14:3b35 with SMTP id
 132-20020a62148a0000b029030fbe143b35mr37949320pfu.23.1625842486710; 
 Fri, 09 Jul 2021 07:54:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o72sm5234139pfg.44.2021.07.09.07.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 07:54:46 -0700 (PDT)
Subject: Re: [PATCH] util/guest-random: Fix size arg to tail memcpy
To: Mark Nelson <mdnelson8@gmail.com>, qemu-devel@nongnu.org
References: <20210709120600.11080-1-mdnelson8@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37b87b8e-bd7a-6814-897f-bb8fca77aa61@linaro.org>
Date: Fri, 9 Jul 2021 07:54:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120600.11080-1-mdnelson8@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 5:06 AM, Mark Nelson wrote:
> We know that in the body of this if statement i is less than len, so
> we really should be copying len - i bytes not i - len bytes.
> 
> Fix this typo.
> 
> Signed-off-by: Mark Nelson<mdnelson8@gmail.com>
> ---
>   util/guest-random.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

