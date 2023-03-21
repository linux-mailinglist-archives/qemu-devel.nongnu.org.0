Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33096C2A2F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 07:06:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peV8Q-00005A-Ri; Tue, 21 Mar 2023 02:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peV8O-0008WC-Nk
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:06:12 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peV8L-0002VO-Eg
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 02:06:12 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso14886151pjb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 23:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679378768;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kY8W4n5MzDDB7VJh4rM2EO16kH78QlE3i7++iFHc+/o=;
 b=qVu6uiGu45Ib9nOw1hcJjBmTRgEfj2joKhKeP9jB+LfLxf17yXH1vWW0JECg/dXwje
 zAg7LYXWL9PM9f5K93NkItNw0Lh8LAq47KA50mEeAi1wbIHB0KlfMmeidUcrjkV5JK5D
 Wy6xfQO0Z9flk9ZsYuButfvYtmPy0t6pBVlGcEy1NA6tZjS8Sq90nbi9jAWvC5WlybAY
 JiA8imPffmiJSRGFiWz1XPHA6VhLKMjw8mXgXUP1CLdjGE4hNyYU1TDC+XpWBdU+AqO0
 Xiy9SrmLKkC3ywn0C0eaADogtm0Ej2M/SJpMb2ai9t97EvKYfa+LmD8pQX2VV4iuJOTv
 gmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679378768;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kY8W4n5MzDDB7VJh4rM2EO16kH78QlE3i7++iFHc+/o=;
 b=cO1q5koVRtn91A68lYg36quZPJMUCPzlGLvoJBvZdDy+x70OdU5EBpD+x0tb4G2u+c
 LW1GYIaQpXnoqczpNUtBbDNB+phVT+Kq5WytXGxP3NYK9oX8ygH2A1jDJdeuKwiuztSL
 DY42LiBM4ejlbUmjO53jNCtfSv4JNyHres/I5iSeAxHCUkt4ZiCfRLzeqVMMv8cKhgYH
 QCqaAGUUgfN+QChLNnjvtE9VCmGyX8kpG7eEY3TfVZ4W/ZmbWPOE2FbiRTCR+Q2450TE
 c/4ezQZCVX5yMpLD0btkvo2XBgVpOTQxjLn5VUFYogniM/bhzfzfCEVytRy0jwPu3kY3
 rUHw==
X-Gm-Message-State: AO0yUKVxy3+gvkrrMkOdgtBi2l2ozp2Mik1EbJda6x8UuXd0nXcQXhTy
 0YDT+D3DwQ+n6lRps5OYcLlINLTHqlC6i4AnzV8=
X-Google-Smtp-Source: AK7set+Do0rbnOoCGLkUFZruea+ru2/XnFOM1v8RJImXeriUzPTtVgeOeqvoo3sqFsweJyNXFeoEPw==
X-Received: by 2002:a17:903:64b:b0:1a1:a8eb:d33e with SMTP id
 kh11-20020a170903064b00b001a1a8ebd33emr1001758plb.8.1679378767798; 
 Mon, 20 Mar 2023 23:06:07 -0700 (PDT)
Received: from [192.168.149.130] (097-090-106-114.biz.spectrum.com.
 [97.90.106.114]) by smtp.gmail.com with ESMTPSA id
 c10-20020a170902b68a00b0019edf07eb06sm7745062pls.122.2023.03.20.23.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 23:06:07 -0700 (PDT)
Message-ID: <6a240bc1-4321-9891-3291-1320a96d1310@linaro.org>
Date: Mon, 20 Mar 2023 23:06:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tcg/tcg: Avoid TS_DEAD for basic block ending
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230321045340.838-1-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321045340.838-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/20/23 21:53, LIU Zhiwei wrote:
> TS_DEAD means we will release the register allocated for this temporary. But
> at basic block ending, we can still use the allocted register.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Test case?


r~

> ---
>   tcg/tcg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index bb52bc060b..0c93e6e6f8 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -2822,7 +2822,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
>           case TEMP_FIXED:
>           case TEMP_GLOBAL:
>           case TEMP_TB:
> -            state = TS_DEAD | TS_MEM;
> +            state = TS_MEM;
>               break;
>           case TEMP_EBB:
>           case TEMP_CONST:


