Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651A6B5101
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:35:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiVv-0007Vm-Ej; Fri, 10 Mar 2023 14:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiVp-0007UA-Ub
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:34:45 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paiVo-0000nr-26
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:34:45 -0500
Received: by mail-pl1-x632.google.com with SMTP id v11so6733829plz.8
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678476882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KcvJSFloV2UM74PYdzh3vseeIocAoU+nM6qIsPFnc7o=;
 b=qfgT2JezmHlBefhmwSI7MWS8R1+8PS2VsXMC1Ub8cAfgCj8bt4Fg2p62JfXm3ZIIeI
 NeGQURTKBwtmfjguaUX66lqEvOCQJXOxG4hNZJoj+PnGX1gyDbk28ELa91gbbKXJWRi8
 YEB5b5M+k8Jzp+bichZfAZSdqv3SziPoMwAX3vLj0oZc67rEY7YgwFu4s0ghkLz7aA9R
 31zNv5xItZpLlPHYu/BWxoTrUMyDs3FeIAsQ5y8D+V24kp2yQhQNuxu5UpCtD1Kufykb
 9O6tbuKUWFA3vratSFfRfPHtvxbls8EbsV2X3nPfNFYFKeBss3r4iO+pjdzw1ZgopWDp
 iJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678476882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KcvJSFloV2UM74PYdzh3vseeIocAoU+nM6qIsPFnc7o=;
 b=C+OhABSlkKwcv468iQ8OC2bJlulytdF3A78OpxNrvzK4WM3x3BAuTJx19+4fQ85RSh
 nGz8Iw+dRn5esPZ4opWu+9Pd5gd1+PSxVMsaL8pExePl4jyDhSGnflREh35lwLEO7sHa
 YcKqkMU2jhO68r2tJAAMOvJhkkeHAgipIQSU9bw+LL0BelH5mq17TgqjlcGkNFDudw3u
 xdBP1P3bBepVBqIh9GLA7nlFUChEUJcLQ03dd8pHZp3XLqGkj4bcpkkNVZsipxNo5ZSv
 +XwGOJliHsw/gVP7zkFOtQZ4pui/46B50usXXk5aYXkhX/7MfVo7rUl9rRd4/DvRWAfI
 YZeQ==
X-Gm-Message-State: AO0yUKWSargqJ5jO+iA0oPY7MBi58+A/G9uIAn474o74NZhHjL67jPuZ
 mHp7MuKFqw4YmL2g95JzGRwfNw==
X-Google-Smtp-Source: AK7set+9xJS3Vtbayyi7g7/5i0Uv/d/FQEjB1CftrFZqaNLZsmlapTqkrICqug2dnb8JA5k5zzv3vA==
X-Received: by 2002:a17:90a:1c3:b0:237:3f83:61f3 with SMTP id
 3-20020a17090a01c300b002373f8361f3mr27591483pjd.16.1678476882487; 
 Fri, 10 Mar 2023 11:34:42 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62?
 ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a17090a664100b002353082958csm315166pjm.10.2023.03.10.11.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 11:34:41 -0800 (PST)
Message-ID: <a34c69b0-2725-9cc1-4c79-0d3e5baaf953@linaro.org>
Date: Fri, 10 Mar 2023 11:34:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 11/12] target/s390x: Update do_unaligned_access() comment
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-12-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310174223.944843-12-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/10/23 09:42, Ilya Leoshkevich wrote:
> Relative long instructions now depend on do_unaligned_access() too.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/s390x/tcg/excp_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

