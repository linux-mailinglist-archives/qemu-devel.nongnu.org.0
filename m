Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967793E2CDC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:42:42 +0200 (CEST)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC13Z-0005YU-FO
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC12S-0004rH-HH
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mC12M-0004YZ-U0
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628260886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=juEptnuIAWmj3jej4+9h8pTjOZUkXLeJyivC5KTG55s=;
 b=YG76inly+9cCP3zPe2pUUn27w5Nf6uhMNbw3nXomw91lsAUfVbgdFlFYNC0utgj8IyRL22
 SFhsU/bHZc7HNQoif0ZZkz6PsNXTKUYihuo9IBfqZRzWf3OGpcmJTXM2EEI3PCuy1DH3jR
 /Ep8lvCWyJpV/RHh+ksCs09ZRKqYyZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-EwDb-oz4MzmLT3rofh_n4Q-1; Fri, 06 Aug 2021 10:41:24 -0400
X-MC-Unique: EwDb-oz4MzmLT3rofh_n4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C477A871803
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 14:41:23 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.18.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39B435C1A3;
 Fri,  6 Aug 2021 14:41:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A5462220261; Fri,  6 Aug 2021 10:41:15 -0400 (EDT)
Date: Fri, 6 Aug 2021 10:41:15 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v3 02/10] virtiofsd: Add TempFd structure
Message-ID: <YQ1KCya+NHd96kvv@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-3-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210730150134.216126-3-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 05:01:26PM +0200, Max Reitz wrote:
> We are planning to add file handles to lo_inode objects as an
> alternative to lo_inode.fd.  That means that everywhere where we
> currently reference lo_inode.fd, we will have to open a temporary file
> descriptor that needs to be closed after use.
> 
> So instead of directly accessing lo_inode.fd, there will be a helper
> function (lo_inode_fd()) that either returns lo_inode.fd, or opens a new
> file descriptor with open_by_handle_at().  It encapsulates this result
> in a TempFd structure to let the caller know whether the FD needs to be
> closed after use (opened from the handle) or not (copied from
> lo_inode.fd).

I am wondering why this notion of "owned". Why not have this requirement
of always closing "fd". If we copied it from lo_inode.fd, then we will
need to dup() it. Otherwise we opened it from file handle and we will
need to close it anyway.

I guess you are trying to avoid having to call dup() and that's why
this notion of "owned" fd.

> 
> By using g_auto(TempFd) to store this result, callers will not even have
> to care about closing a temporary FD after use.  It will be done
> automatically once the object goes out of scope.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>  tools/virtiofsd/passthrough_ll.c | 49 ++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 1f27eeabc5..fb5e073e6a 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -178,6 +178,28 @@ struct lo_data {
>      int user_posix_acl, posix_acl;
>  };
>  
> +/**
> + * Represents a file descriptor that may either be owned by this
> + * TempFd, or only referenced (i.e. the ownership belongs to some
> + * other object, and the value has just been copied into this TempFd).
> + *
> + * The purpose of this encapsulation is to be used as g_auto(TempFd)
> + * to automatically clean up owned file descriptors when this object
> + * goes out of scope.
> + *
> + * Use temp_fd_steal() to get an owned file descriptor that will not
> + * be closed when the TempFd goes out of scope.
> + */
> +typedef struct {
> +    int fd;
> +    bool owned; /* fd owned by this object? */
> +} TempFd;
> +
> +#define TEMP_FD_INIT ((TempFd) { .fd = -1, .owned = false })
> +
> +static void temp_fd_clear(TempFd *temp_fd);
> +G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(TempFd, temp_fd_clear);
> +
>  static const struct fuse_opt lo_opts[] = {
>      { "sandbox=namespace",
>        offsetof(struct lo_data, sandbox),
> @@ -255,6 +277,33 @@ static struct lo_data *lo_data(fuse_req_t req)
>      return (struct lo_data *)fuse_req_userdata(req);
>  }
>  
> +/**
> + * Clean-up function for TempFds
> + */
> +static void temp_fd_clear(TempFd *temp_fd)
> +{
> +    if (temp_fd->owned) {
> +        close(temp_fd->fd);
> +        *temp_fd = TEMP_FD_INIT;
> +    }
> +}
> +
> +/**
> + * Return an owned fd from *temp_fd that will not be closed when
> + * *temp_fd goes out of scope.
> + *
> + * (TODO: Remove __attribute__ once this is used.)
> + */
> +static __attribute__((unused)) int temp_fd_steal(TempFd *temp_fd)
> +{
> +    if (temp_fd->owned) {
> +        temp_fd->owned = false;
> +        return temp_fd->fd;
> +    } else {
> +        return dup(temp_fd->fd);
> +    }
> +}

This also will be simpler if we always called dup() and every caller
will close() fd. 

I think only downside is having to call dup()/close(). Not sure if this
is an expensive operation or not.

Vivek


