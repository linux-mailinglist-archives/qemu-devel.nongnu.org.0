Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38DD4384AF
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:28:05 +0200 (CEST)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLkS-0003p6-Kg
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meLiW-0002bU-QO
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 14:26:04 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meLiE-0004Ik-Um
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 14:26:03 -0400
Received: by mail-pg1-x530.google.com with SMTP id r28so2189472pga.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 11:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UlkNoa5Vb9RrAs8PI/LdnR6ES+9POZTxq8x/X1UDaIQ=;
 b=l3alPYY7mSuqi2SVSa5jCnmJuP7//7dlfYzin53uJwzNlkZ7W1mAF1IJP3sxrf58zC
 UqlHrKHQK456YJm8W50RdenMCdkn37pCS66YKQCOQiP3Mt4l6dLmz0YB7sdrnVerNNXF
 lFASESmb3OobDWYSrlXtnbfEVkKWlDga1EifiI9mmDYHp33N6wr7tpnirExnhc5d05pQ
 EKWk55hNjAWZXiHBWK1Q3yIvj9Ak97mKIimKrtik/EelZa1U9ZBqhvzsgITn4/Rv7c4k
 4LaBrhf+FQJmP+TVoeJmgjC3+qH5XPvfED8rgXxUrBF/o0EPBd2TDpi5YUypoGRFfu6T
 djBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UlkNoa5Vb9RrAs8PI/LdnR6ES+9POZTxq8x/X1UDaIQ=;
 b=ObEmIvVDbmA9pF3qumy9J6+xEdasvHreNlTuiVNpGnX33oLUXcO2LMS0Cmvf9Bg3ty
 Gn0W800fkAvBwVVywXSvo/AZhDNBkbsIHwdUzWp5WHDLUzmrJzUQCwdh/li4BHpeZ/7F
 OmtGRh9kH6YjKvN9eAbuGq9ARJfCaBmZNhUwCeqWiHZI9vh21m+V+c6PwT0eZs8SFVEU
 zYGjk/22BPaUvAv0uJGPcYyO34Rt+/pwqCVcQlIuh5PqxK2i1vT5KMi2xM0w0C4DuGOP
 zRfrzDdjwdsrU6oUiJf3b5cG6p9eqOKGy46qjKyVonaRvApZMN7Su4Kgz1FJQFfup8Zx
 RMSQ==
X-Gm-Message-State: AOAM533ahexY7uEzVT07ikIu9CTCDrScaMScMbltbUR79Yu+mNhKZRRQ
 erv/ns/05hHzTXEuDq9V8YTz1w==
X-Google-Smtp-Source: ABdhPJzs2idoFiUdnkK2T6lZFp7FYRT4wKX7gKh5sqqmj4yJ+SJECOrJ+qRr45BnAPSPCBEseGUnqQ==
X-Received: by 2002:a62:1b86:0:b0:47b:d112:96d4 with SMTP id
 b128-20020a621b86000000b0047bd11296d4mr5204185pfb.52.1635013540040; 
 Sat, 23 Oct 2021 11:25:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k16sm1540020pff.130.2021.10.23.11.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 11:25:39 -0700 (PDT)
Subject: Re: [PATCH v3 33/48] tcg/optimize: Add type to OptContext
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-34-richard.henderson@linaro.org>
 <CPXPR80MB52241D92F187BA5F64608712DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e768de9-5862-c719-2c8a-099f94873b2a@linaro.org>
Date: Sat, 23 Oct 2021 11:25:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB52241D92F187BA5F64608712DA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 3:11 PM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
>> @@ -1392,18 +1408,18 @@ void tcg_optimize(TCGContext *s)
>>                       /* Proceed with possible constant folding. */
>>                       break;
>>                   }
>> -                if (opc == INDEX_op_sub_i32) {
>> +                switch (ctx.type) {
>> +                case TCG_TYPE_I32:
>>                       neg_op = INDEX_op_neg_i32;
>>                       have_neg = TCG_TARGET_HAS_neg_i32;
>> -                } else if (opc == INDEX_op_sub_i64) {
>> +                    break;
>> +                case TCG_TYPE_I64:
>>                       neg_op = INDEX_op_neg_i64;
>>                       have_neg = TCG_TARGET_HAS_neg_i64;
>> -                } else if (TCG_TARGET_HAS_neg_vec) {
>> -                    TCGType type = TCGOP_VECL(op) + TCG_TYPE_V64;
>> -                    unsigned vece = TCGOP_VECE(op);
>> +                    break;
>> +                default:
>>                       neg_op = INDEX_op_neg_vec;
>> -                    have_neg = tcg_can_emit_vec_op(neg_op, type, vece) > 0;
>> -                } else {
>> +                    have_neg = tcg_can_emit_vec_op(neg_op, ctx.type,
>> + TCGOP_VECE(op)) > 0;
> 
> Should we replace the 'default' here with a case for TCG_TYPE_V{64,128,256} and add a new 'default' with g_assert_not_reached()?

Yes, that's probably a good idea.


r~

