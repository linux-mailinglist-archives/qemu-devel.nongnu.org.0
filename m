Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166368F6DE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 19:27:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPp9O-0007vy-Ew; Wed, 08 Feb 2023 13:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPp9N-0007vo-03
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:26:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPp9K-0001Z7-Rj
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 13:26:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675880789;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9vv9yyHqZq2E/SpiLWiMQ9PqVloH3vpY45k5WRM5VY=;
 b=hTtW72Q0yvYSNs53gvjd9wYFm8a5XFPQ34mYtlVaZ/LpPdz5jwjW0ikrRAKpnIwUam8R05
 AT/qNoA2JErh+1nIYmOpKYrDYoDXDhGn0zBjoUMW3gCS6yMYyb4PAZFukcZZx5AtRw0ERP
 60bi/IHWxPCoV49ibrHWtHp4CSMw1qg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-4l1owfZ7MYuZ40Mw352O-A-1; Wed, 08 Feb 2023 13:26:28 -0500
X-MC-Unique: 4l1owfZ7MYuZ40Mw352O-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 851488027FD;
 Wed,  8 Feb 2023 18:26:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E77B940398A0;
 Wed,  8 Feb 2023 18:26:15 +0000 (UTC)
Date: Wed, 8 Feb 2023 18:26:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] x86: temporarily remove all attempts to provide setup_data
Message-ID: <Y+PpRUYHDc1TH2zO@redhat.com>
References: <20230208180835.234638-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230208180835.234638-1-Jason@zx2c4.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 08, 2023 at 03:08:35PM -0300, Jason A. Donenfeld wrote:
> All attempts at providing setup_data have been made as an iteration on
> whatever was there before, stretching back to the original
> implementation used for DTBs that [mis]used the kernel image itself.
> We've now had a dozen rounds of bugs and hacks, and the result is
> turning into a pile of unmaintainable and increasingly brittle hacks.
> 
> Let's just rip out all the madness and start over. We can re-architect
> this based on having a separate standalone setup_data file, which is how
> it should have been done in the first place. This is a larger project
> with a few things to coordinate, but we can't really begin thinking
> about that while trying to play whack-a-mole with the current buggy
> implementation.
> 
> So this commit removes the setup_data setting from x86_load_linux(),
> while leaving intact the infrastructure we'll need in the future to try
> again.

Technically this changes the ABI of the 7.2.0 machine type version
which we would normally avoid.

In practice I think we can probably get away with doing it.

The number of released guest OS that consume the RNG seed is negligible
at this point in time. Any that do consume shouldn't mind much if it
just disappears on next boot, since it was always just an opt-in, and
the kernel will happily still boot without it.

So I'm fine if we just put a note in the commit message acknowledging
that this is an ABI incompatibility for the machine type, but explaining
why it is none the less OK todo in this exceptional circumstance.

> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Dov Murik <dovmurik@linux.ibm.com>
> Cc: Tom Lendacky <thomas.lendacky@amd.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/i386/microvm.c |  15 ++----
>  hw/i386/x86.c     | 120 +++++-----------------------------------------
>  2 files changed, 17 insertions(+), 118 deletions(-)

Presumably it should be purging all traces of the 'legacy_no_rng_seed'
at the same time, with the view that any future implementation would be
tied to only whatever machine type is current at the time it gets
merged (could be 8.0.0 or 8.1.0 machine type, depending on how quickly
the new design gets settled).

$ git grep legacy_no_rng_seed
hw/i386/pc.c:                   pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
hw/i386/pc.c:                       pcmc->pvh_enabled, pcmc->legacy_no_rng_seed);
hw/i386/pc_piix.c:    pcmc->legacy_no_rng_seed = true;
hw/i386/pc_q35.c:    pcmc->legacy_no_rng_seed = true;
hw/i386/x86.c:                    bool legacy_no_rng_seed)
hw/i386/x86.c:    if (!legacy_no_rng_seed) {
include/hw/i386/pc.h:    bool legacy_no_rng_seed;
include/hw/i386/x86.h:                    bool legacy_no_rng_seed);


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


