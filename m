Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C1413FF3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 05:17:55 +0200 (CEST)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSsle-0003Q3-Ux
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 23:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSski-0002YM-9Y
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:16:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSskg-0004uf-Oc
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:16:55 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 me5-20020a17090b17c500b0019af76b7bb4so3498240pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 20:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RGW9CjSKEUyyF5IUt7W/XeYivBwRG5g5CLWl5dlB+2g=;
 b=dOH9DTFpZh3ULC2Wbf7HLLP16zHaRxHN6y9DMCyM5gZgW/QNgpLatWdy1fGoTBb0G3
 hh2Fd9I2Dn7EkTbVxUZxOzMVUYzis9G46Ph8tvcDWzGCB6BrGAujko+Ga79LR74+StGm
 MlANd+wWmY4LzAhUEGADuUgF9ECtlZLib5Zk9rbAJzEUKoGZIBG5/FMFxUz7DZziEjyK
 W6VjYtYJKH5ENW/ydHI66Xk6eR5i30IIHgvHBUkf0VHmC2n8IQO1shghKCbtjVoVWIK3
 Nh/6rz1/2EhK9cCj1OkOh9Gj8K8dz1D8bRpSRF8rD/xtmejivw60W4OZ8Ed/x3OGJSDm
 896w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RGW9CjSKEUyyF5IUt7W/XeYivBwRG5g5CLWl5dlB+2g=;
 b=Xk5qe6SU0U3hcN6YJwselSQ/h9WaZg7WtfZfJUX2hcDM/7TOUIAbtu3m9OQUbEvKJE
 vS1dXnZYcrssD+9eVzkLJLq+mBGFVzZnl9cWxtuEocOnEb/lxuHV830IGFAEihszqLI7
 6yM0YX3w/uFyS7atlpLM9Ixswfp1qhPeOAKvcmp1h0wzgG8Q78fpLGm0MACzNCd8NlNR
 jmpv/iNAuH6zlKphrF7mq1+t0xYC0pYC5FGG7QGakCyLog6FxHI2Kh7KYHUpOc34gkZt
 y24iKIYUbP0GmEP8bbfa6HjCqp7nRiQz21z7cygnAkORnb5I7ASSM5Bx37F+YxenBcvN
 bLrw==
X-Gm-Message-State: AOAM531cvmZJ0z2HgALSYIaeMa4gR5BFYkZkKsbEI3in858nAR/DZRkx
 Fu0OMX7rjusdtwvq/aivlqM1mg==
X-Google-Smtp-Source: ABdhPJx2aKKbKDnkgj2OLxcYPHKw+YTIMll8R6KarXAsTZP8A6V3QfgIVqQv+m+8JvKvKr7+rj7+6w==
X-Received: by 2002:a17:903:22c7:b0:13c:855a:3d74 with SMTP id
 y7-20020a17090322c700b0013c855a3d74mr30697485plg.74.1632280612941; 
 Tue, 21 Sep 2021 20:16:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j7sm473198pfh.168.2021.09.21.20.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:16:52 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/arm: Fix coding style issues in gdbstub code
 in helper.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210921162901.17508-1-peter.maydell@linaro.org>
 <20210921162901.17508-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <007e592e-07dd-cb68-f9cd-f0c9d3791f8a@linaro.org>
Date: Tue, 21 Sep 2021 20:16:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921162901.17508-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:28 AM, Peter Maydell wrote:
> We're going to move this code to a different file; fix the coding
> style first so checkpatch doesn't complain.  This includes deleting
> the spurious 'break' statements after returns in the
> vfp_gdb_get_reg() function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

