Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7957B2C5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:22:03 +0200 (CEST)
Received: from localhost ([::1]:41220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE4y1-0005tX-LW
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE4wG-0004Hq-M4
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:20:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE4wC-0002ap-67
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658305206;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xheYTzS/0TA2zmYWQGsJCV0TTzWsJNxIvJTMlstqFmE=;
 b=Pxmv7xf3YpfGezXdgJjGTipO/MtQafnke2jwIsfJH+FPh+1/rw70avZrZ4rrKSMF5tOxVk
 K5wQFtbgedPxgE8E50tiV6LHQDi5zidYwcwSqlEi1K1CZS9gQ5B0neN9kbHt9Ei3KzAi8h
 DdBoiQw26F8UzAd9EaspbZonY32L20I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-GxXzrDUNNuisKzC16vvmAA-1; Wed, 20 Jul 2022 04:19:59 -0400
X-MC-Unique: GxXzrDUNNuisKzC16vvmAA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76D3A811E75;
 Wed, 20 Jul 2022 08:19:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC66492C3B;
 Wed, 20 Jul 2022 08:19:57 +0000 (UTC)
Date: Wed, 20 Jul 2022 09:19:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Hogan Wang <hogan.wang@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, wangxinxin.wang@huawei.com
Subject: Re: [PATCH v2] chardev: avoid use-after-free when client disconnect
Message-ID: <Yte6qzbrZk6jwXpw@redhat.com>
References: <20220720071057.1745-1-hogan.wang@huawei.com>
 <CAJ+F1CL6ppZ_J_HK4-hHQG21=cerzBmArL7tkUcy1eYpMLcYUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CL6ppZ_J_HK4-hHQG21=cerzBmArL7tkUcy1eYpMLcYUA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 20, 2022 at 11:36:07AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 20, 2022 at 11:13 AM Hogan Wang via <qemu-devel@nongnu.org>
> wrote:
> 
> > IOWatchPoll object did not hold the @ioc and @src objects reference,
> > then io_watch_poll_prepare execute in IO thread, if IOWatchPoll
> > removed by mian thread, then io_watch_poll_prepare access @ioc or
> >
> 
> mian->main
> 
> 
> > @src concurrently lead to coredump.
> >
> > In IO thread monitor scene, the IO thread used to accept client,
> > receive qmp request and handle hung-up event. Main thread used to
> > handle qmp request and send response, it will remove IOWatchPoll
> > and free @ioc when send response fail, then cause use-after-free
> >
> 
> I wonder if we are misusing GSources in that case, by removing sources from
> different threads.. Could you be more specific about the code path that
> leads to that?

It is permitted, but unfortunately every version of glib prior
to 2.64 has a race condition that means you'll periodically get
a use-after-free and a crash:

  https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1358

Libvirt worked around this problem by not calling 'g_source_unref'
directly, but instead have a helper that uses g_idle_add to delay
the unref such that its guaranteed to happen inside the main
event loop thread.

So I'd like to know what version of glib Hogan is using 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


