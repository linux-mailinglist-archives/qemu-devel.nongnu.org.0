Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7076C479B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevic-0004yp-ST; Wed, 22 Mar 2023 06:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1peviR-0004wB-7e
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:29:11 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1peviP-0007Iy-EJ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:29:10 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PhPn36Szhz6J7B4;
 Wed, 22 Mar 2023 18:27:51 +0800 (CST)
Received: from localhost (10.126.171.74) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 22 Mar
 2023 10:29:06 +0000
Date: Wed, 22 Mar 2023 10:29:05 +0000
To: Fan Ni <fan.ni@samsung.com>
CC: Michael Tsirkin <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>, "Dave
 Jiang" <dave.jiang@intel.com>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH 1/2] hw/cxl: Fix endian handling for decoder commit.
Message-ID: <20230322102905.00005167@Huawei.com>
In-Reply-To: <20230321192754.GA1621435@bgt-140510-bm03>
References: <20230321180012.2545-1-Jonathan.Cameron@huawei.com>
 <CGME20230321180043uscas1p26987d1a0d16fb69a44a0631bfc4c1eb9@uscas1p2.samsung.com>
 <20230321180012.2545-2-Jonathan.Cameron@huawei.com>
 <20230321192754.GA1621435@bgt-140510-bm03>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.171.74]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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

On Tue, 21 Mar 2023 19:28:02 +0000
Fan Ni <fan.ni@samsung.com> wrote:

> On Tue, Mar 21, 2023 at 06:00:11PM +0000, Jonathan Cameron wrote:
> > Not a real problem yet as all supported architectures are
> > little endian, but continue to tidy these up when touching
> > code for other reasons.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> Hi Jonathan,
> Did you forget to send the other patch in this series by any chance?

No. All 3 emails went out, but not all seem to have made it to the lists.
I have them via an internal reflector so maybe a Huawei network glitch.
Odd. I'll try a resend.  Thanks for pointing this out!

Jonathan

> 
> Fan
> > ---
> >  hw/cxl/cxl-component-utils.c | 10 ++++------
> >  hw/mem/cxl_type3.c           |  9 ++++++---
> >  2 files changed, 10 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> > index b665d4f565..a3e6cf75cf 100644
> > --- a/hw/cxl/cxl-component-utils.c
> > +++ b/hw/cxl/cxl-component-utils.c
> > @@ -47,14 +47,12 @@ static void dumb_hdm_handler(CXLComponentState *cxl_cstate, hwaddr offset,
> >          break;
> >      }
> >  
> > -    memory_region_transaction_begin();
> > -    stl_le_p((uint8_t *)cache_mem + offset, value);
> >      if (should_commit) {
> > -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> > -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
> > -        ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> > +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> > +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
> > +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> >      }
> > -    memory_region_transaction_commit();
> > +    stl_le_p((uint8_t *)cache_mem + offset, value);
> >  }
> >  
> >  static void cxl_cache_mem_write_reg(void *opaque, hwaddr offset, uint64_t value,
> > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > index abe60b362c..846089ccda 100644
> > --- a/hw/mem/cxl_type3.c
> > +++ b/hw/mem/cxl_type3.c
> > @@ -314,14 +314,17 @@ static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
> >  {
> >      ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
> >      uint32_t *cache_mem = cregs->cache_mem_registers;
> > +    uint32_t ctrl;
> >  
> >      assert(which == 0);
> >  
> > +    ctrl = ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
> >      /* TODO: Sanity checks that the decoder is possible */
> > -    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> > -    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, ERR, 0);
> > +    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> > +    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
> > +    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> >  
> > -    ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> > +    stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
> >  }
> >  
> >  static int ct3d_qmp_uncor_err_to_cxl(CxlUncorErrorType qmp_err)
> > -- 
> > 2.37.2
> >  


