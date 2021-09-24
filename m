Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7D417468
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:07:22 +0200 (CEST)
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkvB-0006im-N9
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTkli-0006aH-IQ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:57:34 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:38568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTklY-00037S-Oc
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:57:34 -0400
Received: by mail-qt1-x82e.google.com with SMTP id d8so9276383qtd.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jtGFxfP407GE69+EwfobjiUZERvHDdA0Qn5NMFLPL/g=;
 b=Yg/yOeAVj9xd0lGtTM8xFmLst/1s0MPO6Q0R2YU0AtpHNi39lzSBwLur6zP1KarYV5
 izY3WxRqXz6BzbR9u9QDMT3s7/Usbi519+k8y9EHMkcfPojJ+harDcFvhKpCQX4wd12l
 nkP0tvDxIyUba1Cw3+2A9yMV8cuAtmuSuJ5blVLkThc2Mm7cdoMW7CF7afmjj/ycfdaG
 X6A0m8pXXISE02jTji06ElfM6WtvvBG5HlcQaLoEuvrMJ+DveSfkx+eWVgcwqtKK1Pq8
 Zh+vFNCRE7rGBsYXhh1Pl6RDRMocvaS2R16IUVPo+GDvLArL8YQSQzPfzpqJmFtcGzx8
 j5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jtGFxfP407GE69+EwfobjiUZERvHDdA0Qn5NMFLPL/g=;
 b=xVb28zY3SaicZqX94HgL+mvlnplPEJA4C7kYp0FVK/Wh8lYYKJnMZFVD+FW5yxUi/Q
 p+ag3SL1iegd72SZk6chHOMZa3xuFRmVEiaydSPqg5mT8+TPlYRZe3bDOWC7KMoPC+wN
 Or+4/he2+pIWtQJ8qyodsu2Y25hCD/DLNvZ4Alrf39GxftJ3LfuabybEVGYdZd5gQDIb
 D6W6PDhgH/Yu0Mu+e2Ts7Brf97bB4GJMCvG8OpAegQrKeECHczvtKF02fhXAJ85oe5IT
 AciksyMuzxxlyhxb9b038Om4CZ0VG9ygnfFfFTVtBYdf2KeiyCDY1tGLyJCPMcwrlkFA
 oxJg==
X-Gm-Message-State: AOAM533SLpqaC2kxapS3PHkoBxQ5qsi+vxt3tJ1jXNwQ1jREW1qNTtiQ
 aIUVGhJBAInI+BzpWzXm1accuw==
X-Google-Smtp-Source: ABdhPJwzI8Ghwe9xYFEZtebqP2xWFpcz0zXo41S6NIFTqqBnwZ/OqVrnh8wh8zLnUU9YNP/9ewcyJw==
X-Received: by 2002:ac8:5c8e:: with SMTP id r14mr3850473qta.37.1632488243602; 
 Fri, 24 Sep 2021 05:57:23 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id y22sm5991339qkp.9.2021.09.24.05.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:57:23 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair23@gmail.com>
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
 <538d9688-0f2f-c406-50a5-d962e3ce2963@linaro.org>
 <CAKmqyKNDLcp22Jqe=UhE6sG3XEMd2pcW5bfFDYwpwrOL3kb0iA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <627458f0-01f1-9381-cd25-931e953031e3@linaro.org>
Date: Fri, 24 Sep 2021 08:57:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNDLcp22Jqe=UhE6sG3XEMd2pcW5bfFDYwpwrOL3kb0iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 2:48 AM, Alistair Francis wrote:
>> But... more specific to this case.  Prior to this, was the exception handler allowed to
>> assume anything about the contents of stval?  Should the value have been zero?  Would it
>> be wrong to write to stval unconditionally?  How does the guest OS know that it can rely
>> on stval being set?
> 
> As we didn't support writing the illegal instruction stval should be
> zero before this patch.

Ok, that didn't quite answer the question...

If *wasn't* zero before this patch: we didn't write anything at all, and so keep whatever 
previous value the previous exception wrote.

Is that a bug that needs fixing?  Because you're still not writing anything to stval if 
!MTVAL_INST...

>> I simply wonder whether it's worthwhile to add the feature and feature test.
> 
> Do you just mean have it enabled all the time?

Yes, if without this feature the value of stval was undefined.


r~

