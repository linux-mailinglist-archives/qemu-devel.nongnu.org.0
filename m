Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5964BA0E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:43:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58NA-0006Yi-IN; Tue, 13 Dec 2022 11:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p58N8-0006Xf-Am
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:43:14 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p58N5-0008Ax-Vz
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:43:13 -0500
Received: by mail-ot1-x32f.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso172565otb.12
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3JohjUI9LAEW5SG/90YHiYMTiplsOeONINKJbnWHLoc=;
 b=h5zwtx+PfTbv6Ip+KNZURJhSzjyBxJyVe43bi8GvVmSID70xfAD+79MWNwDghaSJbS
 trqpoj8W1vP2oUpfbfWzeuvld+KHEBxCJLD0sHn7TY70hftjp6PU1rOReLKb/AKwukr9
 y+/arE1j83q/c0oU9/NEw6kZjY5JlPI4gzs/exBfnfMZDVg4mBZ86qWa7mfQFcQwq4Du
 r6N9ZUy7o9jLOiHcj3br67SLfAiChLzeVvYusd5YcRdRC/tQIGWm6M5L+HpSBU8GJ6YA
 MHVmTpeWKtZE/HfcjmYbjIx0UYEYCMr/Hn7KkiEgiD4tCzItvO+7WqK6qScpa3yR7ejO
 zXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3JohjUI9LAEW5SG/90YHiYMTiplsOeONINKJbnWHLoc=;
 b=US7lkyjv/QMsawcHa7WFS4V50p26ZBojnSOMolfbkvd5MZWfMmP2V3/+N5+dwAhAR3
 oVJke1ycIGQEbguRrrjXaHoPtAHIjSHeu9RBySBKvf+ibHR+X0TkdKxcJivYWox1Z8ja
 fEUMC/KKYE9YeoqmAr2SdXRuHjzie7GjfTjmuJXBLiQCyLIWkMf7NULANjYufuAqPXnP
 WX0C0DlR+lmK4ewW9sqtDML2Q5uoE3/7P4mJF06W6Y+74W4QQ4K/fa9YVYrnT1XJrB0g
 RR9c/wEhFBALXlGqE0WjgxLkgZyb+X0s1CwM/XCCOfirIfRIsz8ZtG1bsE6BlezNfYuD
 1YsA==
X-Gm-Message-State: ANoB5pmZnkqK23vuNSUM0KhTQZHP3LaeAq4f+EXFgr61deRStTtYRKkm
 vjoLO05e7juvGcpHj7Vx1cGOCA==
X-Google-Smtp-Source: AA0mqf5/pTRfSK5n7YyZbiagXnWeZ3zZdyE/YEXSzP5QtMoh/rIMEfg7W0xWQyaOefuVpqSPFY3cJg==
X-Received: by 2002:a05:6830:184:b0:670:6f28:f47c with SMTP id
 q4-20020a056830018400b006706f28f47cmr11266437ota.9.1670949790496; 
 Tue, 13 Dec 2022 08:43:10 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:c63:85ed:4256:8ad0?
 ([2806:102e:18:2efc:c63:85ed:4256:8ad0])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a056830200d00b00661ad8741b4sm1377945otp.24.2022.12.13.08.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 08:43:10 -0800 (PST)
Message-ID: <4e2f5e5a-5cce-5dfd-79db-456b91687c1a@linaro.org>
Date: Tue, 13 Dec 2022 10:43:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 25/27] tcg/s390x: Tighten constraints for 64-bit compare
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20221209020530.396391-1-richard.henderson@linaro.org>
 <20221209020530.396391-26-richard.henderson@linaro.org>
 <20221213162516.tfiopikzv5ilhgwf@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221213162516.tfiopikzv5ilhgwf@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
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

On 12/13/22 10:25, Ilya Leoshkevich wrote:
> On Thu, Dec 08, 2022 at 08:05:28PM -0600, Richard Henderson wrote:
>> Give 64-bit comparison second operand a signed 33-bit immediate.
>> This is the smallest superset of uint32_t and int32_t, as used
>> by CLGFI and CGFI respectively.  The rest of the 33-bit space
>> can be loaded into TCG_TMP0.  Drop use of the constant pool.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/s390x/tcg-target-con-set.h |  3 +++
>>   tcg/s390x/tcg-target.c.inc     | 27 ++++++++++++++-------------
>>   2 files changed, 17 insertions(+), 13 deletions(-)
> 
> <...>
>   
>> --- a/tcg/s390x/tcg-target.c.inc
>> +++ b/tcg/s390x/tcg-target.c.inc
>> @@ -1249,22 +1249,20 @@ static int tgen_cmp2(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
>>               tcg_out_insn_RIL(s, op, r1, c2);
>>               goto exit;
>>           }
>> +
>> +        /*
>> +         * Constraints are for a signed 33-bit operand, which is a
>> +         * convenient superset of this signed/unsigned test.
>> +         */
>>           if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
>>               op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
>>               tcg_out_insn_RIL(s, op, r1, c2);
>>               goto exit;
>>           }
>>   
>> -        /* Use the constant pool, but not for small constants.  */
>> -        if (maybe_out_small_movi(s, type, TCG_TMP0, c2)) {
>> -            c2 = TCG_TMP0;
>> -            /* fall through to reg-reg */
>> -        } else {
>> -            op = (is_unsigned ? RIL_CLGRL : RIL_CGRL);
>> -            tcg_out_insn_RIL(s, op, r1, 0);
>> -            new_pool_label(s, c2, R_390_PC32DBL, s->code_ptr - 2, 2);
>> -            goto exit;
>> -        }
>> +        /* Load everything else into a register. */
>> +        tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, c2);
>> +        c2 = TCG_TMP0;
> 
> What does tightening the constraint give us, if we have to handle the
> "everything else" case anyway, even for values that match
> TCG_CT_CONST_S33?

Values outside const_s33 get loaded by the register allocator, which means the value in 
the register might get re-used.

> The example that I have in mind is:
> 
> - Comparison: r0_64 s<= -0xffffffffL;
> - tcg_target_const_match(-0xffffffffL, TCG_TYPE_I64,
>                           TCG_CT_CONST_S33) == true;
> - (long)(int)-0xffffffffL != -0xffffffff;
> - So we should end up in the "everything else" branch.

I suppose I could invent a new constraint that matches INT_MIN32 .. UINT32_MAX, which 
would exclude this particular case.  But it would still leave us loading INT32MIN .. -1 
for unsigned and INT32MAX+1 .. UINT32_MAX for signed.

Since S33 existed already, I thought I would just re-use it.


r~

