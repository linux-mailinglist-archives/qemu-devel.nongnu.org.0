Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E31C9CC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 16:01:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQXzy-0008LQ-U9
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 10:01:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hQQWT-0006xK-7J
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:02:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hQQWN-000198-6p
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:02:41 -0400
Received: from charlie.dont.surf ([128.199.63.193]:59174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hQQWJ-000149-4m; Tue, 14 May 2019 02:02:35 -0400
Received: from apples.localdomain (77.241.135.233.mobile.3.dk [77.241.135.233])
	by charlie.dont.surf (Postfix) with ESMTPSA id 3B6C4BF724;
	Tue, 14 May 2019 06:02:31 +0000 (UTC)
Date: Tue, 14 May 2019 08:02:25 +0200
From: Klaus Birkelund <klaus@birkelund.eu>
To: Kenneth Heitke <kenneth.heitke@intel.com>
Message-ID: <20190514060225.GA1350@apples.localdomain>
Mail-Followup-To: Kenneth Heitke <kenneth.heitke@intel.com>,
	qemu-block@nongnu.org, keith.busch@intel.com, kwolf@redhat.com,
	qemu-devel@nongnu.org, mreitz@redhat.com
References: <20190405214117.1850-1-kenneth.heitke@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190405214117.1850-1-kenneth.heitke@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
X-Mailman-Approved-At: Tue, 14 May 2019 09:59:40 -0400
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] nvme: add Get/Set Feature
 Timestamp support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: keith.busch@intel.com, kwolf@redhat.com, qemu-devel@nongnu.org,
	qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 05, 2019 at 03:41:17PM -0600, Kenneth Heitke wrote:
> Signed-off-by: Kenneth Heitke <kenneth.heitke@intel.com>
> ---
>  hw/block/nvme.c       | 120 +++++++++++++++++++++++++++++++++++++++++-
>  hw/block/nvme.h       |   3 ++
>  hw/block/trace-events |   2 +
>  include/block/nvme.h  |   2 +
>  4 files changed, 125 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 7caf92532a..e775e89299 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -219,6 +219,30 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_t prp1,
>      return NVME_INVALID_FIELD | NVME_DNR;
>  }
>  
> +static uint16_t nvme_dma_write_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
> +                                   uint64_t prp1, uint64_t prp2)
> +{
> +    QEMUSGList qsg;
> +    QEMUIOVector iov;
> +    uint16_t status = NVME_SUCCESS;
> +
> +    if (nvme_map_prp(&qsg, &iov, prp1, prp2, len, n)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +    if (qsg.nsg > 0) {
> +        if (dma_buf_write(ptr, len, &qsg)) {
> +            status = NVME_INVALID_FIELD | NVME_DNR;
> +        }
> +        qemu_sglist_destroy(&qsg);
> +    } else {
> +        if (qemu_iovec_from_buf(&iov, 0, ptr, len) != len) {

This should be `qemu_iovec_to_buf`.

> +            status = NVME_INVALID_FIELD | NVME_DNR;
> +        }
> +        qemu_iovec_destroy(&iov);
> +    }
> +    return status;
> +}
> +
>  static uint16_t nvme_dma_read_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
>      uint64_t prp1, uint64_t prp2)
>  {
> @@ -678,7 +702,6 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeIdentify *c)
>      return ret;
>  }
>  
> -
>  static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
>  {
>      NvmeIdentify *c = (NvmeIdentify *)cmd;
> @@ -696,6 +719,63 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
>      }
>  }
>  
> +static inline void nvme_set_timestamp(NvmeCtrl *n, uint64_t ts)
> +{
> +    n->host_timestamp = ts;
> +    n->timestamp_set_qemu_clock_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +}
> +
> +static inline uint64_t nvme_get_timestamp(const NvmeCtrl *n)
> +{
> +    uint64_t current_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    uint64_t elapsed_time = current_time - n->timestamp_set_qemu_clock_ms;
> +
> +    union nvme_timestamp {
> +        struct {
> +            uint64_t timestamp:48;
> +            uint64_t sync:1;
> +            uint64_t origin:3;
> +            uint64_t rsvd1:12;
> +        };
> +        uint64_t all;
> +    };
> +
> +    union nvme_timestamp ts;
> +    ts.all = 0;
> +
> +    /*
> +     * If the sum of the Timestamp value set by the host and the elapsed
> +     * time exceeds 2^48, the value returned should be reduced modulo 2^48.
> +     */
> +    ts.timestamp = (n->host_timestamp + elapsed_time) & 0xffffffffffff;
> +
> +    /* If the host timestamp is non-zero, set the timestamp origin */
> +    ts.origin = n->host_timestamp ? 0x01 : 0x00;
> +
> +    return ts.all;
> +}
> +
> +static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeCmd *cmd)
> +{
> +    uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> +    uint64_t prp1 = le64_to_cpu(cmd->prp1);
> +    uint64_t prp2 = le64_to_cpu(cmd->prp2);
> +
> +    uint64_t timestamp = nvme_get_timestamp(n);
> +
> +    if (!(n->oncs & NVME_ONCS_TIMESTAMP)) {

Any particular reason we want to sometimes not support this? Could we
just do with out this check?

> +        trace_nvme_err_invalid_getfeat(dw10);
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    trace_nvme_getfeat_timestamp(timestamp);
> +
> +    timestamp = cpu_to_le64(timestamp);
> +
> +    return nvme_dma_read_prp(n, (uint8_t *)&timestamp,
> +                                 sizeof(timestamp), prp1, prp2);
> +}
> +
>  static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>  {
>      uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> @@ -710,6 +790,9 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>          result = cpu_to_le32((n->num_queues - 2) | ((n->num_queues - 2) << 16));
>          trace_nvme_getfeat_numq(result);
>          break;
> +    case NVME_TIMESTAMP:
> +        return nvme_get_feature_timestamp(n, cmd);
> +        break;
>      default:
>          trace_nvme_err_invalid_getfeat(dw10);
>          return NVME_INVALID_FIELD | NVME_DNR;
> @@ -719,6 +802,31 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>      return NVME_SUCCESS;
>  }
>  
> +static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeCmd *cmd)
> +{
> +    uint16_t ret;
> +    uint64_t timestamp;
> +    uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> +    uint64_t prp1 = le64_to_cpu(cmd->prp1);
> +    uint64_t prp2 = le64_to_cpu(cmd->prp2);
> +
> +    if (!(n->oncs & NVME_ONCS_TIMESTAMP)) {

Any particular reason we want to sometimes not support this? Could we
just do with out this check?

> +        trace_nvme_err_invalid_setfeat(dw10);
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    ret = nvme_dma_write_prp(n, (uint8_t *)&timestamp,
> +                                sizeof(timestamp), prp1, prp2);
> +    if (ret != NVME_SUCCESS) {
> +        return ret;
> +    }
> +
> +    nvme_set_timestamp(n, le64_to_cpu(timestamp));
> +    trace_nvme_setfeat_timestamp(timestamp);
> +
> +    return NVME_SUCCESS;
> +}
> +
>  static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>  {
>      uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> @@ -735,6 +843,11 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
>          req->cqe.result =
>              cpu_to_le32((n->num_queues - 2) | ((n->num_queues - 2) << 16));
>          break;
> +
> +    case NVME_TIMESTAMP:
> +        return nvme_set_feature_timestamp(n, cmd);
> +        break;
> +
>      default:
>          trace_nvme_err_invalid_setfeat(dw10);
>          return NVME_INVALID_FIELD | NVME_DNR;
> @@ -907,6 +1020,8 @@ static int nvme_start_ctrl(NvmeCtrl *n)
>      nvme_init_sq(&n->admin_sq, n, n->bar.asq, 0, 0,
>          NVME_AQA_ASQS(n->bar.aqa) + 1);
>  
> +    nvme_set_timestamp(n, 0ULL);
> +
>      return 0;
>  }
>  
> @@ -1270,7 +1385,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>      id->sqes = (0x6 << 4) | 0x6;
>      id->cqes = (0x4 << 4) | 0x4;
>      id->nn = cpu_to_le32(n->num_namespaces);
> -    id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROS);
> +    id->oncs = cpu_to_le16(n->oncs);
>      id->psd[0].mp = cpu_to_le16(0x9c4);
>      id->psd[0].enlat = cpu_to_le32(0x10);
>      id->psd[0].exlat = cpu_to_le32(0x4);
> @@ -1350,6 +1465,7 @@ static Property nvme_props[] = {
>      DEFINE_PROP_STRING("serial", NvmeCtrl, serial),
>      DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, cmb_size_mb, 0),
>      DEFINE_PROP_UINT32("num_queues", NvmeCtrl, num_queues, 64),
> +    DEFINE_PROP_UINT16("oncs", NvmeCtrl, oncs, NVME_ONCS_WRITE_ZEROS),
>      DEFINE_PROP_END_OF_LIST(),
>  };

As before, could we just do without the `oncs` parameter for now?

>  
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 56c9d4b4b1..d7277e72b7 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -69,6 +69,7 @@ typedef struct NvmeCtrl {
>      uint16_t    max_prp_ents;
>      uint16_t    cqe_size;
>      uint16_t    sqe_size;
> +    uint16_t    oncs;
>      uint32_t    reg_size;
>      uint32_t    num_namespaces;
>      uint32_t    num_queues;
> @@ -79,6 +80,8 @@ typedef struct NvmeCtrl {
>      uint32_t    cmbloc;
>      uint8_t     *cmbuf;
>      uint64_t    irq_status;
> +    uint64_t    host_timestamp;                 /* Timestamp sent by the host */
> +    uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>  
>      char            *serial;
>      NvmeNamespace   *namespaces;
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index b92039a573..97a17838ed 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -46,6 +46,8 @@ nvme_identify_nslist(uint16_t ns) "identify namespace list, nsid=%"PRIu16""
>  nvme_getfeat_vwcache(const char* result) "get feature volatile write cache, result=%s"
>  nvme_getfeat_numq(int result) "get feature number of queues, result=%d"
>  nvme_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
> +nvme_setfeat_timestamp(uint64_t ts) "set feature timestamp = 0x%"PRIx64""
> +nvme_getfeat_timestamp(uint64_t ts) "get feature timestamp = 0x%"PRIx64""
>  nvme_mmio_intm_set(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask set, data=0x%"PRIx64", new_mask=0x%"PRIx64""
>  nvme_mmio_intm_clr(uint64_t data, uint64_t new_mask) "wrote MMIO, interrupt mask clr, data=0x%"PRIx64", new_mask=0x%"PRIx64""
>  nvme_mmio_cfg(uint64_t data) "wrote MMIO, config controller config=0x%"PRIx64""
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 849a6f3fa3..3ec8efcc43 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -581,6 +581,7 @@ enum NvmeIdCtrlOncs {
>      NVME_ONCS_WRITE_ZEROS   = 1 << 3,
>      NVME_ONCS_FEATURES      = 1 << 4,
>      NVME_ONCS_RESRVATIONS   = 1 << 5,
> +    NVME_ONCS_TIMESTAMP     = 1 << 6,
>  };
>  
>  #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
> @@ -622,6 +623,7 @@ enum NvmeFeatureIds {
>      NVME_INTERRUPT_VECTOR_CONF      = 0x9,
>      NVME_WRITE_ATOMICITY            = 0xa,
>      NVME_ASYNCHRONOUS_EVENT_CONF    = 0xb,
> +    NVME_TIMESTAMP                  = 0xe,
>      NVME_SOFTWARE_PROGRESS_MARKER   = 0x80
>  };
>  
> -- 
> 2.17.1
> 
> 

