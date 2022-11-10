Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD9623F3F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:00:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4ME-0007yl-S5; Thu, 10 Nov 2022 05:00:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot4MD-0007wy-10
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:00:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot4Ly-0000L7-M9
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668074409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OQu+OkfOVOi8yo2Zig61RefL0P8T+TaKG9xef5cWYWk=;
 b=Ad1h8UzRnYXAQy17D3Qe2YpPzavWGGkpOPzrEmJr1deNjBDRP8jdIOSNJsbfvAqoXdN4mr
 0/5nQSzLt8rO/JzvlJi7o/iX2uXgk1Sbjyw1x0PVFhgCZFFslnxgDYqKaH5SFnH1hJlHwc
 fZUxf79xqrbgHjL2gzJngOv+22E2/Pk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-uvOYVx4cOuuO9otZh8WvPw-1; Thu, 10 Nov 2022 05:00:05 -0500
X-MC-Unique: uvOYVx4cOuuO9otZh8WvPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D4C2101AA4D;
 Thu, 10 Nov 2022 10:00:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E735F40C94AA;
 Thu, 10 Nov 2022 10:00:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7080B21E6921; Thu, 10 Nov 2022 11:00:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org,  Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
References: <20221110062335.18401-1-its@irrelevant.dk>
 <20221110062335.18401-3-its@irrelevant.dk>
Date: Thu, 10 Nov 2022 11:00:03 +0100
In-Reply-To: <20221110062335.18401-3-its@irrelevant.dk> (Klaus Jensen's
 message of "Thu, 10 Nov 2022 07:23:35 +0100")
Message-ID: <87edubjfj0.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Replace the local Error variable with errp and ERRP_GUARD() and change
> the return value to bool.
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index a5c0a5fa6ce2..e23af4db91ae 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -7343,15 +7343,14 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
>      return 0;
>  }
>  
> -static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
> +static bool nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>  {
> +    ERRP_GUARD();
>      uint8_t *pci_conf = pci_dev->config;
>      uint64_t bar_size;
>      unsigned msix_table_offset, msix_pba_offset;
>      int ret;
>  
> -    Error *err = NULL;
> -
>      pci_conf[PCI_INTERRUPT_PIN] = 1;
>      pci_config_set_prog_interface(pci_conf, 0x2);
>  
> @@ -7388,14 +7387,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>      }
>      ret = msix_init(pci_dev, n->params.msix_qsize,
>                      &n->bar0, 0, msix_table_offset,
> -                    &n->bar0, 0, msix_pba_offset, 0, &err);
> -    if (ret < 0) {
> -        if (ret == -ENOTSUP) {
> -            warn_report_err(err);
> -        } else {
> -            error_propagate(errp, err);
> -            return ret;
> -        }
> +                    &n->bar0, 0, msix_pba_offset, 0, errp);
> +    if (ret == -ENOTSUP) {
> +        warn_report_err(*errp);
> +        *errp = NULL;
> +    } else {

Uh, shouldn't this be

       } else if (ret < 0) {

?

> +        return false;
>      }
>  
>      nvme_update_msixcap_ts(pci_dev, n->conf_msix_qsize);
> @@ -7412,7 +7409,7 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>          nvme_init_sriov(n, pci_dev, 0x120);
>      }
>  
> -    return 0;
> +    return true;
>  }
>  
>  static void nvme_init_subnqn(NvmeCtrl *n)
> @@ -7588,7 +7585,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>          return;
>      }
>      nvme_init_state(n);
> -    if (nvme_init_pci(n, pci_dev, errp)) {
> +    if (!nvme_init_pci(n, pci_dev, errp)) {
>          return;
>      }
>      nvme_init_ctrl(n, pci_dev);


