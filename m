Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68560CBBA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:26:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onIy9-00085L-36; Tue, 25 Oct 2022 08:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onIxu-0007Xz-Ar
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:23:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onIxq-0006vy-II
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666700599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xHGNddDEfa4VTCTp9Gyhbl48CFHCUlTHRNZmhhLnFy0=;
 b=GB/JINrgrDkAWQn9WL5zE52+z4slrilEGWi38Zhyv73hOWbmnXa5BchGXjbiFNishI1ayj
 K0eg92XuvTXZLmzXTKngMFNZxKn/N5gF//vfPWFNT8UobN77yKJoZq8XGe3yI0CgmAcJxS
 K4mp+GqG/RpLnJ4oSgLXROpYx3+gc+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475--dR1mbcpNESAgDiY1FK4sA-1; Tue, 25 Oct 2022 08:23:15 -0400
X-MC-Unique: -dR1mbcpNESAgDiY1FK4sA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DCBF80A0AE;
 Tue, 25 Oct 2022 12:23:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D16FF202903F;
 Tue, 25 Oct 2022 12:23:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB4B121E6936; Tue, 25 Oct 2022 14:23:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,  qemu-devel@nongnu.org,
 qemu-block@nongnu.org,  qemu-arm@nongnu.org,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,  Yan Vugenfirer
 <yan@daynix.com>,  Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v2 02/17] hw/i386/amd_iommu: Omit errp for
 pci_add_capability
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
 <20221022044053.81650-3-akihiko.odaki@daynix.com>
Date: Tue, 25 Oct 2022 14:23:11 +0200
In-Reply-To: <20221022044053.81650-3-akihiko.odaki@daynix.com> (Akihiko
 Odaki's message of "Sat, 22 Oct 2022 13:40:38 +0900")
Message-ID: <874jvs149c.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  hw/i386/amd_iommu.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
>
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 725f69095b..8a88cbea0a 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1539,7 +1539,6 @@ static void amdvi_sysbus_reset(DeviceState *dev)
>  
>  static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>  {
> -    int ret = 0;
>      AMDVIState *s = AMD_IOMMU_DEVICE(dev);
>      MachineState *ms = MACHINE(qdev_get_machine());
>      PCMachineState *pcms = PC_MACHINE(ms);
       X86MachineState *x86ms = X86_MACHINE(ms);
       PCIBus *bus = pcms->bus;

       s->iotlb = g_hash_table_new_full(amdvi_uint64_hash,
                                        amdvi_uint64_equal, g_free, g_free);

> @@ -1553,23 +1552,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
>      if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
>          return;
>      }
> -    ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
> -                                         AMDVI_CAPAB_SIZE, errp);
> -    if (ret < 0) {
> -        return;
> -    }
> -    s->capab_offset = ret;
> +    s->capab_offset = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
> +                                         AMDVI_CAPAB_SIZE);
>  
> -    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
> -                             AMDVI_CAPAB_REG_SIZE, errp);
> -    if (ret < 0) {
> -        return;
> -    }
> -    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0,
> -                             AMDVI_CAPAB_REG_SIZE, errp);
> -    if (ret < 0) {
> -        return;
> -    }
> +    pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0, AMDVI_CAPAB_REG_SIZE);
> +    pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0, AMDVI_CAPAB_REG_SIZE);
>  
>      /* Pseudo address space under root PCI bus. */
>      x86ms->ioapic_as = amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_DEVID);

Your patch replaces error handling by abort().  The commit message
should explain why this is okay.

It is, because these are programming errors, and aborting on programming
errors is appropriate.

Moreover, the error handling is incorrect: it leaks s->iotlb.  To be clear:
replacing it would be okay even if it cleaned up properly.

The other patches also need to explain.  Yes, this repetitive, but
anyone looking at one of these commits later will be grateful.  Yes,
they could find an explanation in PATCH 01.  If they find it in git
history.  Each commit should make sense on its own whenever practical.

The explanation will be a bit more involved for device assignment (PATCH
15, maybe more), where we need to point out that the caller guards
against these errors.


