Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400C4590564
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:08:32 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBfb-000728-AZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBWY-0004Fq-EK
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:59:10 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMBWW-0006ci-Lj
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 12:59:10 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so5685663pjl.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=zT8T6sxrCwXBBodbWaoOQl3/bePC88v3PaZFtpmYM0g=;
 b=qu5g3jEGA6wdTa3HrTVs1rwSab8JmczhnB+5fRiwoX3i+ERoGF3iTSxqdUkuwOU2Ij
 QvpTjcesV2KbihDNoYik0+sUp1DV3ZKUEciLDBZx0wvczB75sFBGOjAbg+dREHnPc+Il
 lYv0iL2wO/fwFm7V2nPVvfZOknUnYDeJJje46o0mffSRGcysH8i4Db3TMpUjQEajn2Q+
 eSPxe68RdeLioomD5SAovdcZgkZd+uzaOq5/mthW2UBlQVwtlO0tFsSzLlnZKJz+xjj6
 vI6lfpUQsUG6MmqnFHjhCjh0gttSJ45sdRGEM1yjmjycoiedjHAs47Xn9c4rCuks3FYZ
 qCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=zT8T6sxrCwXBBodbWaoOQl3/bePC88v3PaZFtpmYM0g=;
 b=jQYTnB5smQ/Zs6r8ry5mrQHWFOBQXpHeIxKibT7z2Y2kqRtvDDnNZdwi683T0PgLzp
 RMFJr2sO4RxtwSirs/BRHmN9gF9ZQ4BQpq39xRNeQ/3KFyJ1fuuSlbYTEnIuz45lsp2/
 lBxsVpDUG7g5SqD1KLt3LIA11zGu4JrhSz/jVWTUUj4lGEMtXH/SkSvg/mZnea/LCLkA
 R8WvLVSz80iQbHBMJ9xfBi+7fAb3d25KepcFPglqVC8Ui2FEqwkkBpRSk+iNeXnFsqP5
 z3fiVv+essCd8rTUIlqdnY4hD2Z+fGuc6E3hmQFJMJ0pSAOzt7VRdEXxOfRQHHsM/8FD
 IGUQ==
X-Gm-Message-State: ACgBeo0UGkiFiYA4fQpi6Gs5Q99xiJoJBwrJ7NdmVRJh5JMhcxIgI63h
 eR50l1yVrv3efpDkw00+afPJ9w==
X-Google-Smtp-Source: AA6agR4eVnX1VTMT1Rw9zb0Deht7SYUArIik7MJ6Y4VyKme+QCHcqDaWqoqkM52ScLXXx+xQWyU4VA==
X-Received: by 2002:a17:902:b08a:b0:16c:68b6:311 with SMTP id
 p10-20020a170902b08a00b0016c68b60311mr110226plr.166.1660237147162; 
 Thu, 11 Aug 2022 09:59:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 x2-20020aa79a42000000b0052e0b928c3csm4250899pfj.219.2022.08.11.09.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 09:59:06 -0700 (PDT)
Message-ID: <038e706b-2838-8c02-77c8-c2525feb692d@linaro.org>
Date: Thu, 11 Aug 2022 09:59:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 3/5] target/s390x: Make translator stop before the end
 of a page
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220811095534.241224-1-iii@linux.ibm.com>
 <20220811095534.241224-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811095534.241224-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 02:55, Ilya Leoshkevich wrote:
> Right now translator stops right *after* the end of a page, which
> breaks reporting of fault locations when the last instruction of a
> multi-insn translation block crosses a page boundary.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index e2ee005671..8e45a0e0d3 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6609,6 +6609,14 @@ static void s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>       dc->insn_start = tcg_last_op();
>   }
>   
> +static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
> +                                uint64_t pc)
> +{
> +    uint64_t insn = ld_code2(env, s, pc);
> +
> +    return pc + get_ilen((insn >> 8) & 0xff);
> +}
> +
>   static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>   {
>       CPUS390XState *env = cs->env_ptr;
> @@ -6616,10 +6624,9 @@ static void s390x_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
>   
>       dc->base.is_jmp = translate_one(env, dc);
>       if (dc->base.is_jmp == DISAS_NEXT) {
> -        uint64_t page_start;
> -
> -        page_start = dc->base.pc_first & TARGET_PAGE_MASK;
> -        if (dc->base.pc_next - page_start >= TARGET_PAGE_SIZE || dc->ex_value) {
> +        if (!is_same_page(dcbase, dc->base.pc_next) ||
> +            !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
> +            dc->ex_value) {
>               dc->base.is_jmp = DISAS_TOO_MANY;
>           }
>       }


