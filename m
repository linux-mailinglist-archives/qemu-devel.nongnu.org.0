Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7B33882E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:03:53 +0100 (CET)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdi4-0001TO-Aa
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKdfY-0000BZ-B2
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:01:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKdfT-0008HR-Ub
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dKI4tx/egMCr1fUmWv6BsbxiZUc5P5KjsUfN7vKp1pU=;
 b=Bb/sEc/nCE2W41SQSf9BjX53D/b0MY+BeJNT97kpbYgkku25XtyVJ94SuLT7RIb0lG/LEl
 NbQXhKYK8B0TF/JBYqheIEK0lcRu50zUAJhgfvSXxOpcIOFmQF1u5LMlU1GlLXDo8+6rSB
 ISIJ01jz7cUa2veSyckLtg7BrH6F/yo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-dHtkqF-ANi-EWqBsqVERqQ-1; Fri, 12 Mar 2021 04:01:08 -0500
X-MC-Unique: dHtkqF-ANi-EWqBsqVERqQ-1
Received: by mail-wm1-f69.google.com with SMTP id a3so1857024wmm.0
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dKI4tx/egMCr1fUmWv6BsbxiZUc5P5KjsUfN7vKp1pU=;
 b=P9m9C9RKJqCPMc0OotmVXYfM2O/vlcrxYBHXpAZfqxVYKhK692r0iWZyR9k711KV/C
 CQVdf2tPh7t0n8CQn+3NvVxYVQCy4KnWn5Q2wvVTJ0RpHwgnM90OJICl18sZVe2gLhEZ
 fIBQf/1dpxYCtK94mZV/lwAOGQ8/XGe8WJibe+H2lNjflTGBH+lKNYyEUlC5JGtiE6xD
 h3Bhy3QaXPasBYg3eHudS8hhY50HAE/85eBzSMqCr0+FAjDw5IHC9dA36M6ZqOuVdHV6
 7mpJgD/iysDZcN9flhpoIrYWS3eJyK4e49GLM5Ax0QqfBGLUKghpUO3vTsvl2R3RC4+I
 f7jQ==
X-Gm-Message-State: AOAM533ntbdxBtRhjnHn6PMzWSt2Lk/mpnm+GLxZnxfQcb+Vq4WvNP25
 UoRWZTCtTyMYdTpCgHsnt8RyfP84QaLzR4lxK1bI8Gzt9cyv4+9kCkzYJsDaOATm32SA+WI/vXg
 TiwOGOIsOPCaieU0=
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr12145540wmb.2.1615539667520; 
 Fri, 12 Mar 2021 01:01:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7a3i/BpZIUVt8Bw8mWGJNUcXXhYqxPUqIdQUcsqM0gfu4EbVwP2kewddM2u2b4OJztbxSfQ==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr12145514wmb.2.1615539667309; 
 Fri, 12 Mar 2021 01:01:07 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id n186sm1409710wmn.22.2021.03.12.01.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:01:06 -0800 (PST)
Date: Fri, 12 Mar 2021 10:01:04 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
Message-ID: <20210312090104.52xemd7umyawotnc@steredhat>
References: <20210310173004.420190-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310173004.420190-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 05:30:04PM +0000, Stefan Hajnoczi wrote:
>socket_get_fd() fails with the error "socket_get_fd: too many
>connections" if the given listen backlog value is not 1.
>
>Not all callers set the backlog to 1. For example, commit
>582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
>socket listen() backlog") uses SOMAXCONN. This will always fail with in
>socket_get_fd().
>
>This patch calls listen(2) on the fd to update the backlog value. The
>socket may already be in the listen state. I have tested that this works
>on Linux 5.10 and macOS Catalina.

Confirmed also from the listen(2) man page of FreeBSD:
"A subsequent listen() system call on the listening socket allows the 
caller to change the maximum queue length using a new backlog argument."

>
>As a bonus this allows us to detect when the fd cannot listen. Now we'll
>be able to catch unbound or connected fds in socket_listen().
>
>Drop the num argument from socket_get_fd() since this function is also
>called by socket_connect() where a listen backlog value does not make
>sense.
>
>Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog parameter to socket_listen")
>Reported-by: Richard W.M. Jones <rjones@redhat.com>
>Cc: Juan Quintela <quintela@redhat.com>
>Cc: Eric Blake <eblake@redhat.com>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
> 1 file changed, 22 insertions(+), 7 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano


