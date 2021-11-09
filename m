Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B937344B0F2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 17:15:49 +0100 (CET)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTmm-0002wk-C6
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 11:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkTll-0002GX-5k
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:14:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mkTlg-0002Re-FH
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 11:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636474480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gV8wiGhhHfDWiPm30dpAOYqrB92Yw9MYmpFU42F6epE=;
 b=ErVwJeTFrnN1Y4HcSqo1g+B73TBkD8mDuroT0NBe4bKZZY6lS1ZNgpfHmufioCV4rbqA2G
 CHQFuy+16/mfoUXcrfQX15X3CxyeY11jj8lffH9CXKRY/q7De/8d+UOTCSLVXTz3po+sKB
 VDCHEvg4+pcmuhQ5hfdv9MSzU6yLHxQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-dBnIwSNDP5uRbyrWbdK3wg-1; Tue, 09 Nov 2021 11:14:38 -0500
X-MC-Unique: dBnIwSNDP5uRbyrWbdK3wg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z21-20020a05640240d500b003e3340a215aso7458441edb.10
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 08:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gV8wiGhhHfDWiPm30dpAOYqrB92Yw9MYmpFU42F6epE=;
 b=g+oehhrz0veHg8AogOYVpTop+qVbjErnN3Ot9hv1Rz+wZk91KZWA97aGB3W0f5ar4w
 N6U+GuUrthkQxYryF+UEf/1FlqhsMKQEyOwgFOG3//VKtPVgaEiGvkvGKbvXSlkE4AxT
 AKYqvzncblvPGGbCs2aHLTeOZn2JloxJPYWc6hsTsCpIAM/qWQKMpE2lFbeTkBWKoajk
 Y+0hgKqQUXf0+hTOJkre4WYUlc7yh94SLvR7KRHdBrvN0ae93mszB4OO4bI3NaMrFCA7
 aRvO/NcfdUSq9x8UA3OW4eo03F8Gq9Gk1kZ9G8p7nKCS/B5GpjK1f4p1hwZRZOQyABu1
 /9AQ==
X-Gm-Message-State: AOAM532a0e89TUOd+RzfwTcRLE1UE3+IRG5rn7BAWHqDdKfcoVbvHsfj
 JNxn+ySopNSLr0grZ5W2CPIphMWaUuXK9kcMtBbz2mfumj7sbMfviJMVe6uUQOGvclurbSQtP5o
 cw3i0tPEcsgG9J78=
X-Received: by 2002:a17:906:90da:: with SMTP id
 v26mr11198987ejw.442.1636474477630; 
 Tue, 09 Nov 2021 08:14:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFRl2a9j0G0ePhcUAdjd+21xbZsaSKQbzHb+mmahtgM5MA6L7y744X2yvchjuypgzu+h17iw==
X-Received: by 2002:a17:906:90da:: with SMTP id
 v26mr11198952ejw.442.1636474477420; 
 Tue, 09 Nov 2021 08:14:37 -0800 (PST)
Received: from redhat.com ([2.55.133.41])
 by smtp.gmail.com with ESMTPSA id ca4sm9849937ejb.1.2021.11.09.08.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 08:14:37 -0800 (PST)
Date: Tue, 9 Nov 2021 11:14:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2 3/3] tests: acpi: Add updated TPM related tables
Message-ID: <20211109110544-mutt-send-email-mst@kernel.org>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-4-stefanb@linux.ibm.com>
 <20211109091338-mutt-send-email-mst@kernel.org>
 <YYqFxgu74BIh0ZjB@redhat.com>
 <CAARzgwwmvb-BRpctZ+BsrS0BBsnSDXK4MZgKD5-YB_c83NbUiw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwwmvb-BRpctZ+BsrS0BBsnSDXK4MZgKD5-YB_c83NbUiw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: marcandre.lureau@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 08:26:11PM +0530, Ani Sinha wrote:
> On Tue, Nov 9, 2021 at 8:00 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Nov 09, 2021 at 09:14:25AM -0500, Michael S. Tsirkin wrote:
> > > On Tue, Nov 09, 2021 at 09:01:52AM -0500, Stefan Berger wrote:
> > > > The updated TPM related tables have the following additions:
> > > >
> > > >    Device (TPM)
> > > >    {
> > > >        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
> > > > +      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
> > > > +      Name (_UID, One)  // _UID: Unique ID
> > > >        Name (_STA, 0x0F)  // _STA: Status
> > > >        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> > > >
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > > Cc: Ani Sinha <ani@anisinha.ca>
> > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > > ---
> > > >  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 0 -> 8900 bytes
> > > >  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 0 -> 8921 bytes
> > > >  tests/data/acpi/q35/TCPA.tis.tpm12          | Bin 0 -> 50 bytes
> > > >  tests/data/acpi/q35/TPM2.tis.tpm2           | Bin 0 -> 76 bytes
> > > >  tests/qtest/bios-tables-test-allowed-diff.h |  11 -----------
> > > >  5 files changed, 11 deletions(-)
> > >
> > > A disadvantage to doing it like this is that git thinks
> > > it's ok to replace any empty file with this, so if acpi
> > > changed in any way git will happily resolve it
> > > replacing it with this version.
> >
> > Do we actually need to be storing these binary files in git
> > at all ?
> >
> > IIUC, the test will do two things
> >
> >  - memcmp the expected binary we store, against the new binary
> >    we generated.
> >  - if they differ, then disassemble both and report the
> >    differences in a user friendly-ish way
> >
> > What if we only stored the sha256 checksum of the binary *and*
> > the dissasembled output in git, never the full binary.
> 
> If you are going down that path, why need the sha256 at all? The test
> can disassemble the tables from qemu and only compare the disassembled
> ASL.

The output isn't stable unfortunately, so it can't replace the binary..
However, the process of documenting what changed is quite fiddly, so I
am open to including both the binary and the dis-assembled file.
An issue is that iasl does not support all platforms that qemu
supports, in particular the disassembler is broken on BE platforms.
Not sure how big a deal that is ...

> >
> > IIUC, that would give us the same level of diagnostic output
> > from the test failures. The dissasembled output would then
> > give us meaningful patches for reviewers to look at. The
> > author wouldn't have to describe the difference in the
> > commit message as Stefan has (helpfully) done here.
> >
> >
> >
> > Regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> >


