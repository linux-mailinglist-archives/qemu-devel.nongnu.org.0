Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F83588BE2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 14:20:56 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJDMk-0006Ah-3s
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 08:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJDHM-0001lf-Kv; Wed, 03 Aug 2022 08:15:12 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:56912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJDHK-00051x-FU; Wed, 03 Aug 2022 08:15:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E1BC612E4;
 Wed,  3 Aug 2022 12:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F32AC433C1;
 Wed,  3 Aug 2022 12:15:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cgoGj6cx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659528902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q6D/UZttKAoaKjcIJuAoHDBuw7et4T4nUDR7yXLknPQ=;
 b=cgoGj6cxpzQHdoauIwKtLqhHsNKKkXzCR0iB1i8Qq/y8PRKhS4L7c6teYWk0HU4j0a57CE
 h5C68tslhI0fblQf4pdbeSbZEHh7h0FZmCI0SifRrOjceuxijYpzCV0nAAazawRkqzOAWo
 CRz163RBno7WpdgxVpQ+SxCxeVfxwAU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9b39d708
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Aug 2022 12:15:02 +0000 (UTC)
Date: Wed, 3 Aug 2022 14:14:58 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
Message-ID: <YupmwgYFShLfP8Xd@zx2c4.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
 <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=hVua=YH=zx2c4.com=Jason@kernel.org;
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

On Wed, Aug 03, 2022 at 01:55:21PM +0200, David Hildenbrand wrote:
> On 02.08.22 21:00, Jason A. Donenfeld wrote:
> > In order to fully support MSA_EXT_5, we have to also support the SHA-512
> > special instructions. So implement those.
> > 
> > The implementation began as something TweetNacl-like, and then was
> > adjusted to be useful here. It's not very beautiful, but it is quite
> > short and compact, which is what we're going for.
> > 
> 
> Do we have to worry about copyright/authorship of the original code or
> did you write that from scratch?

I actually don't really remember how much of that is leftover from
tweetnacl and how much I've rewritten - I've had some variant of this
code or another kicking around in various projects and repos for a long
time. But the tweetnacl stuff is public domain to begin with, so all
good.

> Are we properly handling the length register (r2 + 1) in the
> 24-bit/31-bit addressing mode?
> Similarly, are we properly handling updates to the message register (r2)
> depending on the addressing mode?

Ugh, probably not... I didn't do any of the deposit_64 stuff. I guess
I'll look into that.

> It's worth noting that we might want to implement (also for PRNO-TRNG):
> 
> "The operation is ended when all
> source bytes in the second operand have been pro-
> cessed (called normal completion), or when a CPU-
> determined number of blocks that is less than the
> length of the second operand have been processed
> (called partial completion). The CPU-determined
> number of blocks depends on the model, and may be
> a different number each time the instruction is exe-
> cuted. The CPU-determined number of blocks is usu-
> ally nonzero. In certain unusual situations, this
> number may be zero, and condition code 3 may be
> set with no progress."
> 
> Otherwise, a large length can make us loop quite a while in QEMU,
> without the chance to deliver any other interrupts.

Hmm, okay. Looking at the Linux code, I see:

        s.even = (unsigned long)src;
        s.odd  = (unsigned long)src_len;
        asm volatile(
                "       lgr     0,%[fc]\n"
                "       lgr     1,%[pba]\n"
                "0:     .insn   rre,%[opc] << 16,0,%[src]\n"
                "       brc     1,0b\n" /* handle partial completion */
                : [src] "+&d" (s.pair)
                : [fc] "d" (func), [pba] "d" ((unsigned long)(param)),
                  [opc] "i" (CPACF_KIMD)
                : "cc", "memory", "0", "1");

So I guess that means it'll just loop until it's done? Or do I need to
return "1" from HELPER(msa)?

Jason


