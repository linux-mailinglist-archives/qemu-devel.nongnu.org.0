Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507C32A1D0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:12:06 +0100 (CET)
Received: from localhost ([::1]:60156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5kr-0003W3-2Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH5jG-0002C0-BO
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:10:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH5jE-00079c-62
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614694223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMPDpEtRzZIIp8wU3iBS8g/Ees6i8qACNdnmvYOw68Y=;
 b=W4TsZkXZ8G4QE1FdoxuMRjvicygCcM/uPMHv15iPxJoUGMJvlOuvaFkAHbv24a23Tfw2s9
 6mCnjC6lbzgyC5CFCE2qwTa2olm/vqsV2hIB85vfI/sIZRfY/0X1ZeLVJpDpCHrIV3djFT
 YkGvkJ7DUFRQI/lxX3exu9XOsZ3ebpA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-O_4Qzh6mMMWhZjwvHEJ5Zw-1; Tue, 02 Mar 2021 09:10:20 -0500
X-MC-Unique: O_4Qzh6mMMWhZjwvHEJ5Zw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748BC801979;
 Tue,  2 Mar 2021 14:10:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BF94608BA;
 Tue,  2 Mar 2021 14:10:16 +0000 (UTC)
Date: Tue, 2 Mar 2021 15:10:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: ChangLimin <changlm@chinatelecom.cn>
Subject: Re: [PATCH] file-posix: allow -EBUSY errors during write zeros on
 block
Message-ID: <20210302141015.GB5527@merkur.fritz.box>
References: <2021030209564214018344@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <2021030209564214018344@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 mreitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.03.2021 um 02:56 hat ChangLimin geschrieben:
> After Linux 5.10, write zeros to a multipath device using
> ioctl(fd, BLKZEROOUT, range) with cache none or directsync will return EBUSY.
> 
> Similar to handle_aiocb_write_zeroes_unmap, handle_aiocb_write_zeroes_block
> allow -EBUSY errors during ioctl(fd, BLKZEROOUT, range).
> 
> Reference commit in Linux 5.10:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02
> 
> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
> ---
>  block/file-posix.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 05079b40ca..3e60c96214 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1629,8 +1629,13 @@ static ssize_t handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
>          } while (errno == EINTR);
> 
>          ret = translate_err(-errno);
> -        if (ret == -ENOTSUP) {
> +        switch (ret) {
> +        case -ENOTSUP:
> +        case -EINVAL:
> +        case -EBUSY:
>              s->has_write_zeroes = false;

Do we actually want -EINVAL and -EBUSY to completely stop us from trying
again in future requests? -ENOTSUP will never change in future calls,
but can't -EINVAL and -EBUSY?

By the way, the commit message only explains -EBUSY. Why do we want to
cover -EINVAL here, too?

> +            return -ENOTSUP;

I suppose this is the important change: We convert the error codes to
-ENOTSUP now so that block.c will emulate the operation instead of
failing.  This should be explained in the commit message.

> +            break;
>          }
>      }
>  #endif

Kevin


