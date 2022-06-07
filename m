Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 544015401CE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:52:29 +0200 (CEST)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyaZH-0002L0-Kj
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaWG-0000H0-AJ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:49:20 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaWE-0007Dw-Pg
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:49:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so21061663pju.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jQRGzO8DdCIYlCZO3zF52ovUfz2vFJg0xZIRdvotHNE=;
 b=yT7h2nmgTkI/2KdaScN2QDA+dvXh4TMEjeyo5B2nuFEUIDESdCZkfNEDE3n32LxwdK
 9huGnN+SWXCNhCtDYqVkJZvzvsKtfJJMDghJv/O7pXlshVKFwZ7oY9yU6oVwmAErVq7m
 Zp0o0+Q9ez/xT/8yqUQKVaNuaBewUsXIF5nK8o+zvDo91Ug+peDSH/6ulblRM5Gj+S8L
 Tn5sBoNpbl84DJolEc7z/+ujcjeciElD2NVifG6raJacTNWonp6PSN5JQI/OwyQkBOC3
 P4FS8FstlAx3TIm52Ngzf+8rdrJi/gCHhJoRon1g6HxprBrBdCI/6NTyDASdE9RFlh0x
 84fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jQRGzO8DdCIYlCZO3zF52ovUfz2vFJg0xZIRdvotHNE=;
 b=A/D5wiBuobnMFhSn3Bm+u+K2Yx3xxRtRHN2fB9t0JUUrjb+/S+1kndmhy3/2N1mnQt
 mVESZx/HYfJSdMMLr9QpCSN9LvwTBSDK2Z5xsQnZ6z2ld+WiofgYU8InTs1/vwlWbJZ6
 2/lr0Q4xZSTdbRNyCteW6ParlqdsZ9NIHgQbMBTKLq0lc7AV+1dSetmaBFrgiBVqtRdD
 YTLyNN9ROl1nkgl6E61VBmpsoyM/b/7HGZKmZbfmp6RinqhzVPxZZm6w/f+7buKvEhat
 HA+lWwHQfDpV54cnl4klX5ZeVFwyikKC8OtfKKF24ePqN4naKR3pu7zuMbwcwRVq+o1b
 /nJg==
X-Gm-Message-State: AOAM5306Qd37KPsDWZhRpl9B9Kc0MYJNozk6Mj7eLlfmfRCFL4PnDz66
 pGA1wUIj5UVi+eMBnZx1kK3Szg==
X-Google-Smtp-Source: ABdhPJxd5Gdsm+iV236omBQZ6X+io8CPmC8tmBNvwfjyZRYllXW1suLQU20owf8T0z20hAjEE0p7dw==
X-Received: by 2002:a17:90b:4390:b0:1e3:3caa:8f78 with SMTP id
 in16-20020a17090b439000b001e33caa8f78mr42326323pjb.213.1654613357163; 
 Tue, 07 Jun 2022 07:49:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a634658000000b003fad46ceb85sm13074005pgk.7.2022.06.07.07.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:49:16 -0700 (PDT)
Message-ID: <d120705b-2653-5732-668f-7dd889d590c6@linaro.org>
Date: Tue, 7 Jun 2022 07:49:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 39/71] target/arm: Add SVL to TB flags
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-40-richard.henderson@linaro.org>
 <CAFEAcA-UeGqXp4wUSoR73pCUBm9_WEB_MeAKsdXQOvnK+ajWVg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-UeGqXp4wUSoR73pCUBm9_WEB_MeAKsdXQOvnK+ajWVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/22 02:58, Peter Maydell wrote:
>> @@ -3292,6 +3292,7 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
>>   FIELD(TBFLAG_A64, SMEEXC_EL, 20, 2)
>>   FIELD(TBFLAG_A64, PSTATE_SM, 22, 1)
>>   FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
>> +FIELD(TBFLAG_A64, SVL, 24, 4)
> 
> Given that both SVE and SME start with an 'S', maybe
> "SME_VL" would be less prone to confusion? On the other hand,
> SVL is the architectural name, so maybe that's best.

Yeah, my first version used SME_LEN, but in the end I thought using the architectural name 
was best.  Just above, there's commentary using the other architectural names "VL" and "NVL".

>> +static inline int sme_vq_cached(CPUARMState *env)
> 
> Same remark as earlier about not needing to put "cached" in the function name.

Already fixed.  :-)


r~

