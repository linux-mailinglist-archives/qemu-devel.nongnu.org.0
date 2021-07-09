Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECEA3C276E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:21:14 +0200 (CEST)
Received: from localhost ([::1]:55362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tFZ-0005oz-PC
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1t9t-0003xL-4g
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:15:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1t9r-0003V1-DC
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:15:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m2so1835905wrq.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l/9W+VrlpCJSsiwyn32cWDa01SrNphSmlmnQCSIBIeI=;
 b=Sq8HD6kmGUZ5n8q+LNbSZeyFhMr8ZcjPZjutQhCHU5m0NwJ80I4v63oeh4i90ajQjY
 7wqJYH4edltYsOESFt/qTtmOmpRFQnvxQIX6PaapzX/s/SHkDMxSbfg3QKkFmuxZj0lY
 MoBYLJhF8xI910ArmgXS6huvHgckQa4TfciNFqUv41pYis/tMSjYnI1mUn+lmWnE1Vhn
 7JKNkkxEadiajkzSCnkWEVQSxz0azJzpjN37NZZrycf0jpkRyX/ImDP4PqFGOltDegqr
 nldg/fn80T1aS60OPamVmDu5/5jRAF7oaeUevzU9JjZR34Dbg+CLxyKR8J6IKDGVjjWj
 P4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l/9W+VrlpCJSsiwyn32cWDa01SrNphSmlmnQCSIBIeI=;
 b=T3pS2PSD98plNbkWry90z8Bff3YocMPp2Edi2HvMzEUxhzJXbeWbqgHM+HpEczVyWA
 nIkVDQZjk3x1lC/Qi0bG/VUVqjhV3+uFDuZNs0HNk2z2qg52bdQiBwfepTlFVlx1xj/B
 sMI64agmPSkDKrnfyfgA+t9heCNHslh7H8agHKQS96iozoX1GJ0c3Xl2aC2ZQn8vk7Ls
 OcQMWOK3uZ/DwwOtjzNXEKIQc2C+LyCrJHkaThG4U4+SnFPj/PQia24xt/yWIB6xTGh5
 sMOhERC14QKJnfAI0baEaex78vdJMeTmCI7pychLD5uMkK9c0sebXVcjsZlN7o/kqKjT
 Cxqg==
X-Gm-Message-State: AOAM532tMenTcY75o0gbm3rXUakAGpkB52ejrwxK4YHhdRhkRdcFNtqK
 R8W2CrDGDVn0+l5RSfPyyVQ6tbHDqEg=
X-Google-Smtp-Source: ABdhPJwCiihtmW+NM/pESLoZHMv90Dwf3wSjeWiYQchKzjPGNK/Wx1iW3y5VO3REYrwe7Iqa6xcPag==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr3050317wrt.46.1625847316575; 
 Fri, 09 Jul 2021 09:15:16 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 2sm5022996wmn.44.2021.07.09.09.15.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:15:15 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/hppa: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708205807.827147-1-richard.henderson@linaro.org>
 <20210708205807.827147-2-richard.henderson@linaro.org>
 <b5f660c2-7e93-2442-34ed-f2673781a053@amsat.org>
 <4531bd57-2d18-5a8a-c4f5-2c6b7ac4389c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <87325c4f-d11e-595d-bb4c-98db32f4010f@amsat.org>
Date: Fri, 9 Jul 2021 18:15:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4531bd57-2d18-5a8a-c4f5-2c6b7ac4389c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/9/21 4:24 PM, Richard Henderson wrote:
> On 7/9/21 12:08 AM, Philippe Mathieu-Daudé wrote:
>> What about this one?
>>
>> @@ -3385,7 +3385,7 @@ static bool do_depw_sar(DisasContext *ct
>>       /* Convert big-endian bit numbering in SAR to left-shift.  */
>>       tcg_gen_xori_reg(shift, cpu_sar, TARGET_REGISTER_BITS - 1);
>>
>> -    mask = tcg_const_reg(msb + (msb - 1));
>> +    mask = tcg_constant_reg(msb + (msb - 1));
>>       tcg_gen_and_reg(tmp, val, mask);
>>       if (rs) {
>>           tcg_gen_shl_reg(mask, mask, shift);
> 
> Also used as destination, so it's an initialized temp not a constant.

Obviously... Sorry :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

