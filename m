Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA85358AB4F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 15:08:18 +0200 (CEST)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJx3p-0006YQ-5I
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 09:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=jDGz=YJ=zx2c4.com=Jason@kernel.org>)
 id 1oJwxc-00011u-HC; Fri, 05 Aug 2022 09:01:58 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:32978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=jDGz=YJ=zx2c4.com=Jason@kernel.org>)
 id 1oJwxa-000619-0U; Fri, 05 Aug 2022 09:01:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 127DC61A8D;
 Fri,  5 Aug 2022 13:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F097C433C1;
 Fri,  5 Aug 2022 13:01:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="MO+qeevX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659704505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=du3x2bZtX0xu+jTVV0SXBV/EJS4AC71HxVvATUyNWes=;
 b=MO+qeevXDtpEzrljuyY1re5KaiF+T9/lDJfZxhEcgXx0RtD+RRRkd7V+HQruBCt2Hfjtu0
 1R0krzbMfFt52329Vrm1gB1Q83JO+MTMIUaj4iBTqd19IJSpwYB2q8oXdAehqYrKKN3zmj
 79wbIIeQa/IQG5fr5zwj+g9IVona+0w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 31778e8e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 5 Aug 2022 13:01:44 +0000 (UTC)
Date: Fri, 5 Aug 2022 15:01:40 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v6 2/2] target/s390x: support SHA-512 extensions
Message-ID: <Yu0UtNzyb81O0ND2@zx2c4.com>
References: <20220803125108.626995-2-Jason@zx2c4.com>
 <20220803171536.1314717-1-Jason@zx2c4.com>
 <20220803171536.1314717-2-Jason@zx2c4.com>
 <6ad7580d-ee43-d744-8eed-cd363c4fb911@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6ad7580d-ee43-d744-8eed-cd363c4fb911@redhat.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=jDGz=YJ=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

On Fri, Aug 05, 2022 at 01:28:18PM +0200, David Hildenbrand wrote:
> On 03.08.22 19:15, Jason A. Donenfeld wrote:
> > In order to fully support MSA_EXT_5, we have to also support the SHA-512
> > special instructions. So implement those.
> > 
> > The implementation began as something TweetNacl-like, and then was
> > adjusted to be useful here. It's not very beautiful, but it is quite
> > short and compact, which is what we're going for.
> > 
> 
> NIT: we could think about reversing the order of patches. IIRC, patch #1
> itself would trigger a warning when starting QEMU. Having this patch
> first make sense logically.

Good idea. Will do.

> > +static int kimd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
> > +                       uint64_t *message_reg, uint64_t *len_reg, uint8_t *stack_buffer)
> > +{
> > +    enum { MAX_BLOCKS_PER_RUN = 64 }; /* This is arbitrary, just to keep interactivity. */
> 
> I'd just use a #define outside of the function for that.

Why? What does leaking this into file-level scope do?

> 
> > +    uint64_t z[8], b[8], a[8], w[16], t;
> > +    uint64_t message = message_reg ? *message_reg : 0, len = *len_reg, processed = 0;
> > +    int i, j, reg_len = 64, blocks = 0, cc = 0;
> > +
> > +    if (!(env->psw.mask & PSW_MASK_64)) {
> > +        len = (uint32_t)len;
> > +        reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> > +    }
> 
> 
> I'd call that message_reg_len. (same in other function)

Will do.

> 
> 
> > +
> > +    for (i = 0; i < 8; ++i) {
> > +        z[i] = a[i] = cpu_ldq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), ra);
> 
> I assume if we get any exception here, we simply didn't make any progress.
> 
> > +    }
> > +
> > +    while (len >= 128) {
> > +        if (++blocks > MAX_BLOCKS_PER_RUN) {
> > +            cc = 3;
> > +            break;
> > +        }
> > +
> > +        for (i = 0; i < 16; ++i) {
> > +            if (message) {
> > +                w[i] = cpu_ldq_be_data_ra(env, wrap_address(env, message + 8 * i), ra);
> 
> dito

Right, there's no progress, because it's only ever incremented at the
end. And, more importantly, we only ever update the parameter_block
after having done things successfully.

> > +    for (i = 0; i < 8; ++i) {
> > +        cpu_stq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), z[i], ra);
> 
> I wonder what happens if we get an exception somewhere in the middle
> here ... fortunately we can only involve 2 pages.

If this fails, then message_reg and len_reg won't be updated, so it will
have to start over. If it fails part way through, though, then things
are inconsistent. I don't think we want to hassle with trying to restore
the previous state or something insane though. That seems a bit much.

> > +    cc = kimd_sha512(env, ra, parameter_block, message_reg, len_reg, NULL);
> > +    if (cc) {
> > +        return cc;
> > +    }
> 
> Doesn't kimd_sha512() update the length register? And if we return with
> cc=3, we'd be in trouble, no?

cc=3 means partial completion. In that case, klmd also returns with a
partial completion. That's good and expected! It means that the next
time it's called, it'll keep going where it left off.

I've actually tried this with the Linux implementation, and it works as
expected.

> One idea could be to simply only process one block at a time. Read all
> inputs first for that block and handle it completely without any
> register modifications. Perform all memory writes in a single call.

That *is* what already happens. Actually, the memory writes only ever
happen at the very end of kimd_sha512.

> Further, I wonder if we should factor out the core of kimd_sha512() to
> only work on temp buffers without any loading/storing of memory, and let
> only kimd_sha512/klmd_sha512 perform all loading/storing. Then it's much
> cleaner who modifies what.

That's not necessary and will complicate things ultimately. See the
above; this is already working as expected.

Jason

