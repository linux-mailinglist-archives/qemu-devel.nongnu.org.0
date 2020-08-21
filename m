Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A2724D1ED
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 12:04:44 +0200 (CEST)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k93ud-0005Wg-Or
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 06:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k93to-0004uy-Sp
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:03:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k93tn-0007SB-4v
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598004230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SdnFq1C4zsn3XuxNxCBilaXazBUOn+wzl/d6WTPGpBA=;
 b=L2ynu3fJ/ruymhTTZ++6JPE7frEXn+Br5tsz1d+x0L0k/hrsFmAOmKJwAgG6ELQ67wccRg
 cxFJPBvmYPNTVAgvzScNrMNDGAibRVYah7+uDt4MSnK4ZEChx7FF+E/8ZyZnfCYqRx+H9W
 vTl/5xQnQAVzREf5LPuEoWw5j0Kkwss=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-bSF1tzgzPVyc5V0rNN6-rg-1; Fri, 21 Aug 2020 06:03:46 -0400
X-MC-Unique: bSF1tzgzPVyc5V0rNN6-rg-1
Received: by mail-wm1-f71.google.com with SMTP id z1so619597wmf.9
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 03:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Nd89OKL2J48pk86Nzk1QLUOUXnv1vQrLcJS6tFTBHgk=;
 b=oBnQUOfmLWgYFkZNvoe0k6T5C4WK3otezveHy+4LcfHi4xjn5LKUpqXPxJEeSqKDBr
 cA7exGuY9ztp9ikpyU4wDQuSX/0ti8a2ZTofOubyn7m+ll0qfjlSolq30x1pkfttgL62
 524vdn+/ee08T+8RhXt8S0HCzZ4/0Mm/OJkjYEcBiZPeSr2ZpvgMX25iGhemup4LCXIt
 EVSZ++C/YDfM49u9lu3R2XKfkdnKZ6q6EGzCwKszxMbKPqyOAHjf0Ibwum7uIiIdjPMr
 wkusowkn3Ac8RRJqFrM3iwGGK5qo4sfAvpzk+Wes2g74+dswnhIJL6N3VR4/rBieboAP
 gk8w==
X-Gm-Message-State: AOAM5319Q7M7RXspcHZzbHYbz9SNP07w20Mj05Yl5e0XpmgjHy1bVXS9
 o0IryqJxEvoOig8two3F1+LJZtvnGczyWtEWCUxMzxZ5eleexuLlRr1Iix+LYpIAAV8pqqDiFEy
 xJBzd7kMuSBq33uM=
X-Received: by 2002:a1c:8195:: with SMTP id c143mr3068009wmd.85.1598004225220; 
 Fri, 21 Aug 2020 03:03:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq66D7B6tevQfIOliwle1ci5UiKzaNnvA9LbvWPfQ+9WtsuSwwM7PsWn3VGOktArWIqO0F5w==
X-Received: by 2002:a1c:8195:: with SMTP id c143mr3067984wmd.85.1598004224958; 
 Fri, 21 Aug 2020 03:03:44 -0700 (PDT)
Received: from steredhat (host-79-33-191-244.retail.telecomitalia.it.
 [79.33.191.244])
 by smtp.gmail.com with ESMTPSA id 33sm3421510wri.16.2020.08.21.03.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:03:44 -0700 (PDT)
Date: Fri, 21 Aug 2020 12:03:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 08/15] block/nvme: Use union of NvmeIdCtrl / NvmeIdNs
 structures
Message-ID: <20200821100341.a6xtnv4e2dqli56a@steredhat>
References: <20200820165901.1139109-1-philmd@redhat.com>
 <20200820165901.1139109-9-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820165901.1139109-9-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 20, 2020 at 06:58:54PM +0200, Philippe Mathieu-Daudé wrote:
> We allocate an unique chunk of memory then use it for two
> different structures. By using an union, we make it clear
> the data is overlapping (and we can remove the casts).
> 
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/nvme.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 99822d9fd36..2bd1935f951 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -508,9 +508,10 @@ static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
>  static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>  {
>      BDRVNVMeState *s = bs->opaque;
> -    NvmeIdCtrl *idctrl;
> -    NvmeIdNs *idns;
> -    uint8_t *id;
> +    union {
> +        NvmeIdCtrl ctrl;
> +        NvmeIdNs ns;
> +    } *id;

What about defining a new 'NvmeId' type with this union?

>      NvmeLBAF *lbaf;
>      uint16_t oncs;
>      int r;
> @@ -520,14 +521,12 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>          .cdw10 = cpu_to_le32(0x1),
>      };
>  
> -    id = qemu_try_blockalign0(bs, sizeof(NvmeIdCtrl));
> +    id = qemu_try_blockalign0(bs, sizeof(*id));
>      if (!id) {
>          error_setg(errp, "Cannot allocate buffer for identify response");
>          goto out;
>      }
> -    idctrl = (NvmeIdCtrl *)id;
> -    idns = (NvmeIdNs *)id;
> -    r = qemu_vfio_dma_map(s->vfio, id, sizeof(NvmeIdCtrl), true, &iova);
> +    r = qemu_vfio_dma_map(s->vfio, id, sizeof(*id), true, &iova);
>      if (r) {
>          error_setg(errp, "Cannot map buffer for DMA");
>          goto out;
> @@ -539,22 +538,22 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>          goto out;
>      }
>  
> -    if (le32_to_cpu(idctrl->nn) < namespace) {
> +    if (le32_to_cpu(id->ctrl.nn) < namespace) {
>          error_setg(errp, "Invalid namespace");
>          goto out;
>      }
> -    s->write_cache_supported = le32_to_cpu(idctrl->vwc) & 0x1;
> -    s->max_transfer = (idctrl->mdts ? 1 << idctrl->mdts : 0) * s->page_size;
> +    s->write_cache_supported = le32_to_cpu(id->ctrl.vwc) & 0x1;
> +    s->max_transfer = (id->ctrl.mdts ? 1 << id->ctrl.mdts : 0) * s->page_size;
>      /* For now the page list buffer per command is one page, to hold at most
>       * s->page_size / sizeof(uint64_t) entries. */
>      s->max_transfer = MIN_NON_ZERO(s->max_transfer,
>                            s->page_size / sizeof(uint64_t) * s->page_size);
>  
> -    oncs = le16_to_cpu(idctrl->oncs);
> +    oncs = le16_to_cpu(id->ctrl.oncs);
>      s->supports_write_zeroes = !!(oncs & NVME_ONCS_WRITE_ZEROS);
>      s->supports_discard = !!(oncs & NVME_ONCS_DSM);
>  
> -    memset(id, 0, 4096);
> +    memset(id, 0, sizeof(*id));
>      cmd.cdw10 = 0;
>      cmd.nsid = cpu_to_le32(namespace);
>      if (nvme_cmd_sync(bs, s->queues[INDEX_ADMIN], &cmd)) {
> @@ -562,11 +561,11 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
>          goto out;
>      }
>  
> -    s->nsze = le64_to_cpu(idns->nsze);
> -    lbaf = &idns->lbaf[NVME_ID_NS_FLBAS_INDEX(idns->flbas)];
> +    s->nsze = le64_to_cpu(id->ns.nsze);
> +    lbaf = &id->ns.lbaf[NVME_ID_NS_FLBAS_INDEX(id->ns.flbas)];
>  
> -    if (NVME_ID_NS_DLFEAT_WRITE_ZEROES(idns->dlfeat) &&
> -            NVME_ID_NS_DLFEAT_READ_BEHAVIOR(idns->dlfeat) ==
> +    if (NVME_ID_NS_DLFEAT_WRITE_ZEROES(id->ns.dlfeat) &&
> +            NVME_ID_NS_DLFEAT_READ_BEHAVIOR(id->ns.dlfeat) ==
>                      NVME_ID_NS_DLFEAT_READ_BEHAVIOR_ZEROES) {
>          bs->supported_write_flags |= BDRV_REQ_MAY_UNMAP;
>      }
> -- 
> 2.26.2
> 
> 

With or without the new tyoe, the patch looks good to me:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


