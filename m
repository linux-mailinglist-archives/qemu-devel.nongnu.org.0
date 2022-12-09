Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168DB6482B0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3d8h-0005Mp-5r; Fri, 09 Dec 2022 08:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3d8I-0005Gs-EM
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3d8G-0005WC-ES
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:09:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670591379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BSLxPSLlm3izB0015zagdziLBWfLAbxEABxPbQTzWc=;
 b=UtCMh2JN/cHh6K3WbaQqa07/NUKnJUH14rOv06lkYbOqHH9qmSRH4xpG3ekGGurSFtaYS8
 KKDCl3aNHL7uV9KOqe+Ij7QRyKUM1TUSh4EGtK7UjDxWi8OwIjF2j3ZU8iTEKpMTx64TvK
 d2qw1Ga0qtBIJgxrhIecwqdxkD97z+s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-CuPxikanP6CuEz3PuPeNYA-1; Fri, 09 Dec 2022 08:09:38 -0500
X-MC-Unique: CuPxikanP6CuEz3PuPeNYA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DC8238149B3
 for <qemu-devel@nongnu.org>; Fri,  9 Dec 2022 13:09:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EFEA49BB60;
 Fri,  9 Dec 2022 13:09:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E6FF21E6921; Fri,  9 Dec 2022 14:09:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel@redhat.com>
Subject: Re: How to best make include/hw/pci/pcie_sriov.h self-contained
References: <87bkofivbm.fsf@pond.sub.org>
 <20221207020305-mutt-send-email-mst@kernel.org>
Date: Fri, 09 Dec 2022 14:09:35 +0100
In-Reply-To: <20221207020305-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Wed, 7 Dec 2022 05:18:41 -0500")
Message-ID: <87lengg1v4.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Dec 07, 2022 at 07:25:49AM +0100, Markus Armbruster wrote:
>> pcie_sriov.h needs PCI_NUM_REGIONS from pci.h, but doesn't include it.
>> pci.h must be included before pcie_sriov.h or else compile fails.
>> 
>> Adding #include "pci/pci.h" to pcie_sriov would be wrong, because it
>> would close an inclusion loop: pci.h includes pcie.h (for
>> PCIExpressDevice) includes pcie_sriov.h (for PCIESriovPF) includes pci.h
>> (for PCI_NUM_REGIONS).
>> 
>> The obvious solution is to move PCI_NUM_REGIONS pci.h somewhere
>> pcie_sriov.h can include without creating a loop.
>> 
>> We already have a few headers that don't include anything: pci_ids.h,
>> pci_regs.h (includes include/standard-headers/linux/pci_regs.h, which
>> doesn't count), pcie_regs.h.  Moving PCI_NUM_REGIONS to one of these
>> would work, but it doesn't feel right.
>> 
>> We could create a new one, say pci_defs.h.  Just for PCI_NUM_REGIONS
>> feels silly.  So, what else should move there?
>
> I'm ok with pci_defs.h
> However, I note that most headers including pci.h don't really
> need it. Consider include/hw/virtio/virtio-iommu.h all it needs is
> PCIBus typedef this is available from qemu/typedefs.h
> So if you are poking at this, want to clean that area up generally?

I looked into this, which made me reconsider my pci_defs.h idea.
Instead of splitting off pci_defs.h for PCI_NUM_REGIONS and similar
stuff (which stuff exactly?), I'm going to split off pci_device.h for
PCIDevice & friends.

[...]


