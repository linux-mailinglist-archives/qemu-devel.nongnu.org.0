Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B7A40998D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:40:53 +0200 (CEST)
Received: from localhost ([::1]:36952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPp0m-00050n-32
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPog8-0003fF-SK
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:19:34 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:43579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPog2-00058e-3F
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:19:31 -0400
Received: by mail-pg1-x533.google.com with SMTP id r2so9906478pgl.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2WHs1yNIobVLyvnQNXGzdlO7EnhZxEf9NGWfu1w9450=;
 b=eMNwCOkC4l6kRbUBw8vG+3PMuOhk4LRvuEmRIVIiEJeH5n/PxVdREtuLifHlDKpjm5
 jN9Feq8u1k50uJFCjLH/rKSlsSu+/XKr+Hah3ufyC/KZvbJGI+j/hy5gCjcy+8BUq5Ps
 kudGIG2V1Q0x+IE/Zq7K8kfkM1RzkYHEAKnAZnhmpuld9R/lGzSMwAL7blVL5sqrDITp
 3NLiZeZYKN7ByDMo6JL/c5EdNRmJcwcBREKWAx6Tg8UqvfjoyLjZp/0VNSWZfVbTurNf
 OMBEHXR7DeeN9wM572Iu85gs/NR9ytIt6GDwlqIR2F1ujBv1pMzsTVQSnE8l+jttTxn2
 gy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2WHs1yNIobVLyvnQNXGzdlO7EnhZxEf9NGWfu1w9450=;
 b=1RxjnrLaSpTPSua6sPWjjgKyfxcf+psBB0w+DSIzSdm1dp2chTLrtyCUtlA9df0OMy
 +sDd9VP5rGRZqrcWqlIy9Upmdqt2vbJvNHokxvj2vMRJiuhNHDkbiVh16KE84ksgyn+r
 Qj90E5Ymeb2xaVHAiCYB8QYidozbG8e2kWpdQHjOVLP9eL2xnFoGTXBf4jcPv9moqt3C
 wPnAaNa7aeoTFLgSvlAUpERi1OnnXQjfUvulanoKC2TK/YURcnS8JtrVyC+jb5ube3Pz
 oTxQGUGjxRrOu58uHLn718PO0UD5VUYrh1/ld4SEYFelW6Bnv0dcBHcqvHFgLBhUjhfc
 +ScA==
X-Gm-Message-State: AOAM532hl4lioefmQrHLdqyDQkSk5ILuLjb8d1iKAfi+xNtNml4oStQL
 JtGIxdkwh0paL5lG/ItA9wNxfA==
X-Google-Smtp-Source: ABdhPJyxkiIzYNULEmyuhav0CEZFRV0/4UhRkR8OMgk5yxdcf6TPDw2SPWHXFg6aryTjh2LmPDr6LQ==
X-Received: by 2002:a63:7013:: with SMTP id l19mr11711093pgc.342.1631549964638; 
 Mon, 13 Sep 2021 09:19:24 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y8sm8009684pfe.162.2021.09.13.09.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 09:19:24 -0700 (PDT)
Subject: Re: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20210912174925.200132-1-richard.henderson@linaro.org>
 <20210913110727.GF26415@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6e7ab0f-aebe-c9c5-d479-fa30e69fcd1c@linaro.org>
Date: Mon, 13 Sep 2021 09:19:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913110727.GF26415@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 4:07 AM, Richard W.M. Jones wrote:
>> [    0.000000] Linux version 5.14.0-60.fc36.armv7hl (mockbuild@buildvm-a32-12.iad2.fedoraproject.org) (gcc (GCC) 11.2.1 20210728 (Red Hat 11.2.1-1), GNU ld version 2.37-9.fc36) #1 SMP Mon Aug 30 14:08:34 UTC 2021
>>
>> I thought about parameterizing this patch further, but I can't think of
>> another ISA that would be affected.  (i686 clumsily changed its abi 20
>> years ago to avoid faulting on vector spills; other isas so far have
>> allowed vectors to be unaligned.)
> 
> Is it possible this change could have caused a more serious
> regression?

I don't think so...

> Now when I try to boot the Fedora kernel using TCG on
> armv7hl I can't even get to the point where it detects virtio-scsi
> devices.
> 
> Full log is here (go down to the bottom and work backwards):
> 
>    https://kojipkgs.fedoraproject.org//work/tasks/7337/75597337/build.log

I downloaded the 5.14.0-60 kernel from above, and I can reproduce the original error, and 
I see that it's fixed afterward.

I'll have a look at this new build log in a moment...


r~

