Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B219256A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 11:23:18 +0100 (CET)
Received: from localhost ([::1]:33434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jH3Bt-00045u-Hd
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 06:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jH3AZ-0002bH-BA
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:21:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jH3AV-0001bJ-QA
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:21:55 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:40563)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jH3AV-0001ag-Kx
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 06:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585131711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQjXmNK8GWwb0R+tUBvrXAmq6wPqNv/gPP9U8z4NueE=;
 b=gGiCIxRu8ldno47t8osueH9zgfa3PMGPDAJbaGpIkKR+pINAgdx+R4Do7Y7XanXBZVJ/vH
 1mNGecFaWqrUf22BzJdOmOQUYxS/baLFX0njwKCFyzoH3+o1d7bGQcYjscZN6J9DVsJ5IY
 96LFbluHh5BLG8u2rcl1AITvECXmY+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-LWF07UlqPvixBbRZEGoOrQ-1; Wed, 25 Mar 2020 06:21:47 -0400
X-MC-Unique: LWF07UlqPvixBbRZEGoOrQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A488014DB;
 Wed, 25 Mar 2020 10:21:46 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA0749CA3;
 Wed, 25 Mar 2020 10:21:43 +0000 (UTC)
Message-ID: <b2d4ccb0914da1d7fc172218b16b400dbc0c1dfd.camel@redhat.com>
Subject: Re: [PATCH v5 09/26] nvme: add temperature threshold feature
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Birkelund Jensen <its@irrelevant.dk>
Date: Wed, 25 Mar 2020 12:21:42 +0200
In-Reply-To: <20200316074437.uwrzruxpw7vfcwbt@apples.localdomain>
References: <20200204095208.269131-1-k.jensen@samsung.com>
 <CGME20200204095221eucas1p1d5b1c9578d79e6bcc5714976bbe7dc11@eucas1p1.samsung.com>
 <20200204095208.269131-10-k.jensen@samsung.com>
 <9d2f45a97cce33a548ed98843e06b299b89b30e3.camel@redhat.com>
 <20200316074437.uwrzruxpw7vfcwbt@apples.localdomain>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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

On Mon, 2020-03-16 at 00:44 -0700, Klaus Birkelund Jensen wrote:
> On Feb 12 11:31, Maxim Levitsky wrote:
> > On Tue, 2020-02-04 at 10:51 +0100, Klaus Jensen wrote:
> > > It might seem wierd to implement this feature for an emulated device,
> > > but it is mandatory to support and the feature is useful for testing
> > > asynchronous event request support, which will be added in a later
> > > patch.
> > 
> > Absolutely but as the old saying is, rules are rules.
> > At least, to the defense of the spec, making this mandatory
> > forced the vendors to actually report some statistics about
> > the device in neutral format as opposed to yet another
> > vendor proprietary thing (I am talking about SMART log page).
> > 
> > > 
> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > 
> > I noticed that you sign off some patches with your @samsung.com email,
> > and some with @cnexlabs.com
> > Is there a reason for that?
> 
> Yeah. Some of this code was made while I was at CNEX Labs. I've since
> moved to Samsung. But credit where credit's due.
I suspected something like that, but I just wanted to be sure that this is intentional,
and it looks all right to me now.

> 
> > 
> > 
> > > ---
> > >  hw/block/nvme.c      | 50 ++++++++++++++++++++++++++++++++++++++++++++
> > >  hw/block/nvme.h      |  2 ++
> > >  include/block/nvme.h |  7 ++++++-
> > >  3 files changed, 58 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 81514eaef63a..f72348344832 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -45,6 +45,9 @@
> > >  
> > >  #define NVME_SPEC_VER 0x00010201
> > >  #define NVME_MAX_QS PCI_MSIX_FLAGS_QSIZE
> > > +#define NVME_TEMPERATURE 0x143
> > > +#define NVME_TEMPERATURE_WARNING 0x157
> > > +#define NVME_TEMPERATURE_CRITICAL 0x175
> > >  
> > >  #define NVME_GUEST_ERR(trace, fmt, ...) \
> > >      do { \
> > > @@ -798,9 +801,31 @@ static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeCmd *cmd)
> > >  static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> > >  {
> > >      uint32_t dw10 = le32_to_cpu(cmd->cdw10);
> > > +    uint32_t dw11 = le32_to_cpu(cmd->cdw11);
> > >      uint32_t result;
> > >  
> > >      switch (dw10) {
> > > +    case NVME_TEMPERATURE_THRESHOLD:
> > > +        result = 0;
> > > +
> > > +        /*
> > > +         * The controller only implements the Composite Temperature sensor, so
> > > +         * return 0 for all other sensors.
> > > +         */
> > > +        if (NVME_TEMP_TMPSEL(dw11)) {
> > > +            break;
> > > +        }
> > > +
> > > +        switch (NVME_TEMP_THSEL(dw11)) {
> > > +        case 0x0:
> > > +            result = cpu_to_le16(n->features.temp_thresh_hi);
> > > +            break;
> > > +        case 0x1:
> > > +            result = cpu_to_le16(n->features.temp_thresh_low);
> > > +            break;
> > > +        }
> > > +
> > > +        break;
> > >      case NVME_VOLATILE_WRITE_CACHE:
> > >          result = blk_enable_write_cache(n->conf.blk);
> > >          trace_nvme_dev_getfeat_vwcache(result ? "enabled" : "disabled");
> > > @@ -845,6 +870,23 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> > >      uint32_t dw11 = le32_to_cpu(cmd->cdw11);
> > >  
> > >      switch (dw10) {
> > > +    case NVME_TEMPERATURE_THRESHOLD:
> > > +        if (NVME_TEMP_TMPSEL(dw11)) {
> > > +            break;
> > > +        }
> > > +
> > > +        switch (NVME_TEMP_THSEL(dw11)) {
> > > +        case 0x0:
> > > +            n->features.temp_thresh_hi = NVME_TEMP_TMPTH(dw11);
> > > +            break;
> > > +        case 0x1:
> > > +            n->features.temp_thresh_low = NVME_TEMP_TMPTH(dw11);
> > > +            break;
> > > +        default:
> > > +            return NVME_INVALID_FIELD | NVME_DNR;
> > > +        }
> > > +
> > > +        break;
> > >      case NVME_VOLATILE_WRITE_CACHE:
> > >          blk_set_enable_write_cache(n->conf.blk, dw11 & 1);
> > >          break;
> > > @@ -1366,6 +1408,9 @@ static void nvme_init_state(NvmeCtrl *n)
> > >      n->namespaces = g_new0(NvmeNamespace, n->num_namespaces);
> > >      n->sq = g_new0(NvmeSQueue *, n->params.num_queues);
> > >      n->cq = g_new0(NvmeCQueue *, n->params.num_queues);
> > > +
> > > +    n->temperature = NVME_TEMPERATURE;
> > 
> > This appears not to be used in the patch.
> > I think you should move that to the next patch that
> > adds the get log page support.
> > 
> 
> Fixed.
Thanks
> 
> > > +    n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
> > >  }
> > >  
> > >  static void nvme_init_cmb(NvmeCtrl *n, PCIDevice *pci_dev)
> > > @@ -1447,6 +1492,11 @@ static void nvme_init_ctrl(NvmeCtrl *n)
> > >      id->acl = 3;
> > >      id->frmw = 7 << 1;
> > >      id->lpa = 1 << 0;
> > > +
> > > +    /* recommended default value (~70 C) */
> > > +    id->wctemp = cpu_to_le16(NVME_TEMPERATURE_WARNING);
> > > +    id->cctemp = cpu_to_le16(NVME_TEMPERATURE_CRITICAL);
> > > +
> > >      id->sqes = (0x6 << 4) | 0x6;
> > >      id->cqes = (0x4 << 4) | 0x4;
> > >      id->nn = cpu_to_le32(n->num_namespaces);
> > > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > > index a867bdfabafd..1518f32557a3 100644
> > > --- a/hw/block/nvme.h
> > > +++ b/hw/block/nvme.h
> > > @@ -108,6 +108,7 @@ typedef struct NvmeCtrl {
> > >      uint64_t    irq_status;
> > >      uint64_t    host_timestamp;                 /* Timestamp sent by the host */
> > >      uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
> > > +    uint16_t    temperature;
> > >  
> > >      NvmeNamespace   *namespaces;
> > >      NvmeSQueue      **sq;
> > > @@ -115,6 +116,7 @@ typedef struct NvmeCtrl {
> > >      NvmeSQueue      admin_sq;
> > >      NvmeCQueue      admin_cq;
> > >      NvmeIdCtrl      id_ctrl;
> > > +    NvmeFeatureVal  features;
> > >  } NvmeCtrl;
> > >  
> > >  static inline uint64_t nvme_ns_nlbas(NvmeCtrl *n, NvmeNamespace *ns)
> > > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > > index d2f65e8fe496..ff31cb32117c 100644
> > > --- a/include/block/nvme.h
> > > +++ b/include/block/nvme.h
> > > @@ -616,7 +616,8 @@ enum NvmeIdCtrlOncs {
> > >  typedef struct NvmeFeatureVal {
> > >      uint32_t    arbitration;
> > >      uint32_t    power_mgmt;
> > > -    uint32_t    temp_thresh;
> > > +    uint16_t    temp_thresh_hi;
> > > +    uint16_t    temp_thresh_low;
> > >      uint32_t    err_rec;
> > >      uint32_t    volatile_wc;
> > >      uint32_t    num_queues;
> > > @@ -635,6 +636,10 @@ typedef struct NvmeFeatureVal {
> > >  #define NVME_INTC_THR(intc)     (intc & 0xff)
> > >  #define NVME_INTC_TIME(intc)    ((intc >> 8) & 0xff)
> > >  
> > > +#define NVME_TEMP_THSEL(temp)  ((temp >> 20) & 0x3)
> > > +#define NVME_TEMP_TMPSEL(temp) ((temp >> 16) & 0xf)
> > > +#define NVME_TEMP_TMPTH(temp)  (temp & 0xffff)
> > > +
> > >  enum NvmeFeatureIds {
> > >      NVME_ARBITRATION                = 0x1,
> > >      NVME_POWER_MANAGEMENT           = 0x2,
> > 
> > 
> > Best regards,
> > 	Maxim Levitsky
> > 
> 
> 

Best regards,
	Maxim Levitsky






