Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC6866E2B9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:49:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoCx-0004xx-CX; Tue, 17 Jan 2023 10:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHoCp-0004uq-4r
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:48:59 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHoCn-0008B9-Dv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:48:58 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 7so22281403pga.1
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hj4Q2euY+utrkP+JXzaQUcU+iG3h00AI27hYYVS7I70=;
 b=MyKwY+UonIdAFQPbKvcE7UBjAU8YkrQoLz9xbEyAtgyK36ZsSqVZCAdT4BJ+vCgB4a
 x/fzq9gHGvhAStcY9E7AXU6IHvGWdgPNuBQfO94skP7+BL5h/1+qkSq5+8HyI755oYdO
 UH9LVtlQrpI1ekEDV04gsPj0LuSny+5kOOHgKep8Ifj/1jJCQdOr5jvG+4eYiqQQTFX4
 nO2p4zXVfqE+fx/XydnnsWr0UvOkMR2eHyyTwv8O1iKFR++YdKJ6kVoOgagBKKUGt+WN
 aPqo60wzo84r/EyIUjv/ILsxWTdxsUOg3xfN5xSDLYzr7EOGXVdHC90r9CqqmBO62SOL
 QJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hj4Q2euY+utrkP+JXzaQUcU+iG3h00AI27hYYVS7I70=;
 b=GZWAraPFNHmr6jXFWyaxUrb9Ai1SyZ3UuFcaj0vjETXOthvbaDZdV8eadxZGakz4qz
 20dWXycT+W4Av0OkpTMGynTcyMrPWvOpuigoUg+PuLzawlROSyj0ISttw73stk6kkK6z
 kFTFaKuIz+/b/TxpscRNxs4ZeqG5Sagm2+DxdvrSzBjmNhdP1GvJgH4XOqzpwOxN2w+E
 pnRzLQZRccBw1+e5UppbE/sUDCM0KxPK2kBe3PbCAo1UdE23dexsJrgZW+g/h+8ZejMK
 OY60DbCwOLIf5RfTY3gFe/8388NDviY8rl5NfeGG7lPz9hzJyggbMadCWrjf9RYQ0Uoo
 7wTA==
X-Gm-Message-State: AFqh2krGZG72mSAs3bDMHue5xZgoQp/00pDeNLar4SJPP22dwfSEWChf
 lg7XHFqL5RZuBHshscxsUlrhJA==
X-Google-Smtp-Source: AMrXdXsBreHqUPJvsOzVtRePOkN/d4yp1ADrklYj9jVNEQCjUuM0DrSTMaCKJJJu8ILi6xJPdN0G4Q==
X-Received: by 2002:aa7:8515:0:b0:58d:aae3:bcc1 with SMTP id
 v21-20020aa78515000000b0058daae3bcc1mr2778058pfn.5.1673970535997; 
 Tue, 17 Jan 2023 07:48:55 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u83-20020a627956000000b0058cda506a4fsm5867459pfc.145.2023.01.17.07.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 07:48:55 -0800 (PST)
Message-ID: <16c2871a-9e2a-5113-a121-5373d6e4bb71@linaro.org>
Date: Tue, 17 Jan 2023 05:48:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] target/arm: implement DBGCLAIM registers
Content-Language: en-US
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
 <20230117150405.2940-2-eiakovlev@linux.microsoft.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230117150405.2940-2-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 1/17/23 05:04, Evgeny Iakovlev wrote:
> +    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
> +      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
> +      .access = PL1_RW, .accessfn = access_tda,
> +      .writefn = dbgclaimclr_write, .raw_writefn = dbgclaimclr_raw_write,
> +      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },

You didn't need a new function, just .raw_writefn = raw_write
(which then uses .fieldoffset to dtrt).

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

