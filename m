Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D396E26BB
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:20:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLCx-00088R-K2; Fri, 14 Apr 2023 11:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnLCv-00088J-KD
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:19:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnLCt-0005o8-5Q
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:19:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e7so7807236wrc.12
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681485561; x=1684077561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=isUy9SRqz3ZTWUBLwfeCalsU/nkvKn/+OYkrD/ijyKw=;
 b=czXukWlxPjTMIyR3kjtC7zvIkNi1E8ItdeyojCIpaAtOIASHVLhHqpgAGO9t5HSvcw
 i6kMfkEG0RGzM7tsHWqEChim0jm7Y9CmMWZMbowpTomXyu8vCacbkOsttHaxLqGiZHgi
 /SuXcqaVNpUFqRKpEwuJROiNREOGBW4YcPauCyoWAdc/OnTv7nTcvb2QCDpfzJU2kc0X
 C/fdluMfnSMtebfpRUvUiK606/PKpMHqJMmar4dPuETzOGk5MVnWR4ii/8piyDBolG5w
 SEBht8xbzh/3lsU/G88087hiKsmhPCZOM9oYQvlUSu4gfg+5nYEXMrKCJwmythsG8nil
 SJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681485561; x=1684077561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=isUy9SRqz3ZTWUBLwfeCalsU/nkvKn/+OYkrD/ijyKw=;
 b=go4f7NBMZxU21a/7L5oWMRewJxlvNzR80i0qXh1VCsZXz/qrD48ao3TrEUicml0lMX
 Kw+Rj5Qav8d6XU7ha8ftYQOLSnyiQmfMwlFLzUbPLcUXT+VPCbDgqsp7pzfyeC0gRmLJ
 sPb7odvQVCo9AKJHScU0Q6VhUvqez/fWOstMVlYXcFcu+AK/vCI9A3GefRP+PhbwaAWk
 XBSYhsEQTHBzUzvacE2SGa4t/QQ/Oe1/a+i4RY3sVdN0obl/pEWGuz83dI2PCv7Jgk/n
 AQLRQf8y7VNwOGQZnINDUNDMKNMacFb3c3z3FtgDFBAEM8VFp0De1jg0vHQ2qEO402Nw
 APlg==
X-Gm-Message-State: AAQBX9f4VwONMBZVG8Dn4c5kFGaAxfyHp6ZFBMb3khoFAzGURSuAhWZD
 w1r1Xj8+zJ4N6vidy8oapSYp1g==
X-Google-Smtp-Source: AKy350ayGB8/0LVceNNP4TVSxd3W18kdczXPRkfPWQDKg4BVgFGCp/13TpEJc+b9BqT87OD6gFq8UQ==
X-Received: by 2002:adf:fdc5:0:b0:2db:9c64:f759 with SMTP id
 i5-20020adffdc5000000b002db9c64f759mr7827729wrs.1.1681485561541; 
 Fri, 14 Apr 2023 08:19:21 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a5d66ce000000b002f103ca90cdsm3769976wrw.101.2023.04.14.08.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:19:21 -0700 (PDT)
Message-ID: <f337c4f5-4a20-cc29-033c-c5766f9c96f6@linaro.org>
Date: Fri, 14 Apr 2023 17:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] target/i386: Fix exception classes for SSE/AVX
 instructions.
Content-Language: en-US
To: Ricky Zhou <ricky@rzhou.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20230212082812.55101-1-ricky@rzhou.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230212082812.55101-1-ricky@rzhou.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Ricky,

On 12/2/23 09:28, Ricky Zhou wrote:
> Fix the exception classes for some SSE/AVX instructions to match what is
> documented in the Intel manual.
> 
> Most of these changes have no functional effect on the behavior that
> qemu implements (primarily >= 16-byte memory alignment checks). For
> example, since qemu does not implement the AC flag, there is no
> difference in behavior between Exception Classes 4 and 5 for
> instructions where the SSE version only takes <16 byte memory operands.

Having this patch split in 2 (documentation first, logical change then)
would ease code review.

> There is one functional change:
> 
> Before this change, MOVNTPS and MOVNTPD were labeled as Exception Class
> 4 (only requiring alignment for legacy SSE instructions). This changes
> them to Exception Class 1 (always requiring memory alignment), as
> documented in the Intel manual.

This could be a 3rd patch.

> Signed-off-by: Ricky Zhou <ricky@rzhou.org>
> ---
>   target/i386/tcg/decode-new.c.inc | 79 ++++++++++++++++----------------
>   1 file changed, 40 insertions(+), 39 deletions(-)

Regards,

Phil.

