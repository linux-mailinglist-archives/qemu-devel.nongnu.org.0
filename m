Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9F944BDFC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 10:46:19 +0100 (CET)
Received: from localhost ([::1]:54078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkBO-0000CU-N8
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 04:46:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkAA-0007yH-GF
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:45:02 -0500
Received: from [2a00:1450:4864:20::42a] (port=35347
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkkA8-0006SY-Fa
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 04:45:02 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i5so2941082wrb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 01:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GwApjZ3oHZAQC7bR3piBPE+VnBGrKBws4siprm99CwY=;
 b=TxBmBfL6RXpN7oegJftFmD99bN+A4byVezHQCLDt9xq2nDoWEdw5IriIJRQNwp9Wze
 c3LQUBkpPb+NZmsacS96kZp4X8PQ4vVFbpkPv/TvUkAjoo2739CKlzzFGL9+DL0ItfYL
 ZEKF+isG+tCtuvEBjUqZ3Ea3w1A0glhoFNKBD7JUGb0IULkM8Xaars6unAt5mrMuJcL0
 SUmHzwmW8v2iLbaccGbfhh75AkZ8UsQfXXnTGY+eQk4youZxAMsOERxzuxJqo/KPTzaq
 KelolWL15wWtaryCz18igr7E71p74pGEAKzOcmdPhyjB0cQ3IQJkjjDUOC8SThkpeslK
 guYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GwApjZ3oHZAQC7bR3piBPE+VnBGrKBws4siprm99CwY=;
 b=LXXgXgmvsvFhggQo44zEl69R0l4p67G2xji1Bdk2GNcs78NuwnNlRtgV89K80nrNCz
 B8RE46xyW1D3RxwJrJ3HxYqWZuIOPQBpOKSj/pC4JuD+UHiMV92vKVvxXms3qNDzIC4S
 KlYLZ8rZ6Cz6TV6n7ndjW7gF++asAQjn59aJR8iRmIv5ykKBzkfMM/I4ZzPcEraVU20O
 y9NdJEhJpmxWrgRZ2Z9Tz/U5/P46UyHOjoqXQqmiVvz/psBOk/nVePoR5ikcA9W4+oME
 6cYTmCpVtmAPtuTsj2/dpH+FVHA2gEsIG/6IxIujfM5kag1HCvvqU/pYNwA+GXkGH3c1
 KyyA==
X-Gm-Message-State: AOAM532oA1JR9V078CjeKlmp/zl5VdLr8T4Q1Nei2IlL3blmrRvNi/gP
 mrnoijspoSPvlfKS8nhpoqQVLA==
X-Google-Smtp-Source: ABdhPJw54IMMiPrDkI+B8HqY9oKUdbzbNAsrHvaRFqnZkgzF3frUsIPYEzC2RqWGMSGS1h1hLKGQnw==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr17666323wrr.228.1636537499093; 
 Wed, 10 Nov 2021 01:44:59 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id i15sm5016768wmb.20.2021.11.10.01.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 01:44:58 -0800 (PST)
Subject: Re: [PATCH v4 1/2] rcu: Introduce force_rcu notifier
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20211109183523.47726-1-groug@kaod.org>
 <20211109183523.47726-2-groug@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3599a3e1-3bef-9869-0bcf-e89402e0f7d4@linaro.org>
Date: Wed, 10 Nov 2021 10:44:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109183523.47726-2-groug@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 7:35 PM, Greg Kurz wrote:
> The drain_rcu_call() function can be blocked as long as an RCU reader
> stays in a read-side critical section. This is typically what happens
> when a TCG vCPU is executing a busy loop. It can deadlock the QEMU
> monitor as reported inhttps://gitlab.com/qemu-project/qemu/-/issues/650  .
> 
> This can be avoided by allowing drain_rcu_call() to enforce an RCU grace
> period. Since each reader might need to do specific actions to end a
> read-side critical section, do it with notifiers.
> 
> Prepare ground for this by adding a notifier list to the RCU reader
> struct and use it in wait_for_readers() if drain_rcu_call() is in
> progress. An API is added for readers to register their notifiers.
> 
> This is largely based on a draft from Paolo Bonzini.
> 
> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Greg Kurz<groug@kaod.org>
> ---
>   include/qemu/rcu.h | 15 +++++++++++++++
>   util/rcu.c         | 19 +++++++++++++++++++
>   2 files changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

