Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24136ACF18
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 21:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZHMJ-0005KS-GS; Mon, 06 Mar 2023 15:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZHMH-0005Jy-SI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:22:57 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZHMG-0004zc-FN
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:22:57 -0500
Received: by mail-pj1-x102e.google.com with SMTP id oj5so10992782pjb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 12:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678134175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qo28plNB4kvSOAafomy+Dy47pZNW1bFIzKmkMBa7LNg=;
 b=xseOqtHkRqUqvbyNLh1CVwZfmU33rxwODYEqOugFfNmyPG5tz19JurZRtsVbfX+f2h
 E5qeEnLaJO+NXWBCqQgXJF3ngkwZxQO4DUafqMfg4A9mqAvewwwz374Kfv9JipqXIICe
 KBS8VE8li1oiDFuy8r1pNhUJHhXmoggiR6xdJmuDlfB1tUsly+32s3Pjwd98jvhWGLZr
 g8TpU7YVbs2ynz92b2jNX2n4mGC0ujCnVVNMiVmwkan0JlwMVOkm2abT1xvMXnVQLTeK
 tk+qdQaVxrqXhPLEDXo3u/OvFuT1kyh6/QYpptvoiLjkQlQPXeenQcXteFrPLx8u45hb
 ptyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678134175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qo28plNB4kvSOAafomy+Dy47pZNW1bFIzKmkMBa7LNg=;
 b=c7dlx4MHcKEmqRlj5bHiOVqS7Fz9OCaHdR+ukx/KYxrbu6SkauRbBJDIxhtcwtCXrU
 VZeCmkxz3EnBLMIG2CE+mtziORFQ2cvYOX7D09izIbJedssAfe9jAv+H9m3qqDdU6CvD
 NV3EequnF541UbhHsy6TzC/rVOLH1K4DDbM6btqSoUWRYMQ+1LpmSUkJ4GSVw6+UlA8o
 T6SGk84jWw/+6p3XtHHYSWWZoHSIUd6GXhOX7tR7iIvxAuLbnMrW31QvId5jkNQ72vXN
 Bcy7ovvGMeh8wmAo9uWsLtgUNPq97oK/DzskZU/lLppeHpm2eXfYEFukXbSWcLR5htTa
 MhrA==
X-Gm-Message-State: AO0yUKVNxME+YPE/lCwA006Y8OhyNBScDHYpFNWMduUksfOBPUe3Kq/M
 AoKKzaWTLohqGD0F6eilpduOKA==
X-Google-Smtp-Source: AK7set9ty+XV8Cn5ApJsyeL3D940Oi+oOlhhcV3MkjxTUIKZDcdFPr96CEz1evtK/xhVIyQySgCUfg==
X-Received: by 2002:a17:902:b684:b0:19c:e666:a678 with SMTP id
 c4-20020a170902b68400b0019ce666a678mr10298003pls.50.1678134174773; 
 Mon, 06 Mar 2023 12:22:54 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a1709029a4700b0019abb539cddsm7121848plv.10.2023.03.06.12.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 12:22:54 -0800 (PST)
Message-ID: <035eeedd-9bba-43f1-2f19-2b51cec2d846@linaro.org>
Date: Mon, 6 Mar 2023 12:22:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Qemu-devel] [PULL 11/29] target/riscv: Convert RV32F insns to
 decodetree
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peer Adelt <peer.adelt@hni.uni-paderborn.de>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20190312131526.14710-1-palmer@sifive.com>
 <20190312131526.14710-12-palmer@sifive.com>
 <69d3e5e4-a563-61a6-c3e0-8a6ef026ac8f@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <69d3e5e4-a563-61a6-c3e0-8a6ef026ac8f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 3/6/23 06:11, Philippe Mathieu-Daudé wrote:
> Hi Palmer, Bastian,
> 
> (old patch)
> 
> On 12/3/19 14:15, Palmer Dabbelt wrote:
>> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
>> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>   target/riscv/insn32.decode              |  35 +++
>>   target/riscv/insn_trans/trans_rvf.inc.c | 379 ++++++++++++++++++++++++
>>   target/riscv/translate.c                |   1 +
>>   3 files changed, 415 insertions(+)
>>   create mode 100644 target/riscv/insn_trans/trans_rvf.inc.c
> 
> 
>> +static bool trans_fmv_x_w(DisasContext *ctx, arg_fmv_x_w *a)
>> +{
>> +    /* NOTE: This was FMV.X.S in an earlier version of the ISA spec! */
>> +    REQUIRE_FPU;
>> +    REQUIRE_EXT(ctx, RVF);
>> +
>> +    TCGv t0 = tcg_temp_new();
>> +
>> +#if defined(TARGET_RISCV64)
> 
> Just noticed this while reviewing Richard's "tcg: Remove tcg_const_*'
> recent series, shouldn't be this #if condition inverted?

No, you'd notice the compile error straight away.

r~

> 
>> +    tcg_gen_ext32s_tl(t0, cpu_fpr[a->rs1]);
>> +#else
>> +    tcg_gen_extrl_i64_i32(t0, cpu_fpr[a->rs1]);
>> +#endif
>> +
>> +    gen_set_gpr(a->rd, t0);
>> +    tcg_temp_free(t0);
>> +
>> +    return true;
>> +}
> 
> 


