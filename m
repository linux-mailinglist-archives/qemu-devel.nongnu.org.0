Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC99A486D20
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:20:01 +0100 (CET)
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5b73-0006Pp-2G
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:20:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n5b38-0007Zi-8a
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:15:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1n5b36-0006yy-PJ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641507356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VteZw07uvWRh4xJjGvdC8ZvLJfPlg0Z1hZEMGI/NtRU=;
 b=hH/L/d10qaJawt2VvG2ZaoAltFkphBnrYL/T6IvU+L89qVxw1Hq1UR2Tj59KCi8l9p1DXu
 V9OSoE9SXwKHos89eLB6Q4sRF5lhq9s9uOrpKTOipBV1M6CTpIVxmJGwPGmH6DiAVhOczz
 rE4S8A7cOjp9DvVHU4WF//Yk3LFOSWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-XWj1shHPPZKYGgaG-gcJsQ-1; Thu, 06 Jan 2022 17:15:50 -0500
X-MC-Unique: XWj1shHPPZKYGgaG-gcJsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B25801B2A;
 Thu,  6 Jan 2022 22:15:49 +0000 (UTC)
Received: from redhat.com (unknown [10.22.35.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 083795E26B;
 Thu,  6 Jan 2022 22:15:18 +0000 (UTC)
Date: Thu, 6 Jan 2022 16:15:15 -0600
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] qemu-storage-daemon: Add vhost-user-blk help
Message-ID: <20220106221515.5rbkgsxbt6glw7np@redhat.com>
References: <20211223101426.3143647-1-philmd@redhat.com>
 <20211223101426.3143647-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211223101426.3143647-2-philmd@redhat.com>
User-Agent: NeoMutt/20211029-144-b77af0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 23, 2021 at 11:14:25AM +0100, Philippe Mathieu-Daudé wrote:
> Add missing vhost-user-blk help:
> 
>   $ qemu-storage-daemon -h
>   ...
>     --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
>              addr.type=unix,addr.path=<socket-path>[,writable=on|off]
>              [,logical-block-size=<block-size>][,num-queues=<num-queues>]
>                            export the specified block node as a
>                            vhosts-user-blk device over UNIX domain socket

Why 'vhosts-' here instead of 'vhost'?

>     --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,
>              fd,addr.str=<fd>[,writable=on|off]
>              [,logical-block-size=<block-size>][,num-queues=<num-queues>]
>                            export the specified block node as a
>                            vhosts-user-blk device over file descriptor

here too.

>   ...
> 
> Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index 52cf17e8ace..0c19e128e3f 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -104,6 +104,19 @@ static void help(void)
>  "                         export the specified block node over FUSE\n"
>  "\n"
>  #endif /* CONFIG_FUSE */
> +#ifdef CONFIG_VHOST_USER_BLK_SERVER
> +"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
> +"           addr.type=unix,addr.path=<socket-path>[,writable=on|off]\n"
> +"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
> +"                         export the specified block node as a\n"
> +"                         vhosts-user-blk device over UNIX domain socket\n"

This...

> +"  --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,\n"
> +"           fd,addr.str=<fd>[,writable=on|off]\n"
> +"           [,logical-block-size=<block-size>][,num-queues=<num-queues>]\n"
> +"                         export the specified block node as a\n"
> +"                         vhosts-user-blk device over file descriptor\n"

...and this line would need the same tweak.

If you agree that it's a typo, then let's fix it, and you can have

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


