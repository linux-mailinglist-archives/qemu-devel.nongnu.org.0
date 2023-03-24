Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5916C820C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:01:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfi0L-0003W6-8s; Fri, 24 Mar 2023 10:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pfi0H-0003Vu-J7
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:02:49 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pfi04-0001n0-VN
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 10:02:49 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PjkP96639z6J7DP;
 Fri, 24 Mar 2023 22:00:13 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 24 Mar
 2023 14:01:35 +0000
Date: Fri, 24 Mar 2023 14:01:34 +0000
To: Fan Ni <fan.ni@samsung.com>
CC: Michael Tsirkin <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>, "Dave
 Jiang" <dave.jiang@intel.com>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>, Adam Manzanares <a.manzanares@samsung.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>
Subject: Re: [RESEND PATCH 2/2] hw/cxl: Fix incorrect reset of commit and
 associated clearing of committed.
Message-ID: <20230324140134.00006952@Huawei.com>
In-Reply-To: <20230322162120.GA1641485@bgt-140510-bm03>
References: <20230322102731.4219-1-Jonathan.Cameron@huawei.com>
 <CGME20230322103301uscas1p1fec17ee01b4fac9aaa8669f9c5d87e6a@uscas1p1.samsung.com>
 <20230322103300.4278-1-Jonathan.Cameron@huawei.com>
 <20230322162120.GA1641485@bgt-140510-bm03>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 22 Mar 2023 16:21:26 +0000
Fan Ni <fan.ni@samsung.com> wrote:

> On Wed, Mar 22, 2023 at 10:33:00AM +0000, Jonathan Cameron wrote:
> > The hardware clearing the commit bit is not spec compliant.
> > Clearing of committed bit when commit is cleared is not specifically
> > stated in the CXL spec, but is the expected (and simplest) permitted
> > behaviour so use that for QEMU emulation.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---  
> 
> Reviewed-by: Fan Ni <fan.ni@samsung.com>
> Tested-by: Fan Ni <fan.ni@samsung.com>
> 
> 
> The patch passed the tests as shown in previous mailing list discussion:
> https://lore.kernel.org/linux-cxl/640276695c8e8_5b27929473@dwillia2-xfh.jf.intel.com.notmuch/T/#m0afcfc21d68c84c07f2e9e3194f587c2ffa82d6d
> The following two topologies are tested:
> 1. one HB with one root port and a direct attached memdev.
> 2. one HB with 2 root ports and a memdev is directly attached to a CXL switch
> which is attached to one root port.
> 
> One minor thing below.
> 
> >  hw/cxl/cxl-component-utils.c |  6 +++++-
> >  hw/mem/cxl_type3.c           | 21 ++++++++++++++++++++-
> >  2 files changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> > index a3e6cf75cf..378f1082ce 100644
> > --- a/hw/cxl/cxl-component-utils.c
> > +++ b/hw/cxl/cxl-component-utils.c
> > @@ -38,19 +38,23 @@ static void dumb_hdm_handler(CXLComponentState *cxl_cstate, hwaddr offset,
> >      ComponentRegisters *cregs = &cxl_cstate->crb;
> >      uint32_t *cache_mem = cregs->cache_mem_registers;
> >      bool should_commit = false;
> > +    bool should_uncommit = false;
> >  
> >      switch (offset) {
> >      case A_CXL_HDM_DECODER0_CTRL:
> >          should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
> > +        should_uncommit = !should_commit;  
> This will cause committed always reset if COMMIT is 0, not only
> 1->0. No issue for now, just point out to make sure it is what we
> want.

True.  However I think it's harmless.

We will want to be a little careful if uncommitting gains other
functionality in future though.

Note that the same potential corner existing on the commit side of things.
Trying to commit a decoder that is already committed will call the code
for commit (also currently harmless)

I'm not particularly keen to introduce additional complexity to separate
out these cases until / if we ever need it.

Jonathan

> >          break;
> >      default:
> >          break;
> >      }
> >  
> >      if (should_commit) {
> > -        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> >          value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
> >          value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> > +    } else if (should_uncommit) {
> > +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, ERR, 0);
> > +        value = FIELD_DP32(value, CXL_HDM_DECODER0_CTRL, COMMITTED, 0);
> >      }
> >      stl_le_p((uint8_t *)cache_mem + offset, value);
> >  }
> > diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> > index 846089ccda..9598d584ac 100644
> > --- a/hw/mem/cxl_type3.c
> > +++ b/hw/mem/cxl_type3.c
> > @@ -320,13 +320,28 @@ static void hdm_decoder_commit(CXLType3Dev *ct3d, int which)
> >  
> >      ctrl = ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
> >      /* TODO: Sanity checks that the decoder is possible */
> > -    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT, 0);
> >      ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
> >      ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
> >  
> >      stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
> >  }
> >  
> > +static void hdm_decoder_uncommit(CXLType3Dev *ct3d, int which)
> > +{
> > +    ComponentRegisters *cregs = &ct3d->cxl_cstate.crb;
> > +    uint32_t *cache_mem = cregs->cache_mem_registers;
> > +    uint32_t ctrl;
> > +
> > +    assert(which == 0);
> > +
> > +    ctrl = ldl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL);
> > +
> > +    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, ERR, 0);
> > +    ctrl = FIELD_DP32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED, 0);
> > +
> > +    stl_le_p(cache_mem + R_CXL_HDM_DECODER0_CTRL, ctrl);
> > +}
> > +
> >  static int ct3d_qmp_uncor_err_to_cxl(CxlUncorErrorType qmp_err)
> >  {
> >      switch (qmp_err) {
> > @@ -395,6 +410,7 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
> >      CXLType3Dev *ct3d = container_of(cxl_cstate, CXLType3Dev, cxl_cstate);
> >      uint32_t *cache_mem = cregs->cache_mem_registers;
> >      bool should_commit = false;
> > +    bool should_uncommit = false;
> >      int which_hdm = -1;
> >  
> >      assert(size == 4);
> > @@ -403,6 +419,7 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
> >      switch (offset) {
> >      case A_CXL_HDM_DECODER0_CTRL:
> >          should_commit = FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMIT);
> > +        should_uncommit = !should_commit;
> >          which_hdm = 0;
> >          break;
> >      case A_CXL_RAS_UNC_ERR_STATUS:
> > @@ -489,6 +506,8 @@ static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
> >      stl_le_p((uint8_t *)cache_mem + offset, value);
> >      if (should_commit) {
> >          hdm_decoder_commit(ct3d, which_hdm);
> > +    } else if (should_uncommit) {
> > +        hdm_decoder_uncommit(ct3d, which_hdm);
> >      }
> >  }
> >  
> > -- 
> > 2.37.2
> >  


