Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5EB4036CC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 11:21:04 +0200 (CEST)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtlP-0001a4-CY
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 05:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNtjj-0000dt-8e
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:19:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNtjh-0006UE-KP
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 05:19:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z4so2202704wrr.6
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zfkAKvckiHUBOnhbwSX7IQ1MbXNPzUdNaVKWFOa6Tu4=;
 b=TCdr/EALVfiBpf593ys2qhh5aTUx/y3TaGqIuaFKzU+zY1yNEGGx5vxMlSQCw/uYFN
 3T56O9oSnPPj9SZG/KqulpNfRdNOIDLESV2xbn1si4w0aU+EK8ppB9efGGgva+1TGMdi
 nySTNLz43UZzlBWAuWFn4VcolzLHLmB9vjWx6Gdf/wDUqK20ECumh5IFy/jLISFub90Q
 jmDzHyctXq5Yi9V/O3vMfYAJ0Huha+/VPKTFB0DPHnDWaR+w76kzJh+1F6VLN2SsTZia
 v9UWsZoYj73zLgMhKicspO4ea5tsZCOkUe+w2gBZ3uKQe9qRmTjXPBUSIyJ7DLIgrOEt
 bfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zfkAKvckiHUBOnhbwSX7IQ1MbXNPzUdNaVKWFOa6Tu4=;
 b=jPCbd+7323mP6tSmSTwWxW+CsjjahpJ+4Rqf/rEHuH2gBUS9opGq1lS+B+JTNDWqZy
 0TMy7vdopiQ4e8mcR6h/ejLy71ltS8vIuzeHvhTM0hYDVjNmzA2tdamThrQn8D6tXt+y
 2nU0bmZ1sKQhE0O7GtMXbSC7wDaQvN/SHB1ALrlHvcEbA3RyJynLcpyFzDhy7rhaB50P
 CMDhVvXuNn9wzrVgeXyFeW6/hG29huZ+k92aLy38eLEbez4kwW8VEnEU8Ac99Qtm3GOx
 3+6o8M4dtAOFGbpbngs+4Par1uGgAoQ+IhnYbENzx5AFEAMkwOrbPu2S5/HSmjf1wWtX
 W/NA==
X-Gm-Message-State: AOAM532ccEevn72Pz8k04knHGbo/kMCNADpNcZQ2SirtHaCtUKVWzz4Z
 efQleItNdEN6pj3rbHaD2tR4DA==
X-Google-Smtp-Source: ABdhPJzPWWtHdXNgwz3cM+z3XGZ8E5S+TXZswlpm5rsNaekBpLCBDVR/4hzXmfk4t+Lce26bR46m2A==
X-Received: by 2002:adf:ea90:: with SMTP id s16mr2830731wrm.235.1631092755991; 
 Wed, 08 Sep 2021 02:19:15 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id a9sm1048157wru.27.2021.09.08.02.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 02:19:15 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] linux-user/arm: Report SIGBUS and SIGSEGV correctly
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-5-richard.henderson@linaro.org>
 <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83aac1b9-35a9-bcdb-c424-6852cbb25305@linaro.org>
Date: Wed, 8 Sep 2021 11:19:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82iZptWmCcgonZvLTU4g+5nnEEQDdtHD5y=X7m82N1Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 3:31 PM, Peter Maydell wrote:
> Side note: for cases like this where we can tell MAPERR from
> ACCERR based on info the exception handler passes to us, should
> we prefer that or the "check the page flags" approach that
> force_sigsegv_for_addr() takes ?  I feel like the former is
> nicer, because in a multithreaded program some other thread
> might have changed whether the page is mapped between our taking
> the fault and getting here. But maybe that's always racy...

Both ways are racy.

After having played with SIGBUS, what I believe should happen is that we clean up the 
signal handling such that we can pass through the host MAPERR/ACCERR, remapping any fault 
address, after filtering the write-protect case that we care about.

I'm not sure how much effort it would be to do that.  Certainly the test matrix is pretty 
darn large.  But perhaps it would simplify the huge SIGBUS patch set, and thus make it all 
worthwhile.


r~

