Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132066DDA9C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 14:18:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCvv-0000g2-UR; Tue, 11 Apr 2023 08:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCvt-0000cz-EQ
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:17:09 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCvq-00069G-Lg
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 08:17:08 -0400
Received: by mail-wm1-x334.google.com with SMTP id he13so9407904wmb.2
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fRUKW6u5mJOe+ofai1IWzRGRS5UDuKRXTn5POZtj3ZI=;
 b=auuBkAukQ76z7prOYBSVilZAcsLHyAlpyImCjt+HiWRF6mdUgm3AZZcD1aN8cJaEVx
 j2rqls49/AxccVBjWx8cYcKDl/rse8H+nW2JbFph8WPOCcnaAhc7v5pdu5H1GfpbB0g8
 EQnhWBgLivJz0HB3HciNms5H9VVdIRtGZmRNHkyo6UNV2SfBVoHCwO6I/DTiTUaGioJP
 Q0JSyZS5uUQ35D+SGcjyEUayARkyt6MQhebhiAFN69xL9CH3NxFVaK8VWjOUADi51tew
 o4qXlwVJvlEwSxf4YVV/GjoqpucpNrKmugFiA8Wm2bTd57I0Fjs6eJdmotV4ec6vOz0n
 GlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fRUKW6u5mJOe+ofai1IWzRGRS5UDuKRXTn5POZtj3ZI=;
 b=6FqZ5tZ/0ewSpneSWXbTEhZaSU0+vLCKH3+7VASyiOvBIJg3lU9Eh9F3QN/tKE4Gz1
 oQxDSGaIKzMAIymG923XefLrz8D7wokU4Fa86tfIkyqEZxXsiKyDr25sji0jKIKhHSXS
 7RvhwLc3Lc9Rk9jAXsYEpqRskQPYvXVUGmJcAMv8N/0gHVJege+7m7x8e9RsJkW1lihJ
 yIPZtlonmExm2ut/0ZwHec4y/owhaZmMe37Cyp9/vFR0ltkbWUjU0mZgaFIBp/NyzEzB
 C7tJFLxmhPxSWzHXzmftMXuT0FNVbOODySDkDSdwhZb47rPTzHCDIx2EDzeADFFJd75V
 gv+g==
X-Gm-Message-State: AAQBX9cnpDq36cr854CFhrR7DhgmSB23W4luE8rCb2Ushw+8upY1kMPH
 UkHIPCuu3aLMmOtwSvZN+Vmijg==
X-Google-Smtp-Source: AKy350Yticz7dIo+DlJgcIb7nnjIk+lyXw3YeqIeEwHJ9m7vkwkDHAeGvX4piN2ENoOjIBZ82zC4sA==
X-Received: by 2002:a1c:7312:0:b0:3ef:128d:7167 with SMTP id
 d18-20020a1c7312000000b003ef128d7167mr10199714wmb.13.1681215424978; 
 Tue, 11 Apr 2023 05:17:04 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a7bc8c3000000b003ee10fb56ebsm16987726wml.9.2023.04.11.05.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:17:04 -0700 (PDT)
Message-ID: <8f3aec2e-9067-43c7-5161-b393bee98dbb@linaro.org>
Date: Tue, 11 Apr 2023 14:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 24/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On 8/4/23 04:42, Richard Henderson wrote:
> There are several places where we already convert back from
> bool to type.  Clean things up by using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 56 +++++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


