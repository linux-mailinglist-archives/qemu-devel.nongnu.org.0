Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B238F354
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:52:43 +0200 (CEST)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFgw-0003WK-2p
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llFfx-0002es-UC
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:51:41 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llFfw-0005Ri-8W
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:51:41 -0400
Received: by mail-pg1-x533.google.com with SMTP id j12so20766353pgh.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+iM/mZqC3vDRAVXy+W3vr9ggqwvsV+yQE2nAq6xakyE=;
 b=kWePOUQiF/rOSFZMb7GX/1XaG6GzkH6cqpH/bRc+g7bWLGCnaJuzzKBIireY1z3y55
 SvjBCiZKzxnCNEmJ6ffy7anQ+0JXTKFIR4YFf2M2XBAAAH76iHD7hgLKf27JSQ2ZcqPo
 ITw2sHlVCSShhAm5MRncc/4IEU9YUSkbA2iRxN3NmsMQcm3xyDBMZZxGejo1IFHCjSf+
 E0aeaCD4Rud0TFxRW7ktuDVFXRoH/ThQoDsljgHpBSW3LM1D+T80Ex6ERR/oLuA5gvW9
 luZdyT7dfncLMfA10R5wnj3HCW5+Mun87fya8kUBkv4JtpKBbDwaoaEYetCkcsZapsA4
 gv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+iM/mZqC3vDRAVXy+W3vr9ggqwvsV+yQE2nAq6xakyE=;
 b=pY8lGPw5Ic3HY82ya2n38Q2cN/iTfaHKU+lRV2UumAFLyLKOQlTsNGCyGMnMnlvAq8
 T249szRFkcYNN+uklXrWzR2S9uSKUr7RwtJ4zttow6v7yMf/hUYxgnKBKBd5/psbDT0r
 jmS2C+MwySvU98phB8LIM5e9C1lQ/3YDPvhVJDgVc6AXL1Wy6z//w0P/uGJkHoMA2GZn
 rzsy5/txfQSlrObTOL6IjsrSUYNSG27XvVahrImhsReL/nfb65Q2kc+XMqnVUp2RNjXR
 RaXII696rVWy+BvqQhjcQqBftURK5L+Zh278Nd6s2+3gRWvCB+aXNP9dTibEdOHUOiGf
 WFwQ==
X-Gm-Message-State: AOAM5319Nr1FKWqTHR99+1C72rvbEJrwQfjpmT6/6yFVbjnEGDVM8Znn
 bCgx9Tmmp2jiiJRcOVHVuD+0ZA==
X-Google-Smtp-Source: ABdhPJzy/YSQ28EOvoR8HQcoxgogC1OSUreCnr23uBOnLLYFP3ZAkBJrFtXaiN4N4fvrbls1BA59Eg==
X-Received: by 2002:a63:a511:: with SMTP id n17mr15074030pgf.9.1621882298681; 
 Mon, 24 May 2021 11:51:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v14sm11571412pfi.25.2021.05.24.11.51.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 11:51:38 -0700 (PDT)
Subject: Re: [PATCH v5 23/23] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
 <20210517205025.3777947-24-matheus.ferst@eldorado.org.br>
 <ef3bb078-8afe-2159-f23d-0d8324c4e3f7@linaro.org>
 <bf00a04b-33b6-e067-ead9-e8707f186c02@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <720be115-3aad-f4bd-e636-5dab76478806@linaro.org>
Date: Mon, 24 May 2021 11:51:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bf00a04b-33b6-e067-ead9-e8707f186c02@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: lagarcia@br.ibm.com, luis.pires@eldorado.org.br, f4bug@amsat.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 10:25 AM, Matheus K. Ferst wrote:
> On 18/05/2021 07:12, Richard Henderson wrote:
>> On 5/17/21 3:50 PM, matheus.ferst@eldorado.org.br wrote:
>>> +    if(a->l && (ctx->insns_flags & PPC_64B)) {
>>
>> Space after IF.
>> > If I look back to the 6xx manual, I see
>>
>>    NOTE: If L = 1, the instruction form is invalid.
>>
>> The fact that we're allowing L=1 for ppc32 is an existing bug, afaics. We 
>> should fix that.
>>
>>
>> r~
> 
> The previous commit on this line in translate.c says that "on most 32bit CPUs 
> we should always treat the compare as 32bit compare, as the CPU will ignore the 
> L bit", so maybe it was intentional. Should we change it anyway?

The actual change of 36f48d9c78c is about NARROW_MODE, which is about the 
MSR.SF bit, and is correct.

The commit message mentions the e500mc specifically does check the L bit, and 
then hand-waves about the others not checking.  But the text I found in the 6xx 
manual says that one checks too.

I wonder if the IBM folk can shed any further light on this?


r~

