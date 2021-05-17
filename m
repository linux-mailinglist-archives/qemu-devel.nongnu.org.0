Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61863386D0F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 00:40:39 +0200 (CEST)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lilug-0006jx-GN
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 18:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liltf-0005ZG-Bd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 18:39:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liltb-0003UA-W5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 18:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621291170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAPj9m3VvuMf8Icojb4k80bo3Rw3J3xacvF4MZS5inU=;
 b=gxS2JD1x/6T/983i5W2By7PULZz8OKi6H/RKAEgmvO/dHFv4yIPJVhGRY9HwCg3eeKUa1q
 b6Is11MW1kFe26q11Woy9sv60lUd8jspNNZauHqQydgigMEKLsC16ApwpBdwqDTW+OVOX6
 z9q/0bgwEbkYyGpTb/6Ft+X/Z28r9S4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-20SajCe7MR-ILztGRpgF2w-1; Mon, 17 May 2021 18:39:27 -0400
X-MC-Unique: 20SajCe7MR-ILztGRpgF2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBB75107ACF6;
 Mon, 17 May 2021 22:39:26 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBA92687C1;
 Mon, 17 May 2021 22:39:25 +0000 (UTC)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: P J P <ppandit@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210123100345.642933-1-ppandit@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <48257773-c423-a7e3-afb7-5909606b0688@redhat.com>
Date: Mon, 17 May 2021 18:39:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210123100345.642933-1-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: hannes Reinecke <hare@suse.com>, Gaoning Pan <pgn@zju.edu.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 5:03 AM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While processing ioport command in 'fdctrl_write_dor', device
> controller may select a drive which is not initialised with a
> block device. This may result in a NULL pointer dereference.
> Add checks to avoid it.
> 
> Fixes: CVE-2021-20196
> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1912780
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>   hw/block/fdc.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 3636874432..13a9470d19 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1429,7 +1429,9 @@ static void fdctrl_write_dor(FDCtrl *fdctrl, uint32_t value)
>           }
>       }
>       /* Selected drive */
> -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
> +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
> +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
> +    }

I don't think this is correct. If you look at get_cur_drv(), it uses the 
TDR_BOOTSEL bit to change the logical mappings of "drive 0" or "drive 1" 
to be reversed. You don't check that bit here, so you might be checking 
the wrong drive.

Plus, the TDR bit can change later, so I think you shouldn't actually 
protect the register write like this. Just delete this bit of code. We 
ought to protect the drives when we go to use them instead of preventing 
the registers from getting "the wrong values".

>   
>       fdctrl->dor = value;
>   }
> @@ -1894,6 +1896,10 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
>       uint32_t pos;
>   
>       cur_drv = get_cur_drv(fdctrl);
> +    if (!cur_drv->blk) {
> +        FLOPPY_DPRINTF("No drive connected\n");
> +        return 0;
> +    }

This seems fine ... or at least not worse than the other error handling 
we already have here. (Which seems to be ... basically, none. We just 
ignore the write and do nothing, which seems wrong. I guess it's better 
than a crash... but I don't have the time to do a proper audit of what 
this is SUPPOSED to do in this case.)

>       fdctrl->dsr &= ~FD_DSR_PWRDOWN;
>       if (!(fdctrl->msr & FD_MSR_RQM) || !(fdctrl->msr & FD_MSR_DIO)) {
>           FLOPPY_DPRINTF("error: controller not ready for reading\n");
> @@ -2420,7 +2426,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
>           if (pos == FD_SECTOR_LEN - 1 ||
>               fdctrl->data_pos == fdctrl->data_len) {
>               cur_drv = get_cur_drv(fdctrl);
> -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
> +            if (cur_drv->blk == NULL
> +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,

Seems fine, but if we had a drive for the earlier check, will we really 
be in a situation where we don't have one now?

>                              BDRV_SECTOR_SIZE, 0) < 0) {
>                   FLOPPY_DPRINTF("error writing sector %d\n",
>                                  fd_sector(cur_drv));
> 

Ignore the bit I sent earlier about the qtest reproducer not correlating 
to this patch -- it does, I was experiencing an unrelated crash.

--js


