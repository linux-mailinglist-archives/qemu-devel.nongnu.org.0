Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC560D7B5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:11:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onT1w-0001S7-47; Tue, 25 Oct 2022 19:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onT1t-0001RX-7j
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:08:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onT1q-0005jE-T8
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:08:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id l6so8730916pjj.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gV1qoi58poGkroyEMs7wUaTlHjvhzd7qaT2YZXCzr+k=;
 b=gBBkzEO0Wfqq/IgGydhjqAgyzClfaL2AYXh6SBRkZPT2dNevLb08q2Gsj6Uo9XMVkS
 Nj3G8zhTmIWZ5EWHsNHKGvPttD97GIlnENdPJIDYQfOFAKz2Th2BuCBK6dGzK04xjnlO
 T/MELkT7nAtijofzq3gA1ndtUmDHfhrZdIgY/pDWR3/iHRca1YLjhCXjjQ/A71+k55xT
 FTwUb/qj8n+GRVL39JHrrkPQNH5rLwfnuUs2dwQwTFabdG2oMF7bpdFhuRfLIoW8GdCc
 CtzvYdcAvpiuudkt+HoibguN4Rsyu7NEj1a1DfSVaPzDg35xETx3m36ckxctrT2CAf2D
 1lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gV1qoi58poGkroyEMs7wUaTlHjvhzd7qaT2YZXCzr+k=;
 b=i/xQ58xX++WCE1Yl7GuuryBUgrq3ifZWQcKD2cM+IFDz4zw/EeUdp8A65azXbpELku
 WiYty53TOGQ0ZAthk2uMH6ol6LYj/4D/eHFsmr98S9sjgW/cPLRAl2z+FM4XNGmS5Dww
 97w6HuPDNg+2h8GZBMLxcjzECSKB/gcYm5aORAi6mLmxvI37UnMk6ygZF3nDH8hdJx7r
 0QFO0jGWuVAF54Yp86vf5OMwxCDf1eCy/esuDa6nIb4OKeIG0IJZ33nBmp/uXcR9jqv+
 vWHf/jtR+orHIEP+zpuIjLZu/cpN8J5WwOgzepORcnpFu6DPILdeSl+uG10UtHNfd4dH
 EfhQ==
X-Gm-Message-State: ACrzQf3ZV+y/fP7WfwD5m1TtQpdtCXi2gzhiZU98pXrxCZDlNSRARQvq
 0AkLdqlGU0fqQJTquE3PAX6mjQ==
X-Google-Smtp-Source: AMsMyM7UZjRhmaH1Uwa/Cvs7R5wHhBhSAKJd7OsoBFaCfRmt2OHr++wkZUxsl9xzIn8RPNjKAuKSAg==
X-Received: by 2002:a17:902:ea03:b0:180:b53f:6da with SMTP id
 s3-20020a170902ea0300b00180b53f06damr40256413plg.69.1666739293173; 
 Tue, 25 Oct 2022 16:08:13 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a170902bd8e00b0017e232b6724sm1685336pls.69.2022.10.25.16.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 16:08:12 -0700 (PDT)
Message-ID: <0b40f9ef-0838-395c-11ec-052124a48c63@linaro.org>
Date: Wed, 26 Oct 2022 09:08:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 24/29] accel/tcg: Introduce cpu_unwind_state_data
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-26-richard.henderson@linaro.org>
 <b8e90076-2f42-0eb9-60df-4e9df4e9e5b5@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b8e90076-2f42-0eb9-60df-4e9df4e9e5b5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 19:23, Claudio Fontana wrote:
>> +/*
>> + * The cpu state corresponding to 'host_pc' is restored.
>> + * When reset_icount is true, current TB will be interrupted and
>> + * icount should be recalculated.
>> + */
>> +static void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>> +                                      uintptr_t host_pc, bool reset_icount)
>> +{
>> +    uint64_t data[TARGET_INSN_START_WORDS];
>> +#ifdef CONFIG_PROFILER
>> +    TCGProfile *prof = &tcg_ctx->prof;
>> +    int64_t ti = profile_getclock();
>> +#endif
>> +    int insns_left = cpu_unwind_data_from_tb(tb, host_pc, data);
>> +
>> +    if (insns_left < 0) {
>> +        return;
>> +    }
> 
> Is the -1 return value some error condition to do anything about, log, tcg assert, or ...,
> under some DEBUG_* condition, or ignored as done here?

Interesting question.

By presenting this tb, have we asserted that host_pc is within (otherwise, why select this 
tb).  But if we didn't find host_pc within the unwind data... that suggests that the tcg 
backend code generation may be wrong, generating an exception at an unexpected point.

But for the purposes of this patch, it is no change in behaviour.  Previously we returned 
from the function without goto found.


r~

