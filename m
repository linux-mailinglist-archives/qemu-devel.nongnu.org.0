Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBE6AA05C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:59:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYBWv-00007h-CA; Fri, 03 Mar 2023 14:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYBWt-00007F-OA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:57:23 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYBWs-0006h8-7X
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:57:23 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l1so3707397pjt.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677873440;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EPBzpwEiAAMTrsN41j5B5yDucNwWSyOhsM+qG9T6AA0=;
 b=elRRo1cnj0vaA+YvluiMiqLMbWbkg/nzuFneZA3lFTMbybBGdtIRHdYdo0hlnglgr5
 8OpEdEn5sESwFf+oT5B9zioBdJej17pg4keavXnfGCOqzfZ8xzHIWu1RKZoeKv5Ab7in
 dbL9KLC/4peyk8ut6F4Jy+U9PtzK/ykIm87cUgbOqYvuwelPp2fZ6/jIaiFOjISWi0TD
 FmiDBl3UzjtHcx7mxT6Fz4eIK0/jsBrWRyIW2rPNj+z+mmkKbvjfqdciZHevLbHvgviF
 mZzP+yKVAjEWcjirOAzpoLicKaXyShKcq+40G53kumPzBRQ/RLRxpLrAVZzyf+7p1G6b
 JuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677873440;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPBzpwEiAAMTrsN41j5B5yDucNwWSyOhsM+qG9T6AA0=;
 b=Avk+gTqHxvIOOgbUPiqP3OwGs1BZGGlZeZie1N3YD7MiVXpBV1jcccw45shd+uu/Nq
 /xbSNijrPE9lOT1GF5MKeLYt9+3+KAu0Uw3GkKuR95eJl3tuIjQ+8rxou+BimgnQf9d8
 Rzx0jp5rWHxm5GBfRBh9nqfzRyiXyhjzKWQhCSwVFve+MNpBBe5sdHdqKKXiaB5ut2Ek
 cvVLlYWUJtVBo1OeCtLkcqegkmtF55AllbkWxfxwNyHi5aimtVGfHvJLOxosyJXif29B
 28ra/zWNSAN3Ufmsh2/S9+TeCgjaReHqwviw7kIkS9V50IDPpUq/KoXo9RrcmLFEYA1W
 PN4A==
X-Gm-Message-State: AO0yUKVuRkXSQ8hawMbgVfoOzAqwWyoOO2PYHbHNHk0M9dGCQjjBGzCR
 f7OQH5xYP/HLQexF7/6AlYptwQ==
X-Google-Smtp-Source: AK7set/CtPwrs9sVgAmfWKR5X3LjZomC6zifPJRwdMwrMPOK4E/KvjCjMrEZ+6IIzAbqFGW/rSaMzA==
X-Received: by 2002:a17:903:41d0:b0:19e:3b41:1826 with SMTP id
 u16-20020a17090341d000b0019e3b411826mr3537173ple.54.1677873440105; 
 Fri, 03 Mar 2023 11:57:20 -0800 (PST)
Received: from [192.168.0.4] (174-21-74-159.tukw.qwest.net. [174.21.74.159])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902e9cd00b0019ac9c4f32esm1851607plk.309.2023.03.03.11.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 11:57:19 -0800 (PST)
Message-ID: <3615903d-daf1-1d21-d33e-8538c7203817@linaro.org>
Date: Fri, 3 Mar 2023 11:57:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 66/76] target/sparc: Drop get_temp_i32
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-67-richard.henderson@linaro.org>
 <CAFEAcA9XfB2DX2Qw5mgVbJRumDuNb90VwpXGvR2XeKD8XgXB8g@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9XfB2DX2Qw5mgVbJRumDuNb90VwpXGvR2XeKD8XgXB8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 3/3/23 11:09, Peter Maydell wrote:
> On Mon, 27 Feb 2023 at 05:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Translators are no longer required to free tcg temporaries,
>> therefore there's no need to record temps for later freeing.
>> Replace the few uses with tcg_temp_new_i32.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/sparc/translate.c | 25 ++++---------------------
>>   1 file changed, 4 insertions(+), 21 deletions(-)
> 
> Left my review comment on the v1 version of this patch by mistake,
> so just copying it here:
> 
>> @@ -5762,14 +5752,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
>>       gen_exception(dc, TT_NCP_INSN);
>>       goto egress;
>>   #endif
>> - egress:
>> -    if (dc->n_t32 != 0) {
>> -        int i;
>> -        for (i = dc->n_t32 - 1; i >= 0; --i) {
>> -            tcg_temp_free_i32(dc->t32[i]);
>> -        }
>> -        dc->n_t32 = 0;
>> -    }
>> + egress:;
>>   }
> 
> Stray semicolon after colon, or does C not let you put a label at
> the end of a function ?

Mistaken memory that a label neededs a statement, but
that's to do with declarations not following labels.
I could change it, though it gets removed in the next patch.


r~


