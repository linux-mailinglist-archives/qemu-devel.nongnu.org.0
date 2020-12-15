Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81BE2DB72D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:50:58 +0100 (CET)
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpK5p-0002bS-Ag
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpK3U-0001Wh-17
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:48:32 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:36783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpK3R-0002uH-HN
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:48:31 -0500
Received: by mail-ed1-x541.google.com with SMTP id b2so22940956edm.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QTlCH+KTC9pM4843RwYbGGPtfN8d89vbmF2KKIGX+ws=;
 b=caCwMa2iz/8L9GhAS7SVTMI2+TFOdrSnRRRYKpjsjbdLKm9+2whA6tcWFPcbSGkrjQ
 NKILjO3GKoSpM9NfFXb5wdtoJKV5hFp8R5lQe3t+s3jr5QPB1MccqqYmII4U6s5vHbsN
 9QF0vGuMgZ41zqWP3CCXBMtUHW6eKP4/HEM3Z7ebniQf0CyIqwx+gcAqJ/pWalA3GOtW
 G5LGKK3DYI0CEZd4FWgqGgvbVoNn2v8D3FQd7sULKqlh6sG+x/0Wk95Y9mHmyeJoMClY
 QJMtVDWLXYMLKNTDF1Qk01z/Com9AS4w/En8H+9N3wON4TjUFrIpxQ9XvPZNcKf3/uoj
 Vnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QTlCH+KTC9pM4843RwYbGGPtfN8d89vbmF2KKIGX+ws=;
 b=oBr+tSdsMdAp1+7LCf8aig+KokHxvx1UEw/ruXovB7EI7EtQyoSf9M9YRsc6/j26A2
 q7fGt2LlAl7I9uYH+mDLsmXMc9YTbgUGftNzrzKrkyfA27rySrNG0KODEN0lEiBWoK0o
 LeNG/TXI2ZwzNtbmHblx3DJFKmuMFlJaymB1uW9t2M4mNcrk6Fda1mpholp5cvLrz/8p
 iXbWmLYC2RKgZqKq9Y72viB7HLqUrhIEWZcnJ7Oz8plvdiA9shBosDSVdDqrbBr+cYrY
 kbO8dW7ue6M3Pv/Shh6hzBnlXObrPv58TCWgiWK5Oq7m8R/llTEug8foWbX6CazrxzKn
 a+zQ==
X-Gm-Message-State: AOAM531cfWr9lAdVQBAsHvfIjJqkrLpkj1Qcq35isAf0yWvHJNnPpKRb
 0KfRHTWYofkjMiZUeL+gmRY=
X-Google-Smtp-Source: ABdhPJyycqajtpR0u0zAS4YPV//nqbyq7wvRYDlBZfxN8AXs/Ttn9RMKbcmDvyro77glBbzhVsDVpw==
X-Received: by 2002:a05:6402:1593:: with SMTP id
 c19mr15929679edv.269.1608076107939; 
 Tue, 15 Dec 2020 15:48:27 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id w10sm43285ejq.121.2020.12.15.15.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:48:27 -0800 (PST)
Subject: Re: [PATCH v2 03/24] target/mips/cpu: Introduce isa_rel6_available()
 helper
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-4-f4bug@amsat.org>
 <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <40e8df0f-01ab-6693-785b-257b8d3144bf@amsat.org>
Date: Wed, 16 Dec 2020 00:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <508441db-8748-1b55-5f39-e6a778c0bdc0@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 12:27 AM, Richard Henderson wrote:
> On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
>> +bool isa_rel6_available(const CPUMIPSState *env)
>> +{
>> +    if (TARGET_LONG_BITS == 64) {
>> +        return cpu_supports_isa(env, ISA_MIPS64R6);
>> +    }
>> +    return cpu_supports_isa(env, ISA_MIPS32R6);
>> +}
> 
> So... does qemu-system-mips64 support 32-bit cpus?

Well... TBH I never tested it :S It looks the TCG code
is compiled with 64-bit TL registers, the machine address
space is 64-bit regardless the CPU, and I see various
#ifdef MIPS64 code that look dubious with 32-bit CPU.

> 
> If so, this needs to be written
> 
>   if (TARGET_LONG_BITS == 64 && cpu_supports_isa(...)) {
>     return true;
>   }
> 
> Otherwise, this will return false for a mips32r6 cpu.

I see. Rel6 is new to me, so I'll have to look at the ISA
manuals before returning to this thread with an answer.

Thanks for reviewing the series!

Phil.

