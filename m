Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F368EB90
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:36:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgrd-0006JT-2z; Wed, 08 Feb 2023 04:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPgrV-0006II-Ic
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:35:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pPgrT-0004fa-OE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675848930;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VL5cIazM8B/0cyOdPtwkVkNgPEauv+dOU5U1Aqs4QY0=;
 b=eE2MS3BQZmbfVwVzHndrEBz272CAGwaDtAcdKcnjruz0lb28N8KTNyqFOUK0xdOy+Pc9K5
 Kh6bR+4GJqm95kdVGay8L1yVtbZfwlA6TwM1LRnC6l8/ACY0P2TXo37Tq9sC89jHBJ9l6w
 BPIGHORvaCIQmdih5B8tCVdNvHhe264=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-jCJdDhEoNQ69q6i-OHkggw-1; Wed, 08 Feb 2023 04:35:26 -0500
X-MC-Unique: jCJdDhEoNQ69q6i-OHkggw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E17D101A55E;
 Wed,  8 Feb 2023 09:35:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4175840C83B6;
 Wed,  8 Feb 2023 09:35:24 +0000 (UTC)
Date: Wed, 8 Feb 2023 09:35:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Message-ID: <Y+Ns2fMIhXPKxYmG@redhat.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230207164117-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Feb 07, 2023 at 04:45:19PM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> > Recent feature to supply RNG seed to the guest kernel modifies the
> > kernel command-line by adding extra data at its end; this breaks
> > measured boot with SEV and OVMF, and possibly signed boot.
> > 
> > Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> > which has its own way of getting random seed (not to mention that
> > getting the random seed from the untrusted host breaks the confidential
> > computing trust model).
> 
> Nope - getting a random seed from an untrusted source should not break
> anything assuming you also have some other randomness source.
> If you don't then you have other problems.
> 
> > Disable the RNG seed feature in SEV guests.
> > 
> > Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > 
> > ---
> > 
> > There might be a need for a wider change to the ways setup_data entries
> > are handled in x86_load_linux(); here I just try to restore the
> > situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> > entry.
> > 
> > Recent discussions on other (safer?) ways to pass this setup_data entry:
> > [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> > 
> > Note that in qemu 7.2.0 this is broken as well -- there the
> > SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> > modifies and breaks the measurement of the kernel in SEV measured boot).
> > A similar fix will be needed there (but I fear this patch cannot be
> > applied as-is).
> 
> So it's not a regression, is it?
> 
> > ---
> >  hw/i386/x86.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > index eaff4227bd..e65a83f8df 100644
> > --- a/hw/i386/x86.c
> > +++ b/hw/i386/x86.c
> > @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
> >          load_image_size(dtb_filename, setup_data->data, dtb_size);
> >      }
> >  
> > -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> > +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
> >          setup_data_offset = cmdline_size;
> >          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
> >          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> > 
> > base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> 
> I am beginning to think we have been hasty here. no rng seed
> should have been then default and requested with a flag.
> Then we'd avoid all this heartburn - and SEV might not be the
> only workload broken.

IMHO the main problem we have here is a lack of automated testing
coverage. There are too many subtle edge cases to rely on reviewers
spotting flaws in the code, we need automation.

Obviously our CI platforms don't have SEV hardware support[1], but we
still could have had an avocado test case in QEMU can be run manually
to validate things.

Also we should have avocado test case to cover SecureBoot with
-kernel, and that can be run in CI. And tests for the big kernel
scenario that this also broke with 7.2

With regards,
Daniel

[1] Anyone fancy adding SEV(ES|SNP) emulation to QEMU :-) Obviously
    would have to have separate certs/keys at the root of trust, but
    even with such a caveat it'd make life easier for developers and
    maintainers to not have to rely on real hardware all the time.
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


