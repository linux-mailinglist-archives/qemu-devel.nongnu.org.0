Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B0E5E56BA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 01:29:35 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob99p-0004Y2-V1
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 19:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ob97g-0003A6-Jj
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:27:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ob97Y-0004wb-Gj
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:27:19 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so291103wmb.0
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 16:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=D5jddLLVAKm1zZwE4+ZIH/u9WiQAwDuIGoQAPpIKRE4=;
 b=dMc9TbY2p2usUGLKCWZTjMs3I1cmrrj3N4VQtlBbg0Y9tuFv7hLC0FXBFbb1/vCoHW
 sbsa1R2ka8tpo2HmXWDVsvgm91DvnKBrzYYAuKP1YmJIXtL8gynyGUFX2F+KK8yGRrDY
 mqe5N3rQDINZSQ+nSgXqD1Y33bDzxLMuSqFXp35PDWF8/DAUdFW9HSF/gplKlH/z+U7/
 ac0GYNfwWycJ9jV51U7+TCpRzckkHKYqkSo+lLQO6RE5OOxLOfRvCwP29fWCbuvsGv9D
 RO6vFJxX+lLUWEXvZ24lUolQvwFzEw3YOlIbEiveSmmRlDWI/PGts4aE9wy7a8SP8DuR
 N6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=D5jddLLVAKm1zZwE4+ZIH/u9WiQAwDuIGoQAPpIKRE4=;
 b=NQ8aOUgTYaIIZofzYjKYXbZider8Lni1+syf1/RyGKIcVhNPTaLP55Qlykhx2sTa70
 l2KyIssPOIxrm37GwMKGTsN9/Pb0eCrn21HTFVNSdWQPiLhh5lgZ37ZlhL91EqQQQ1ls
 vJmmDgYGIOQLG7bcooxi/4gRw93UI6Mh5uEEugAqrNuK3NiqZQREH4Sf9+ADXlyeIIaV
 V975weHsP+cE5NzvaRUkD5SPLn3+94uua7iC71cIIOPaLGskb+R60tx8Fz8yTUia7wNX
 UnN4ZtmI7G8ME+HxakPekDsHz2rMg2xQh2Yebg8aK69XTT8liHDao7in5zMOA23Pd8eZ
 Wpqg==
X-Gm-Message-State: ACrzQf10Z3Xi9l991HEqk77wqj7ZvoL1bHrMNK0erh0Q0XsX1iIzldWd
 nBBKYmlqNeUKKlqMbEErOd2GHw==
X-Google-Smtp-Source: AMsMyM5DBuTxCTVDAsgV/K7jQ0ZIKP0prbu/ICirnEOjSKq/lOLQh+K20AOMgbyMpQfejB0CoH/yLg==
X-Received: by 2002:a05:600c:1906:b0:3b4:c979:e686 with SMTP id
 j6-20020a05600c190600b003b4c979e686mr371247wmq.107.1663802830324; 
 Wed, 21 Sep 2022 16:27:10 -0700 (PDT)
Received: from [10.0.0.88] (85-220-43-103.dsl.dynamic.simnet.is.
 [85.220.43.103]) by smtp.gmail.com with ESMTPSA id
 i15-20020adfaacf000000b00228df23bd51sm3442506wrc.82.2022.09.21.16.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 16:27:09 -0700 (PDT)
Message-ID: <54931bb8-c984-dad9-6329-ec63f1a3f49c@linaro.org>
Date: Wed, 21 Sep 2022 23:27:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 13/23] target/i386: Introduce DISAS_JUMP
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-14-richard.henderson@linaro.org>
 <CABgObfbduu=N3ZiH2nVNin-6jM-hajmCu6S-DDYmB1ycMtW95w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfbduu=N3ZiH2nVNin-6jM-hajmCu6S-DDYmB1ycMtW95w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.702,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/21/22 12:28, Paolo Bonzini wrote:
> On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Drop the unused dest argument to gen_jr().
>> Remove most of the calls to gen_jr, and use DISAS_JUMP.
>> Remove some unused loads of eip for lcall and ljmp.
> 
> The only use outside i386_tr_tb_stop is here:
> 
> static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
> {
>      target_ulong pc = s->cs_base + eip;
> 
>      if (translator_use_goto_tb(&s->base, pc))  {
>          /* jump to same page: we can use a direct jump */
>          tcg_gen_goto_tb(tb_num);
>          gen_jmp_im(s, eip);
>          tcg_gen_exit_tb(s->base.tb, tb_num);
>          s->base.is_jmp = DISAS_NORETURN;
>      } else {
>          /* jump to another page */
>          gen_jmp_im(s, eip);
>          gen_jr(s);
>      }
> }
> 
> Should it set s->base.is_jmp = DISAS_JUMP instead, so that gen_jr() can be
> inlined into i386_tr_tb_stop() and removed completely? If not,

It can't, because of conditional branches which do

    brcond something, L1
    gen_goto_tb
L1
    gen_goto_tb

The first gen_goto_tb can't just fall through, it needs to exit.


r~

