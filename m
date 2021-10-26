Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFB43B7B7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:59:23 +0200 (CEST)
Received: from localhost ([::1]:51996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPnG-0005zl-VO
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1mfPls-0004Mi-2g; Tue, 26 Oct 2021 12:57:56 -0400
Received: from mail-out04.uio.no ([2001:700:100:8210::76]:56943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knuto@ifi.uio.no>)
 id 1mfPlo-0001zR-TI; Tue, 26 Oct 2021 12:57:55 -0400
Received: from mail-mx12.uio.no ([129.240.10.84])
 by mail-out04.uio.no with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <knuto@ifi.uio.no>)
 id 1mfPlj-00AerL-8z; Tue, 26 Oct 2021 18:57:47 +0200
Received: from 108.84-234-134.customer.lyse.net ([84.234.134.108]
 helo=[172.25.2.5])
 by mail-mx12.uio.no with esmtpsa (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 user knuto (Exim 4.94.2) (envelope-from <knuto@ifi.uio.no>)
 id 1mfPli-0007uX-EF; Tue, 26 Oct 2021 18:57:47 +0200
Message-ID: <a71eee0af5deac5e53d1ea4b94954cb594b39cf9.camel@ifi.uio.no>
Subject: Re: [PATCH 13/15] pcie: Add helpers to the SR/IOV API
From: Knut Omang <knuto@ifi.uio.no>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-devel@nongnu.org
Date: Tue, 26 Oct 2021 18:57:45 +0200
In-Reply-To: <20211007162406.1920374-14-lukasz.maniak@linux.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-14-lukasz.maniak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-UiO-SPF-Received: Received-SPF: neutral (mail-mx12.uio.no: 84.234.134.108 is
 neither permitted nor denied by domain of ifi.uio.no)
 client-ip=84.234.134.108; envelope-from=knuto@ifi.uio.no; helo=[172.25.2.5]; 
X-UiO-Spam-info: not spam, SpamAssassin (score=-5.0, required=5.0,
 autolearn=disabled, TVD_RCVD_IP=0.001, UIO_MAIL_IS_INTERNAL=-5)
X-UiO-Scanned: 478B200F459C45A176EC024BBE1851A36DD301BF
X-UiOonly: 6D21B6636E8913D1F630D33F3795FF435B34B02A
Received-SPF: pass client-ip=2001:700:100:8210::76;
 envelope-from=knuto@ifi.uio.no; helo=mail-out04.uio.no
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: =?UTF-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-10-07 at 18:24 +0200, Lukasz Maniak wrote:
> From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> 
> Two convenience functions for retrieving:
>  - the total number of VFs,
>  - the PCIDevice object of the N-th VF.
> 
> Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
> ---
>  hw/pci/pcie_sriov.c         | 14 ++++++++++++++
>  include/hw/pci/pcie_sriov.h |  8 ++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
> index cac2aee061..5a8e92d5ab 100644
> --- a/hw/pci/pcie_sriov.c
> +++ b/hw/pci/pcie_sriov.c
> @@ -292,8 +292,22 @@ uint16_t pcie_sriov_vf_number(PCIDevice *dev)
>      return dev->exp.sriov_vf.vf_number;
>  }
>  
> +uint16_t pcie_sriov_vf_number_total(PCIDevice *dev)
> +{
> +    assert(!pci_is_vf(dev));
> +    return dev->exp.sriov_pf.num_vfs;
> +}
>  
>  PCIDevice *pcie_sriov_get_pf(PCIDevice *dev)
>  {
>      return dev->exp.sriov_vf.pf;
>  }
> +
> +PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n)
> +{
> +    assert(!pci_is_vf(dev));
> +    if (n < dev->exp.sriov_pf.num_vfs) {
> +        return dev->exp.sriov_pf.vf[n];
> +    }
> +    return NULL;
> +}
> diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
> index 9ab48b79c0..d1f39b7223 100644
> --- a/include/hw/pci/pcie_sriov.h
> +++ b/include/hw/pci/pcie_sriov.h
> @@ -65,9 +65,17 @@ void pcie_sriov_pf_disable_vfs(PCIDevice *dev);
>  /* Get logical VF number of a VF - only valid for VFs */
>  uint16_t pcie_sriov_vf_number(PCIDevice *dev);
>  
> +/* Get the total number of VFs - only valid for PF */
> +uint16_t pcie_sriov_vf_number_total(PCIDevice *dev);
> +
>  /* Get the physical function that owns this VF.
>   * Returns NULL if dev is not a virtual function
>   */
>  PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
>  
> +/* Get the n-th VF of this physical function - only valid for PF.
> + * Returns NULL if index is invalid
> + */
> +PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
> +
>  #endif /* QEMU_PCIE_SRIOV_H */


These look like natural improvements to me, thanks!

Reviewed-by: Knut Omang <knuto@ifi.uio.no>



