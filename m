Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F023D5B82
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:24:06 +0200 (CEST)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81WX-00058g-Fn
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m81Vb-0004Oc-Nb
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m81VZ-0007wS-G8
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627309380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/6UywwQkoVZYIcGBGWEM0cLZfg+6bs7dUWy8yZV+j8=;
 b=Fa0y+PqxaHeUXyVFRmnD+/kBGWMfHVY75kwVTgTZxSZo1YpXo02tIbQA63BvYgL4Jndwz+
 jUlZ277CSsDw0Dm92MNz7JOSmWD0AHA5jCFXMXV9LCnut0ItvIMjKGMOPl+lK6Tx04UCKe
 srrMBBdZYvidxTrKULliHA22LK3oXe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-BMSHURnuOxGXe_ILl240Vw-1; Mon, 26 Jul 2021 10:22:58 -0400
X-MC-Unique: BMSHURnuOxGXe_ILl240Vw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09D0D190A7A1;
 Mon, 26 Jul 2021 14:22:57 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.phx2.redhat.com [10.3.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C666E6E9;
 Mon, 26 Jul 2021 14:22:56 +0000 (UTC)
Date: Mon, 26 Jul 2021 09:22:54 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v2] nbd/server: Add --selinux-label option
Message-ID: <20210726142254.ia7g2jt5gb36cb7u@redhat.com>
References: <20210723103303.1731437-1-rjones@redhat.com>
 <20210723103303.1731437-2-rjones@redhat.com>
 <YPqePyWeE9p6NkxR@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YPqePyWeE9p6NkxR@redhat.com>
User-Agent: NeoMutt/20210205-647-5d4e008
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 11:47:51AM +0100, Daniel P. Berrangé wrote:
> On Fri, Jul 23, 2021 at 11:33:03AM +0100, Richard W.M. Jones wrote:
> > Under SELinux, Unix domain sockets have two labels.  One is on the
> > disk and can be set with commands such as chcon(1).  There is a
> > different label stored in memory (called the process label).  This can
> > only be set by the process creating the socket.  When using SELinux +
> > SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> > you must set both labels correctly first.
> > 
> > For qemu-nbd the options to set the second label are awkward.  You can
> > create the socket in a wrapper program and then exec into qemu-nbd.
> > Or you could try something with LD_PRELOAD.
> > 
> > This commit adds the ability to set the label straightforwardly on the
> > command line, via the new --selinux-label flag.  (The name of the flag
> > is the same as the equivalent nbdkit option.)
> > 
> > A worked example showing how to use the new option can be found in
> > this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > 
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > ---
> >  configure                                     |  9 ++++-
> >  meson.build                                   | 10 +++++-
> >  meson_options.txt                             |  3 ++
> >  qemu-nbd.c                                    | 33 +++++++++++++++++++
> >  tests/docker/dockerfiles/centos8.docker       |  1 +
> >  tests/docker/dockerfiles/fedora.docker        |  1 +
> >  tests/docker/dockerfiles/opensuse-leap.docker |  1 +
> >  tests/docker/dockerfiles/ubuntu1804.docker    |  1 +
> >  tests/docker/dockerfiles/ubuntu2004.docker    |  1 +
> >  9 files changed, 58 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks. This is a new feature, so it doesn't qualify for inclusion in
6.1, but I'm queuing it through my NBD tree to go in as soon as
upstream reopens for 6.2.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


