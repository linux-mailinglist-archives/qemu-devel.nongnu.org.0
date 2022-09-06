Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75EC5AEB59
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:11:44 +0200 (CEST)
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZIl-0002XB-Fb
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVYLv-000615-Gn
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVYLr-0005XM-Vf
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662469850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nn/pB/Kx4NJKG2WNArD2IxEEBMVbG2Av3kbi1dd7voQ=;
 b=NwuVJr/KcLteZDhKfFcWBVc2b+nE26dtfyLSGeRwSaFbp69UiUS+B4yV317+XNI6fZuqA7
 RW4/IclRcYfT4MKm02mZ4f0pntpnb5DcWM5vYQIxjEzEv4ryaYyaRDDwjjtamQ9JnTxhAU
 1Wal6WDpK/Z9k/c7bFhBIGDanrKzlcc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-kmpguGvfN8adZkxrvZ8Z6Q-1; Tue, 06 Sep 2022 09:10:49 -0400
X-MC-Unique: kmpguGvfN8adZkxrvZ8Z6Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 sd6-20020a1709076e0600b0073315809fb5so3588144ejc.10
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 06:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=nn/pB/Kx4NJKG2WNArD2IxEEBMVbG2Av3kbi1dd7voQ=;
 b=nrYlxAv6BvxGEw1zyra3NXvGEHJhmEU5lMlRgYmayAC7ysdoNUYoArxDwDE0Qo14Qx
 HwxUNP52GhRNlcvMS0dxeiRRtecGWRdbbbemh7tAt95EABnCUvnXkUcv1/C+FthFgvbx
 O/YWcX3Hr7jeUehrUVqFWlFAy9bTlhmcppBvNsx/ON4kGou04EMWw+QWEPe9lt+Mev03
 gzy4wnsOdf0DXAp2BPtUdsN8FbqdRS2On3KVspF8+vONtWOh4TWuVRf50aWugvX6JIME
 nqGDvNveKhjxuxnAd+dtk2S4Cu1nlO59urt+wIXvs0ctLdB0qpXMQIaRoaw110s9skle
 TLrg==
X-Gm-Message-State: ACgBeo1PTYJ4VP8CPyQ2BhxtrCL5aZ0SXrWMBIOwry3tauJjz9+lDWxq
 IgvxVb0SJtojhkRerniIdL6rPWZyZHgWGzAGlDsH9lbIPhREZ8ANIDptyir5w/zVPmDV+D0+ufT
 bnYDgBoYoRM7brrg=
X-Received: by 2002:a05:6402:f26:b0:448:3165:c706 with SMTP id
 i38-20020a0564020f2600b004483165c706mr38541291eda.143.1662469841181; 
 Tue, 06 Sep 2022 06:10:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ZE3mMXhKAqOG4JjdGK/GylfKrvfmTSNoEKll9FuSS/7TmUiMAu8Wo2OXQxkxuHPfdBsVGWw==
X-Received: by 2002:a05:6402:f26:b0:448:3165:c706 with SMTP id
 i38-20020a0564020f2600b004483165c706mr38540978eda.143.1662469836373; 
 Tue, 06 Sep 2022 06:10:36 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 d16-20020a170906305000b0073dde7c1767sm6700067ejd.175.2022.09.06.06.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 06:10:35 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:10:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca
Subject: Re: [PATCH 00/17] acpi:pc/q35: minor PCI refactoring/cleanups
Message-ID: <20220906091023-mutt-send-email-mst@kernel.org>
References: <20220701133515.137890-1-imammedo@redhat.com>
 <20220906134108.6e8a0fb3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906134108.6e8a0fb3@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 06, 2022 at 01:41:08PM +0200, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 09:34:58 -0400
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > Flushing out ACPI PCI cleanups that preceed conversion of
> > DSDT PCI slots ennumeration to AcpiDevAmlIf interface.
> > It's is mostly collection of patches thraet removes code
> > duplication, we've accumulated around PCI relaterd AML
> > in DSDT.
> 
> ping,
> it still applies cleanly to master.
> 
> Michael can you pick it up?

yes, thanks for the ping!

> > 
> > git:
> >    https://gitlab.com/imammedo/qemu.git x86_pci_cleanups
> > 
> > Igor Mammedov (17):
> >   tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
> >   acpi: x86: deduplicate HPET AML building
> >   tests: acpi: update expected blobs after HPET move
> >   tests: acpi: whitelist pc/q35 DSDT due to HPET AML move
> >   acpi: x86: refactor PDSM method to reduce nesting
> >   x86: acpi: _DSM: use Package to pass parameters
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist pc/q35 DSDT before switching _DSM to use ASUN
> >   x86: acpi: cleanup PCI device _DSM duplication
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
> >   x86: pci: acpi: reorder Device's _ADR and _SUN fields
> >   tests: acpi: update expected blobs
> >   tests: acpi: whitelist pc/q35 DSDT before moving _ADR field
> >   x86: pci: acpi:  reorder Device's _DSM method
> >   tests: acpi: update expected blobs
> >   x86: pci: acpi: deduplate PCI slots creation
> > 
> >  hw/i386/acpi-build.c                  | 302 ++++++++++++++------------
> >  tests/data/acpi/pc/DSDT               | Bin 5987 -> 6422 bytes
> >  tests/data/acpi/pc/DSDT.acpierst      | Bin 5954 -> 6382 bytes
> >  tests/data/acpi/pc/DSDT.acpihmat      | Bin 7312 -> 7747 bytes
> >  tests/data/acpi/pc/DSDT.bridge        | Bin 8653 -> 9496 bytes
> >  tests/data/acpi/pc/DSDT.cphp          | Bin 6451 -> 6886 bytes
> >  tests/data/acpi/pc/DSDT.dimmpxm       | Bin 7641 -> 8076 bytes
> >  tests/data/acpi/pc/DSDT.hpbridge      | Bin 5954 -> 6382 bytes
> >  tests/data/acpi/pc/DSDT.hpbrroot      | Bin 3069 -> 3069 bytes
> >  tests/data/acpi/pc/DSDT.ipmikcs       | Bin 6059 -> 6494 bytes
> >  tests/data/acpi/pc/DSDT.memhp         | Bin 7346 -> 7781 bytes
> >  tests/data/acpi/pc/DSDT.nohpet        | Bin 5845 -> 6280 bytes
> >  tests/data/acpi/pc/DSDT.numamem       | Bin 5993 -> 6428 bytes
> >  tests/data/acpi/pc/DSDT.roothp        | Bin 6195 -> 6656 bytes
> >  tests/data/acpi/q35/DSDT              | Bin 8274 -> 8320 bytes
> >  tests/data/acpi/q35/DSDT.acpierst     | Bin 8291 -> 8337 bytes
> >  tests/data/acpi/q35/DSDT.acpihmat     | Bin 9599 -> 9645 bytes
> >  tests/data/acpi/q35/DSDT.applesmc     | Bin 8320 -> 8366 bytes
> >  tests/data/acpi/q35/DSDT.bridge       | Bin 10988 -> 11449 bytes
> >  tests/data/acpi/q35/DSDT.cphp         | Bin 8738 -> 8784 bytes
> >  tests/data/acpi/q35/DSDT.cxl          | Bin 9600 -> 9646 bytes
> >  tests/data/acpi/q35/DSDT.dimmpxm      | Bin 9928 -> 9974 bytes
> >  tests/data/acpi/q35/DSDT.ipmibt       | Bin 8349 -> 8395 bytes
> >  tests/data/acpi/q35/DSDT.ipmismbus    | Bin 8363 -> 8409 bytes
> >  tests/data/acpi/q35/DSDT.ivrs         | Bin 8291 -> 8337 bytes
> >  tests/data/acpi/q35/DSDT.memhp        | Bin 9633 -> 9679 bytes
> >  tests/data/acpi/q35/DSDT.mmio64       | Bin 9404 -> 9450 bytes
> >  tests/data/acpi/q35/DSDT.multi-bridge | Bin 8568 -> 8640 bytes
> >  tests/data/acpi/q35/DSDT.nohpet       | Bin 8132 -> 8178 bytes
> >  tests/data/acpi/q35/DSDT.numamem      | Bin 8280 -> 8326 bytes
> >  tests/data/acpi/q35/DSDT.pvpanic-isa  | Bin 8375 -> 8421 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm12    | Bin 8880 -> 8926 bytes
> >  tests/data/acpi/q35/DSDT.tis.tpm2     | Bin 8906 -> 8952 bytes
> >  tests/data/acpi/q35/DSDT.viot         | Bin 9383 -> 9429 bytes
> >  tests/data/acpi/q35/DSDT.xapic        | Bin 35637 -> 35683 bytes
> >  35 files changed, 161 insertions(+), 141 deletions(-)
> > 


