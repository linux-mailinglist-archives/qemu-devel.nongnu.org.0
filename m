Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B116397280
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:36:43 +0200 (CEST)
Received: from localhost ([::1]:47308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2hM-00067V-VE
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo2g4-0005DQ-Vy
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lo2g1-00060O-8U
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622547316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zKx1cuhKMBi2Tu+B9FKHw8SHjb8KeJH3/R/14/AiS5w=;
 b=PdzNsSLTBepxWAVpfVkrXc/SWzd+bzR+AxjV/+GGRbCHiXhDQamEDNQoyFwt7k/4jNaD/J
 bjl9oD1C9g4ClEuhdglkYrB7HFKOR8EsUkKwlwAbqvpGaQoC6quYoqk477uRwLobm79h8m
 uOVoCNidVroqi6pFxCy6yeY24ExnQEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-oYPQV85TNG6a-Crj16kmQw-1; Tue, 01 Jun 2021 07:35:15 -0400
X-MC-Unique: oYPQV85TNG6a-Crj16kmQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C48328186E8;
 Tue,  1 Jun 2021 11:35:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3994CE154;
 Tue,  1 Jun 2021 11:35:12 +0000 (UTC)
Date: Tue, 1 Jun 2021 13:35:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] block/file-posix: Fix problem with
 fallocate(PUNCH_HOLE) on GPFS
Message-ID: <YLYbbrhyAZBaKEIt@merkur.fritz.box>
References: <20210527172020.847617-1-thuth@redhat.com>
 <20210527172020.847617-2-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210527172020.847617-2-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.05.2021 um 19:20 hat Thomas Huth geschrieben:
> A customer reported that running
> 
>  qemu-img convert -t none -O qcow2 -f qcow2 input.qcow2 output.qcow2
> 
> fails for them with the following error message when the images are
> stored on a GPFS file system :
> 
>  qemu-img: error while writing sector 0: Invalid argument
> 
> After analyzing the strace output, it seems like the problem is in
> handle_aiocb_write_zeroes(): The call to fallocate(FALLOC_FL_PUNCH_HOLE)
> returns EINVAL, which can apparently happen if the file system has
> a different idea of the granularity of the operation. It's arguably
> a bug in GPFS, since the PUNCH_HOLE mode should not result in EINVAL
> according to the man-page of fallocate(), but the file system is out
> there in production and so we have to deal with it. In commit 294682cc3a
> ("block: workaround for unaligned byte range in fallocate()") we also
> already applied the a work-around for the same problem to the earlier
> fallocate(FALLOC_FL_ZERO_RANGE) call, so do it now similar with the
> PUNCH_HOLE call. But instead of silently catching and returning
> -ENOTSUP (which causes the caller to fall back to writing zeroes),
> let's rather inform the user once about the buggy file system and
> try the other fallback instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  block/file-posix.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 10b71d9a13..134ff01d82 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1650,6 +1650,16 @@ static int handle_aiocb_write_zeroes(void *opaque)
>                  return ret;
>              }
>              s->has_fallocate = false;
> +        } else if (ret == -EINVAL) {
> +            /*
> +             * Some file systems like older versions of GPFS do not like un-
> +             * aligned byte ranges, and return EINVAL in such a case, though
> +             * they should not do it according to the man-page of fallocate().
> +             * Warn about the bad filesystem and try the final fallback instead.
> +             */
> +            warn_report_once("Your file system is misbehaving: "
> +                             "fallocate(FALLOC_FL_PUNCH_HOLE) returned EINVAL. "
> +                             "Please report this bug to your file sytem vendor.");

This line is too long.

I've fixed it up and applied the series, thanks.

Kevin


