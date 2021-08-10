Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AE33E5320
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:52:21 +0200 (CEST)
Received: from localhost ([::1]:34366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDKgW-0005zd-OG
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDKfj-00059z-H9
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:51:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDKfi-00075V-0g
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:51:31 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h14so24592739wrx.10
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 22:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qAXqajo4/aDsT0MN2Psg66ModrLYUuOGQtLtgVHIHFw=;
 b=Dr0PetkGsRNUDGOxlfoNZ3kMrQN2MGgdPZbCKfVfEfc+3pNhC3pIMmQazbtGVp52gC
 3d85kjgkX5SLgMLC1eLr+taIz93Xwm49oryCD0Ddusz4EgdxWMazjFOfvbsJzC4hsygw
 JEUIcEhpn8Mvoqa+mB1Gi7zNMMWIUQL0dWyvYc4smW/UBK5DEbpc3ucXJjHfzTGkJE6t
 WE/RMpjdDuTxNbhWQjHiJt0hFe3WcrcFs3oONTws6MNRYgzdnCz9+XkYVh5JuJiIADTR
 NdXdDhDyho8tB9nioQXljbWIgqzOJNm06dlFif+SKeGQNmkITvvZo7PP7tVPqs8Sqlt/
 3EcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qAXqajo4/aDsT0MN2Psg66ModrLYUuOGQtLtgVHIHFw=;
 b=l7h350rq93kIxmmxZg9on3NEVUiHYaWmCeD0tR4SrpfQCzbgkVP2AQKSsWgPuyeH/R
 HzYyPMBDFCIsSTln+riQrCNGjfI4fi2Drx1wPD/ueEb964hjdReBQj5VQ8NbTlM1xF2/
 WfMaqQ1PoNVkGTS8y/QlB6Xm3Fz0vHoEe0qBBlpy0NrfeRKrfsvkiroFVRmBiSlhxFMj
 siurk5Se5M1AwTo/WROtZ3Vcqcl4soK62yQ3BdOvEcN4jn4SsV3IJyhQa+wT3Iyw3Brv
 67ScANRCf8RGeaz5DgxBh37nynDR4mDnqknv59uVU8xvuvbMMvZoZlUsO/YibZHm6MDT
 ssUg==
X-Gm-Message-State: AOAM531ugqrxDUPGZeQsj8hyAntYk2EqJfp13FlWV3knCd21QX1o+vFj
 u0Xw7DHRxT+lGHCPpErNzn8=
X-Google-Smtp-Source: ABdhPJx2OgmmraRBPBRBwX8xUK6SFfXAC69D5r8eOPvUlH/CRHJnXfhaXeCujllUu01gBwu1j06uWg==
X-Received: by 2002:a05:6000:10c6:: with SMTP id
 b6mr29298162wrx.110.1628574688092; 
 Mon, 09 Aug 2021 22:51:28 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o22sm1437896wmq.3.2021.08.09.22.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 22:51:27 -0700 (PDT)
Subject: Re: [PATCH 4/6] target/mips: Convert Loongson [D]DIVU.G opcodes to
 decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-5-f4bug@amsat.org>
 <141e2343-1018-bba7-754e-abace2a646ee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c90b947a-f224-42d6-631e-42c1ba53a5b5@amsat.org>
Date: Tue, 10 Aug 2021 07:51:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <141e2343-1018-bba7-754e-abace2a646ee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 8:58 PM, Richard Henderson wrote:
> On 1/12/21 11:55 AM, Philippe Mathieu-Daudé wrote:
>> Convert DIVU.G (divide 32-bit unsigned integers) and DDIVU.G
>> (divide 64-bit unsigned integers) opcodes to decodetree.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/godson2.decode    |  2 ++
>>  target/mips/loong-ext.decode  |  2 ++
>>  target/mips/loong_translate.c | 55 +++++++++++++++++++++++++++++++++++
>>  target/mips/translate.c       | 37 -----------------------
>>  4 files changed, 59 insertions(+), 37 deletions(-)

>> +static bool gen_lext_DIVU_G(DisasContext *s, int rd, int rs, int rt,
>> +                            bool is_double)
>> +{
>> +    TCGv t0, t1;
>> +    TCGLabel *l1, *l2;
>> +
>> +    if (is_double) {
>> +        if (TARGET_LONG_BITS != 64) {
>> +            return false;
>> +        }
>> +        check_mips_64(s);
>> +    }
>> +
>> +    if (rd == 0) {
>> +        /* Treat as NOP. */
>> +        return true;
>> +    }
>> +
>> +    t0 = tcg_temp_local_new();
>> +    t1 = tcg_temp_local_new();
>> +    l1 = gen_new_label();
>> +    l2 = gen_new_label();
>> +
>> +    gen_load_gpr(t0, rs);
>> +    gen_load_gpr(t1, rt);
>> +
>> +    if (!is_double) {
>> +        tcg_gen_ext32u_tl(t0, t0);
>> +        tcg_gen_ext32u_tl(t1, t1);
>> +    }
>> +    tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
>> +    tcg_gen_movi_tl(cpu_gpr[rd], 0);
>> +
>> +    tcg_gen_br(l2);
>> +    gen_set_label(l1);
>> +    tcg_gen_divu_tl(cpu_gpr[rd], t0, t1);
>> +    tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
> 
> this extend should be conditional on !is_double.

Oops, thanks!

> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 

