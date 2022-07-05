Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64135664B8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:12:02 +0200 (CEST)
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8df8-0006Xu-0Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8dY2-0006a6-3k
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8dY0-0007zc-Fd
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:04:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008279;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnsrCMjNY9vdf1JmuSHv6n3U/4yHuYFDK/LGrDBKmyc=;
 b=beelQAkLqrrn0R7QXayJ1zCAFQL5t56U5RugKW51tlYYPV1pl+syVtfdwGsmfgWA0b+wiU
 miVZEbyAiCPGrLNwNZoHp1Dth7q6iugEPgt3WqcGtaKFcOQuh18SNOWZ0RbHHnk/ueIaGy
 q9UGtzUeuSfLL59NusBIXATH8DsfYuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-Gwt2Q0GCM5qP-w_rBj05WQ-1; Tue, 05 Jul 2022 04:04:38 -0400
X-MC-Unique: Gwt2Q0GCM5qP-w_rBj05WQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97F8D8032E3
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 08:04:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7CF40C1289;
 Tue,  5 Jul 2022 08:04:37 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:04:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/3] QIOChannelSocket: Fix zero-copy flush returning
 code 1 when nothing sent
Message-ID: <YsPwk34cMoontYo8@redhat.com>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-2-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704202315.507145-2-leobras@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04, 2022 at 05:23:13PM -0300, Leonardo Bras wrote:
> If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
> returns 1. This return code should be used only when Linux fails to use
> MSG_ZEROCOPY on a lot of sendmsg().
> 
> Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
> was attempted.
> 
> Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  io/channel-socket.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

And if this merges via migration maintainers' tree

Acked-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 4466bb1cd4..698c086b70 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
>      struct cmsghdr *cm;
>      char control[CMSG_SPACE(sizeof(*serr))];
>      int received;
> -    int ret = 1;
> +    int ret;
> +
> +    if (!sioc->zero_copy_queued) {
> +        return 0;
> +    }
>  
>      msg.msg_control = control;
>      msg.msg_controllen = sizeof(control);
>      memset(control, 0, sizeof(control));
>  
> +    ret = 1;
> +
>      while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
>          received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
>          if (received < 0) {
> -- 
> 2.36.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


