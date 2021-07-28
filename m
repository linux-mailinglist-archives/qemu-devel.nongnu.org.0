Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816113D8D7F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 14:10:55 +0200 (CEST)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8iOk-0007Pp-IR
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 08:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iNi-0006O7-HO
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8iNf-00066t-J5
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 08:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627474186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INZTKIKLuHUQUjXZ8225A+XGPaZstKPTzcMuqUaCbHo=;
 b=QN8mzSiuMH+io+0psmfrEzr/UFUWmzg7qVGgrdDWGnlZtS/7lTF0xKtY0ojpCIV54NfMsm
 0IZ94C8TGsMRAhJFMHEdGvIMWfeF6jx+C0IXxdESppFgAJk3AbHABSyzIz3SAuYQ39H0/7
 BYyR4cQTD6w65E9enYP0qpz3O/c9/L4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-nxjoM1w5OQ65GCN585-h7A-1; Wed, 28 Jul 2021 08:09:43 -0400
X-MC-Unique: nxjoM1w5OQ65GCN585-h7A-1
Received: by mail-wr1-f72.google.com with SMTP id
 u26-20020adfb21a0000b029013e2b4a9d1eso868188wra.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 05:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=INZTKIKLuHUQUjXZ8225A+XGPaZstKPTzcMuqUaCbHo=;
 b=c/PZ+dpP3FQ0v+oefmtmISzFHHBNJZSoaNRA8AUtYhmF/mYhMeopc1TbcdCaiI/qf1
 N+fW0At8AmfjktvjMMqa/41cUGsLDrVe80eePKCbz3MN5K3QNAPBHjGOKvCgNSDP3V+L
 +LnMppP/PYE30dVzvg1kGJ5jnxJv1cMjHBCkFNTvFbkVsu3f1u68zW5R++w+jG/+Db/D
 feeI89kGocsj+SBA+ickBW2KSzbBWSPWvdjdN/g5XAcIXYDhM2DPktB6zafmJzRYbats
 HxqTo/IPsbfIYSPYv47XZkxT633uZZnCx3VcpL64ErDubrze2tQXMddZw3kuEPNO2k9C
 YPVQ==
X-Gm-Message-State: AOAM530Nq8HivgSXTTDL9QNKMQ0y+OqXT5DZT9YDaGSSGIhYSqx8qDnb
 FbvAAmNTIlKcBAyQ/lqgH5HuXJ7omJ5u6bmL2uSdjkvDW3YseDxqpO/AXzpMnfBsTn4L46cFnGj
 cqH4YY1ZM+1M2/Xs=
X-Received: by 2002:a5d:45c1:: with SMTP id b1mr20411834wrs.264.1627474182637; 
 Wed, 28 Jul 2021 05:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxJDqLtA+vDEPPIPE90u+YXls7osY0P+U6cqRtiTsPThebyVdkP7jEtENL/Oyjc2pMlnVqFQ==
X-Received: by 2002:a5d:45c1:: with SMTP id b1mr20411794wrs.264.1627474182345; 
 Wed, 28 Jul 2021 05:09:42 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id t17sm3362545wru.94.2021.07.28.05.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 05:09:41 -0700 (PDT)
Subject: Re: [PATCH] block/io_uring: resubmit when result is -EAGAIN
To: Fabian Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
References: <20210728103518.1221195-1-f.ebner@proxmox.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b60e324a-ed8f-594f-b27e-2e4a270726bf@redhat.com>
Date: Wed, 28 Jul 2021 14:09:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728103518.1221195-1-f.ebner@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing the maintainers for you. See
https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer

$ ./scripts/get_maintainer.pl -f block/io_uring.c
Aarushi Mehta <mehta.aaru20@gmail.com> (maintainer:Linux io_uring)
Julia Suvorova <jusual@redhat.com> (maintainer:Linux io_uring)
Stefan Hajnoczi <stefanha@redhat.com> (maintainer:Linux io_uring)
Kevin Wolf <kwolf@redhat.com> (supporter:Block layer core)
Max Reitz <mreitz@redhat.com> (supporter:Block layer core)
qemu-block@nongnu.org (open list:Linux io_uring)
qemu-devel@nongnu.org (open list:All patches CC here)

Also Cc'ing Stefano for commit b4e44c9944e ("io_uring: retry
io_uring_submit() if it fails with errno=EINTR").
(Stefano, you might want to add yourself a R: tag in MAINTAINERS).

On 7/28/21 12:35 PM, Fabian Ebner wrote:
> Quoting from [0]:
> 
>  Some setups, like SCSI, can throw spurious -EAGAIN off the softirq
>  completion path. Normally we expect this to happen inline as part
>  of submission, but apparently SCSI has a weird corner case where it
>  can happen as part of normal completions.
> 
> Host kernels without patch [0] can panic when this happens [1], and
> resubmitting makes the panic more likely. On the other hand, for
> kernels with patch [0], resubmitting ensures that a block job is not
> aborted just because of such spurious errors.
> 
> [0]: https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.dk/T/#u
> 
> [1]:
>   #9 [ffffb732000c8b70] asm_exc_page_fault at ffffffffa4800ade
>  #10 [ffffb732000c8bf8] io_prep_async_work at ffffffffa3d89c16
>  #11 [ffffb732000c8c50] io_rw_reissue at ffffffffa3d8b2e1
>  #12 [ffffb732000c8c78] io_complete_rw at ffffffffa3d8baa8
>  #13 [ffffb732000c8c98] blkdev_bio_end_io at ffffffffa3d62a80
>  #14 [ffffb732000c8cc8] bio_endio at ffffffffa3f4e800
>  #15 [ffffb732000c8ce8] dec_pending at ffffffffa432f854
>  #16 [ffffb732000c8d30] clone_endio at ffffffffa433170c
>  #17 [ffffb732000c8d70] bio_endio at ffffffffa3f4e800
>  #18 [ffffb732000c8d90] blk_update_request at ffffffffa3f53a37
>  #19 [ffffb732000c8dd0] scsi_end_request at ffffffffa4233a5c
>  #20 [ffffb732000c8e08] scsi_io_completion at ffffffffa423432c
>  #21 [ffffb732000c8e58] scsi_finish_command at ffffffffa422c527
>  #22 [ffffb732000c8e88] scsi_softirq_done at ffffffffa42341e4
> 
> Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
> ---
> 
> I'm new to this code and io_uring, so I don't know what all the
> implications are, but retrying upon EAGAIN does not sound like
> a bad thing to my inexperienced ears.
> 
> Some more context, leading up to this patch:
> 
> We had some users reporting issues after we switched to using io_uring
> by default. Namely, kernel panics [2] for some, and failing block jobs
> [3] (with a custom backup mechanism we implemented on top of QEMU's
> block layer) for others.
> 
> I had luck and managed to reprouce the issue, and it was a failed
> block job about half of the time and a kernel panic the other half.
> When using a host kernel with [0], it's a failed block job all the
> time, and this patch attempts to fix that, by resubmitting instead
> of bubbling up the error.
> 
> [2]: https://forum.proxmox.com/threads/kernel-panic-whole-server-crashes-about-every-day.91803/post-404382
> [3]: https://forum.proxmox.com/threads/backup-job-failed-with-err-11-on-2-of-6-vms.92568/
> 
>  block/io_uring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/io_uring.c b/block/io_uring.c
> index 00a3ee9fb8..77d162cb24 100644
> --- a/block/io_uring.c
> +++ b/block/io_uring.c
> @@ -165,7 +165,7 @@ static void luring_process_completions(LuringState *s)
>          total_bytes = ret + luringcb->total_read;
>  
>          if (ret < 0) {
> -            if (ret == -EINTR) {
> +            if (ret == -EINTR || ret == -EAGAIN) {
>                  luring_resubmit(s, luringcb);
>                  continue;
>              }
> 


