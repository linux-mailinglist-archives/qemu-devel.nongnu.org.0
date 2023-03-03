Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79256A94A4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:59:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2BA-0007O2-1n; Fri, 03 Mar 2023 04:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pY2B6-0007Ng-5g
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:58:16 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pY2B3-0003xR-8s
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:58:15 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PSjvY1nl0z6J7p2;
 Fri,  3 Mar 2023 17:52:57 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 3 Mar
 2023 09:57:55 +0000
Date: Fri, 3 Mar 2023 09:57:54 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>, Michael Roth
 <michael.roth@amd.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Dave Jiang <dave.jiang@intel.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [PATCH v3 6/6] hw/cxl: Add clear poison mailbox command support.
Message-ID: <20230303095754.000061b5@Huawei.com>
In-Reply-To: <640147d2b67a4_46c602945@iweiny-mobl.notmuch>
References: <20230302101710.1652-1-Jonathan.Cameron@huawei.com>
 <20230302101710.1652-7-Jonathan.Cameron@huawei.com>
 <640147d2b67a4_46c602945@iweiny-mobl.notmuch>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Mar 2023 17:05:22 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> Jonathan Cameron wrote:
> > Current implementation is very simple so many of the corner
> > cases do not exist (e.g. fragmenting larger poison list entries)
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> > v2:
> > - Endian fix
> > ---
> >  hw/cxl/cxl-mailbox-utils.c  | 79 +++++++++++++++++++++++++++++++++++++
> >  hw/mem/cxl_type3.c          | 36 +++++++++++++++++
> >  include/hw/cxl/cxl_device.h |  1 +
> >  3 files changed, 116 insertions(+)
> > 
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index da8732a547..f2a339bedc 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -65,6 +65,7 @@ enum {
> >      MEDIA_AND_POISON = 0x43,
> >          #define GET_POISON_LIST        0x0
> >          #define INJECT_POISON          0x1
> > +        #define CLEAR_POISON           0x2
> >  };
> >  
> >  /* 8.2.8.4.5.1 Command Return Codes */
> > @@ -511,6 +512,82 @@ static CXLRetCode cmd_media_inject_poison(struct cxl_cmd *cmd,
> >      return CXL_MBOX_SUCCESS;
> >  }
> >  
> > +static CXLRetCode cmd_media_clear_poison(struct cxl_cmd *cmd,
> > +                                         CXLDeviceState *cxl_dstate,
> > +                                         uint16_t *len)
> > +{
> > +    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
> > +    CXLPoisonList *poison_list = &ct3d->poison_list;
> > +    CXLType3Class *cvc = CXL_TYPE3_GET_CLASS(ct3d);
> > +    struct clear_poison_pl {
> > +        uint64_t dpa;
> > +        uint8_t data[64];
> > +    };
> > +    CXLPoison *ent;
> > +    uint64_t dpa;
> > +
> > +    struct clear_poison_pl *in = (void *)cmd->payload;
> > +
> > +    dpa = ldq_le_p(&in->dpa);
> > +    if (dpa + 64 > cxl_dstate->mem_size) {
> > +        return CXL_MBOX_INVALID_PA;
> > +    }
> > +
> > +    QLIST_FOREACH(ent, poison_list, node) {  
> 
> Because you are removing from the list I think this needs to be
> QLIST_FOREACH_SAFE()? 
> 

I don't think we need it because we break immediately after the remove so the
list pointers are touched any more.

> > +        /*
> > +         * Test for contained in entry. Simpler than general case
> > +         * as clearing 64 bytes and entries 64 byte aligned
> > +         */
> > +        if ((dpa < ent->start) || (dpa >= ent->start + ent->length)) {
> > +            continue;
> > +        }
> > +        /* Do accounting early as we know one will go away */
> > +        ct3d->poison_list_cnt--;
> > +        if (dpa > ent->start) {
> > +            CXLPoison *frag;
> > +            if (ct3d->poison_list_cnt == CXL_POISON_LIST_LIMIT) {  
> 
> I'm still not seeing how this is ever going to be true with the above
> decrement?

Ah I'd missed the comment previously.
Agreed on this one.

> 
> > +                cxl_set_poison_list_overflowed(ct3d);
> > +                break;
> > +            }
> > +            frag = g_new0(CXLPoison, 1);
> > +
> > +            frag->start = ent->start;
> > +            frag->length = dpa - ent->start;
> > +            frag->type = ent->type;
> > +
> > +            QLIST_INSERT_HEAD(poison_list, frag, node);
> > +            ct3d->poison_list_cnt++;
> > +        }
> > +        if (dpa + 64 < ent->start + ent->length) {
> > +            CXLPoison *frag;
> > +
> > +            if (ct3d->poison_list_cnt == CXL_POISON_LIST_LIMIT) {  
> 
> Or this one.

This one however is needed but has another bug (sigh)
This is the hole punching case.  We are removing the middle
of an existing long entry.  As such we take one away and gain
2.  At this stage we've already gained one.

Whilst we know we are going to remove one element later, we will
still end up overflowing.   Not overflow is > CXL_POISON_LIST_LIMIT

The bug that is hiding here is that we have added an entry, but not
removed any yet. So if we break in this condition we are over by one.

The spec is silent on what should happen in this case (I think)
so best we can do is add the first new entry in place of the old
entry and just overflow for the second new entry.  


> 
> > +                cxl_set_poison_list_overflowed(ct3d);
> > +                break;

So no break here, and following code in an else.

> > +            }
> > +
> > +            frag = g_new0(CXLPoison, 1);
> > +
> > +            frag->start = dpa + 64;
> > +            frag->length = ent->start + ent->length - frag->start;
> > +            frag->type = ent->type;
> > +            QLIST_INSERT_HEAD(poison_list, frag, node);
> > +            ct3d->poison_list_cnt++;
> > +        }
> > +        /* Any fragments have been added, free original entry */
> > +        QLIST_REMOVE(ent, node);  
> 
> I think the decrement needs to happen here.

For the implementation this was meant to be (without the bug above)
we are cheating a little.  We 'could' take the entry off the list first
before working out if we need to add the entries in.  Thus ensuring we
remain below the list limit.  Instead we leave it on the list, add new
elements and drop it later.  To do that we need to briefly allow the
list to be one larger than it will be at the end of the code.
That's done by doing the decrement early so that the rest of the code
runs with a list that is one bigger than it appears to be.

> 
> > +        g_free(ent);
> > +        break;
> > +    }
> > +    /* Clearing a region with no poison is not an error so always do so */
> > +    if (cvc->set_cacheline)
> > +        if (!cvc->set_cacheline(ct3d, dpa, in->data)) {
> > +            return CXL_MBOX_INTERNAL_ERROR;
> > +        }
> > +
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +
> >  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> >  #define IMMEDIATE_DATA_CHANGE (1 << 2)
> >  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
> > @@ -542,6 +619,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
> >          cmd_media_get_poison_list, 16, 0 },
> >      [MEDIA_AND_POISON][INJECT_POISON] = { "MEDIA_AND_POISON_INJECT_POISON",
> >          cmd_media_inject_poison, 8, 0 },
> > +    [MEDIA_AND_POISON][CLEAR_POISON] = { "MEDIA_AND_POISON_CLEAR_POISON",
> > +        cmd_media_clear_poison, 72, 0 },
> >  };
> >  
> >  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > index 21e3a84785..44ffc7d9b0 100644
> > --- a/hw/mem/cxl_type3.c
> > +++ b/hw/mem/cxl_type3.c
> > @@ -919,6 +919,41 @@ static void set_lsa(CXLType3Dev *ct3d, const void *buf, uint64_t size,
> >       */
> >  }
> >  
> > +static bool set_cacheline(CXLType3Dev *ct3d, uint64_t dpa_offset, uint8_t *data)
> > +{
> > +    MemoryRegion *vmr = NULL, *pmr = NULL;
> > +    AddressSpace *as;
> > +
> > +    if (ct3d->hostvmem) {
> > +        vmr = host_memory_backend_get_memory(ct3d->hostvmem);
> > +    }
> > +    if (ct3d->hostpmem) {
> > +        pmr = host_memory_backend_get_memory(ct3d->hostpmem);
> > +    }
> > +
> > +    if (!vmr && !pmr) {
> > +        return false;
> > +    }
> > +
> > +    if (dpa_offset + 64 > int128_get64(ct3d->cxl_dstate.mem_size)) {
> > +        return false;
> > +    }
> > +
> > +    if (vmr) {
> > +        if (dpa_offset <= int128_get64(vmr->size)) {  
> 
> vmr->size - 64?
Copy and paste error. Until very recently this was broken in volatile patch
series and I'd missed code was duplicated here. Given they are 64 byte
aligned we can make this simply < int128_get64(vmr->size)

Thanks,

Jonathan


> Ira

