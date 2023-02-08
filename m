Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A168F256
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:49:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmfg-0008K8-U8; Wed, 08 Feb 2023 10:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPmf5-00083d-6H
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:47:09 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org>)
 id 1pPmf2-0003iI-RI
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:47:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D54E161704
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 15:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A30C433D2
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 15:47:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="op0YRcsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675871219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l/MuR99AsLWOTwlabWqa7NPnfNvMeOIB9iVWaOmDVOM=;
 b=op0YRcsSgPnkCxBkggDU8LqgeUqG0sfye9pwzQhh2Ocg8S2wJV4iVXnZT65Ojc/+INClgr
 zfJ43erHoYSWFywjB0/dy6aISdMJInMWRwRU8nmaHKRtb9axC/OaPjCEcunT8dWYrS6m40
 vCLlVtvaTbYZqv2zl9ULfKN2S1AQhn4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 18423e3e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Wed, 8 Feb 2023 15:46:58 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5258f66721bso190427397b3.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 07:46:58 -0800 (PST)
X-Gm-Message-State: AO0yUKVTaS/riglVjFraawJvPX6RgGDHAzQm0igO79wRnLKEFkPzdUvB
 HxLFMdxO+WP0YEWFMYwiMA6nUhSd508EgtcF++I=
X-Google-Smtp-Source: AK7set/PRe72ulGx7e9IutMFFoELmm8UhkobrY1b1+fJw67eRbn+zTJO0GpONFOx+Z4LUKMZKJJDUpjD5MOK5JJtlyg=
X-Received: by 2002:a81:6789:0:b0:529:6388:21b with SMTP id
 b131-20020a816789000000b005296388021bmr963543ywc.454.1675871217855; Wed, 08
 Feb 2023 07:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20230207224847.94429-1-Jason@zx2c4.com>
 <20230207224847.94429-3-Jason@zx2c4.com>
 <4955a608-2e8d-e399-6ae0-58f9d289e06f@amd.com>
In-Reply-To: <4955a608-2e8d-e399-6ae0-58f9d289e06f@amd.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Feb 2023 12:46:45 -0300
X-Gmail-Original-Message-ID: <CAHmME9rK++JKBBXj=Ydp8Ti1Ew2zzWrs=DcxW5gen4rorr2SsQ@mail.gmail.com>
Message-ID: <CAHmME9rK++JKBBXj=Ydp8Ti1Ew2zzWrs=DcxW5gen4rorr2SsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86: don't append setup_data to cmdline for SEV guests
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=Pi03=6E=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

On Wed, Feb 8, 2023 at 12:38 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> On 2/7/23 16:48, Jason A. Donenfeld wrote:
> > From: Dov Murik <dovmurik@linux.ibm.com>
> >
> > Modifying the cmdline by appending setup_data breaks measured boot with
> > SEV and OVMF, and possibly signed boot. Previously this was disabled
> > when appending to the kernel image, but with eac7a7791bb6 ("x86: don't
> > let decompressed kernel image clobber setup_data"), this was changed to
> > the cmdline file instead, with the sev_enabled() check left out.
> >
> > Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >   hw/i386/x86.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index c6d7bf6db2..80a1678acd 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -1079,7 +1079,7 @@ void x86_load_linux(X86MachineState *x86ms,
> >       fclose(f);
> >
> >       /* append dtb to kernel */
> > -    if (dtb_filename) {
> > +    if (dtb_filename && !sev_enabled()) {
>
> Is this change necessary? From an SEV point of view, the DTB file should
> be "constant" and so a guest owner will be able to use that to correctly
> verify the SEV LAUNCH measurement. Additionally, it won't change from the
> time it was measured to the time OVMF validates everything. Of course, I
> don't really anticipate that a DTB file would be used with an SEV guest,
> anyway.

Yes, it does make sense to do it like this 2/2 patch does here. (I
made the change for the DTB.) The reason is that the first setup_data
link is already conditionalized on sev:

    /*
    * If we're starting an encrypted VM, it will be OVMF based, which uses the
    * efi stub for booting and doesn't require any values to be placed in the
    * kernel header.  We therefore don't update the header so the hash of the
    * kernel on the other side of the fw_cfg interface matches the hash of the
    * file the user passed in.
    */
   if (!sev_enabled() && first_setup_data) {
       SetupDataFixup *fixup = g_malloc(sizeof(*fixup));

       memcpy(setup, header, MIN(sizeof(header), setup_size));
       /* Offset 0x250 is a pointer to the first setup_data link. */

