Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7053A07AF
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:18:43 +0200 (CEST)
Received: from localhost ([::1]:42102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqkzZ-0004dm-VH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkyn-0003kh-RJ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:17:53 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkym-0002aS-7e
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:17:53 -0400
Received: by mail-pg1-x532.google.com with SMTP id e20so5883453pgg.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FnYJ60sf+0xJfBB1ibGaMnKtWPvCeO3YlVmOb3AOEXs=;
 b=ADPEuyG+MTY54YbCIyU3Vf6kMBzIz/MrdgrdYGxNtv0NZwUiM8QCvBfMB0ee1k86ad
 CBqs5Cqmlb1UBrEPY1FOB+1d8B3+dFCdvm14RAuzfc473GlfnBVYGukUAmC1KhOsI+P3
 egNFP3HwC5lUKjSTqc6HkARxaOJVIFH2MKHGOT89Jh1CTydEjJHmCq+v9AwEc0yaCG00
 rBdDyx3oHhfeGrXT1zivvT0Y8ZDUYuT4Z4s6fwW4k13JfvdTnL2KAuIuusPNIH7lhSH4
 rnvJaGZfYjOs/gNzki9yhirjeM1q0Y6xk16eo3pdvHIbtYx3olOXLT9c19KJify+dAND
 UqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FnYJ60sf+0xJfBB1ibGaMnKtWPvCeO3YlVmOb3AOEXs=;
 b=gr94y/g0gxhI8wQMLY2qez8Q+9zcYRKex+/QkFbpHFtQsG9D7xzgDoUxd8lw4l4SQK
 H1kttDDGM3HVD5KFmKyRCS+6315/euYAXrBnVX/fsP/DS3kyPeVOcp9MRNuoc+YLLMg7
 OTVEX+lTHOuk7cI0rc/Y1JrSQ2SgesJNL0F8+qBG85Iyx5QaeqSQx7CCUyJiN7XzxLid
 K+GxQFaEoRH/Nfw02ePTQxHG2EsRc7qPTrKTPRrIP6tQw9lYS22RCpiFOGCte7aUw9z3
 IvJcRvQUJE7gAXOt3exKCrRd6gWCNmqZXD0CCnFbvxd8FPU/Gao92yijVOKO3v3QbJAy
 oNzA==
X-Gm-Message-State: AOAM531lkTkdPN+IUbDFU4WLFmUYhFD/dvndfcXyyLN8Yn8c1PPhbw9r
 BXZP0XUkoU439n9GM8xuo2nDnUjj03fgGQ==
X-Google-Smtp-Source: ABdhPJx+LGWTCZLZ0B+Pct/W1Wrf6zqz8vAM5GTel0nHP3MZGxjJnEGFcQ93VXCsETKWa1n4Xc/Q7A==
X-Received: by 2002:a63:1210:: with SMTP id h16mr648673pgl.189.1623194270572; 
 Tue, 08 Jun 2021 16:17:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o7sm12912688pgs.45.2021.06.08.16.17.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:17:50 -0700 (PDT)
Subject: Re: [PATCH 20/55] target/arm: Implement MVE VDUP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31d446dd-d17e-e036-7e66-fd7291827d9e@linaro.org>
Date: Tue, 8 Jun 2021 16:17:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_VDUP(OP, ESIZE, TYPE, H)                                     \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t val)     \
> +    {                                                                   \
> +        TYPE *d = vd;                                                   \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
> +            d[H(e)] &= ~bytemask;                                       \
> +            d[H(e)] |= (val & bytemask);                                \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }
> +
> +DO_VDUP(vdupb, 1, uint8_t, H1)
> +DO_VDUP(vduph, 2, uint16_t, H2)
> +DO_VDUP(vdupw, 4, uint32_t, H4)

Hmm.  I think the masking should be done at either uint32_t or uint64_t.  Doing 
it byte-by-byte is wasteful.

Whether you want to do the replication in tcg (I can export gen_dup_i32 from 
tcg-op-gvec.c) and have one helper, or do the replication here e.g.

static void do_vdup(CPUARMState *env, void *vd, uint64_t val);
void helper(mve_vdupb)(CPUARMState *env, void *vd, uint32_t val)
{
     do_vdup(env, vd, dup_const(MO_8, val));
}


r~

