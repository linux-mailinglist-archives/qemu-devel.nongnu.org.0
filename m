Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37E387E66
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 19:32:13 +0200 (CEST)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj3Zk-0006Dq-4a
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 13:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj3YO-0005NA-ML
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lj3YC-0002M8-TC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:30:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621359036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kL+I+n3YrQa/nBlKIhoO90ZBjyy5YXDUASctktCP/O0=;
 b=RPm+4PrHM+t7NTMY9SMw73geEFXY2MwREwfecqIZgqNYjhkfMXFT8Gh7+05U0IEGTmQl8H
 Bw+P8WKK9PowOQ+X2x1FOGGpte2ISxTOzmius+doeCWt3xxoTP2X7HTJA73Wertf7xfM0j
 gfFfBbGpLSYMh8YBF6p9aZfbv9y9hV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-RoJoPvldPw-wqGvJFag7TQ-1; Tue, 18 May 2021 13:30:32 -0400
X-MC-Unique: RoJoPvldPw-wqGvJFag7TQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD89F107ACCA;
 Tue, 18 May 2021 17:30:30 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8BA018EC9;
 Tue, 18 May 2021 17:30:29 +0000 (UTC)
Subject: Re: [PATCH] fdc: check null block pointer before blk_pwrite
To: P J P <ppandit@redhat.com>
References: <20200827113806.1850687-1-ppandit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <bf19bfa8-7cab-0800-c5d1-db880ca1cf54@redhat.com>
Date: Tue, 18 May 2021 13:30:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20200827113806.1850687-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Ruhr-University <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/20 7:38 AM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While transferring data via fdctrl_write_data(), check that
> current drive does not have a null block pointer. Avoid
> null pointer dereference.
> 

Hi PJP. I assume this patch actually covers the exact same thing that 
the other if cur_drv->blk patch we have been discussing recently does.

You may want to combine the Reported-By lines for both.

I am dropping this patch from my queue in favor of pursuing our other, 
more recent and active thread, which I am also now tracking via this 
gitlab issue:

https://gitlab.com/qemu-project/qemu/-/issues/338

>   -> https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Ffdc_nullptr1
>      ==1658854==Hint: address points to the zero page.
>      #0 blk_inc_in_flight block/block-backend.c:1327
>      #1 blk_prw block/block-backend.c:1299
>      #2 blk_pwrite block/block-backend.c:1464
>      #3 fdctrl_write_data hw/block/fdc.c:2418
>      #4 fdctrl_write hw/block/fdc.c:962
>      #5 portio_write ioport.c:205
>      #6 memory_region_write_accessor memory.c:483
>      #7 access_with_adjusted_size memory.c:544
>      #8 memory_region_dispatch_write memory.c:1476
> 
> Reported-by: Ruhr-University <bugs-syssec@rub.de>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>   hw/block/fdc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index e9ed3eef45..dedadac68a 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -2419,7 +2419,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
>           if (pos == FD_SECTOR_LEN - 1 ||
>               fdctrl->data_pos == fdctrl->data_len) {
>               cur_drv = get_cur_drv(fdctrl);
> -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
> +            if (cur_drv->blk
> +                && blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
>                              BDRV_SECTOR_SIZE, 0) < 0) {
>                   FLOPPY_DPRINTF("error writing sector %d\n",
>                                  fd_sector(cur_drv));
> 


