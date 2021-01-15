Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC92F87F1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:53:11 +0100 (CET)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0X1q-0008R1-Q6
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Wzy-00079k-9M
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:51:17 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Wzt-00036w-UC
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:51:13 -0500
Received: by mail-pj1-x102e.google.com with SMTP id cq1so5818465pjb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jz3EiJ+oClwZejEb7ZzSpC3TiYzEL7QLTnZboUuVmPw=;
 b=Qfvd+7JCsA6kK3Jp19PpywdWcwvoaM3yIGFUr/3H+nU96T+JHS4CO9xNsN+M/yFPLs
 jLGC/4NcK0DrLVqzxv7xE01Y9cW/xHzBMknU2pX5L1bfh0GPM855rSF2oarRDT2SjPhU
 26o7gZZGaDYHomFk9yaCMYoqwf2CUK+zl4wnPC/mLIyje5w0k5e9s1oUqHrdRNgnX2l6
 T8EtvdAe/KXuW61Jkk29HGBjVIQWzHQj4xvyRiCvwQ9kjCcPjA4Gk7POa2E/UAr8ROiv
 yJrRBi76Byfv+6Eqenw8j/KZHVi9KwkJE8+2b+Yo5mCP2wkV1cCSzq6KPruUw4aKCj7b
 XrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jz3EiJ+oClwZejEb7ZzSpC3TiYzEL7QLTnZboUuVmPw=;
 b=VUfqQ0Y4cG9iNjhoP98G2pdWDyOyBEKWJgV+cB3eE9AhmNCtH6ryEqwhmq+EGmtET6
 A/FiZEqlXnKZX5BiP2+goSWJqBCIeUWBlslOBOEHQTwfwA3MdHEcwokyeDt0Xahl0aKw
 o8apEIJkGPdirsM7UeZaN9/2Sf0gAL/HFnzBicQ6qB6vKvjDLdxHw8wO7MKyoMuGp2GD
 Nm4Jvk9a08wqJO/b8bESBrR+Ry3ZneN37vPsaFWQ9dW1lL9o1rysU+bh+S0g+nYvCbX+
 w7dH2egbiNfmdoToLd1bXep5TYs0oorL+hpc92Ps1sXlbNRZVxxxQ4twp8cnH9eTqWJl
 OsCg==
X-Gm-Message-State: AOAM530slAJt4i+4TJvjXgBayddaMVtOK3CUui5Vxe3L6iCQ/HQXnM15
 do2XdbEMcUILBCyDvEx9hnuAdw==
X-Google-Smtp-Source: ABdhPJyB/WDdYRza0pqO58tSA4NmusMlPG388XfgEAHRIXNhG4OumD+NTRRKrwIN4WJKSqBaz/j9JA==
X-Received: by 2002:a17:90a:ae07:: with SMTP id
 t7mr12293447pjq.115.1610747467304; 
 Fri, 15 Jan 2021 13:51:07 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y8sm1805492pfq.106.2021.01.15.13.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 13:51:06 -0800 (PST)
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <c1e9d63a-ee10-5a85-57d2-3c4ad2a86980@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aeb86191-5fde-5f8f-7319-cc6375d02bf6@linaro.org>
Date: Fri, 15 Jan 2021 11:51:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c1e9d63a-ee10-5a85-57d2-3c4ad2a86980@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 11:28 AM, Shahab Vahedi wrote:
>>> +        cpu_stl_data(env, tmp_sp, CPU_FP(env));
>>> +    }
>>
>> And what if these stores raise an exception?  I doubt you're going to get an
>> exception at the correct pc.
> 
> I've added a few bad-weather test cases [1] and they work as expected. Indeed,
> none of those tests trigger an exception during the "cpu_stl_data()". Could you
> elaborate why you think the PC might be incorrect? Then I can add the corresponding
> tests and fix the behavior.

Because you're using cpu_stl_data_ra, with GETPC, if the store faults (e.g.
SIGSEGV) then the exception unwind will not be done.  This will happen to work
ok if and only if "enter" is the first insn of the TB.

>> In the case of enter or leave, this is one load/store plus one addition,
>> followed by a branch.  All of which is encoded as fields in the instruction.
>> Extremely simple.
> 
> You're suggesting that "enter/leave" should use TCG opcodes instead of
> helpers? If yes, do you really think it is possible to implement each with ~10
> opcodes?

More or less.  Two per registers stored, plus two moves.  It looks like the
limit of registers is either 3 or 14, depending on the cpu configuration.

Certainly this is no different from other "push multiple" type of instructions
of other architectures, which do exactly this.


r~

