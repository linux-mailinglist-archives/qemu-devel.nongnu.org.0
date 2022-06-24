Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D22559897
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 13:36:12 +0200 (CEST)
Received: from localhost ([::1]:49180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4hbf-0000p1-3Q
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 07:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o4haK-0008Tl-U3
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 07:34:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o4haF-0006Nf-QJ
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 07:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656070482;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=17vvSFhUiQVF8xRO4nCszKN3THo/uNxED1RyO4qo1PA=;
 b=LQU9BQkkEW5t/jYViQh0xV6gBeJ8aQjMiuOHDYxssLE7r6dgPfkfJJVGuZKKKy+uofWqpG
 o5AkivZcLID/e2GUGEhGJ8zdC5ehhi/tALd/lWuhQzGTWAD0U+BI9CNDGAuVW2sg2aHc/u
 zY4ljyTL65oayrLeRpt2M8fGo2Ag/Wk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-9pDs69-zNcysqS8LogIbkg-1; Fri, 24 Jun 2022 07:34:41 -0400
X-MC-Unique: 9pDs69-zNcysqS8LogIbkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC41F80174C;
 Fri, 24 Jun 2022 11:34:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E4A42166B26;
 Fri, 24 Jun 2022 11:34:37 +0000 (UTC)
Date: Fri, 24 Jun 2022 12:34:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH 1/2] chardev: don't set O_NONBLOCK on SCM_RIGHTS file
 descriptors.
Message-ID: <YrWhShg0FBRdVGZh@redhat.com>
References: <20220614111843.24960-1-arbn@yandex-team.com>
 <20220614111843.24960-2-arbn@yandex-team.com>
 <Yqna2umG17+Q73z3@stefanha-x1.localdomain>
 <83350578-69d7-2b17-6aa1-4faf7f51b3f3@yandex-team.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <83350578-69d7-2b17-6aa1-4faf7f51b3f3@yandex-team.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

On Fri, Jun 24, 2022 at 02:00:15PM +0300, Andrey Ryabinin wrote:
> 
> 
> On 6/15/22 16:12, Stefan Hajnoczi wrote:
> > On Tue, Jun 14, 2022 at 02:18:42PM +0300, Andrey Ryabinin wrote:
> >> This reverts commit 9b938c7262e4 ("chardev: clear O_NONBLOCK on SCM_RIGHTS file descriptors").
> >> File descriptor passed to QEMU via 'getfd' QMP command always
> >> changed to blocking mode. Instead of that, change blocking mode by QEMU
> >> file descriptors users when necessary, e.g. like migration.
> >>
> >> We need to preserve the state of the file descriptor in case it's still
> >> used by an external process and before the QEMU itself started
> >> using it.
> >>
> >> E.g. our local migration scenario with TAP networking looks like this:
> >>  1. Create TAP devices and pass file descriptors to source QEMU
> >>  2. Launch destination QEMU (-incoming defer) and pass same descriptors to it.
> >>  3. Start migration
> >>
> >> In such scenario setting blocking state at stage (2) will hang source QEMU
> >> since TAP fd suddenly become blocking.
> > 
> > Is it possible to add a special flag or API for preserving the
> > O_NONBLOCK open flag? That way the rest of QEMU could continue to safely
> > reset the flag while the tap fd passing code would explicitly ask for
> > the O_NONBLOCK open flag to be preserved. That seems safer but I haven't
> > checked whether it's possible to do this.
> > 
> 
> The only possibility I see here is embedding some kind 'nonblock' in the message
> itself along with fds. Not sure if this sensible approach.
> 
> Not changing fd state seems like more correct approach to me. E.g. I would expect
> that sending fd to qemu and executing qmp commands 'getfd' & 'closefd' shouldn't
> induce any changes in fd state. Which is currently no true.

I think that's a wrong expectation. The contract with 'getfd' is that
you are giving the target QEMU ownership of the file. The caller should
not expect todo anything with the FD after it has passd it to QEMU, and
target QEMU has freedom todo whatever it wants.  Admittedly this usage
model doesn't fit with what you're trying to make it now do, but those
are the historical expectations of getfd.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


