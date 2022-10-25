Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A560CA36
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:38:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onHJ0-000110-Ce; Tue, 25 Oct 2022 06:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onHIw-0000sr-Vn
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:37:07 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onHIr-0002Mn-Jf
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:37:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id e4so7475878pfl.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M9lMT8iCKBVLNaEerkk6De4KF6aKxGC6a+QU71O7nNM=;
 b=vBptIgKK/tsUfuNJ2r9cSiCz6/Bg5CUXt1H82dRR3QjSRPdkr5dmxB39NV3dw9/u8e
 2OZfE0K+KUy5HH7f0GaywVfzrUAOIQ08108OZljEby9yiNF5+1EvWRRnNF7FyeHjm2jx
 n2WJHmhAQVYyx4UYUMZEBQIBogXk4x/M2nv+EwuswWzOZxPGK7QlTaX5XPWN61ai7HHc
 62y6tKseASwarm+qhvRLOK5czyuf6XzjKjgjYdxpjr8vFVyKBrfaBOuJ5a4DVjSsTcNE
 67AhOMUwvhExlAU5NpAjCcLHu+3wdLhqp/82rsyGvS/KOtCXE5UwtLYd5EHLoJYejbww
 xbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M9lMT8iCKBVLNaEerkk6De4KF6aKxGC6a+QU71O7nNM=;
 b=H73ROTaX5wHVGpH0X1qrDTKiQ8Eyz+GBQRm7M6mV0+O/WUcVszfIMP8lx5xtXwsJ7W
 TgHzZETNA5uFDSTolR+DES2vR0f/XI/llE5GaSelKDc8JkB3s9ghBMGDYy48Jas6HxRq
 VDqKGP00ky5QuBEeZNA2+Zj7EUpiSOJ6I+sU9YTmwHIbEPo4iVPUwHxEWo5ecwERHOlX
 pNfJf9pMSBr3RHWSLCNr5vZhvn4WZ2/THFG58QYyL+rAqNChhe+RvnF9F7ABKSMlTaIP
 g3CE8AKaPG9ZnyQkJa6Qv8LZzFvC3ct8Jdtogd2AGul7EUqrnKgzlSX54LlaZA13CgUn
 vHqw==
X-Gm-Message-State: ACrzQf2Ye49aPK5QgZHLmGZrWLNNIeZvKOwhz9I0hN+X/z4wSYJGLali
 gqrL6AHzNEU4jbcwZt/O+VSuGg==
X-Google-Smtp-Source: AMsMyM4kDCov8MPjLwngOSBvt5b9Z0ua7I8oI9aMX+AbMrq19nQx0S/Lyge8o3NTWgR5stHewp3LGQ==
X-Received: by 2002:a65:68cb:0:b0:460:b552:fbf4 with SMTP id
 k11-20020a6568cb000000b00460b552fbf4mr32353050pgt.457.1666694219897; 
 Tue, 25 Oct 2022 03:36:59 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 z198-20020a6333cf000000b0046ec057243asm1037335pgz.12.2022.10.25.03.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 03:36:59 -0700 (PDT)
Message-ID: <4a611a94-848b-e72a-6bbc-90ab1d593a33@linaro.org>
Date: Tue, 25 Oct 2022 20:36:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 01/24] util: Add interval-tree.c
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-2-richard.henderson@linaro.org>
 <87tu3s8fb3.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87tu3s8fb3.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 18:40, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Copy and simplify the Linux kernel's interval_tree_generic.h,
>> instantiating for uint64_t.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> <snip>
>> diff --git a/util/interval-tree.c b/util/interval-tree.c
>> new file mode 100644
>> index 0000000000..9578c05830
>> --- /dev/null
>> +++ b/util/interval-tree.c
>> @@ -0,0 +1,881 @@
> <snip>
>> +
>> +#if 1
>> +static void debug_interval_tree_int(IntervalTreeNode *node,
>> +                                    const char *dir, int level)
>> +{
>> +    printf("%4d %*s %s [%" PRId64 ",%" PRId64 "] subtree_last:%" PRId64 "\n",
>> +           level, level + 1, dir, rb_is_red(&node->rb) ? "r" : "b",
>> +           node->start, node->last, node->subtree_last);
>> +
>> +    if (node->rb.rb_left) {
>> +        debug_interval_tree_int(rb_to_itree(node->rb.rb_left), "<", level + 1);
>> +    }
>> +    if (node->rb.rb_right) {
>> +        debug_interval_tree_int(rb_to_itree(node->rb.rb_right), ">", level + 1);
>> +    }
>> +}
>> +
>> +void debug_interval_tree(IntervalTreeNode *node);
>> +void debug_interval_tree(IntervalTreeNode *node)
>> +{
>> +    if (node) {
>> +        debug_interval_tree_int(node, "*", 0);
>> +    } else {
>> +        printf("null\n");
>> +    }
>> +}
>> +#endif
> 
> This seems superfluous especially as we have unit tests.

Oh, I used this directly from gdb.  I meant to disable it again.

r~


