Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C46430406
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:58:45 +0200 (CEST)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbnxD-0003L9-Q3
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnvG-0002MG-13
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:56:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnvD-0005jg-Sa
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:56:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so11654034pjb.2
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 10:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x2TWQ5qhi5/71Y7c3nv5/LHX1uIEI9h5JVmIpZ4Xn/g=;
 b=GmCmZScdJkUBsuBPE6JnVznjWY8kGtFWXEOnlsZBjY96zMrgdyHDG3sZmLqa7qQKg1
 E6kr8PZiVmAc7FZO9FYNXs+fWSaAX7qcnNHETXFSnwq3O/Yk4BWZ+ymJRStqW7DRCecL
 owtWXtw2NKyWoWQ0u5NJXkmqzJvOoyd8STdEh0GgrtVwcsVrb8x50vDEowo7/XXk9lt2
 YZU9l3w0Rp588PpHHax6w/cHJdf1Wf1KJvnzL0Ct0bV+knjMuM5JjI7rbOBQ6NbM/oMY
 9ySZufIRuuJ+UuxSkeT/rR4sCIyulG3SPWpWp9EOPaPvM0f9h6h9nPknffBMW5Sg9k/T
 Pymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x2TWQ5qhi5/71Y7c3nv5/LHX1uIEI9h5JVmIpZ4Xn/g=;
 b=PxV7OAMfJe0gouQme20IWBwvIej1CV0rIsyZ7ckIiqreOjcFsLNkqXMKYSz8D7c+HN
 a8iA9oVOkVjUZPsWwR8szEOhnuJ+j1A2DLXK4NUKLhETcd7zWe0eSDzPTiWD2UT5gLFs
 QTuirzibipkdoK7xzKLhWdlSWbQV9fpK4+Y6HhxKhSbONlpzU4ZqyZFKhW9z6ofbTRSa
 H3HkA2CfK3nSQ0WTMpjzlNVeUdiK6t78DfCD+xUZPDsUsjgxnTFuppD8FYgmmFrNkC4U
 ATOALj6My77YrR6kMZh9MioLIQ0rtDvDjZI12TwqgePovBgsB2KOHBob3P/UsYJ6qWZr
 t0rQ==
X-Gm-Message-State: AOAM531Yf54zfN/bxZEsdEZ5CSTaXEaLL2W+B9To9LCqRRxaOB5WW2lp
 Y6CExdVNc78XOvuKXMSctlOTaw==
X-Google-Smtp-Source: ABdhPJzTabm4Wus2K/khxO+n2iyD8IbpR25tB8kNwoMeXGRdPQ0WGby+ibTdvx5sIsEmCDcHrf/ROQ==
X-Received: by 2002:a17:90a:e38f:: with SMTP id
 b15mr35922187pjz.76.1634406995473; 
 Sat, 16 Oct 2021 10:56:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p18sm7777256pgk.28.2021.10.16.10.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Oct 2021 10:56:35 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
To: Frank Chang <frank.chang@sifive.com>
References: <20211015065500.3850513-1-frank.chang@sifive.com>
 <20211015065500.3850513-3-frank.chang@sifive.com>
 <4b718269-b222-c08f-ca72-656bacc31331@linaro.org>
 <CAE_xrPibc4W9FqoXUvLQ=pnW7h85ZYnYYwjLR-Rs+0NbifXc-A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ac1b2bd-efa9-2005-5c0a-cace9346cbd7@linaro.org>
Date: Sat, 16 Oct 2021 10:56:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPibc4W9FqoXUvLQ=pnW7h85ZYnYYwjLR-Rs+0NbifXc-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/16/21 1:52 AM, Frank Chang wrote:
> On Sat, Oct 16, 2021 at 1:05 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 10/14/21 11:54 PM, frank.chang@sifive.com <mailto:frank.chang@sifive.com> wrote:
>      > From: Chih-Min Chao<chihmin.chao@sifive.com <mailto:chihmin.chao@sifive.com>>
>      >
>      > The sNaN propagation behavior has been changed since
>      > cd20cee7 inhttps://github.com/riscv/riscv-isa-manual
>     <http://github.com/riscv/riscv-isa-manual>
>      >
>      > Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com <mailto:chihmin.chao@sifive.com>>
>      > ---
>      >   target/riscv/fpu_helper.c | 8 ++++----
>      >   1 file changed, 4 insertions(+), 4 deletions(-)
>      >
>      > diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
>      > index 8700516a14c..1472ead2528 100644
>      > --- a/target/riscv/fpu_helper.c
>      > +++ b/target/riscv/fpu_helper.c
>      > @@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1,
>     uint64_t rs2)
>      >   {
>      >       float32 frs1 = check_nanbox_s(rs1);
>      >       float32 frs2 = check_nanbox_s(rs2);
>      > -    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
>      > +    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
>      >   }
> 
>     Don't you need to conditionalize behaviour on the isa revision?
> 
> 
> I will pick the right API based on CPU privilege spec version.

There's a separate F-extension revision number: 2.2.

But I'll leave it up to those more knowledgeable about the revision combinations actually 
present in the field to decide.


r~

