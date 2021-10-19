Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8A432BFC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 04:59:21 +0200 (CEST)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcfLV-0004sD-06
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 22:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1mcfK6-00044a-MN; Mon, 18 Oct 2021 22:57:55 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:43655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1mcfK4-00070O-It; Mon, 18 Oct 2021 22:57:54 -0400
Received: by mail-oi1-x231.google.com with SMTP id o4so2695971oia.10;
 Mon, 18 Oct 2021 19:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R+E5qTQUHsbk1sZJW3t1vAR2O5Dv+r5a4AavzV0z/Pk=;
 b=Hgljy1dQMBAmTYtKQcIZjyg+JrRknCMtICiURWwHAg8PoY63ILJZZSFfRw9rml4MO3
 drt9MibHHhCK4IwY4khIm/AqU1abTTOKEi264V0XQmdDX3ROq6B/z6gQfsPTedy5KfKf
 ZIOrbRCCGasT5Swo36uEtkR34nMVQz1GQxZjxGcLNrXueIBLmB6qYuvxRNoUCxVCoBLJ
 PeupAbmCjQUgV8aM8xAjxCg7DTWgk+znpOgVKmtlbgXPt1CqyfIwELyLIkiRScOIcC22
 cDVDK5ejn0eyRDkyJNzrvOKJdOStC4v6kVy8NNqrLkCRe/HS2z+oKE924BoKaKdl3nJJ
 XFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R+E5qTQUHsbk1sZJW3t1vAR2O5Dv+r5a4AavzV0z/Pk=;
 b=FfKsKDojTfK0e4WqtgqaiUQtDQiixh5DW1/nPUHfc0yMuOM/4bGrv/frLDtPWKNmny
 trgTdxsU13vyX3k1pnwO13Q0/Zm05WPbyh3IOpKfJfdq/Ds8v1w4vUjsYgISmqBcF+I2
 55n7R/E4HdSAOpBTzdAS8nagl1zhwHNPRdK3m24Uo36E9AH/HssZFiS+1oDsxFwYmHN5
 AAYYKiRM2zBl/n/B9kvCy43a2O5xtE92LT5IBr+o/oi3VMG/iQicnQZ80yOJQ/3ePb4Y
 nAL+nmZ7KBIATHkvkjNO9DhEp2VzPG6xyBMbf0tt/FZlqNUeWz/HQ5Mpl4DYQbc2Hcaw
 IHEQ==
X-Gm-Message-State: AOAM531urET+9jt3rZjXlYA7lMUHPFAshQzYyzvuiYvb2m54J6jL/lCD
 gXIFUD3anyEWX28sGGhMnntCnFepxTsgeCuUjF0=
X-Google-Smtp-Source: ABdhPJyAoid3qKEqAtOADZVEoVF9ObFplBnWGBeBBkTAeqMq6xpf4Bh+MyCJmmIzl24dabusSlek8Ai6HiPkypEDf1Q=
X-Received: by 2002:aca:b50a:: with SMTP id e10mr2131409oif.143.1634612270224; 
 Mon, 18 Oct 2021 19:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211018180753.2436008-1-ari@tuxera.com>
In-Reply-To: <20211018180753.2436008-1-ari@tuxera.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 19 Oct 2021 11:57:39 +0900
Message-ID: <CAMVc7JUmH5o+X6MfXGw6gPj1QpvNBeAwR9+r13FuaKsq5X34sA@mail.gmail.com>
Subject: Re: [PATCH] block/file-posix: Fix return value translation for AIO
 discards.
To: Ari Sundholm <ari@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Emil Karlson <jkarlson@tuxera.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On Tue, Oct 19, 2021 at 3:08 AM Ari Sundholm <ari@tuxera.com> wrote:
>
> AIO discards regressed as a result of the following commit:
>         0dfc7af2 block/file-posix: Optimize for macOS
>
> When trying to run blkdiscard within a Linux guest, the request would
> fail, with some errors in dmesg:
>
> ---- [ snip ] ----
> [    4.010070] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_OK
> driverbyte=DRIVER_SENSE
> [    4.011061] sd 2:0:0:0: [sda] tag#0 Sense Key : Aborted Command
> [current]
> [    4.011061] sd 2:0:0:0: [sda] tag#0 Add. Sense: I/O process
> terminated
> [    4.011061] sd 2:0:0:0: [sda] tag#0 CDB: Unmap/Read sub-channel 42
> 00 00 00 00 00 00 00 18 00
> [    4.011061] blk_update_request: I/O error, dev sda, sector 0
> ---- [ snip ] ----
>
> This turns out to be a result of a flaw in changes to the error value
> translation logic in handle_aiocb_discard(). The default return value
> may be left untranslated in some configurations, and the wrong variable
> is used in one translation.
>
> Fix both issues.
>
> Signed-off-by: Ari Sundholm <ari@tuxera.com>
> Signed-off-by: Emil Karlson <jkarlson@tuxera.com>
> ---
>  block/file-posix.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 53be0bdc1b..6def2a4cba 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1807,7 +1807,7 @@ static int handle_aiocb_copy_range(void *opaque)
>  static int handle_aiocb_discard(void *opaque)
>  {
>      RawPosixAIOData *aiocb = opaque;
> -    int ret = -EOPNOTSUPP;
> +    int ret = -ENOTSUP;
>      BDRVRawState *s = aiocb->bs->opaque;
>
>      if (!s->has_discard) {
> @@ -1829,7 +1829,7 @@ static int handle_aiocb_discard(void *opaque)
>  #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
>          ret = do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
>                             aiocb->aio_offset, aiocb->aio_nbytes);
> -        ret = translate_err(-errno);
> +        ret = translate_err(ret);
>  #elif defined(__APPLE__) && (__MACH__)
>          fpunchhole_t fpunchhole;
>          fpunchhole.fp_flags = 0;
> --
> 2.31.1
>

