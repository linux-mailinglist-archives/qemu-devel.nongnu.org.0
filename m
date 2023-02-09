Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02CC690D77
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:46:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ98B-0003MH-1n; Thu, 09 Feb 2023 10:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pQ980-0003Ik-HB
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:46:28 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pQ97y-0004ap-MN
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:46:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C027AB8219F;
 Thu,  9 Feb 2023 15:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D77C433EF;
 Thu,  9 Feb 2023 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675957583;
 bh=4aHZlBX9l/bOuICthQjw5N6vmi8DVGwwgHUPxcnJJvQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sn8szQdEBAlXy0hosk5RI5gEtq9iZ9dljixQ7Nrwb8q+G5djwIOEYX3YSHdgzOwbe
 1BjEOCMXLUaYw7CKxXbUUQVHVLwvH2dImkZUHwmdSl0gRRgmc7/koo5Vyyu6Fqv7XO
 tYL8xMWkf2nKDGe81Jk3Wf3rdV6Wg9OdA6TxC0UJ7vZg+/aVxnFbO+sx+8TX9aRgF8
 74wsOLFlsEQ0Kg0MfNiv9VPfiCXBOWsMX3JIANDJ03SR3h3qhOUq0jjT4ia6FLlNah
 njap7hGxlL68GRwDu/K8Iek5vadxa2a/A6P5k4u1Hp6/uLiJCZqAnq0sgBbV9ndUdA
 hDyLDCapKXXlg==
Date: Thu, 9 Feb 2023 08:46:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Borislav Petkov <bp@alien8.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH RFC 0/7] revert RNG seed mess
Message-ID: <Y+UVTFseqHLhxRXR@dev-arch.thelio-3990X>
References: <20230208211212.41951-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208211212.41951-1-mst@redhat.com>
Received-SPF: pass client-ip=145.40.68.75; envelope-from=nathan@kernel.org;
 helo=ams.source.kernel.org
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

On Wed, Feb 08, 2023 at 04:12:23PM -0500, Michael S. Tsirkin wrote:
> All attempts to fix up passing RNG seed via setup_data entry failed.
> Let's just rip out all of it.  We'll start over.
> 
> 
> Warning: all I did was git revert the relevant patches and resolve the
> (trivial) conflicts. Not even compiled - it's almost midnight here.
> 
> Jason this is the kind of approach I'd like to see, not yet another
> pointer math rich patch I need to spend time reviewing. Just get us back
> to where we started. We can redo "x86: use typedef for SetupData struct"
> later if we want, it's benign.
> 
> Could you do something like this pls?
> Or test and ack if this patchset happens to work by luck.
> 
> Michael S. Tsirkin (7):
>   Revert "x86: don't let decompressed kernel image clobber setup_data"
>   Revert "x86: do not re-randomize RNG seed on snapshot load"
>   Revert "x86: re-initialize RNG seed when selecting kernel"
>   Revert "x86: reinitialize RNG seed on system reboot"
>   Revert "x86: use typedef for SetupData struct"
>   Revert "x86: return modified setup_data only if read as memory, not as
>     file"
>   Revert "hw/i386: pass RNG seed via setup_data entry"
> 
>  include/hw/i386/microvm.h |   5 +-
>  include/hw/i386/pc.h      |   3 -
>  include/hw/i386/x86.h     |   3 +-
>  include/hw/nvram/fw_cfg.h |  31 ----------
>  hw/i386/microvm.c         |  17 ++----
>  hw/i386/pc.c              |   4 +-
>  hw/i386/pc_piix.c         |   2 -
>  hw/i386/pc_q35.c          |   2 -
>  hw/i386/x86.c             | 122 ++++++++++----------------------------
>  hw/nvram/fw_cfg.c         |  21 ++-----
>  10 files changed, 49 insertions(+), 161 deletions(-)
> 
> -- 
> MST
> 

For the record, all three of the cases that I tested (i386 no EFI,
x86_64 with and without EFI) worked fine with this series. In case it is
useful:

Tested-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

