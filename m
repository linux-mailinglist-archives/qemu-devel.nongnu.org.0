Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B004622B87
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:30:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskCy-0005LQ-Lz; Wed, 09 Nov 2022 07:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskCw-0005Kk-CH
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskCu-0008Sp-Ko
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667996968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oIfbGEpMn3ZxHXULHbON+b9cK8EcMQ0TguPrHQLFt7k=;
 b=Z3LNx3ciSEq+6wwAjPeZqQEiPm+cAGud8QKXNkIE+ZbsDtWI2sWTpI0LDYhqk01hC/BYET
 YJA83i56SiJaf9a0BBT5/4VKGvLieCdlPaCfdiYpL6UobP3ArSesaom+Wou/u1TQaRwLVg
 4pgqF1w+A83Gmr9ZegQSBGNAHRuh7BQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-MRJibsNKN8y70_Yxeg-aVg-1; Wed, 09 Nov 2022 07:29:24 -0500
X-MC-Unique: MRJibsNKN8y70_Yxeg-aVg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4617F380671D;
 Wed,  9 Nov 2022 12:29:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC37EC16922;
 Wed,  9 Nov 2022 12:29:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C16CD21E6921; Wed,  9 Nov 2022 13:29:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Keith Busch
 <kbusch@kernel.org>,  Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 1/2] hw/nvme: fix incorrect use of errp/local_err
References: <20221109105357.30430-1-its@irrelevant.dk>
 <20221109105357.30430-2-its@irrelevant.dk>
Date: Wed, 09 Nov 2022 13:29:20 +0100
In-Reply-To: <20221109105357.30430-2-its@irrelevant.dk> (Klaus Jensen's
 message of "Wed, 9 Nov 2022 11:53:56 +0100")
Message-ID: <87wn84nwf3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Klaus Jensen <its@irrelevant.dk> writes:

> From: Klaus Jensen <k.jensen@samsung.com>
>
> Make nvme_check_constraints() return an int and fix incorrect use of
> errp/local_err.
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index ac3885ce5079..4cc6ae753295 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -7035,7 +7035,7 @@ static const MemoryRegionOps nvme_cmb_ops = {
>      },
>  };
>  
> -static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
> +static int nvme_check_params(NvmeCtrl *n, Error **errp)

I prefer bool true on success, false on failure.  I use int only when it
lets me return additional information, such as a non-negative value on
success, or a negative error code on failure.  nvme_init_pci() is an
example of the latter (although its caller doesn't care).

Local consistency with nvme_init_subsys() is desirable.  You could
convert it to bool, along with nvme_init_pci().  Or you keep all three
int.  Up to you.

>  {
>      NvmeParams *params = &n->params;
>  
> @@ -7049,38 +7049,38 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>      if (n->namespace.blkconf.blk && n->subsys) {
>          error_setg(errp, "subsystem support is unavailable with legacy "
>                     "namespace ('drive' property)");
> -        return;
> +        return -1;
>      }
>  
>      if (params->max_ioqpairs < 1 ||
>          params->max_ioqpairs > NVME_MAX_IOQPAIRS) {
>          error_setg(errp, "max_ioqpairs must be between 1 and %d",
>                     NVME_MAX_IOQPAIRS);
> -        return;
> +        return -1;
>      }
>  
>      if (params->msix_qsize < 1 ||
>          params->msix_qsize > PCI_MSIX_FLAGS_QSIZE + 1) {
>          error_setg(errp, "msix_qsize must be between 1 and %d",
>                     PCI_MSIX_FLAGS_QSIZE + 1);
> -        return;
> +        return -1;
>      }
>  
>      if (!params->serial) {
>          error_setg(errp, "serial property not set");
> -        return;
> +        return -1;
>      }
>  
>      if (n->pmr.dev) {
>          if (host_memory_backend_is_mapped(n->pmr.dev)) {
>              error_setg(errp, "can't use already busy memdev: %s",
>                         object_get_canonical_path_component(OBJECT(n->pmr.dev)));
> -            return;
> +            return -1;
>          }
>  
>          if (!is_power_of_2(n->pmr.dev->size)) {
>              error_setg(errp, "pmr backend size needs to be power of 2 in size");
> -            return;
> +            return -1;
>          }
>  
>          host_memory_backend_set_mapped(n->pmr.dev, true);
> @@ -7089,64 +7089,64 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>      if (n->params.zasl > n->params.mdts) {
>          error_setg(errp, "zoned.zasl (Zone Append Size Limit) must be less "
>                     "than or equal to mdts (Maximum Data Transfer Size)");
> -        return;
> +        return -1;
>      }
>  
>      if (!n->params.vsl) {
>          error_setg(errp, "vsl must be non-zero");
> -        return;
> +        return -1;
>      }
>  
>      if (params->sriov_max_vfs) {
>          if (!n->subsys) {
>              error_setg(errp, "subsystem is required for the use of SR-IOV");
> -            return;
> +            return -1;
>          }
>  
>          if (params->sriov_max_vfs > NVME_MAX_VFS) {
>              error_setg(errp, "sriov_max_vfs must be between 0 and %d",
>                         NVME_MAX_VFS);
> -            return;
> +            return -1;
>          }
>  
>          if (params->cmb_size_mb) {
>              error_setg(errp, "CMB is not supported with SR-IOV");
> -            return;
> +            return -1;
>          }
>  
>          if (n->pmr.dev) {
>              error_setg(errp, "PMR is not supported with SR-IOV");
> -            return;
> +            return -1;
>          }
>  
>          if (!params->sriov_vq_flexible || !params->sriov_vi_flexible) {
>              error_setg(errp, "both sriov_vq_flexible and sriov_vi_flexible"
>                         " must be set for the use of SR-IOV");
> -            return;
> +            return -1;
>          }
>  
>          if (params->sriov_vq_flexible < params->sriov_max_vfs * 2) {
>              error_setg(errp, "sriov_vq_flexible must be greater than or equal"
>                         " to %d (sriov_max_vfs * 2)", params->sriov_max_vfs * 2);
> -            return;
> +            return -1;
>          }
>  
>          if (params->max_ioqpairs < params->sriov_vq_flexible + 2) {
>              error_setg(errp, "(max_ioqpairs - sriov_vq_flexible) must be"
>                         " greater than or equal to 2");
> -            return;
> +            return -1;
>          }
>  
>          if (params->sriov_vi_flexible < params->sriov_max_vfs) {
>              error_setg(errp, "sriov_vi_flexible must be greater than or equal"
>                         " to %d (sriov_max_vfs)", params->sriov_max_vfs);
> -            return;
> +            return -1;
>          }
>  
>          if (params->msix_qsize < params->sriov_vi_flexible + 1) {
>              error_setg(errp, "(msix_qsize - sriov_vi_flexible) must be"
>                         " greater than or equal to 1");
> -            return;
> +            return -1;
>          }
>  
>          if (params->sriov_max_vi_per_vf &&
> @@ -7154,7 +7154,7 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>              error_setg(errp, "sriov_max_vi_per_vf must meet:"
>                         " (sriov_max_vi_per_vf - 1) %% %d == 0 and"
>                         " sriov_max_vi_per_vf >= 1", NVME_VF_RES_GRANULARITY);
> -            return;
> +            return -1;
>          }
>  
>          if (params->sriov_max_vq_per_vf &&
> @@ -7163,9 +7163,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
>              error_setg(errp, "sriov_max_vq_per_vf must meet:"
>                         " (sriov_max_vq_per_vf - 1) %% %d == 0 and"
>                         " sriov_max_vq_per_vf >= 2", NVME_VF_RES_GRANULARITY);
> -            return;
> +            return -1;
>          }
>      }
> +
> +    return 0;
>  }
>  
>  static void nvme_init_state(NvmeCtrl *n)
> @@ -7564,7 +7566,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>  {
>      NvmeCtrl *n = NVME(pci_dev);
>      NvmeNamespace *ns;
> -    Error *local_err = NULL;
>      NvmeCtrl *pn = NVME(pcie_sriov_get_pf(pci_dev));
>  
>      if (pci_is_vf(pci_dev)) {
> @@ -7576,9 +7577,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>          n->subsys = pn->subsys;
>      }
>  
> -    nvme_check_constraints(n, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (nvme_check_params(n, errp)) {

If you stick to int, then please use

       if (nvme_check_params(n, errp) < 0) {

Here's why.

A bool-valued function that returns false on error we check like

       if (!foo()) {

A pointer-valued function that returns null on error we also check like

       if (!foo()) {

In both cases, convention makes it obvious we're testing for failure.

If you check an int-valued function that returns negative on error like

       if (foo() < 0) {

it's again obvious.

However, if you exploit the fact that it returns zero on success in the
check like

       if (foo()) {

then convention is of no help to readers.  They need to look up what
foo() returns to see whether this is checking for success or for
failure.

Makes sense?

>          return;
>      }
>  
> @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>                &pci_dev->qdev, n->parent_obj.qdev.id);
>  
>      if (nvme_init_subsys(n, errp)) {
> -        error_propagate(errp, local_err);
>          return;
>      }
>      nvme_init_state(n);


