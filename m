Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7BF34D515
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 18:28:04 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQukF-0002gj-9c
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 12:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQuiR-0001az-B9
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:26:13 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:40836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQuiN-0002JO-W3
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 12:26:10 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so12812507otb.7
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GujYloxBFoV0DwL4NOeWCvb58u0Kvk/iBDxwL4/fSz8=;
 b=wwY9jxkxKBED0oyJgCSUXjjKM0GOA0DLZq5iWgbeYurQXNlLRat0uWu5y6FRFjAOKA
 3rN8JOLNS2ftWx8etDFFqT+zjVi49X0XjWpeVAjbg/exSaDHLOY8nw9tsGmrBw5Kg6Yf
 /EePXGtaN+uAGKUE6u5pf2ZxHlbJ10lqdSaQcQoMbU0ZnQk7Q+W+A/Z3WzEe8YAVcPe3
 ZdbKCsKGcRhJExuqCz23sQJScIvZBMWaAwIOqJYvTBbfn9OH2p1TH9jR9e2Z8tQ13+IL
 ssj93ikg4FbwdcrmT4OpabQ9kXoP7POyLke9TamQwBh6i/McKa6qwvyg+oo43iM75m+f
 v+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GujYloxBFoV0DwL4NOeWCvb58u0Kvk/iBDxwL4/fSz8=;
 b=JH6RqonSAA+jCTb8RPPxYl/eFIDPMi/ZJDwPql/WJkl7NrSGKBzoKYchZ0APh5HNc/
 BJihjskq+0/9tWDIMKmxL6bpKEZ96uzAqG9bjYpxKTcJ2GbGjNYRXXzfROyEiQFGTM+w
 xIM6fvbUUsWwtPGIPTKUcjloHsMi+c6G6j9i7gNOnfbpOdqDb4JHyRuB/namP+gRXMrS
 vKIn8FSUtUo1+8XaK2eH/RYPMr3GOdSupW4irSqfRN69Hv5b6JPHsqWlLRSL6CJBvkU2
 oYw21//xRMs1/eOmfMyHxpWZhiyPrhPXD2peZ5VTtI/VlEVtJ7eQy0ZbhFQWzyfTGyb8
 rjZQ==
X-Gm-Message-State: AOAM532l2OCdYJp0DRQpXWf1J9TG1iZsan/RdiWnE36DfryLpqaKqUe2
 gLI4V6c7D/uvZG/oXnDF3IWCxvLXXRCf0N+l
X-Google-Smtp-Source: ABdhPJwX6FkRqwHieEcc5ReLdpkA3zgLLFEHEyI4nn4ZKnv4tD+bQcoBE1DiQgPA1jFQCzXJl3/M2A==
X-Received: by 2002:a9d:2f65:: with SMTP id h92mr23326168otb.327.1617035165071; 
 Mon, 29 Mar 2021 09:26:05 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 10sm3151614otq.10.2021.03.29.09.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 09:26:04 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box> <20210329150522.1b00607d@bahia.lan>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
Date: Mon, 29 Mar 2021 10:26:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329150522.1b00607d@bahia.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 7:05 AM, Greg Kurz wrote:
> On Wed, 24 Mar 2021 11:03:02 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
>> On Tue, Mar 23, 2021 at 12:43:32PM -0600, Richard Henderson wrote:
>>> Copying flags directly from msr has drawbacks: (1) msr bits
>>> mean different things per cpu, (2) msr has 64 bits on 64 cpus
>>> while tb->flags has only 32 bits.
>>>
>>> Create a enum to define these bits.  Document the origin of each bit
>>> and validate those bits that must match MSR.  This fixes the
>>> truncation of env->hflags to tb->flags, because we no longer
>>> have hflags bits set above bit 31.
>>>
>>> Most of the code in ppc_tr_init_disas_context is moved over to
>>> hreg_compute_hflags.  Some of it is simple extractions from msr,
>>> some requires examining other cpu flags.  Anything that is moved
>>> becomes a simple extract from hflags in ppc_tr_init_disas_context.
>>>
>>> Several existing bugs are left in ppc_tr_init_disas_context, where
>>> additional changes are required -- to be addressed in future patches.
>>>
>>> Remove a broken #if 0 block.
>>>
>>> Reported-by: Ivan Warren <ivan@vmfacility.fr>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> Applied to ppc-for-6.0.
>>
> 
> FYI I can consistently reproduce locally on my laptop an error I'm also
> seeing in CI.
> 
> $ ./configure --target-list=ppc64abi32-linux-user && make -j all && make check-tcg
> ...
>    TEST    threadcount on ppc64abi32
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> 
> Bisect led to this commit in ppc-for-6.0

Any more details?  Because this works for me.


r~

