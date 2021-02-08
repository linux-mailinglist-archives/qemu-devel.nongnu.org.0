Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5680314476
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:04:20 +0100 (CET)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GVv-0006dj-T8
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9EzA-0006cF-3w
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:26:25 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9Ez6-00089f-Tc
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:26:23 -0500
Received: by mail-pf1-x436.google.com with SMTP id d26so9398923pfn.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 14:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QpfyIkRHWT85deH5cOU4LJWRgKAZYY7uj042U/QtehU=;
 b=vxxAzg2v+LPrwvUpuhNOMGJOG2Gq5pKpzTTL6p8vEMgLhEKQf7S0XwtVYiaPFm5z3w
 sqy43drnIFirGm14m971hNyFxMWcuYz/9qZknH0EHl4Ir3ounpBUuazTDWbmJjN6wvm4
 914tRQ43IpNnIBSJqGK9pT72ttsvqWIzmXc5gV9tTggRKCG0SDTNY58we9tfK4Hqy2Aq
 h7Vkv/W9X/FrJI3rCnu+yCVaWMON+bIYxoz2UOyYUlsHEGj5+Fv10to3hEfhWv7l64/R
 e/HE8JkLzBA4554KOns338vMTM8bW6B18dK/6bz9GVbFGrZfjckNLINDZZgCTsbqEPwe
 Vbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QpfyIkRHWT85deH5cOU4LJWRgKAZYY7uj042U/QtehU=;
 b=qqd+Dp/yhS3CgM0lfLBg1dIcQrHFxxxdDrPbiBOqAevmCTEcBSGr+LVkPxoNA2IUtS
 qRfOJI9Uer1ziwiLPY+uNIfNhLXpCZTJ2r30+8o7tI9Tbm3B0az1CD/mVTaL6dHfDH7f
 r2dDJ7LKD/Nf1sFoiKe38EqsP4tyXh6JIetTbPhmue6caizeE0tKuVW7Wwyb0Oy1nwtA
 8UfEbL3RkPmnr9ii+jpiwc8NAVuuYsM0ECtJnQovKgrQclgroBIZlRPFY9meOBQHqb+C
 3vT3NSKI+pvNM9V8AUgdQKUyCGjYx3m1shGn2BMKfy/RvW15tbtpC2sfVrCvIpO5uJER
 Rjkw==
X-Gm-Message-State: AOAM530OmFEO74GWHni6YUQOMapFfuzXjE0T3id+ifwNHkrnKz3spgqX
 Bzas8iTN94HVMmqVVvuC7Wf6WyetRCeVKw==
X-Google-Smtp-Source: ABdhPJxdGYTOws5DWnpPfjOJZaSutsN39eKof+t54J081m2qtbE1sO38QkllA6lcpfcfeklGB/ckHQ==
X-Received: by 2002:a63:e310:: with SMTP id f16mr19554224pgh.160.1612823179289; 
 Mon, 08 Feb 2021 14:26:19 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 g9sm20319097pfr.94.2021.02.08.14.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 14:26:18 -0800 (PST)
Subject: Re: [PATCH v2 02/15] tcg/arm: Add host vector framework
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-3-richard.henderson@linaro.org>
 <CAFEAcA9bfj0X1Pb6_Em2hX7OkgmobFf=SGWQe=cXHaCO8n5jCQ@mail.gmail.com>
 <CAFEAcA9C+DG33fu-=zNN+6M9qc_bh6Lc=jx0ttNLg-tQWQtrxA@mail.gmail.com>
 <8f830dcb-2769-ca7d-460f-6095a5a47c1b@linaro.org>
 <CAFEAcA_iQnEFPxkNfUDm5fYTp+bKQ3-UM2nDjMod5SwUu6X=Sg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e006b705-981b-8978-37fa-d519faaf26c1@linaro.org>
Date: Mon, 8 Feb 2021 14:26:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_iQnEFPxkNfUDm5fYTp+bKQ3-UM2nDjMod5SwUu6X=Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 11:30 AM, Peter Maydell wrote:
> On Mon, 8 Feb 2021 at 18:58, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/8/21 10:28 AM, Peter Maydell wrote:
>>> On Mon, 8 Feb 2021 at 17:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> The AAPCS says that q4-q7 are preserved across calls.
>>>
>>> Speaking of which, doesn't that mean we also need to
>>> save and restore q4-q7 in tcg_target_qemu_prologue()
>>> if we might be generating neon insns? (It doesn't look like
>>> aarch64's prologue does this, which seems like a bug.)
>>
>> I just put them on the reserved list so that they don't get used.
>>
>>>     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_V8);
>> ...
>>>     tcg_regset_reset_reg(tcg_target_call_clobber_regs, TCG_REG_V15);
> 
> I'm confused. That's not the reserved list, it's the call-clobber
> list

Oops.  It's actually done by not adding them to tcg_target_reg_alloc_order.

    /* V8 - V15 are call-saved, and skipped.  */

Which works as well, I suppose.  I dunno which makes more sense.


r~

