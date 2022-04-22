Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB650BA10
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:27:11 +0200 (CEST)
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhuFa-0005gs-Gp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhuDb-0003aP-OU
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhuDY-0001ae-Hy
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650637503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pOnHz7X23jraUbf4gQecaoJn1UwKHMeC/qEEZg0gbw=;
 b=Q5Nq8uBa+tzTT4Vp3CjA3a9/70xO9I/HoQG5CeqknkAoT0pzT5sACwDcLDHaJnT1Csz4M+
 vU2y5fhR1ninMAnEF0B4g1uPYtON2YdB7v+giE+ZHA2bE88wvnWQmuikqHNtPSD/48kPnH
 MmrQHfn+HkFTMLKET4IHArIXJjpetgk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-sb-Lc_IUNUSvsv9p0OX0Gg-1; Fri, 22 Apr 2022 10:25:02 -0400
X-MC-Unique: sb-Lc_IUNUSvsv9p0OX0Gg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7C8029A9CCB
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 14:25:01 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7093B111E413;
 Fri, 22 Apr 2022 14:24:57 +0000 (UTC)
Date: Fri, 22 Apr 2022 09:24:55 -0500
From: Eric Blake <eblake@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 08/10] Use g_unix_set_fd_nonblocking()
Message-ID: <20220422142455.zcwiwxyrt2ueygl2@redhat.com>
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422083639.3156978-9-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 22, 2022 at 12:36:37PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> API available since glib 2.30. It also preserves errno.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/misc/ivshmem.c           | 2 +-
>  util/event_notifier-posix.c | 6 ++----
>  util/main-loop.c            | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index e7c0099bdaf6..a1cd3dcc51cf 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -537,7 +537,7 @@ static void process_msg_connect(IVShmemState *s, uint16_t posn, int fd,
>  
>      IVSHMEM_DPRINTF("eventfds[%d][%d] = %d\n", posn, vector, fd);
>      event_notifier_init_fd(&peer->eventfds[vector], fd);
> -    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non block */
> +    g_unix_set_fd_nonblocking(fd, TRUE, NULL); /* msix/irqfd poll non block */

Does glib require us to use their non-standard TRUE, or can we merely
pass true and rely on C promotion rules to make the code look nicer?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


