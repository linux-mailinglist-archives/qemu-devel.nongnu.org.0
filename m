Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458E5403DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 18:38:45 +0200 (CEST)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nycE7-0005Ch-Oo
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 12:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nycCh-0004V3-CF
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:37:16 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nycCd-0001rH-UK
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:37:15 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LHbZg0GGjz6817f;
 Wed,  8 Jun 2022 00:35:55 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Tue, 7 Jun 2022 18:37:06 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 7 Jun
 2022 17:37:04 +0100
Date: Tue, 7 Jun 2022 17:37:02 +0100
To: Ben Widawsky <bwidawsk@kernel.org>
CC: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "Adam
 Manzanares" <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3] hw/cxl: Fix missing write mask for HDM decoder
 target list registers
Message-ID: <20220607173702.00005ccf@Huawei.com>
In-Reply-To: <20220607161928.364mrju2mvzcvs56@bwidawsk-mobl5>
References: <20220607160747.21084-1-Jonathan.Cameron@huawei.com>
 <20220607161928.364mrju2mvzcvs56@bwidawsk-mobl5>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Tue, 7 Jun 2022 09:19:28 -0700
Ben Widawsky <bwidawsk@kernel.org> wrote:

> On 22-06-07 17:07:47, Jonathan Cameron wrote:
> > Without being able to write these registers, no interleaving is possible.
> > More refined checks of HDM register state on commit to follow.
> > 
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> > v3: Actually pass the parameter to the call...
> > v2: (Ben Widawsky)
> > - Correctly set a tighter write mask for the endpoint devices where this
> >   register has a different use.
> >   
> >  hw/cxl/cxl-component-utils.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> > index 7985c9bfca..2208284ee6 100644
> > --- a/hw/cxl/cxl-component-utils.c
> > +++ b/hw/cxl/cxl-component-utils.c
> > @@ -154,7 +154,8 @@ static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
> >      reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
> >  }
> >  
> > -static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
> > +static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,
> > +                            enum reg_type type)
> >  {
> >      int decoder_count = 1;
> >      int i;
> > @@ -174,6 +175,12 @@ static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
> >          write_msk[R_CXL_HDM_DECODER0_SIZE_LO + i * 0x20] = 0xf0000000;
> >          write_msk[R_CXL_HDM_DECODER0_SIZE_HI + i * 0x20] = 0xffffffff;
> >          write_msk[R_CXL_HDM_DECODER0_CTRL + i * 0x20] = 0x13ff;
> > +        if (type == CXL2_DEVICE) {
> > +            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xf0000000;
> > +        } else {
> > +            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xffffffff;
> > +        }
> > +        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_HI + i * 0x20] = 0xffffffff;  
> 
> Should it be (type == CXL2_DEVICE || type == CXL2_TYPE3_DEVICE) ?

Good point, but also for consistency I think we need 
type == CXL2_LOGICAL_DEVICE as well.

We will only exercise the match to CXL2_TYPE3_DEVICE currently
as we don't have any emulation for MLDs (and hence LD) or type 1/2 devices
(CXL2_DEVICE).

I'll send a v4 out tomorrow.

> 
> Otherwise,
> Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
> 
> >      }
> >  }
> >  
> > @@ -239,7 +246,7 @@ void cxl_component_register_init_common(uint32_t *reg_state, uint32_t *write_msk
> >      }
> >  
> >      init_cap_reg(HDM, 5, 1);
> > -    hdm_init_common(reg_state, write_msk);
> > +    hdm_init_common(reg_state, write_msk, type);
> >  
> >      if (caps < 5) {
> >          return;
> > -- 
> > 2.32.0
> >   


