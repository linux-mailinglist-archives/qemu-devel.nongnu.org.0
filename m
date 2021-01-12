Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7502F37B7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:54:53 +0100 (CET)
Received: from localhost ([::1]:35786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNsa-0007Im-8w
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kzNqU-0005Vl-Hg
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:52:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kzNqR-0001WC-Qd
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610473958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIRfNkMwFgURg2mDdarqKIx+HPw4cJLLKRfFVNoTjdc=;
 b=bY9jBKE1ZKEhhRxUxKcYBRIGcYhFe5FLMoFJwHCkOL6VC5FmqL7a2GeQJlZTuzPp9EL9Y2
 QlBRcyHYMtVd1LFCoOQQJyROk0QVukZ3cLmqD9HdSiiLA53WXKCnzNC0pdSdPwUkgO97hb
 wXN7HqkHqtUJgVZ+98IXHBP1VRXPos8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-Aa0OHnUQMoKif3DnywE0fg-1; Tue, 12 Jan 2021 12:52:37 -0500
X-MC-Unique: Aa0OHnUQMoKif3DnywE0fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5C4107ACF7;
 Tue, 12 Jan 2021 17:52:35 +0000 (UTC)
Received: from localhost (unknown [10.40.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7C9A1975E;
 Tue, 12 Jan 2021 17:52:29 +0000 (UTC)
Date: Tue, 12 Jan 2021 18:52:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 0/8] acpi: Some fixes for pxb support for ARM virt
 machine
Message-ID: <20210112185228.70b3e91b@redhat.com>
In-Reply-To: <20210112053711-mutt-send-email-mst@kernel.org>
References: <20210107114043.9624-1-cenjiahui@huawei.com>
 <18883fc1-5fc6-1c9e-b9d8-475809c9c1de@huawei.com>
 <20210112053711-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ard.biesheuvel@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Jan 2021 05:37:29 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> Looks good to me. Igor, want to ack before I apply this?

Looks good to me too, so

Acked-by: Igor Mammedov <imammedo@redhat.com>

> 
> On Tue, Jan 12, 2021 at 06:19:03PM +0800, Jiahui Cen wrote:
> > Kindly ping...
> > 
> > Thanks,
> > Jiahui
> > 
> > On 2021/1/7 19:40, Jiahui Cen wrote:  
> > > This patch series adds some fixes for ARM virt machine pxb support.
> > > 1. Pass addr offset for IO, MMIO and bus number when builing crs, because
> > > the addr_trans is needed to describe an addr resource. [1]
> > > 2. Inform guest os not to ignore the resource map generated by firmware as
> > > the x86 default way. [2]
> > > 3. Enable pxb for ARM virt machine by default.
> > > 4. Update expected DSDT files with the above changes and enable the pxb
> > > unit-test.
> > > 
> > > v3->v4:
> > > * Separate the patch of ordering root buses for further discussion. [3]
> > > 
> > > v2->v3:
> > > * Reorder the root bridges.
> > > * Exclude resources of extra root bridges from main root bridge's _CRS.
> > > 
> > > v1->v2:
> > > * Update expected DSDT files.
> > > * Quote PCI Firmware spec as comments.
> > > 
> > > [1]: https://lore.kernel.org/qemu-devel/20201217132747.4744-1-cenjiahui@huawei.com/
> > > [2]: https://lore.kernel.org/qemu-devel/20201217132926.4812-1-cenjiahui@huawei.com/
> > > [3]: https://lore.kernel.org/qemu-devel/dca69f55-dfd1-3f97-dc3f-13eeedec5027@huawei.com/
> > > 
> > > Jiahui Cen (8):
> > >   acpi: Allow DSDT acpi table changes
> > >   acpi: Fix unmatched expected DSDT.pxb file
> > >   acpi: Add addr offset in build_crs
> > >   acpi/gpex: Inform os to keep firmware resource map
> > >   acpi/gpex: Exclude pxb's resources from PCI0
> > >   Kconfig: Compile PXB for ARM_VIRT
> > >   acpi: Enable pxb unit-test for ARM virt machine
> > >   acpi: Update _DSM method in expected files
> > > 
> > >  hw/acpi/aml-build.c               |  18 ++--
> > >  hw/i386/acpi-build.c              |   3 +-
> > >  hw/pci-bridge/Kconfig             |   2 +-
> > >  hw/pci-host/gpex-acpi.c           |  87 ++++++++++++++------
> > >  include/hw/acpi/aml-build.h       |   4 +-
> > >  tests/data/acpi/microvm/DSDT.pcie | Bin 3023 -> 3031 bytes
> > >  tests/data/acpi/virt/DSDT         | Bin 5196 -> 5204 bytes
> > >  tests/data/acpi/virt/DSDT.memhp   | Bin 6557 -> 6565 bytes
> > >  tests/data/acpi/virt/DSDT.numamem | Bin 5196 -> 5204 bytes
> > >  tests/data/acpi/virt/DSDT.pxb     | Bin 7802 -> 7689 bytes
> > >  tests/qtest/bios-tables-test.c    |   4 -
> > >  11 files changed, 79 insertions(+), 39 deletions(-)
> > >   
> 
> 


