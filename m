Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548296E7B29
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 15:44:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp85t-0002tI-Pg; Wed, 19 Apr 2023 09:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pp85r-0002sW-5e
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:43:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pp85o-0000Ly-GS
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 09:43:30 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q1hhD210vz67G5Z;
 Wed, 19 Apr 2023 21:38:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 19 Apr
 2023 14:43:17 +0100
Date: Wed, 19 Apr 2023 14:43:16 +0100
To: Thomas Huth <thuth@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, Fan Ni
 <fan.ni@samsung.com>, Ben Widawsky <ben.widawsky@intel.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>
Subject: Re: [PULL 70/73] hw/pxb-cxl: Support passthrough HDM Decoders
 unless overridden
Message-ID: <20230419144316.0000601b@Huawei.com>
In-Reply-To: <e07fc160-c147-6c00-41ca-bc106dd6220c@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
 <154070eaf6597c47f64c3ea917bcba62427ae61f.1678237635.git.mst@redhat.com>
 <CAFEAcA-+de+eeLCE4YsAw1O-Qyd_4W1Ra05mGDsU_-3a6d92qw@mail.gmail.com>
 <d98c9298-dd1c-e5d0-bc8c-4a9b6e61db36@redhat.com>
 <20230417072927-mutt-send-email-mst@kernel.org>
 <e07fc160-c147-6c00-41ca-bc106dd6220c@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Apr 2023 15:04:41 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 17/04/2023 13.29, Michael S. Tsirkin wrote:
> > On Mon, Apr 17, 2023 at 01:22:51PM +0200, Thomas Huth wrote:  
> >> On 11/04/2023 12.26, Peter Maydell wrote:  
> >>> On Wed, 8 Mar 2023 at 01:14, Michael S. Tsirkin <mst@redhat.com> wrote:  
> >>>>
> >>>> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >>>>
> >>>> The CXL r3.0 specification allows for there to be no HDM decoders on CXL
> >>>> Host Bridges if they have only a single root port. Instead, all accesses
> >>>> directed to the host bridge (as specified in CXL Fixed Memory Windows)
> >>>> are assumed to be routed to the single root port.  
> >>>
> >>> Hi; in issue https://gitlab.com/qemu-project/qemu/-/issues/1586
> >>> it's been pointed out that this commit causes an assertion
> >>> failure during 'make check' if you configure with
> >>> --enable-qom-cast-debug. You can repro by doing that and running:
> >>>
> >>>    qemu-system-i386 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0  
> ...
> >>> The problem is here:
> >>>  
> >>>> -static void pxb_dev_reset(DeviceState *dev)
> >>>> +static void pxb_cxl_dev_reset(DeviceState *dev)  
> >>>
> >>> This function is called from  pxb_cxl_dev_realize(),
> >>> which is the realize function for TYPE_PXB_CXL_DEVICE.
> >>> That type's parent is TYPE_PCI_DEVICE.
> >>>  
> >>>>    {
> >>>>        CXLHost *cxl = PXB_CXL_DEV(dev)->cxl.cxl_host_bridge;
> >>>>        CXLComponentState *cxl_cstate = &cxl->cxl_cstate;
> >>>> +    PCIHostState *hb = PCI_HOST_BRIDGE(cxl);
> >>>>        uint32_t *reg_state = cxl_cstate->crb.cache_mem_registers;
> >>>>        uint32_t *write_msk = cxl_cstate->crb.cache_mem_regs_write_mask;
> >>>> +    int dsp_count = 0;
> >>>>
> >>>>        cxl_component_register_init_common(reg_state, write_msk, CXL2_ROOT_PORT);
> >>>> -    ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT, 8);
> >>>> +    /*
> >>>> +     * The CXL specification allows for host bridges with no HDM decoders
> >>>> +     * if they only have a single root port.
> >>>> +     */
> >>>> +    if (!PXB_DEV(dev)->hdm_for_passthrough) {  
> >>>
> >>> However, here we try to cast the device pointer to PXB_DEV.
> >>> That is not permitted because dev is not of type TYPE_PXB_DEVICE
> >>> (either directly or as a parent class). So if you have the QOM
> >>> debugging enabled then the attempt to cast causes an assertion
> >>> failure.
> >>>  
> >>>> +        dsp_count = pcie_count_ds_ports(hb->bus);
> >>>> +    }
> >>>> +    /* Initial reset will have 0 dsp so wait until > 0 */
> >>>> +    if (dsp_count == 1) {
> >>>> +        cxl->passthrough = true;
> >>>> +        /* Set Capability ID in header to NONE */
> >>>> +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_CAPABILITY_HEADER, ID, 0);
> >>>> +    } else {
> >>>> +        ARRAY_FIELD_DP32(reg_state, CXL_HDM_DECODER_CAPABILITY, TARGET_COUNT,
> >>>> +                         8);
> >>>> +    }
> >>>>    }  
> >>>
> >>> What was the intention here with the type hierarchy?
> >>> Should TYPE_PXB_CXL_DEVICE be a subclass of TYPE_PXB_DEVICE,
> >>> or should the cxl-related functions not be trying to treat
> >>> it as a PXB device ?  
> >>
> >> Maybe we should simply revert the commit for the time being (once the 8.1
> >> cycle begins), 'til this has properly been solved, so we can enable
> >> qom-debug by default again?  
> > 
> > Can you post a revert?  
> 
> Sure, done here now:
> https://lore.kernel.org/qemu-devel/20230417130037.236747-2-thuth@redhat.com/
> 

Sorry - I missed this until today.  Indeed revert makes sense. I'll chase this down
in the new cycle.

Jonathan

>   Thomas
> 


