Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA852F86C1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 21:34:12 +0100 (CET)
Received: from localhost ([::1]:56444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0VnP-00050z-Hp
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 15:34:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Vka-0003i0-TY
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:31:16 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0VkZ-0008Es-6l
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 15:31:16 -0500
Received: by mail-pj1-x1033.google.com with SMTP id w1so6711827pjc.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 12:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FCzJk7V8W0zjOgsrORXZNgr+zZX1wsc15/d2WDgjDY8=;
 b=FSS6QlmaaS9f+uq1UVc3TFlzCJBIGHmdpSnZgv5GdbjDEu3R45o0AZ5jeBF8mk7Bqs
 y4PjpeT0spnb+ypriv6yQ6nTlGpVRJpgGrNZGGG1sylS0ap+hAv8MuEvi8ZB/YhuRDzX
 phecwPL4mhs/CEi9hT3TFytgiGAfWxl7YngDgh5qROazoSoUTKHkwVVYzcEnqpXHUJhj
 oLU9lyoKnyroWgSXIG3F5Cj2peOffOeUmsbwGRAc28ydsUPW2XYPaKMDLmbdJnvLq2zP
 KzKTm4Olx/JObjJNpQy+EggJG+EnpTnHValOy7xeRMhVlqCktgzl0ei9iWxV0OH+u0MI
 Z4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FCzJk7V8W0zjOgsrORXZNgr+zZX1wsc15/d2WDgjDY8=;
 b=bJujOdRIAfNIJt10zI8iL/d7Dk22Rx5paQsL9HAAzpYxRqVhN2Fn/wCdZIqAFMTFUB
 RoM6i9yZ6z9TByuonZxOPZ9ndqoXdPW2o3GdVT/dTfGqNHSc9q4o4yh9vqECd2QSJO7C
 woTPziYYTL2LvCjTGvERfzSvNiL3HW6CEJzxqa7ZPvVaWNDkA6BWfcBCqXrn6fFVBhTO
 LTTgFZLpzA6YLU1mWtp6zYue5vSBXUTy82pTR+d/G0OAadtOOL3T44Yj0/uFAQJnB4K5
 d1Zh7ZwXGBSepVGgc6R8Z75eQrvNwq4df5cOvEh2grtDDYF7SXr4IWr0PNIrHxUwKT7l
 8VFQ==
X-Gm-Message-State: AOAM530Q7WUs9Xqtvd0HnlNtoej4Ii+P1VFTMu8RH8pXZXkk14s3twza
 y+M5fU6Ru+7++WfHC146R/WMyg==
X-Google-Smtp-Source: ABdhPJxHaK/ejMCpLwgWFBqe7qpdng85R70jNSiKbQgV3lVZ93psmp01c7nl6qPjcyDYd6ysURqmrw==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr12421572pjb.3.1610742673463; 
 Fri, 15 Jan 2021 12:31:13 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id gb9sm8841178pjb.40.2021.01.15.12.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 12:31:12 -0800 (PST)
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
Date: Fri, 15 Jan 2021 10:31:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 7:11 AM, Cupertino Miranda wrote:
>> Similarly.  I think that both of these could be implemented entirely in
>> translate, which is what
>>
>>> +    bool restore_fp    = u7 & 0x10; /* u[4] indicates if fp must be saved  */
>>> +    bool restore_blink = u7 & 0x20; /* u[5] indicates saving of blink      */
>>> +    bool jump_to_blink = u7 & 0x40; /* u[6] should we jump to blink?       */
>>
>> these bits strongly imply.
>>
> 
> For lack of knowing better, it is unclear to me where to draw the line 
> when choosing between a translate time (tcg) or helper implementation.
> Your suggestions for carry/overflow computation are sharp and we should 
> have never used an helper, however I wonder what would be the benefit of 
> implementing enter and leave through TCG.
> 
> We have dealt with those exception issues by just changing SP in the end 
> of the instruction implementation, when no exceptions can happen.

5-10 tcg opcodes is the rule of thumb.  A conditional exception (requiring a
branch) is a good reason to put the whole thing out of line.

In the case of enter or leave, this is one load/store plus one addition,
followed by a branch.  All of which is encoded as fields in the instruction.
Extremely simple.

> As far as I understand when an exception happens in the middle of the 
> helper or even on a TCG implementation, it jumps out of that TB 
> execution to deal with the exception. On rtie instead of it returning to 
> the same tcg_ld or tcg_st where it actually triggered the exception it 
> will re-decode the same instruction which triggered the exception, and 
> re-attempts to execute it.
> Is that the case in current TCG implementation, or did it improved and 
> it is now able to return to previous execution flow (i.e translation 
> block) ?

I think I don't understand your question.

An exception leaves the TB, via longjmp.  Before the longjmp, there is normally
an "unwind" or "restore" operation, to sync the cpu state with the middle of
the TB.  This happens in restore_state_to_opc().

When processing of the exception is complete, execution will continue with the
appropriate cpu state.  Which will probably be a new TB that (logically)
partially overlaps the previous TB.

I.e. everything will work as you'd expect.

So... what's the question?


r~


