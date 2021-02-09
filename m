Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3653B315646
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:48:50 +0100 (CET)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y49-0006ut-7m
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9Xwl-0000Tx-FK
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:41:11 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9Xwi-00039V-Lz
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:41:11 -0500
Received: by mail-pj1-x102e.google.com with SMTP id t2so2195638pjq.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O44UQct+9RNpSSHH5jDGn2T4z8W6mI8uzYSJXF6Ygs8=;
 b=u+E3XSNQtX1Sleqr7iQIQESI3Q+Nlhvt68j72d/fcljhbDla2y4p3nQivs9GmLtYzR
 U46xCP6P74MG5kuJZnlaozYGV+eBjYQwpF37bOlyMNZ87xOwgq/IYmbkHo7NyphA7q9S
 C23u4SNeyfkW3G6aj3IUnB6g12wrpZjszIeWhhs8qoqhqHzv4w9xXInFo8HFUVeXdHXH
 9/g85OlJOOXp26eJos2G1ehWDlKj54G6nUBiI5pIHleu5uqPPUKqFyWP0zb+fsDe30dA
 MICD8jkIqgYFA4vLIKWhIZPnuicxQFMta5MHBASHXwdrzNU8zw9NAyODEKaVwpuyty1j
 F1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O44UQct+9RNpSSHH5jDGn2T4z8W6mI8uzYSJXF6Ygs8=;
 b=tImeT9kdrO+15MLK55xrfZy041tE8sJLhevwuIlAH7f9GJ4e9EJbItJsV8KbUGxnqL
 1Dfu/EvWC/+Hxc2g/n2Rw6GDc0hVKBWu1fq5o7ubyt7DOEpdsho/3mtfcWKDvvoRTXfV
 h6UVHUKR6rybIUm4r3lWVaC814LDtoT7w8mUF+i+xtUteBgbQp4CixyEP3SWcmEvHFkc
 t4FRM5b/pTjj2FHfB8ZZN4df8RTWBQiKQkciQFQzDwKfRocKX6jAeiHVk0+UHYjT76uL
 ekvRMsshJxCeuLU/EPTOVfuYz3b5/p7dwjKcsxloq/vocndpx9vXmAUU86uDm4KaATho
 2DmQ==
X-Gm-Message-State: AOAM532H9wKMTl0xtd4clcFKMe0692WvbU09Ph2b4CG31ZfkOGOjpEs2
 Y8PbrFvPWboZLB1pIlcoQmjCow==
X-Google-Smtp-Source: ABdhPJxWru64149KAvIvLWdPn6FmGTB0m/eRDWrNFVxy5hDQ/8nNKu28R3gCZz06OLe08NMo7UNyfA==
X-Received: by 2002:a17:90a:fc4:: with SMTP id
 62mr5494879pjz.181.1612896066972; 
 Tue, 09 Feb 2021 10:41:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 u20sm3371453pjy.36.2021.02.09.10.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 10:41:06 -0800 (PST)
Subject: Re: [PATCH v1 07/12] accel/tcg: actually cache our partial icount TB
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210209182749.31323-1-alex.bennee@linaro.org>
 <20210209182749.31323-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c5f00dee-fd56-5a7b-64f4-5ae873180246@linaro.org>
Date: Tue, 9 Feb 2021 10:41:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209182749.31323-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com, cota@braap.org,
 robhenry@microsoft.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 10:27 AM, Alex Bennée wrote:
>      /* Refill decrementer and continue execution.  */
> -    insns_left = MIN(0xffff, cpu->icount_budget);
> +    insns_left = MIN(CF_COUNT_MASK, cpu->icount_budget);
...
> +        g_assert(insns_left < CF_COUNT_MASK);

Why both the MIN and the assert?


r~


