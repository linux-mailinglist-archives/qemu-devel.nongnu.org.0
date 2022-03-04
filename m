Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1CA4CD410
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 13:10:45 +0100 (CET)
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6lg-0001NM-IW
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 07:10:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6Zn-0007ft-Tp
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:58:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ6Zm-0006Tl-66
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646395105;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ERXGgs63RbYzfXXpwKccdFvD+9kFlCDMAXpXQkqre8=;
 b=gK05Ae5vAoFJH6f8ZFc0tD7wvC48kc5+0gQSTsnjei3VbWWUCJMn5jyEHANq+ivIv1BS7j
 WnS/3Jh4bzvqSguJdr4yJ8blKyU8K6SqOlcqbpoOZOCUWAChWCRap83Jcn/O878X+NtyNB
 M6tqkgEFUAfItlaNpKWHuKzpj1HBCaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-dly2VlUXO_izBIYlLUJbiQ-1; Fri, 04 Mar 2022 06:58:20 -0500
X-MC-Unique: dly2VlUXO_izBIYlLUJbiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1931A51DF;
 Fri,  4 Mar 2022 11:58:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE24910589A5;
 Fri,  4 Mar 2022 11:58:06 +0000 (UTC)
Date: Fri, 4 Mar 2022 11:58:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/4] os-posix: Add os_set_daemonize()
Message-ID: <YiH+y6rogxl4tNMP@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
 <20220303164814.284974-2-hreitz@redhat.com>
 <YiHZsQghj8E5TRZX@redhat.com> <YiHn9yQY2d98KaHk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YiHn9yQY2d98KaHk@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 11:20:39AM +0100, Kevin Wolf wrote:
> Am 04.03.2022 um 10:19 hat Daniel P. Berrangé geschrieben:
> > On Thu, Mar 03, 2022 at 05:48:11PM +0100, Hanna Reitz wrote:
> > > The daemonizing functions in os-posix (os_daemonize() and
> > > os_setup_post()) only daemonize the process if the static `daemonize`
> > > variable is set.  Right now, it can only be set by os_parse_cmd_args().
> > > 
> > > In order to use os_daemonize() and os_setup_post() from the storage
> > > daemon to have it be daemonized, we need some other way to set this
> > > `daemonize` variable, because I would rather not tap into the system
> > > emulator's arg-parsing code.  Therefore, this patch adds an
> > > os_set_daemonize() function, which will return an error on os-win32
> > > (because daemonizing is not supported there).
> > 
> > IMHO the real flaw here is the design of 'os_daemonize' in that it
> > relies on static state. If I see a call to a function 'os_daemonize()'
> > I expect to be daemonized on return, but with this design that is not
> > guaranteed which is a big surprise.
> > 
> > I'd suggest we push the condition into the caller instead of adding
> > this extra function, so we have the more sane pattern:
> > 
> >    if (daemonmize()) {
> >       os_daemonize()
> >    }
> 
> It's not as simple, the static daemonize variable is used in more places
> than just os_daemonize(). I'm not sure if it's worth changing how all of
> this works, but if we did, it would be a refactoring mostly focussed on
> the system emulator and an issue separate from adding the option to the
> storage daemon.

It isn't that difficult to do the refactoring needed, so I've just
sent a series that does the job and CC folks from this thread on it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


