Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E851027FE92
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 13:41:30 +0200 (CEST)
Received: from localhost ([::1]:46496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNwxm-0007WD-1R
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 07:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kNwwo-00070G-6s
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 07:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kNwwl-0001dy-HV
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 07:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601552425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZlu7bQzZ3LoLgo8WCkftHEb1xqFfc85tB6OenLkN+4=;
 b=dTK8szT1sEidsHLoFoxodxHYKX8Qx3Xp/XjPXMiIuBzrsdUlm+CjtLBojeDcd0iw6J/Rj2
 QYaD4sNlIH7HySkshgRYz1ZRdhqIBsIPC7HR4Rg/9FYn2D2TGeC5dUJITLKQVQKPwVpPk5
 liu4fnaWDl/8MU1pZxR0uJCPORB63tY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Z4UdK55ZMqm5Tf0XI8ZCzA-1; Thu, 01 Oct 2020 07:40:23 -0400
X-MC-Unique: Z4UdK55ZMqm5Tf0XI8ZCzA-1
Received: by mail-wm1-f69.google.com with SMTP id y18so810427wma.4
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 04:40:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tZlu7bQzZ3LoLgo8WCkftHEb1xqFfc85tB6OenLkN+4=;
 b=JRVjXbJqLtGrWc++MLhmSYvQrl579dANx52t+ezFsuw8dDIwUb6tmGPdWmykvu+gGi
 lR43UZ7rgP5lwnSXj2Kz4cp+tZC5x34ueDLn5eXB4PnbkFZ2TYcNwfkJ4KmhApecMty7
 aKCEQbqzZ175Wksv8Ng0QuExoGHMZMw61js0o99Th/eR2V2EPztspL5teWPY03yLzzxo
 n4FeLsd0ZhlvLQU+OnjeahgFipTuw6jJtzaxP+iGd4Gzxl1RDy1qT03vFXcWzonLf4v9
 MzC9p7lhAdpRR0zO9h4B1i1bce1KJqiUegZlW8H3yXnIsmyUkmcwu99GbuJUDxUaJofC
 0+Wg==
X-Gm-Message-State: AOAM533T4nk1seNTdOuaZ2n9cZ1I9l8PAoI0i/28LJTxfFC05bBJdHEV
 7iCkGv43Pmkq0AZBuiEPYeYhERCFZDfu5IEDgDcWOkchoaTmde3fjdjDQgdHLlnyQcvOD0boFYS
 8bp8aATm9hM3V1Tc=
X-Received: by 2002:a1c:750d:: with SMTP id o13mr8523380wmc.54.1601552422536; 
 Thu, 01 Oct 2020 04:40:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIDdcam9O99AUxhHgxZvnnD9/dE7XU6er+p8jyR6dfoCYpR491xTLZNge+11OsERRWPTgKXg==
X-Received: by 2002:a1c:750d:: with SMTP id o13mr8523363wmc.54.1601552422309; 
 Thu, 01 Oct 2020 04:40:22 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id a81sm8857273wmf.32.2020.10.01.04.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:40:21 -0700 (PDT)
Date: Thu, 1 Oct 2020 07:40:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [RFC PATCH v3 0/7] Use ACPI PCI hot-plug for Q35
Message-ID: <20201001073823-mutt-send-email-mst@kernel.org>
References: <20200924070013.165026-1-jusual@redhat.com>
 <20200924050236-mutt-send-email-mst@kernel.org>
 <CAMDeoFU_ZO7UxQsz-tvA6WsFm2qK755W5guGoVHfVs55Gb7aUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMDeoFU_ZO7UxQsz-tvA6WsFm2qK755W5guGoVHfVs55Gb7aUg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 01, 2020 at 10:55:35AM +0200, Julia Suvorova wrote:
> On Thu, Sep 24, 2020 at 11:20 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Sep 24, 2020 at 09:00:06AM +0200, Julia Suvorova wrote:
> > > The patch set consists of two parts:
> > > patches 1-4: introduce new feature
> > >              'acpi-pci-hotplug-with-bridge-support' on Q35
> > > patches 5-7: make the feature default along with changes in ACPI tables
> > >
> > > This way maintainers can decide which way to choose without breaking
> > > the patch set.
> > >
> > > With the feature disabled Q35 falls back to the native hot-plug.
> > >
> > > Pros
> > >     * no racy behavior during boot (see 110c477c2ed)
> > >     * eject is possible - according to PCIe spec, attention button
> > >       press should lead to power off, and then the adapter should be
> > >       removed manually. As there is no power down state exists in QEMU,
> > >       we cannot distinguish between an eject and a power down
> > >       request.
> > >     * no delay during deleting - after the actual power off software
> > >       must wait at least 1 second before indicating about it. This case
> > >       is quite important for users, it even has its own bug:
> > >           https://bugzilla.redhat.com/show_bug.cgi?id=1594168
> > >     * no timer-based behavior - in addition to the previous example,
> > >       the attention button has a 5-second waiting period, during which
> > >       the operation can be canceled with a second press. While this
> > >       looks fine for manual button control, automation will result in
> > >       the need to queue or drop events, and the software receiving
> > >       events in all sort of unspecified combinations of attention/power
> > >       indicator states, which is racy and uppredictable.
> > >     * fixes:
> > >         * https://bugzilla.redhat.com/show_bug.cgi?id=1752465
> > >         * https://bugzilla.redhat.com/show_bug.cgi?id=1690256
> > >
> > > Cons:
> > >     * lose per-port control over hot-plug (can be resolved)
> > >     * no access to possible features presented in slot capabilities
> > >       (this is only surprise removal AFAIK)
> >
> > something I don't quite get is whether with this one can still add
> > new pcie bridges and then hotplug into these with native
> > hotplug.
> 
> Right now I disable native if there is acpihp anywhere, but even if
> you enable it for hotplugged devices, native hot-plug will not work.

So that's a minor regression in functionality, right?
Why is that the case? Because you disable it in ACPI?
What if we don't?

> > the challenge to answering this with certainty is that right now qemu
> > does not allow hotplugging complex devices such as bridges at all,
> > we only have a hack for multifunction devices.
> > Maybe adding a bridge as function 1 on command line, then hotplugging another device as
> > function 0 will work to test this.
> >
> >
> >
> > > v3:
> > >     * drop change of _OSC to allow SHPC on hotplugged bridges
> > >     * use 'acpi-root-pci-hotplug'
> > >     * add migration states [Igor]
> > >     * minor style changes
> > >
> > > v2:
> > >     * new ioport range for acpiphp [Gerd]
> > >     * drop find_pci_host() [Igor]
> > >     * explain magic numbers in _OSC [Igor]
> > >     * drop build_q35_pci_hotplug() wrapper [Igor]
> > >
> > > Julia Suvorova (7):
> > >   hw/acpi/pcihp: Enhance acpi_pcihp_disable_root_bus() to support Q35
> > >   hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35
> > >   hw/pci/pcie: Do not initialize slot capability if acpihp is used
> > >   hw/acpi/ich9: Enable ACPI PCI hot-plug
> > >   bios-tables-test: Allow changes in DSDT ACPI tables
> > >   hw/acpi/ich9: Set ACPI PCI hot-plug as default
> > >   bios-tables-test: Update golden binaries
> > >
> > >  hw/i386/acpi-build.h              |   7 ++++
> > >  include/hw/acpi/ich9.h            |   5 +++
> > >  include/hw/acpi/pcihp.h           |   3 +-
> > >  hw/acpi/ich9.c                    |  67 ++++++++++++++++++++++++++++++
> > >  hw/acpi/pcihp.c                   |  16 ++++---
> > >  hw/acpi/piix4.c                   |   4 +-
> > >  hw/i386/acpi-build.c              |  31 ++++++++------
> > >  hw/i386/pc.c                      |   1 +
> > >  hw/pci/pcie.c                     |  16 +++++++
> > >  tests/data/acpi/q35/DSDT          | Bin 7678 -> 7950 bytes
> > >  tests/data/acpi/q35/DSDT.acpihmat | Bin 9002 -> 9274 bytes
> > >  tests/data/acpi/q35/DSDT.bridge   | Bin 7695 -> 9865 bytes
> > >  tests/data/acpi/q35/DSDT.cphp     | Bin 8141 -> 8413 bytes
> > >  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9331 -> 9603 bytes
> > >  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7753 -> 8025 bytes
> > >  tests/data/acpi/q35/DSDT.memhp    | Bin 9037 -> 9309 bytes
> > >  tests/data/acpi/q35/DSDT.mmio64   | Bin 8808 -> 9080 bytes
> > >  tests/data/acpi/q35/DSDT.numamem  | Bin 7684 -> 7956 bytes
> > >  tests/data/acpi/q35/DSDT.tis      | Bin 8283 -> 8555 bytes
> > >  19 files changed, 129 insertions(+), 21 deletions(-)
> > >
> > > --
> > > 2.25.4
> >


