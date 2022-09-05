Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC15AD234
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:14:47 +0200 (CEST)
Received: from localhost ([::1]:58074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVB02-0001lJ-2j
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAcv-0006tb-49
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:51:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVAct-000597-Eg
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:50:52 -0400
Received: by mail-wr1-x429.google.com with SMTP id b16so11018094wru.7
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=h+xTjivzR5jTYlbCB214i4ZGfICXfMaO9AjK/CIHFAE=;
 b=ngZoKBI5gVJAPpRMJGIX6h+i4OaETwQD9nilxZ6CJmeBAZ0xVId1RQ7SQm1jDrh2sw
 Whyu4WLKoFdQhLBQPfFHN7jA61XJaeeF3UaLijK8tiW4KhuEIL7jJUN7hIuEigcsEKc6
 FGtzRGgKe0uENnDUqJ+ITKWvJ3qEI+1RGHukeLeO5PYLNAuDSRzypMyTdga1FdqF9zfe
 iMsBGy4f2AFeNhbFfDvJMAyOqXISqPhddWGpGc74ZsDgp1fwbCHfsOgYNombR/Wyb7DH
 yG1smuPVmbZsIwZDhYDSVzICfhgIW0jOfvlQrQ/8V+RFGKahEyaivkVc8pStOK+TFCZ2
 n5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=h+xTjivzR5jTYlbCB214i4ZGfICXfMaO9AjK/CIHFAE=;
 b=zXOiy5tTPIzXeALWjSF7Y7+KxeP9NYJqtrBPWjrv0YBtncL1YRju5Qw/iQlrqfeMMU
 zBv86mmeM0LIR85NlE65xtd6gj+khZLqF5IwQBReleufXGGcRfb2w/8hcO3ErXHZZF06
 El4IWKS2PIDi4m/NSGd//aUN1INfCA4/6tbqk8kD9MH5y94V5PTgKhUCnfxbtPOVRSt0
 jr5bu8HmjwqQWw1EVoV4lg5+8PoPbE+IWR2+eJt/79JPyrmBvJppGlzHSZg+jZ7P1BLg
 2kke6GttDLzUyrnLDbYWy2rgxQzWVlui6Hc/9cYEwmaAlgtpl71RM3xLOarbGwyguc6y
 GzBQ==
X-Gm-Message-State: ACgBeo2h7b8bbqnVWF0v8O5bQnEvPbZx4Pmw4X12gRK8e3SUjG3YELIH
 T8udLiFTne0bRRQyg9wST31a9w==
X-Google-Smtp-Source: AA6agR5njCu9WzZ8YSl20C30VyjkjUyzxfhHIgrslA5uzDdIH5JkfO1anlIvbS3bXUxRyjHjez7OBQ==
X-Received: by 2002:adf:fbca:0:b0:225:2ac9:e306 with SMTP id
 d10-20020adffbca000000b002252ac9e306mr24898860wrs.259.1662378649736; 
 Mon, 05 Sep 2022 04:50:49 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 e5-20020adfe7c5000000b0022862e037e3sm5287806wrn.38.2022.09.05.04.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:50:49 -0700 (PDT)
Message-ID: <dde78910-1580-d5b1-4ea7-d44e430b6afe@linaro.org>
Date: Mon, 5 Sep 2022 12:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 16/20] disas/nanomips: Replace exception handling
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-17-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-17-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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

On 9/5/22 10:55, Milica Lazarevic wrote:
> Since there's no support for exception handling in C, the try-catch
> blocks have been deleted, and throw clauses are replaced. When a runtime
> error happens, we're printing out the error message. Disassembling of
> the current instruction interrupts. This behavior is achieved by adding
> sigsetjmp() to discard further disassembling after the error message
> prints and by adding the siglongjmp() function to imitate throwing an
> error. The goal was to maintain the same output as it was.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 126 ++++++++++++++++++++++-----------------------
>   1 file changed, 61 insertions(+), 65 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index 5142f307fc..a8295ebfa8 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -31,7 +31,6 @@
>   #include "disas/dis-asm.h"
>   
>   #include <string.h>
> -#include <stdexcept>
>   #include <stdio.h>
>   #include <stdarg.h>
>   
> @@ -134,10 +133,12 @@ static uint64 renumber_registers(uint64 index, uint64 *register_list,
>           return register_list[index];
>       }
>   
> -    throw std::runtime_error(img_format(
> -                   "Invalid register mapping index %" PRIu64
> -                   ", size of list = %zu",
> -                   index, register_list_size));
> +    g_autofree char *err = img_format(
> +                      "Invalid register mapping index %" PRIu64
> +                      ", size of list = %zu",
> +                      index, register_list_size);
> +    info->fprintf_func(info->stream, "%s", err);

There's no point passing the output of sprintf into fprintf like this.
Just fprintf in the first place.


> +                        disassembly_function dis_fn = table[i].disassembly;
> +                        if (dis_fn == 0) {
> +                            strcpy(dis,
> +                            "disassembler failure - bad table entry");
> +                            return -6;
> +                        }
> +                        type = table[i].type;
> +                        g_autofree char *dis_str = dis_fn(op_code, info);
> +                        strcpy(dis, dis_str);
> +                        return table[i].instructions_size;
> +                    } else {
> +                        strcpy(dis, "reserved instruction");
> +                        return -2;

Ought these errors use the same error path?


r~

