Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4C68E464
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:26:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXKx-00015P-FE; Tue, 07 Feb 2023 18:25:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPXKq-000154-BP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:25:12 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org>)
 id 1pPXKo-0000h2-6K
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:25:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 574E9B81B7A
 for <qemu-devel@nongnu.org>; Tue,  7 Feb 2023 23:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A59C433D2
 for <qemu-devel@nongnu.org>; Tue,  7 Feb 2023 23:25:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ENDucODQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675812302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gspLylh5ZGjM5HPzeIhwrlbMSJpRPZ5lqLERp6d92M4=;
 b=ENDucODQylm5OpNc6KRJKwA2hwky+46B3nSvxc5nWV5vVqpI4V78LZYU8pPMxlWWm7a1FY
 Uqo3C0Wv/oFjfZqjdmbWAM0VAdxrviLhp1y83jShrBSAKCN+qlrKvTuPh/G7pDJpihRWoR
 SjVBjY/sKxfaDRPnHYULrGyz48w6r3E=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 68ad2b55
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 7 Feb 2023 23:25:02 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ud5so46963527ejc.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 15:25:00 -0800 (PST)
X-Gm-Message-State: AO0yUKVON3kh8Ngn6c3ndyugV300SoX0BH1iFJotXbbYlGCZclBUp6kI
 AO0/vgheKJw+xXr2/qg3FbeUzIjjvBtzotpmnm8=
X-Google-Smtp-Source: AK7set+0toHzRwpgU/KxVnhloTCOEGbHWoqd+lqccukDRvEoqOKxJ8F99ZZXHrP/cEUpmC+rSo4oPo63bbOtk82iXNw=
X-Received: by 2002:a17:906:e24c:b0:89c:7298:2de4 with SMTP id
 gq12-20020a170906e24c00b0089c72982de4mr1095868ejb.91.1675812299557; Tue, 07
 Feb 2023 15:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
In-Reply-To: <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Feb 2023 20:24:46 -0300
X-Gmail-Original-Message-ID: <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
Message-ID: <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 qemu-devel@nongnu.org, 
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=KxRu=6D=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
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

Hi Tom,

On Tue, Feb 7, 2023 at 8:21 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 2/7/23 15:45, Michael S. Tsirkin wrote:
> > On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> >> Recent feature to supply RNG seed to the guest kernel modifies the
> >> kernel command-line by adding extra data at its end; this breaks
> >> measured boot with SEV and OVMF, and possibly signed boot.
> >>
> >> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> >> which has its own way of getting random seed (not to mention that
> >> getting the random seed from the untrusted host breaks the confidential
> >> computing trust model).
> >
> > Nope - getting a random seed from an untrusted source should not break
> > anything assuming you also have some other randomness source.
> > If you don't then you have other problems.
> >
> >> Disable the RNG seed feature in SEV guests.
> >>
> >> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> >> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> >> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> >>
> >> ---
> >>
> >> There might be a need for a wider change to the ways setup_data entries
> >> are handled in x86_load_linux(); here I just try to restore the
> >> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> >> entry.
> >>
> >> Recent discussions on other (safer?) ways to pass this setup_data entry:
> >> [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> >>
> >> Note that in qemu 7.2.0 this is broken as well -- there the
> >> SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> >> modifies and breaks the measurement of the kernel in SEV measured boot).
> >> A similar fix will be needed there (but I fear this patch cannot be
> >> applied as-is).
> >
> > So it's not a regression, is it?
>
> SEV kernel hash comparison succeeded with Qemu v7.1.0, but fails with
> v7.2.0, so I think that is a regression.

Please let me know if this series fixes it:
https://lore.kernel.org/all/20230207224847.94429-1-Jason@zx2c4.com/

Jason

