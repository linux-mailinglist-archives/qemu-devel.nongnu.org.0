Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA53612272A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 09:57:27 +0100 (CET)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih8fW-0003eK-Rn
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 03:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ih8dp-0002YI-TT
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:55:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ih8do-00087l-U8
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:55:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50370
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ih8do-00085g-Qx
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576572940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vKs83JLl70hHBwVyUSD2vxluT9kCZg5KhTNlr3C81qU=;
 b=OgTVzdpvSdzFU6F4PAqhtYgFD4AeuIVVsKxHOif9SWwxG7ohdzwPoJVd/UxourE2N20nO5
 fA83RySRywP5K8Wk2gpzGHtX0NjhKuQhX7zPM4zFxmK4hp9zUgkbnN1Dx7YIx3mimH2b40
 0pKMEMloFDYOM+r7d+r3Rhnu9d/fIIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-e4qIWUrfNSKDjYFT8uenog-1; Tue, 17 Dec 2019 03:54:51 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61A061051461;
 Tue, 17 Dec 2019 08:54:50 +0000 (UTC)
Received: from [10.36.116.117] (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7813826DF9;
 Tue, 17 Dec 2019 08:54:49 +0000 (UTC)
Subject: Re: [PATCH v3 3/6] hw/arm/smmuv3: Check stream IDs against actual
 table LOG2SIZE
To: Simon Veith <sveith@amazon.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1576509312-13083-1-git-send-email-sveith@amazon.de>
 <1576509312-13083-4-git-send-email-sveith@amazon.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <51c6ef39-f714-0d6b-7b14-2b49b298e556@redhat.com>
Date: Tue, 17 Dec 2019 09:54:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1576509312-13083-4-git-send-email-sveith@amazon.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: e4qIWUrfNSKDjYFT8uenog-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
> When checking whether a stream ID is in range of the stream table, we
> have so far been only checking it against our implementation limit
> (SMMU_IDR1_SIDSIZE). However, the guest can program the
> STRTAB_BASE_CFG.LOG2SIZE field to a size that is smaller than this
> limit.
> 
> Check the stream ID against this limit as well to match the hardware
> behavior of raising C_BAD_STREAMID events in case the limit is exceeded.
> Also, ensure that we do not go one entry beyond the end of the table by
> checking that its index is strictly smaller than the table size.
> 
> ref. ARM IHI 0070C, section 6.3.24.
> 
> Signed-off-by: Simon Veith <sveith@amazon.de>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
Acked-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> Changed in v2:
> 
> * Also check that stream ID is strictly lower than the table size
> 
>  hw/arm/smmuv3.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index eef9a18..727558b 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -377,11 +377,15 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>                           SMMUEventInfo *event)
>  {
>      dma_addr_t addr;
> +    uint32_t log2size;
>      int ret;
>  
>      trace_smmuv3_find_ste(sid, s->features, s->sid_split);
> -    /* Check SID range */
> -    if (sid > (1 << SMMU_IDR1_SIDSIZE)) {
> +    log2size = FIELD_EX32(s->strtab_base_cfg, STRTAB_BASE_CFG, LOG2SIZE);
> +    /*
> +     * Check SID range against both guest-configured and implementation limits
> +     */
> +    if (sid >= (1 << MIN(log2size, SMMU_IDR1_SIDSIZE))) {
>          event->type = SMMU_EVT_C_BAD_STREAMID;
>          return -EINVAL;
>      }
> 


