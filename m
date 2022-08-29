Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8A95A51CF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 18:33:01 +0200 (CEST)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oShh6-0006yg-I0
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 12:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7wty=ZB=zx2c4.com=Jason@kernel.org>)
 id 1oShdp-0003lb-Ro; Mon, 29 Aug 2022 12:29:37 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:50412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7wty=ZB=zx2c4.com=Jason@kernel.org>)
 id 1oShdn-0003nr-Hr; Mon, 29 Aug 2022 12:29:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3350DB810FD;
 Mon, 29 Aug 2022 16:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6D1C433C1;
 Mon, 29 Aug 2022 16:29:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Wrlg7jXV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1661790563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XeK/soMRPkoWwC9vnOBKWmhhdOTTyHOY4FAaqNJarys=;
 b=Wrlg7jXVGL9vLynns7HIWKi4EFkyU7KxpOh1kmCYm0nGNhIaUnGM4JKTCUQ41K3NYcjCIL
 XNDG4Ij/pGAcJTE04lLvpVFibukrAZBaZojxEiI/SVM2ZeBswIA35zDI/dgRov1W7fCjnZ
 ZHOoCG35iJvfphvBsXiWDWMX3lL1t/Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 41f85884
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 29 Aug 2022 16:29:23 +0000 (UTC)
Date: Mon, 29 Aug 2022 12:29:21 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v7 2/2] target/s390x: support PRNO_TRNG instruction
Message-ID: <YwzpYUspRFJxoZlD@zx2c4.com>
References: <Yu0UtNzyb81O0ND2@zx2c4.com>
 <20220809150331.84296-1-Jason@zx2c4.com>
 <20220809150331.84296-2-Jason@zx2c4.com>
 <4b1352d4-4dff-7ab7-4c96-3fed4f52dd77@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b1352d4-4dff-7ab7-4c96-3fed4f52dd77@redhat.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=7wty=ZB=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

On Fri, Aug 26, 2022 at 01:28:11PM +0200, Thomas Huth wrote:
> > +        qemu_guest_getrandom_nofail(tmp, block);
> > +        for (size_t i = 0; i < block; ++i) {
> > +            cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
> > +            *buf_reg = deposit64(*buf_reg, 0, message_reg_len, *buf_reg + 1);
> > +            --*len_reg;
> 
> I know it's annoying, but technically, you must not touch the upper bits of 
> the len_reg if running in 31- or 24-bit addressing mode. The Principles of 
> Operations say:
> 
> "In either the 24- or 31-bit addressing mode, bits 32-63 of the odd-numbered 
> register are decremented by the number
> of bytes processed for the respective operand, and
> bits 0-31 of the register remain unchanged."
> 

This is what I was trying to do with the use of deposit64, following
David's guidance. Did I mess something up?

> > +        }
> > +        len -= block;
> > +    }
> > +}
> > +
> >   uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
> >                        uint32_t type)
> >   {
> 
> Don't you also need to modify the "query" part to signal the availability of 
> the function? Doesn't Linux in the guest check the availability first before 
> using it?

I think this is already handled at the upper layers. Linux detects it
fine.

> 
> > @@ -209,6 +235,10 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
> >               return klmd_sha512(env, ra, env->regs[1], &env->regs[r2], &env->regs[r2 + 1]);
> >           }
> >           break;
> > +    case 114: /* CPACF_PRNO_TRNG */
> > +        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
> > +        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
> > +        break;
> >       default:
> >           /* we don't implement any other subfunction yet */
> >           g_assert_not_reached();
> 
> Maybe one more thing to check (according the "Special Conditions" section in 
> the Principles of Operation):
> 
> "A specification exception is recognized and no other
> action is taken if any of the following conditions exist:
> 
> ...
> 
> 2. The R1 or R2 fields designate an odd-numbered
> register or general register 0. This exception is
> recognized regardless of the function code.
> "

This is taken care of already by the function that calls into this
function.

Jason

