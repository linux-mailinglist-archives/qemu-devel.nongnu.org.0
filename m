Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8A8366365
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:37:29 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1o1-0007vM-0U
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1me-0006w7-MP
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:36:04 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1md-0007wq-2M
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:36:04 -0400
Received: by mail-pf1-x429.google.com with SMTP id d124so27079175pfa.13
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 18:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dR2HT/hrf1WiRMpgASkIVbT/gEoE8nYnBVqZf/0VwSI=;
 b=mNiUA/D1810cxaIJlw9kcC6CtYIdNM/FGJ7uPVle4iWKwr9+yQcmVV+t4snx55rDFP
 v37rAMoLnVPh997lmh51PulrvcOtNgpwZzs76wmlY63S5Y0sESE7qKmuZJzWpUDolLa9
 SR6FIACipF/zOTG3TaFdRSsTuhdIrmjl+QluC4jcSSI6e5hR6dOwjZjnCAIjyZpAkoSB
 KrU2LGTyMws6k/llHkZEbLSI9ZJhy13P0D+/QNzyP5RepDpzWEWJo5C7GyFRACRVzs9c
 gBp36G27WCSdCtUN5F19hfXhy41D+/5jMl56QuHHNqbSQ2iOJUyysOLpo0DbEkv+whjl
 7Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dR2HT/hrf1WiRMpgASkIVbT/gEoE8nYnBVqZf/0VwSI=;
 b=VrXtmaAoIJRcB4k+LZGoMubWqiXFb4lypuqSUdvB0lsKPk/XDe7bVeGhOyY95PVxi/
 8Of+D2BxPf0UZhCjrUtCIIYWyeCwpbuSlkIWK/2atVfUmhO0WwbU8Fg4kZLvhMSQlm5o
 ADTS6k045vqea0RXFWcylP/oPZf5z+qluk/MMfe2QVM/EX5Tr90w3FgbKp4BGKyYxzLG
 Nxs2mS/gsHqWFhHfrQKLVU/Inm32FckRolUqzv1EhRZ0h0I4tFAScTnS461iK5w1ZxC/
 SyGAsJZB/DsM0RPGvG1+p67xG05M4vDOc8oaBaAEqmkVrVlEzDkZUciKfPzOgIOOabuM
 qvqg==
X-Gm-Message-State: AOAM532ssqCIf7bv9Xp/FWfKAEfvkx5XwK/aM331uDzsMugA1l8YyjJe
 8rZs21W0XC2kT8yOte1ykHQMfA==
X-Google-Smtp-Source: ABdhPJzlGRjXs7rbxfJl3Jxt9Odc/efvDoLD/Ic1CPjSCp4Mw4xp7kr/Z/bpQXFhBtwVGS8Y32Azbg==
X-Received: by 2002:a17:90b:3681:: with SMTP id
 mj1mr8590237pjb.122.1618968961531; 
 Tue, 20 Apr 2021 18:36:01 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id z22sm237745pgf.16.2021.04.20.18.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 18:36:01 -0700 (PDT)
Subject: Re: [PATCH 3/5] target/mips: Make check_cp0_enabled() return a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210420193453.1913810-1-f4bug@amsat.org>
 <20210420193453.1913810-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d14afc49-21c6-06de-ea6c-102cab448900@linaro.org>
Date: Tue, 20 Apr 2021 18:35:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420193453.1913810-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 12:34 PM, Philippe Mathieu-Daudé wrote:
> To avoid callers to emit dead code if check_cp0_enabled()
> raise an exception, let it return a boolean value, whether
> CP0 is enabled or not.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.h | 7 ++++++-
>   target/mips/translate.c | 4 +++-
>   2 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

