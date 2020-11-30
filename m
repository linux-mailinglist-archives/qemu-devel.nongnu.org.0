Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0902C8CBB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:27:54 +0100 (CET)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjntx-0008RT-BU
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnqE-0005IN-Lx
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:24:02 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnqD-0001oR-0E
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:24:02 -0500
Received: by mail-ot1-x341.google.com with SMTP id l36so12262042ota.4
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 10:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bmbgqm2sxaPFmc3SrTSdSTiiT9fIJvaEkJAHvdpS2k4=;
 b=xQweJbS7xjoL3rdKn0XkLRsarxm6JWsHisj9E5Nqf5PWgA8kYdGQoWub0s+y8OPSJV
 mGAdXY5fZ+9u9B1sud35Zau4OtvK42WL3rqwnRy309MaZb/5v0w14LAaMdnm2xfhV3Vh
 fL3WdUYgqnaWB+vuR7ZgIVP3bz18xiU2zgYEXs247WjLub+8hoybUjk0zknRnfxPsghZ
 v/zgu0rxSddeVQPXypreakfOxP47bGDHA2ZR6GpPSN6Ym9rPkgjgrPC+enebskCu0PgM
 VjVzzbPYB+UgfqEmLGZnvT1D6pCGg6lW4wQxen/hKcxOqAlvIf/d9B5b8zrDQT3kp2zl
 1efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmbgqm2sxaPFmc3SrTSdSTiiT9fIJvaEkJAHvdpS2k4=;
 b=Fhf6HA8PemdRp1bBEMmp3wVYkC2pZt7Lqf7GCJvC3GvtAzlMqaRIwaIlOCfKRLrXni
 YnIhI0Cxmpk2jolv2xt574N+bMw9Yei01iuD0HDlQBOzEt/fMXvbYy1U45Dlh+fpYKhJ
 QVyvZV6tyrAYA3wNEIKEVWoloBhYhoD2d6I8F21J9/ZXShJ9/PoDmTlNxHf0MaAvHd2m
 7cP4N4VAyyRonlMtyEhI8tDUXNChQ9HYq5NW5ll6kla6quMoNlvIevTOApJO201/LVzR
 vcWwAzbHsZNg8r6/ZdWk4MmVPX/iM/N7pGsXw+WoOSKCF44LveR8KqeyWJCdMT/+1glr
 cYkQ==
X-Gm-Message-State: AOAM533UNqHPUGxW2UtLelfhzqowM3r44OHL5IHCF6AdzI/0VspGbsjY
 khQmNvV6fUBSjOaM61RVSLQKSg==
X-Google-Smtp-Source: ABdhPJyagivMqHItmISsw8rS3ZKeSydpBMIP741XB74NHmQPkNJP7r7g1txMOKBmL27oSu4sDTWj2g==
X-Received: by 2002:a05:6830:1518:: with SMTP id
 k24mr18860652otp.366.1606760639659; 
 Mon, 30 Nov 2020 10:23:59 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id t19sm9268944otp.51.2020.11.30.10.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:23:58 -0800 (PST)
Subject: Re: [PATCH 1/4] hw/core/loader.c: Track last-seen ROM in
 rom_check_and_register_reset()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201129203923.10622-1-peter.maydell@linaro.org>
 <20201129203923.10622-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ccf1e36e-f6d5-28e6-c90e-40927723f842@linaro.org>
Date: Mon, 30 Nov 2020 12:23:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201129203923.10622-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/20 2:39 PM, Peter Maydell wrote:
> In rom_check_and_register_reset() we detect overlaps by looking at
> whether the ROM blob we're currently examining is in the same address
> space and starts before the previous ROM blob ends.  (This works
> because the ROM list is kept sorted in order by AddressSpace and then
> by address.)
> 
> Instead of keeping the AddressSpace and last address of the previous ROM
> blob in local variables, just keep a pointer to it.
> 
> This will allow us to print more useful information when we do detect
> an overlap.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/core/loader.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


