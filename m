Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2322B414CB6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:07:53 +0200 (CEST)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3qi-0002eK-5z
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3lA-0004VL-9U
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:02:08 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT3l4-0001Gu-R4
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:02:06 -0400
Received: by mail-pg1-x52d.google.com with SMTP id w8so2969838pgf.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2u/RvRVO8jGsv0dh1X01DCo6tNGq/Jswpl+iAr59mGQ=;
 b=ERfFyLU4x53gIYbD/vPSwOEoi6SHrwOC8l+bOZKe122Q39l8vC1Jl0hx0U0LOwSPEW
 7f2h/pFtSWq+yUJfM+/bmf4kK0SJDhfhIHoY+4f3tlWjO2MbUoKzXwI7WcKla4+vPNSc
 a8AoxqLhIWEq70Nkwf2w21HGhHa0OpGTYElHSIsizE0U7g1E70CjGxMw1mu/pFcB+0T6
 JRWEg5MqkuEz9letSDzZZAd7Qr6BYev248CJNel5/FLgsVzNUdCeCqj/wM9adckomEy2
 xphj+ijkiXDs71XPboWod8dbyGxw5NZIF0jj6bw0m44K71/zbIEmTaNb5A4f+O0wNES+
 iUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2u/RvRVO8jGsv0dh1X01DCo6tNGq/Jswpl+iAr59mGQ=;
 b=7NjE04LGRQyOsuHV7flCN6YqmIf7q/nh+/SmgQWuD5xeLb1idEAWffgPHtPlWHdinT
 uySuhd9SQbA7vGFCalDayX3vyx0D1HuDsm+UfHFqPHJcW7c2GaL5YeANQP7LRzzgOgPh
 4jET+nLS10Ckh/xU1PwYzg3bHTr076QHBw1cA02E4vKHZDU4dH+eyscbfs90i4xrm1Z7
 RPFORZTHzF6ww62ZCcTXavULS5e+1vy2NGZZFKf9rtRryksYeeQDoJYhMb6Mu2dCF/sm
 TFTBqYekxZZjeSarpj6sFFR5jw7SwOjVWFlVJGWGt6iRYa+iUpXk6+7Esn4j5348Empk
 j6jQ==
X-Gm-Message-State: AOAM532kkzpSEdKQPBSEtesIbZGy+mikDAtnm4WwzNvI2vai7ARe+sOt
 cj8Bl+qULWzLiTq7hlOgfo7moJOWKGy4Gg==
X-Google-Smtp-Source: ABdhPJyffOjzVxMet18uThlcwFj3LwWoOo7rKaig+vBgg5n9GS08SkUlXyAdTs1YxaCwFu8fqFdomA==
X-Received: by 2002:aa7:9f03:0:b0:447:dd09:6dda with SMTP id
 g3-20020aa79f03000000b00447dd096ddamr91771pfr.36.1632322920729; 
 Wed, 22 Sep 2021 08:02:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v25sm2656915pfm.202.2021.09.22.08.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 08:02:00 -0700 (PDT)
Subject: Re: [PATCH v2 17/30] tcg/loongarch64: Implement add/sub ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-18-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d332e959-13ce-066b-ea8b-0a1a4b0f92c7@linaro.org>
Date: Wed, 22 Sep 2021 08:01:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-18-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:19 PM, WANG Xuerui wrote:
> The neg_i{32,64} ops is fully expressible with sub, so omitted for
> simplicity.
> 
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  2 ++
>   tcg/loongarch64/tcg-target.c.inc     | 38 ++++++++++++++++++++++++++++
>   2 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

