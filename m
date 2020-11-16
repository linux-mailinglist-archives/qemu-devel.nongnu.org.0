Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BED2B4DE3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 18:48:14 +0100 (CET)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keibt-0006Iu-2H
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 12:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1keiaT-0005Qb-1z
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:46:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1keiaQ-0008DN-2w
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 12:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605548801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3SZrwFy94uqqUNynXuBp4m3e29h27rqR4XdQ73aJwA=;
 b=KmZCPotS0MHEg20B8wotBCWY4VJIUQv7t6pdWLFbxd0pRPw35Hu4WZLm9Prkt+qngDyHyF
 IatbjJthS0tmvZ7+elx+r+YyiU4iDl5fdZDtXPqubEpYuQlZSRi8/Mej5byvRgu1zczOXJ
 CEp38G+gPLLjVXNbeUbMtbzpFs+I3VU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-Fs1SYoHcM8y6DcdAEDrZqg-1; Mon, 16 Nov 2020 12:46:36 -0500
X-MC-Unique: Fs1SYoHcM8y6DcdAEDrZqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99F5B803F44;
 Mon, 16 Nov 2020 17:46:34 +0000 (UTC)
Received: from gondolin (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 866176BF6B;
 Mon, 16 Nov 2020 17:46:32 +0000 (UTC)
Date: Mon, 16 Nov 2020 18:46:29 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] memory: Skip dirty tracking for un-migratable memory
 regions
Message-ID: <20201116184629.7455b82a.cohuck@redhat.com>
In-Reply-To: <20201116132210.1730-1-yuzenghui@huawei.com>
References: <20201116132210.1730-1-yuzenghui@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kwankhede@nvidia.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, wanghaibin.wang@huawei.com, pbonzini@redhat.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 21:22:10 +0800
Zenghui Yu <yuzenghui@huawei.com> wrote:

> It makes no sense to track dirty pages for those un-migratable memory
> regions (e.g., Memory BAR region of the VFIO PCI device) and doing so
> will potentially lead to some unpleasant issues during migration [1].
> 
> Skip dirty tracking for those regions by evaluating if the region is
> migratable before setting dirty_log_mask (DIRTY_MEMORY_MIGRATION).
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg03757.html
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  softmmu/memory.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 71951fe4dc..aa393f1bb0 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1806,7 +1806,10 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>  {
>      uint8_t mask = mr->dirty_log_mask;
> -    if (global_dirty_log && (mr->ram_block || memory_region_is_iommu(mr))) {
> +    RAMBlock *rb = mr->ram_block;
> +
> +    if (global_dirty_log && ((rb && qemu_ram_is_migratable(rb)) ||
> +                             memory_region_is_iommu(mr))) {
>          mask |= (1 << DIRTY_MEMORY_MIGRATION);
>      }
>      return mask;

Looks reasonable.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


