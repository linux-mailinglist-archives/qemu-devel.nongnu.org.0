Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97132136AF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 10:47:24 +0200 (CEST)
Received: from localhost ([::1]:56978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrHLv-0006i0-Js
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 04:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrHL9-0006E8-8b; Fri, 03 Jul 2020 04:46:35 -0400
Received: from charlie.dont.surf ([128.199.63.193]:53404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrHL6-0000Nb-DD; Fri, 03 Jul 2020 04:46:34 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 06B8DBF465;
 Fri,  3 Jul 2020 08:46:29 +0000 (UTC)
Date: Fri, 3 Jul 2020 10:46:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 11/18] hw/block/nvme: add remaining mandatory
 controller parameters
Message-ID: <20200703084626.xib465ie3vvladip@apples.localdomain>
References: <20200703063420.2241014-1-its@irrelevant.dk>
 <20200703063420.2241014-12-its@irrelevant.dk>
 <e2cbec3f-896e-fa17-2aac-2c82e0d6df60@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2cbec3f-896e-fa17-2aac-2c82e0d6df60@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:42:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul  3 10:31, Philippe Mathieu-Daudé wrote:
> On 7/3/20 8:34 AM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Add support for any remaining mandatory controller operating parameters
> > (features).
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > ---
> >  hw/block/nvme.c       | 39 +++++++++++++++++++++++++++++++++------
> >  hw/block/nvme.h       | 18 ++++++++++++++++++
> >  hw/block/trace-events |  2 ++
> >  include/block/nvme.h  |  7 +++++++
> >  4 files changed, 60 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index ba523f6768bf..affb9a967534 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1056,8 +1056,16 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >      uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> >      uint32_t dw11 = le32_to_cpu(cmd->cdw11);
> >      uint32_t result;
> > +    uint8_t fid = NVME_GETSETFEAT_FID(dw10);
> > +    uint16_t iv;
> >  
> > -    switch (dw10) {
> > +    trace_pci_nvme_getfeat(nvme_cid(req), fid, dw11);
> > +
> > +    if (!nvme_feature_support[fid]) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> > +    switch (fid) {
> >      case NVME_TEMPERATURE_THRESHOLD:
> >          result = 0;
> >  
> > @@ -1088,14 +1096,27 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >                               ((n->params.max_ioqpairs - 1) << 16));
> >          trace_pci_nvme_getfeat_numq(result);
> >          break;
> > +    case NVME_INTERRUPT_VECTOR_CONF:
> > +        iv = dw11 & 0xffff;
> > +        if (iv >= n->params.max_ioqpairs + 1) {
> > +            return NVME_INVALID_FIELD | NVME_DNR;
> > +        }
> > +
> > +        result = iv;
> > +        if (iv == n->admin_cq.vector) {
> > +            result |= NVME_INTVC_NOCOALESCING;
> > +        }
> > +
> > +        result = cpu_to_le32(result);
> > +        break;
> >      case NVME_ASYNCHRONOUS_EVENT_CONF:
> >          result = cpu_to_le32(n->features.async_config);
> >          break;
> >      case NVME_TIMESTAMP:
> >          return nvme_get_feature_timestamp(n, cmd);
> >      default:
> > -        trace_pci_nvme_err_invalid_getfeat(dw10);
> > -        return NVME_INVALID_FIELD | NVME_DNR;
> > +        result = cpu_to_le32(nvme_feature_default[fid]);
> 
> So here we expect uninitialized fid entries to return 0, right?
> 

Yes, if defaults are not 0 (like NVME_ARBITRATION), it is explicitly set.

> > +        break;
> >      }
> >  
> >      req->cqe.result = result;
> > @@ -1124,8 +1145,15 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >  {
> >      uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> >      uint32_t dw11 = le32_to_cpu(cmd->cdw11);
> > +    uint8_t fid = NVME_GETSETFEAT_FID(dw10);
> >  
> > -    switch (dw10) {
> > +    trace_pci_nvme_setfeat(nvme_cid(req), fid, dw11);
> > +
> > +    if (!nvme_feature_support[fid]) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> > +    switch (fid) {
> >      case NVME_TEMPERATURE_THRESHOLD:
> >          if (NVME_TEMP_TMPSEL(dw11) != NVME_TEMP_TMPSEL_COMPOSITE) {
> >              break;
> > @@ -1172,8 +1200,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >      case NVME_TIMESTAMP:
> >          return nvme_set_feature_timestamp(n, cmd);
> >      default:
> > -        trace_pci_nvme_err_invalid_setfeat(dw10);
> > -        return NVME_INVALID_FIELD | NVME_DNR;
> > +        return NVME_FEAT_NOT_CHANGEABLE | NVME_DNR;
> >      }
> >      return NVME_SUCCESS;
> >  }
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index f8940435f9ef..8ad1e3c89cee 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -87,6 +87,24 @@ typedef struct NvmeFeatureVal {
> >      uint32_t    async_config;
> >  } NvmeFeatureVal;
> >  
> > +static const uint32_t nvme_feature_default[0x100] = {
> > +    [NVME_ARBITRATION]           = NVME_ARB_AB_NOLIMIT,
> > +};
> > +
> > +static const bool nvme_feature_support[0x100] = {
> > +    [NVME_ARBITRATION]              = true,
> > +    [NVME_POWER_MANAGEMENT]         = true,
> > +    [NVME_TEMPERATURE_THRESHOLD]    = true,
> > +    [NVME_ERROR_RECOVERY]           = true,
> > +    [NVME_VOLATILE_WRITE_CACHE]     = true,
> > +    [NVME_NUMBER_OF_QUEUES]         = true,
> > +    [NVME_INTERRUPT_COALESCING]     = true,
> > +    [NVME_INTERRUPT_VECTOR_CONF]    = true,
> > +    [NVME_WRITE_ATOMICITY]          = true,
> > +    [NVME_ASYNCHRONOUS_EVENT_CONF]  = true,
> > +    [NVME_TIMESTAMP]                = true,
> > +};
> 
> Nack. No variable assignation in header please.
> Move that to the source file.
> 

Understood :)

> > +
> >  typedef struct NvmeCtrl {
> >      PCIDevice    parent_obj;
> >      MemoryRegion iomem;
> > diff --git a/hw/block/trace-events b/hw/block/trace-events
> > index 091af16ca7d7..42e62f4649f8 100644
> > --- a/hw/block/trace-events
> > +++ b/hw/block/trace-events
> > @@ -46,6 +46,8 @@ pci_nvme_identify_ctrl(void) "identify controller"
> >  pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
> >  pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
> >  pci_nvme_get_log(uint16_t cid, uint8_t lid, uint8_t lsp, uint8_t rae, uint32_t len, uint64_t off) "cid %"PRIu16" lid 0x%"PRIx8" lsp 0x%"PRIx8" rae 0x%"PRIx8" len %"PRIu32" off %"PRIu64""
> > +pci_nvme_getfeat(uint16_t cid, uint8_t fid, uint32_t cdw11) "cid %"PRIu16" fid 0x%"PRIx8" cdw11 0x%"PRIx32""
> > +pci_nvme_setfeat(uint16_t cid, uint8_t fid, uint32_t cdw11) "cid %"PRIu16" fid 0x%"PRIx8" cdw11 0x%"PRIx32""
> >  pci_nvme_getfeat_vwcache(const char* result) "get feature volatile write cache, result=%s"
> >  pci_nvme_getfeat_numq(int result) "get feature number of queues, result=%d"
> >  pci_nvme_setfeat_numq(int reqcq, int reqsq, int gotcq, int gotsq) "requested cq_count=%d sq_count=%d, responding with cq_count=%d sq_count=%d"
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index 0dce15af6bcf..406648d4cf94 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -662,6 +662,7 @@ enum NvmeStatusCodes {
> >      NVME_FW_REQ_RESET           = 0x010b,
> >      NVME_INVALID_QUEUE_DEL      = 0x010c,
> >      NVME_FID_NOT_SAVEABLE       = 0x010d,
> > +    NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
> >      NVME_FID_NOT_NSID_SPEC      = 0x010f,
> >      NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
> >      NVME_CONFLICTING_ATTRS      = 0x0180,
> > @@ -866,6 +867,7 @@ enum NvmeIdCtrlLpa {
> >  #define NVME_CTRL_SGLS_ADDR_OFFSET         (0x1 << 20)
> >  
> >  #define NVME_ARB_AB(arb)    (arb & 0x7)
> > +#define NVME_ARB_AB_NOLIMIT 0x7
> >  #define NVME_ARB_LPW(arb)   ((arb >> 8) & 0xff)
> >  #define NVME_ARB_MPW(arb)   ((arb >> 16) & 0xff)
> >  #define NVME_ARB_HPW(arb)   ((arb >> 24) & 0xff)
> > @@ -873,6 +875,8 @@ enum NvmeIdCtrlLpa {
> >  #define NVME_INTC_THR(intc)     (intc & 0xff)
> >  #define NVME_INTC_TIME(intc)    ((intc >> 8) & 0xff)
> >  
> > +#define NVME_INTVC_NOCOALESCING (0x1 << 16)
> > +
> >  #define NVME_TEMP_THSEL(temp)  ((temp >> 20) & 0x3)
> >  #define NVME_TEMP_THSEL_OVER   0x0
> >  #define NVME_TEMP_THSEL_UNDER  0x1
> > @@ -902,6 +906,9 @@ enum NvmeFeatureIds {
> >      NVME_SOFTWARE_PROGRESS_MARKER   = 0x80
> >  };
> >  
> > +#define NVME_GETSETFEAT_FID_MASK 0xff
> > +#define NVME_GETSETFEAT_FID(dw10) (dw10 & NVME_GETSETFEAT_FID_MASK)
> > +
> >  typedef struct NvmeRangeType {
> >      uint8_t     type;
> >      uint8_t     attributes;
> > 
> 

