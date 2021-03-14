Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0233A8DF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:41:01 +0100 (CET)
Received: from localhost ([::1]:41792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaM0-0002sz-HE
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLaJp-0001pr-Ih
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lLaJl-0007hM-75
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615765120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y+AlmCTAX4Zv4lUC6460fJZjVqdX1IiaScYVkesFJaA=;
 b=hjQkvUEGxmDWM2B4qYHUs72TQKDTTKPqJqSivOweDuyQ89ayE6u1t6zQo0QNPopHsYs9kV
 hGL9S/dT9+EjeXiG9My7I96LYy7+4JiQuM7+kRi1Zqll9eBFA8sesJkdzS8SXa1HVKZXvu
 277R4Ew1az3DDu2mP3Q8uRMbfyKQU+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-4WnG1_7NNPu4UVTLgzZZ-A-1; Sun, 14 Mar 2021 19:38:37 -0400
X-MC-Unique: 4WnG1_7NNPu4UVTLgzZZ-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD5E0107ACCD;
 Sun, 14 Mar 2021 23:38:36 +0000 (UTC)
Received: from horse.redhat.com (ovpn-112-132.rdu2.redhat.com [10.10.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6A566E528;
 Sun, 14 Mar 2021 23:38:32 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4B72F22054F; Sun, 14 Mar 2021 19:38:32 -0400 (EDT)
Date: Sun, 14 Mar 2021 19:38:32 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [Virtio-fs] [PATCH 1/3] virtiofsd: Don't allow empty paths in
 lookup_name()
Message-ID: <20210314233832.GE223210@redhat.com>
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-2-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312141003.819108-2-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 03:10:01PM +0100, Greg Kurz wrote:
> When passed an empty filename, lookup_name() returns the inode of
> the parent directory, unless the parent is the root in which case
> the st_dev doesn't match and lo_find() returns NULL. This is
> because lookup_name() passes AT_EMPTY_PATH down to fstatat() or
> statx().
> 
> This behavior doesn't quite make sense because users of lookup_name()
> then pass the name to unlinkat(), renameat() or renameat2(), all of
> which will always fail on empty names.
> 
> Drop AT_EMPTY_PATH from the flags in lookup_name() so that it has
> the consistent behavior of "returning an existing child inode or
> NULL" for all directories.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Looks good to me. Can't think in what cases fuse will need to pass in
empty path for lookup.

Reviewed-by: Vivek Goyal <vgoyal@redhat.com>

Vivek
> ---
>  tools/virtiofsd/passthrough_ll.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index fc7e1b1e8e2b..27a6c636dcaf 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -1308,8 +1308,7 @@ static struct lo_inode *lookup_name(fuse_req_t req, fuse_ino_t parent,
>          return NULL;
>      }
>  
> -    res = do_statx(lo, dir->fd, name, &attr,
> -                   AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW, &mnt_id);
> +    res = do_statx(lo, dir->fd, name, &attr, AT_SYMLINK_NOFOLLOW, &mnt_id);
>      lo_inode_put(lo, &dir);
>      if (res == -1) {
>          return NULL;
> -- 
> 2.26.2
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://listman.redhat.com/mailman/listinfo/virtio-fs


