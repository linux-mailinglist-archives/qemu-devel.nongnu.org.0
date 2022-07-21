Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6657CDE0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:39:40 +0200 (CEST)
Received: from localhost ([::1]:36022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXL1-00019C-Bl
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oEXIj-0005wP-Nu
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:37:17 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oEXIh-0002D6-B4
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:37:17 -0400
Received: from fraeml702-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LpZnB5Xqhz6J6Ct;
 Thu, 21 Jul 2022 22:33:34 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml702-chm.china.huawei.com (10.206.15.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Thu, 21 Jul 2022 16:37:04 +0200
Received: from localhost (10.122.247.231) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Jul
 2022 15:37:03 +0100
Date: Thu, 21 Jul 2022 15:37:01 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, <qemu-devel@nongnu.org>, "Ben
 Widawsky" <ben.widawsky@intel.com>
Subject: Re: [PULL v2 35/86] cxl/cxl-host: Add memops for CFMWS region.
Message-ID: <20220721153701.00003d7d@huawei.com>
In-Reply-To: <CAFEAcA-KLShEbe8mYa+WGBgSNpZMbGv=syHqbSwyTtfoTEXAyQ@mail.gmail.com>
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-36-mst@redhat.com>
 <CAFEAcA-KLShEbe8mYa+WGBgSNpZMbGv=syHqbSwyTtfoTEXAyQ@mail.gmail.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Wed, 20 Jul 2022 13:23:10 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 16 May 2022 at 21:52, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> >
> > These memops perform interleave decoding, walking down the
> > CXL topology from CFMWS described host interleave
> > decoder via CXL host bridge HDM decoders, through the CXL
> > root ports and finally call CXL type 3 specific read and write
> > functions.
> >
> > Note that, whilst functional the current implementation does
> > not support:
> > * switches
> > * multiple HDM decoders at a given level.
> > * unaligned accesses across the interleave boundaries  
> 
> Hi; Coverity reports a bug in this code (CID 1488873):

Huh. This looks to be one of those cases where a bunch of different
bugs ended up with something that appears to work.

> 
> > +/* TODO: support, multiple hdm decoders */
> > +static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
> > +                                uint8_t *target)
> > +{
> > +    uint32_t ctrl;
> > +    uint32_t ig_enc;
> > +    uint32_t iw_enc;
> > +    uint32_t target_reg;  
> 
> target_reg is 32 bits...
> 
> > +    uint32_t target_idx;
> > +
> > +    ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
> > +    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
> > +        return false;
> > +    }
> > +
> > +    ig_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);
> > +    iw_enc = FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IW);
> > +    target_idx = (addr / cxl_decode_ig(ig_enc)) % (1 << iw_enc);
> > +
> > +    if (target_idx > 4) {  
> 
> ...in this half of the if() target_idx is at least 5...
> 
> > +        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];
> > +        target_reg >>= target_idx * 8;  
> 
> ...but 5 * 8 is 40, so this shift will always be undefined
> behaviour. Was the if() condition intended to be "< 4" ?

Spot on.
> 
> > +    } else {
> > +        target_reg = cache_mem[R_CXL_HDM_DECODER0_TARGET_LIST_LO];  
> 
> Was this (or the other one) intended to be ...LIST_HI ?
>
Also correct.
 
> > +        target_reg >>= (target_idx - 4) * 8;  
> 
> Not noticed by Coverity, but in this half of the if(),
> target_idx is 4 or less, so (target_idx - 4) is in most
> cases going to be negative, which isn't a valid shift amount.
> This also suggests the if() condition is wrong.
> 
> > +    }
> > +    *target = target_reg & 0xff;
> > +
> > +    return true;
> > +}  
> 
> What's the intended behaviour here ?
> 
> The code appears to be attempting to extract a particular
> subfield from one or other of the cache_mem[] values.

The two registers each have 4 target port numbers stored
in them. This was supposed to get the right one.  Tests weren't
exercising greater than 4 as that requires a very flat hierarchy
and doesn't exercise some other paths as can't interleave so
wide at multiple levels. Oh well, clearly need
an extra test.

> I would
> recommend using extract32() for this rather than raw shift
> and mask operations -- it's generally easier to write and
> to review.

Will do.

Unfortunately I've run into an issue testing with
a single host bridge and 8 root ports. Need to pin down if it
is a kernel or qemu issue before sending out this fix.  I'm away for the
next week though so may have to get back to this after returning.

Sorry for the delay.

Thanks,

Jonathan

> 
> thanks
> -- PMM


