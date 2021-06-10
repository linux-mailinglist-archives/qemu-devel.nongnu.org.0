Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D93B3A2DB1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 16:05:31 +0200 (CEST)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrLJK-00019R-4c
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 10:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLHO-0007Po-Q9
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:03:30 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrLHL-0006Tq-KP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 10:03:30 -0400
Received: by mail-pf1-x42f.google.com with SMTP id u126so1692310pfu.13
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AOeGkM9V2dGSKSbFvs7dCmojgraWp0fo6Mi0vZ8ldMQ=;
 b=TPDtEKnRCzxNxfvOrZAHxe5nJQ2Yf6SU0q9F/yLFRlibnZxv3c+KN4AX6ZlaGVh7fR
 13IDp/1diWJnT/kHdy7XqeKfageZcgtgQSHqbI7iyjwcECIOio38MbdG/9yA8/Bxhmul
 +7L1Ya8gvOCfkIq8N0XINwXni893G9imuhF0M9P0SI/1Rfk1ZjkiD9doJUC7ZeVv4uJ5
 OGZjcDnD8nec3MtOhDhPrwSOlr+owPjET1jA/ISuLZ8cUSqscmOfBN+AJYXxgJNVLWLG
 0dVq4PesWcCTwUZt3tQjN8dgOyZEP5AdSUj9s6DQ5tla/GIL/tmeDRqmoEv/AIjlbydh
 mCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AOeGkM9V2dGSKSbFvs7dCmojgraWp0fo6Mi0vZ8ldMQ=;
 b=dqU91qCiH7LpjCOw/xUi21pLBjAkCAOyfiTHgho+PkdkgomrJbubhXGis4Y1R6qvtP
 nWosdiPTQ9S4QSea77ysOmvp1syDIkSaEX4Alg4FzA14m6pejwFD8BInCr5DtMkhUPEo
 wEMCWcw2QGsFgOsZFblv0Inl6lWibJTvudVd+6agdQ25DeFYEmR5E0YW5c6uxwPsZ/qm
 5KUxSYi9NDE2yzrsku/7OGMjjX9olBZ8y385FfKzUPmDjnVQaTGsnPIcrsWYD/nDSpV4
 rIi8QWjFFR2B1QxAj6jMZey4NbFNolc0yczYzcvjYtn4mIubApm5/DaNLC/kKsZjXWX7
 mOvw==
X-Gm-Message-State: AOAM533J4lIpamKeN5xW4Zltc0brL0NjDYonQ5eFtIOpbSf2P7G9KCUf
 7OU4PnXqFgyCRm46ZdopkBaVRHndse/zgQ==
X-Google-Smtp-Source: ABdhPJyMn7eiJ29lY4dQQmKWOhe9XdIpp4m23o9E6rNLVP+6IeEPrthwiu1sah4B9ifgwXCXa2R2XA==
X-Received: by 2002:a63:3ec3:: with SMTP id l186mr5035481pga.371.1623333802426; 
 Thu, 10 Jun 2021 07:03:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 e2sm2872426pgh.5.2021.06.10.07.03.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:03:22 -0700 (PDT)
Subject: Re: [PATCH 13/55] target/arm: Implement MVE VCLZ
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-14-peter.maydell@linaro.org>
 <b04dd492-0394-5b1a-5747-bb21d772e621@linaro.org>
 <CAFEAcA9Sa=mCMGGkmTm2HseanfkKa1PtDYOUiofO-k4eM_fYoA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e086b00f-70e8-6b53-5517-4ae24ce199ee@linaro.org>
Date: Thu, 10 Jun 2021 07:03:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Sa=mCMGGkmTm2HseanfkKa1PtDYOUiofO-k4eM_fYoA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 6/10/21 5:40 AM, Peter Maydell wrote:
>>> +#define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
>>> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
>>> +    {                                                                   \
>>> +        TYPE *d = vd, *m = vm;                                          \
>>> +        uint16_t mask = mve_element_mask(env);                          \
>>> +        unsigned e;                                                     \
>>> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
>>> +            TYPE r = FN(m[H(e)]);                                       \
>>> +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
>>
>> Why uint64_t and not TYPE?  Or uint32_t?
> 
> A later patch adds the mask_to_bytemask8(), so I wanted
> a type that was definitely unsigned (so TYPE isn't any good)
> and which was definitely big enough for 64 bits.

Hmm.  I was just concerned about the unnecessary type extension involved.

What about changing the interface.  Not to return a mask as you do here, but to 
perform the entire merge operation.  E.g.

static uint8_t mergemask1(uint8_t d, uint8_t r, uint16_t mask)
{
     return mask & 1 ? r : d;
}

static uint16_t mergemask2(uint16_t d, uint16_t r, uint16_t mask)
{
     uint16_t bmask = array_whotsit[mask & 3];
     return (d & ~bmask) | (r & bmask);
}

etc.

Or maybe with a pointer argument for D, so that the load+store is done there as 
well.  In which case you could use QEMU_GENERIC to select the function invoked, 
instead of using token pasting everywhere.  E.g.

static void mergemask_ub(uint8_t *d, uint8_r, uint16_t mask)
{
     if (mask & 1) {
         *d = r;
     }
}

static void mergemask_sb(int8_t *d, int8_r, uint16_t mask)
{
     mergemask_ub((uint8_t *)d, r, mask);
}

static void mergemask_uh(uint16_t *d, uint16_r, uint16_t mask)
{
     uint16_t bmask = array_whotsit[mask & 3];
     *d = (*d & ~bmask) | (r & bmask);
}

...

#define mergemask(D, R, M) \
     QEMU_GENERIC(D, (uint8_t *, mergemask_ub), \
                     (int8_t *,  mergemask_sb), \
                     ... )

BTW, now that we're at minimal gcc 7, I think we can shift to -std=gnu11 so 
that we can drop QEMU_GENERIC and just use _Generic, which is much easier to 
read than the above, and will give better error messages for missing cases. 
Anyway...

Which takes your boilerplate down to

> +#define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
> +    {                                                                   \
> +        TYPE *d = vd, *m = vm;                                          \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        for (unsigned e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {     \
> +            mergemask(&d[H(e)], FN(m[H(e)]), mask);                     \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }

which looks pretty tidy to me.


r~

