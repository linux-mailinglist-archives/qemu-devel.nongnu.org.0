Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5F5284DF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 15:01:58 +0200 (CEST)
Received: from localhost ([::1]:40860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqaMH-0005mS-KX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 09:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqZ0q-0005Ze-HC
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqZ0n-0007VB-7H
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652700940;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JGVKgWRDx9XucVSFnsJ/V7jbETgetaXm7+O43gnHok=;
 b=b3BEcfGCF0hesNrSzJ+WezDZpPJZypZBsTdFWf+e1La2iketXAklzest1q7tIPwMhsSlsR
 l94XFzcS3J2h19xVjl9AFTmWVeq5S6bpI74tpeYMQEBppQHPhtp27ifh2sRn2GFbImQZ5h
 3vjJEjo3JjZWfogIfkN0ncpXMK+4EnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-DMd-5o8aPBOJIqxacG-59Q-1; Mon, 16 May 2022 07:35:37 -0400
X-MC-Unique: DMd-5o8aPBOJIqxacG-59Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE5EE85A5BC;
 Mon, 16 May 2022 11:35:36 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9494F40CF8E2;
 Mon, 16 May 2022 11:35:33 +0000 (UTC)
Date: Mon, 16 May 2022 12:35:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v13 1/8] meson.build: Fix docker-test-build@alpine when
 including linux/errqueue.h
Message-ID: <YoI3A9lybeUtPM2N@redhat.com>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-2-leobras@redhat.com>
 <YoIxzC88w+jQlqoG@work-vm> <YoIyzi1PRYotgOyC@redhat.com>
 <YoI1x7PNtnuAAPr4@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoI1x7PNtnuAAPr4@work-vm>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, May 16, 2022 at 12:30:15PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Mon, May 16, 2022 at 12:13:16PM +0100, Dr. David Alan Gilbert wrote:
> > > * Leonardo Bras (leobras@redhat.com) wrote:
> > > > A build error happens in alpine CI when linux/errqueue.h is included
> > > > in io/channel-socket.c, due to redefining of 'struct __kernel_timespec':
> > > 
> > > OK, looks to be same mechanism as other meson tests.
> > 
> > > 
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > As of about an hour or so ago, this patch should not be required.
> > 
> >   https://gitlab.alpinelinux.org/alpine/aports/-/issues/13813
> 
> I'll take it anyway as protection against any other broken build envs.

Can you update the commit message at least then.

The root casue trigger for the bug is the OS uses a busybox
impl of mkdtemp, which isn't compat with the args liburing
configure was previously using. I doubt there are many such OS
around to be honest, as most will use coreutils.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


