Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E614C217D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 03:05:54 +0100 (CET)
Received: from localhost ([::1]:47568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN3Vw-0001BG-V0
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 21:05:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nN2v9-0001oI-U3
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 20:27:53 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:43928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1nN2v7-0002FH-AC
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 20:27:51 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8EDEB82353;
 Thu, 24 Feb 2022 01:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42EFC340E7;
 Thu, 24 Feb 2022 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645666063;
 bh=GaCSlaHuoL4PTPpbJsCAbmTac306bb0289J4Jyt/cCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTcgqSuvreJcrt+GI6FBVbHvqWaCYHfJMDVKh298DN/yG74ijBRZPbgCEPe1SSnv/
 OWNZlqtpLMmtebO+jSPT2tI79bq0YuNY7TCpcI7JVvUMWiHVkyw4QJyvs554PKS8Y9
 yeoFqkpu8MIeywz1nC153jIcoBKg6MXsMzAJ7xfWz40z9BIrTiWEfyXzLNkkTmH71d
 VxV/se8WZF+3WlgLYOMUMoHBb8hqKl+jGYfrM0Apzfdb6Xs36lYJNKbnGn2Y0EWJ5g
 SkQ2b3jZVI8c5Be1KZMj0x+5uwbjyWJc1KApfl5lz867/+dPA75kgtSOxLR7uH/Cu6
 b7PtrA5RYslfw==
Date: Wed, 23 Feb 2022 17:27:41 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH RFC v1 1/2] random: add mechanism for VM forks to
 reinitialize crng
Message-ID: <YhbfDQ2ernjrRNRX@sol.localdomain>
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <20220223131231.403386-2-Jason@zx2c4.com>
 <YhbAOW/KbFW1CFkQ@sol.localdomain>
 <CAHmME9oa_wE8_n8e5b=iM5v-s5dgyibm4vXMhwzc8zGd6VWZMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9oa_wE8_n8e5b=iM5v-s5dgyibm4vXMhwzc8zGd6VWZMQ@mail.gmail.com>
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

On Thu, Feb 24, 2022 at 01:54:54AM +0100, Jason A. Donenfeld wrote:
> On 2/24/22, Eric Biggers <ebiggers@kernel.org> wrote:
> > I think we should be removing cases where the base_crng key is changed
> > directly
> > besides extraction from the input_pool, not adding new ones.  Why not
> > implement
> > this as add_device_randomness() followed by crng_reseed(force=true), where
> > the
> > 'force' argument forces a reseed to occur even if the entropy_count is too
> > low?
> 
> Because that induces a "premature next" condition which can let that
> entropy, potentially newly acquired by a storm of IRQs at power-on, be
> bruteforced by unprivileged userspace. I actually had it exactly the
> way you describe at first, but decided that this here is the lesser of
> evils and doesn't really complicate things the way an intentional
> premature next would. The only thing we care about here is branching
> the crng stream, and so this does explicitly that, without having to
> interfere with how we collect entropy. Of course we *also* add it as
> non-credited "device randomness" so that it's part of the next
> reseeding, whenever that might occur.

Can you make sure to properly explain this in the code?

- Eric

