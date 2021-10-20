Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5BC43565C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 01:17:11 +0200 (CEST)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKpa-0003qB-6f
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 19:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKin-0005cV-Eo
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:10:10 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKih-0003yp-6b
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 19:10:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso3534621pjw.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 16:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=soQvrgqh4ZNwE5RbI5gTgjb1JJ8xynfnRurxUIY0LXg=;
 b=ygVIBjSmXBgfKFhciPdPRRHgVSgq/bpYQqxopFlpgkriUzHPZHyS9JtZqtBwftYjrv
 zXCz05Ai6WQi2Ns3wswoywxALLEYXfSybp5Mv8Z0PxCKVLJaAhiPt4AfN0PXWDTEnEmx
 XWpiBJeWkrgnVBXN6bfqXdFmhgprfQCvuAJ/CFF2AFn6P7jwuG/pEO/x96fsKXcIQiNQ
 OpLZ43smfUZii91MDyWHhZXHdJTg+1kZ17DKOTWyeXNhMF+U8DgfcczfxJSefjlAxDBG
 SZHAP5gqm43pi9U55bzadA54r98tY3wC7TXCeIgjiIpq4bc/JuYG4Z5vR9qR71PXmr/d
 uUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=soQvrgqh4ZNwE5RbI5gTgjb1JJ8xynfnRurxUIY0LXg=;
 b=6A+F/GL5cZHIXh5IMozKtd8FVAUdjZrXlcNymrzOA/+jvkaxwt0g19lTRD44F8CEAQ
 YjXKcFIBO4sikBGYQXDD8Jj003KjlTRrQbUqAfWgqoPQ6h+Ak4g/53lCnNTvfkH+AwHN
 TwB1Z+J1el0AiVjbL6fjSO6XxHsWtUsuKAHI1dEiasrLR0z//GcmED8VhQvwurE/okfr
 wNwYNTuVs3mQ64vzfUJ5hGMQKk+ezHH7qg5C3hkdZ1cn8Y4lQuDdJNEDn3tAx78/BOL2
 qfaN+w1jYUXcGPPMr9T/SEc2P95xhonzVBrnu1B5Fzsk6dAm+9oubSbNV6fY6DNfca7o
 vs2Q==
X-Gm-Message-State: AOAM532BbTfLvBhRLHHZhn8voW6DoN9QReXOAq67jyK7fi/oY1uHx/Yb
 aaMi8QsGy0SqU6oGOh9JvfMjEA==
X-Google-Smtp-Source: ABdhPJypIYsQrkNeVoS+/PCzIlG4m5mwIRexfILFjU+eGzntSMFa2V+OQjwYV4cyZrVhzDjOoml6nw==
X-Received: by 2002:a17:90b:1c09:: with SMTP id
 oc9mr2203464pjb.33.1634771401556; 
 Wed, 20 Oct 2021 16:10:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v9sm3701916pfc.23.2021.10.20.16.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 16:10:01 -0700 (PDT)
Subject: Re: [PATCH v3 21/21] target/riscv: support for 128-bit satp
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-22-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3434f40-830b-f762-b1c5-55e10726271d@linaro.org>
Date: Wed, 20 Oct 2021 16:09:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-22-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> Support for a 128-bit satp. This is a bit more involved than necessary
> because we took the opportunity to increase the page size to 16kB, and
> change the page table geometry, which makes the page walk a bit more
> parametrizable (variables instead of defines).
> Note that is anyway a necessary step for the merging of the 32-bit and
> 64-bit riscv versions in a single executable.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu-param.h  |   9 +++-
>   target/riscv/cpu_bits.h   |  10 ++++
>   target/riscv/cpu_helper.c |  54 ++++++++++++++------
>   target/riscv/csr.c        | 105 ++++++++++++++++++++++++++++++++------
>   4 files changed, 144 insertions(+), 34 deletions(-)

Is there a spec for this?  I don't see anything in the 2021-10-06 draft...


r~

