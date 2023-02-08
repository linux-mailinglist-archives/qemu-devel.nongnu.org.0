Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E7368EC25
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:51:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPh6i-0005vq-5u; Wed, 08 Feb 2023 04:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPh6P-0005vb-3S
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPh6M-0004zY-PI
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CcUySD6cfBfos723aukQ/6OtStAt5WZNZ36arkgtON4=;
 b=dWiE5vNnF8BcL2jKmgR7vkCqoaxV7h4/+4YaE595yxGOlhU72QWhGB6Ez4bTO7nCg6QpRN
 9m1fhR8slcq2pb5Z0TSjgjv+aA5EwrG9gV6h7TQ3KE1l32GGQzjP3scEJrI2uBqS5hmV0l
 JGqtapRRKVX6gbkItz9GwWSCMaJW20I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-503-scM4zt6-O86OUXdy0E3XRw-1; Wed, 08 Feb 2023 04:50:52 -0500
X-MC-Unique: scM4zt6-O86OUXdy0E3XRw-1
Received: by mail-wr1-f70.google.com with SMTP id
 u10-20020a5d6daa000000b002bfc2f61048so2676403wrs.23
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 01:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CcUySD6cfBfos723aukQ/6OtStAt5WZNZ36arkgtON4=;
 b=mvFuUElG/DOOQvNYU3ouBwkpbrZt3Xcwv4dfge2er3IinYKdk9d/bOAKrE24fVUNZN
 Ki4XPkWHSMAFJwJY6iJ8vfY+5yS4XyDPkY+t3XWA98vKZjAyooxynV7UkjMzx3MmGORo
 7pcDDVF7I5FYQNbiAbLHgGLpNr83XyyyUnyXyWPptqZ73KOMnDu+7aioRuEqsSvy9FmN
 GZ3km0VcFeULlB0In6HnU+9Q8CPwj0vaKIsr3SwHANn+vSGpHY4zMOpvhrNLcHkts0ZA
 kWncsJEPECrE1GccsMP8G/swubNUM/T4atQrxXrdMfBx0hu/TQi96lfCqDDHpwRg7/YT
 Pzyw==
X-Gm-Message-State: AO0yUKUEZwcX+oQi5IbpbWiJUi7mI2AxqVXl3JF43bZqD7fNB9DpeL46
 MCIS2kEuXXrI+Q6ENHeMoXOliX0TrVnPIUQe8BC0hCebM+Cz5NDpOoADIiR+1QXuaixaMq3QpsO
 rfijscv1n6bpkNTc=
X-Received: by 2002:a05:600c:4d90:b0:3de:1d31:1042 with SMTP id
 v16-20020a05600c4d9000b003de1d311042mr8102639wmp.23.1675849850941; 
 Wed, 08 Feb 2023 01:50:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9Y1sJt591wjiFT5H3Ud9W6ZmVZ13MFo+2oR/KQZwBS1u5HOQhmatt2Js9hjGj8xhhISAB/1g==
X-Received: by 2002:a05:600c:4d90:b0:3de:1d31:1042 with SMTP id
 v16-20020a05600c4d9000b003de1d311042mr8102624wmp.23.1675849850727; 
 Wed, 08 Feb 2023 01:50:50 -0800 (PST)
Received: from redhat.com ([2.52.156.127]) by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c2cae00b003dc42d48defsm1495736wmc.6.2023.02.08.01.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 01:50:50 -0800 (PST)
Date: Wed, 8 Feb 2023 04:50:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
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
Message-ID: <20230208044643-mutt-send-email-mst@kernel.org>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <Y+Ns2fMIhXPKxYmG@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+Ns2fMIhXPKxYmG@redhat.com>
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

On Wed, Feb 08, 2023 at 09:35:21AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 07, 2023 at 04:45:19PM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
> > > Recent feature to supply RNG seed to the guest kernel modifies the
> > > kernel command-line by adding extra data at its end; this breaks
> > > measured boot with SEV and OVMF, and possibly signed boot.
> > > 
> > > Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
> > > which has its own way of getting random seed (not to mention that
> > > getting the random seed from the untrusted host breaks the confidential
> > > computing trust model).
> > 
> > Nope - getting a random seed from an untrusted source should not break
> > anything assuming you also have some other randomness source.
> > If you don't then you have other problems.
> > 
> > > Disable the RNG seed feature in SEV guests.
> > > 
> > > Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
> > > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > > 
> > > ---
> > > 
> > > There might be a need for a wider change to the ways setup_data entries
> > > are handled in x86_load_linux(); here I just try to restore the
> > > situation for SEV guests prior to the addition of the SETUP_RNG_SEED
> > > entry.
> > > 
> > > Recent discussions on other (safer?) ways to pass this setup_data entry:
> > > [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
> > > 
> > > Note that in qemu 7.2.0 this is broken as well -- there the
> > > SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
> > > modifies and breaks the measurement of the kernel in SEV measured boot).
> > > A similar fix will be needed there (but I fear this patch cannot be
> > > applied as-is).
> > 
> > So it's not a regression, is it?
> > 
> > > ---
> > >  hw/i386/x86.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> > > index eaff4227bd..e65a83f8df 100644
> > > --- a/hw/i386/x86.c
> > > +++ b/hw/i386/x86.c
> > > @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
> > >          load_image_size(dtb_filename, setup_data->data, dtb_size);
> > >      }
> > >  
> > > -    if (!legacy_no_rng_seed && protocol >= 0x209) {
> > > +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
> > >          setup_data_offset = cmdline_size;
> > >          cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
> > >          kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
> > > 
> > > base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> > 
> > I am beginning to think we have been hasty here. no rng seed
> > should have been then default and requested with a flag.
> > Then we'd avoid all this heartburn - and SEV might not be the
> > only workload broken.
> 
> IMHO the main problem we have here is a lack of automated testing
> coverage. There are too many subtle edge cases to rely on reviewers
> spotting flaws in the code, we need automation.
> 
> Obviously our CI platforms don't have SEV hardware support[1], but we
> still could have had an avocado test case in QEMU can be run manually
> to validate things.
> 
> Also we should have avocado test case to cover SecureBoot with
> -kernel, and that can be run in CI. And tests for the big kernel
> scenario that this also broke with 7.2

Could we not sign the empty image from bios test and use that with CI?
That signature can stay constant.

> With regards,
> Daniel
> 
> [1] Anyone fancy adding SEV(ES|SNP) emulation to QEMU :-) Obviously
>     would have to have separate certs/keys at the root of trust, but
>     even with such a caveat it'd make life easier for developers and
>     maintainers to not have to rely on real hardware all the time.


Yea this last one is what I thought too.



-- 
MST


