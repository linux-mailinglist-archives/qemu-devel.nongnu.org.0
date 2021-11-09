Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFC44B0DC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:07:19 +0100 (CET)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTeY-0006mi-9U
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:07:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkTd0-0005H7-5s
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkTcy-0006HS-FD
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636473939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKdudGr6C+rYXWbIbd6lzHSwC9eYyu0r/+MFK/3W1bs=;
 b=iAntTBBmYot6PrH/E6Cb/gIhf2GC4lngYAuHiAQ68UcNIPCqO8f74HCzZminCGbZYOsAkM
 YdBmx+kc1hXJk+Jgb4x+cZtKZQ/uGWDM/WbBzX6VoglZgCEYvh8zFLHEfc+w3GRBj75mRd
 zTMnzNixWcEFtfswH0f+U6YvDmc9GSw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-ydEkt4h1OUOd8Y5zSDbWJw-1; Tue, 09 Nov 2021 11:05:33 -0500
X-MC-Unique: ydEkt4h1OUOd8Y5zSDbWJw-1
Received: by mail-ed1-f69.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so18259631edl.17
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QKdudGr6C+rYXWbIbd6lzHSwC9eYyu0r/+MFK/3W1bs=;
 b=G0fJ7LzPLhIxtmUrGo6oXE0FqBUq6u1EmsJOXG/V2HjhX3OBFqt3Ue9mrua6tRhHGr
 YhPeUQfUw54cLoayz0qyweRlmUhxBbcz73k8+IjaJbaesEDb2+mJiCx4//OZT2+Uqm0l
 eSK6cvwFgiiyHGJHzHitFUV7b5/1AiZ2CCS7dwK1gNmF4iSxB57Aj6fY9puXi0xYivRc
 3fKiiJiVgWCIj4Nwpp//Yizqpu0dJN81fi2Q1xlZul4b9YaSMwzo2L9dBgEIDHRc0/L1
 FuUOPM8mIOiquPyZW9rkoLpbhmvJVI/tChQyN5P+bxV7EwyxbVJlpPNzv3UETuNYEmLx
 ULdg==
X-Gm-Message-State: AOAM533i+rpQfHoXLM2vvvGwtuwX60ODrnPB7t7ouenwLLqGskopARM3
 mMx/zz1h0DpykmftxKAsBAwm05VPaF/QvevVh+PNGD+2bjc5YO0ZHLB4hTYDNZx+JgXMNgOuril
 Ol2aB11Lm/p8OPVo=
X-Received: by 2002:a05:6402:148:: with SMTP id
 s8mr11644803edu.221.1636473932571; 
 Tue, 09 Nov 2021 08:05:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP6uzZWm6mBgCqiczg2npLRPEdxzXx6FbXUdtRJBwjotav2BZt5vY6d9Yw6sTwciNQPCpkiw==
X-Received: by 2002:a05:6402:148:: with SMTP id
 s8mr11644749edu.221.1636473932317; 
 Tue, 09 Nov 2021 08:05:32 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id a15sm11403810edr.76.2021.11.09.08.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 08:05:31 -0800 (PST)
Date: Tue, 9 Nov 2021 11:05:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 3/3] tests: acpi: Add updated TPM related tables
Message-ID: <20211109110331-mutt-send-email-mst@kernel.org>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-4-stefanb@linux.ibm.com>
 <20211109091338-mutt-send-email-mst@kernel.org>
 <YYqFxgu74BIh0ZjB@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YYqFxgu74BIh0ZjB@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 02:29:26PM +0000, Daniel P. Berrangé wrote:
> On Tue, Nov 09, 2021 at 09:14:25AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Nov 09, 2021 at 09:01:52AM -0500, Stefan Berger wrote:
> > > The updated TPM related tables have the following additions:
> > > 
> > >    Device (TPM)
> > >    {
> > >        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
> > > +      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
> > > +      Name (_UID, One)  // _UID: Unique ID
> > >        Name (_STA, 0x0F)  // _STA: Status
> > >        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > 
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Cc: Ani Sinha <ani@anisinha.ca>
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > ---
> > >  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8900 bytes
> > >  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8921 bytes
> > >  tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
> > >  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
> > >  tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
> > >  5 files changed, 11 deletions(-)
> > 
> > A disadvantage to doing it like this is that git thinks
> > it's ok to replace any empty file with this, so if acpi
> > changed in any way git will happily resolve it
> > replacing it with this version.
> 
> Do we actually need to be storing these binary files in git
> at all ?
> 
> IIUC, the test will do two things
> 
>  - memcmp the expected binary we store, against the new binary
>    we generated.
>  - if they differ, then disassemble both and report the
>    differences in a user friendly-ish way

Second if iasl is installed.

> What if we only stored the sha256 checksum of the binary

Hmm, point being? Same some space?

> *and*
> the dissasembled output in git, never the full binary.

We used to. The issue is that dissasembled output depends
very much on the disassembler. Disassembling both
with the same tool is one way to address this.

> IIUC, that would give us the same level of diagnostic output
> from the test failures. The dissasembled output would then
> give us meaningful patches for reviewers to look at. The
> author wouldn't have to describe the difference in the
> commit message as Stefan has (helpfully) done here.
> 
> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


