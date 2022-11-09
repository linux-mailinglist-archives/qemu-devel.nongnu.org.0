Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CE622160
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 02:43:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osa5m-0006v7-FP; Tue, 08 Nov 2022 20:41:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osa5h-0006uZ-2G
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 20:41:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osa5b-0006iX-AE
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 20:41:19 -0500
Received: by mail-pl1-x62e.google.com with SMTP id c2so15731181plz.11
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 17:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZTvzhDiPmcD9AgDEcLa/T6Ufwdr8Mgxd1bu+XyLM8Bs=;
 b=WxZFYGDmw7n/lITLymIxegh3FwXyDngDiJmCbRMZdVkuv9AFz/paGJjXoKbjaJTHCz
 eAY1J+LZDYQMqFj64X8x58KyDC4KL3MIs95HZ7LlCtgD38tHVs+En13Wfr6oA23/ACfo
 PmIq55B7yefM1PFPormewH1SFjdCvGHLki+rn5l3QTXDbjy1Vm5eD5Tu8qvTP8e3aS/I
 3eeZIxOp6TAYOGO5XZE6zOoq8pAwph9af3dERkqighdp9Y36w1TJYwfa/pnYwePJV5PP
 5m5fDDS45DsRUpit1dvmyi0nMmdPXb4L3UUg0uOA5ug7JdQ4Vv5XBMqYgE1XiZogxToN
 chpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZTvzhDiPmcD9AgDEcLa/T6Ufwdr8Mgxd1bu+XyLM8Bs=;
 b=hAU22s5LpTLT67ar9CvfT4IdWIe9rjEuKTDbQwj/lZh7uOgrPLYYlYH9TxS1tFj84t
 Z4F4F9GQ5ZrmxMU69Agh6eXX7F/gsLJYAH2LNbcLTN+TjBEt/vRTOZm+bcBFCNKXzLah
 rfEcTcukbSeoAE91EsvlmbBccUZT86WvsV7nkWBSacWjYTiR/vc5AS0DjaQheGCJ6U3l
 k8whczJFc09EP6EzrHqfHMFYlNGlqk7HmbLOI9KSC6frK9s9XzaHKm/BXLG4OYoe/mYq
 41h4LMMTHT2efZqydjwjukjWUtUGFvdAhRGw14eLcfOOj4tLM+eUZPVxIGb6jXOz93t9
 FjHg==
X-Gm-Message-State: ACrzQf1jczn6gbK/8OSS1M5kGzkhLP74RQoSqGrR+dKcS7/r7bgj619Q
 zpNv7MnbE3iXOqdPRSbUzBirew==
X-Google-Smtp-Source: AMsMyM6srNAvh6SjaUiIpLRTctY7gFGUt5rfbFceTmMIZ0+rKchwgc0tla7Mma5qatjqEjFGs16sGw==
X-Received: by 2002:a17:90b:1b4f:b0:213:353d:10e3 with SMTP id
 nv15-20020a17090b1b4f00b00213353d10e3mr78235040pjb.165.1667958071543; 
 Tue, 08 Nov 2022 17:41:11 -0800 (PST)
Received: from [10.3.10.183] ([203.47.88.146])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170902e88500b001885dbe31dfsm7593798plg.178.2022.11.08.17.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 17:41:11 -0800 (PST)
Message-ID: <652d22e5-6ebd-2bd3-07d5-0b4ca8d7a55c@linaro.org>
Date: Wed, 9 Nov 2022 12:41:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 10/11] Hexagon (target/hexagon) Use direct block
 chaining for direct jump/branch
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
References: <20221108040552.22175-1-tsimpson@quicinc.com>
 <20221108040552.22175-11-tsimpson@quicinc.com>
 <56eccfad-12a7-d854-7e62-d6ec865424f0@linaro.org>
 <SN4PR0201MB88085020EF16C459E65B7032DE3F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <SN4PR0201MB88085020EF16C459E65B7032DE3F9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 11/9/22 02:41, Taylor Simpson wrote:
> 
> 
>> -----Original Message-----
>> From: Richard Henderson <richard.henderson@linaro.org>
>> Sent: Tuesday, November 8, 2022 1:24 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: philmd@linaro.org; ale@rev.ng; anjo@rev.ng; Brian Cain
>> <bcain@quicinc.com>; Matheus Bernardino (QUIC)
>> <quic_mathbern@quicinc.com>
>> Subject: Re: [PATCH v4 10/11] Hexagon (target/hexagon) Use direct block
>> chaining for direct jump/branch
>>
>> On 11/8/22 15:05, Taylor Simpson wrote:
>>>    static void hexagon_tr_tb_start(DisasContextBase *db, CPUState *cpu)
>>>    {
>>> +    DisasContext *ctx = container_of(db, DisasContext, base);
>>> +    ctx->branch_cond = TCG_COND_NEVER;
>>>    }
>>
>> Typically this would go in hexagon_tr_init_disas_context as well, but I don't
>> suppose it really matters.
> 
> AFAICT, these are always called back to back.  So, it's not clear to me what the distinction should be.

ops->tb_start is called after gen_tb_start, so you can emit code that comes after the 
interrupt/icount check, but before the first guest instruction.  Rarely needed, should 
probably be allowed to be NULL.


r~

