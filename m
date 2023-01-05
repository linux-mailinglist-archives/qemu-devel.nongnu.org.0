Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A65765E502
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:17:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDIcm-0008Ai-71; Thu, 05 Jan 2023 00:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1pDIck-00088h-Nj
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:17:06 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ebiggers@kernel.org>)
 id 1pDIci-0006UF-Ud
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:17:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22F5D60B99;
 Thu,  5 Jan 2023 05:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D78C433EF;
 Thu,  5 Jan 2023 05:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672895821;
 bh=hCwvN8JyCMfjFhATTmVrCdPtmoy8Mrwboqm/M2hXlvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qi/B9yr0ZwZHgT2Kc8fQATgqOUMWnYlcinidThuWKcdTsp0ydU8qkFQTXV/q4C5HU
 eo74Bl1GdUO0TPRmxJTWWJKBU3MdiHpb2VSaNHVgsp7rMeyveij5OgpJV++JqfYgz3
 qYsu3Z+GyuZdGwv6V6SRTuVShRMOEZIDbWz7V/oDgVV1v3A6ymiMr7NcP8YZut0e2B
 xTvf5pMYG48dfV1y3R7E1bWIetYHYSpx5q/vdp34v1cefVlBpLB4w20mOMK2WjP4Mf
 rA+GAFo8SlWPeFdZOjv7hhneF64XxZVjrBcVVlqKO2Wqt/fZ6S/bzMvD2MmVlytW+v
 S+vxL1Eb6mjRQ==
Date: Wed, 4 Jan 2023 21:16:59 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 hpa@zytor.com, bp@alien8.de, philmd@linaro.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7ZdS/IHDpGkvI9Y@sol.localdomain>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230220725.618763-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=ebiggers@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 30, 2022 at 11:07:25PM +0100, Jason A. Donenfeld wrote:
> The setup_data links are appended to the compressed kernel image. Since
> the kernel image is typically loaded at 0x100000, setup_data lives at
> `0x100000 + compressed_size`, which does not get relocated during the
> kernel's boot process.
> 
> The kernel typically decompresses the image starting at address
> 0x1000000 (note: there's one more zero there than the compressed image
> above). This usually is fine for most kernels.
> 
> However, if the compressed image is actually quite large, then
> setup_data will live at a `0x100000 + compressed_size` that extends into
> the decompressed zone at 0x1000000. In other words, if compressed_size
> is larger than `0x1000000 - 0x100000`, then the decompression step will
> clobber setup_data, resulting in crashes.
> 
> Visually, what happens now is that QEMU appends setup_data to the kernel
> image:
> 
>           kernel image            setup_data
>    |--------------------------||----------------|
> 0x100000                  0x100000+l1     0x100000+l1+l2
> 
> The problem is that this decompresses to 0x1000000 (one more zero). So
> if l1 is > (0x1000000-0x100000), then this winds up looking like:
> 
>           kernel image            setup_data
>    |--------------------------||----------------|
> 0x100000                  0x100000+l1     0x100000+l1+l2
> 
>                                  d e c o m p r e s s e d   k e r n e l
>                      |-------------------------------------------------------------|
>                 0x1000000                                                     0x1000000+l3
> 
> The decompressed kernel seemingly overwriting the compressed kernel
> image isn't a problem, because that gets relocated to a higher address
> early on in the boot process, at the end of startup_64. setup_data,
> however, stays in the same place, since those links are self referential
> and nothing fixes them up.  So the decompressed kernel clobbers it.
> 
> Fix this by appending setup_data to the cmdline blob rather than the
> kernel image blob, which remains at a lower address that won't get
> clobbered.
> 
> This could have been done by overwriting the initrd blob instead, but
> that poses big difficulties, such as no longer being able to use memory
> mapped files for initrd, hurting performance, and, more importantly, the
> initrd address calculation is hard coded in qboot, and it always grows
> down rather than up, which means lots of brittle semantics would have to
> be changed around, incurring more complexity. In contrast, using cmdline
> is simple and doesn't interfere with anything.
> 
> The microvm machine has a gross hack where it fiddles with fw_cfg data
> after the fact. So this hack is updated to account for this appending,
> by reserving some bytes.
> 
> Cc: x86@kernel.org
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

For what it's worth:

Tested-by: Eric Biggers <ebiggers@google.com>

- Eric

