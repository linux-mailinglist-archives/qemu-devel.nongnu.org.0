Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D705E3B6343
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:51:59 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxscA-0001Ce-W0
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsaZ-0000Aw-HF
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:50:19 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsaX-00013n-0V
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:50:19 -0400
Received: by mail-pg1-x532.google.com with SMTP id e22so15668182pgv.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BqHJizkmj4C29e60n0zT7IZhIEx86bJR6ak30vx5GfE=;
 b=DJREl+Wht973w3sqMhFoOUmhjAgrtrqscnwypUg9TbuHH5mL4nuOm3sipFTAw5FoQ7
 pUm/VOeCOQujLyPiKQoOcOPHl3V+MTDMy/VPQqkoBab21vZ1W1efy92YifSus3gtRLzJ
 pIOldnZvclFSqhruFJfIIL7RzZz8MfK1KzH2tG8HaDo1JirrxnSts/sJuqcQtTZgpYq5
 Ln6JrVlgnPg9u9XRfFu7VOn6pQnkq+ga4jU55NybVMno9oeaIl47EF+ybfSB6JLS2BnN
 O0antiwCWmkn55jXzUNHoCvmZ0ADZiE4EF4YSt0qZM9BWTxDs3lrY+lgdfQNclEPE+Lv
 UlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BqHJizkmj4C29e60n0zT7IZhIEx86bJR6ak30vx5GfE=;
 b=FJGiHM/Dt6x3kJ3FVPCV59EFkAUzyr2D1mq5DfI9g2KpVaLlDgviwfQpdbtEL+owwP
 VJADLa2lY93SSisjvTk1ngNYPxFYsG+dQR8hYc2QmvLbvo3j1aoM9qKLwCkk28QHmW7W
 61PuPXgQTIkXd8oQaQpAaP2zVx/QkfSjKJxdrP0mc8tWDWu68k1wy9JDg2sQVNw/uuOt
 7vEx1i1UUKpWeKk/GrYPSnQoaCSJuv1FCmQyzDLtB8P6J44dh5UlSReLIxJGrEFv2SzA
 ZagApV4jew07fAWHRAZtaIkxKs6skAiwZyqzU7QsJ6W37Ewqd7bKwydyvNjzY4bB2Pgy
 Q0uQ==
X-Gm-Message-State: AOAM530PuYG0jgDL3if7/0jxzbM9jjF4a+R/T5CRAQhNcc8xL0brvEtk
 +zBdhTNb2fFyRcXsSSwVpnCP9w==
X-Google-Smtp-Source: ABdhPJykguWY6CjpAhsRwzJpUlbGb1v2wY25iafzlKoWydLfPLGGXVBlaRr8E4XvFgx+u0y8GGIR4g==
X-Received: by 2002:a62:1b88:0:b029:1fb:d3d0:343a with SMTP id
 b130-20020a621b880000b02901fbd3d0343amr24846920pfb.76.1624891813004; 
 Mon, 28 Jun 2021 07:50:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id r30sm4387704pgn.46.2021.06.28.07.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 07:50:12 -0700 (PDT)
Subject: Re: [PATCH v3 13/29] tcg/s390: Support bswap flags
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-14-richard.henderson@linaro.org>
 <CAFEAcA_HiW05hA0wC-DGNSpnH-L7p_cj6ZFvAWpA0GQBcZvMVQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2e66cdd-6fab-d898-b18a-f0c18709c912@linaro.org>
Date: Mon, 28 Jun 2021 07:50:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_HiW05hA0wC-DGNSpnH-L7p_cj6ZFvAWpA0GQBcZvMVQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 7:43 AM, Peter Maydell wrote:
> On Sat, 26 Jun 2021 at 07:44, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> For INDEX_op_bswap16_i64, use 64-bit instructions so that we can
>> easily provide the extension to 64-bits.  Drop the special case,
>> previously used, where the input is already zero-extended -- the
>> minor code size savings is not worth the complication.
>>
>> Cc: qemu-s390x@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> +    case INDEX_op_bswap32_i32:
>>           tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
>>           break;
> 
> When we're working with i32s, is the top half of the host register
> zero or garbage ?

The general case on s390x is that the top half of the host register is unmodified by insns 
with 32-bit operands.  This is true for LRVR.

It's also true for LRVRH, with its 16-bit operand.  Which is why it's not as useful as it 
could be.


r~

