Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CE6D2335
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:55:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piG9z-0004qL-Gj; Fri, 31 Mar 2023 10:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piG9x-0004q6-Gf
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:55:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piG9w-0001Xt-5J
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:55:21 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso8846332pjf.0
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274518;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KKFxFrMLcQuzpMsM/Ew6ZyCQQAEMNeo00KH6hy3WTq8=;
 b=kO+dBkwGoZgb6uV+TzCyQpx0yiTFFurt1eRW7EANQx0LhsaVnUbyzTvGXRzER3RKKF
 RXYUue9X7LRoGNGHW8PwiNPbiLK4s4MOCe3zMcxtjHEf8pRvX7LYvyPt3eznySHIfm/R
 KGt5LuAXvHon6JoE8PWksdTDSjayKycldhw9S9vSUTEpit3VJQZMOE/8dS+e96dY78I5
 ssi9lkoIk1RSfeqZcEeeWzoGTDS3FmaW0d9a3JF5Vzd4iaZaoO+TND3yqJg6eIAhWqPh
 FVm7DHTwLYwa/3fWe02YjjlWNu1fN1ONExDdn/fOPy+BChdcUlga7LDjG40ILF8jNaQe
 yUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274518;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KKFxFrMLcQuzpMsM/Ew6ZyCQQAEMNeo00KH6hy3WTq8=;
 b=kstcNllIXlsTyPf1KZbX7GZ3XSXKdcoTELzbfYdB5UTUABiqgE6vg/JT8AcyIHMpvy
 /gN/vJIt9x1dETuvkx28d6cC23O2rnU5LcHu2R+/nosTJPfUoZ/oKre1v2vX+8vWiw2k
 CD7YycPNfx7KwEvrCIlGh4hWBTi/A0P9WVqn6QU83pOQZjgnbD7tVf5eqvWxYyaYhjZb
 nWs3Ikpcj17yt+qygbxzIox0DhzTjrfv8y01G3Ly5GCxTQLOAUuLdebq8/gkqZnqufrv
 4+c1FAB5isV9y68NZtEmSzODc6C6G5bm2VD0JK05T12bA8YU99odggP2Lb5KFkbggp4Z
 f9OQ==
X-Gm-Message-State: AAQBX9fCSsNad793JbJbs14ag700pos56F5fsTGSIU2rgg5Pl3PjRj5D
 TWJfG/E5nNdiGHfRBnuBDoHxjQ==
X-Google-Smtp-Source: AKy350YYQuCchADr5+b4fyeiClGJSEZBAHszSndIg0OWcgeMzMiW4LvYnjZ4ZEau6PmpOooez6EntQ==
X-Received: by 2002:a17:902:d48b:b0:1a0:4046:23f2 with SMTP id
 c11-20020a170902d48b00b001a0404623f2mr33882764plg.56.1680274518626; 
 Fri, 31 Mar 2023 07:55:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 s64-20020a635e43000000b004fb171df68fsm1707333pgb.7.2023.03.31.07.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 07:55:18 -0700 (PDT)
Message-ID: <5a3b2e5b-d1e4-1803-a83b-5989987f5a52@linaro.org>
Date: Fri, 31 Mar 2023 07:55:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] meson: add more version numbers to the summary
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230330104622.29087-1-pbonzini@redhat.com>
 <543ac996-1be2-dd4b-d8cf-a92fc5ba53a6@linaro.org>
In-Reply-To: <543ac996-1be2-dd4b-d8cf-a92fc5ba53a6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/31/23 07:54, Richard Henderson wrote:
> On 3/30/23 03:46, Paolo Bonzini wrote:
>> -        cc.find_library('gpg-error', required: true)])
>> +        cc.find_library('gpg-error', required: true)],
>> +        version: gcrypt.version())
> 
> Indentation.

Bah, mis-read the patch.

> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
> r~


