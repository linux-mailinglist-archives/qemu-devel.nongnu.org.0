Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ACA44D743
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:33:14 +0100 (CET)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlACW-0007dW-UT
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:33:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAA0-0005bN-4B
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:30:36 -0500
Received: from [2a00:1450:4864:20::433] (port=34670
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlA9y-0007wi-Ai
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:30:35 -0500
Received: by mail-wr1-x433.google.com with SMTP id d5so9857080wrc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 05:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gncxJnTqTY4eAOFqpJdk66rwJ8hC5nR6TAjDOPexXXI=;
 b=gZqq0KevrKh9TXOQzWJwg9fd2+SiHqpS/dXQQB2xhsJzZZxzUwfKEdFwC6eTaH6aRw
 A9COFHmLA6THH1U9iWAlwQL58AiBt9T2dEd1baQecPiufXb8D7SBgz6b2AOOXGmBDu9S
 hd2zeZczOBlovoPGT4MPOHmFqNmjVQIV1VojlZ/wbRf8HVOSOVVghnuepaUM+AjEgzyA
 EuorUInJY4qqteKYvkOfUdMXnEd2/335isRN3YSYfYoJTaJluxNemX8Tbmb6J8YHvu+D
 QUwSugHhQauY0+a1hw8LoeBgWv6oYJB5qrkXIFgQFOjhTjDZ4IaEP9cjIA1wsJFBzfxx
 U5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gncxJnTqTY4eAOFqpJdk66rwJ8hC5nR6TAjDOPexXXI=;
 b=2TmeS9v+gEAUt3L/nEQ9PCOR7oH3zdqZsSFXpfawhhu/Ome+rMArBpKxruNjMh7371
 1V8BUkCq3ia0cLiWdpoUZkCAcQU01VkZNkW4BkApTuPwIly4cWriPeTk/21jbdhp12Dv
 twFdXfCQZNNhEj8lnb1LRHvkS2vGaMUA9p5ZxoYRqqGGo9xpTPHkEq5h63MuNN9ogvpT
 kiDTE52UsgrIBsHdzGVT/4qPKx9jeQHRct/Ao70twBXjyYVrn6j5dyGnD+Qpz2E205bd
 kNVJIxEKaCGL0PZgD9H6q+JIFWSWqC/DN1BWep/s/YYXAk64wEVXJV3dzjlxnboWzhnj
 TGnA==
X-Gm-Message-State: AOAM5308L2ptUJ1Nj+jeMJGo7wsaXo5u2gV4sOgB7llSVySeP5M7y64F
 Bqxf/KPxpCJIJSkwUN+xoJmqqNkdr2xWQA4toFY=
X-Google-Smtp-Source: ABdhPJyScsCJ/c9NhujybIeymzLxJFgDuQ6NZSu5eKHUFBgvj1CR8xX0WgtwLGH1Wc5sYeCglK4U/A==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr9174259wrp.248.1636637432838; 
 Thu, 11 Nov 2021 05:30:32 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id n2sm5386520wmi.36.2021.11.11.05.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 05:30:32 -0800 (PST)
Subject: Re: [RFC PATCH v2 03/30] target/loongarch: Add basic vmstate
 description of CPU.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-4-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0ddf34d-04e1-3c63-3c76-10ac54e28105@linaro.org>
Date: Thu, 11 Nov 2021 14:30:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-4-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> +++ b/target/loongarch/cpu.c
> @@ -12,6 +12,7 @@
>   #include "sysemu/qtest.h"
>   #include "exec/exec-all.h"
>   #include "qapi/qapi-commands-machine-target.h"
> +#include "migration/vmstate.h"

You don't need this include.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

