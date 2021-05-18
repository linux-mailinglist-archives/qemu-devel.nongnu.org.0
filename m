Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A1387710
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:03:12 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixVH-0006bo-Q4
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lixRf-000412-BB
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:59:31 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lixRb-00047A-Rg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:59:27 -0400
Received: by mail-vk1-xa35.google.com with SMTP id q143so1960280vkb.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p/m16b10s/J45cmqxS7SsHfj9o8h22NlShHW3nwoLWI=;
 b=P4fUwGjk3k7stjLdif957tKqjRW7GdK1Ba/jiQf0hG+5gl+p9M5jr6JRmAGq+vlWsR
 mmBSudth2d3jOsF9XPY8quwP0iYVZgPR2om7J+qIW6IERRm2C8tffOmqfp+PGpFpiEu8
 bDjUfmrrq8WQff1hACRCcdDwzzzBYysVkEGQ5tgKVYFmMaaSwfgm7sIZGXbRHsNNrhUN
 FMT3L14f26q27j5hArgCLivGMxTLhNpK52nUthajC0jlgwQp0tuUCOJbb1ySuboz/9ET
 vtgZgeUjjrkWRX2sDtg8sMK/LTu8MGT87gzQ845dUACgsyym2XChb20NiVzZ39nb0xXl
 gVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p/m16b10s/J45cmqxS7SsHfj9o8h22NlShHW3nwoLWI=;
 b=UBes3cKxXqVPNq3Fd5loLA13fd2ac3e7f1X/Jrpvo4AnhNUK+nnDbkvt8kx2Yv3DRn
 XfYx+Maok3xNk0yGz+kFyf5IdCO9RZCU+2nua7H9iSbGlkNawzc9MBRGShlEnxivlGjG
 aCuOnZX3iYC/w7wZI9a7Xkxqq63xnsoNxcmbGtCgEWUA0982+T7T5hiaI5ipZZkXQ99t
 6C+lzWlpnet2EkLWHyPDmaz+l4WS6iVDu8TlScL8C++HlVdC9L1i+PTEsa268qeJZl5g
 bMBF9QNYUcnRRh8IqzQHYHSTaglFCcTCrNtCYr8zYwpTGwRrQ5smsWfKIbE9US8QAqJS
 3Q+w==
X-Gm-Message-State: AOAM531x7/gmI2wX4l6PCwsglXcdy+kmGyGOZveK1hwPQkLzlJq68JNr
 04iTCYlwu6CJSLsOWf52LQExcg==
X-Google-Smtp-Source: ABdhPJzEdjAF6Q1R1VaX8WhgYxcMZO6IarR9jOE3ZQ0i4auUg/JC6j2XpbhbRUz3TMk0wN/UjhGHMA==
X-Received: by 2002:a1f:ae94:: with SMTP id x142mr5060486vke.12.1621335560959; 
 Tue, 18 May 2021 03:59:20 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id x2sm2949361uar.12.2021.05.18.03.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:59:20 -0700 (PDT)
Subject: Re: [PATCH v2 00/50] target/i386 translate cleanups
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <81278bdc-ba3f-4902-f8b5-0b75ff423318@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed338eb5-9a30-8a2b-41a0-1597b8bed0d0@linaro.org>
Date: Tue, 18 May 2021 05:59:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <81278bdc-ba3f-4902-f8b5-0b75ff423318@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa35.google.com
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/21 5:31 AM, Paolo Bonzini wrote:
> On 14/05/21 17:12, Richard Henderson wrote:
>> Supercedes: 20210228232321.322053-1-richard.henderson@linaro.org
>> ("i386 cleanup part 3")
>>
>> Claudio's prerequite patch set ("i386 cleanup part 2"), is now merged.
>> Version 2 here fixes some minor rebase conflicts that crept in.
>> Only 4 of the 50 patches have been reviewed.
>>
>> Blurb from v1:
>> This started out to address a fixme in Claudio's patch set, then
>> wandered a bit, with cleanups and bug fixes in the code that I was
>> touching.  I stopped when I reached my original goal of removing
>> target/i386/tcg/user/*_stubs.c.
>>
>> There are a lot of patches, but hopefully they're all small
>> enough to be obvious.
> 
> Nice, thanks.  I only left minor comments on 27 and 30, feel free to do a pull 
> request without v3.

Shall I take your comments then as "... Otherwise, R-B"?
Because you didn't actually give them for those two, and they're the only two 
without r-b tags.

You treated patch 49 similarly, but that one already had Phil's r-b.


r~

