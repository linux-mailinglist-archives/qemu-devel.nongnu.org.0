Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E26A455A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWewY-0005m7-EX; Mon, 27 Feb 2023 09:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWewV-0005lJ-6M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:57:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pWewR-0002xG-C8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:57:30 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PQNrb5gfWz6J7CH;
 Mon, 27 Feb 2023 22:57:19 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 27 Feb
 2023 14:57:23 +0000
Date: Mon, 27 Feb 2023 14:57:22 +0000
To: Ira Weiny <ira.weiny@intel.com>
CC: <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>, Ben Widawsky
 <bwidawsk@kernel.org>, <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>,
 Gregory Price <gourry.memverge@gmail.com>, Philippe =?ISO-8859-1?Q?Mathie?=
 =?ISO-8859-1?Q?u-Daud=E9?= <philmd@linaro.org>, Mike Maslenkin
 <mike.maslenkin@gmail.com>, Markus Armbruster <armbru@redhat.com>, "Dave
 Jiang" <dave.jiang@intel.com>, <alison.schofield@intel.com>
Subject: Re: [PATCH 5/6] hw/cxl: Add poison injection via the mailbox.
Message-ID: <20230227145722.000049f2@huawei.com>
In-Reply-To: <63f56d49deb1f_1dc7bb29489@iweiny-mobl.notmuch>
References: <20230217181812.26995-1-Jonathan.Cameron@huawei.com>
 <20230217181812.26995-6-Jonathan.Cameron@huawei.com>
 <63f56d49deb1f_1dc7bb29489@iweiny-mobl.notmuch>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 21 Feb 2023 17:18:01 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> Jonathan Cameron wrote:
> > Very simple implementation to allow testing of corresponding
> > kernel code. Note that for now we track each 64 byte section
> > independently.  Whilst a valid implementation choice, it may
> > make sense to fuse entries so as to prove out more complex
> > corners of the kernel code.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  hw/cxl/cxl-mailbox-utils.c | 40 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> > diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
> > index cf3cfb10a1..7d3f7bcd3a 100644
> > --- a/hw/cxl/cxl-mailbox-utils.c
> > +++ b/hw/cxl/cxl-mailbox-utils.c
> > @@ -64,6 +64,7 @@ enum {
> >          #define SET_LSA       0x3
> >      MEDIA_AND_POISON = 0x43,
> >          #define GET_POISON_LIST        0x0
> > +        #define INJECT_POISON          0x1
> >  };
> >  
> >  struct cxl_cmd;
> > @@ -436,6 +437,43 @@ static CXLRetCode cmd_media_get_poison_list(struct cxl_cmd *cmd,
> >      return CXL_MBOX_SUCCESS;
> >  }
> >  
> > +static CXLRetCode cmd_media_inject_poison(struct cxl_cmd *cmd,
> > +                                          CXLDeviceState *cxl_dstate,
> > +                                          uint16_t *len)
> > +{
> > +    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
> > +    CXLPoisonList *poison_list = &ct3d->poison_list;
> > +    CXLPoison *ent;
> > +    struct inject_poison_pl {
> > +        uint64_t dpa;
> > +    };
> > +    struct inject_poison_pl *in = (void *)cmd->payload;
> > +    CXLPoison *p;
> > +
> > +    QLIST_FOREACH(ent, poison_list, node) {
> > +        if (ent->start == in->dpa && ent->length == 64) {  
> 
> How does this interact with the QMP inject poison?  Should this be
> checking the range of the entries?

Good question and this implementation is definitely not right.
Having looked at the spec I'm not entirely sure what happens wrt
to the poison list if there is overlap. It leaves things less
sharply defined than I'd like.

The inject poison command calls out that it is not an error to inject poison
into a DPA that already has poison present - so a range match would
make more sense than what is here - I'll fix that.

It also calls out that the device "shall add a the new physical
address to the device's poison list and error source shall be set to an
injected event".

What it doesn't say is what should it do if there is already an entry
for a different poison type.  Should we update the type?  That's
nasty as it could lead to list overflow by turning one region into 2 or
3.

I guess no one really cares that much on the precise detail of poison
injection hence the spec is a little vague.

Anyhow, for now I'm thinking that if a range contains matches leave the
type alone is easy and I can't find anything to say that's not a valid
implementation choice.

As a side note, we don't yet have events support (that series is later in
the tree) so that fact injecting poison should add an entry to that isn't
happening.  I don't propose doing that until after the generic event injection
is done though as it will otherwise make that series more complex and
I doubt this is the only case we need to cover of these various error
reporting paths interacting.

Jonathan


> 
> Ira
> 
> > +            return CXL_MBOX_SUCCESS;
> > +        }
> > +    }
> > +
> > +    if (ct3d->poison_list_cnt == CXL_POISON_LIST_LIMIT) {
> > +        return CXL_MBOX_INJECT_POISON_LIMIT;
> > +    }
> > +    p = g_new0(CXLPoison, 1);
> > +
> > +    p->length = 64;
> > +    p->start = in->dpa;
> > +    p->type = CXL_POISON_TYPE_INJECTED;
> > +
> > +    /*
> > +     * Possible todo: Merge with existing entry if next to it and if same type
> > +     */
> > +    QLIST_INSERT_HEAD(poison_list, p, node);
> > +    ct3d->poison_list_cnt++;
> > +
> > +    return CXL_MBOX_SUCCESS;
> > +}
> > +
> >  #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
> >  #define IMMEDIATE_DATA_CHANGE (1 << 2)
> >  #define IMMEDIATE_POLICY_CHANGE (1 << 3)
> > @@ -465,6 +503,8 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
> >          ~0, IMMEDIATE_CONFIG_CHANGE | IMMEDIATE_DATA_CHANGE },
> >      [MEDIA_AND_POISON][GET_POISON_LIST] = { "MEDIA_AND_POISON_GET_POISON_LIST",
> >          cmd_media_get_poison_list, 16, 0 },
> > +    [MEDIA_AND_POISON][INJECT_POISON] = { "MEDIA_AND_POISON_INJECT_POISON",
> > +        cmd_media_inject_poison, 8, 0 },
> >  };
> >  
> >  void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
> > -- 
> > 2.37.2
> >   
> 
> 


