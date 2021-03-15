Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B439233B02A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:43:51 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkhS-000449-QA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lLkgN-0003Yx-Pw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lLkgL-0001T6-V6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:42:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615804960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j08uDgOUDbR60tfU9As7X8muX8P2vxWquwQyx3P7o14=;
 b=VKdSn8ukBASpBcFpV5cpBEH0glYMbTUUTlekR1lfVEvhv00573HQnONyhjdTdBpMeGsjTQ
 7BBOJx9LYYg8obQDY2odso/JtnNvPdWf5/Xw1fMauc8NAxAoTedh18EWM7Li5cfu91nDqX
 bEjtmmbdFPSBTLh9BD3n8VH9YoNhU+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-i3onAQM6MDKREyl1eMdgMA-1; Mon, 15 Mar 2021 06:42:39 -0400
X-MC-Unique: i3onAQM6MDKREyl1eMdgMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 106E6DF8A0;
 Mon, 15 Mar 2021 10:42:38 +0000 (UTC)
Received: from gondolin (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D71836F134;
 Mon, 15 Mar 2021 10:42:36 +0000 (UTC)
Date: Mon, 15 Mar 2021 11:42:32 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: mrezanin@redhat.com
Subject: Re: [PATCH v3] Add missing initialization for g_autofree variables
Message-ID: <20210315114232.4bb6654e.cohuck@redhat.com>
In-Reply-To: <20210315101352.152888-1-mrezanin@redhat.com>
References: <20210315101352.152888-1-mrezanin@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 11:13:52 +0100
mrezanin@redhat.com wrote:

> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> When declaring g_autofree variable without inicialization, compiler
> will raise "may be used uninitialized in this function" warning due
> to automatic free handling.
> 
> This is mentioned in docs/devel/style.rst (quote from section
> "Automatic memory deallocation"):
> 
>   * Variables declared with g_auto* MUST always be initialized,
>     otherwise the cleanup function will use uninitialized stack memory
> 
> Add inicialization for these declarations to prevent the warning and
> comply with coding style.

Fixes: cd7498d07fbb ("s390x/pci: Add routine to get the vfio dma available count")
Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")

I can fix the spelling mistakes pointed out by Phil while applying, and
also add an 's390x/pci' prefix.

Would not mind a quick test run from someone with the hardware.

> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> 
> ---
> * v3:
>   -- allocate in s390_pci_update_dma_avail instead of NULL init
> 
> * v2:
>   -- Removed fixes in hw/remote/memory.c and hw/remote/proxy.c
>      fixed by patch sent by Zenghui Yu (multi-process: Initialize
>      variables declared with g_auto*)
> ---
>  hw/s390x/s390-pci-vfio.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
> index ead4f222d5..2a153fa8c9 100644
> --- a/hw/s390x/s390-pci-vfio.c
> +++ b/hw/s390x/s390-pci-vfio.c
> @@ -29,14 +29,11 @@
>   */
>  bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
>  {
> -    g_autofree struct vfio_iommu_type1_info *info;
> -    uint32_t argsz;
> +    uint32_t argsz = sizeof(struct vfio_iommu_type1_info);
> +    g_autofree struct vfio_iommu_type1_info *info = g_malloc0(argsz);
>  
>      assert(avail);
>  
> -    argsz = sizeof(struct vfio_iommu_type1_info);
> -    info = g_malloc0(argsz);
> -
>      /*
>       * If the specified argsz is not large enough to contain all capabilities
>       * it will be updated upon return from the ioctl.  Retry until we have
> @@ -230,7 +227,7 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
>   */
>  void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
>  {
> -    g_autofree struct vfio_device_info *info;
> +    g_autofree struct vfio_device_info *info = NULL;
>      VFIOPCIDevice *vfio_pci;
>      uint32_t argsz;
>      int fd;


