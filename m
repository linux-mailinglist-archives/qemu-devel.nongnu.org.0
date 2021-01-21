Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F62FF01D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 17:23:52 +0100 (CET)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ckR-0007OX-71
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 11:23:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2ce7-0004In-GM
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:17:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2ce5-0004fX-KA
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 11:17:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611245837;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Oh+7mhGSqCnyCchN4fR10xoeuqvN7Glgj7pWGgT3eoI=;
 b=Izzip7BGCxDLU4HzZFEopbGhZTs92ad2IHVEJwzrpB0RQBVpml5pbFJttgZ9kRdFUFGm34
 1ylMOzdnDB8jLwb7RJHi1vA6RMXuILNuQVw+PL82FC/0umYIG6QZ7pX6zkED9aiVTQcK1E
 WnXVDq9eLyfQqxYAh7uAc/r/kJAQwtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-Rowq1DBDN4qqYAZXZx6Ytw-1; Thu, 21 Jan 2021 11:17:13 -0500
X-MC-Unique: Rowq1DBDN4qqYAZXZx6Ytw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE7E41006C82;
 Thu, 21 Jan 2021 16:17:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EF7546;
 Thu, 21 Jan 2021 16:17:07 +0000 (UTC)
Date: Thu, 21 Jan 2021 16:17:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [PATCH v6 4/7] coroutine: add libucontext as external library
Message-ID: <20210121161703.GQ3125227@redhat.com>
References: <20210105022055.12113-1-j@getutm.app>
 <20210105022055.12113-5-j@getutm.app>
MIME-Version: 1.0
In-Reply-To: <20210105022055.12113-5-j@getutm.app>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 04, 2021 at 06:20:52PM -0800, Joelle van Dyne wrote:
> iOS does not support ucontext natively for aarch64 and the sigaltstack is
> also unsupported (even worse, it fails silently, see:
> https://openradar.appspot.com/13002712 )
> 
> As a workaround we include a library implementation of ucontext and add it
> as a build option.
> 
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  configure                 | 23 ++++++++++++++++++++---
>  meson.build               | 11 ++++++++++-
>  util/coroutine-ucontext.c |  9 +++++++++
>  .gitmodules               |  3 +++
>  meson_options.txt         |  2 ++
>  subprojects/libucontext   |  1 +
>  6 files changed, 45 insertions(+), 4 deletions(-)
>  create mode 160000 subprojects/libucontext

> diff --git a/.gitmodules b/.gitmodules
> index 2bdeeacef8..4f02eed79a 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -64,3 +64,6 @@
>  [submodule "roms/vbootrom"]
>  	path = roms/vbootrom
>  	url = https://git.qemu.org/git/vbootrom.git
> +[submodule "libucontext"]
> +	path = subprojects/libucontext
> +	url = https://github.com/utmapp/libucontext.git

Using libucontext looks like a good idea to me, but I noticed that
this is a pointing to a fork of the main libucontext project at

   https://github.com/kaniini/libucontext

The main project appears 100's of commits ahead of the utmapp fork

What is in the utmapp fork that isn't present in the primary libucontext
repo ?  I think if we're going to use libucontext we will want to point
to the primary project, and this means anything custom in the fork will
need to get submitted upstream. Maybe you've already started doing that
making this a non-issue ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


