Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B08531448B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:07:18 +0100 (CET)
Received: from localhost ([::1]:38692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GYn-0001AU-B0
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9Ezq-00078o-TO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:27:08 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9Ezo-00006m-RQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:27:06 -0500
Received: by mail-pj1-x102f.google.com with SMTP id t2so441418pjq.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 14:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aosrDA153p93pMJaiQ0hd9zkdb0y2PVxbTjqzcRou6o=;
 b=R8sYWbXinUKIuL4vA9B3/HwItMNVQ6BnVOqxCVzn/+z8EyaZk+2eql9WV46kAqflP3
 KLoZFcKJ5cAdX11IwiS2t0Tm1wi6JRhuMb++Rlz5AjwLlMM41djy3Bj8AKUafvyKjYTm
 XVu44kIDN5TqxNCVpu2YVXgnKL1mssc4DknSI0AWoakmSUqmL7Yx+V6EZ5yB/ToIsmDK
 +W0K4o72EjXqE2BRemPWW/c5iKVjW4/1dJmFdebloIuNOjywjz9F0uDWTe1Gh+KXHM0S
 9WwljlXH/qK8er2QzPzKs2q0O5/pMRIfZQannxPD2ZMDpOA78BHM3LRQVEsnqeriut/7
 HM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aosrDA153p93pMJaiQ0hd9zkdb0y2PVxbTjqzcRou6o=;
 b=JVtf8/4NpqMdQfAAIrUEnxhtqRp5pcaoBswSW8H/3pZnbqofMUD+JOT02rvqesUqiB
 22AWn6f0/8SyXzx11frCrQfTt+sa0OJ/q/Kl3Dw/3DklRGzh7mh2Evz3JLS5ZldqvN6H
 kWCO3WF2PaDavuZ79D0ERUOvCcfsiaZz7sfXVeN8Ay+P4CEsxV+L4oeVptDHikmR5HyZ
 R0hwiuP9PxW0tuj1wntscXgZ9ievFsR638ttE9OKZfuFpxdpP9k9HyPMRlKMfruOVG92
 XigKBO8IpApKzbHzqFPdwfnNJ1uN2qlEB7fD1w3Dxug8eqi9JDWY/gQuCbw4aX7I8Qur
 7YKw==
X-Gm-Message-State: AOAM530Fp58t8wsjM/b116pfTVXOhkkMCUSv9Jqb89f0Or/lz5u5DWnq
 +w/dRy9jUWlBnc9K2MzlsZ4JrU1lcrcKhA==
X-Google-Smtp-Source: ABdhPJwmEhnVI6a9kE1TE5EhSs3Rx0tE+8NWhsglwEy5k0swqZ5UgUz8VJI9Dj1iz0oKStpCmrGp5Q==
X-Received: by 2002:a17:90a:1a0b:: with SMTP id 11mr949877pjk.58.1612823223354; 
 Mon, 08 Feb 2021 14:27:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p2sm305400pjj.0.2021.02.08.14.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 14:27:02 -0800 (PST)
Subject: Re: [PATCH v2 12/15] tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-13-richard.henderson@linaro.org>
 <CAFEAcA-iapdprn+tN1T31XisEMa6k1WgkLnobSMCru0mRUOhDw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <909f3369-379e-c553-ff11-415a3156b67a@linaro.org>
Date: Mon, 8 Feb 2021 14:27:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-iapdprn+tN1T31XisEMa6k1WgkLnobSMCru0mRUOhDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 11:55 AM, Peter Maydell wrote:
> On Mon, 8 Feb 2021 at 04:02, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> NEON has 3 instructions implementing this 4 argument operation,
>> with each insn overlapping a different logical input onto the
>> destination register.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> @@ -2899,6 +2904,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>>          }
>>          return;
>>
>> +    case INDEX_op_bitsel_vec:
>> +        a3 = args[3];
>> +        if (a0 == a3) {
>> +            tcg_out_vreg3(s, INSN_VBIT, q, 0, a0, a2, a1);
>> +        } else if (a0 == a2) {
>> +            tcg_out_vreg3(s, INSN_VBIF, q, 0, a0, a3, a1);
>> +        } else {
>> +            tcg_out_mov(s, type, a0, a1);
> 
> Side note: aarch64 tcg guards this tcg_out_mov with "if (a0 != a1)",
> which if I understand correctly is superfluous and could be removed.

Yep, tcg_out_mov already does that test.


r~

