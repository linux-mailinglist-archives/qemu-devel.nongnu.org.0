Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2BF3F0A3F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 19:27:25 +0200 (CEST)
Received: from localhost ([::1]:46212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGPLY-0002dV-5U
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 13:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPJu-0000of-NK
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:25:42 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPJs-0003iM-Ta
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:25:42 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y11so2837531pfl.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZxgR67DIYyQNe+oRPrii1gRuatgPOHMfnNBIb5QVb38=;
 b=FaWj3LHjLyUF6G36vzbUX/QXEyRQ/Qx/cx7UCiRaa6JEbPFj3QrHG0z4xqf4CQayDJ
 TW3uzO/CBGETsWqGNeFSZYJfWUfiNR+caL5UyyFiZGY+CFxAyclf3fdAFPwxJr/5/HCF
 6Wb8DcpLGCbzT4UfGQMlytId+Gjp+ntAOq10U0ey2Y/iakjRggvXCsOKUR52ss/l+/IY
 uNdVR0yB6Y2ivPkr+c0ZF+gurPYIAafnrSOlSBeKHnqScLpO/kEVhHrFScdyk3eEZPcS
 juKkAizyhuWzdTslzAKuuOJ7OdJsH2ydCTPddetf9iTryzmO0dxpo3p3ckhRRxkeW9/1
 xxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZxgR67DIYyQNe+oRPrii1gRuatgPOHMfnNBIb5QVb38=;
 b=EnAaUSnfpJZPgeKYTdc5r1BIk0BwoedLLfMU5YS3Y0mQFfa08lJ/5xsOzCP6hoifg9
 6M6e0jmUuikmCcCeespP0Zq8lKWxlIm7jONOMMpxUsUR7G78pJY47g7ZN9/1R3YLGHei
 o0Cr1R8cYFaXHMizb/00NwntiHu2qM9LnDvUJC2Nmy1cDSsSOqzr1BLsHaYMISPBO8hR
 Za0jbpNKszZ5kSu2xOioCnhLXzB5L1tGDnbxMW/WdduekSM0dKEme0Ts+fF11WWpoJG5
 0PmQnabOe4Zy76BTmTXxKpLtapaF7Erx/biufzvXJ+BhIpDpvbsTWStbZCqRQFWtLCcM
 TNdg==
X-Gm-Message-State: AOAM532cpJ7uV+lWlE1CFY6gZ4/7Gt8VryiuxbCpNCDvkjFFjKOecUqF
 iqjU10wrZYRucfAQ7gc9blz5Tg==
X-Google-Smtp-Source: ABdhPJxLxOI9tMEa71BpHbnDx9HZ0OfC365I1maJZYs/HhtL9JpB603fF54oYMpkebJsIqDiO7qR9w==
X-Received: by 2002:a63:164e:: with SMTP id 14mr9788118pgw.246.1629307539539; 
 Wed, 18 Aug 2021 10:25:39 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id m7sm329514pfc.212.2021.08.18.10.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:25:39 -0700 (PDT)
Subject: Re: [PATCH 5/5] target/mips: Replace TARGET_WORDS_BIGENDIAN by
 cpu_is_bigendian()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818164321.2474534-1-f4bug@amsat.org>
 <20210818164321.2474534-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c11b7d9-54ce-5183-b0fd-4d3eb5886a2d@linaro.org>
Date: Wed, 18 Aug 2021 07:25:35 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818164321.2474534-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 6:43 AM, Philippe Mathieu-Daudé wrote:
> Add the inlined cpu_is_bigendian() function in "translate.h".
> 
> Replace the TARGET_WORDS_BIGENDIAN #ifdef'ry by calls to
> cpu_is_bigendian().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.h              |  5 ++
>   target/mips/tcg/translate.c              | 70 ++++++++++++------------
>   target/mips/tcg/nanomips_translate.c.inc | 20 +++----
>   3 files changed, 50 insertions(+), 45 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

