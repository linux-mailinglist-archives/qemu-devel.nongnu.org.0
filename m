Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C67A290229
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 11:48:51 +0200 (CEST)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTMLy-0002JQ-4f
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 05:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kTMKl-0001d3-S8
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 05:47:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kTMKi-00084f-MN
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 05:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602841650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYqX6D4dvcbYtgT/9hvgfkKKouiFcwBUepE6ev9Fg3w=;
 b=TGMjYb+LmrFzY/FQ+WDWSMj/tWafDiB6FfP8R9gDhzrzlscxVK5TOk+MSuXgdao6qLWVMg
 ns6eqqwOUkZCUBpmB/zAn2tzj163SfA/Be2NShsq2uRrhp0walDtj56kcva4dgWebZ1r34
 ej/7J/CQp/5mCpi/UwCS0InYI3rDnFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-jcADMrBPOXW1Bn5Eoi0opA-1; Fri, 16 Oct 2020 05:47:27 -0400
X-MC-Unique: jcADMrBPOXW1Bn5Eoi0opA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA76C107AD91;
 Fri, 16 Oct 2020 09:47:25 +0000 (UTC)
Received: from [10.36.113.210] (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6052160BFA;
 Fri, 16 Oct 2020 09:47:15 +0000 (UTC)
Subject: Re: [PATCH v10 10/10] vfio: Don't issue full 2^64 unmap
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 alex.williamson@redhat.com
References: <20201008171558.410886-1-jean-philippe@linaro.org>
 <20201008171558.410886-11-jean-philippe@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <635dcd6c-96a2-16bd-ce75-0dceddf95b94@redhat.com>
Date: Fri, 16 Oct 2020 11:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20201008171558.410886-11-jean-philippe@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 20:29:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, bbhushan2@marvell.com, qemu-devel@nongnu.org,
 peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 10/8/20 7:15 PM, Jean-Philippe Brucker wrote:
> IOMMUs may declare memory regions spanning from 0 to UINT64_MAX. When
> attempting to deal with such region, vfio_listener_region_del() passes a
> size of 2^64 to int128_get64() which throws an assertion failure.  Even
> ignoring this, the VFIO_IOMMU_DMA_MAP ioctl cannot handle this size
> since the size field is 64-bit. Split the request in two.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> For me this happens when memory_region_iommu_set_page_size_mask()
> returns an error because a hotplugged endpoint uses an incompatible page
> mask. vfio_connect_container() releases the memory listener which calls
> region_del() with the 2^64 IOMMU region. There are probably other ways
> to reach this.
> ---
>  hw/vfio/common.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index e66054b02a7..e90a89c389e 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -797,6 +797,17 @@ static void vfio_listener_region_del(MemoryListener *listener,
>      }
>  
>      if (try_unmap) {
> +        if (llsize == int128_2_64()) {
> +            /* The unmap ioctl doesn't accept a full 64-bit span. */
> +            llsize = int128_rshift(llsize, 1);
> +            ret = vfio_dma_unmap(container, iova, int128_get64(llsize));
> +            if (ret) {
> +                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> +                             "0x%"HWADDR_PRIx") = %d (%m)",
> +                             container, iova, int128_get64(llsize), ret);
> +            }
> +            iova += int128_get64(llsize);
> +        }
>          ret = vfio_dma_unmap(container, iova, int128_get64(llsize));
>          if (ret) {
>              error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
> 


