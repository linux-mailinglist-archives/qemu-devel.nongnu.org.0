Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EABD1B39CC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 10:16:24 +0200 (CEST)
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRAYQ-0007n0-W4
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 04:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49472)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jRAXB-000725-3I
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 04:15:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jRAXA-0001d9-Dw
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 04:15:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59434
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1jRAXA-0001cl-0r
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 04:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587543303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWcM1ow2dX6ki0Rv6xcCnvEZMOlZrvG9yZGohyLkcHw=;
 b=KgQV9sbjGf2JEKuN51ioUzifIorMXrD8i5PKWe1Psau51lGgLpuQPbH3yBCXvEazz27iZT
 uE8lm6gfatS1YlCAV0yzQXq55oWivRmZsyu7KBteWNjerSpldJLDA/2iswGpyayFYZcE9o
 EyaM6hhUQRB3+bPbH2lhSN5MsBohB5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-RzeaYFr8Nq-EYDVWkR_XaQ-1; Wed, 22 Apr 2020 04:14:59 -0400
X-MC-Unique: RzeaYFr8Nq-EYDVWkR_XaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF57800D53;
 Wed, 22 Apr 2020 08:14:57 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F069B3A76;
 Wed, 22 Apr 2020 08:14:55 +0000 (UTC)
Message-ID: <47310be83a83e4cf97a996b9d98990e908327e3c.camel@redhat.com>
Subject: Re: [PATCH v3 04/16] nvme: move device parameters to separate struct
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org
Date: Wed, 22 Apr 2020 11:14:54 +0300
In-Reply-To: <20200422070927.373048-5-its@irrelevant.dk>
References: <20200422070927.373048-1-its@irrelevant.dk>
 <20200422070927.373048-5-its@irrelevant.dk>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 04:15:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-04-22 at 09:09 +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Move device configuration parameters to separate struct to make it
> explicit what is configurable and what is set internally.
> 
> Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 49 ++++++++++++++++++++++++-------------------------
>  hw/block/nvme.h | 18 +++++++++++++++---
>  2 files changed, 39 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f67499d85f3a..382275e466fe 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -78,12 +78,12 @@ static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
>  
>  static int nvme_check_sqid(NvmeCtrl *n, uint16_t sqid)
>  {
> -    return sqid < n->num_queues && n->sq[sqid] != NULL ? 0 : -1;
> +    return sqid < n->params.num_queues && n->sq[sqid] != NULL ? 0 : -1;
>  }
>  
>  static int nvme_check_cqid(NvmeCtrl *n, uint16_t cqid)
>  {
> -    return cqid < n->num_queues && n->cq[cqid] != NULL ? 0 : -1;
> +    return cqid < n->params.num_queues && n->cq[cqid] != NULL ? 0 : -1;
>  }
>  
>  static void nvme_inc_cq_tail(NvmeCQueue *cq)
> @@ -645,7 +645,7 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
>          trace_pci_nvme_err_invalid_create_cq_addr(prp1);
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
> -    if (unlikely(vector > n->num_queues)) {
> +    if (unlikely(vector > n->params.num_queues)) {
>          trace_pci_nvme_err_invalid_create_cq_vector(vector);
>          return NVME_INVALID_IRQ_VECTOR | NVME_DNR;
>      }
> @@ -797,7 +797,8 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          break;
>      case NVME_NUMBER_OF_QUEUES:
> -        result = cpu_to_le32((n->num_queues - 2) | ((n->num_queues - 2) << 16));
> +        result = cpu_to_le32((n->params.num_queues - 2) |
> +                             ((n->params.num_queues - 2) << 16));
>          trace_pci_nvme_getfeat_numq(result);
>          break;
>      case NVME_TIMESTAMP:
> @@ -841,9 +842,10 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>      case NVME_NUMBER_OF_QUEUES:
>          trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
>                                      ((dw11 >> 16) & 0xFFFF) + 1,
> -                                    n->num_queues - 1, n->num_queues - 1);
> -        req->cqe.result =
> -            cpu_to_le32((n->num_queues - 2) | ((n->num_queues - 2) << 16));
> +                                    n->params.num_queues - 1,
> +                                    n->params.num_queues - 1);
> +        req->cqe.result = cpu_to_le32((n->params.num_queues - 2) |
> +                                      ((n->params.num_queues - 2) << 16));
>          break;
>      case NVME_TIMESTAMP:
>          return nvme_set_feature_timestamp(n, cmd);
> @@ -914,12 +916,12 @@ static void nvme_clear_ctrl(NvmeCtrl *n)
>  
>      blk_drain(n->conf.blk);
>  
> -    for (i = 0; i < n->num_queues; i++) {
> +    for (i = 0; i < n->params.num_queues; i++) {
>          if (n->sq[i] != NULL) {
>              nvme_free_sq(n->sq[i], n);
>          }
>      }
> -    for (i = 0; i < n->num_queues; i++) {
> +    for (i = 0; i < n->params.num_queues; i++) {
>          if (n->cq[i] != NULL) {
>              nvme_free_cq(n->cq[i], n);
>          }
> @@ -1350,7 +1352,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>      int64_t bs_size;
>      uint8_t *pci_conf;
>  
> -    if (!n->num_queues) {
> +    if (!n->params.num_queues) {
>          error_setg(errp, "num_queues can't be zero");
>          return;
>      }
> @@ -1366,12 +1368,12 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>          return;
>      }
>  
> -    if (!n->serial) {
> +    if (!n->params.serial) {
>          error_setg(errp, "serial property not set");
>          return;
>      }
>  
> -    if (!n->cmb_size_mb && n->pmrdev) {
> +    if (!n->params.cmb_size_mb && n->pmrdev) {
>          if (host_memory_backend_is_mapped(n->pmrdev)) {
>              char *path = object_get_canonical_path_component(OBJECT(n->pmrdev));
>              error_setg(errp, "can't use already busy memdev: %s", path);
> @@ -1402,25 +1404,26 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>      n->num_namespaces = 1;
>  
>      /* num_queues is really number of pairs, so each has two doorbells */
> -    n->reg_size = pow2ceil(NVME_REG_SIZE + 2 * n->num_queues * NVME_DB_SIZE);
> +    n->reg_size = pow2ceil(NVME_REG_SIZE +
> +                           2 * n->params.num_queues * NVME_DB_SIZE);
>      n->ns_size = bs_size / (uint64_t)n->num_namespaces;
>  
>      n->namespaces = g_new0(NvmeNamespace, n->num_namespaces);
> -    n->sq = g_new0(NvmeSQueue *, n->num_queues);
> -    n->cq = g_new0(NvmeCQueue *, n->num_queues);
> +    n->sq = g_new0(NvmeSQueue *, n->params.num_queues);
> +    n->cq = g_new0(NvmeCQueue *, n->params.num_queues);
>  
>      memory_region_init_io(&n->iomem, OBJECT(n), &nvme_mmio_ops, n,
>                            "nvme", n->reg_size);
>      pci_register_bar(pci_dev, 0,
>          PCI_BASE_ADDRESS_SPACE_MEMORY | PCI_BASE_ADDRESS_MEM_TYPE_64,
>          &n->iomem);
> -    msix_init_exclusive_bar(pci_dev, n->num_queues, 4, NULL);
> +    msix_init_exclusive_bar(pci_dev, n->params.num_queues, 4, NULL);
>  
>      id->vid = cpu_to_le16(pci_get_word(pci_conf + PCI_VENDOR_ID));
>      id->ssvid = cpu_to_le16(pci_get_word(pci_conf + PCI_SUBSYSTEM_VENDOR_ID));
>      strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
>      strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
> -    strpadcpy((char *)id->sn, sizeof(id->sn), n->serial, ' ');
> +    strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
>      id->rab = 6;
>      id->ieee[0] = 0x00;
>      id->ieee[1] = 0x02;
> @@ -1449,7 +1452,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>      n->bar.vs = 0x00010200;
>      n->bar.intmc = n->bar.intms = 0;
>  
> -    if (n->cmb_size_mb) {
> +    if (n->params.cmb_size_mb) {
>  
>          NVME_CMBLOC_SET_BIR(n->bar.cmbloc, 2);
>          NVME_CMBLOC_SET_OFST(n->bar.cmbloc, 0);
> @@ -1460,7 +1463,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>          NVME_CMBSZ_SET_RDS(n->bar.cmbsz, 1);
>          NVME_CMBSZ_SET_WDS(n->bar.cmbsz, 1);
>          NVME_CMBSZ_SET_SZU(n->bar.cmbsz, 2); /* MBs */
> -        NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->cmb_size_mb);
> +        NVME_CMBSZ_SET_SZ(n->bar.cmbsz, n->params.cmb_size_mb);
>  
>          n->cmbloc = n->bar.cmbloc;
>          n->cmbsz = n->bar.cmbsz;
> @@ -1544,7 +1547,7 @@ static void nvme_exit(PCIDevice *pci_dev)
>      g_free(n->cq);
>      g_free(n->sq);
>  
> -    if (n->cmb_size_mb) {
> +    if (n->params.cmb_size_mb) {
>          g_free(n->cmbuf);
>      }
>  
> @@ -1556,11 +1559,7 @@ static void nvme_exit(PCIDevice *pci_dev)
>  
>  static Property nvme_props[] = {
>      DEFINE_BLOCK_PROPERTIES(NvmeCtrl, conf),
> -    DEFINE_PROP_LINK("pmrdev", NvmeCtrl, pmrdev, TYPE_MEMORY_BACKEND,
> -                     HostMemoryBackend *),
> -    DEFINE_PROP_STRING("serial", NvmeCtrl, serial),
> -    DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, cmb_size_mb, 0),
> -    DEFINE_PROP_UINT32("num_queues", NvmeCtrl, num_queues, 64),
> +    DEFINE_NVME_PROPERTIES(NvmeCtrl, params),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 6520a9f0bead..7cb1d5e31870 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -1,7 +1,21 @@
>  #ifndef HW_NVME_H
>  #define HW_NVME_H
> +
>  #include "block/nvme.h"
>  
> +#define DEFINE_NVME_PROPERTIES(_state, _props) \
> +    DEFINE_PROP_STRING("serial", _state, _props.serial), \
> +    DEFINE_PROP_UINT32("cmb_size_mb", _state, _props.cmb_size_mb, 0), \
> +    DEFINE_PROP_UINT32("num_queues", _state, _props.num_queues, 64), \
> +    DEFINE_PROP_LINK("pmrdev", _state, pmrdev, TYPE_MEMORY_BACKEND, \
> +                     HostMemoryBackend *)
> +
> +typedef struct NvmeParams {
> +    char     *serial;
> +    uint32_t num_queues;
> +    uint32_t cmb_size_mb;
> +} NvmeParams;
> +
>  typedef struct NvmeAsyncEvent {
>      QSIMPLEQ_ENTRY(NvmeAsyncEvent) entry;
>      NvmeAerResult result;
> @@ -63,6 +77,7 @@ typedef struct NvmeCtrl {
>      MemoryRegion ctrl_mem;
>      NvmeBar      bar;
>      BlockConf    conf;
> +    NvmeParams   params;
>  
>      uint32_t    page_size;
>      uint16_t    page_bits;
> @@ -71,10 +86,8 @@ typedef struct NvmeCtrl {
>      uint16_t    sqe_size;
>      uint32_t    reg_size;
>      uint32_t    num_namespaces;
> -    uint32_t    num_queues;
>      uint32_t    max_q_ents;
>      uint64_t    ns_size;
> -    uint32_t    cmb_size_mb;
>      uint32_t    cmbsz;
>      uint32_t    cmbloc;
>      uint8_t     *cmbuf;
> @@ -82,7 +95,6 @@ typedef struct NvmeCtrl {
>      uint64_t    host_timestamp;                 /* Timestamp sent by the host */
>      uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>  
> -    char            *serial;
>      HostMemoryBackend *pmrdev;
>  
>      NvmeNamespace   *namespaces;
Looks OK.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Best regards,
	Maxim Levitsky


