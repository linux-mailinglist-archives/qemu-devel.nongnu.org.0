Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870C60F6DE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:10:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo1g6-0005kc-I0; Thu, 27 Oct 2022 08:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oo1g3-0005d3-W4
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:08:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oo1g1-0001i3-UF
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666872481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=crhFcrpjFKarUumCqoAyvp0fo+x5P+9AdtdWLDv6GvY=;
 b=bhwjkhnqUkOW5MDpDCr5qN4tGhD8zZmv/SZMOlnnDel9QcDBkAQVj64Gij1XesX6s/4Ucn
 xXKq2nr5S7ni4Na3IH5bQi1IeVLoqBN6l+cgIw0Ot7TZxfUaouLJHyKvI9mTzG4HGocujo
 DmyT6cVe6nr2Rk/mxAHj2h2F7LoZASI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-7rI3ZOPzMBq49nryk4wBkg-1; Thu, 27 Oct 2022 08:07:57 -0400
X-MC-Unique: 7rI3ZOPzMBq49nryk4wBkg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr26-20020a1709073f9a00b007a20c586f1eso902062ejc.20
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=crhFcrpjFKarUumCqoAyvp0fo+x5P+9AdtdWLDv6GvY=;
 b=FwQvEwl9pQmdLKSZGG1Tv7rGqMOXs3JhnhE52VWb5BEIMOgXTwvOa+CDN414hUz+/F
 Z7eMCd1tE+tyuIaz4XVJMBrszzGUBTh42IVQbBxTPlEPI0VeJ+nDHC1LO6Hc8ZTDMgsB
 PZ9FdU1WBmqcuP4Hz12khE0wQ9dBOyvLEJdNXdIN41kJq4Ioaxcw/kc1534t6jYPQDNY
 BWoFw21ILAl+PpitdQuIc2jaLR8kvJqz/9FKNlEJVcVB/3yaLmr059wLOowjYoCL612a
 GJvMqHqBRny7CAhPQ6wW+aUKK2kLnukrsdVkd8d+lzsEhivtQzSILFhtMBKOr7ZGp07S
 QRIg==
X-Gm-Message-State: ACrzQf2EVC7YGvas6DGWkQS+RAW4TsvqE+hl68F7xccj25tQlNCzNAqa
 SoyocpC/qlYdOv9lnbTff3tv7AFYLFga9vvESLyp4/4zyBxhjftD7DcftMjb3PaX78BjtlUbgYZ
 t650XMokSQmFc6hM=
X-Received: by 2002:a17:907:3e01:b0:730:a690:a211 with SMTP id
 hp1-20020a1709073e0100b00730a690a211mr41309244ejc.596.1666872476737; 
 Thu, 27 Oct 2022 05:07:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4vLJgIkVtUVRjmSRVXOEYbGbhy9Sxw7VKut4mgOHRvcH9TST3F9A5ksvEhgGTdtCl6WFQK8A==
X-Received: by 2002:a17:907:3e01:b0:730:a690:a211 with SMTP id
 hp1-20020a1709073e0100b00730a690a211mr41309231ejc.596.1666872476529; 
 Thu, 27 Oct 2022 05:07:56 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1709063d2100b007a03313a78esm705658ejf.20.2022.10.27.05.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 05:07:56 -0700 (PDT)
Message-ID: <39d088a0-162e-7f88-fdea-bb1cfbfcd996@redhat.com>
Date: Thu, 27 Oct 2022 14:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] block/block-backend: blk_set_enable_write_cache is IO_CODE
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20221027072726.2681500-1-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221027072726.2681500-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27.10.22 09:27, Emanuele Giuseppe Esposito wrote:
> blk_set_enable_write_cache() is defined as GLOBAL_STATE_CODE
> but can be invoked from iothreads when handling scsi requests.
> This triggers an assertion failure:
>
>   0x00007fd6c3515ce1 in raise () from /lib/x86_64-linux-gnu/libc.so.6
>   0x00007fd6c34ff537 in abort () from /lib/x86_64-linux-gnu/libc.so.6
>   0x00007fd6c34ff40f in ?? () from /lib/x86_64-linux-gnu/libc.so.6
>   0x00007fd6c350e662 in __assert_fail () from /lib/x86_64-linux-gnu/libc.so.6
>   0x000056149e2cea03 in blk_set_enable_write_cache (wce=true, blk=0x5614a01c27f0)
>     at ../src/block/block-backend.c:1949
>   0x000056149e2d0a67 in blk_set_enable_write_cache (blk=0x5614a01c27f0,
>     wce=<optimized out>) at ../src/block/block-backend.c:1951
>   0x000056149dfe9c59 in scsi_disk_apply_mode_select (p=0x7fd6b400c00e "\004",
>     page=<optimized out>, s=<optimized out>) at ../src/hw/scsi/scsi-disk.c:1520
>   mode_select_pages (change=true, len=18, p=0x7fd6b400c00e "\004", r=0x7fd6b4001ff0)
>     at ../src/hw/scsi/scsi-disk.c:1570
>   scsi_disk_emulate_mode_select (inbuf=<optimized out>, r=0x7fd6b4001ff0) at
>     ../src/hw/scsi/scsi-disk.c:1640
>   scsi_disk_emulate_write_data (req=0x7fd6b4001ff0) at ../src/hw/scsi/scsi-disk.c:1934
>   0x000056149e18ff16 in virtio_scsi_handle_cmd_req_submit (req=<optimized out>,
>     req=<optimized out>, s=0x5614a12f16b0) at ../src/hw/scsi/virtio-scsi.c:719
>   virtio_scsi_handle_cmd_vq (vq=0x7fd6bab92140, s=0x5614a12f16b0) at
>     ../src/hw/scsi/virtio-scsi.c:761
>   virtio_scsi_handle_cmd (vq=<optimized out>, vdev=<optimized out>) at
>     ../src/hw/scsi/virtio-scsi.c:775
>   virtio_scsi_handle_cmd (vdev=0x5614a12f16b0, vq=0x7fd6bab92140) at
>     ../src/hw/scsi/virtio-scsi.c:765
>   0x000056149e1a8aa6 in virtio_queue_notify_vq (vq=0x7fd6bab92140) at
>     ../src/hw/virtio/virtio.c:2365
>   0x000056149e3ccea5 in aio_dispatch_handler (ctx=ctx@entry=0x5614a01babe0,
>     node=<optimized out>) at ../src/util/aio-posix.c:369
>   0x000056149e3cd868 in aio_dispatch_ready_handlers (ready_list=0x7fd6c09b2680,
>     ctx=0x5614a01babe0) at ../src/util/aio-posix.c:399
>   aio_poll (ctx=0x5614a01babe0, blocking=blocking@entry=true) at
>     ../src/util/aio-posix.c:713
>   0x000056149e2a7796 in iothread_run (opaque=opaque@entry=0x56149ffde500) at
>     ../src/iothread.c:67
>   0x000056149e3d0859 in qemu_thread_start (args=0x7fd6c09b26f0) at
>     ../src/util/qemu-thread-posix.c:504
>   0x00007fd6c36b9ea7 in start_thread () from /lib/x86_64-linux-gnu/libpthread.so.0
>   0x00007fd6c35d9aef in clone () from /lib/x86_64-linux-gnu/libc.so.6
>
> Changing GLOBAL_STATE_CODE in IO_CODE is allowed, since GSC callers are
> allowed to call IO_CODE.
>
> Resolves: #1272
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-backend.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


