Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A953802C0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 06:20:34 +0200 (CEST)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhPJQ-0005im-Mr
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 00:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPIW-0004pJ-5m
 for qemu-devel@nongnu.org; Fri, 14 May 2021 00:19:36 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhPIT-0005YK-Ji
 for qemu-devel@nongnu.org; Fri, 14 May 2021 00:19:35 -0400
Received: by mail-qk1-x72e.google.com with SMTP id 76so27648408qkn.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 21:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MfKiCXlDwQT9hqznflIHbvKOzaKkhvFZ7AYYtQVo3o0=;
 b=TzGZjx7Zlx6ZV5IDVBKE9DRdIDLBJxMVM5z4jt+iDgp48fhFZ5numBjgod/tdOHIsV
 RzKKVpr1HBn1LuatNQZLT/hKzx0RadcWNJzh5lRtuIifjCzzv+iWs/juFDXwAfR51ytN
 AmujgV2RCPNd4gdQMZaOu/tevOnisYOgLG5m9GcVm3KkgKR/EmFduvqnKQhW4QMh777h
 +pr1nrjQqEey9WV/odrZWujjd+nKEGzpBRPalmo6WC+6k9q/JV3WB32iWj7tU1fptK5v
 d2p6oZxq9ZciCcpNUKFr9Do+pkkPbUIqTnHxVv9Qvi5grCwe5Y7m4JcptX4jMKZFBmYQ
 uDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MfKiCXlDwQT9hqznflIHbvKOzaKkhvFZ7AYYtQVo3o0=;
 b=IUvvkU8Lk4TeDls2NXlXgp2EhbT4mGkIXKWUqnyuKvWvQ5D2sExPP3Pl09Ff+i2xkD
 DHivdNCvUPIGDqCIuzTKjOzUjM7i807zzPcqJlVM50vhYYZhfAvEsNte1OYk4CTJPH+J
 7p43+mDXp867fQiQFn/BHoAlIilDQ80BURkUum3KBsnhE1xNktUkeWTqPQzRF01gRtYO
 T++IakTkInKemPuAHxwwDn7NrcA4S7KJsJ/s50j4Xn0XlGHXxoh4bwjEYn6OqA2ivylP
 KKixg6D/U0hRV6tQHHVMxP9P7PrZb1gbC2KbEWpqpCJmEiJpPtziwFp3ZAMAqFfdZVrQ
 dLEA==
X-Gm-Message-State: AOAM530i24KcWqBk9LYLmg8RXzvnHSLkv3ZOybk0FOWEXjDdEjLECsrF
 0Pd6SqRYg/4zWDGMUjBfmKZY7A==
X-Google-Smtp-Source: ABdhPJxsKWu1toPvUHg7WLmZLDCWGhxSkbVHVwxCGQZVYahQn9Zy3RqME/h/5f1yTCTToFwCBExO0w==
X-Received: by 2002:a37:b107:: with SMTP id a7mr14397695qkf.366.1620965972534; 
 Thu, 13 May 2021 21:19:32 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm4196614qke.13.2021.05.13.21.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 21:19:32 -0700 (PDT)
Subject: Re: [PATCH v9 2/3] target/arm: Add support for FEAT_TLBIOS
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20210512182337.18563-1-rebecca@nuviainc.com>
 <20210512182337.18563-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3cac9bab-c9d5-977e-a88b-c7787c9e1eb9@linaro.org>
Date: Thu, 13 May 2021 23:19:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512182337.18563-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:23 PM, Rebecca Cran wrote:
> ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
> maintenance instructions that extend to the Outer Shareable domain.
> 
> Signed-off-by: Rebecca Cran<rebecca@nuviainc.com>
> ---
>   target/arm/cpu.h    |  5 +++
>   target/arm/helper.c | 43 ++++++++++++++++++++
>   2 files changed, 48 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

