Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A64C217E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 03:05:54 +0100 (CET)
Received: from localhost ([::1]:47616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN3Vw-0001DF-Ry
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 21:05:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nN0rx-0002Jz-Lq
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:16:25 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nN0rv-0008UF-Ld
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:16:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2605FB8224A;
 Wed, 23 Feb 2022 23:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA67C340E7;
 Wed, 23 Feb 2022 23:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645658171;
 bh=dKUEp8Ja5zuNdUtklDNOmkRUIMIrk0tU73atuFZaF1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NZYN4igKqV7hfvfXieNsnoEnfNnyOiaPzX5FHj5YExv/OqHhuVQ1pJdApX/wV/eLM
 Ps+w12Su2eSEWxTt0pVq8o34Yc7zylU4GZvsj+vL4CiJYxEiUeUXG57/ZS86+tHrzJ
 wvod45GXJZyAj6CwQTdFqQ71m/SnJTvuHiw3XVHiZV8RXOgKnV7vEp02s2ThNBFCpy
 p6TMyWu7+jWIi0y/UHwFA92zpUaY9PRazUlBSq3vc7NueUHSEjAueCtP/knNIq+LaW
 cYK6e6uFDz1qHUEueYgRiv6nfR5qvZMXgpUlqjbWxAuTRltYERxcmAtlJfyTiqqAyk
 SemuTINnMhS3w==
Date: Wed, 23 Feb 2022 15:16:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH RFC v1 1/2] random: add mechanism for VM forks to
 reinitialize crng
Message-ID: <YhbAOW/KbFW1CFkQ@sol.localdomain>
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <20220223131231.403386-2-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223131231.403386-2-Jason@zx2c4.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=ebiggers@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Feb 2022 21:03:44 -0500
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
Cc: linux-s390@vger.kernel.org, tytso@mit.edu, kvm@vger.kernel.org,
 adrian@parity.io, jannh@google.com, gregkh@linuxfoundation.org,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 acatan@amazon.com, graf@amazon.com, linux-crypto@vger.kernel.org,
 colmmacc@amazon.com, sblbir@amazon.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 02:12:30PM +0100, Jason A. Donenfeld wrote:
> When a VM forks, we must immediately mix in additional information to
> the stream of random output so that two forks or a rollback don't
> produce the same stream of random numbers, which could have catastrophic
> cryptographic consequences. This commit adds a simple API, add_vmfork_
> randomness(), for that.
> 
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Jann Horn <jannh@google.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  drivers/char/random.c  | 58 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/random.h |  1 +
>  2 files changed, 59 insertions(+)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 536237a0f073..29d6ce484d15 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -344,6 +344,46 @@ static void crng_reseed(void)
>  	}
>  }
>  
> +/*
> + * This mixes unique_vm_id directly into the base_crng key as soon as
> + * possible, similarly to crng_pre_init_inject(), even if the crng is
> + * already running, in order to immediately branch streams from prior
> + * VM instances.
> + */
> +static void crng_vm_fork_inject(const void *unique_vm_id, size_t len)
> +{
> +	unsigned long flags, next_gen;
> +	struct blake2s_state hash;
> +
> +	/*
> +	 * Unlike crng_reseed(), we take the lock as early as possible,
> +	 * since we don't want the RNG to be used until it's updated.
> +	 */
> +	spin_lock_irqsave(&base_crng.lock, flags);
> +
> +	/*
> +	 * Also update the generation, while locked, as early as
> +	 * possible. This will mean unlocked reads of the generation
> +	 * will cause a reseeding of per-cpu crngs, and those will
> +	 * spin on the base_crng lock waiting for the rest of this
> +	 * operation to complete, which achieves the goal of blocking
> +	 * the production of new output until this is done.
> +	 */
> +	next_gen = base_crng.generation + 1;
> +	if (next_gen == ULONG_MAX)
> +		++next_gen;
> +	WRITE_ONCE(base_crng.generation, next_gen);
> +	WRITE_ONCE(base_crng.birth, jiffies);
> +
> +	/* This is the same formulation used by crng_pre_init_inject(). */
> +	blake2s_init(&hash, sizeof(base_crng.key));
> +	blake2s_update(&hash, base_crng.key, sizeof(base_crng.key));
> +	blake2s_update(&hash, unique_vm_id, len);
> +	blake2s_final(&hash, base_crng.key);
> +
> +	spin_unlock_irqrestore(&base_crng.lock, flags);
> +}
[...]
> +/*
> + * Handle a new unique VM ID, which is unique, not secret, so we
> + * don't credit it, but we do mix it into the entropy pool and
> + * inject it into the crng.
> + */
> +void add_vmfork_randomness(const void *unique_vm_id, size_t size)
> +{
> +	add_device_randomness(unique_vm_id, size);
> +	crng_vm_fork_inject(unique_vm_id, size);
> +}
> +EXPORT_SYMBOL_GPL(add_vmfork_randomness);

I think we should be removing cases where the base_crng key is changed directly
besides extraction from the input_pool, not adding new ones.  Why not implement
this as add_device_randomness() followed by crng_reseed(force=true), where the
'force' argument forces a reseed to occur even if the entropy_count is too low?

- Eric

