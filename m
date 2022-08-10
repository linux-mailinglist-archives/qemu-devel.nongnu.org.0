Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A753258F3AF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:50:19 +0200 (CEST)
Received: from localhost ([::1]:48768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLseg-000543-IV
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsQC-0005Iw-TQ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:35:20 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oLsQB-0007kJ-2w
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:35:20 -0400
Received: by mail-pg1-x535.google.com with SMTP id f65so15323474pgc.12
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=vpGWsL8zp01V/GrHFwH/nsjeQyTge5lvnL0akRuidvE=;
 b=JjYfnUX+avrxjo7kDYDuc0ut2tr4qoGNeSMiUDPzWlESvrpSdub6XwPqt9pdgrxuxO
 kZarG0GHUyjIgSJkykQ8087py5UxslZewqJdevHTjF4ZCPZBkYHaqWYv04Uqxe5w1Znq
 0IYbGG3p4Jb3ASEf2LidzvFc1o5ckiJnW+xqFLewBKlvkGMlT/LFxboepwIxquJdI9o+
 8MJGRc94tTXUPIdpL8qAZH1Tmp7TAB8yWls5SlTlZVDv/MxGOGp70N9fLUacBs2eE6e8
 2ZtBF/b/sPxh8QFKU3WUYYOWp8v5hql6evAQhOt8i3pVHF2IpIobfVIe0p5BXirZMM8a
 KGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=vpGWsL8zp01V/GrHFwH/nsjeQyTge5lvnL0akRuidvE=;
 b=XDwlk5xFpLLerf6shrYqSH3EgniqXNpCSf8siJxYNmOKdGSwdFtx4W6SAg8clwqj5n
 zmi9FaaPVxeBegl4lr8g8RnxNm/MoD5sZN+4FzFbSKnZaG/EM9mB2dcAvGEmq6j4cy6u
 paNDfrIDz7JzHRuC+8g1IdgPqh31TQEEi/WegEQ2Fdnwx1PUnaPL7x8Pc54cNJddJvcD
 WTO8LT3jeJLalCrbt7+Ff6lWy4Pzi7U6uvQtxt1gqv3tHajM5p9L36XJg5CkQdLlHzta
 WqsUV5Nd6lmPJLWhiNgJ9ClBahVh0haNjrE0jeOlM/3f4aNhvs4Qu4M8bkXoTkWfEGPf
 ifQw==
X-Gm-Message-State: ACgBeo3zwoUdtloxMLo5Hzt7HSSNT/au7nfEIPQkFkLhs8U9EbzuI1c7
 OcMP8GKWcxi/9onwqf8Vb4hGrA==
X-Google-Smtp-Source: AA6agR41qH7U9CtRmasZ4j9VZPQkoE9VspOP8t+Be7ASE8KhgM/esJznDTYusw3UGi08vG+ylqwxbA==
X-Received: by 2002:a05:6a00:1ac6:b0:52f:55f8:c3d3 with SMTP id
 f6-20020a056a001ac600b0052f55f8c3d3mr14826625pfv.76.1660163717379; 
 Wed, 10 Aug 2022 13:35:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:1d05:6ab9:1c4d:d646?
 ([2602:ae:154e:e201:1d05:6ab9:1c4d:d646])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a62a103000000b0052f39a877d8sm2429673pff.65.2022.08.10.13.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 13:35:16 -0700 (PDT)
Message-ID: <46bccccf-05d7-6fd6-6a35-646396310558@linaro.org>
Date: Wed, 10 Aug 2022 13:35:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/4] target/i386: Make translator stop before the end
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
References: <20220808171022.49439-1-iii@linux.ibm.com>
 <20220808171022.49439-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220808171022.49439-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/8/22 10:10, Ilya Leoshkevich wrote:
> Right now translator stops right *after* the end of a page, which
> breaks reporting of fault locations when the last instruction of a
> multi-insn translation block crosses a page boundary.
> 
> An implementation, like the one arm and s390x have, would require an
> i386 length disassembler, which is burdensome to maintain. Another
> alternative would be to single-step at the end of a guest page, but
> this may come with a performance impact.
> 
> Fix by snapshotting disassembly state and restoring it after we figure
> out we crossed a page boundary. This includes rolling back cc_op
> updates and emitted ops. Even though i386 is the only architecture that
> does rollback, split it into common and architecture-dependent parts to
> improve readability.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   accel/tcg/translator.c      |  8 ++++++++
>   include/exec/translator.h   |  3 +++
>   target/i386/tcg/translate.c | 21 ++++++++++++++++++++-
>   3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index fe7af9b943..2c4dd09df8 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -56,6 +56,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>   {
>       uint32_t cflags = tb_cflags(tb);
>       bool plugin_enabled;
> +    TCGOp *last_op;
>   
>       /* Initialize DisasContext */
>       db->tb = tb;
> @@ -82,6 +83,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>   
>       while (true) {
>           db->num_insns++;
> +        last_op = tcg_last_op();
>           ops->insn_start(db, cpu);
>           tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
>   
> @@ -103,6 +105,12 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>               ops->translate_insn(db, cpu);
>           }
>   
> +        if (db->is_jmp == DISAS_TOO_MANY_UNDO) {
> +            db->num_insns--;
> +            tcg_remove_ops_after(last_op);
> +            db->is_jmp = DISAS_TOO_MANY;
> +        }
> +
>           /* Stop translation if translate_insn so indicated.  */
>           if (db->is_jmp != DISAS_NEXT) {
>               break;
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index d27f8c33b6..e1533aee87 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -31,6 +31,8 @@
>    * DisasJumpType:
>    * @DISAS_NEXT: Next instruction in program order.
>    * @DISAS_TOO_MANY: Too many instructions translated.
> + * @DISAS_TOO_MANY_UNDO: Too many instructions translated. Everything that was
> + *                       done for the current instruction must be undone.
>    * @DISAS_NORETURN: Following code is dead.
>    * @DISAS_TARGET_*: Start of target-specific conditions.
>    *
> @@ -39,6 +41,7 @@
>   typedef enum DisasJumpType {
>       DISAS_NEXT,
>       DISAS_TOO_MANY,
> +    DISAS_TOO_MANY_UNDO,

Hmm, maybe.  I'm not overly keen on the generic change, because I think it would be easy 
to use incorrectly.

> +    case 2:
> +        /* Restore state that may affect the next instruction. */
> +        s->cc_op_dirty = orig_cc_op_dirty;
> +        s->cc_op = orig_cc_op;
> +        s->base.is_jmp = DISAS_TOO_MANY_UNDO;

I think you can simply set s->prev_insn_end in i386_tr_insn_start, for discarding opcodes.


r~

