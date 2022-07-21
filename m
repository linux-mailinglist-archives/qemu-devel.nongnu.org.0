Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C857C825
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:52:38 +0200 (CEST)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oESrF-0007RM-Q9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oESmb-0004B4-GH
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:47:50 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:50180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oESmZ-00020i-23
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:47:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A916061F67;
 Thu, 21 Jul 2022 09:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF084C3411E;
 Thu, 21 Jul 2022 09:47:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Xk1jiskS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658396851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJ4HI9rRMy2l/KqWepUltUNxCdeuZ7WcuKnwIwhwwuQ=;
 b=Xk1jiskSH0L5P4tCksxifgDOk0XFktQLeLiTTk5ut5p3bHY+SZPZRJoMtj9Al7iwOir+wd
 u9s17mt36C7uC/HnKsAQtb6u8EL4sorb8/niwyt9P74l5a33GLhDe9IkhiKFyX7Bd95ZF4
 h12pn7cFRz4x8eYP0MYAgr6uLS0dG/Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d6a78bc2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Jul 2022 09:47:30 +0000 (UTC)
Date: Thu, 21 Jul 2022 11:47:29 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH resend v3] hw/i386: pass RNG seed via setup_data entry
Message-ID: <YtkgsdmYbjnX5ZE0@zx2c4.com>
References: <20220711145432.56704-1-Jason@zx2c4.com>
 <20220719115300.104095-1-Jason@zx2c4.com>
 <Ytf9KVQNOZBI5u8f@zx2c4.com>
 <06e60181-2f77-6f02-5015-fd14153efff3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <06e60181-2f77-6f02-5015-fd14153efff3@redhat.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
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

Hi Paolo,

Thanks for your review.

On Thu, Jul 21, 2022 at 11:19:40AM +0200, Paolo Bonzini wrote:
> The issue with live migration is that the setup data changes from before 
> to after the patches.  This means that a live migration exactly _in the 
> middle_ of reading the Linux boot data could fail badly.  For example, 
> you could migrate in the middle of reading the DTB, and it would be 
> shifted by the ~50 bytes of the setup_data and seed.  The size would 
> also not match so, even though probably things would mostly work if you 
> place the seed last, that's not really optimal either.

This doesn't really make sense to me, as I don't think the machine can
even be migrated during x86_load_linux(), and a migration will skip this
whole step anyway since this is mutable memory that a live kernel does
mutate.

However, what I'll do is reverse the order of these, so that the DTB is
added first, and I'll only set up the links in the right order so that
there's no potential race. I'll send a v+1 doing this shortly.

I would really very much prefer *not* adding a useless knob for this
feature, especially not one that's off by default. The idea is to
finally fix randomness for VMs globally in a non-invasive way, and
fixing the [implausible] race mentioned above seems like it'll do the
trick.

> variables of x86_load_linux into a struct for sharing.  As I said, it 
> snowballs a bit, but I should be sending out patches later today.

I'll send a patch, as mentioned above.

> As an aside, QEMU tends to only include code after Linux supports it, 
> but it's in your rng tree so the timing is right

This one is actually in "tip", which is the x86 tree, so it'll certainly
be in 5.20.

Jason

