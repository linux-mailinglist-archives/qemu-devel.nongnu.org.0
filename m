Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FB3494D9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:02:25 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRV9-0007ys-3Q
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPRSF-0006ts-OU
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:59:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPRS9-0002Tz-Rp
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616684354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rJMh0y0ddtRVjV56MbL77inVy+ML7ywKCz7f783g4I=;
 b=ULZ/tBdQuHLr/98tEhe2bpT19Kc5KUTnrz2xnDy3HDpY9taWxmqsJz0xMWzz72Mb+Nkhwi
 S/0uOCeGhix/gCAhy5zscxwD8ulNx4pqjXzU/eEtbiwMLbV1+dAM9dwRAr4Uil3B5yuKXW
 wDJVvjG46FGZnYyvXh9oiGce+u8OJvg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60--HCPVSKoODaTmTZjCTo0xA-1; Thu, 25 Mar 2021 10:59:12 -0400
X-MC-Unique: -HCPVSKoODaTmTZjCTo0xA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1DB9801FCE;
 Thu, 25 Mar 2021 14:59:10 +0000 (UTC)
Received: from [10.36.112.13] (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7328210013D7;
 Thu, 25 Mar 2021 14:59:08 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20210325142702.790-1-yuzenghui@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a6d396c7-128f-a16d-d872-286520e6da86@redhat.com>
Date: Thu, 25 Mar 2021 15:59:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325142702.790-1-yuzenghui@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zenghui,

On 3/25/21 3:27 PM, Zenghui Yu wrote:
> They were introduced in commit 9bde7f0674fe ("hw/arm/smmuv3: Implement
> translate callback") but never actually used. Drop them.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  hw/arm/smmuv3-internal.h | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index b6f7e53b7c..3dac5766ca 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -595,13 +595,6 @@ static inline int pa_range(STE *ste)
>  #define CD_A(x)          extract32((x)->word[1], 14, 1)
>  #define CD_AARCH64(x)    extract32((x)->word[1], 9 , 1)
>  
> -#define CDM_VALID(x)    ((x)->word[0] & 0x1)
> -
> -static inline int is_cd_valid(SMMUv3State *s, STE *ste, CD *cd)
> -{
> -    return CD_VALID(cd);
> -}
> -
>  /**
>   * tg2granule - Decodes the CD translation granule size field according
>   * to the ttbr in use
> 
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


