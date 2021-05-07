Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278AF37688B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:20:18 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3D7-0001g6-7j
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf3C6-00013K-42
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lf3C4-00028S-4B
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620404351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZngCUPPakWOJWeOPclyvTvuLBNytzMFom1hu4M+H2VM=;
 b=PiM7V+MQnGmuhDgJqI1rYyxJAun8M8fq/PUkic8e+ln7/nORkXp/R2wh4CbEzG//1l7WN3
 9sGkzOJoph5PBS2K10T6c3vO9ayYB5vQYgUmDo4wmFMv6JZ1fJgEyHfod+63SIc2AnY8ah
 mQwj9hwnfFVGAAxEyyv3+B2eUsu5O6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-S9foP0MJN4aCZTEQFH2s9A-1; Fri, 07 May 2021 12:19:09 -0400
X-MC-Unique: S9foP0MJN4aCZTEQFH2s9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FB926D5C7;
 Fri,  7 May 2021 16:19:08 +0000 (UTC)
Received: from [10.3.113.56] (ovpn-113-56.phx2.redhat.com [10.3.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEC0F5D9CC;
 Fri,  7 May 2021 16:19:07 +0000 (UTC)
Subject: Re: [PATCH] virtiofsd: Fix check of chown()'s return value
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7ebbd33b-7283-9b02-61a3-8cf190798a2a@redhat.com>
Date: Fri, 7 May 2021 11:19:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <162040394890.714971.15502455176528384778.stgit@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 11:12 AM, Greg Kurz wrote:
> Otherwise you always get this warning when using --socket-group=users
> 
>  vhost socket failed to set group to users (100)
> 
> While here, print out the error if chown() fails.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
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

Is %m portable?  POSIX requires it for syslog, but not for printf (where
glibc has it as an extension), but I'm not sure what fuse_log supports.
Best might be a manual %s/strerror(errno)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


