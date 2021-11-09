Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136244B191
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:53:02 +0100 (CET)
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUMn-0001ej-AA
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkULB-0000Xg-1J
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:51:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkUL7-0002Z6-9p
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:51:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636476675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/yCuWjQb9jtgdm2EACWjEE0WBmuOwHptFJptR7ofaW0=;
 b=bXqKi2DvHBjr/TIO02A+AiDDNVyS8SoyeDOrSfJ11LMoXBz3QFUQy/zTwqC3EQ4B1Pi1Gy
 xM2QASNgwJ3W5//FBbtK3nwwNr96Zeew3GLIL+cgcOvu2ZjaVt9OsMtUTiinMvCXoVnS6U
 m99Te2jG231meOa7ITaMptaTmfXw+tE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-lYjpr7BcOdyCwJ_MeHDc5A-1; Tue, 09 Nov 2021 11:51:03 -0500
X-MC-Unique: lYjpr7BcOdyCwJ_MeHDc5A-1
Received: by mail-ed1-f71.google.com with SMTP id
 q6-20020a056402518600b003e28d92bb85so18434718edd.7
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/yCuWjQb9jtgdm2EACWjEE0WBmuOwHptFJptR7ofaW0=;
 b=p2f+e7IFppi3aIeRpPF9t0vC9xv5PO4Nzh51DHxhU0d2dl7GEFNnkvNHE1MhM5lDpK
 anZzXQtOfbEC2lLHzyETtjgdHDL29emE56efXtdGwoUvBt7G3m0B3LNA1/BYvE7pq9Gf
 8WJIfh7/S4YmEjfzQBZAfxCrbajn89Uwz5j+UVyKCfAqB4G5zdjLcKAqDATZmZ5hWnjx
 iTGjR1+/GgxiOKDInVm58DxtxhAaQJu8VfWYiFMMPIrOpAzSf1utdh1vviwjMCHIWtIZ
 gTtsT133U5GwEJxbZ+o8SwYJLTIk746JSZW2ASEoWKPyxzaem2oLGv1eoat7QC3Kq5XR
 Kolw==
X-Gm-Message-State: AOAM530iyvU+1ttna7kVpoOeceCG21q8Epg3o9hXZasZDtgnJ5FW/2rm
 GeN4haeyfcs5JUqlVGvV0bSWGRb9YaL4LRiHTl0gSO2m//6VWIAVs1ZNjN7SkzZvlkAZ+gyBbZh
 OwU+gGUQKBq2z6wA=
X-Received: by 2002:aa7:c508:: with SMTP id o8mr12086929edq.393.1636476662515; 
 Tue, 09 Nov 2021 08:51:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxemB+j6QBH63D/rS6bJ5y3c3JaYRpyuD2oIPGU0GBSFCVHi75UeUAP/ig5EQ2Rgcms9uujvQ==
X-Received: by 2002:aa7:c508:: with SMTP id o8mr12086903edq.393.1636476662342; 
 Tue, 09 Nov 2021 08:51:02 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id h10sm11653110edk.41.2021.11.09.08.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 08:51:01 -0800 (PST)
Date: Tue, 9 Nov 2021 11:50:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 3/3] tests: acpi: Add updated TPM related tables
Message-ID: <20211109114542-mutt-send-email-mst@kernel.org>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-4-stefanb@linux.ibm.com>
 <20211109091338-mutt-send-email-mst@kernel.org>
 <YYqFxgu74BIh0ZjB@redhat.com>
 <20211109110331-mutt-send-email-mst@kernel.org>
 <YYqe4o9b+mHzwz0r@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YYqe4o9b+mHzwz0r@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 04:16:34PM +0000, Daniel P. Berrangé wrote:
> On Tue, Nov 09, 2021 at 11:05:28AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Nov 09, 2021 at 02:29:26PM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Nov 09, 2021 at 09:14:25AM -0500, Michael S. Tsirkin wrote:
> > > > On Tue, Nov 09, 2021 at 09:01:52AM -0500, Stefan Berger wrote:
> > > > > The updated TPM related tables have the following additions:
> > > > > 
> > > > >    Device (TPM)
> > > > >    {
> > > > >        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
> > > > > +      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
> > > > > +      Name (_UID, One)  // _UID: Unique ID
> > > > >        Name (_STA, 0x0F)  // _STA: Status
> > > > >        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > > > 
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > > > Cc: Ani Sinha <ani@anisinha.ca>
> > > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > > > ---
> > > > >  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8900 bytes
> > > > >  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8921 bytes
> > > > >  tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
> > > > >  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
> > > > >  tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
> > > > >  5 files changed, 11 deletions(-)
> > > > 
> > > > A disadvantage to doing it like this is that git thinks
> > > > it's ok to replace any empty file with this, so if acpi
> > > > changed in any way git will happily resolve it
> > > > replacing it with this version.
> > > 
> > > Do we actually need to be storing these binary files in git
> > > at all ?
> > > 
> > > IIUC, the test will do two things
> > > 
> > >  - memcmp the expected binary we store, against the new binary
> > >    we generated.
> > >  - if they differ, then disassemble both and report the
> > >    differences in a user friendly-ish way
> > 
> > Second if iasl is installed.
> > 
> > > What if we only stored the sha256 checksum of the binary
> > 
> > Hmm, point being? Same some space?
> > 
> > > *and*
> > > the dissasembled output in git, never the full binary.
> > 
> > We used to. The issue is that dissasembled output depends
> > very much on the disassembler. Disassembling both
> > with the same tool is one way to address this.
> 
> Oh, so new isal releases can change the format, that's
> annoying :-(

Well iasl never promised to generate exactly the same output
for the same input. For example, at some point they
started adding comments documenting the output.
How stable it's been recently/on platforms we care about - I don't know.
I'm fine with adding the disassembled files and seeing
where does it lead us.

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


