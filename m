Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3D4FD27B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 09:14:42 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neAjZ-0006Td-Cp
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 03:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1neAgc-0005at-N2
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 03:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1neAgX-0004jJ-BK
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 03:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649747492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPfCqsxIQP3qzxnT95iUuOGCJ5iNShe5xeLHKq+NWEg=;
 b=Ud/nDpN5XEInjz5hbEC7qYB4ukwtxm3eJNxDCYvvYt/Y9M1oiIVlrvHyuMoP/M5XAG3HBk
 J+7sVG3Yhj8iSMdzZhF2bLF3YEpo4ZT0ijQfOBxlg8wyidIdeGLO/OucOr4NmKxGYooRG2
 JTigsFZAHye8cqsWv3idf5rzCjcgB1Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-4jfLmcQIPmOvc-6e18Gk1g-1; Tue, 12 Apr 2022 03:11:30 -0400
X-MC-Unique: 4jfLmcQIPmOvc-6e18Gk1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 h18-20020a05600c351200b0038e82e6321bso5580109wmq.5
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 00:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xPfCqsxIQP3qzxnT95iUuOGCJ5iNShe5xeLHKq+NWEg=;
 b=sOc2QY3bN09r8ArJC6YC878CjOamQjHukuMGep1Nd76aGBdeK2dVkMuoBmN4Wjw9XX
 lCJBs0uVme7HPFvkAwzYM0c69WdoJoIcD4huNPpBO9hm5ytdgyQXhnZrb/V70jHOJsA7
 EbfnIupdhzCD1FciLw8+qVaAhvye75vzKi18Kh/cZvkKwnhJTIl/Xs2JbEzpH/Fnj2nG
 vAOcD2DNZs20lwrQjlckfFOodBAVuJo1ltzSbZIYdrj6NqZC4hRDTvWrxMuvTfd9WlGc
 3BmSlYi674gbzcmzY9dZdOkxD1fd5TNsnimFJ85/+0LiA2SGHDOGUGLiLyAPlb8QvlRd
 C9MQ==
X-Gm-Message-State: AOAM530UW5ZSmrptodgXvdRGOjn3XNLUcIoDlaiblbf6SdC8BaEuE/84
 2EKfr/3D1id9kHa22CyM0wz0FfZSzg3yc6FiIf49ZERZTi7d11bv42xzRYsBWMFGNnNhVBeOWPd
 3GThY23SKniM76mI=
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr2636407wmk.109.1649747489426; 
 Tue, 12 Apr 2022 00:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTu4iU3s4HsUYjfQVNAD1CqTQImT9jSxtUyZGbaailak+tpi0Sq1hkqjpoT44iOTzp5w5npg==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr2636381wmk.109.1649747489011; 
 Tue, 12 Apr 2022 00:11:29 -0700 (PDT)
Received: from redhat.com ([2.52.1.156]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d6d0e000000b002078ea4f6bdsm13309812wrq.75.2022.04.12.00.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 00:11:28 -0700 (PDT)
Date: Tue, 12 Apr 2022 03:11:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
Message-ID: <20220412030753-mutt-send-email-mst@kernel.org>
References: <20220308164553.2312425-1-ani@anisinha.ca>
 <20220308114800-mutt-send-email-mst@kernel.org>
 <CAARzgwxj_7iMnhR04U9K9Dj+NTqK9G88wmbEnBeM44c0XnTxTA@mail.gmail.com>
 <CAARzgwyTZB6ktqadbsHwxCaseFsP6h5T9H91vWt4UzKBWj2+uQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAARzgwyTZB6ktqadbsHwxCaseFsP6h5T9H91vWt4UzKBWj2+uQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: libvir-list@redhat.com, imammedo@redhat.com, jusual@redhat.com,
 qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 12, 2022 at 09:52:26AM +0530, Ani Sinha wrote:
> On Tue, Apr 12, 2022 at 9:50 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Tue, Mar 8, 2022 at 10:28 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Mar 08, 2022 at 10:15:49PM +0530, Ani Sinha wrote:
> > > >
> > > > Change log:
> > > > v2: rebased the patchset. Laine's response is appended at the end.
> > > >
> > > > I am re-introducing the patchset for <acpi-hotplug-bridge> which got
> > > > reverted here few months back:
> > > >
> > > > https://www.spinics.net/linux/fedora/libvir/msg224089.html
> > > >
> > > > The reason for the reversal was that there seemed to be some
> > > > instability/issues around the use of the qemu commandline which this
> > > > patchset tries to support. In particular, some guest operating systems
> > > > did not like the way QEMU was trying to disable native hotplug on pcie
> > > > root ports. Subsequently, in QEMU 6.2, we have changed our mechanism
> > > > using which we disable native hotplug. As I understand, we do not have
> > > > any reported issues so far in 6.2 around this area. QEMU will enter a
> > > > soft feature freeze in the first week of march in prep for 7.0 release.
> > >
> > > Right. But unfortunately we did not yet really work on
> > > a sane interface for this.
> > >
> > > The way I see it, at high level we thinkably need two flags
> > > - disable ACPI hotplug
> > > - enable native hotplug (maybe separately for pci and pcie?)

I still think this is the case.

> > pci does not have native hotplug. so this would be applicable only for
> > q35. For i440fx we have two separate flags already to disable acpi
> > hotplug, one for root bus and another for bridges.
> >
> > >
> > > and with both enabled guests actually can switch between
> > > the two.
> > >
> > > This will at least reflect the hardware, so has a chance to be
> > > stable.
> > >
> > > The big question however would be what is the actual use-case.
> > > Without that this begs the question of why do we bother at all.
> >
> > To me the main motivation is as I have described here:
> > https://listman.redhat.com/archives/libvir-list/2021-October/msg00068.html
> >
> > One concrete example of why one might still want to use native hotplug with
> > pcie-root-port controller is the fact that we are still discovering issues with
> > acpi hotplug on PCIE. One such issue is:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02146.html

This one was fixed, right?


> > Another reason is that users have been using native hotplug on pcie root ports
> > up until now. They have built and tested their systems based on native hotplug.
> > They may not want to suddenly move to acpi based hotplug just because it is now
> > the default in qemu. Supporting the option to chose one or the other through
> > libvirt makes things simpler for end users.
> 
> Essentially what I do not like is that we are imposing acpi hotplug on
> q35 for the entire community without giving them a choice to revert
> back to native hotplug though libvirt.

The reason qemu did it is because it was expected it's more or less
transparent. Barring bugs bug hey, there's always bugs with any change.

> >
> > > To allow hotplug of bridges? If it is really necessary for us then
> > > we should think hard about questions that surround this:
> > >
> > > - how does one hotplug a pcie switch?
> > > - any way to use e.g. dynamic ACPI to support hotplug of bridges?
> > > - do we want to bite the bullet and create an option for management
> > >   to fully control guest memory layout including all pci devices?
> > >
> > >
> > >
> > > > Libvirt is also entering a new release cycle phaze. Hence, I am
> > > > introducing this patchset early enough in the release cycles so that if
> > > > we do see any issues on the qemu side during the rc0, rc1 cycles and if
> > > > reversal of this patchset is again required, it can be done in time
> > > > before the next libvirt release end of March.
> > > >
> > > > All the patches in this series had been previously reviewed. Some
> > > > subsequent fixes were made after my initial patches were pushed. I have
> > > > squashed all those fixes and consolidated them into four patches. I have
> > > > also updated the documentation to reflect the new changes from the QEMU
> > > > side and rebased my changes fixing the tests in the process.
> > > >
> > > > What changed in QEMU post version 6.1 ?
> > > > =========================================
> > > >
> > > > We have made basically two major changes in QEMU. First is this change:
> > > >
> > > > (1) commit 211afe5c69b597acf85fdd577eb497f5be1ffbd8
> > > > Author: Julia Suvorova <jusual@redhat.com>
> > > > Date:   Fri Nov 12 06:08:56 2021 -0500
> > > >
> > > >     hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC
> > > >
> > > >     There are two ways to enable ACPI PCI Hot-plug:
> > > >
> > > >             * Disable the Hot-plug Capable bit on PCIe slots.
> > > >
> > > >     This was the first approach which led to regression [1-2], as
> > > >     I/O space for a port is allocated only when it is hot-pluggable,
> > > >     which is determined by HPC bit.
> > > >
> > > >             * Leave the HPC bit on and disable PCIe Native Hot-plug in _OSC
> > > >               method.
> > > >
> > > >     This removes the (future) ability of hot-plugging switches with PCIe
> > > >     Native hotplug since ACPI PCI Hot-plug only works with cold-plugged
> > > >     bridges. If the user wants to explicitely use this feature, they can
> > > >     disable ACPI PCI Hot-plug with:
> > > >             --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> > > >
> > > >     Change the bit in _OSC method so that the OS selects ACPI PCI Hot-plug
> > > >     instead of PCIe Native.
> > > >
> > > >     [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> > > >     [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> > > >
> > > >     Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > >     Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > >     Message-Id: <20211112110857.3116853-5-imammedo@redhat.com>
> > > >     Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > > >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > >
> > > > The patch description says it all. Instead of masking out the HPC bit in
> > > > pcie slots, we keep them turned on. Instead, we do not advertize native
> > > > hotplug capability for PCIE using _OSC control method. See section
> > > > 6.2.11 in ACPI spec 6.2. At the same time, we turn on ACPI hotplug for
> > > > these slots so now the guest OS can select ACPI hotplug instead.
> > > >
> > > > The second change is introduction of a property with which we keep the
> > > > existing behavior for pc-q35-6.1 machines. This means HPC bit is masked
> > > > and ACPI hotplug is enabled by default for pcie root ports.
> > > > The QEMU commit is:
> > > >
> > > > (2) commit c318bef76206c2ecb6016e8e68c4ac6ff9a4c8cb
> > > > Author: Julia Suvorova <jusual@redhat.com>
> > > > Date:   Fri Nov 12 06:08:54 2021 -0500
> > > >
> > > >     hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine type
> > > >
> > > >     To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
> > > >     turned on, while the switch to ACPI Hot-plug will be done in the
> > > >     DSDT table.
> > > >
> > > >     Introducing 'x-keep-native-hpc' property disables the HPC bit only
> > > >     in 6.1 and as a result keeps the forced 'reserve-io' on
> > > >     pcie-root-ports in 6.1 too.
> > > >
> > > >     [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> > > >     [2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409
> > > >
> > > >     Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > >     Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > >     Message-Id: <20211112110857.3116853-3-imammedo@redhat.com>
> > > >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > > Lastly, as a related side note, because from QEMU 6.2 onwards, we do not
> > > > mask out HPC bit in PCIE, the work done by this patch is no longer
> > > > needed:
> > > >
> > > > (3) commit e2a6290aab578b2170c1f5909fa556385dc0d820
> > > > Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > > Date:   Mon Aug 2 12:00:57 2021 +0300
> > > >
> > > >     hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
> > > >
> > > >     Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> > > >     As opposed to native PCIe hotplug, guests like Fedora 34
> > > >     will not assign IO range to pcie-root-ports not supporting
> > > >     native hotplug, resulting into a regression.
> > > >
> > > >     Reproduce by:
> > > >         qemu-bin -M q35 -device pcie-root-port,id=p1 -monitor stdio
> > > >         device_add e1000,bus=p1
> > > >     In the Guest OS the respective pcie-root-port will have the IO range
> > > >     disabled.
> > > >
> > > >     Fix it by setting the "reserve-io" hint capability of the
> > > >     pcie-root-ports so the firmware will allocate the IO range instead.
> > > >
> > > >     Acked-by: Igor Mammedov <imammedo@redhat.com>
> > > >     Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> > > >     Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> > > >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > >
> > > >
> > > > This is what commit (2) alludes to. In pc-q35-6.1 machines we do need
> > > > patch (3) since we mask out HPC bit from pcie ports.
> > > >
> > > >
> > > > I know this is convoluted mess. In fairness I am trying all I can in my
> > > > spare time to help from the QEMU side. I am determined to see this
> > > > patchset through into libvirt.
> > > >
> > > > Thanks
> > > >
> > > > Laine's comments ...
> > > >
> > > > My memory isn't completely clear, but I think there was also the issue
> > > > that the option claims to enable ACPI hotplug when set to on, but
> > > > instead what it actually does (in the Q35 case at least) is to enable
> > > > native PCI hotplug when set to off (without actually disabling ACPI
> > > > hotplug) and disable native PCI hotplug when set to on, or something
> > > > like that. This ends up leaving it up to the guest OS to decide which
> > > > type of hotplug to use, meaning its decision could override what's in
> > > > the libvirt config, thus confusing everyone. Again, I probably have the
> > > > details mixed up, but it was something like this.
> > > >
> > > > I asked mst about this this morning, and he suggested something that
> > > > you've already done - Cc'ing the series to qemu-devel and the relevant
> > > > maintainers so we can have a discussion with all involved parties about
> > > > their opinions on whether we really should expose this existing option
> > > > in libvirt, or if we should instead have two new options that are more
> > > > orthogonal about enabling/disabling the two types of hotplug, so that
> > > > libvirt config can more accurately represent what is being presented to
> > > > the guest rather than a "best guess" of what we think the guest is going
> > > > to do with what is presented.
> > > >
> > > > (Michael did also say that, with the current flurry of bug reports for
> > > > the QEMU rc's, this discusion may not happen until closer to release
> > > > when the bug reports die down. I know this doesn't mesh with your desire
> > > > to "push now to allow for testing" (which in general would be a good
> > > > thing if we were certain that we wanted the option like this and were
> > > > just expecting some minor bugs that could be fixed), but my opinion is
> > > > that 1) it's possible for anyone interested to test the functionality
> > > > using <qemu:commandline>, and 2) we should avoid turning libvirt git
> > > > into a revolving door of experiments. The only practical difference
> > > > between using <qemu:commandline> and having a dedicated option is that
> > > > the use of <qemu:commandline> causes the domain to be tainted, and the
> > > > XML is a bit more complicated. But since the people we're talking about
> > > > here will already have built their own libvirt binaries, the tainted
> > > > status of any guests is irrelevant and the extra complexity of using
> > > > <qemu:commandline> is probably trivial to them :-).
> > > >
> > > >
> > > > Ani Sinha (4):
> > > >   qemu: capablities: detect acpi-pci-hotplug-with-bridge-support
> > > >   conf: introduce support for acpi-bridge-hotplug feature
> > > >   qemu: command: add support for acpi-bridge-hotplug feature
> > > >   NEWS: document new acpi pci hotplug config option
> > > >
> > > >  NEWS.rst                                      |  8 ++
> > > >  docs/formatdomain.rst                         | 32 +++++++
> > > >  docs/schemas/domaincommon.rng                 | 15 ++++
> > > >  src/conf/domain_conf.c                        | 89 ++++++++++++++++++-
> > > >  src/conf/domain_conf.h                        |  9 ++
> > > >  src/qemu/qemu_capabilities.c                  |  4 +
> > > >  src/qemu/qemu_capabilities.h                  |  3 +
> > > >  src/qemu/qemu_command.c                       | 19 ++++
> > > >  src/qemu/qemu_validate.c                      | 42 +++++++++
> > > >  .../caps_6.1.0.x86_64.xml                     |  1 +
> > > >  .../caps_6.2.0.x86_64.xml                     |  1 +
> > > >  .../caps_7.0.0.x86_64.xml                     |  1 +
> > > >  ...-hotplug-bridge-disable.aarch64-latest.err |  1 +
> > > >  .../aarch64-acpi-hotplug-bridge-disable.xml   | 13 +++
> > > >  ...-hotplug-bridge-disable.x86_64-latest.args | 35 ++++++++
> > > >  .../pc-i440fx-acpi-hotplug-bridge-disable.xml | 36 ++++++++
> > > >  .../pc-i440fx-acpi-hotplug-bridge-enable.xml  | 36 ++++++++
> > > >  ...pi-hotplug-bridge-disable.x86_64-6.0.0.err |  1 +
> > > >  ...-hotplug-bridge-disable.x86_64-latest.args | 38 ++++++++
> > > >  .../q35-acpi-hotplug-bridge-disable.xml       | 53 +++++++++++
> > > >  .../q35-acpi-hotplug-bridge-enable.xml        | 53 +++++++++++
> > > >  tests/qemuxml2argvtest.c                      |  7 ++
> > > >  ...i-hotplug-bridge-disable.x86_64-latest.xml |  1 +
> > > >  ...pi-hotplug-bridge-enable.x86_64-latest.xml |  1 +
> > > >  ...i-hotplug-bridge-disable.x86_64-latest.xml |  1 +
> > > >  ...pi-hotplug-bridge-enable.x86_64-latest.xml |  1 +
> > > >  tests/qemuxml2xmltest.c                       |  4 +
> > > >  27 files changed, 504 insertions(+), 1 deletion(-)
> > > >  create mode 100644 tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.aarch64-latest.err
> > > >  create mode 100644 tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.xml
> > > >  create mode 100644 tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.args
> > > >  create mode 100644 tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml
> > > >  create mode 100644 tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml
> > > >  create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-6.0.0.err
> > > >  create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.args
> > > >  create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml
> > > >  create mode 100644 tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml
> > > >  create mode 120000 tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-latest.xml
> > > >  create mode 120000 tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-enable.x86_64-latest.xml
> > > >  create mode 120000 tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.xml
> > > >  create mode 120000 tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-enable.x86_64-latest.xml
> > > >
> > > > --
> > > > 2.25.1
> > >


