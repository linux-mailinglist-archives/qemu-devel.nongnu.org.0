Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21149186606
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 09:03:21 +0100 (CET)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDkiV-0001F0-Rf
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 04:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jDkTc-0005VU-3Y
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 03:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jDkTa-0006wR-DQ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 03:47:55 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47680)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jDkTV-0005mB-Ry; Mon, 16 Mar 2020 03:47:50 -0400
Received: from apples.localdomain (80-62-117-52-mobile.dk.customer.tdc.net
 [80.62.117.52])
 by charlie.dont.surf (Postfix) with ESMTPSA id 80B89BF5E1;
 Mon, 16 Mar 2020 07:47:48 +0000 (UTC)
Date: Mon, 16 Mar 2020 00:47:45 -0700
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v5 12/26] nvme: add missing mandatory features
Message-ID: <20200316074745.ry6bwt5qlrvyfxy4@apples.localdomain>
References: <20200204095208.269131-1-k.jensen@samsung.com>
 <CGME20200204095223eucas1p281b4ef7c8f4170d8a42da3b4aea9e166@eucas1p2.samsung.com>
 <20200204095208.269131-13-k.jensen@samsung.com>
 <0e6a31b467ab039b291ecb92e2290224238195ed.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0e6a31b467ab039b291ecb92e2290224238195ed.camel@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Feb 12 12:27, Maxim Levitsky wrote:
> On Tue, 2020-02-04 at 10:51 +0100, Klaus Jensen wrote:
> > Add support for returning a resonable response to Get/Set Features of
> > mandatory features.
> > 
> > Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
> > ---
> >  hw/block/nvme.c       | 57 ++++++++++++++++++++++++++++++++++++++++---
> >  hw/block/trace-events |  2 ++
> >  include/block/nvme.h  |  3 ++-
> >  3 files changed, 58 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index a186d95df020..3267ee2de47a 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1008,7 +1008,15 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >      uint32_t dw11 = le32_to_cpu(cmd->cdw11);
> >      uint32_t result;
> >  
> > +    trace_nvme_dev_getfeat(nvme_cid(req), dw10);
> > +
> >      switch (dw10) {
> > +    case NVME_ARBITRATION:
> > +        result = cpu_to_le32(n->features.arbitration);
> > +        break;
> > +    case NVME_POWER_MANAGEMENT:
> > +        result = cpu_to_le32(n->features.power_mgmt);
> > +        break;
> >      case NVME_TEMPERATURE_THRESHOLD:
> >          result = 0;
> >  
> > @@ -1029,6 +1037,9 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >              break;
> >          }
> >  
> > +        break;
> > +    case NVME_ERROR_RECOVERY:
> > +        result = cpu_to_le32(n->features.err_rec);
> >          break;
> >      case NVME_VOLATILE_WRITE_CACHE:
> >          result = blk_enable_write_cache(n->conf.blk);
> 
> This is existing code but still like to point out that endianess conversion is missing.

Fixed.

> Also we need to think if we need to do some flush if the write cache is disabled.
> I don't know yet that area well enough.
> 

Looking at the block layer code it just sets a flag when disabling, but
subsequent requests will have BDRV_REQ_FUA set. So to make sure that
stuff in the cache is flushed, let's do a flush.

> > @@ -1041,6 +1052,19 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >          break;
> >      case NVME_TIMESTAMP:
> >          return nvme_get_feature_timestamp(n, cmd);
> > +    case NVME_INTERRUPT_COALESCING:
> > +        result = cpu_to_le32(n->features.int_coalescing);
> > +        break;
> > +    case NVME_INTERRUPT_VECTOR_CONF:
> > +        if ((dw11 & 0xffff) > n->params.num_queues) {
> Looks like it should be >= since interrupt vector is not zero based.

Fixed in other patch.

> > +            return NVME_INVALID_FIELD | NVME_DNR;
> > +        }
> > +
> > +        result = cpu_to_le32(n->features.int_vector_config[dw11 & 0xffff]);
> > +        break;
> > +    case NVME_WRITE_ATOMICITY:
> > +        result = cpu_to_le32(n->features.write_atomicity);
> > +        break;
> >      case NVME_ASYNCHRONOUS_EVENT_CONF:
> >          result = cpu_to_le32(n->features.async_config);
> >          break;
> > @@ -1076,6 +1100,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >      uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> >      uint32_t dw11 = le32_to_cpu(cmd->cdw11);
> >  
> > +    trace_nvme_dev_setfeat(nvme_cid(req), dw10, dw11);
> > +
> >      switch (dw10) {
> >      case NVME_TEMPERATURE_THRESHOLD:
> >          if (NVME_TEMP_TMPSEL(dw11)) {
> > @@ -1116,6 +1142,13 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >      case NVME_ASYNCHRONOUS_EVENT_CONF:
> >          n->features.async_config = dw11;
> >          break;
> > +    case NVME_ARBITRATION:
> > +    case NVME_POWER_MANAGEMENT:
> > +    case NVME_ERROR_RECOVERY:
> > +    case NVME_INTERRUPT_COALESCING:
> > +    case NVME_INTERRUPT_VECTOR_CONF:
> > +    case NVME_WRITE_ATOMICITY:
> > +        return NVME_FEAT_NOT_CHANGABLE | NVME_DNR;
> >      default:
> >          trace_nvme_dev_err_invalid_setfeat(dw10);
> >          return NVME_INVALID_FIELD | NVME_DNR;
> > @@ -1689,6 +1722,21 @@ static void nvme_init_state(NvmeCtrl *n)
> >      n->temperature = NVME_TEMPERATURE;
> >      n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
> >      n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> > +
> > +    /*
> > +     * There is no limit on the number of commands that the controller may
> > +     * launch at one time from a particular Submission Queue.
> > +     */
> > +    n->features.arbitration = 0x7;
> A nice #define in nvme.h stating that 0x7 means no burst limit would be nice.
> 

Done.

> > +
> > +    n->features.int_vector_config = g_malloc0_n(n->params.num_queues,
> > +        sizeof(*n->features.int_vector_config));
> > +
> > +    /* disable coalescing (not supported) */
> > +    for (int i = 0; i < n->params.num_queues; i++) {
> > +        n->features.int_vector_config[i] = i | (1 << 16);
> Same here

Done.

> > +    }
> > +
> >      n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
> >  }
> >  
> > @@ -1782,15 +1830,17 @@ static void nvme_init_ctrl(NvmeCtrl *n)
> >      id->nn = cpu_to_le32(n->num_namespaces);
> >      id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROS | NVME_ONCS_TIMESTAMP);
> >  
> > +
> > +    if (blk_enable_write_cache(n->conf.blk)) {
> > +        id->vwc = 1;
> > +    }
> > +
> >      strcpy((char *) id->subnqn, "nqn.2019-08.org.qemu:");
> >      pstrcat((char *) id->subnqn, sizeof(id->subnqn), n->params.serial);
> >  
> >      id->psd[0].mp = cpu_to_le16(0x9c4);
> >      id->psd[0].enlat = cpu_to_le32(0x10);
> >      id->psd[0].exlat = cpu_to_le32(0x4);
> > -    if (blk_enable_write_cache(n->conf.blk)) {
> > -        id->vwc = 1;
> > -    }
> >  
> >      n->bar.cap = 0;
> >      NVME_CAP_SET_MQES(n->bar.cap, 0x7ff);
> > @@ -1861,6 +1911,7 @@ static void nvme_exit(PCIDevice *pci_dev)
> >      g_free(n->cq);
> >      g_free(n->sq);
> >      g_free(n->aer_reqs);
> > +    g_free(n->features.int_vector_config);
> >  
> >      if (n->params.cmb_size_mb) {
> >          g_free(n->cmbuf);
> > diff --git a/hw/block/trace-events b/hw/block/trace-events
> > index 3952c36774cf..4cf39961989d 100644
> > --- a/hw/block/trace-events
> > +++ b/hw/block/trace-events
> > @@ -41,6 +41,8 @@ nvme_dev_del_cq(uint16_t cqid) "deleted completion queue, sqid=%"PRIu16""
> >  nvme_dev_identify_ctrl(void) "identify controller"
> >  nvme_dev_identify_ns(uint16_t ns) "identify namespace, nsid=%"PRIu16""
> >  nvme_dev_identify_nslist(uint16_t ns) "identify namespace list, nsid=%"PRIu16""
> > +nvme_dev_getfeat(uint16_t cid, uint32_t fid) "cid %"PRIu16" fid 0x%"PRIx32""
> > +nvme_dev_setfeat(uint16_t cid, uint32_t fid, uint32_t val) "cid %"PRIu16" fid 0x%"PRIx32" val 0x%"PRIx32""
> >  nvme_dev_getfeat_vwcache(const char* result) "get feature volatile write cache, result=%s"
> >  nvme_dev_getfeat_numq(int result) "get feature number of queues, result=%d"
> >  nvme_dev_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index a24be047a311..09419ed499d0 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -445,7 +445,8 @@ enum NvmeStatusCodes {
> >      NVME_FW_REQ_RESET           = 0x010b,
> >      NVME_INVALID_QUEUE_DEL      = 0x010c,
> >      NVME_FID_NOT_SAVEABLE       = 0x010d,
> > -    NVME_FID_NOT_NSID_SPEC      = 0x010f,
> > +    NVME_FEAT_NOT_CHANGABLE     = 0x010e,
> > +    NVME_FEAT_NOT_NSID_SPEC     = 0x010f,
> >      NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
> >      NVME_CONFLICTING_ATTRS      = 0x0180,
> >      NVME_INVALID_PROT_INFO      = 0x0181,
> 
> Best regards,
> 	Maxim Levitsky
> 

