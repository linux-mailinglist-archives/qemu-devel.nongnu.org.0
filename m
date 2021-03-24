Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2F3480F3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:51:33 +0100 (CET)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8bL-0007rd-Pk
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Qk-0007fT-DU
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:34 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Qi-0006tJ-MO
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:33 -0400
Received: by mail-oi1-x233.google.com with SMTP id c16so12955013oib.3
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xyfaVHaOdWdgmJX8owG5vZ6lAjLL/K625YKUWH7rLCM=;
 b=K6QBCcYIuR+wBc2Zom/KokoIMIi9iVFDny7J7sjNYFNt4pVCYkAUjZ3gkCLzyL8rCk
 wxFq2U2KATbrrjY5/KJUAqE5Mkss0dMeCm1qrVNkctzShZZdgfn1ns2Otg60SXdiHLNz
 7GB6EGWUPQByAngx/wMrvYqVGZmeUyx0+osBaEc8hrM94FMrwHrHs1EV4Voy+TdU8sc4
 iAx0bgI7mSdskHomjvFnIMMo3XU7thzUhxMNstRRxpdCxLAw/ojiXgZBLrH9TTxXt+g/
 mK9rzyPhBPtweeKVrtVTMVDdjFsKJHblxdGM/tttSRHbWNaCLw00ENMLb9ZYOK4bxOYX
 HA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xyfaVHaOdWdgmJX8owG5vZ6lAjLL/K625YKUWH7rLCM=;
 b=m6BmgI68R1FnbK/BUnW/JZIOTtwKv+i7UjGgQBWHO9wy3pdm1bOyJZRRNA1cSO4XpF
 TINOxW/dE3LXiZIozoMBrzmohnjw1EY0P8sivOo4Gwun1renMHnxnO39dlkgecpV1MGP
 nGDJaZBKTBw497qGHmP5aBqZ0y9rZVEl1H5fWW/Kmzjcpx2Zr4O2s1+hOLXZ0pE7r7ta
 UNyT8eVUyPoQJhDxVralpcykMcbRFW2tzcQrrdNM26P+d2tL2PYk8jGwHuPAIpb/UNuF
 SmyAgsXRH1FmKABJlI7Yf86quIXA/rSj+9DUEgiAh8DM10fuVGwmYB9o0Trg5dmbsxvk
 7ekA==
X-Gm-Message-State: AOAM530nZxSA3cAMffaGg0DlVfIWFb6O5MKNu7E9mxPm0Hlo9equ4O6j
 bKlT4vylrmpXvbc4gUiLEIx2Og==
X-Google-Smtp-Source: ABdhPJw0GyLGwkqG+qhh5CysMpNm+MCc0Gl+hMnbm5gE2Ym8tuXy0PnkhGm00W0qhgvkwKBqEgr+TA==
X-Received: by 2002:aca:e187:: with SMTP id y129mr3206960oig.62.1616611230656; 
 Wed, 24 Mar 2021 11:40:30 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id v1sm717840ooh.3.2021.03.24.11.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:40:30 -0700 (PDT)
Subject: Re: [RFC v11 13/55] target/arm: split cpregs from tcg/helper.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-6-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72ef93a3-d6b6-70a9-a4fd-aa679a7b780e@linaro.org>
Date: Wed, 24 Mar 2021 12:40:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-6-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:45 AM, Claudio Fontana wrote:
> give them their own common module cpregs.c, and an interface cpregs.h.
> Extract the raw cpustate list to its own module.
> This is more or less needed for KVM too.
> 
> For the tcg-specific registers, stuff them into tcg/cpregs.c
> 
> As a result, the monster that is tcg/helper.c is a bit less scary,
> and a lot of stuff is removed from cpu.h too, relegated to cpregs.h.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---

I would expect ARM_CP_* to move out of cpu.h.

I don't see any use of the ARMCPRegInfo typedef remaining in cpu.h.  Surely 
that should move to the new header.

Otherwise, it's really nice to get so many lines out of helper.c.


r~

