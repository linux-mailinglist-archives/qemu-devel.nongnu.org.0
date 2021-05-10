Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C6379083
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 16:20:32 +0200 (CEST)
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6lq-0000Dp-Rp
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 10:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lg6j1-0006gd-PM
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lg6iz-0003zq-8w
 for qemu-devel@nongnu.org; Mon, 10 May 2021 10:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620656248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ZrdhwMQfNxwnI7xkHrucn+Fri0U/DAR1F/W71K775I=;
 b=JZsQ2C6uuDX6PesaQLD8XXOyw4GfQB27BUt8mkhkJ1tRifhMaTYzZQThV9I9BfyQqgQ7l1
 EA4+teGHzICLADfzZ+xjU09IAqrX3vTS5+tVTUbOHdXanS83wgSiM7fw903CritcfyArWS
 0vrtc2iReOHHmHSH7J2QoniwPz58q5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-uhcZvSW0OKS4yDG2MJfADA-1; Mon, 10 May 2021 10:16:28 -0400
X-MC-Unique: uhcZvSW0OKS4yDG2MJfADA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 966D1800FF0;
 Mon, 10 May 2021 14:16:27 +0000 (UTC)
Received: from work-vm (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACA3D5D6D1;
 Mon, 10 May 2021 14:16:26 +0000 (UTC)
Date: Mon, 10 May 2021 15:16:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Fix check of chown()'s return value
Message-ID: <YJlAN+eLMASsJxsL@work-vm>
References: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> Otherwise you always get this warning when using --socket-group=users
> 
>  vhost socket failed to set group to users (100)
> 
> While here, print out the error if chown() fails.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

probably needs a fixes:  but yes.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_virtio.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 3e13997406bf..638d3ffe2f8a 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -978,9 +978,9 @@ static int fv_create_listen_socket(struct fuse_session *se)
>      if (se->vu_socket_group) {
>          struct group *g = getgrnam(se->vu_socket_group);
>          if (g) {
> -            if (!chown(se->vu_socket_path, -1, g->gr_gid)) {
> +            if (chown(se->vu_socket_path, -1, g->gr_gid) == -1) {
>                  fuse_log(FUSE_LOG_WARNING,
> -                         "vhost socket failed to set group to %s (%d)\n",
> +                         "vhost socket failed to set group to %s (%d): %m\n",
>                           se->vu_socket_group, g->gr_gid);
>              }
>          }
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


