Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE83932E7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:52:55 +0200 (CEST)
Received: from localhost ([::1]:38686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIJZ-0001yG-KG
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmIIR-00012c-NL
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lmIIO-00038M-Lz
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622130697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UFZxh/gXIQySoVuBdq58orWRryWhnaFs49CXYYJPCeg=;
 b=APuVVGyWF3nKuJUawC0kgTG+NSLDBEzj4pEalEkp0eVCQg3owLkVDbdB4nAlaUm1UyiZ1W
 XQPujb10y2hncWiQ1BzZiqVawCIXBwajNooNSH19HGrt4iX9MuyUN5BPUcEM8L6xjZsBZq
 VMK9ezzoKApuDOalcOrlCPnwkqJJiMo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-jvwJynowP6iEDozCHLgoJA-1; Thu, 27 May 2021 11:51:36 -0400
X-MC-Unique: jvwJynowP6iEDozCHLgoJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C1B89126B;
 Thu, 27 May 2021 15:51:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-201.ams2.redhat.com [10.36.114.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5A885D9C6;
 Thu, 27 May 2021 15:51:33 +0000 (UTC)
Date: Thu, 27 May 2021 17:51:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 2/6] file-posix: try BLKSECTGET on block devices too,
 do not round to power of 2
Message-ID: <YK/ABCylKztcARUz@merkur.fritz.box>
References: <20210524163645.382940-1-pbonzini@redhat.com>
 <20210524163645.382940-3-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210524163645.382940-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: nsoffer@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.05.2021 um 18:36 hat Paolo Bonzini geschrieben:
> bs->sg is only true for character devices, but block devices can also
> be used with scsi-block and scsi-generic.  Unfortunately BLKSECTGET
> returns bytes in an int for /dev/sgN devices, and sectors in a short
> for block devices, so account for that in the code.
> 
> The maximum transfer also need not be a power of 2 (for example I have
> seen disks with 1280 KiB maximum transfer) so there's no need to pass
> the result through pow2floor.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Looks like this is more or less a revert of Maxim's commit 867eccfe. If
this is what we want, should this old commit be mentioned in one way or
another in the commit message?

Apparently the motivation for Maxim's patch was, if I'm reading the
description correctly, that it affected non-sg cases by imposing
unnecessary restrictions. I see that patch 1 changed the max_iov part so
that it won't affect non-sg cases any more, but max_transfer could still
be more restricted than necessary, no?

For convenience, the bug report fixed with that patch is here:
https://bugzilla.redhat.com/show_bug.cgi?id=1647104

Are we really trying to describe different things (limits for SG_IO and
for normal I/O) in one value with max_transfer, even though it could be
two different numbers for the same block device?

> diff --git a/block/file-posix.c b/block/file-posix.c
> index 59c889d5a7..e5ef006aee 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1149,22 +1149,27 @@ static void raw_reopen_abort(BDRVReopenState *state)
>      s->reopen_state = NULL;
>  }
>  
> -static int sg_get_max_transfer_length(int fd)
> +static int sg_get_max_transfer_length(int fd, struct stat *st)

This is now a misnomer. Should we revert to the pre-867eccfe name
hdev_get_max_transfer_length()?

>  {
>  #ifdef BLKSECTGET
> -    int max_bytes = 0;
> -
> -    if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
> -        return max_bytes;
> +    if (S_ISBLK(st->st_mode)) {
> +        unsigned short max_sectors = 0;
> +        if (ioctl(fd, BLKSECTGET, &max_sectors) == 0) {
> +            return max_sectors * 512;
> +        }
>      } else {
> -        return -errno;
> +        int max_bytes = 0;
> +        if (ioctl(fd, BLKSECTGET, &max_bytes) == 0) {
> +            return max_bytes;
> +        }
>      }
> +    return -errno;
>  #else
>      return -ENOSYS;
>  #endif
>  }
>  
> -static int sg_get_max_segments(int fd)
> +static int sg_get_max_segments(int fd, struct stat *st)

Same for this one.

>  {
>  #ifdef CONFIG_LINUX
>      char buf[32];
> @@ -1173,15 +1178,9 @@ static int sg_get_max_segments(int fd)
>      int ret;
>      int sysfd = -1;
>      long max_segments;
> -    struct stat st;
> -
> -    if (fstat(fd, &st)) {
> -        ret = -errno;
> -        goto out;
> -    }
>  
>      sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
> -                                major(st.st_rdev), minor(st.st_rdev));
> +                                major(st->st_rdev), minor(st->st_rdev));
>      sysfd = open(sysfspath, O_RDONLY);
>      if (sysfd == -1) {
>          ret = -errno;
> @@ -1218,15 +1217,20 @@ out:
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> +    struct stat st;
> +
> +    if (fstat(s->fd, &st)) {
> +        return;

Don't we want to set errp? Or do you intentionally ignore the error?

> +    }
>  
> -    if (bs->sg) {
> -        int ret = sg_get_max_transfer_length(s->fd);
> +    if (bs->sg || S_ISBLK(st.st_mode)) {
> +        int ret = sg_get_max_transfer_length(s->fd, &st);
>  
>          if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
> -            bs->bl.max_transfer = pow2floor(ret);
> +            bs->bl.max_transfer = ret;
>          }
>  
> -        ret = sg_get_max_segments(s->fd);
> +        ret = sg_get_max_segments(s->fd, &st);
>          if (ret > 0) {
>              bs->bl.max_iov = ret;
>          }

Kevin


