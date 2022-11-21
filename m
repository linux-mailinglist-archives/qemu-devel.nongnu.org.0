Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C616329F7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:49:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9xn-0007yo-Qp; Mon, 21 Nov 2022 11:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ox9xj-0007xv-4z
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:48:03 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ox9xh-0002u0-Dw
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:48:02 -0500
Received: by mail-yb1-xb36.google.com with SMTP id p81so6566087yba.4
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2F1f8g9tatfiXeCnZX7a0gWGUBsFkRndu+C81okBMWM=;
 b=gVDoBBKW5lG4K2lmBREMnVDbSLrb/o7fNqL3txlQJZy3UtDE+Ym3nd9k0tvCL9IU82
 uCB6FhydCc2yGq4/QK+UuUeLjICLoKhmn2fsuSzfgYOPNehIeDLg/lu1zYVR2EML60qP
 t5hq+vlQtvND5CGocn4ySriL9OauCdrxLcLxwmccHPo1V4XYI4mT/Hp19r+vCBwrITzW
 sfxvZQPHpSbOx5iKiQqT7rhWJCGc8FxBsXOYo7sYvHxKQM0Xn3PfNdDfYHA3/R09jWJR
 KMGbtKTR4ly05IkUizAmsc/tsm3u3vOKoown1yQiUHgPKMLKeGgldgCboC1fBW7RKkFB
 cL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2F1f8g9tatfiXeCnZX7a0gWGUBsFkRndu+C81okBMWM=;
 b=4eKV+hSOcaOgGZR15WrE/8xDlmB1uuzESLk+58xyuqwa3ngRmfcFx+He5fXzI/c3LM
 bnCmKHKAPwl6WPvhaMzzG/gKQ736XomlAKRH3whUdgmi6pQWMXdDHV4sYD/pe7+Yh8iN
 0a+C55LXLpZubqFdhQMcqM1AhnnoP1d+mXnHyEmC8Dbnfwhs6RVJMyOyUu7yx+RK20bp
 qzSErAOje+f+HHNPvIk37Xus+vK+dNL4Bk7e4T2i0qo4jPZ2Oxa6TA67fnfwdDBT5/0G
 HR1iwrOi450SDQebTFbikQYAkvRbzqnCE5G5mMvUeoXBIJCU7ziTaKS54mjvc5pqZCno
 FH0Q==
X-Gm-Message-State: ANoB5pkfau3J25XPIxSkHpl3/ZXA6WJfzS7dqcHDVcsBYcSnOl3VydBA
 BOf4Tht2ZUfYS+t52Hmhidlx0oI4dI3ys+ga978=
X-Google-Smtp-Source: AA0mqf54o30snXdAySHjEgkqKOH+T3LJiOkYUKRwupj9QMkfCT/4tcrLac6BCpjM21LkzcZmIFwGk8AzzxsDnZix7T8=
X-Received: by 2002:a25:d907:0:b0:6cb:a119:9d78 with SMTP id
 q7-20020a25d907000000b006cba1199d78mr2468075ybg.537.1669049279970; Mon, 21
 Nov 2022 08:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20221121162132.00007540@huawei.com>
In-Reply-To: <20221121162132.00007540@huawei.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Nov 2022 11:47:48 -0500
Message-ID: <CAJSP0QVVt9911ZxCq9K5QeOBX2fhKSs372Qzqvg694-QkDnqGQ@mail.gmail.com>
Subject: Re: Null dereference in bdrv_unregister_buf() probably
 memory-backend-file related?
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 linuxarm@huawei.com, 
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
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

On Mon, 21 Nov 2022 at 11:22, Jonathan Cameron via
<qemu-devel@nongnu.org> wrote:
>
> First CC list is a guess as I haven't managed to root cause where things are
> going wrong yet.
>
> Originally hit this whilst rebasing some CXL patches on v7.2.0-rc1.
> CXL makes extensive use of memory-backends and most my tests happen
> to use memory-backend-file
>
> Issue seen on arm64 and x86 though helpfully on x86 the crash appears in an entirely
> unrelated location (though the 'fix' works).
>
> Fairly minimal test command line.
>
> qemu-system-aarch64 \
>     -M virt  \
>     -drive if=none,file=full.qcow2,format=qcow2,id=hd \
>     -device virtio-blk,drive=hd \
>     -object memory-backend-file,id=cxl-mem1,mem-path=/tmp/cxltest.raw,size=256M,align=256M \
>
> Powerdown the machine or ctrl-c during boot gives a segfault.
> On arm64 it was in a stable location that made at least some sense in that
> bs in the below snippet is NULL.
>
> I added the follow work around and the segfault goes away...
>
>  [PATCH] temp
>
> ---
>  block/io.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/block/io.c b/block/io.c
> index b9424024f9..750e1366aa 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -3324,6 +3324,9 @@ void bdrv_unregister_buf(BlockDriverState *bs, void *host, size_t size)
>  {
>      BdrvChild *child;
>
> +    if (!bs) {
> +        return;
> +    }
>      GLOBAL_STATE_CODE();
>      if (bs->drv && bs->drv->bdrv_unregister_buf) {
>          bs->drv->bdrv_unregister_buf(bs, host, size);

bdrv_*() APIs generally don't accept NULL bs arguments.

I think blk_unregister_buf() needs to handle the blk_bs() NULL return
value. Can you confirm that the parent function is
blk_unregister_buf()?

This bug may have been introduced by commit baf422684d73 ("virtio-blk:
use BDRV_REQ_REGISTERED_BUF optimization hint").

Stefan

