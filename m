Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C922F438AF5
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 19:27:46 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mehHd-0007uc-Ex
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 13:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehGj-0006oI-6u
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:26:49 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehGh-0005yp-5K
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 13:26:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id r5so1728838pls.1
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YKnPlP/UuVyjhAjBV6Z5Rfb8gc0NkX+Lzo83jjzVU3w=;
 b=ghwl6JwrRKlFNp/bVbP82PREiWe2+sWzdC4txvdSXDOEARX8cRi4+aXUpt3+PEYTer
 toMbDcgn2pQ6d9pEd9E5jEpUUzm73bOkjgUwJkn4/F9QYJt0UUMe4NMHwwydlL17ajvS
 Wf0GalntZFkr2pQfKU7WMqylmBJxJbDTYLf9KsZ7+iPNHJgMQk46nO5/vcVZCuvhpnzT
 n8sv2uBnkzXRclWHJvqdgrPdh7XwRQQyJoZ01oqCPYaict/adoZGpFdQLyBzGothwLH5
 VsS02DnQj6QYrisoVocMaeVTIuv3sJ/YDz0j+aOAS5DzYyVagynHLQwPrzQiVFzOgrvz
 K79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YKnPlP/UuVyjhAjBV6Z5Rfb8gc0NkX+Lzo83jjzVU3w=;
 b=3dav2BRaMPbxmGLqhMUF5JFL1xFy4IFz01x16dvmW1M2vUj6HbPYEC1S4bJ684BhSW
 amc5dz3H4I4ITqGnfjB0qGkW54bCqr/RO6Z7PSZdgaZv9eR/SZ9TkmTQ7e8XTvEW6ldf
 F+HquNxIl909fxnG7DNXQZi0Ps5IGyrRi8hiev8A7akT4puliWt8uhlw8sxAjvu5hsYh
 YgSdFdPxdKaL+d8HYRtDxqvqpZXEytFM7qXmFF5fQMo7qhnM9VZiTp+/NE5mqwrb10LT
 KvypT6z824/EQZFsvPyTbLoQN4kyzE9+qhEHfCs4rjtH8lhoikZdxK91cnwfowT2JVs8
 Gu6A==
X-Gm-Message-State: AOAM531MyAev5uoV0m8L7sScB64kFxLLYaT5J4GQbOc91zVNTyPFH9JM
 worDMVt02ivHALrgCTujkYljIg==
X-Google-Smtp-Source: ABdhPJz6sVgbJC+Aved5f8qLiMqFK7Tsv5n5NDdHF9uPvq0kwrOqQqwelyEGWk+A0UhScu9WLmyXIw==
X-Received: by 2002:a17:90b:4f84:: with SMTP id
 qe4mr29958073pjb.209.1635096405250; 
 Sun, 24 Oct 2021 10:26:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y14sm2377317pfn.80.2021.10.24.10.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 10:26:44 -0700 (PDT)
Subject: Re: [PATCH 17/33] target/mips: Convert MSA FILL opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-18-f4bug@amsat.org>
 <05abb10d-25c6-3b39-dd43-cc269dc1dcb0@linaro.org>
 <2aed4407-9fd4-bcef-3e98-18446bcf3e94@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6c6002b-c143-50c6-f849-5fb317a7ae76@linaro.org>
Date: Sun, 24 Oct 2021 10:26:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2aed4407-9fd4-bcef-3e98-18446bcf3e94@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 9:44 AM, Philippe Mathieu-Daudé wrote:
> On 10/24/21 07:04, Richard Henderson wrote:
>> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>>> Convert the FILL opcode (Vector Fill from GPR) to decodetree.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    target/mips/tcg/msa.decode      |  2 ++
>>>    target/mips/tcg/msa_translate.c | 40 +++++++++++++++++++++++----------
>>>    2 files changed, 30 insertions(+), 12 deletions(-)
> 
>>>    +static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
>>> +{
>>> +    TCGv_i32 twd;
>>> +    TCGv_i32 tws;
>>> +    TCGv_i32 tdf;
>>> +
>>> +    if (!check_msa_access(ctx)) {
>>> +        return false;
>>> +    }
>>> +
>>> +    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
>>> +        /* Double format valid only for MIPS64 */
>>> +        gen_reserved_instruction(ctx);
>>> +        return true;
>>> +    }
>>
>> I expect this reserved check should be above the MSA is disabled check,
>> within check_msa_access.
>>
>>> +    twd = tcg_const_i32(a->wd);
>>> +    tws = tcg_const_i32(a->ws);
>>
>> tcg_constant_i32.
> 
> Hmm I am confused here, only 'df' is constant, 'ws' is GPR[$rs].
> Since it is limited in [0,32[ and used read-only by the helper,
> we can also pass it as constant?

What?  You're passing the constant ws to the helper, not the contents of the gpr -- that's 
what the helper is expecting.


r~

