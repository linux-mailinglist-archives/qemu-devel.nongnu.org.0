Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6C85F63B5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:35:08 +0200 (CEST)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogNHV-00012q-6j
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMPE-0008O5-Va
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:39:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogMPC-0006dl-Pp
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BBT0+PzBYIx/v+i08zYs2QCVbJF941S+KEo3n50GCF0=;
 b=glAkCrGTBEpYCLeid+dED5rVXg98WPcpbYGIRMyWuKeT4AgtuD3TwmvOX9UinI6qdo7O6V
 RWRCZj9lFnRfnLAffuv7Q+emDMKGi9H/b19kxV7uSlWRpgX1i8Gl9VlTLU/XoXYCWFV+33
 KM+Nab0BUk0XBzbbXMBMkrBMvHG2izQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-HTxoSL4ZPbi2a_fohLFYMw-1; Thu, 06 Oct 2022 04:38:56 -0400
X-MC-Unique: HTxoSL4ZPbi2a_fohLFYMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD6BD862FE2
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:38:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2636C40C6F75;
 Thu,  6 Oct 2022 08:38:55 +0000 (UTC)
Date: Thu, 6 Oct 2022 09:38:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 4/5] io/command: implement support for win32
Message-ID: <Yz6UHB2e6Iccvx8Q@redhat.com>
References: <20221006081222.2606746-1-marcandre.lureau@redhat.com>
 <20221006081222.2606746-5-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006081222.2606746-5-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 12:12:21PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The initial implementation was changing the pipe state created by GLib
> to PIPE_NOWAIT, but it turns out it doesn't work (read/write returns an
> error). Since reading may return less than the requested amount, it
> seems to be non-blocking already. However, the IO operation may block
> until the FD is ready, I can't find good sources of information, to be
> safe we can just poll for readiness before.

The downside is that we double the number of syscalls for each blocking
I/O. Doesn't matter if we do actually block, but if there was data
already pending, this is extra overhead.

But then this code never worked on Windows, so users will likely not
have performance expectations at this time.

> 
> Alternatively, we could setup the FDs ourself, and use UNIX sockets on
> Windows, which can be used in blocking/non-blocking mode. I haven't
> tried it, as I am not sure it is necessary.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/io/channel-command.h |  3 ++
>  io/channel-command.c         | 80 ++++++++++++++++++++++++++----------
>  2 files changed, 62 insertions(+), 21 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


