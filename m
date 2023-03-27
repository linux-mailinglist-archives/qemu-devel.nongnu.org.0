Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780E76C9F45
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:24:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgj50-0005s1-Mb; Mon, 27 Mar 2023 05:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgj4z-0005rr-2u
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgj4x-0000Sj-Au
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679909030;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZX/BzHyiPd6dGtb71rWcMwOqt4ricQR+IoZgkKkp7vQ=;
 b=D7Eom/dL8FXRVi0pr5JM6PhLfnvMbJ+OLm5QUEpEbcgXE3IxgsiTtfXALCG7Dd55iV5I6q
 4Y7wkPqvK1h15PSdqgC5O4fdVbev+2GCNakpkwFaDydo+P3mHMajT2KJQN842aciOyA70O
 IWMvqfv8FA6nictNYS8gBTV4+bcfhs0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-uVeqaNV5P9CUv9G_gk85Kg-1; Mon, 27 Mar 2023 05:23:47 -0400
X-MC-Unique: uVeqaNV5P9CUv9G_gk85Kg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FE423815EE3
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:23:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8264C202701E;
 Mon, 27 Mar 2023 09:23:46 +0000 (UTC)
Date: Mon, 27 Mar 2023 10:23:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: casantos@redhat.com
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] tracing: install trace events file only if necessary
Message-ID: <ZCFgnySXy4TdPyQD@redhat.com>
References: <20230326210446.66170-1-casantos@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230326210446.66170-1-casantos@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Mar 26, 2023 at 06:04:46PM -0300, casantos@redhat.com wrote:
> From: Carlos Santos <casantos@redhat.com>
> 
> It is required only if linux-user, bsd-user or system emulator is built.
> 
> Signed-off-by: Carlos Santos <casantos@redhat.com>
> ---
>  trace/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/trace/meson.build b/trace/meson.build
> index 8e80be895c..3fb41c97a4 100644
> --- a/trace/meson.build
> +++ b/trace/meson.build
> @@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
>                                   input: trace_events_files,
>                                   command: [ 'cat', '@INPUT@' ],
>                                   capture: true,
> -                                 install: true,
> +                                 install: have_linux_user or have_bsd_user or have_system,

Trace events are used by our command line tools too qemu-img, qemu-io,
qemu-nbd, qemu-pr-helper, qemu-storage-daemon.

What build scenario are you seeing that does NOT want the trace events
to be present ?   If there is any, then I might even call that situation
a bug, as we want trace events to be available as a debugging mechanism
for everything we build.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


