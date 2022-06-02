Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DF453BB64
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 17:09:48 +0200 (CEST)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwmSI-0003Dd-Re
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 11:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmNL-0007Oj-Sh
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:04:40 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmNI-0007y7-BV
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 11:04:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so6490296pjm.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 08:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VF17T3WHM7n9lt3Xub7GIyUrxaxIQ0kZcRifgZGz4H0=;
 b=tsEBFSBqD2596+MVM/YQCU7SSpqbGDAPXCSdgrYTNiqjV7gBDcwO//zeGGWIXWMA1e
 0Rs5+Sk6Wr9ROhXiWd6M2DwXqwlOZc1AGLMJfMsLzLgl6b0cmoYuyVXfO/envb0KGg+Y
 aPc6S9ALANtHbkLt8+5b9FRghYcP+Zfm/dgcKUwRiKRCEkWHrfhlzebnp9P3s3sQrJmj
 Ep6Qij5PCwRtztSsGos2NBsxMKrLlshvtyz9GpbvO40JVxUt330KyLE9e2oqc1ktbEm7
 UiYAAd7K9ttYaR78eCwHab9Id216a9Aara9kUsX/8wX9DlZKPu18qe1RFdMYiRkWtlNV
 mIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VF17T3WHM7n9lt3Xub7GIyUrxaxIQ0kZcRifgZGz4H0=;
 b=MbgNvbPlF9TGAr/qE4Vb6hwxM7hEipjq4khB3y6R6slkczJ3IfZ5tgt8EovbgiwUhg
 058hNqJb2+2HctlsxC+DmkqethZgk+82XnrLVc2fiAMmIyuvSHzCeo6cd8/tsoKKk3bO
 +vwjlDMCgVhTlyXVNiqGax3IihPN4dlqAF0XSbJmd83/9Bq5ymDqBzyk9LyqJ5mQmQfL
 q0LP0OFrFmebw8cqqEqKZHWjUm1SAZf3tUBYlljnEUV94vnWzS2u6846/0LN36fqsE5q
 LuE0EKjly3Y6+XNuRhrt7OIU7CxeZbPbL8dCN91Nwbog5/wQl8ENygJ3vMil8wAQg1AB
 ANjA==
X-Gm-Message-State: AOAM531f/3I3NHs3Ig3Ix1bSo8ExaqilkBsUycl+PaXsJJq/Wofbac9w
 HJ1eR1GtgzsICGP2yQhvhCfN7g==
X-Google-Smtp-Source: ABdhPJwDdJF1C1454RCJyrbMYmdEHLZsX7YrcH2ivB1rlwDoo/cYJyMG2cGDM8FXa4rwqH0f5CcO5A==
X-Received: by 2002:a17:90a:6941:b0:1e2:f37a:f889 with SMTP id
 j1-20020a17090a694100b001e2f37af889mr24375695pjm.160.1654182274841; 
 Thu, 02 Jun 2022 08:04:34 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 u188-20020a6279c5000000b0050dc76281aasm3681731pfc.132.2022.06.02.08.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:04:34 -0700 (PDT)
Message-ID: <898b04d3-83cc-e6f9-3d0a-8c06128a37f9@linaro.org>
Date: Thu, 2 Jun 2022 08:04:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc: avoid int32 multiply overflow in int_helper.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
References: <20220602141449.118173-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220602141449.118173-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/22 07:14, Daniel Henrique Barboza wrote:
> Coverity is not thrilled about the multiply operations being done in
> ger_rank8() and ger_rank2(), giving an error like the following:
> 
> Integer handling issues  (OVERFLOW_BEFORE_WIDEN)
>      Potentially overflowing expression "sextract32(a, 4 * i, 4) *
> sextract32(b, 4 * i, 4)" with type "int" (32 bits, signed) is evaluated
> using 32-bit arithmetic, and then used in a context that expects an
> expression of type "int64_t" (64 bits, signed).
> 
> Fix both instances where this occur by adding an int64_t cast in the
> first operand, forcing the result to be 64 bit.
> 
> Fixes: Coverity CID 1489444, 1489443
> Fixes: 345531533f26 ("target/ppc: Implemented xvi*ger* instructions")
> Cc: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

