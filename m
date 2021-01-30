Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA9309278
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 07:48:51 +0100 (CET)
Received: from localhost ([::1]:36646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5k3u-0007xJ-6T
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 01:48:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5k37-0007Qn-HM
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 01:48:01 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5k35-0002BA-My
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 01:48:01 -0500
Received: by mail-pg1-x530.google.com with SMTP id b21so8114102pgk.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 22:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yuO2ntIrGrFUude//VlLzEY0+iKc3vtBLzDra/FRCAs=;
 b=Xbu1KFo7YfPPYdZCia8215HT46NoFjw9MkNYkwu8gXhmoFyEh3JMciY99LlOwZ8SkS
 jiqwhHhwzaBoMTbxfL5KpPFGhAm2GBCuNa24R9sw7xyDrIovZ+fMtxLmrNh1vKD0R9p9
 YiFWd9PLlPpngVSkRt2lW+RSFvIob2xFwYqrXtn5fnWGAZZXxQQNi6xUTF9xNaVqi8X3
 xg2RFGD5iDWAsDetfOl19U9MZ0HKHL/qRzvBG/k3Vg9LwRdvsaeR3uauzpP42kTsk2Zd
 yyj6ybyPlbO8H8yFdPU9y2fKf2V6CG3cW2vBixCseo5Xz0mgC2wGuGslgvm19fIagJ4C
 L/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yuO2ntIrGrFUude//VlLzEY0+iKc3vtBLzDra/FRCAs=;
 b=lreB2di2TIkNyK+nKPU+nzFqLWwJP5BVxzfenupUJUHIVOpvYIyay8r0KzSidChlw3
 PoSAe6QEByoFeKQj5+y/2aXfFbnOLWjKbxNarGl4obmpXliokYjW7YXzhwZm2T+K/W69
 hq5nw+YrJoR9MT2IB5ozhAhIxC2dMJJ7AK/6KsIU0TLO4tg0Tlu3oPgvBDwdJfJ0uya2
 1A3oe9N8bc7rqO57+25gqDybL5MCK73HfaWkgmIvObUApK4A2U+eS2jm1jQUNHIhkk62
 ITe+4Wkc9kD590R5Z9Bhk9U+FKU5ctdS0OUNgSZ8SJR8DlWEViQ7o2h2vS0bcW3qHRQV
 eckw==
X-Gm-Message-State: AOAM533SzkYVwrJCwlRm5Kk4C096vrW0h5KUYWI4aOYcSTbUZP/IHQ61
 27Qy3ecr7gMxb4Vk/WYNKzEkVSprpzS68HyN
X-Google-Smtp-Source: ABdhPJyfr2SVw5vVvFDA+ijZS7r6n3QbnAjq2yvIQf7/ls7bImqU7cGzixw/8WW0pc7T9kMg267+XA==
X-Received: by 2002:a63:a542:: with SMTP id r2mr7977627pgu.211.1611989277664; 
 Fri, 29 Jan 2021 22:47:57 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id h1sm10870999pgj.59.2021.01.29.22.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 22:47:57 -0800 (PST)
Subject: Re: [PATCH v3 02/24] tcg/tci: Remove TCG_TARGET_HAS_* ifdefs
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-3-richard.henderson@linaro.org>
 <CAFEAcA-Ez=3Xv5jVei1E3noa20D17_Uz_HFOmXK5Ek_p0_dwkA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce10459d-0dde-6a1f-2efa-5643ebf2931d@linaro.org>
Date: Fri, 29 Jan 2021 20:47:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Ez=3Xv5jVei1E3noa20D17_Uz_HFOmXK5Ek_p0_dwkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 1:16 PM, Peter Maydell wrote:
> On Fri, 29 Jan 2021 at 20:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The opcodes always exist, regardless of whether or not they
>> are enabled.  Remove the unnecessary ifdefs.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/tci/tcg-target.c.inc | 82 ----------------------------------------
>>  1 file changed, 82 deletions(-)
>>
>> diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
>> index 9c45f5f88f..b62e14d5ce 100644
>> --- a/tcg/tci/tcg-target.c.inc
>> +++ b/tcg/tci/tcg-target.c.inc
>> @@ -71,70 +71,42 @@ static const TCGTargetOpDef tcg_target_op_defs[] = {
>>      { INDEX_op_add_i32, { R, RI, RI } },
>>      { INDEX_op_sub_i32, { R, RI, RI } },
>>      { INDEX_op_mul_i32, { R, RI, RI } },
>> -#if TCG_TARGET_HAS_div_i32
>>      { INDEX_op_div_i32, { R, R, R } },
>>      { INDEX_op_divu_i32, { R, R, R } },
>>      { INDEX_op_rem_i32, { R, R, R } },
>>      { INDEX_op_remu_i32, { R, R, R } },
>> -#elif TCG_TARGET_HAS_div2_i32
>> -    { INDEX_op_div2_i32, { R, R, "0", "1", R } },
>> -    { INDEX_op_divu2_i32, { R, R, "0", "1", R } },
>> -#endif
> 
>> -#if TCG_TARGET_HAS_div_i64
>>      { INDEX_op_div_i64, { R, R, R } },
>>      { INDEX_op_divu_i64, { R, R, R } },
>>      { INDEX_op_rem_i64, { R, R, R } },
>>      { INDEX_op_remu_i64, { R, R, R } },
>> -#elif TCG_TARGET_HAS_div2_i64
>> -    { INDEX_op_div2_i64, { R, R, "0", "1", R } },
>> -    { INDEX_op_divu2_i64, { R, R, "0", "1", R } },
>> -#endif
> 
> Why are div2/divu2 special cases such that their entries
> get deleted rather than unconditionally included ?

Because div/div2 are mutually exclusive.


r~


