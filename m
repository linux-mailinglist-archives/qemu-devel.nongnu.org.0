Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CAA122725
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 09:56:23 +0100 (CET)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih8eU-0002gO-A7
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 03:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ih8dK-000233-JP
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:55:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ih8dJ-0006Yq-KP
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:55:10 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23414
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ih8dJ-0006YD-H8
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576572909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cCzvUMPeYUWri5dkvEAVyVTWUXotoL4CI59FxQhSps=;
 b=I5r5Teu7Vco03qtUtEIfeBglgVMFUjBkID9Dr/mizCqY4yFYR2HLTXjr/8Mug8XdJBANsJ
 akcOocefeuyfDebDc87O5HMsCEVSilEcUd50CWTrmEOljVv1TF7YGchWbGmXoTh9iFi/WI
 60jKZSe6EhKlXbL0XXuTsKm5vbz/c8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-qGU9WmU4PJ6mX_u7VaknPA-1; Tue, 17 Dec 2019 03:55:05 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9127E18FF662;
 Tue, 17 Dec 2019 08:55:04 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10616106E;
 Tue, 17 Dec 2019 08:55:03 +0000 (UTC)
Subject: Re: [PATCH v3 2/6] hw/arm/smmuv3: Correct SMMU_BASE_ADDR_MASK value
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
 <1576509312-13083-3-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9a0ca836-7c0c-d203-eb54-ca7e439f5e8d@redhat.com>
Date: Tue, 17 Dec 2019 09:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1576509312-13083-3-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qGU9WmU4PJ6mX_u7VaknPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Simon,

On 12/16/19 4:15 PM, Simon Veith wrote:
> There are two issues with the current value of SMMU_BASE_ADDR_MASK:
> 
> - At the lower end, we are clearing bits [4:0]. Per the SMMUv3 spec,
>   we should also be treating bit 5 as zero in the base address.
> - At the upper end, we are clearing bits [63:48]. Per the SMMUv3 spec,
>   only bits [63:52] must be explicitly treated as zero.
> 
> Update the SMMU_BASE_ADDR_MASK value to mask out bits [63:52] and [5:0].
> 
> ref. ARM IHI 0070C, section 6.3.23.
> 
> Signed-off-by: Simon Veith <sveith@amazon.de>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmuv3-internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index d190181..042b435 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -99,7 +99,7 @@ REG32(GERROR_IRQ_CFG2, 0x74)
>  
>  #define A_STRTAB_BASE      0x80 /* 64b */
>  
> -#define SMMU_BASE_ADDR_MASK 0xffffffffffe0
> +#define SMMU_BASE_ADDR_MASK 0xfffffffffffc0
>  
>  REG32(STRTAB_BASE_CFG,     0x88)
>      FIELD(STRTAB_BASE_CFG, FMT,      16, 2)
> 


