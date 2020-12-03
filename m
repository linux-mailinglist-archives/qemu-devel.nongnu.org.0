Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603612CDAF1
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:17:11 +0100 (CET)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrI6-0003L2-FK
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkrGN-0002bb-2q
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:15:23 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kkrG8-0002zI-7C
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:15:19 -0500
Received: by mail-ot1-x342.google.com with SMTP id f16so2217743otl.11
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IPPAffN4yagbi7eODeoKPenRSw5Nap2P8dgVVfXBjgo=;
 b=a8qWDflHb559fbVC2iQk1X4wrFdlY1GlAiqG80/3Mzhl3wil9h9/t9qIWRsf7ow6vc
 aiEMbNfgvClcRg82qjot02sxpZS+ojayW06KsFeFQd2EPzyg417uRLGur5hGPknJyLTn
 VeXdb9StOpT3YMP0W89G1Fwzk9IKX3RRq9ySNmFZP/iIf0g+nOWsGLG8SoB4NM7v3n0i
 Lg+W+1ak2QVHrdO3uAo/nh5L20ErRoBdYxfXB/j27crL6Qyz1t7KsJ6vDVpZ+mZWnIe3
 uIQiRUYlxLlqj4MxOOpVrMkh3tnd4C8fbX+/vhPvbgGQS1XAnk30Ha6PbMoJvhYNCoIm
 L2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IPPAffN4yagbi7eODeoKPenRSw5Nap2P8dgVVfXBjgo=;
 b=WzE30B7KDPh2tkYjAflHq6ep6RQXjcLi5tzZMpDDINKWuzhIBYFD8wlMuGDPbzDYPT
 uMhmdRSoe1uhMm7uxtwrn7859YhXtA1uKq/V6BKAHXrVxsVknHd8Je8pN6tYlEbGdGI0
 xJ0rpIhxqcvqCyhf2fA0nOkFBPNLRdzpAIF1V7gYMez97q/SYpnu6CeGn1VzZ7it9ay+
 CnbkNykxgfr4a63/oAFfsn97qXVsT7wcXl4R5kDkObzR2OwWkSe7F8qBqmb+2nwaV4+8
 jjzGt9KaGH4hjVFLeDqpjM/+MDmahljOipItwP73gki026C+02CAX7P3qghUVwH6mVn9
 VHmQ==
X-Gm-Message-State: AOAM533kRmpBYhKSW57iETZnnJeVrhZmgOT7ldXemFbpZRkSpBTRJWe+
 SqgvaenLMlguPmW6UpSQoxlz0tnMGAh7Tkyh
X-Google-Smtp-Source: ABdhPJxl+1PAM1zMegRJDVOhGoeNqeKIBmMDR8AW4pyHhok6OQI5Xv3A3kQbyfHoow78qTDm9jE45Q==
X-Received: by 2002:a05:6830:22fa:: with SMTP id
 t26mr2583260otc.343.1607012102560; 
 Thu, 03 Dec 2020 08:15:02 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 64sm314965otu.62.2020.12.03.08.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 08:15:01 -0800 (PST)
Subject: Re: [PATCH v2 09/28] target/arm: Implement VLDR/VSTR system register
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-10-peter.maydell@linaro.org>
 <74666363-8965-279c-8b00-bf6d61d22be4@linaro.org>
 <CAFEAcA-8LR3f3ArcbK3iWRGLMRrUTwJUEmYvGYHpzMLXHMmkvA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55ba1846-2743-ad08-603a-b6210cb8ca2d@linaro.org>
Date: Thu, 3 Dec 2020 10:14:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-8LR3f3ArcbK3iWRGLMRrUTwJUEmYvGYHpzMLXHMmkvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/20 5:39 AM, Peter Maydell wrote:
> On Tue, 1 Dec 2020 at 13:11, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 11/19/20 3:55 PM, Peter Maydell wrote:
>>> +    gen_aa32_st32(s, value, addr, get_mem_index(s));
>>
>> This is MemA, so should use
>>
>>   gen_aa32_st_i32(s, value, addr, get_mem_index(s),
>>                   MO_UL | MO_ALIGN);
>>
>> a-la my patch set from last week fixing other instances.
> 
> Also " | s->be_data", right ?

Ho hum, yes.  I saw your comment on this in the alignment patch set and I'll
think about A Better Way.


r~


