Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A20020AB09
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 05:57:42 +0200 (CEST)
Received: from localhost ([::1]:49432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jofUj-0002Wk-G3
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 23:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jofRB-0004sL-CH
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:54:01 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jofR8-0005bY-KZ
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 23:54:01 -0400
Received: by mail-pj1-x1044.google.com with SMTP id h22so4385829pjf.1
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 20:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Re9Lg1r2LWOJ1SxULupJHxJffyaoVYAOqDCDTSEhS64=;
 b=PuT8PmYgZbCeW4UIw0YokcFwECEa+Ph1+XztTTi/33ZQ+rJr7pQVK99KazxQOhDLxC
 QyhFGhQUK1wQNubbwX/qTPhZWrv02zEPkl8qEyxU+5eEMGzRbOj5dMBZe99CtBjQIrP5
 5kSuJni8WYvwuHw2BjgNOSMXeXkmWAvv77T/peeHeML5VJspdkWuIUPFZq6DwLO6t4da
 J3KHxfPNR4/BZlA96A4ulTQyENn5Q/bRi0kxmuk0YByzTSnHGiPQiaxSghW5r7zeMj1d
 GMpH76Q0iwvkLLO4T7Y+aoupO7btS1f1e6mAOhmygLf07eWkTl/YrE8ZsSBxg9ft+t95
 cpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Re9Lg1r2LWOJ1SxULupJHxJffyaoVYAOqDCDTSEhS64=;
 b=iJ1G8ZkObvlaGB7qho/Z24E8SDBl3oMkj574kpm0rRBIO6AHHow+MuNFQq1H9iUT1X
 sdBLHa35dsEfSInTZMMkbNpyjvZ7YSJ0Wc6HlpTect8uNeQ9dnxigl6XrsWz1F0/RNO/
 fxON83jKkB/G4hVPgd1IJ6mBbmOCCMxdC8ver/o+qQUouex7ih/J5hNreJk5yNRq8eBj
 K0yf/5ZlaRBDMBylZWCdM/gtPUQEqqsHyUCGiwfSaNNGijmyLOtBttyZeF2PyJBBWCK2
 X4U2ESwh87wUiWQcYgk9x3BIFEuLRl70kMBz7nQOhnyuVFZ8/MFv3imucngxx8xh4MPS
 hGOA==
X-Gm-Message-State: AOAM530Yex8vlwgRl9kWuxzoyjZzSUiZGm45FgywbFHqpvxocdruq057
 IKYfTFIKqG9w+xVfsxjgujCzEOCJ/FA=
X-Google-Smtp-Source: ABdhPJxFsUNSsFZAiZ3vS4fZGikalyiVQukequ/nbpdigxN5yXXSehkesvAnrA3rpa1EYrSzHTvO3w==
X-Received: by 2002:a17:902:148:: with SMTP id 66mr328158plb.308.1593143637232; 
 Thu, 25 Jun 2020 20:53:57 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id cv3sm9323877pjb.45.2020.06.25.20.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2020 20:53:56 -0700 (PDT)
Subject: Re: [PATCH v3 8/8] target/ppc: add vdiv{su}{wd} vmod{su}{wd}
 instructions
To: Lijun Pan <ljp@linux.vnet.ibm.com>
References: <20200625170018.64265-1-ljp@linux.ibm.com>
 <20200625170018.64265-9-ljp@linux.ibm.com>
 <4561adf0-2be1-e9c3-49d8-9de8c414ec40@linaro.org>
 <233C7E06-CCB3-4164-82D5-7BC765CC8E01@linux.vnet.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0095b0c7-ae6d-7a09-98b2-bf830b566186@linaro.org>
Date: Thu, 25 Jun 2020 20:53:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <233C7E06-CCB3-4164-82D5-7BC765CC8E01@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org, Lijun Pan <ljp@linux.ibm.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/20 2:15 PM, Lijun Pan wrote:
> 
> 
>> On Jun 25, 2020, at 1:37 PM, Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> On 6/25/20 10:00 AM, Lijun Pan wrote:
>>> +#define VDIV_MOD_DO(name, op, element, sign, bit)                       \
>>> +    void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       \
>>> +    {                                                                   \
>>> +        int i;                                                          \
>>> +                                                                        \
>>> +                                                                        \
>>> +        for (i = 0; i < ARRAY_SIZE(r->element); i++) {                  \
>>> +            if (unlikely((b->element[i] == 0) ||                        \
>>> +                (sign &&                                                \
>>> +                (b->element[i] == UINT##bit##_MAX) &&                   \
>>> +                (a->element[i] == INT##bit##_MIN))))                    \
>>> +                continue;                                               \
>>> +            r->element[i] = a->element[i] op b->element[i];             \
>>> +        }                                                               \
>>> +    }
>>
>> Missing braces for the if.  Extra blank line before the for.
> 
> No, the braces are enough.

No they are not.  See CODING_STYLE.rst.


r~


