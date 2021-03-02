Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B448132A644
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 17:43:23 +0100 (CET)
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH87G-0003g6-Lg
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 11:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lH85H-0002bL-6A
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:41:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lH85E-0003Vk-NP
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 11:41:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614703275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PUs1PSOekVtKcNJe5uFfWl0mgL8FAh001/WLF77A0mQ=;
 b=RHeo1MAEw2ekQAo+rh9hUySbWyFwsq14ZcPEjBoGj70lS7lvKR2jnO4AMKfmY4loQw5NcA
 YP8QTYaGgwPdiXz1uNHtrLEprSbTWviCuyVX1xUNJo8mzJuHQ9UgSJG5tvWXPaoCOBkLMZ
 EAxsb+fbMG5x8n1n0q4exj4dNa8EOT4=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-9NTtyZ4gOk-mubFFjxXlhQ-1; Tue, 02 Mar 2021 11:41:13 -0500
X-MC-Unique: 9NTtyZ4gOk-mubFFjxXlhQ-1
Received: by mail-oi1-f197.google.com with SMTP id n141so11205181oig.16
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 08:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUs1PSOekVtKcNJe5uFfWl0mgL8FAh001/WLF77A0mQ=;
 b=SgzMbmy+c/McMZqtXb2zUy+WcZJ/fcyNUIPkV1aIRA+ib4HJqsq/LgWEcFoDhKWNlj
 jeyG6/teWXo1h6cbkFjqjFGWShFAY3YQuz23wXU7b7qNBv6Y1xCGcQu0fqo2dpPZmfWE
 o4xQiscnSWnQCHi6ndt5tArRNZVt9W7lAmfLo+QfzHEyePz3h0SWP2HFmB2xSAR0cbJV
 6c5ys2aidXJneDLWRY8LtF6XuamcZJQIRMaQYgWnx+L0E0VJNXGbPmE91rrUIZ7MPFeZ
 e4Ic+6jDFQopQMYaH82jTVz80MIS/OGKwMT5yGWnBMqvNugoFkWoU9eeRaV5eEktvWuP
 tcdw==
X-Gm-Message-State: AOAM531Qk/wIGLGDfcEgXVYqEv/yo9AUWZ3xUzxs05YXpgQZQTuKtjiT
 05OMQG/utIxAHsP/LYmerUn8wnCLqh4YrPNzBi1mHkW2byzWWZka++u33BQslb+JDhZ5z96zvwW
 5EFprNRq48w18k5pB9BVFbvAwNLCTXxI=
X-Received: by 2002:aca:4947:: with SMTP id w68mr3862717oia.41.1614703272934; 
 Tue, 02 Mar 2021 08:41:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRIAldDzEZgKiQFicyDB/DTmTueMc0qPFEq7BznY3IOSuLTEePyWEopSWtLH3PhfRIJ4bqHwD5gSc0dQK/2X0=
X-Received: by 2002:aca:4947:: with SMTP id w68mr3862696oia.41.1614703272712; 
 Tue, 02 Mar 2021 08:41:12 -0800 (PST)
MIME-Version: 1.0
References: <2021030209564214018344@chinatelecom.cn>
In-Reply-To: <2021030209564214018344@chinatelecom.cn>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 2 Mar 2021 18:40:56 +0200
Message-ID: <CAMRbyyu7CLz8ia5yS6WqA542adkJRmvv-Hj-ZPc8xwvr0-QyWA@mail.gmail.com>
Subject: Re: [PATCH] file-posix: allow -EBUSY errors during write zeros on
 block
To: ChangLimin <changlm@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>, mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 2, 2021 at 4:08 AM ChangLimin <changlm@chinatelecom.cn> wrote:
>
> After Linux 5.10, write zeros to a multipath device using
> ioctl(fd, BLKZEROOUT, range) with cache none or directsync will return EBUSY.
>
> Similar to handle_aiocb_write_zeroes_unmap, handle_aiocb_write_zeroes_block
> allow -EBUSY errors during ioctl(fd, BLKZEROOUT, range).
>
> Reference commit in Linux 5.10:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02

But this can happen only when the block device is used by a file system or
maybe someone else. In qemu we assume that we are the only user of the
block device, so EBUSY is a fatal error that should never happen, no?

Can you explain a real world use case when we get EBUSY?

Nir

> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
> ---
>  block/file-posix.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 05079b40ca..3e60c96214 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1629,8 +1629,13 @@ static ssize_t handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
>          } while (errno == EINTR);
>
>          ret = translate_err(-errno);
> -        if (ret == -ENOTSUP) {
> +        switch (ret) {
> +        case -ENOTSUP:
> +        case -EINVAL:
> +        case -EBUSY:
>              s->has_write_zeroes = false;
> +            return -ENOTSUP;
> +            break;
>          }
>      }
>  #endif
> --
> 2.27.0
>


