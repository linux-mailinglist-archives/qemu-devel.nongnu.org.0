Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1128429E9F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 09:28:09 +0200 (CEST)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCCm-0002hn-8B
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 03:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maCAM-0000qC-R7
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maCAF-0002n9-Tu
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634023530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9VIhLI+H19CmeU9enkdJEfYpka3vgydxcHQy1jQ1V1c=;
 b=L3INi2BqiM12HWk7/8SLuczaSP2PxAS2yldmL/bNUyI+KTyNmsPYqrGSZZhXsOp7tGSrqT
 Y2fJNq9KGI3XyrHqcqogVQIt8+lRVevu2MjuNvb8uTGY8THZP9zqmZyhIHXx4AwRo68JDr
 DZheYXlkuACruQ7INqiWhV4eav2YF9w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-Ofz5rKXyMtC3et0UZnIP3Q-1; Tue, 12 Oct 2021 03:25:19 -0400
X-MC-Unique: Ofz5rKXyMtC3et0UZnIP3Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so3841986edv.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 00:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9VIhLI+H19CmeU9enkdJEfYpka3vgydxcHQy1jQ1V1c=;
 b=Ee6vHbmyDWj6KLFYyzMLpii/QNG49FBeCUmVq+PhlYSxgUckGpG+2oCyRe2ORcCmy5
 NyfRLcnXGNSMrrxtb+M/8UdFgQMt/Fqv5WsMKlPB6VON2eTd+o7eU/6jiYH5W8tQtxkn
 7pNBN7sWHafJMT8f9PKKSEfIVNGUOT8FamPyi5GDULjUDHwQpHmAbzh3ITqYGRKB1sQk
 bucML/AuM+4WJRttGt+gAUC4oQfIe7sFW5fKWnjNhUGRuPWNPqAglIj0+5Xy9z3xcy8D
 m/+ikYxjig404I2rg0nOsYnDsi9pYciqeI5K0BsTDF0MX5aonbwq+BfPOTdtT+9eDFDi
 cZJg==
X-Gm-Message-State: AOAM530B1tI0CJhoFJ4wherKtTcUf4fynwFICd60Sa5uYKRNnnUCTHxw
 s5asLXTvU1Zom4nKS1fu25i9UHMONvk3aGb8kTqwbOO7Ul9CyvhMR8OAnICOKmrPObXJz4hFuzZ
 /ZyEa9xVZka7A3CM=
X-Received: by 2002:a17:906:31d7:: with SMTP id
 f23mr29906329ejf.190.1634023517510; 
 Tue, 12 Oct 2021 00:25:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxukKCV8S63kaIup6oblZJk34P8PssEF6EEwTn/2NEa7dlATTEhk7nDyXrTzXE5Jx5AgPfLA==
X-Received: by 2002:a17:906:31d7:: with SMTP id
 f23mr29906307ejf.190.1634023517225; 
 Tue, 12 Oct 2021 00:25:17 -0700 (PDT)
Received: from redhat.com ([2.55.159.57])
 by smtp.gmail.com with ESMTPSA id i6sm4407312ejd.57.2021.10.12.00.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 00:25:16 -0700 (PDT)
Date: Tue, 12 Oct 2021 03:25:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 04/15] pcie: Add callback preceding SR-IOV VFs update
Message-ID: <20211012032026-mutt-send-email-mst@kernel.org>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-5-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20211007162406.1920374-5-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 07, 2021 at 06:23:55PM +0200, Lukasz Maniak wrote:
> PCIe devices implementing SR-IOV may need to perform certain actions
> before the VFs are unrealized or vice versa.
> 
> Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>

Callbacks are annoying and easy to misuse though.
VFs are enabled through a config cycle, we generally just
have devices invoke the capability handler.
E.g.

static void pci_bridge_dev_write_config(PCIDevice *d,
                                        uint32_t address, uint32_t val, int len)
{
    pci_bridge_write_config(d, address, val, len);
    if (msi_present(d)) {
        msi_write_config(d, address, val, len);
    }
}

this makes it easy to do whatever you want before/after
the write. You can also add a helper to check
that SRIOV is being enabled/disabled if necessary.

> ---
>  docs/pcie_sriov.txt         |  2 +-
>  hw/pci/pcie_sriov.c         | 14 +++++++++++++-
>  include/hw/pci/pcie_sriov.h |  8 +++++++-
>  3 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
> index f5e891e1d4..63ca1a7b8e 100644
> --- a/docs/pcie_sriov.txt
> +++ b/docs/pcie_sriov.txt
> @@ -57,7 +57,7 @@ setting up a BAR for a VF.
>        /* Add and initialize the SR/IOV capability */
>        pcie_sriov_pf_init(d, 0x200, "your_virtual_dev",
>                         vf_devid, initial_vfs, total_vfs,
> -                       fun_offset, stride);
> +                       fun_offset, stride, pre_vfs_update_cb);
>  
>        /* Set up individual VF BARs (parameters as for normal BARs) */
>        pcie_sriov_pf_init_vf_bar( ... )
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index 501a1ff433..cac2aee061 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -30,7 +30,8 @@ static void unregister_vfs(PCIDevice *dev);
>  void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
>                          const char *vfname, uint16_t vf_dev_id,
>                          uint16_t init_vfs, uint16_t total_vfs,
> -                        uint16_t vf_offset, uint16_t vf_stride)
> +                        uint16_t vf_offset, uint16_t vf_stride,
> +                        SriovVfsUpdate pre_vfs_update)
>  {
>      uint8_t *cfg = dev->config + offset;
>      uint8_t *wmask;
> @@ -41,6 +42,7 @@ void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
>      dev->exp.sriov_pf.num_vfs = 0;
>      dev->exp.sriov_pf.vfname = g_strdup(vfname);
>      dev->exp.sriov_pf.vf = NULL;
> +    dev->exp.sriov_pf.pre_vfs_update = pre_vfs_update;
>  
>      pci_set_word(cfg + PCI_SRIOV_VF_OFFSET, vf_offset);
>      pci_set_word(cfg + PCI_SRIOV_VF_STRIDE, vf_stride);
> @@ -180,6 +182,11 @@ static void register_vfs(PCIDevice *dev)
>      assert(dev->exp.sriov_pf.vf);
>  
>      trace_sriov_register_vfs(SRIOV_ID(dev), num_vfs);
> +
> +    if (dev->exp.sriov_pf.pre_vfs_update) {
> +        dev->exp.sriov_pf.pre_vfs_update(dev, dev->exp.sriov_pf.num_vfs, num_vfs);
> +    }
> +
>      for (i = 0; i < num_vfs; i++) {
>          dev->exp.sriov_pf.vf[i] = register_vf(dev, devfn, dev->exp.sriov_pf.vfname, i);
>          if (!dev->exp.sriov_pf.vf[i]) {
> @@ -198,6 +205,11 @@ static void unregister_vfs(PCIDevice *dev)
>      uint16_t i;
>  
>      trace_sriov_unregister_vfs(SRIOV_ID(dev), num_vfs);
> +
> +    if (dev->exp.sriov_pf.pre_vfs_update) {
> +        dev->exp.sriov_pf.pre_vfs_update(dev, dev->exp.sriov_pf.num_vfs, 0);
> +    }
> +
>      for (i = 0; i < num_vfs; i++) {
>          PCIDevice *vf = dev->exp.sriov_pf.vf[i];
>          object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
> diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
> index 0974f00054..9ab48b79c0 100644
> --- a/include/hw/pci/pcie_sriov.h
> +++ b/include/hw/pci/pcie_sriov.h
> @@ -13,11 +13,16 @@
>  #ifndef QEMU_PCIE_SRIOV_H
>  #define QEMU_PCIE_SRIOV_H
>  
> +typedef void (*SriovVfsUpdate)(PCIDevice *dev, uint16_t prev_num_vfs,
> +                               uint16_t num_vfs);
> +
>  struct PCIESriovPF {
>      uint16_t num_vfs;           /* Number of virtual functions created */
>      uint8_t vf_bar_type[PCI_NUM_REGIONS];  /* Store type for each VF bar */
>      const char *vfname;         /* Reference to the device type used for the VFs */
>      PCIDevice **vf;             /* Pointer to an array of num_vfs VF devices */
> +
> +    SriovVfsUpdate pre_vfs_update;  /* Callback preceding VFs count change */
>  };
>  
>  struct PCIESriovVF {
> @@ -28,7 +33,8 @@ struct PCIESriovVF {
>  void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
>                          const char *vfname, uint16_t vf_dev_id,
>                          uint16_t init_vfs, uint16_t total_vfs,
> -                        uint16_t vf_offset, uint16_t vf_stride);
> +                        uint16_t vf_offset, uint16_t vf_stride,
> +                        SriovVfsUpdate pre_vfs_update);
>  void pcie_sriov_pf_exit(PCIDevice *dev);
>  
>  /* Set up a VF bar in the SR/IOV bar area */
> -- 
> 2.25.1


