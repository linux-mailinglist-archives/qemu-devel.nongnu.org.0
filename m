Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178E8540404
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 18:44:27 +0200 (CEST)
Received: from localhost ([::1]:51792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nycJe-0000te-6H
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 12:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nycGi-0008Ah-9t
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:41:24 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:41690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bwidawsk@kernel.org>)
 id 1nycGf-0002XH-RK
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 12:41:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EBB36CE2366;
 Tue,  7 Jun 2022 16:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD1AC385A5;
 Tue,  7 Jun 2022 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654620076;
 bh=nzfxWt+CAzao4R1WE/AQaZXGtbOyttsgCG+UyjdkIew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jL1e2c+l6kI5XP4DJHkQJNVnBD8DXqYSoSjV5QY/M2va5fKha6dAm+8hkGymlJ+LB
 mKN17En9iB1EDDLtQraWYVZJ/Yp7bXKqx5oTdjhHVSYER0gYGgW2ggjwnq+UyeJlIz
 8pCVr+zRo7CRJow/YK3M2Cg15JWDqLSnh+frjUB1i1pg+Xb2vHmQuqlWAqFTrqyrWU
 ON8gkvNsFdjMBpgxPFrHGz71eckL4E/ueijBKwT2A3ONKN+D73DGkIftygGFP+skig
 D6S+ok2gPyWdc/+DhABr0738p8P6mLZes1QzDsWJuQQtolMhzggkbHMVwdCKkUAcI3
 tyfTnETNll7IQ==
Date: Tue, 7 Jun 2022 09:41:14 -0700
From: Ben Widawsky <bwidawsk@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, alex.bennee@linaro.org,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Adam Manzanares <a.manzanares@samsung.com>,
 Tong Zhang <ztong0001@gmail.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3] hw/cxl: Fix missing write mask for HDM decoder target
 list registers
Message-ID: <20220607164114.mbwcqk4wxekhzxfo@bwidawsk-mobl5>
References: <20220607160747.21084-1-Jonathan.Cameron@huawei.com>
 <20220607161928.364mrju2mvzcvs56@bwidawsk-mobl5>
 <20220607173702.00005ccf@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607173702.00005ccf@Huawei.com>
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=bwidawsk@kernel.org; helo=sin.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22-06-07 17:37:02, Jonathan Cameron wrote:
> On Tue, 7 Jun 2022 09:19:28 -0700
> Ben Widawsky <bwidawsk@kernel.org> wrote:
> 
> > On 22-06-07 17:07:47, Jonathan Cameron wrote:
> > > Without being able to write these registers, no interleaving is possible.
> > > More refined checks of HDM register state on commit to follow.
> > > 
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > ---
> > > v3: Actually pass the parameter to the call...
> > > v2: (Ben Widawsky)
> > > - Correctly set a tighter write mask for the endpoint devices where this
> > >   register has a different use.
> > >   
> > >  hw/cxl/cxl-component-utils.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> > > index 7985c9bfca..2208284ee6 100644
> > > --- a/hw/cxl/cxl-component-utils.c
> > > +++ b/hw/cxl/cxl-component-utils.c
> > > @@ -154,7 +154,8 @@ static void ras_init_common(uint32_t *reg_state, uint32_t *write_msk)
> > >      reg_state[R_CXL_RAS_ERR_CAP_CTRL] = 0x00;
> > >  }
> > >  
> > > -static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
> > > +static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,
> > > +                            enum reg_type type)
> > >  {
> > >      int decoder_count = 1;
> > >      int i;
> > > @@ -174,6 +175,12 @@ static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk)
> > >          write_msk[R_CXL_HDM_DECODER0_SIZE_LO + i * 0x20] = 0xf0000000;
> > >          write_msk[R_CXL_HDM_DECODER0_SIZE_HI + i * 0x20] = 0xffffffff;
> > >          write_msk[R_CXL_HDM_DECODER0_CTRL + i * 0x20] = 0x13ff;
> > > +        if (type == CXL2_DEVICE) {
> > > +            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xf0000000;
> > > +        } else {
> > > +            write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_LO + i * 0x20] = 0xffffffff;
> > > +        }
> > > +        write_msk[R_CXL_HDM_DECODER0_TARGET_LIST_HI + i * 0x20] = 0xffffffff;  
> > 
> > Should it be (type == CXL2_DEVICE || type == CXL2_TYPE3_DEVICE) ?
> 
> Good point, but also for consistency I think we need 
> type == CXL2_LOGICAL_DEVICE as well.

I was looking at this and I am not sure, but I defer to you.

> 
> We will only exercise the match to CXL2_TYPE3_DEVICE currently
> as we don't have any emulation for MLDs (and hence LD) or type 1/2 devices
> (CXL2_DEVICE).
> 
> I'll send a v4 out tomorrow.
> 

Sounds good, feel free to keep the r-b tag.

> > 
> > Otherwise,
> > Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
> > 
> > >      }
> > >  }
> > >  
> > > @@ -239,7 +246,7 @@ void cxl_component_register_init_common(uint32_t *reg_state, uint32_t *write_msk
> > >      }
> > >  
> > >      init_cap_reg(HDM, 5, 1);
> > > -    hdm_init_common(reg_state, write_msk);
> > > +    hdm_init_common(reg_state, write_msk, type);
> > >  
> > >      if (caps < 5) {
> > >          return;
> > > -- 
> > > 2.32.0
> > >   
> 

