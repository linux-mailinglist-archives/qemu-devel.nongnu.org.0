Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2016623F5A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:04:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Pc-0001K9-LM; Thu, 10 Nov 2022 05:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot4PM-0001JS-Cj
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:03:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ot4PK-0002mD-3K
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668074616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V+FdBRqhzRt68W6h/w07KyArBhQTCFB50wC1O6AStuA=;
 b=AlXNZVkG4OzOd28os+vm2kYInjatb2NfblEPTOEHc4gGAa7tMlGgN52AdhWV9MSsfwNIy6
 PqDBqH8QQ2O2BVUMcjAwRaxYilTPOrMwWItaak0TgLVCPjRIJ34L9xQiU/RcuYo7KLOxlE
 /uH8FXE/nQmHK+Zb1TIxgxaHNATTr40=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-FUABuzCqOhukOTZSWkJ9Xg-1; Thu, 10 Nov 2022 05:03:32 -0500
X-MC-Unique: FUABuzCqOhukOTZSWkJ9Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6029E38005D2;
 Thu, 10 Nov 2022 10:03:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BB2E1415114;
 Thu, 10 Nov 2022 10:03:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1FE5A21E6921; Thu, 10 Nov 2022 11:03:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org,  Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 1/2] hw/nvme: fix incorrect use of errp/local_err
References: <20221110062335.18401-1-its@irrelevant.dk>
 <20221110062335.18401-2-its@irrelevant.dk>
Date: Thu, 10 Nov 2022 11:03:31 +0100
In-Reply-To: <20221110062335.18401-2-its@irrelevant.dk> (Klaus Jensen's
 message of "Thu, 10 Nov 2022 07:23:34 +0100")
Message-ID: <87a64zjfd8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Make nvme_check_constraints() return a bool and fix an invalid error
> propagation where the actual error is thrown away in favor of an unused
> local Error value.

Is it?  I think you're talking about ...

> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index ac3885ce5079..a5c0a5fa6ce2 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c

[...]

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
> +    if (!nvme_check_params(n, errp)) {
>          return;
>      }
>  
> @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>                &pci_dev->qdev, n->parent_obj.qdev.id);
>  
>      if (nvme_init_subsys(n, errp)) {
> -        error_propagate(errp, local_err);

... this one.  error_propagate() does nothing here, because @local_err
is still null.

>          return;
>      }
>      nvme_init_state(n);


