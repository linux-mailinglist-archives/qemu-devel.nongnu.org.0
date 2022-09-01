Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFCF5A980A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:05:08 +0200 (CEST)
Received: from localhost ([::1]:58798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTjsO-000762-Oe
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTjoL-0003JG-BE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oTjoH-0007ih-CO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662037239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVbi3hhe9FT4cQoA1WJAwYU2Ciw9906hZZJwOH2Y2Tg=;
 b=eeL3nv/8yJtHWCojBkbovAsylCJfXRSw688T+N6P3IXwIEe78oLZFYpO/FVHpatfSVX734
 +wjHUxvMVWGQj7sQYoAFa6HzuDH473NkfUDD04OKYMiqTLFDLct3Vdz5UJa4Ko3Lk/fwIZ
 RFO+XtdgC6HBrxUdfrxVyA4wF1W9Rl0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-7veeJjGMO52NtamqmBn8zA-1; Thu, 01 Sep 2022 09:00:38 -0400
X-MC-Unique: 7veeJjGMO52NtamqmBn8zA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64CE880D08D;
 Thu,  1 Sep 2022 13:00:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E55418ECC;
 Thu,  1 Sep 2022 13:00:31 +0000 (UTC)
Date: Thu, 1 Sep 2022 14:00:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com
Subject: Re: [PATCH] io/command: implement portable spawn
Message-ID: <YxCs7A/XmaGyGsJ+@redhat.com>
References: <20220901111553.2901487-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901111553.2901487-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Thu, Sep 01, 2022 at 03:15:53PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Using GLib spawn API is both simpler and portable.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  io/channel-command.c | 115 ++++++++-----------------------------------
>  1 file changed, 21 insertions(+), 94 deletions(-)

> +    ioc = qio_channel_command_new_pid(stdinfd,
> +                                      stdoutfd,
> +#ifdef _WIN32
> +                                      GetProcessId(pid)
> +#else
> +                                      pid
> +#endif
> +        );

THe pid parameter is declared as 'pid_t' but GetProcessId returns
DWORD - are those types guaranteed compatible.

Also the pid passed into qio_channel_command_new_pid is used
by qio_channel_command_close/abort, to kill off the process,
but this code is stubbed out in WIN32 and this patch hasn't
provided an impl.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


