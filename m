Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BAC668415
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 21:29:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG4Bc-0002H7-7J; Thu, 12 Jan 2023 15:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pG4Ba-0002Gt-11; Thu, 12 Jan 2023 15:28:30 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pG4BY-0002Wb-DG; Thu, 12 Jan 2023 15:28:29 -0500
Received: by mail-ed1-x531.google.com with SMTP id v30so28491095edb.9;
 Thu, 12 Jan 2023 12:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YVuNnaR7GY9uJJf2iDPvKeHqJ3g7wsPNVFEUmPmMgNU=;
 b=Y7mHMplWuldd1RY9uGNM28DzyO44Ws2aX4icBe/3LDY6TVr3TYAfuvm7gzDg9q5X1p
 6I3vwqLyxa1EHXhJ3MmNF77bguRJR4c9Ca3JcUo+Gru3JgaAsJanVPfb15AUgenVm4eO
 3HDJ7wzve0pNlVUsrQSl4PJmKUnEH8q87hkSDzjzm/oWI/DI0QKJvWK/o1i6CAqtsv1m
 nSGSHS2fQ0HDMzF8UKnz9YtPnX7iR+lTAqdRp/FL79Bzf2Iy0f9ZmmgBY8SRZkNg3vUu
 83iZRPlkutMrNuNEtHc31x6dswyt7ThnksKBLb50XOxZgJ+7MZm3TSDahZSqZjU1Gfe/
 Jw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YVuNnaR7GY9uJJf2iDPvKeHqJ3g7wsPNVFEUmPmMgNU=;
 b=AVvqs8eYhZxorzdt3nIC5bxUoHbShVMHwgAM/V1eOem7P2/DBTcxDLLsDodydBBPDy
 +mewE+qoee4XBKyJ6kT1Yd5yKYrU/h6ChOOTm/Rbr5raKYawlu6z6XGq6gqctL7ziZNn
 Gv2MBHUParOK+HEYP3VaORjAojz8Pbtj6tRJC4NFAMdzCuNBCab5l/3pw4pUvKvk1BKm
 f57/HtkQuJFEZnU5WfiuhgB3b29WY3YFWUAKxZFBDQlEXMY8DGyQ88bAxj+dvIfKJVFE
 jz/bPjJAb/Qt5N7Y5CvoHKigDRQ6nBiCzBB6pTvZK0q5SCBIkiE8vgM3ERDt7CuIsX9P
 24VA==
X-Gm-Message-State: AFqh2krXIpIjj7hNJoVf/90Z3HGdfo9gQ7B2ieiNV7vnA0d/bpXkm3OJ
 Q6QmHhJGkR14DS+bW6NI/vn/qUwTip5QGuFt4jc=
X-Google-Smtp-Source: AMrXdXuAljxJbP3CbzObRvKWrspxUizbDKQqNSXLD9FU7qAFfNY7MKKdxBrcObKBsSYxbmZiy8Ba/5rA5Kj4Z8jf7cw=
X-Received: by 2002:aa7:cf87:0:b0:498:dfe5:49aa with SMTP id
 z7-20020aa7cf87000000b00498dfe549aamr1534777edx.398.1673555305814; Thu, 12
 Jan 2023 12:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20211209092815.778066-1-oro@il.ibm.com>
 <20211209092815.778066-2-oro@il.ibm.com>
In-Reply-To: <20211209092815.778066-2-oro@il.ibm.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Thu, 12 Jan 2023 21:28:13 +0100
Message-ID: <CAOi1vP95sznmAETC1ikqb5bxKueDZYd7HtEjM=7KerMSALYFuQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] virtio-block: switch to blk_get_max_hw_transfer
To: Or Ozeri <oro@il.ibm.com>
Cc: qemu-devel@nongnu.org, dupadhya@redhat.com, to.my.trociny@gmail.com, 
 qemu-block@nongnu.org, dannyh@il.ibm.com, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=idryomov@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 9, 2021 at 10:34 AM Or Ozeri <oro@il.ibm.com> wrote:
>
> The blk_get_max_hw_transfer API was recently added in 6.1.0.
> It allows querying an underlying block device its max transfer capability.
> This commit changes virtio-blk to use this.
>
> Signed-off-by: Or Ozeri <oro@il.ibm.com>
> ---
>  hw/block/virtio-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index f139cd7cc9..1ba9a06888 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -458,7 +458,7 @@ static void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
>          return;
>      }
>
> -    max_transfer = blk_get_max_transfer(mrb->reqs[0]->dev->blk);
> +    max_transfer = blk_get_max_hw_transfer(mrb->reqs[0]->dev->blk);
>
>      qsort(mrb->reqs, mrb->num_reqs, sizeof(*mrb->reqs),
>            &multireq_compare);
> --
> 2.25.1
>
>

Hi Or,

Superficially, this makes sense to me.  A couple of things to consider:

- Move the explanation from the cover letter into the patch
  description.  The current patch description is pretty much
  meaningless.
- Should the actual limit be consulted for the number of segments
  as well?  IOW should blk_get_max_hw_iov() be called instead of
  blk_get_max_iov() a dozen lines below?

I'm adding Stefan and Kevin to CC to get more eyes on this patch as it
fixes a regression.  I believe this was encountered with the following
NBD device, Or please correct me if I'm wrong:

$ cat /sys/block/nbd0/queue/max_sectors_kb
128
$ cat /sys/block/nbd0/queue/max_segments
65535

Thanks,

                Ilya

