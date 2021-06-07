Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563339E040
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 17:24:14 +0200 (CEST)
Received: from localhost ([::1]:57314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqH6r-0005ia-25
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 11:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqH5a-00052D-E7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:22:54 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqH5X-0006Ia-BJ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 11:22:53 -0400
Received: by mail-pg1-x52c.google.com with SMTP id i34so7637196pgl.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 08:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jeJvAzvkyzHhV5+53LU4/cs5nY4fklN2BOaz2BwcFH4=;
 b=b90x1YCnfq9aZCS+k34ScRdN0ol1mWD784rQJBKoUA0lfxy6dWhu+Qmez+9hH1Fx6p
 Uk3DgxSeUcl7yJqpvaRQzjsvUP1s8E2bLYwR2NNDF4Skbj+9FOZ6ThiSwH4KX775K31L
 YGB3S/ogP83RUG5KMwwoxJEJN7VNwWuoQpWJmUQgq7a2rB5S0TidEZuLT6cekWxGDJDj
 DpOtCmTj1igcOoIFmbcW/ocAON7pXDF+QWasOpWRrA0SMKGNjiQf/IocKTg3xE9JCDg9
 Zik++l7+X40SQu3xY5uI13qpJiqJC7EydoduFGiTjZjMt0M4yHAQynIvjIK6DQ/DVTQg
 E5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jeJvAzvkyzHhV5+53LU4/cs5nY4fklN2BOaz2BwcFH4=;
 b=bIyJp3B8BplMcN5kLl2EL3RlfsOuSl/QEZU4OrdYd86PsX+izLI6S7pYF6LrOp+J0M
 tsRyIxT9v9gBuhn4smveSyq5rAqAVj9QHjfE+/j8e8lGKQLLERxNUomXop1xSOuAK6Ci
 wYVfKcT/ncC04XPYT4JKB78GypUyH4/jZlyZbj3HBDJaJNBn8wFhOriAF/JC8jR0pKx8
 IQClnn8DAMfJhDFtA4aK56IHxhoHCLb9GyJx4Q3c+Et22Uk939fkaTOGgoQHlevQvdBQ
 VWeKg6FMyez3fbNDrjxyDIcg09jBLohwQl1hLATrxsb0tlb0gvkHQsMPhEU9e8F4pgYd
 79VQ==
X-Gm-Message-State: AOAM531dPtR3WhsjeWNk47yVPZ6sOnmtwVFDlGX0JMEQSa/HLwMMPca5
 kGu6bwK9rOLFD0AttEsDck+zVw==
X-Google-Smtp-Source: ABdhPJytUJumx8AuFmZwC4yLzz6s0X78FN7p7QHXG6+h+zTACwd4cH5kOrgoIVkjMGTJFiRFX2Cn/Q==
X-Received: by 2002:a63:4b0f:: with SMTP id y15mr15177613pga.227.1623079368853; 
 Mon, 07 Jun 2021 08:22:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f13sm8533384pfa.207.2021.06.07.08.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 08:22:48 -0700 (PDT)
Subject: Re: [PATCH] tcg: Introduce tcg_remove_ops_after
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210604212747.959028-1-richard.henderson@linaro.org>
 <CAFEAcA-EFkuWb8aHhiiN7Wu9n302A8hdoHUzn7txOVhEyOX=Fg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c934f15-765e-d3bc-7ea7-9aa112d1fd39@linaro.org>
Date: Mon, 7 Jun 2021 08:22:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-EFkuWb8aHhiiN7Wu9n302A8hdoHUzn7txOVhEyOX=Fg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 6:51 AM, Peter Maydell wrote:
>> +void tcg_remove_ops_after(TCGOp *op);
> 
> A doc comment would be nice.

Fair enough.

> This looks OK as far as TCG proper goes, but is it going to confuse
> the TCG plugin infrastructure if a frontend generates a bunch of
> TCG IR and then winds back the insn stream and generates something
> else instead ? I see some calls from tcg/ into plugin related
> functions, so I'm not sure...

Mm.  Didn't think about that Friday.  But looking now, if you wind back to 
dc->insn_start, everything will be fine.

The plugin stuff will put stuff in the stream, and then go back and 
post-process it.  But it does not record anything on the side, so if the stuff 
is no longer in the stream all's well.


r~

