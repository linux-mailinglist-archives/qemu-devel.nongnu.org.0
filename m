Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 412712754DB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 11:54:40 +0200 (CEST)
Received: from localhost ([::1]:49418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL1Tz-0006wK-7C
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 05:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kL1OZ-0001ZN-Ko
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 05:49:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kL1OW-0007l5-OH
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 05:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600854540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKT+L/Zr+yIIc+Zakvjh3RfWY9YBrtyINgnWSr0vuRA=;
 b=I09F9yhqRVlUIMV5bnSK1XGfCBahOYeaO4uC+e9thvmaZ9AjRBtZwUxtrOACjHZ6CxH5hi
 DDgFEcFd8eQVmfQoqNFLZZRqciozriet2k2kGFd6pJCYMjIGPybbveFoDgBo6XJTmMuask
 Mf9Ld4zGMqcCGoZl0TFztcv3oZsqiAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-oXyTgjyAO-KiGR9n3r8HQw-1; Wed, 23 Sep 2020 05:48:58 -0400
X-MC-Unique: oXyTgjyAO-KiGR9n3r8HQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5822381F002;
 Wed, 23 Sep 2020 09:48:57 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 317FC60BF1;
 Wed, 23 Sep 2020 09:48:53 +0000 (UTC)
Date: Wed, 23 Sep 2020 11:48:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5 00/10] x86: fix cpu hotplug with secure boot
Message-ID: <20200923114851.0df4fc2c@redhat.com>
In-Reply-To: <20200921083322-mutt-send-email-mst@kernel.org>
References: <20200907112348.530921-1-imammedo@redhat.com>
 <20200921134601.55d12fdc@redhat.com>
 <20200921083322-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: boris.ostrovsky@oracle.com, lersek@redhat.com, qemu-devel@nongnu.org,
 aaron.young@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Sep 2020 08:34:31 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Sep 21, 2020 at 01:46:01PM +0200, Igor Mammedov wrote:
> > On Mon,  7 Sep 2020 07:23:38 -0400
> > Igor Mammedov <imammedo@redhat.com> wrote:
> >   
> > > v5:
> > >   - fix hotplug on Windows when there is more than 256 possible CPUs
> > >     (Windows isn't able to handle VarPackage over 255 elements
> > >      so process CPUs in batches)
> > >   - fix off-by-one in package length (Laszlo)
> > >   - fix not selecting CPU before clearing insert event (Laszlo)
> > >   - use aml_lgreater() instead of aml_lnot(aml_equal(num_added_cpus, zero) (Laszlo)
> > >   - split 'x68: acpi: trigger SMI before sending hotplug Notify event to OSPM'
> > >     in samller chunks (Laszlo)
> > >   - fix comment to match spec (Laszlo)
> > >   - reorder aml_lor() and aml_land() in header (Laszlo)
> > > v4:
> > >   - fix 5.2 machine types so they won't apply pc_compat_5_1 (Laszlo)
> > > v3:
> > >   - rebase on top of "[PATCH v2] hw: add compat machines for 5.2"
> > >     so apply that before this patch
> > > v2:
> > >   - AML: clean is_inserted flag only after SMI callback
> > >   - make x-smi-cpu-hotunplug false by default
> > >   - massage error hint on not supported unplug
> > > v1:
> > >   - fix typos and some phrases (Laszlo)
> > >   - add unplug check (Laszlo)
> > >   - redo AML scan logic to avoid race when adding multiple CPUs  
> > 
> > Michael,
> > 
> > just saw your pull request which missed this series.
> > Is there any plans to queue it for the next pull request?  
> 
> Oh.
> You didn't Cc me on most patches so I assumed this is targeting some other tree.
> Sorry.
> Will review and queue, thanks.
Thanks,

Series doesn't apply anymore,
I've rebased fixing conflicts and resent it as v6.

> 
> > 
> >   
> > > CPU hotplug with Secure Boot was not really supported and firmware wasn't aware
> > > of hotplugged CPUs (which might lead to guest crashes). During 4.2 we introduced
> > > locked SMI handler RAM arrea to make sure that guest OS wasn't able to inject
> > > its own SMI handler and OVMF added initial CPU hotplug support.
> > > 
> > > This series is QEMU part of that support which lets QMVF tell QEMU that
> > > CPU hotplug with SMI broadcast enabled is supported so that QEMU would be able
> > > to prevent hotplug in case it's not supported and trigger SMI on hotplug when
> > > it's necessary.
> > > 
> > > Igor Mammedov (10):
> > >   x86: lpc9: let firmware negotiate 'CPU hotplug with SMI' features
> > >   x86: cpuhp: prevent guest crash on CPU hotplug when broadcast SMI is
> > >     in use
> > >   x86: cpuhp: refuse cpu hot-unplug request earlier if not supported
> > >   acpi: add aml_land() and aml_break() primitives
> > >   tests: acpi: mark to be changed tables in
> > >     bios-tables-test-allowed-diff
> > >   x86: ich9: expose "smi_negotiated_features" as a QOM property
> > >   x86: acpi: introduce AcpiPmInfo::smi_on_cpuhp
> > >   x86: acpi: introduce the PCI0.SMI0 ACPI device
> > >   x68: acpi: trigger SMI before sending hotplug Notify event to OSPM
> > >   tests: acpi: update acpi blobs with new AML
> > > 
> > >  include/hw/acpi/aml-build.h       |   2 +
> > >  include/hw/acpi/cpu.h             |   1 +
> > >  include/hw/i386/ich9.h            |   4 +
> > >  hw/acpi/aml-build.c               |  16 +++
> > >  hw/acpi/cpu.c                     | 156 ++++++++++++++++++++++++------
> > >  hw/acpi/ich9.c                    |  24 ++++-
> > >  hw/i386/acpi-build.c              |  35 ++++++-
> > >  hw/i386/pc.c                      |  15 ++-
> > >  hw/isa/lpc_ich9.c                 |  16 +++
> > >  tests/data/acpi/pc/DSDT           | Bin 4934 -> 5060 bytes
> > >  tests/data/acpi/pc/DSDT.acpihmat  | Bin 6258 -> 6385 bytes
> > >  tests/data/acpi/pc/DSDT.bridge    | Bin 6793 -> 6919 bytes
> > >  tests/data/acpi/pc/DSDT.cphp      | Bin 5397 -> 5524 bytes
> > >  tests/data/acpi/pc/DSDT.dimmpxm   | Bin 6587 -> 6714 bytes
> > >  tests/data/acpi/pc/DSDT.ipmikcs   | Bin 5006 -> 5132 bytes
> > >  tests/data/acpi/pc/DSDT.memhp     | Bin 6293 -> 6419 bytes
> > >  tests/data/acpi/pc/DSDT.numamem   | Bin 4940 -> 5066 bytes
> > >  tests/data/acpi/q35/DSDT          | Bin 7678 -> 7804 bytes
> > >  tests/data/acpi/q35/DSDT.acpihmat | Bin 9002 -> 9129 bytes
> > >  tests/data/acpi/q35/DSDT.bridge   | Bin 7695 -> 7821 bytes
> > >  tests/data/acpi/q35/DSDT.cphp     | Bin 8141 -> 8268 bytes
> > >  tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9331 -> 9458 bytes
> > >  tests/data/acpi/q35/DSDT.ipmibt   | Bin 7753 -> 7879 bytes
> > >  tests/data/acpi/q35/DSDT.memhp    | Bin 9037 -> 9163 bytes
> > >  tests/data/acpi/q35/DSDT.mmio64   | Bin 8808 -> 8934 bytes
> > >  tests/data/acpi/q35/DSDT.numamem  | Bin 7684 -> 7810 bytes
> > >  tests/data/acpi/q35/DSDT.tis      | Bin 8283 -> 8409 bytes
> > >  27 files changed, 239 insertions(+), 30 deletions(-)
> > >   
> 
> 


