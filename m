Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A840868E31B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:47:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVmO-00051O-LW; Tue, 07 Feb 2023 16:45:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPVmM-00050O-8d
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:45:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPVmK-0007zr-DZ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675806327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JoC59LVHpCa/1Ytt7TjtoZjqjVC+odBgqEpe+3vNfYY=;
 b=XVlKb0SyPyQQClvMq/KLCw6LZXeftsuSAe5ZKtBwXHtkqj9Ecge5bbL/VfGah9EzjxBSUa
 BwR6iISosyKkORMlswf3nJxIGpwPs6JqxWQwPVb/5c7/ZAA00HShPR0fZqEalxf92zagI8
 78HXboj1JHmkWFbIQ+nYDgXSaWbVdGE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-E72LuukDN_-3O05eysizfA-1; Tue, 07 Feb 2023 16:45:25 -0500
X-MC-Unique: E72LuukDN_-3O05eysizfA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg32-20020a05600c3ca000b003dc0df8c77dso55369wmb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 13:45:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoC59LVHpCa/1Ytt7TjtoZjqjVC+odBgqEpe+3vNfYY=;
 b=6zqm+2Bd714yuqslvdgHGq3U0zSJFH86bBVkYmD8OFXLnXEFDpnMLyDZdBsqHQCxkz
 5X+yAGimWy9kUzMe9W0jKWla55JNfmHJLu4glRMgTBNT8oGXcG427Lco2uNyDuuX5jYX
 p/oNsIHtrv37HV5R6ub38QuKbyE7heaULoIrNq6JflvXgDqdgq/p4mP8h4ciiohhBjzj
 rDsRZ2APkEtPJdBYxJMLd524LTngYR+jgXbgvN+ENkJ2nj6b0fE6gCP4pnIpi64bXAfB
 2rtMnuchtk2UrZu6vKDvNATVOzG6OW7UqXgsA4814P3Q1J3D3vbpuJ/cM2LNaJp5ZygG
 +Now==
X-Gm-Message-State: AO0yUKVJTeUXJxQ+RCFh1cU0KULVmipRx28lFEo9antE6CaXi17KPCS0
 h8xsIEpBCSEK9/ljA6tzyiTDnoMOMLIVOwTLG8Wnd+9t+Gh+O2c7Xt1z9v+iV7FNAFFpuAotn26
 sc/bluiIsPutMZyU=
X-Received: by 2002:adf:e40c:0:b0:2c3:ec55:b1b5 with SMTP id
 g12-20020adfe40c000000b002c3ec55b1b5mr4512139wrm.15.1675806324467; 
 Tue, 07 Feb 2023 13:45:24 -0800 (PST)
X-Google-Smtp-Source: AK7set/D0If38q8Hxv7rbjCqA+3CT2PcgMNNw80mtrJy6I3i2f9vwyOiBZ0DfI4K4Gt2gZyngz3mxw==
X-Received: by 2002:adf:e40c:0:b0:2c3:ec55:b1b5 with SMTP id
 g12-20020adfe40c000000b002c3ec55b1b5mr4512121wrm.15.1675806324229; 
 Tue, 07 Feb 2023 13:45:24 -0800 (PST)
Received: from redhat.com ([2.52.8.17]) by smtp.gmail.com with ESMTPSA id
 h7-20020adffa87000000b002c3e698d7a4sm6717828wrr.24.2023.02.07.13.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 13:45:23 -0800 (PST)
Date: Tue, 7 Feb 2023 16:45:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Tom Lendacky <thomas.lendacky@amd.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Message-ID: <20230207164117-mutt-send-email-mst@kernel.org>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207084116.285787-1-dovmurik@linux.ibm.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Nope - getting a random seed from an untrusted source should not break
anything assuming you also have some other randomness source.
If you don't then you have other problems.

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

So it's not a regression, is it?

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

I am beginning to think we have been hasty here. no rng seed
should have been then default and requested with a flag.
Then we'd avoid all this heartburn - and SEV might not be the
only workload broken.
Maybe not too late. Jason - objections?

> -- 
> 2.25.1


