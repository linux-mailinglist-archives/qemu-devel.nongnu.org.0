Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727CB50BBBA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 17:31:23 +0200 (CEST)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhvFh-00053B-Ll
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 11:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhvAO-0006xc-9z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:25:52 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhvAM-0003Tw-Q9
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 11:25:52 -0400
Received: by mail-io1-xd2b.google.com with SMTP id c125so8924121iof.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=8z+apJfDrkcdYFfu8tFn/BNBRkevyxR7qRX78Is+rdc=;
 b=CmGjxLuu5B1MWkAmbLN3vlHb+g03TKm4PS+qsIKB9kKGdCjMaF0qWeJ29Mu1qefvD8
 NfluVvmw68rn/XdRmDtTaIG7SevAFheyNd1iDOP2NZ8xbwEK9TbNOZEsTWIiIUNGTV1D
 ursAkcdL5Nuo+kWPHTQ+4jIiVQNPltHFlN+wnepk16f7q9U6qanW3/U/QGKSCrze5w5l
 4fsGAwBENZdPFNrx2HDF5ZBcKl5LDagGgOuar+uFA0Y7tLBb8kiP6qm8I0vpvK1d7rtq
 hBx3OCrq8mfikO1tlC/grUnnxZ3IXpL/AAmsc77AEcws00BoPNRMphpdErheXAEfnYtE
 VWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8z+apJfDrkcdYFfu8tFn/BNBRkevyxR7qRX78Is+rdc=;
 b=YgckFuqDD+kg8Uvno3OfkYE6JEVRhQ2eHwzP8ebO0sgrjE7wRz/8bfyjssbwiV/LtF
 wjMhkSrffYV0YG7XxSdzOoBTy6XzMXxuzU3J44h/H2cZl3YJknw8Nw394sJhJ84zovUH
 0a5XyETLVqmxpiYvoNmS4BiGwnRg8E31CPSTh1bbV/llRKso+TuTkkr9UzqVmdktdD/e
 NSohDH1r0phnLDcwm3dVzGGj8YzHTswY7Ayu3cOFyF1bTznI/h4StVcqtZZ+CtYz55eK
 hMQUM3jttw5TV+tHRVtM5lxgqBjhohTlF8laCVxDEdCbvBPYIJz7dlkbebvPXDUSgBJp
 5MDg==
X-Gm-Message-State: AOAM532eABuh7KsYGQr1vQSRGoB3EeGugW/dm7YpXk+sG8hXNCEyWRCc
 D8uEriqRkfal9zqZcmb3duGNMuX+cEVXgQ==
X-Google-Smtp-Source: ABdhPJxUUZlXu6WxIgL/yLC6vNBtawloMX/EN7BgHcGnK3AqJHNClrPSUoVkoFuxZfpSkbSF7GNPAA==
X-Received: by 2002:a02:a399:0:b0:326:7b56:1a9f with SMTP id
 y25-20020a02a399000000b003267b561a9fmr2245334jak.185.1650641149637; 
 Fri, 22 Apr 2022 08:25:49 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1?
 ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a92ce43000000b002cd74588224sm1180131ilr.4.2022.04.22.08.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:25:49 -0700 (PDT)
Message-ID: <6a136868-b566-81f6-1c30-8034826efd25@linaro.org>
Date: Fri, 22 Apr 2022 08:25:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/7] target/xtensa: use tcg_constant_* for exceptions
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20220422114332.374472-1-jcmvbkbc@gmail.com>
 <20220422114332.374472-4-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422114332.374472-4-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2b.google.com
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

On 4/22/22 04:43, Max Filippov wrote:
> Use tcg_contant_* for exception number, exception cause, debug cause
> code and exception PC.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
> Changes v1->v2:
> - also use tcg_constant_* for PC
> 
>   target/xtensa/translate.c | 18 +++++-------------
>   1 file changed, 5 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

