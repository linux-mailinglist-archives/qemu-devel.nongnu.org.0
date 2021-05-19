Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F507388F56
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 15:41:40 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMS9-00065h-JI
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 09:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljLvS-0006L8-6n
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:07:51 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b]:37435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljLvK-0001iY-3g
 for qemu-devel@nongnu.org; Wed, 19 May 2021 09:07:49 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id w3so2706534vkb.4
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 06:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fdQcNmnzHzFyC9bw4PaeOiYDd7P0RyT5XLQLTwtFON0=;
 b=rmcfnRDOpkrYQ3/jDNxZgnTO7sODdIomNIB4jmIDo7Q5cO1iSof5mJ5zV+RY82/uyQ
 itMYby+l0PPxYD5Pd7cnZ8cjDVQREErCcxL8UP0sz3kuq8pd5rNmCFyG7DVxxykPZYqZ
 CUtLNT5cxiPkvLKPFLAJhWEjPpZcLqBdTYg7lRlGXJ9TDURekocv98sxWCYcsT3wJE04
 7atkW6cQ6EBbAA0SzacE+kL3uT6hrqyF96mbUE2aGf3Xzw9qNiRSY8mw7jZE1zhM6tW0
 jrzNd6NgkLxIqY/fNo2UvdjFYsM4VR50RdIcvTSrpogNR8DDWKEpzT+kNJkieyeukCLq
 b6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fdQcNmnzHzFyC9bw4PaeOiYDd7P0RyT5XLQLTwtFON0=;
 b=YWfxPYCUVRGaPw4iZFJCm0jDk3z/I+5Jxe1Q74z9n93zsEfVY9AWD0VbFlYSfnTFZq
 K2SOP/7mahHXREQaKTrb4htZqu4AIPtKRB2pFM8AlOfk2vw1FG4R+WkDgDwKp0+5/WW5
 j6Wvv5JgBmNZoJ+LRl8v5SgfvT+2rO/9oXREFboPe804ZqtRm6VFeyhwRgz2HzKebmr1
 N+47gsHaqk1k8UwOPBOPdatF5IImAZTBsrPR/R7fYmAYPXeA09joVMvRwtAIy8gRrwqh
 omaWMEXuYDCSRCxKlwZxnub6no51D7gSr/70IX0bYs2DaDfBHRTtS+t6ii1UuSw3Dy1F
 cqEg==
X-Gm-Message-State: AOAM532i3xexzL/rCwWjD9L9m17yqzIwEW7GrBTQD+h4oWRj9fzwsU5n
 bQe7rDZJPfNWfcCMV3/0Luzwgw==
X-Google-Smtp-Source: ABdhPJymLNz5Qb8n/myxXjCh+0ffRpcKwI1wf3BNp/Ce1LnV/F6oSKltYMNSCTHfQomMuv7i+uWS0g==
X-Received: by 2002:a1f:e182:: with SMTP id y124mr13081196vkg.11.1621429659297; 
 Wed, 19 May 2021 06:07:39 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id g192sm3232872vkf.10.2021.05.19.06.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 06:07:39 -0700 (PDT)
Subject: Re: [PATCH v4] target/xtensa: clean up unaligned access
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210519104557.16940-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7f930b5-3861-a126-864a-488ccf926203@linaro.org>
Date: Wed, 19 May 2021 08:07:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519104557.16940-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2b.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 5:45 AM, Max Filippov wrote:
> Xtensa cores may or may not have hardware support for unaligned memory
> access. Remove TARGET_ALIGNED_ONLY=y from all xtensa configurations and
> pass MO_ALIGN in memory access flags for all operations that would raise
> an exception.
> Simplify use of gen_load_store_alignment by passing access size and
> alignment requirements in single parameter.
> Drop condition from xtensa_cpu_do_unaligned_access and replace it with
> assertion.
> Add a test.
> 
> Suggested-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

