Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B066CCA80
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 21:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phEom-0004ZV-JF; Tue, 28 Mar 2023 15:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEoa-0004Yy-T3
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:17:04 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phEoY-00027b-T8
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 15:17:04 -0400
Received: by mail-pj1-x1032.google.com with SMTP id q102so11831934pjq.3
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680031021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BgCAdPbJWxmezMLlCB+zfbqjlUeBDrYMH2bO6W7scQM=;
 b=khAzcds3IGiKZQoQ29wNCp1y6GIGD9v9SKWbVLgfpl8Leiv3wCS8JsRkrq/qWXQoyS
 1qvZSECbxNugGgxc7iBkZxyh0DxYdNM6hW+a1FRoeE2ioycbUikZjTALYOVD2P2l0TRy
 8GAGL2fWqrGTDpFgq73pawmBLpi9ZxcbACyiGu8PaoPOZuIXQ4ms3oVW42la0mmlvec/
 14Y6NVfkk8gviKo1f2+lGy6uflKbhFSevUgXOReqv2kq9VwnY7TktCfWxal92hp+eTRq
 GOtkiAptoL6ycRnHEu7Zf72YuarICYUbo+hjuIgVUb/eSNzSN6ptdgrto85z51NhRJGc
 8G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680031021;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BgCAdPbJWxmezMLlCB+zfbqjlUeBDrYMH2bO6W7scQM=;
 b=DWIaSXiZB26960l2keou/OgGuTSzT5/r4J3mr2lG/xIUjyihc3XZeufm/RwbClgW1B
 k6ZfBBJw0BhsX3pLyaNJ22JBkt3JnL+jgi0Xy4+tcsejH1DcCWosl5s6uxzRtCXGNJAW
 rkjSEM8koX8XBpnnAzP8l6UOpDPjCqdVHeHnUgUZdxCTJjaazb1bM866Cix6gq6gNCM9
 FC6b/uVIthFKHflAIDZPsHkj5ZbYNM72AsZP8Fzjs80MjVaXLdaxN+TQ30WNB0Yf+A1H
 kN/P+JP0YU0PbC2C+HnZmwUCeqn+SbQ0/FzaYexDjICAM+oSopxj1PaPCFzsmrNxVHJf
 FtJA==
X-Gm-Message-State: AO0yUKWd18sPVi3vrHnwPE9+G7mjZZlh+iXSHEgsO9HnDW0P8HcZK9mL
 k4gTJg3uAHh19Xu5+Q1HiwxCcw==
X-Google-Smtp-Source: AK7set/RLjvutPtkJWZLs+ViyJsZEofATnbVLi+ahXZWt15xM/k5ngK3h/3UFWxkToH/05A8/D4vYQ==
X-Received: by 2002:a05:6a20:7788:b0:d9:18ab:16be with SMTP id
 c8-20020a056a20778800b000d918ab16bemr13770883pzg.29.1680031021288; 
 Tue, 28 Mar 2023 12:17:01 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e?
 ([2602:ae:1541:f901:396:9f0d:afc2:978e])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a63f918000000b004fb8732a2f9sm20200487pgi.88.2023.03.28.12.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 12:17:00 -0700 (PDT)
Message-ID: <ab190434-1bf8-a038-e589-6fa150842fe9@linaro.org>
Date: Tue, 28 Mar 2023 12:16:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230328162814.2190220-1-peter.maydell@linaro.org>
 <e9e8fb66-3fe8-2519-95df-6ba6c52d53df@linaro.org>
 <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_TGN7qk8YQz8MPbdg=jcT-HQVFWBfnEO53AAPyXBmqTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 3/28/23 11:27, Peter Maydell wrote:
> On Tue, 28 Mar 2023 at 18:27, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/28/23 09:28, Peter Maydell wrote:
>>> +            /*
>>> +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
>>> +             * but since we're conditionally branching over it, we want
>>> +             * to retain the existing value.
>>> +             */
>>> +            old_is_jmp = s->base.is_jmp;
>>>                gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
>>> +            s->base.is_jmp = old_is_jmp;
>>
>> A third solution is to simply set is_jmp = DISAS_NEXT here.
> 
> I wasn't confident enough that the previous is_jmp had
> to be DISAS_NEXT to do that -- there are a lot of
> different values and it's not clear to me which are ones you
> might find lying around in is_jmp at the start of an insn.
> 
> I like the set_disas_label() idea, but maybe for 8.1 at this
> point...

Anyway, if you'd like to stay with your current patch for 8.0, it's not wrong, so

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


