Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CDE5B6C34
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 13:07:12 +0200 (CEST)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3l0-0000x6-Qm
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 07:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oY3aj-000324-9g
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:56:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oY3af-0001nF-VM
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663066588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PpLfvB6QSlpC89bROrNl88aZb4/p7Wug/1J5w0zaZvQ=;
 b=Iv1CnLGAMo2UOcltEYJ/H2VoMKLKfEF7oml/qYjpeQcwnuYf7In72glxj52ZKkZ0b0cqkD
 BcvYUnxgUMTI/pgZ56SQkSgsXQ9dg//9g67ffCKatfrKWQGzyCU/RRQkpz2FKhX1c0QhB6
 qSopboiN7yzdGAChzPUE93VDWI5CyXc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-wpyjnH6lO9awmXv_6ylK-g-1; Tue, 13 Sep 2022 06:56:24 -0400
X-MC-Unique: wpyjnH6lO9awmXv_6ylK-g-1
Received: by mail-lf1-f69.google.com with SMTP id
 c17-20020a056512105100b0049bbc0135easo823010lfb.6
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PpLfvB6QSlpC89bROrNl88aZb4/p7Wug/1J5w0zaZvQ=;
 b=yFfvayXby9jFMn/l8FQRaw71XBOVPpMlXXrNlz8zvRiFKAe41HlZTw12wXSvjFShET
 DvAmtx8VE922wgWItV+C1t9nUOepq5wAbbnsJ15ZMvL0CmGYlWCuq4ldsFWY+XSG788X
 a0G0IP4qW5QttsKTtbrx9U06Nt24Xsf13bJB0rgSFT96CvEhoXMmLV4Gw11FkA7K75qh
 /9FSzMLFZ3BPwMxAJwFVvr+GwmeF2dia9A7/24k3do3Bzpe/0d2BUC8XujdslFGHqmlg
 5+Xra+qtnoRf7Hpwf0OGWte+FL9owIFvl2rNRFIvKLF1qcdJEWoJ9MjxcNtUXQiLVZeS
 ca6w==
X-Gm-Message-State: ACgBeo3PQL3YhPC86iytrXg9kt8fqqhQxmgHs/82fqUIsv98Z8ZXYXtd
 uXOnh8M9fhUsaBM770ePEGpu3cZ366mF7TYlANysAItNrMCCwGtMXsKpIZqEG7KDMdcvAJiHwjR
 vLgTM81EvugLqhq5VIhP2gkmLpiwKZ3U=
X-Received: by 2002:a2e:6e18:0:b0:26a:ce73:9dba with SMTP id
 j24-20020a2e6e18000000b0026ace739dbamr9187368ljc.510.1663066582790; 
 Tue, 13 Sep 2022 03:56:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR435TzORXTekig0o0wxzZcrh4JmqOKmBfCA0SBqL8v8BTABbifYBTHgsRDURW5IagHd7BGiaOJrrm477F8t0hM=
X-Received: by 2002:a2e:6e18:0:b0:26a:ce73:9dba with SMTP id
 j24-20020a2e6e18000000b0026ace739dbamr9187362ljc.510.1663066582471; Tue, 13
 Sep 2022 03:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-21-pbonzini@redhat.com>
 <e71dad48-2e9f-c679-fb3f-8229a8972680@linaro.org>
In-Reply-To: <e71dad48-2e9f-c679-fb3f-8229a8972680@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Sep 2022 12:56:10 +0200
Message-ID: <CABgObfbXST=bQ-FwVZvThn7nFkGXPfFNZDydKLnPkCBNid5Emw@mail.gmail.com>
Subject: Re: [PATCH 20/37] target/i386: reimplement 0x0f 0x60-0x6f, add AVX
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Sep 12, 2022 at 1:41 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/12/22 00:04, Paolo Bonzini wrote:
> > +/*
> > + * 00 = p*  Pq, Qq (if mmx not NULL; no VEX)
> > + * 66 = vp* Vx, Hx, Wx
> > + *
> > + * These are really the same encoding, because 1) V is the same as P when VEX.V
> > + * is not present 2) P and Q are the same as H and W apart from MM/XMM
> > + */
> > +static inline void gen_binary_int_sse(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
> > +                                      SSEFunc_0_eppp mmx, SSEFunc_0_eppp xmm, SSEFunc_0_eppp ymm)
>
> No need to inline.

Yes and no, the compiler should indeed be able to figure it out, but
both the assert() and the calls are meant to be optimized out by
inlining. So this kind of function would be even an always_inline
candidate.

> > +{
> > +    assert (!!mmx == !!(decode->e.special == X86_SPECIAL_MMX));
> > +
> > +    if (mmx && (s->prefix & PREFIX_VEX) && !(s->prefix & PREFIX_DATA)) {
> > +        /* VEX encoding is not applicable to MMX instructions.  */
> > +        gen_illegal_opcode(s);
> > +        return;
> > +    }
> > +    if (!(s->prefix & PREFIX_DATA)) {
> > +        mmx(cpu_env, s->ptr0, s->ptr1, s->ptr2);
> > +    } else if (!s->vex_l) {
> > +        xmm(cpu_env, s->ptr0, s->ptr1, s->ptr2);
> > +    } else {
> > +        ymm(cpu_env, s->ptr0, s->ptr1, s->ptr2);
> > +    }
>
> And a reminder from earlier patches that generating the pointers here would be better, as
> well as zeroing the high ymm bits for vex xmm insns.

I'm not sure about that, because there are quite a few cases handled
by more complex gen_* functions, which are helper-based (so not simple
calls to gvec functions where you have maxsz/oprsz) and are not
handled by the common gen_*_sse. For example gen_CVTPI2Px,
gen_MASKMOV, gen_PSRLDQ_i, gen_SSE4a_I, gen_VCVTSI2Sx, ...  All of
these would have to add extra code to set the pointers and to clear
the high ymm bits.

For gen_load, however, i can delay the generation using something like

static inline TCGv_ptr get_ptr0(DisasContext *s)
{
    if (s->ptr0) {
        return s->ptr0;
    }
    s->ptr0 = tcg_temp_new_ptr();
    tcg_gen_add(s->ptr0, cpu_env, ...);
    return s->ptr0;
}

Most of the changes to this series are mechanical, so if you dislike
relying on DCE then why not.

For gen_writeback, keeping gen_writeback eliminates duplicated code
and keeps the phases of disas_insn_new separated, so I prefer it
slightly. For now I'd rather leave it as is; with the above get_ptr0()
function that creates s->ptr0 lazily, perhaps gen_writeback() could do
it only if s->ptr0 is set (suggesting that a helper was used), while
gvec helpers would use the oprsz<maxsz feature. There's something to
be said for keeping the initial implementation simple of course,
especially since it's already slightly better than the code produced
by the existing decoder.

> > +    switch (ot) {
> > +    case MO_32:
> > +#ifdef TARGET_X86_64
> > +        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
> > +        tcg_gen_st_i32(s->tmp3_i32, cpu_env, lo_ofs);
> > +        break;
>
> This could also be
>
>      tcg_gen_gvec_dup_i64(MO_64, offset, 8, sse_vec_max_len, s->T1);

Yeah, it can be something like

    case MO_32:
        tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
        tcg_gen_gvec_dup_i32(MO_32, decode->op[0].offset, 4, vec_len,
s->tmp3_i32);
        break;
#ifdef TARGET_X86_64
    case MO_64:
        tcg_gen_gvec_dup_i64(MO_64, decode->op[0].offset, 8, vec_len, s->T1);
        break;
#endif

and in this case of course it's not possible to use st32_tl.

Paolo


