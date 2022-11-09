Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC4E622BA0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:34:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskH4-00085H-Uv; Wed, 09 Nov 2022 07:33:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskH2-00084r-9P
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:33:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oskH0-0004N5-UC
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667997222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lCD/mDrZL3X1FVpyFjQBWpEeYbX9B3vXkfTw46UDaPU=;
 b=hzt+/lrKqQxmj5UhW8Sd+9Ap8Il4lSlg57YQNxv4HRTSL0Ljsuw+SXz/gDvDnqmDSzXZ8M
 CHyp+DMLV0tBV4NpQWqUJYwcP0o9H3Q6JUpYIlDbqD5bBo1+/FPoE+YV69xEfHFKf6sByG
 FRexwb07cFzJsGL2B/uncipGxuIxuQg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-jxmHwnv-N4yOY7r1BuJEGA-1; Wed, 09 Nov 2022 07:33:36 -0500
X-MC-Unique: jxmHwnv-N4yOY7r1BuJEGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9431185A7AE;
 Wed,  9 Nov 2022 12:33:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A535D2166B29;
 Wed,  9 Nov 2022 12:33:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8958D21E6921; Wed,  9 Nov 2022 13:33:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  Keith Busch
 <kbusch@kernel.org>,  Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
References: <20221109105357.30430-1-its@irrelevant.dk>
 <20221109105357.30430-3-its@irrelevant.dk>
Date: Wed, 09 Nov 2022 13:33:33 +0100
In-Reply-To: <20221109105357.30430-3-its@irrelevant.dk> (Klaus Jensen's
 message of "Wed, 9 Nov 2022 11:53:57 +0100")
Message-ID: <87sfisnw82.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
> Replace the local Error variable with errp and ERRP_GUARD().
>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 4cc6ae753295..38eb5ec54f9d 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -7345,13 +7345,13 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
>  
>  static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>  {
> +    ERRP_GUARD();
> +

Drop the blank line, please.

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
> @@ -7388,13 +7388,13 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>      }
>      ret = msix_init(pci_dev, n->params.msix_qsize,
>                      &n->bar0, 0, msix_table_offset,
> -                    &n->bar0, 0, msix_pba_offset, 0, &err);
> +                    &n->bar0, 0, msix_pba_offset, 0, errp);
>      if (ret < 0) {
>          if (ret == -ENOTSUP) {
> -            warn_report_err(err);
> +            warn_report_err(*errp);
> +            *errp = NULL;
>          } else {
> -            error_propagate(errp, err);
> -            return ret;
> +            return -1;
>          }
>      }

Suggest to reduce nesting:

       if (ret == -ENOTSUP) {
           warn_report_err(*errp);
           *errp = NULL;
       } else if (ret < 0) {
           return -1;
       }

Entirely up to you.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


