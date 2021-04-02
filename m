Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42891352EBC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 19:51:01 +0200 (CEST)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSNwi-0008Ud-Bc
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 13:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNty-0007Rm-N0
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:48:10 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSNtv-0006S9-Qe
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 13:48:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id t5so858269plg.9
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6U7h58lokfiEzbYzD8Tywa8u2P3Ed5r3zF1BNTrQfJg=;
 b=EV9nvMUGE/6AWLAnMlyJr9yjH9aQIkFN96TrVYhQsUoJ5fsCrw9lq98gGkpRblTS+q
 lIP1qpFTi37ZvQRvaqhE8YOlnebWjBOb4EuzWzlkzulb4DE1CfHy9Tsal4A6/BI8s8cB
 f4evUel+LReT4mtCVkQ4g4sJnkdJYq/SROEiYUej+IrF6uUij9e34cISyL3jwUXiqPMI
 OA4zNZ6aCSjH8mYZJSXzAnYJTaWVDJwZQyUxfKwedg6qqzuc2aZR0wXUXbqDyLxlqUUJ
 WQFtQses3d0AAESbGWuwmmUcVBfLo1aVCVMX36hJ9yhk6Z7FWUJBa1i8/rsI1+VnQw7V
 buSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6U7h58lokfiEzbYzD8Tywa8u2P3Ed5r3zF1BNTrQfJg=;
 b=MP8njyf3zLZd8sJ9/CacDcPek037P08vbR3QvEYyiTXxY6Wn40cpNC4pVvVavBX/5s
 eEi3B3s1veQH8CreO2Zwn7RnvNybT1xZrHU9d2MioX8fM0dPko4dQ7TTkCmPNETVue6T
 LLyWwWjIOwOnq4GN+BNZhWwyiXb5I5DiX6ahLpcYMbj0y67HypxiopbK4ny4kxRq0cNp
 j5MkKT+Ns0qX14P/9OW56CND07o2kA1AmWis/XOpTRL+z2AEWAgmRJKZMRtyibEcZShw
 V6bKt2EuZhCbDzu91uV2eXyXV8sBrr+ZKJ0EQQDkHZhQXuOUDruz2PByaR7mjA2sNJHw
 Ew3w==
X-Gm-Message-State: AOAM5308XAaNpBQ+Dc37dEUJ9f96nWXlJqbquqXCNw0kkS9vYQ9d4TCE
 5mGJOM/rI/Ob+kGmPY17dy1F1Q==
X-Google-Smtp-Source: ABdhPJxlvscNWoNayLht2pQ0hAEccBOwkCOrUKBUOIxn0NZUmphTs8JM9Acg56mWw5rN2AIuBmijKg==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id
 kb16mr700882pjb.206.1617385684103; 
 Fri, 02 Apr 2021 10:48:04 -0700 (PDT)
Received: from [192.168.51.248]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id w23sm8727920pgi.63.2021.04.02.10.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 10:48:03 -0700 (PDT)
Subject: Re: [PATCH v2 09/21] Hexagon (target/hexagon) use softfloat default
 NaN and tininess
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-10-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08554481-3c75-af48-a36f-98165088956b@linaro.org>
Date: Fri, 2 Apr 2021 10:48:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-10-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   fpu/softfloat-specialize.c.inc |  3 +++
>   target/hexagon/cpu.c           |  5 +++++
>   target/hexagon/op_helper.c     | 47 ------------------------------------------
>   3 files changed, 8 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

