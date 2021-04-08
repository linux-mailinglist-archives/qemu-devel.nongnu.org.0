Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F5A358D36
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:04:27 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUZx3-0004Xi-HU
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZv5-0003iR-Pv
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:02:23 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZv3-00015U-Fi
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:02:23 -0400
Received: by mail-pg1-x534.google.com with SMTP id w10so2067166pgh.5
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/RC2woicAhT9BeFgGt8wkGTSLl8M2IlnXee/9V1qwgg=;
 b=cb1cvbIgP3K5xjK+nWLFaet4GCziKVElnHcDQzBzOGgEQHKeUDSugN10Iqi6etfqp9
 0TkgrmcRXGPFaKMZXYQxi/peo9iXlqVIAGj5tZQXSEOHfQqNTpnjA6wXhDhZKhxIIGqO
 ogs/zrTXsouAdPEcgwkB7jEPDnQ85rO040wWaBFhBcqUhXL75gnyCsAf0d8zd9be6otb
 GeevuZWDzO0g+HfhB9LCV6cGulS84/Iql7LMshFBl9ithwqRDLy5oe2KKOYK8e3/E3T3
 lJ9JjCScW4eHIc66CY5iBFnVKpUtIKtRuVjw9qXDXG6IKHXoDyB3sIoNBGLSZKCXrCKt
 gs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/RC2woicAhT9BeFgGt8wkGTSLl8M2IlnXee/9V1qwgg=;
 b=Um832nB9Otac+0Y1BTJ/r8gQpEWutSVQsqmbmy7dQwYG9EYXIxY9zVBSXT4huuywY1
 MK1Bxch7C6r4SgG2EtsCAsg6L0W042dPgv0wLsLRvpCpOZt/rI6CnE7RUrKm6PtCttoP
 YNPbvRHHQFH/3wNDwNvEbA367lj9Q8/yK/tDHSwONlqB/Lq5NNrhzMxH9wh3PYJl5eoX
 be+HoxOA1gPN5t0YczCZXwEMKzKUsaD+f3pYhR1BEV6nuktfEScRjlN3nnXzWEsa3QVD
 Mz7bKmjEOnb1O4Z+z56blfn8udhmmRE+Mj7K1TsL1jKQ5hAhafwkQjk9AgRsBZ6LzosY
 0rNw==
X-Gm-Message-State: AOAM532wgvzNr2XQmKEoWOP1ansgivJMDsn+YInPPuwK0zJ1sH6jkbhm
 O1vVKzrVT4alaebZoX55sK/bb2rlUyygIw==
X-Google-Smtp-Source: ABdhPJzdfOpIzGzdo7PRFTQA/ZTozbgDmnkofIbi02oORLpGsW0JVXKL6FLFuBPzh63z2Jiid2jXyQ==
X-Received: by 2002:a63:ed49:: with SMTP id m9mr9427606pgk.323.1617908539679; 
 Thu, 08 Apr 2021 12:02:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j13sm199211pfn.103.2021.04.08.12.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:02:19 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make Thumb store insns UNDEF for Rn==1111
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210408162402.5822-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <547fbc49-7dbd-e250-69e9-1188b85f668a@linaro.org>
Date: Thu, 8 Apr 2021 12:02:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408162402.5822-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 9:24 AM, Peter Maydell wrote:
> The Arm ARM specifies that for Thumb encodings of the various plain
> store insns, if the Rn field is 1111 then we must UNDEF.  This is
> different from the Arm encodings, where this case is either
> UNPREDICTABLE or has well-defined behaviour.  The exclusive stores,
> store-release and STRD do not have this UNDEF case for any encoding.
> 
> Enforce the UNDEF for this case in the Thumb plain store insns.
> 
> Fixes:https://bugs.launchpad.net/qemu/+bug/1922887
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

