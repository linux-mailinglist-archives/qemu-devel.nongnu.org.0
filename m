Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20257B614
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 14:03:35 +0200 (CEST)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE8QP-0000Wo-G3
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 08:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE8LZ-0003Vm-8M; Wed, 20 Jul 2022 07:58:34 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:41372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oE8LU-0007QI-Ca; Wed, 20 Jul 2022 07:58:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 800E6B81EB0;
 Wed, 20 Jul 2022 11:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C576C3411E;
 Wed, 20 Jul 2022 11:58:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="SB04p5Ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658318294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eDfRy1XV1XuWFDrtLuHDHmzPpgJbvvKTVtwUeYaNt0A=;
 b=SB04p5IcWi6Z++N2Om3BSaKBB/xC5bdtyKPfUshok4qk2GJzmA3ddvx5OPu+6B2LS5RTBd
 FgJ1LfB//JlbwPbpmfCqc5b18HV3IQZD5ZurFiD1dk4S1vvgw7QzTiTb4JVKt4ONU36jKE
 wRCtKYXMh27XtdlUqtXzO5TKiBH+x1w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 682a04fe
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 20 Jul 2022 11:58:14 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:58:11 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v2] target/s390x: support PRNO_TRNG instruction
Message-ID: <Ytft08S2eGaYVwC3@zx2c4.com>
References: <YtaUQkVUPVHt+v0Z@zx2c4.com>
 <20220719114307.102643-1-Jason@zx2c4.com>
 <2b3d579a-295a-cd25-70c3-ecb551e74cf4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b3d579a-295a-cd25-70c3-ecb551e74cf4@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi David,

Thanks for the feedback.

On Wed, Jul 20, 2022 at 01:43:48PM +0200, David Hildenbrand wrote:
> > --- a/target/s390x/cpu_models.c
> > +++ b/target/s390x/cpu_models.c
> > @@ -421,8 +421,6 @@ static void check_consistency(const S390CPUModel *model)
> >          { S390_FEAT_DFP_FAST, S390_FEAT_DFP },
> >          { S390_FEAT_TRANSACTIONAL_EXE, S390_FEAT_STFLE_49 },
> >          { S390_FEAT_EDAT_2, S390_FEAT_EDAT},
> > -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KIMD_SHA_512 },
> > -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KLMD_SHA_512 },
> >          { S390_FEAT_MSA_EXT_4, S390_FEAT_MSA_EXT_3 },
> >          { S390_FEAT_SIE_CMMA, S390_FEAT_CMM },
> >          { S390_FEAT_SIE_CMMA, S390_FEAT_SIE_GSLS },
> > diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> > index ad140184b9..3d333e2789 100644
> > --- a/target/s390x/gen-features.c
> > +++ b/target/s390x/gen-features.c
> > @@ -749,6 +749,8 @@ static uint16_t qemu_V7_0[] = {
> >   */
> >  static uint16_t qemu_MAX[] = {
> >      S390_FEAT_VECTOR_ENH2,
> > +    S390_FEAT_MSA_EXT_5,
> > +    S390_FEAT_PRNO_TRNG,
> >  };
> 
> 
> Again, what about the warning? We don't want to report warnings in the
> QEMU default.

The change to cpu_models.c above gets rid of the warning.

> > +                for (size_t i = 0; i < block; ++i)
> > +                        cpu_stb_data_ra(env, wrap_address(env, buf++), tmp[i], ra);
> 
> So, whenever we would get an exception, we would not update the
> registers. This implies that we'd always start anew on an exception,
> even though we already modified page content.

Oh. The thing I had in mind was the r1&1 exception, not realizing that
of course cpu_stb_data_ra() can also generate an exception. I'll update
those registers incrementally.

> What the real HW does is constantly update the registers before the
> exception is delivered, such that you can simply pick up work again when
> re-entering the instruction after the exception was handled by the guest.
> 
> I assume we could do the same: updating the registers whenever a store
> succeeded. Doing that after each and every byte is a bit inefficient,
> but not sure if we care.
> 
> But as we're only storing random data, maybe we don't really care for
> now and can simply always start anew. (the guest can observe this wrong
> handling, though)
> 
> At a minimum we might want to add
> 
> /*
>  * TODO: we should update the registers constantly, such that we reflect
>  * which memory was already processed/modified if we get an exception
>  * in-between.
>  */

I think I can do it incrementally pretty easy, actually. Let's see how
it looks in v+1 first before I give up and add the TODO.

> > +        if (r1 & 1 || !r1 || r2 & 1 || !r2) {
> > +                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> > +                break;
> 
> You can drop the "break;", we'll jump right out of that function and
> never return -- the function is flagged as G_NORETURN.

Thanks, will do.

> 
> > +        }
> > +
> > +        fill_buf_random(env, ra, env->regs[r1], env->regs[r1 + 1]);
> > +        fill_buf_random(env, ra, env->regs[r2], env->regs[r2 + 1]);
> > +
> > +        env->regs[r1] += env->regs[r1 + 1];
> > +        env->regs[r1 + 1] = 0;
> > +        env->regs[r2] += env->regs[r2 + 1];
> > +        env->regs[r2 + 1] = 0;
> 
> We have to be careful in 24-bit an 31-bit address mode, we may only
> update selected parts of the registers.
> 
> See target/s390x/tcg/mem_helper.c:set_address() as an example on how to
> modify parts of registers using deposit64().

That's not pretty, but I think I see how to do it.

New revision incoming. Thanks for the review!

Jason

