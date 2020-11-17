Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2532B5AE8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:24:40 +0100 (CET)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewI3-00021Z-UP
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kewGl-0001aR-Aw
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:23:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kewGj-0003HL-C6
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605601396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5HPIz59ppZWnsZFHWtyKvITKcXw1ZL4YMibTM6zsVg=;
 b=c7XYe48zWBGT+458bysEjA2nGQMEs1UuZQS/rwhVlIHKzLsn+LsAXR8V844PnDjMahF5wX
 4ZPq09dH/aXj3SWl093IuFiZ2xkIbF/nC6asQkoY5vVzoWC+LFRwi3dobmkc4oLduPMbmK
 AI46sn289H3Pe6bVnEk1wMLW/c5sP2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-Xc0ASKC1Mlyd5AW1Ne-rcg-1; Tue, 17 Nov 2020 03:23:13 -0500
X-MC-Unique: Xc0ASKC1Mlyd5AW1Ne-rcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08E3B64083;
 Tue, 17 Nov 2020 08:23:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 924C619C78;
 Tue, 17 Nov 2020 08:23:05 +0000 (UTC)
Subject: Re: [PATCH for-5.2] s390x/pci: Unregister listeners before destroying
 IOMMU address space
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com
References: <1605562955-21152-1-git-send-email-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <baddae5b-21a7-c2b4-94f0-c2245cbf0a71@redhat.com>
Date: Tue, 17 Nov 2020 09:23:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1605562955-21152-1-git-send-email-mjrosato@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, pmorel@linux.ibm.com,
 david@redhat.com, qemu-devel@nongnu.org, schnelle@linux.ibm.com,
 richard.henderson@linaro.org, groug@kaod.org, mlevitsk@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/2020 22.42, Matthew Rosato wrote:
> Hot-unplugging a vfio-pci device on s390x causes a QEMU crash:
> 
> qemu-system-s390x: ../softmmu/memory.c:2772:
>  do_address_space_destroy: Assertion `QTAILQ_EMPTY(&as->listeners)' failed.
> 
> In s390, the IOMMU address space is freed during device unplug but the
> associated vfio-pci device may not yet be finalized and therefore may
> still have a listener registered to the IOMMU address space.
> 
> Commit a2166410ad74 ("spapr_pci: Unregister listeners before destroying
> the IOMMU address space") previously resolved this issue for spapr_pci.
> We are now seeing this in s390x; it would seem the possibility for this
> issue was already present but based on a bisect commit 2d24a6466154
> ("device-core: use RCU for list of children of a bus") has now changed
> the timing such that it is now readily reproducible.
> 
> Add logic to ensure listeners are removed before destroying the address
> space.
> 
> Reported-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  hw/s390x/s390-pci-bus.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 48a3be8..e0dc20c 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -732,6 +732,13 @@ static void s390_pci_iommu_free(S390pciState *s, PCIBus *bus, int32_t devfn)
>  
>      table->iommu[PCI_SLOT(devfn)] = NULL;
>      g_hash_table_destroy(iommu->iotlb);
> +    /*
> +     * An attached PCI device may have memory listeners, eg. VFIO PCI.
> +     * The associated subregion will already have been unmapped in
> +     * s390_pci_iommu_disable in response to the guest deconfigure request.
> +     * Remove the listeners now before destroying the address space.
> +     */
> +    address_space_remove_listeners(&iommu->as);
>      address_space_destroy(&iommu->as);
>      object_unparent(OBJECT(&iommu->mr));
>      object_unparent(OBJECT(iommu));
> 

Looks reasonable to me.

Reviewed-by: Thomas Huth <thuth@redhat.com>


