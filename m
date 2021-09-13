Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787284089DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:09:54 +0200 (CEST)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjqT-0000qe-I2
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPjoJ-0007Fx-3C
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mPjoF-0004ZU-E1
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631531252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p8h75J7lg41KqCpWj5qoGkGrzSFdQPM0puDLfsmsMss=;
 b=Cc8iX+//jVZs7BIqqAylKSJLDv1bDNWShvwq0zogub2k4hy4loqxDNPfyH376W7ardcuuB
 nAHt/5IYKus+f9sSJV8VOZytLXDIChbH5UyUjNJZbClUD8BRwIB/CioIWNIk5R2iiQDPJj
 YWcRIpUC93f0U8vDUpMR8/xH3P8F2Xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547--OHxJmaFPCK2vce5JdzLoA-1; Mon, 13 Sep 2021 07:07:29 -0400
X-MC-Unique: -OHxJmaFPCK2vce5JdzLoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEAE018D6A2C;
 Mon, 13 Sep 2021 11:07:28 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D1C519E7E;
 Mon, 13 Sep 2021 11:07:28 +0000 (UTC)
Date: Mon, 13 Sep 2021 12:07:27 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
Message-ID: <20210913110727.GF26415@redhat.com>
References: <20210912174925.200132-1-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210912174925.200132-1-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 12, 2021 at 10:49:25AM -0700, Richard Henderson wrote:
> With arm32, the ABI gives us 8-byte alignment for the stack.
> While it's possible to realign the stack to provide 16-byte alignment,
> it's far easier to simply not encode 16-byte alignment in the
> VLD1 and VST1 instructions that we emit.
> 
> Remove the assertion in temp_allocate_frame, limit natural alignment
> to the provided stack alignment, and add a comment.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> I haven't seen the assertion with the various arm kernels that I happen
> to have laying about.  I have not taken the time to build the combo
> from the bug report:
> 
> [    0.000000] Linux version 5.14.0-60.fc36.armv7hl (mockbuild@buildvm-a32-12.iad2.fedoraproject.org) (gcc (GCC) 11.2.1 20210728 (Red Hat 11.2.1-1), GNU ld version 2.37-9.fc36) #1 SMP Mon Aug 30 14:08:34 UTC 2021
> 
> I thought about parameterizing this patch further, but I can't think of
> another ISA that would be affected.  (i686 clumsily changed its abi 20
> years ago to avoid faulting on vector spills; other isas so far have
> allowed vectors to be unaligned.)

Is it possible this change could have caused a more serious
regression?  Now when I try to boot the Fedora kernel using TCG on
armv7hl I can't even get to the point where it detects virtio-scsi
devices.

Full log is here (go down to the bottom and work backwards):

  https://kojipkgs.fedoraproject.org//work/tasks/7337/75597337/build.log

This might have been caused by a coincidental change to the kernel.
The test environment I have makes it extremely difficult to test this
change in isolation.

However I do know that the same error does _not_ occur on x86-64
guest/host with this patch applied.

Rich.

> 
> r~
> ---
>  tcg/tcg.c                |  8 +++++++-
>  tcg/arm/tcg-target.c.inc | 13 +++++++++----
>  2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 4142d42d77..ca5bcc4635 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -3060,7 +3060,13 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
>          g_assert_not_reached();
>      }
>  
> -    assert(align <= TCG_TARGET_STACK_ALIGN);
> +    /*
> +     * Assume the stack is sufficiently aligned.
> +     * This affects e.g. ARM NEON, where we have 8 byte stack alignment
> +     * and do not require 16 byte vector alignment.  This seems slightly
> +     * easier than fully parameterizing the above switch statement.
> +     */
> +    align = MIN(TCG_TARGET_STACK_ALIGN, align);
>      off = ROUND_UP(s->current_frame_offset, align);
>  
>      /* If we've exhausted the stack frame, restart with a smaller TB. */
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index e5b4f86841..8515717435 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -2477,8 +2477,13 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg arg,
>          tcg_out_vldst(s, INSN_VLD1 | 0x7d0, arg, arg1, arg2);
>          return;
>      case TCG_TYPE_V128:
> -        /* regs 2; size 8; align 16 */
> -        tcg_out_vldst(s, INSN_VLD1 | 0xae0, arg, arg1, arg2);
> +        /*
> +         * We have only 8-byte alignment for the stack per the ABI.
> +         * Rather than dynamically re-align the stack, it's easier
> +         * to simply not request alignment beyond that.  So:
> +         * regs 2; size 8; align 8
> +         */
> +        tcg_out_vldst(s, INSN_VLD1 | 0xad0, arg, arg1, arg2);
>          return;
>      default:
>          g_assert_not_reached();
> @@ -2497,8 +2502,8 @@ static void tcg_out_st(TCGContext *s, TCGType type, TCGReg arg,
>          tcg_out_vldst(s, INSN_VST1 | 0x7d0, arg, arg1, arg2);
>          return;
>      case TCG_TYPE_V128:
> -        /* regs 2; size 8; align 16 */
> -        tcg_out_vldst(s, INSN_VST1 | 0xae0, arg, arg1, arg2);
> +        /* See tcg_out_ld re alignment: regs 2; size 8; align 8 */
> +        tcg_out_vldst(s, INSN_VST1 | 0xad0, arg, arg1, arg2);
>          return;
>      default:
>          g_assert_not_reached();
> -- 
> 2.25.1

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


