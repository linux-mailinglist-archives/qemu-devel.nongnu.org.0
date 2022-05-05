Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E251C0B6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 15:30:20 +0200 (CEST)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmbYh-0006Eh-6h
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 09:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmbWT-0004oy-3i
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:28:01 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nmbWR-0002QN-HP
 for qemu-devel@nongnu.org; Thu, 05 May 2022 09:28:00 -0400
Received: by mail-ej1-x633.google.com with SMTP id i19so8717621eja.11
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 06:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6d2mIPCsCncu0QoXLrkQobkWIMpx5CxUrLtfjW+3E2s=;
 b=DCEvKOvU8mUnC0mBqygW4u781pL5x0gkmCzMKMA4dDdJzUx5UIjUfLvn3xn65xOuO9
 IKwt44p7TegkcuPicIjr+OxlQh8q57a5Ah/nIkxYjDOEGskgNYvj5ezDBGBBu+we3zjJ
 zAJWENhXIORf6ugbFidzjN3eOTwBvzZFOo8Dyvy3MfxLmUi6W27qvY2H04LLv/0vjNjF
 5ffDzMJwM2Y3voNmiKnJrsE5c8qKLxOweVVl6zqeyftg3nLT8Cqzpu+rxgjyN5e2bbM7
 VXMv9iGnffXG9y84zpvoF5Qy4F48YltIcFzDA2zPrfHZb0LrxmydmtaWNBQ9q4eY4FVz
 phRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6d2mIPCsCncu0QoXLrkQobkWIMpx5CxUrLtfjW+3E2s=;
 b=uVHVUzMvb1hh9ryg0mDqRbMj/bT5LNS3oPveMZvw94PwF0/IwzTDDhp9cclKz8XlZD
 A/16hBZU53vYn3Rwh3GEX0kCt6Dd5wiVSPYEKy7+i9GUQOn8Crbk+0z9jT4rgknDrogt
 UkUlvTMHqwTfqctpm1ZvMW5RRrroF+yraoKGtl1cWa3ia7KQvujx69LuPG3npmc/xszG
 ef7IyZpClDOx/p0VJg0gl8FyJsjnUtAj2aptOSZxYUm6qTNe4MmVtHgRGAY+DwkFjD9g
 bUo7wrLMiY/8XMb6WgaxwP991JvnKDuabfAYUFURvsIQU14ghPBV/pLdcxBTL78/V4Cg
 EiDw==
X-Gm-Message-State: AOAM533NAHRhgskO1Kqxa/QjNDTmu3kRIQBzpGWt9pulchMHDsxUvYKC
 v/03xiqu/zRkY63Jb3YkHK8=
X-Google-Smtp-Source: ABdhPJzc1GpGWcsWkdt6wm7nhI+/dVLrENSXXjz3YVXaJ4jGy1g+/fKdei7yItRujCT6h8/Ry/KYuA==
X-Received: by 2002:a17:907:6ea5:b0:6ef:f593:5cce with SMTP id
 sh37-20020a1709076ea500b006eff5935ccemr25444091ejc.182.1651757278040; 
 Thu, 05 May 2022 06:27:58 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 e15-20020a50e44f000000b0042617ba63c7sm847405edm.81.2022.05.05.06.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:27:57 -0700 (PDT)
Message-ID: <f8cff216-de53-c789-6aa3-b0a23523fb5f@redhat.com>
Date: Thu, 5 May 2022 15:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: longpeng2@huawei.com, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
References: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
 <YnOiRPrLkfjoPbU+@stefanha-x1.localdomain> <YnPGoOlV0CykrKwm@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YnPGoOlV0CykrKwm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/5/22 14:44, Daniel P. Berrangé wrote:
>> util/thread-pool.c uses qemu_sem_*() to notify worker threads when work
>> becomes available. It makes sense that this operation is
>> performance-critical and that's why the benchmark regressed.
>
> Doh, I questioned whether the change would have a performance impact,
> and it wasn't thought to be used in perf critical places

The expectation was that there would be no contention and thus no 
overhead because of the pool->lock that exists anyway, but that was 
optimistic.

Lukáš, can you run a benchmark with this condvar implementation that was 
suggested by Stefan:

https://lore.kernel.org/qemu-devel/20220505131346.823941-1-pbonzini@redhat.com/raw

?

If it still regresses, we can either revert the patch or look at a 
different implementation (even getting rid of the global queue is an 
option).

Thanks,

Paolo

