Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE93A4F7F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 17:41:15 +0200 (CEST)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls5l4-00037w-Ck
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 11:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ls5k1-0002O9-ND
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 11:40:09 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ls5jz-0003jI-Ms
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 11:40:09 -0400
Received: by mail-pg1-x531.google.com with SMTP id l1so5017022pgm.1
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=T3hjWwp0NWIZ7H/gZUgOfEjDzB9VU/mAfCr3dYs87LE=;
 b=sCt/7Jo2+2y5d7gjPiXOB5Ugnn2sJrju3BqXSzhkoYMJRSGbpcGvfZ1XTqsWZElrkm
 8d0UwjrlHg+2tGGHqRi4PnCjTVG5zIMMaGiobrrBQe12BuKQqyZ5NBVH5MkNHg42DtnL
 3Lh/2W+yLzdte6Rx2p9clGU/FE52UWWFfPAl1nqjI4iiAB+8XE3+kghzNYRRsuu/TlaF
 sXoyC8GkwnXGF/kNgY+sa3/6uQCev3b0w3uF4o4qe2sxOlUvesObCOaHJF10yrpEaKo5
 u6x9KRLcmgwcejesCIBv4QLfSp1mmDqMeTUE42ZPr4/scUbbhpxRfAvLjOpsr09bb+uE
 pXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T3hjWwp0NWIZ7H/gZUgOfEjDzB9VU/mAfCr3dYs87LE=;
 b=LvOplrDmu59dnYXox6QveWqPVv2XAANJAH1D+2KXWwNrJJXInm/yPgfQ89KQ7/jUkq
 lprEWZYmdOw4QJMVS9GZ0qOMOzBKVDATJFf11Fl37Vb7tjYuWhIhri1M83w9l8VdBGol
 zPLv1ZPaJDaPjXbfiRGMaCOM0gidQU5G/DTozTgoDHMbUIxNLqK2TLh+eR3Pn7AM1ZkP
 0lGkhpfPvf7jZS7MIE3Lm2pjwJn93WXbDc5cPItn0EHr/udKIb5jD9G2w5gqFP3vYT3b
 j+CoBFiXem5Hhcc/rvtQtM8YHV9awliE43I0M4CalqdCXciqh0OYo8RxcalRdx8kr6F7
 eX+A==
X-Gm-Message-State: AOAM530aLgdcOdwmbJc3ltuuRWtEwywvJoRwgWqtOvDu+MKZJVdX8fmg
 AbwFsIttWXdihDO4WwY3YfkHqA6y+yg8Xw==
X-Google-Smtp-Source: ABdhPJwIAhUOQT2lR9fMVmWTb/qwc4FESxG4QjzyoUIZ9b6HZ7EElu2wdEtIJuK5xkf/Gpb3VhD+9A==
X-Received: by 2002:a62:834f:0:b029:2f2:9935:8fcb with SMTP id
 h76-20020a62834f0000b02902f299358fcbmr13645541pfe.68.1623512405233; 
 Sat, 12 Jun 2021 08:40:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x28sm7916618pff.201.2021.06.12.08.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 08:40:04 -0700 (PDT)
Subject: Re: [PATCH v7 15/27] tcg/tci: Change encoding to uint32_t units
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-16-richard.henderson@linaro.org>
 <be90d7b4-cbf9-6ddc-60b8-f8a367697ad3@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <940f5fa5-7ceb-a1bd-d938-eec5e4f40d30@linaro.org>
Date: Sat, 12 Jun 2021 08:40:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <be90d7b4-cbf9-6ddc-60b8-f8a367697ad3@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/12/21 3:21 AM, Philippe Mathieu-Daudé wrote:
> On 6/1/21 5:00 PM, Richard Henderson wrote:
>> This removes all of the problems with unaligned accesses
>> to the bytecode stream.
>>
>> With an 8-bit opcode at the bottom, we have 24 bits remaining,
>> which are generally split into 6 4-bit slots.  This fits well
>> with the maximum length opcodes, e.g. INDEX_op_add2_i32, which
>> have 6 register operands.
>>
>> We have, in previous patches, rearranged things such that there
>> are no operations with a label which have more than one other
>> operand.  Which leaves us with a 20-bit field in which to encode
>> a label, giving us a maximum TB size of 512k -- easily large.
>>
>> Change the INDEX_op_tci_movi_{i32,i64} opcodes to tci_mov[il].
>> The former puts the immediate in the upper 20 bits of the insn,
>> like we do for the label displacement.  The later uses a label
>> to reference an entry in the constant pool.  Thus, in the worst
>> case we still have a single memory reference for any constant,
>> but now the constants are out-of-line of the bytecode and can
>> be shared between different moves saving space.
>>
>> Change INDEX_op_call to use a label to reference a pair of
>> pointers in the constant pool.  This removes the only slightly
>> dodgy link with the layout of struct TCGHelperInfo.
>>
>> The re-encode cannot be done in pieces.
>>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/tcg/tcg-opc.h    |   4 +-
>>   tcg/tci/tcg-target.h     |   3 +-
>>   tcg/tci.c                | 541 +++++++++++++++------------------------
>>   tcg/tci/tcg-target.c.inc | 379 ++++++++++++---------------
>>   tcg/tci/README           |  20 +-
>>   5 files changed, 384 insertions(+), 563 deletions(-)
> [ ... ]
> 
>> +    case 0:
>> +        /* tcg_out_nop_fill uses zeros */
>> +        if (insn == 0) {
>> +            info->fprintf_func(info->stream, "align");
> 
> "nop"?

You can't execute it as a nop.  It's just alignment.

> 
> Otherwise,
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> +            break;
>> +        }
>> +        /* fall through */
>> +
>>       default:
>>           info->fprintf_func(info->stream, "illegal opcode %d", op);
>>           break;
>>       }


