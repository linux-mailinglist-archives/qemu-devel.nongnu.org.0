Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9924742FA4E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 19:32:48 +0200 (CEST)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbR4Y-000865-V5
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 13:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mbR2c-0007B6-3j
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 13:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mbR2Y-0004xI-Fn
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 13:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634319039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m2OX96knqSYd9pvEGXVyFWbZqlnrhdbT3FMfdV4CvsI=;
 b=jLyRBeYb6yoH6dAU/LfzPxzBz9Pi9dLJuZwm3S+9NzDBo6+LBPO9sKr+4NR+DGEzaPh5ac
 MU0nI6/j7PUvzN6jLD9KhLt70NnZL0oes44xEPxhrw2ynCs6S/5pqh9CUzim7Nx2Jnum4N
 fOVEBKVwdsKEsmzdYJnEjLCbwxrUCxI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-Yg0YSYL6OGCOJIpjbjXJ8A-1; Fri, 15 Oct 2021 13:30:38 -0400
X-MC-Unique: Yg0YSYL6OGCOJIpjbjXJ8A-1
Received: by mail-ed1-f71.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so8893209edq.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 10:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m2OX96knqSYd9pvEGXVyFWbZqlnrhdbT3FMfdV4CvsI=;
 b=EXN5GcmZKsUjDFeD9jGGLRKi1zClz8ctY1TjRh5Y9xw3SmGTddgIEqbMVX4xIeboMG
 lvb1ac26v2FF3TEUESQqx1+Vmgvk1sFyBKfp8n6KSXX5n+ar8BbjOMSeFSsZNijT+p3n
 5z950WX/1cWechzxac9qav0FFMN+EedtdQ6tYz5+ea0LnGUkIHV9KYK5JbQBjRuH5a9/
 wLzAfiF5Jlh79JQN816le2zleLTkIL9yxcMasNHY71rIlc1cGv/2PSLeM90VtFvNJ+f5
 06IL2JJ7IbZIwUw0a3+koy1A0mE8N8VIKCCj+tuswWjKqNFpr2867Iav/69v1cYuJOWS
 xfgQ==
X-Gm-Message-State: AOAM531zjYwV135HT06cF4Al7HegdQ+YWCc6CqKLZGKCnGrGoOZ5kR7z
 4Nlglj9UU13RVnYGufcYmnrP9B7k6YlbYkIcO+ZVqPqNLql4uWDp4sckY0v7+JCHjvMuIczQwp0
 rcsZ3C+S3uWPjOB0=
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr19106075ede.142.1634319036626; 
 Fri, 15 Oct 2021 10:30:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyEXXLHWa05SvLuR2N2d/oSGWWmBJhtsiQQxcPQoq5vT8YDq6wS4NAXYrYi0RZI9x3DvrruA==
X-Received: by 2002:a05:6402:2789:: with SMTP id
 b9mr19106027ede.142.1634319036268; 
 Fri, 15 Oct 2021 10:30:36 -0700 (PDT)
Received: from redhat.com ([2.55.147.75])
 by smtp.gmail.com with ESMTPSA id t6sm5408453edj.27.2021.10.15.10.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 10:30:35 -0700 (PDT)
Date: Fri, 15 Oct 2021 13:30:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 04/15] pcie: Add callback preceding SR-IOV VFs update
Message-ID: <20211015133019-mutt-send-email-mst@kernel.org>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-5-lukasz.maniak@linux.intel.com>
 <20211012032026-mutt-send-email-mst@kernel.org>
 <20211012160646.GA2286339@lmaniak-dev.igk.intel.com>
 <20211013050638-mutt-send-email-mst@kernel.org>
 <20211015162414.GA3191260@lmaniak-dev.igk.intel.com>
MIME-Version: 1.0
In-Reply-To: <20211015162414.GA3191260@lmaniak-dev.igk.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 Knut Omang <knuto@ifi.uio.no>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 06:24:14PM +0200, Lukasz Maniak wrote:
> On Wed, Oct 13, 2021 at 05:10:35AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Oct 12, 2021 at 06:06:46PM +0200, Lukasz Maniak wrote:
> > > On Tue, Oct 12, 2021 at 03:25:12AM -0400, Michael S. Tsirkin wrote:
> > > > On Thu, Oct 07, 2021 at 06:23:55PM +0200, Lukasz Maniak wrote:
> > > > > PCIe devices implementing SR-IOV may need to perform certain actions
> > > > > before the VFs are unrealized or vice versa.
> > > > > 
> > > > > Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
> > > > 
> > > > Callbacks are annoying and easy to misuse though.
> > > > VFs are enabled through a config cycle, we generally just
> > > > have devices invoke the capability handler.
> > > > E.g.
> > > > 
> > > > static void pci_bridge_dev_write_config(PCIDevice *d,
> > > >                                         uint32_t address, uint32_t val, int len)
> > > > {
> > > >     pci_bridge_write_config(d, address, val, len);
> > > >     if (msi_present(d)) {
> > > >         msi_write_config(d, address, val, len);
> > > >     }
> > > > }
> > > > 
> > > > this makes it easy to do whatever you want before/after
> > > > the write. You can also add a helper to check
> > > > that SRIOV is being enabled/disabled if necessary.
> > > > 
> > > > > ---
> > > > >  docs/pcie_sriov.txt         |  2 +-
> > > > >  hw/pci/pcie_sriov.c         | 14 +++++++++++++-
> > > > >  include/hw/pci/pcie_sriov.h |  8 +++++++-
> > > > >  3 files changed, 21 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
> > > > > index f5e891e1d4..63ca1a7b8e 100644
> > > > > --- a/docs/pcie_sriov.txt
> > > > > +++ b/docs/pcie_sriov.txt
> > > > > @@ -57,7 +57,7 @@ setting up a BAR for a VF.
> > > > >        /* Add and initialize the SR/IOV capability */
> > > > >        pcie_sriov_pf_init(d, 0x200, "your_virtual_dev",
> > > > >                         vf_devid, initial_vfs, total_vfs,
> > > > > -                       fun_offset, stride);
> > > > > +                       fun_offset, stride, pre_vfs_update_cb);
> > > > >  
> > > > >        /* Set up individual VF BARs (parameters as for normal BARs) */
> > > > >        pcie_sriov_pf_init_vf_bar( ... )
> > > > > diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> > > > > index 501a1ff433..cac2aee061 100644
> > > > > --- a/hw/pci/pcie_sriov.c
> > > > > +++ b/hw/pci/pcie_sriov.c
> > > > > @@ -30,7 +30,8 @@ static void unregister_vfs(PCIDevice *dev);
> > > > >  void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
> > > > >                          const char *vfname, uint16_t vf_dev_id,
> > > > >                          uint16_t init_vfs, uint16_t total_vfs,
> > > > > -                        uint16_t vf_offset, uint16_t vf_stride)
> > > > > +                        uint16_t vf_offset, uint16_t vf_stride,
> > > > > +                        SriovVfsUpdate pre_vfs_update)
> > > > >  {
> > > > >      uint8_t *cfg = dev->config + offset;
> > > > >      uint8_t *wmask;
> > > > > @@ -41,6 +42,7 @@ void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
> > > > >      dev->exp.sriov_pf.num_vfs = 0;
> > > > >      dev->exp.sriov_pf.vfname = g_strdup(vfname);
> > > > >      dev->exp.sriov_pf.vf = NULL;
> > > > > +    dev->exp.sriov_pf.pre_vfs_update = pre_vfs_update;
> > > > >  
> > > > >      pci_set_word(cfg + PCI_SRIOV_VF_OFFSET, vf_offset);
> > > > >      pci_set_word(cfg + PCI_SRIOV_VF_STRIDE, vf_stride);
> > > > > @@ -180,6 +182,11 @@ static void register_vfs(PCIDevice *dev)
> > > > >      assert(dev->exp.sriov_pf.vf);
> > > > >  
> > > > >      trace_sriov_register_vfs(SRIOV_ID(dev), num_vfs);
> > > > > +
> > > > > +    if (dev->exp.sriov_pf.pre_vfs_update) {
> > > > > +        dev->exp.sriov_pf.pre_vfs_update(dev, dev->exp.sriov_pf.num_vfs, num_vfs);
> > > > > +    }
> > > > > +
> > > > >      for (i = 0; i < num_vfs; i++) {
> > > > >          dev->exp.sriov_pf.vf[i] = register_vf(dev, devfn, dev->exp.sriov_pf.vfname, i);
> > > > >          if (!dev->exp.sriov_pf.vf[i]) {
> > > > > @@ -198,6 +205,11 @@ static void unregister_vfs(PCIDevice *dev)
> > > > >      uint16_t i;
> > > > >  
> > > > >      trace_sriov_unregister_vfs(SRIOV_ID(dev), num_vfs);
> > > > > +
> > > > > +    if (dev->exp.sriov_pf.pre_vfs_update) {
> > > > > +        dev->exp.sriov_pf.pre_vfs_update(dev, dev->exp.sriov_pf.num_vfs, 0);
> > > > > +    }
> > > > > +
> > > > >      for (i = 0; i < num_vfs; i++) {
> > > > >          PCIDevice *vf = dev->exp.sriov_pf.vf[i];
> > > > >          object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
> > > > > diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
> > > > > index 0974f00054..9ab48b79c0 100644
> > > > > --- a/include/hw/pci/pcie_sriov.h
> > > > > +++ b/include/hw/pci/pcie_sriov.h
> > > > > @@ -13,11 +13,16 @@
> > > > >  #ifndef QEMU_PCIE_SRIOV_H
> > > > >  #define QEMU_PCIE_SRIOV_H
> > > > >  
> > > > > +typedef void (*SriovVfsUpdate)(PCIDevice *dev, uint16_t prev_num_vfs,
> > > > > +                               uint16_t num_vfs);
> > > > > +
> > > > >  struct PCIESriovPF {
> > > > >      uint16_t num_vfs;           /* Number of virtual functions created */
> > > > >      uint8_t vf_bar_type[PCI_NUM_REGIONS];  /* Store type for each VF bar */
> > > > >      const char *vfname;         /* Reference to the device type used for the VFs */
> > > > >      PCIDevice **vf;             /* Pointer to an array of num_vfs VF devices */
> > > > > +
> > > > > +    SriovVfsUpdate pre_vfs_update;  /* Callback preceding VFs count change */
> > > > >  };
> > > > >  
> > > > >  struct PCIESriovVF {
> > > > > @@ -28,7 +33,8 @@ struct PCIESriovVF {
> > > > >  void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
> > > > >                          const char *vfname, uint16_t vf_dev_id,
> > > > >                          uint16_t init_vfs, uint16_t total_vfs,
> > > > > -                        uint16_t vf_offset, uint16_t vf_stride);
> > > > > +                        uint16_t vf_offset, uint16_t vf_stride,
> > > > > +                        SriovVfsUpdate pre_vfs_update);
> > > > >  void pcie_sriov_pf_exit(PCIDevice *dev);
> > > > >  
> > > > >  /* Set up a VF bar in the SR/IOV bar area */
> > > > > -- 
> > > > > 2.25.1
> > > >
> > > 
> > > Hi Michael,
> > > 
> > > A custom config_write callback was the first approach we used.
> > > However, once implemented, we realized it looks the same as the
> > > pcie_sriov_config_write function. To avoid code duplication and
> > > interfering with the internal SR-IOV structures for purposes of NVMe,
> > > we opted for this callback prior to the VFs update.
> > > After all, we have callbacks in both approaches, config_write and the
> > > added pre_vfs_update, so both are prone to misuse.
> > > 
> > > But I agree it may not be a good moment yet to add a new API
> > > specifically for SR-IOV functionality, as NVMe will be the first device
> > > to use it.
> > > 
> > > CCing Knut, perhaps as the author of SR-IOV you have some thoughts on
> > > how the device notification of an upcoming VFs update would be handled.
> > > 
> > > Thanks,
> > > Lukasz
> > 
> > So just split it up?
> > 
> > void pcie_sriov_config_write(PCIDevice *dev, uint32_t address, uint32_t val, int len)
> > {
> >     uint32_t off;
> >     uint16_t sriov_cap = dev->exp.sriov_cap;
> > 
> >     if (!sriov_cap || address < sriov_cap) {
> >         return;
> >     }
> >     off = address - sriov_cap;
> >     if (off >= PCI_EXT_CAP_SRIOV_SIZEOF) {
> >         return;
> >     }
> >     
> >     trace_sriov_config_write(SRIOV_ID(dev), off, val, len);
> >         
> >     if (range_covers_byte(off, len, PCI_SRIOV_CTRL)) {
> >         if (dev->exp.sriov_pf.num_vfs) {
> >             if (!(val & PCI_SRIOV_CTRL_VFE)) {
> >                 unregister_vfs(dev);
> >             }
> >         } else {
> >             if (val & PCI_SRIOV_CTRL_VFE) {
> >                 register_vfs(dev);
> >             }
> >         }
> >     }
> > }
> > 
> > 
> > Would become:
> > 
> > bool
> >  pcie_sriov_is_config_write(PCIDevice *dev, uint32_t address, uint32_t val, int len)
> > {
> >     uint32_t off;
> >     uint16_t sriov_cap = dev->exp.sriov_cap;
> > 
> >     if (!sriov_cap || address < sriov_cap) {
> >         return false;
> >     }
> >     off = address - sriov_cap;
> >     if (off >= PCI_EXT_CAP_SRIOV_SIZEOF) {
> >         return false;
> >     }
> > }
> > 
> > bool
> >  pcie_sriov_do_config_write(PCIDevice *dev, uint32_t address, uint32_t val, int len)
> > {
> >     trace_sriov_config_write(SRIOV_ID(dev), off, val, len);
> >         
> >     if (range_covers_byte(off, len, PCI_SRIOV_CTRL)) {
> >         if (dev->exp.sriov_pf.num_vfs) {
> >             if (!(val & PCI_SRIOV_CTRL_VFE)) {
> >                 unregister_vfs(dev);
> >             }
> >         } else {
> >             if (val & PCI_SRIOV_CTRL_VFE) {
> >                 register_vfs(dev);
> >             }
> >         }
> >     }
> > }
> > 
> > 
> > 
> > void pcie_sriov_config_write(PCIDevice *dev, uint32_t address, uint32_t val, int len)
> > {
> > 	if (pcie_sriov_is_config_write(dev, address, val, len)) {
> > 		pcie_sriov_do_config_write(dev, address, val, len);
> > 	}
> >     
> > }
> > 
> > 
> > Now  pcie_sriov_is_config_write and pcie_sriov_do_config_write
> > can be reused by NVME.
> > 
> > -- 
> > MST
> > 
> 
> Hi Michael,
> 
> I extracted one condition to the helper, what do you think?
> 
> bool pcie_sriov_is_config_write(PCIDevice *dev, uint32_t address, uint32_t val, int len)
> {
>     uint32_t off;
>     uint16_t sriov_cap = dev->exp.sriov_cap;
> 
>     if (!sriov_cap || address < sriov_cap) {
>         return false;
>     }
>     off = address - sriov_cap;
>     if (off >= PCI_EXT_CAP_SRIOV_SIZEOF) {
>         return false;
>     }
> 
>     if (range_covers_byte(off, len, PCI_SRIOV_CTRL)) {
>         return true;
>     }
> 
>     return false;
> }
> 
> static void pcie_sriov_do_config_write(PCIDevice *dev, uint32_t address,
>                                        uint32_t val, int len)
> {
>     uint32_t off = address - dev->exp.sriov_cap;
>     trace_sriov_config_write(SRIOV_ID(dev), off, val, len);
> 
>     if (dev->exp.sriov_pf.num_vfs) {
>         if (!(val & PCI_SRIOV_CTRL_VFE)) {
>             unregister_vfs(dev);
>         }
>     } else {
>         if (val & PCI_SRIOV_CTRL_VFE) {
>             register_vfs(dev);
>         }
>     }
> }
> 
> void pcie_sriov_config_write(PCIDevice *dev, uint32_t address, uint32_t val, int len)
> {
>     if (pcie_sriov_is_config_write(dev, address, val, len)) {
>         pcie_sriov_do_config_write(dev, address, val, len);
>     }
> }

ok

> --
> Lukasz


