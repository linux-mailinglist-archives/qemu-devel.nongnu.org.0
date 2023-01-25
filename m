Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30167BF78
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 23:00:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKnn9-0004lU-VY; Wed, 25 Jan 2023 16:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnn8-0004lJ-9G
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:58:50 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pKnn6-0000W7-DQ
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 16:58:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EBA8616A1;
 Wed, 25 Jan 2023 21:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE73C433EF;
 Wed, 25 Jan 2023 21:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674683926;
 bh=CctgY9rPc7Uype53cxREDxzCw01bCr9SqjFOC+BRSIY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WXjMkSoanXUQhAi3Rbv8aMAGAH1jFgCe/RYw7tGNwreaW4z8zAEE0dUk3cdV/8FBj
 2o580OUMHmemvJOj24TkcvLwbBOIEpGiX77v3Hv9bXxVWf22p5sIVu6Em950pZ9CI9
 QQmpVcQodzkO/45cEBt7bLxrV13tUDS0y8SBwmR1iXT4qvuxQFUsODOQOU4vqzyP/M
 ZaHLFQ46DmZJtFoHoe1bxd3MfoZiJ/oolV55BzO1s9bd//XGqk76GZ+a0kQXiNNJke
 ZLnP2qx/XrvQklmrqWWldW+AVjf9+BJmlzCAKYqUtYIyL5QKy0DrM3Z9GO8GiFX07F
 9k6VlhIN+x6yg==
Date: Wed, 25 Jan 2023 13:58:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 stefano.stabellini@amd.com, alex.bennee@linaro.org, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [QEMU][PATCH v4 05/10] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
In-Reply-To: <20230125085407.7144-6-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251357590.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
 <20230125085407.7144-6-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

I know I am co-author of the patch but just for record-keeping to
remember that I also reviewed this patch:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  include/hw/xen/xen_common.h | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 9a13a756ae..9ec69582b3 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
>  {
>  }
>  
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>  {
> +    return 0;
>  }
>  
>  static inline void xen_destroy_ioreq_server(domid_t dom,
> @@ -600,8 +601,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>                                                    PCI_FUNC(pci_dev->devfn));
>  }
>  
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>  {
>      int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
>                                                  HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> @@ -609,12 +610,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
>  
>      if (rc == 0) {
>          trace_xen_ioreq_server_create(*ioservid);
> -        return;
> +        return rc;
>      }
>  
>      *ioservid = 0;
>      use_default_ioreq_server = true;
>      trace_xen_default_ioreq_server();
> +
> +    return rc;
>  }
>  
>  static inline void xen_destroy_ioreq_server(domid_t dom,
> -- 
> 2.17.0
> 
> 

