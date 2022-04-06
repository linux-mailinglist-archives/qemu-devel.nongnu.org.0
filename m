Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19454F631A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:27:38 +0200 (CEST)
Received: from localhost ([::1]:40656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7ZJ-0006tg-7a
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nc7Uu-00056o-78
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:23:04 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nc7Ur-00086A-Qv
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:23:03 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 3D54820770;
 Wed,  6 Apr 2022 15:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1649258579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVEEexUGDuZkB44mFR0zCM5SNB2sTT+xEvc+KJJIfBY=;
 b=2pDuluTCGj+aWyjMI7qYfVvgTUEjKkSetVExWq3quURO4Y7e6Rp2bKqav4etOcfakvNusQ
 wBPbt1RZOcd5I7QrzhW6nMqlJMv4asuTysuxN1AP/yshxmGRhvY1KlKk6p5OQZ2F3eXvI/
 ym2t9nBu8PmG7aK1lKkwfiEzM5HdSzA=
Message-ID: <9c87f0c0-8b04-759f-fb87-9b983965e354@greensocs.com>
Date: Wed, 6 Apr 2022 17:22:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hw/vfio/common: Fix a small boundary issue of a trace
Content-Language: en-US-large
To: chenxiang <chenxiang66@hisilicon.com>, alex.williamson@redhat.com
References: <1649232889-191210-1-git-send-email-chenxiang66@hisilicon.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <1649232889-191210-1-git-send-email-chenxiang66@hisilicon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, linuxarm@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/6/22 10:14, chenxiang via wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> Right now the trace of vfio_region_sparse_mmap_entry is as follows:
> vfio_region_sparse_mmap_entry sparse entry 0 [0x1000 - 0x9000]
> Actually the range it wants to show is [0x1000 - 0x8fff]，so fix it.
> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>   hw/vfio/common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f5..0b3808caf8 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1546,7 +1546,7 @@ static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
>       for (i = 0, j = 0; i < sparse->nr_areas; i++) {
>           trace_vfio_region_sparse_mmap_entry(i, sparse->areas[i].offset,
>                                               sparse->areas[i].offset +
> -                                            sparse->areas[i].size);
> +                                            sparse->areas[i].size - 1);
>   
>           if (sparse->areas[i].size) {
>               region->mmaps[j].offset = sparse->areas[i].offset;

If the size if zero, the trace will be weird with an underflow if offset 
is zero as well.
Maybe just change the trace by inverting the right bracket ?
eg: [0x1000 - 0x9000[
Or don't trace in that case ? (but I am not maintainer of this, so maybe 
that does not make sense).

--
Damien

