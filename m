Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC850B37E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:03:23 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpCF-0000cK-2E
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhp5O-0005Ym-Uz
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhp5N-0000gL-9r
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650617776;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCebkIZX5rYSmhxrwx/OkdJ6m2JlmQVXrS7IgO2R1Z4=;
 b=Ajh9jwBprDvdmIW3D2KZLNt6k8gEIpoTE+L7WA0jqToOVeCbuIdLsvTFTYsD7zHDbw6uXx
 iB8jRPjDiKVQ7IHyh/7o3krjojztRBs8f5iiKB1RGaoMH2dgUX95U/F7EYJE5fxnFxi2JL
 1G+ksxTodpRSBn627LtxrmqT0eLT/Wo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-kj5KM-WcPPKF3n2vyTO5OA-1; Fri, 22 Apr 2022 04:56:13 -0400
X-MC-Unique: kj5KM-WcPPKF3n2vyTO5OA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D050B85CE08
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:56:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2DF7434856;
 Fri, 22 Apr 2022 08:56:09 +0000 (UTC)
Date: Fri, 22 Apr 2022 09:56:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 08/10] Use g_unix_set_fd_nonblocking()
Message-ID: <YmJtpgNzy3omF0+V@redhat.com>
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-9-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220422083639.3156978-9-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

There are many more places in QEMU setting O_NONBLOCK.

$ git grep '\bO_NONBLOCK' | grep -i setfl
hw/misc/ivshmem.c:    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non block */
hw/rdma/rdma_backend.c:    rc = fcntl(backend_dev->channel->fd, F_SETFL, flags | O_NONBLOCK);
linux-user/syscall.c:        if (fcntl(fd, F_SETFL, O_NONBLOCK | flags) == -1) {
net/tap-bsd.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
net/tap-bsd.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
net/tap-linux.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
net/tap-solaris.c:    fcntl(fd, F_SETFL, O_NONBLOCK);
tests/qtest/fuzz/virtio_net_fuzz.c:    fcntl(sockfds[0], F_SETFL, O_NONBLOCK);
tests/tcg/multiarch/linux-test.c:    chk_error(fcntl(fds[0], F_SETFL, O_NONBLOCK));
tests/tcg/multiarch/linux-test.c:    chk_error(fcntl(fds[1], F_SETFL, O_NONBLOCK));
tests/unit/test-iov.c:       fcntl(sv[1], F_SETFL, O_RDWR|O_NONBLOCK);
tests/unit/test-iov.c:       fcntl(sv[0], F_SETFL, O_RDWR|O_NONBLOCK);
util/event_notifier-posix.c:        ret = fcntl_setfl(fds[0], O_NONBLOCK);
util/event_notifier-posix.c:        ret = fcntl_setfl(fds[1], O_NONBLOCK);
util/main-loop.c:    fcntl_setfl(sigfd, O_NONBLOCK);
util/oslib-posix.c:    f = fcntl(fd, F_SETFL, f & ~O_NONBLOCK);
util/oslib-posix.c:    if (fcntl(fd, F_SETFL, f | O_NONBLOCK) == -1) {


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


