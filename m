Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03E332335
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:38:12 +0100 (CET)
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZkh-0006Op-UZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJZcy-0007Ld-BB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJZcv-0006h7-1J
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285808;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/a++lZvJiJQlnPZ+twVQxrgt/PblCVW/vMMHNnUng1w=;
 b=ihCRishhsXirlZ2/W+0A1b/iydJQ5lGEWpPcFR/qOaQYJWCHPjc8W6Wv9y9PyEuDxbQN0o
 Wx7A+EjqUNWejTfNZVbeXNxI/pIaZHjh69fuoB7vnxx//mkj7kiX7wE2kA6c84VVyRLaW0
 Jpg4D+KBEyytsD5c3mi9gECqcKMZFME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-4yxf5B8EMimoQQXDlZh9dQ-1; Tue, 09 Mar 2021 05:30:06 -0500
X-MC-Unique: 4yxf5B8EMimoQQXDlZh9dQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6325983DD20;
 Tue,  9 Mar 2021 10:30:05 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F06710013C1;
 Tue,  9 Mar 2021 10:29:59 +0000 (UTC)
Date: Tue, 9 Mar 2021 10:29:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] coroutine: add libucontext as external library
Message-ID: <YEdOJIUp5wsVo0ao@redhat.com>
References: <20210309032637.41778-1-j@getutm.app> <YEdBce6TWCVpSph9@redhat.com>
 <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
 <537a6a0e-431b-3920-c8dc-290e4e3d8895@redhat.com>
MIME-Version: 1.0
In-Reply-To: <537a6a0e-431b-3920-c8dc-290e4e3d8895@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 11:24:08AM +0100, Paolo Bonzini wrote:
> On 09/03/21 10:59, Joelle van Dyne wrote:
> > Does it make a difference if this is provided as an option and not as
> > a replacement? Would it make sense to add some warning at configure
> > time? Right now none of the concurrency backends are supported on iOS
> > and it's possible support will go away on macOS as well in the future.
> > QEMU would not be able to run at all.
> 
> The alternative is to use a handwritten backend, it would be necessary
> anyway for CET support.
> 
> You can find the patches at
> https://patchew.org/QEMU/20190504120528.6389-1-pbonzini@redhat.com/

It sure would be nice if someone could take the QEMU coroutine impls
and spin them out into a "libcoroutine" for reuse. We use coroutines
across QEMU, SPICE-GTK, GTK-VNC and all have different featureset and
QEMU's seems the best in general, especially as you start adding the
CET stuff.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


