Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D2201952
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 19:22:43 +0200 (CEST)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmKiw-0000VO-9B
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 13:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmKUQ-0000uR-On
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:42 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmKUN-0004SU-RY
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 13:07:42 -0400
Received: by mail-pg1-x541.google.com with SMTP id v11so4746534pgb.6
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 10:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSLV1y8wMwmaJPIywhoQ+QQCkZN3SHptzVSt8Z9lhSA=;
 b=u0nHdfZbxNUKBZZB6HpUxRt8OM20z8Xps+FP7GkY9tylwYw9Sb/Sb9bSZPKsUpqTOM
 sOnWbldzTf4qdtbRV7CgneLNfx5DbPHhnRbpKkfkDeDkQbGxnfw8gnNmNdIlOnNCvRxj
 EwCHGVd78RC5hs5vveNWSNCIUS9zrh6ylsc6uUrItOGe/AQuKKEKPJQiWbY+/qEtySqP
 z5LdmFvsJJ8vU4dGdTB9oeZ2WQUxfZ2dHzBzTXvr0I6gIWFW8hiM5J0pZ9A+Et3mxpfC
 o5C3natLs1CscFC5gLsOfxDJyfEUeLxzaCbL4cGZPsy9p6aCLvIh9RN4ume0k21KJK+w
 3syg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSLV1y8wMwmaJPIywhoQ+QQCkZN3SHptzVSt8Z9lhSA=;
 b=fN58DhkRa6MXCEjrzA4M5hGDMz5WXlcHFhfyXOrP5ONMBzEbQrgyOjHMoj2PP9hgMZ
 fznrX8UxsUHn3FS02UoDxjsjcuE595BSUwWGRglbKEQVVx/Idx/6fee6JCHAzQIrlY9o
 hPJaRLKr6bNrLC5aQrZjNUlMGEk7lDUWKzrZq4cG9dl8GMw00gHm9VKvuA05WfRQcadI
 tf7mijQiqLLOQ1lVeln76/psw6dNaqL0VHDmWhfwAMi7mtl0KFGepl0D0rx2g826ZLgH
 6FFZKOoL43z3zJw1zwsqBgRDnIPs4mqHMaau3XjjZ/jsjkbk0OhJrqd1HkwuqEE98snj
 tkpg==
X-Gm-Message-State: AOAM530Pviaj56yoko49SN8n7fGKtZ2ZrTZM7erXb7iayBLHY8JzhLc9
 5updeVHVXJjzXUk4kdaJMwgj2A==
X-Google-Smtp-Source: ABdhPJyRZrcweI50zILKJeUiJ6Mr+z2w7P1OMmB0NplyXS5T+LkTSvqK8VwrzFg2XRA5HdnWX1+qeQ==
X-Received: by 2002:a63:b915:: with SMTP id z21mr4037771pge.145.1592586458086; 
 Fri, 19 Jun 2020 10:07:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id fv7sm5660647pjb.41.2020.06.19.10.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 10:07:37 -0700 (PDT)
Subject: Re: [PATCH v7 25/42] target/arm: Implement helper_mte_check1
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-26-richard.henderson@linaro.org>
 <CAFEAcA_CMWeC=ULu7G4By13KRRJb1UVwRQMksQ-kv0oy=VDZ6A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d0dad92d-1631-2530-dd2a-f6cae27670da@linaro.org>
Date: Fri, 19 Jun 2020 10:07:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_CMWeC=ULu7G4By13KRRJb1UVwRQMksQ-kv0oy=VDZ6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/20 6:44 AM, Peter Maydell wrote:
>> +/* No-fault version of mte_check1, to be used by SVE for MemSingleNF. */
>> +bool mte_probe1(CPUARMState *env, uint32_t desc, uint64_t ptr, uintptr_t ra)
> 
> If this is a no-fault version, why do we need to pass in the ra ?

Excellent question.

At first blush this doesn't actually implement no-fault at all, since it looks
as if probe_access_flags would in fact fault.  Except that within sve, we've
already probed the page and this is just to handle the mte check.

I think I'll remove the argument, pass 0 down to allocation_tag_mem, assert
that the page is valid, and document the process.


r~

