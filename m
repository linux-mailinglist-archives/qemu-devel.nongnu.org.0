Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88205F7BF6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:01:58 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqjW-0006wq-1S
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpQ8-0006rH-VL
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:37:56 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpQ0-0000Hi-0K
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:37:52 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso7524116pjf.5
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1+Lo3AC1nsFpB5DKHvmL7jrTlqjaFxxL7arLwBA6Apg=;
 b=Dl3nHAJMFyvlXrsYTy/L8UPy5ahqzVMihAzicyXqpeOj1cmwwo5xMHBkkuqIBLxGrP
 rzsdN8dpPVz6SV5oIg/M8s/Xl+whQ766daatvSy99CVxFY6qAhaPaGp73ipviGeJqYsb
 T7ZO99AgWEAIlgg3lYWSSg6HLRatJHZCAUbFLMiqRRWSLUzdax4Z8nMC9okEgWOmAcz8
 ML22pMMIu9doHOY7Kb7hdQkCLQmURpru9tNvGaC/+kHKbjApGCFqjaCTeN6aIbnuIqbI
 noC4IcaLoiAnwAkPF6Posq1anKfgMbMk1kCpO5XAv6HUXHq/WT/gnnuKA/UUfVpwNsZk
 9nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1+Lo3AC1nsFpB5DKHvmL7jrTlqjaFxxL7arLwBA6Apg=;
 b=fQQlBkeCfMsIHn9olBfsCMT6vB7/KXasLiQMGyGhCBxl4+50c+l7eXK7J0ifen+X6q
 tmFp9roMzX269aUwKMQIBHpjuM/tGUtFrMp0VI0xhTi5CBXKmkM8patYkD8BSWBAYtQe
 NKizJ04f1dl+SkZFYV8aHtK/yMo2+hrjwiriKD2tuWcKMDhYt8MjgpV5npzpIri3EJjJ
 TEqvkySbnA6k9wWSppauB5Y72L3KO2ksb/Kaqxi0EAH+jfQwTDTAjDSb/a4ZgOrRIjC9
 loCvOa5jioMUPITbpsEhHzYNfUanxTsYUmeNS/baRowt1bBRKnOlMooF0FrWY/FjLWmb
 1CzQ==
X-Gm-Message-State: ACrzQf3pNCLnHuqIJBZZlRmLr8opA3rvcP69CmxOhJuxIegY8Y3lzDA8
 jmddXBwaZmURbrXrfzKZKosWMA==
X-Google-Smtp-Source: AMsMyM6RIsbeoOK0dEUDUdcXCoYWWI8zcI3LVCAFFoxjnkMPU+Rsv3DUeG8YRvNKWgplLU2lRVQ7xA==
X-Received: by 2002:a17:90a:14e5:b0:20a:db09:a355 with SMTP id
 k92-20020a17090a14e500b0020adb09a355mr17764515pja.74.1665157061407; 
 Fri, 07 Oct 2022 08:37:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a17090a4a8e00b0020b092534fbsm1630627pjh.40.2022.10.07.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 08:37:40 -0700 (PDT)
Message-ID: <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
Date: Fri, 7 Oct 2022 08:37:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
 <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/22 02:24, Peter Maydell wrote:
>> +        .ha = ha,
>> +        .hd = ha & hd,
> 
> This is a bitwise operation on two bools, should be && ?

Bitwise works fine, but I can use boolean if you like.

I'd be surprised (and filing a missed optimization bug) if the compiler treated these two 
operations differently in this case (simple bool operands with no side effects).


r~

