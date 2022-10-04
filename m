Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34105F40F4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 12:43:51 +0200 (CEST)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1offOx-0003aL-0a
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 06:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1offMf-0000WB-HY
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1offMZ-0002Ru-FX
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 06:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664880082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1M+NgUM5GZ5+imRVNWwYLnc6H57LmwBusuOnXas8ihg=;
 b=SYpCuDEGL+el3yDrPhQ7m+luR8EKvwq1+yK7genSsbTfC01+YE954iarcLX3YXHdd/sPMk
 Et9m5/IHoVZpvl+J31DHiIoI6TYgAsPSHqz7eASrtvJkoKrXPUPTzzK0EgU3qrX/to5MkU
 X99U4kofQh63Kkw/XMopA8K7L86Q7vE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-0V2BPLTPOwOKy122kn9yRA-1; Tue, 04 Oct 2022 06:41:18 -0400
X-MC-Unique: 0V2BPLTPOwOKy122kn9yRA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FDAA857F8F;
 Tue,  4 Oct 2022 10:41:18 +0000 (UTC)
Received: from localhost (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F9AA2027061;
 Tue,  4 Oct 2022 10:41:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4 4/6] hw/arm/virt: Introduce
 virt_get_high_memmap_enabled() helper
In-Reply-To: <20221004002627.59172-5-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-5-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 04 Oct 2022 12:41:16 +0200
Message-ID: <87edvnooqb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces virt_get_high_memmap_enabled() helper, which returns
> the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
> be used in the subsequent patches.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b0b679d1f4..59de7b78b5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1689,14 +1689,29 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>      return arm_cpu_mp_affinity(idx, clustersz);
>  }
>  
> +static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
> +                                                 int index)
> +{
> +    bool *enabled_array[] = {
> +        &vms->highmem_redists,
> +        &vms->highmem_ecam,
> +        &vms->highmem_mmio,
> +    };
> +
> +    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));

I wonder whether we want an assert(ARRAY_SIZE(extended_memmap) ==
ARRAY_SIZE(enabled_array))? IIUC, we never want those two to get out of
sync?

> +
> +    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
> +}
> +


