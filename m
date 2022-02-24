Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF7C4C2AB1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:19:37 +0100 (CET)
Received: from localhost ([::1]:38384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNC9m-00060M-0g
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:19:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNC6L-0004lT-6P
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:16:01 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNC6F-0001S4-37
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:16:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4D3A6162C
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1420CC340EB
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:15:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="K0Ba/2BM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645701345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tSMJNlgM3iQSZttf3O5yP1K/Zb4cUmNelvTABLfdcOs=;
 b=K0Ba/2BM/9pExBbaS5Oj8SCJvlvp0LQGyiNAiXDyooG/U9BeyX+5o7RLqsETF26O3Q8oLJ
 fCsXilmRI7pxc/CYm3kU+fXPDMl1Uchh4ynDmuSO5MbVs6Ufz3QiiawdfSIvm5FepEXDsh
 cYBAB6wdHUlLLl0Wob5vRSfu6n86I28=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 089ac83c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 24 Feb 2022 11:15:45 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id b35so3000487ybi.13
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 03:15:44 -0800 (PST)
X-Gm-Message-State: AOAM533FntAuCuH33qjkqdQzTh9LujvQJHg+zIGyt8OZP+7ydvA1hBGQ
 UPPR48wVuZMUVmbseTWp5HNx73sWpl63QLw4uyw=
X-Google-Smtp-Source: ABdhPJwcyLWv29eKkR/4qn6wxUASneof9Mw7kmR85HjE16vurz2uO8LCL0/vq/6Jg597pXgN7D3peAt9nzCkEAyuvVw=
X-Received: by 2002:a25:d116:0:b0:61d:e8c9:531e with SMTP id
 i22-20020a25d116000000b0061de8c9531emr1860406ybg.637.1645701342951; Thu, 24
 Feb 2022 03:15:42 -0800 (PST)
MIME-Version: 1.0
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <20220223131231.403386-2-Jason@zx2c4.com>
 <YhbAOW/KbFW1CFkQ@sol.localdomain>
 <CAHmME9oa_wE8_n8e5b=iM5v-s5dgyibm4vXMhwzc8zGd6VWZMQ@mail.gmail.com>
 <YhbfDQ2ernjrRNRX@sol.localdomain>
In-Reply-To: <YhbfDQ2ernjrRNRX@sol.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 Feb 2022 12:15:32 +0100
X-Gmail-Original-Message-ID: <CAHmME9rUD5QrgQMpoOCjv3crWFwn+BXXx9Dm0e2Kv4cJCYS+AQ@mail.gmail.com>
Message-ID: <CAHmME9rUD5QrgQMpoOCjv3crWFwn+BXXx9Dm0e2Kv4cJCYS+AQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1 1/2] random: add mechanism for VM forks to
 reinitialize crng
To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org;
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
Cc: linux-s390@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 KVM list <kvm@vger.kernel.org>, adrian@parity.io, Jann Horn <jannh@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Weiss,
 Radu" <raduweis@amazon.com>, QEMU Developers <qemu-devel@nongnu.org>,
 LKML <linux-kernel@vger.kernel.org>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, graf@amazon.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Colm MacCarthaigh <colmmacc@amazon.com>, "Singh, Balbir" <sblbir@amazon.com>,
 "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey Eric,

On Thu, Feb 24, 2022 at 2:27 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Feb 24, 2022 at 01:54:54AM +0100, Jason A. Donenfeld wrote:
> > On 2/24/22, Eric Biggers <ebiggers@kernel.org> wrote:
> > > I think we should be removing cases where the base_crng key is changed
> > > directly
> > > besides extraction from the input_pool, not adding new ones.  Why not
> > > implement
> > > this as add_device_randomness() followed by crng_reseed(force=true), where
> > > the
> > > 'force' argument forces a reseed to occur even if the entropy_count is too
> > > low?
> >
> > Because that induces a "premature next" condition which can let that
> > entropy, potentially newly acquired by a storm of IRQs at power-on, be
> > bruteforced by unprivileged userspace. I actually had it exactly the
> > way you describe at first, but decided that this here is the lesser of
> > evils and doesn't really complicate things the way an intentional
> > premature next would. The only thing we care about here is branching
> > the crng stream, and so this does explicitly that, without having to
> > interfere with how we collect entropy. Of course we *also* add it as
> > non-credited "device randomness" so that it's part of the next
> > reseeding, whenever that might occur.
>
> Can you make sure to properly explain this in the code?

The carousel keeps turning, and after I wrote to you last night I kept
thinking about the matter. Here's how it breaks down:

Injection method:
- Assumes existing pool of entropy is still sacred.
- Assumes base_crng timestamp is representative of pool age.
- Result: Mixes directly into base_crng to avoid premature-next of pool.

Input pool method:
- Assumes existing pool of entropy is old / out of date / used by a
different fork, so not sacred.
- Assumes base_crng timestamp is tied to irrelevant entropy pool.
- Result: Force-drains input pool, causing intentional premature-next.

Which of these assumptions better models the situation? I started in
the input pool method camp, then by the time I posted v1, was
concerned about power-on IRQs, but now I think relying at all on
snapshotted entropy represents the biggest issue. And judging from
your email, it appears that you do too. So v3 of this patchset will
switch back to the input pool method, per your suggestion.

As a plus, it means we go through the RDSEED'd extraction algorithm
too, which always helps.

Jason

