Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D6668DEE6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:29:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRls-00053f-Sc; Tue, 07 Feb 2023 12:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPRlq-00053G-09
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:28:42 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPRln-00021S-92
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:28:41 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 142DF60F71;
 Tue,  7 Feb 2023 17:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B87C433EF;
 Tue,  7 Feb 2023 17:28:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hzUChFNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675790907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XqE4LS53KPySh+DIi+kGIp8MVU99c/d1nHqOWM6ONdg=;
 b=hzUChFNPdmuKir/7tttETHv15epq9+3hJYVs2aZ1d+p0xA7IDcdBiUa/BNbPgK++Z6mF5b
 miqTyNJdwT0+zhboPCh82YABL/AnI9VGm4S48E3vMBWbQCOX5ISXcA978v0zlSj6aQtuzh
 fkDtsMdCxRaglWU/bOSuHi92FD2YVJI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c7fbbf0d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 7 Feb 2023 17:28:27 +0000 (UTC)
Date: Tue, 7 Feb 2023 18:28:26 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Tom Lendacky <thomas.lendacky@amd.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Message-ID: <Y+KKOs0K0hYAHOYh@zx2c4.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230207084116.285787-1-dovmurik@linux.ibm.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> Recent feature to supply RNG seed to the guest kernel modifies the
> kernel command-line by adding extra data at its end; this breaks
> measured boot with SEV and OVMF, and possibly signed boot.
> 
> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> which has its own way of getting random seed (not to mention that
> getting the random seed from the untrusted host breaks the confidential
> computing trust model).
> 
> Disable the RNG seed feature in SEV guests.
> 
> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 
> ---
> 
> There might be a need for a wider change to the ways setup_data entries
> are handled in x86_load_linux(); here I just try to restore the
> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> entry.
> 
> Recent discussions on other (safer?) ways to pass this setup_data entry:
> [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> 
> Note that in qemu 7.2.0 this is broken as well -- there the
> SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> modifies and breaks the measurement of the kernel in SEV measured boot).
> A similar fix will be needed there (but I fear this patch cannot be
> applied as-is).
> ---
>  hw/i386/x86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index eaff4227bd..e65a83f8df 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
>          load_image_size(dtb_filename, setup_data->data, dtb_size);
>      }
>  
> -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
>          setup_data_offset = cmdline_size;
>          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
>          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> 
> base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> -- 
> 2.25.1
> 

Thanks for catching this. The same thing should also probably be set on
the dtb handling, and the commit message updated to reflect that this is
setup_data-specific, not just for the rng seed.

I'm concurrently working on a related bug fix in this same code. If you
want, I can roll a v2 of your patch (retaining your authorship) and
submit that together, if you want.

Jason

