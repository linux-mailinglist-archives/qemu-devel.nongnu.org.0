Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455C44D9253
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 02:52:54 +0100 (CET)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwMm-0000Qr-O4
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 21:52:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTwLo-0007p9-D3; Mon, 14 Mar 2022 21:51:52 -0400
Received: from [2607:f8b0:4864:20::f2b] (port=35328
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1nTwLm-0005lv-UL; Mon, 14 Mar 2022 21:51:52 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id jx8so13523651qvb.2;
 Mon, 14 Mar 2022 18:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dPu/6SI3fHsVuE9kOC51zGs9UD4hoSbavg2Z51iS1jw=;
 b=hm9gmScImMycDZecSEbvHYjfw9C7PXnP7Rg1GwsER4XIDj7Ic7aTlp9IVXnme/pE6p
 8GvPjWslNDhs84faPQHwe6ubKMKnWw229K2eH0nz14f/TMOGxsEjKEnlNJsB+aKX91Jn
 1O5zJYnItO8lZKJTf++IYTkxV9Gjpu+fhsWoCFs9q9z9+B0gl/szEOwIDfJOpT38KLOU
 125a3p5wLEPbz70Oinz+ooqIoRznRAAaYEyyPidYrM9xd72OLyj5gTTo4GNhk9aAdVDE
 bgIgm7zFGlvUfVVrCftTsBCW3MfCaAxqAmnvDdC9TRbIeWJkUKj4BRjrBQFF3MGpfl8t
 9UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPu/6SI3fHsVuE9kOC51zGs9UD4hoSbavg2Z51iS1jw=;
 b=VWaC8gYRgOrCuIIm1wZXIboWQ4icM+gRXizfZhHky6jqk/B5UecY8BbuUPhYz2etUo
 jFCHQM1HoZSbBddF8Q9egSQP5L+mBkTJzQpXZvHwU2eHJs55Cw1wt+SNXOzRVdAkiDKu
 kg6XgB/jByx+N9Y7p+363QO7PJfSHjlusWoiXHtBO9eQTor9poG2hc+kXf9Wie7L37ZW
 IyH14OmEWO9StBSSrx0qYyEuc5V4b1ar0A3guL8pQxN/DyJgQ3YLhZTE8o9r3hIdTFu2
 a7uyyWXlUeYHSOFSZoPOyD+yqF9w+0gLCw5+wJbwEy+WG3hwiiYS1eHhnJiT1/G0Jtpq
 3Emg==
X-Gm-Message-State: AOAM531cFYexNb5UmkztR4juUr/gbyRMR9RePa3bQY4131KioCTvZEC7
 okAn+rMigp4ndEQAiM2x7dJagN7nA7J60+NCU3ePxoMR6SA=
X-Google-Smtp-Source: ABdhPJxiHBpL0ySfnmThzH7ncJHouz2oN7VJoadcQ2FV6/jm51naHthLjKpxNOfr+41C0wXxm2Ysx1roJSQEbClICBE=
X-Received: by 2002:a05:6214:623:b0:435:c552:65bb with SMTP id
 a3-20020a056214062300b00435c55265bbmr19955920qvx.16.1647309109561; Mon, 14
 Mar 2022 18:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220314215138.1355256-1-raj.khem@gmail.com>
 <b6b966c3-dd49-74aa-e9be-7da716d28a3b@linaro.org>
In-Reply-To: <b6b966c3-dd49-74aa-e9be-7da716d28a3b@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2022 18:51:22 -0700
Message-ID: <CAMKF1sqAncDKXunwjS6aNEPk4LNU9OUnPe_eDb+6=rrWTzXqnA@mail.gmail.com>
Subject: Re: [PATCH v3] ppc64: Avoid pt_regs struct definition
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=raj.khem@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 14, 2022 at 5:13 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/14/22 14:51, Khem Raj wrote:
> > +static inline uintptr_t host_signal_pc(host_sigcontext *uc)
> > +{
> > +    return uc->uc_mcontext.gp_regs[32];
> > +}
> > +
> > +static inline void host_signal_set_pc(host_sigcontext *uc, uintptr_t pc)
> > +{
> > +    uc->uc_mcontext.gp_regs[32] = pc;
> > +}
> > +
> > +static inline void *host_signal_mask(host_sigcontext *uc)
> > +{
> > +    return &uc->uc_sigmask;
> > +}
> > +
> > +static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
> > +{
> > +    return uc->uc_mcontext.gp_regs[40] != 0x400
> > +        && (uc->uc_mcontext.gp_regs[42] & 0x02000000);
> > +}
>
> Oh, dear.
>
> I didn't realize that the symbolic constants are also in <asm/ptrace.h>. We really don't
> want magic numbers.  We'll have to have the include and use PT_NIP, PT_TRAP, PT_DSISR.
>

yeah :) removing asm/ptrace.h sounded lucrative but it does make it
cryptic. I will send v4 soon.

>
> r~

