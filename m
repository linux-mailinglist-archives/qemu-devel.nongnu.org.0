Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D502587047
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 20:15:00 +0200 (CEST)
Received: from localhost ([::1]:42286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIZwR-0006kN-9w
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 14:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIZuC-00043Y-0H
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:12:40 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oIZu9-000878-7z
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 14:12:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id b4so1211887pji.4
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fji7W22gEBb7ehXONqqnmj1ph2Cu18wirR1M2Cl3O4U=;
 b=duz7GNFu7IQ/vFWdEnjmVTCrHSMQXdXg0cPPlW4LGTP0hsXSIPcue4FrpyKZAM+qvX
 5GcOsxqYcv9dNRJP2P4dU7p8QAZrQBiS4UTWpiKjWk4jqkhZqfKPwKqgrDrkSkmM7RuZ
 Te7bLeiD9M2LzXp8jymGSg6eQgkGgu/kr9MdoM/XhHzm/zkqezYfjTtlIRjXyfBr6J4s
 UpwxBWxGaaZskqku6yAYQ0H2i8Qw/heV2+/Vh1QAurVrHeYRvX9leKbsBs42/gJkfv92
 bHWSB4Vy2GOEF+FgT9OpPumPfpET7h7bi7JFTa9SJOYh/p8oFI4qCOFsm+jfaE/pJ0dM
 tHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fji7W22gEBb7ehXONqqnmj1ph2Cu18wirR1M2Cl3O4U=;
 b=jIQZHfPZPfNMn3NM9JgwBxcWQcMADl0WS0WH0cI7YaTacSG/L0FYrbrwPGyQNFKcRs
 MEGYvXPtQu7I9gqjkYyffugpikaAh189pXzz5IriZBuynxz3S5sVcUnHXLD0Rkhmp9Vt
 EKLOfTrxOLP6y2btCHJsfHVowZ7ogi3BkENwbzs9S5fXoDX9Cd23gijo9OXW+FvnZJhN
 A32HdlbIeDEqZIadyzOYqVkISXNmOemtyR4QCb+0Zj5HF6JOApJbGZqCNR2QJUmPmJKG
 9CbXWXR+0KembTmSe6VZL6y7IAk35MzltKXz/M0ffXkegW+ZX3YqHVNwxQqoQ45TdpQP
 QRQg==
X-Gm-Message-State: ACgBeo0AbFmqy757ntDzPQ1pQ0Jq75bkDWW/WKH8Ljn4YoO57+Bcv+08
 iAYzhsfJk17WKMhSB66Os3ax9w==
X-Google-Smtp-Source: AA6agR5Ie6Tavy+PdPHBR35pSTVwrx95a7s0IqP9iP3Z5KkQhSIiVLp3C/wH9vc0s0hFGOMx+ZTUSA==
X-Received: by 2002:a17:90b:4b8f:b0:1f0:7c99:10fd with SMTP id
 lr15-20020a17090b4b8f00b001f07c9910fdmr20690178pjb.86.1659377555726; 
 Mon, 01 Aug 2022 11:12:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:e82c:8cfb:9ffa:3c7c?
 ([2602:ae:1549:801:e82c:8cfb:9ffa:3c7c])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a656846000000b0041c04286010sm2848524pgt.83.2022.08.01.11.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:12:35 -0700 (PDT)
Message-ID: <4b014439-7390-6993-cbda-5d73ce22dd1b@linaro.org>
Date: Mon, 1 Aug 2022 11:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] icount: Take iothread lock when running QEMU
 timers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20220801164527.3134765-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220801164527.3134765-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 8/1/22 09:45, Peter Maydell wrote:
> The function icount_prepare_for_run() is called with the iothread
> unlocked, but it can call icount_notify_aio_contexts() which will
> run qemu timer handlers. Those are supposed to be run only with
> the iothread lock held, so take the lock while we do that.
> 
> Since icount mode runs everything on a single thread anyway,
> not holding the lock is likely mostly not going to introduce
> races, but it can cause us to trip over assertions that we
> do hold the lock, such as the one reported in issue 1130.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1130
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-icount.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

