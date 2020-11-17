Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B882B5E8D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:45:14 +0100 (CET)
Received: from localhost ([::1]:37140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezQ9-0006H4-9K
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kezP3-0005Uc-Gu
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kezP1-0007Ta-6U
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605613439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPPK8XmvcUrdDCeWzEBU0yCfmFejwMmALPJP5/a91hU=;
 b=Fvq/m6FgkrJ5tOzY8W9lq7e5Sf5VyusFd8MGXsROeEox9xE5aJV3qCmWa9lUyO/qpl4zPu
 M5nMF7YtHaP0utcpCZ+9E7a1s9eyhUJF4J1CMC6VTIdeh4ucy39+5rc2CN/uGtXnPL8Dsj
 Djv26TxWDjzU2SECBIHMzYA2prloPT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-OEtjs_vCMDGuXax0VwPLKQ-1; Tue, 17 Nov 2020 06:43:57 -0500
X-MC-Unique: OEtjs_vCMDGuXax0VwPLKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A71C764144;
 Tue, 17 Nov 2020 11:43:56 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4ED2D5D9CC;
 Tue, 17 Nov 2020 11:43:52 +0000 (UTC)
Date: Tue, 17 Nov 2020 12:43:49 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PULL v3 26/32] s390x/pci: use a PCI Group structure
Message-ID: <20201117124349.2e1e2fe3.cohuck@redhat.com>
In-Reply-To: <160426456672.24886.4745091679423774723.stgit@gimli.home>
References: <160426371498.24886.12193840637250368669.stgit@gimli.home>
 <160426456672.24886.4745091679423774723.stgit@gimli.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 01 Nov 2020 14:02:46 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> From: Pierre Morel <pmorel@linux.ibm.com>
> 
> We use a S390PCIGroup structure to hold the information related to a
> zPCI Function group.
> 
> This allows us to be ready to support multiple groups and to retrieve
> the group information from the host.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>  hw/s390x/s390-pci-bus.c         |   42 +++++++++++++++++++++++++++++++++++++++
>  hw/s390x/s390-pci-inst.c        |   23 +++++++++++++--------
>  include/hw/s390x/s390-pci-bus.h |   10 +++++++++
>  3 files changed, 66 insertions(+), 9 deletions(-)

I just bisected a regression down to this commit.

s390x tcg guest on x86, virtio-pci devices are not detected. The
relevant feature bits are visible to the guest. Same breakage with
different guest kernels.

KVM guests and s390x tcg guests on s390x are fine, so I assume an
endianness issue somewhere. Nothing jumps out to me, though.

> 
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index 218717397ae1..4c7f06d5cf95 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -738,6 +738,46 @@ static void s390_pci_iommu_free(S390pciState *s, PCIBus *bus, int32_t devfn)
>      object_unref(OBJECT(iommu));
>  }
>  
> +static S390PCIGroup *s390_group_create(int id)
> +{
> +    S390PCIGroup *group;
> +    S390pciState *s = s390_get_phb();
> +
> +    group = g_new0(S390PCIGroup, 1);
> +    group->id = id;
> +    QTAILQ_INSERT_TAIL(&s->zpci_groups, group, link);
> +    return group;
> +}
> +
> +S390PCIGroup *s390_group_find(int id)
> +{
> +    S390PCIGroup *group;
> +    S390pciState *s = s390_get_phb();
> +
> +    QTAILQ_FOREACH(group, &s->zpci_groups, link) {
> +        if (group->id == id) {
> +            return group;
> +        }
> +    }
> +    return NULL;
> +}
> +
> +static void s390_pci_init_default_group(void)
> +{
> +    S390PCIGroup *group;
> +    ClpRspQueryPciGrp *resgrp;
> +
> +    group = s390_group_create(ZPCI_DEFAULT_FN_GRP);
> +    resgrp = &group->zpci_group;
> +    resgrp->fr = 1;
> +    stq_p(&resgrp->dasm, 0);
> +    stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
> +    stw_p(&resgrp->mui, DEFAULT_MUI);
> +    stw_p(&resgrp->i, 128);
> +    stw_p(&resgrp->maxstbl, 128);
> +    resgrp->version = 0;
> +}
> +
>  static void s390_pcihost_realize(DeviceState *dev, Error **errp)
>  {
>      PCIBus *b;
> @@ -766,7 +806,9 @@ static void s390_pcihost_realize(DeviceState *dev, Error **errp)
>      QTAILQ_INIT(&s->pending_sei);
>      QTAILQ_INIT(&s->zpci_devs);
>      QTAILQ_INIT(&s->zpci_dma_limit);
> +    QTAILQ_INIT(&s->zpci_groups);
>  
> +    s390_pci_init_default_group();
>      css_register_io_adapters(CSS_IO_ADAPTER_PCI, true, false,
>                               S390_ADAPTER_SUPPRESSIBLE, errp);
>  }
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 4eadd9e79416..c25b2a67efe0 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -298,21 +298,25 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>          stq_p(&resquery->edma, ZPCI_EDMA_ADDR);
>          stl_p(&resquery->fid, pbdev->fid);
>          stw_p(&resquery->pchid, 0);
> -        stw_p(&resquery->ug, 1);
> +        stw_p(&resquery->ug, ZPCI_DEFAULT_FN_GRP);
>          stl_p(&resquery->uid, pbdev->uid);
>          stw_p(&resquery->hdr.rsp, CLP_RC_OK);
>          break;
>      }
>      case CLP_QUERY_PCI_FNGRP: {
>          ClpRspQueryPciGrp *resgrp = (ClpRspQueryPciGrp *)resh;
> -        resgrp->fr = 1;
> -        stq_p(&resgrp->dasm, 0);
> -        stq_p(&resgrp->msia, ZPCI_MSI_ADDR);
> -        stw_p(&resgrp->mui, DEFAULT_MUI);
> -        stw_p(&resgrp->i, 128);
> -        stw_p(&resgrp->maxstbl, 128);
> -        resgrp->version = 0;
>  
> +        ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
> +        S390PCIGroup *group;
> +
> +        group = s390_group_find(reqgrp->g);
> +        if (!group) {
> +            /* We do not allow access to unknown groups */
> +            /* The group must have been obtained with a vfio device */
> +            stw_p(&resgrp->hdr.rsp, CLP_RC_QUERYPCIFG_PFGID);
> +            goto out;
> +        }
> +        memcpy(resgrp, &group->zpci_group, sizeof(ClpRspQueryPciGrp));
>          stw_p(&resgrp->hdr.rsp, CLP_RC_OK);
>          break;
>      }
> @@ -787,7 +791,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
>      }
>      /* Length must be greater than 8, a multiple of 8 */
>      /* and not greater than maxstbl */
> -    if ((len <= 8) || (len % 8) || (len > pbdev->maxstbl)) {
> +    if ((len <= 8) || (len % 8) ||
> +        (len > pbdev->pci_group->zpci_group.maxstbl)) {
>          goto specification_error;
>      }
>      /* Do not cross a 4K-byte boundary */
> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
> index 5f339e57fb68..869c0f254b7f 100644
> --- a/include/hw/s390x/s390-pci-bus.h
> +++ b/include/hw/s390x/s390-pci-bus.h
> @@ -316,6 +316,14 @@ typedef struct ZpciFmb {
>  } ZpciFmb;
>  QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
>  
> +#define ZPCI_DEFAULT_FN_GRP 0x20
> +typedef struct S390PCIGroup {
> +    ClpRspQueryPciGrp zpci_group;
> +    int id;
> +    QTAILQ_ENTRY(S390PCIGroup) link;
> +} S390PCIGroup;
> +S390PCIGroup *s390_group_find(int id);
> +
>  struct S390PCIBusDevice {
>      DeviceState qdev;
>      PCIDevice *pdev;
> @@ -333,6 +341,7 @@ struct S390PCIBusDevice {
>      uint16_t noi;
>      uint16_t maxstbl;
>      uint8_t sum;
> +    S390PCIGroup *pci_group;
>      S390MsixInfo msix;
>      AdapterRoutes routes;
>      S390PCIIOMMU *iommu;
> @@ -358,6 +367,7 @@ struct S390pciState {
>      QTAILQ_HEAD(, SeiContainer) pending_sei;
>      QTAILQ_HEAD(, S390PCIBusDevice) zpci_devs;
>      QTAILQ_HEAD(, S390PCIDMACount) zpci_dma_limit;
> +    QTAILQ_HEAD(, S390PCIGroup) zpci_groups;
>  };
>  
>  S390pciState *s390_get_phb(void);
> 


