Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8802C539C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:09:45 +0100 (CET)
Received: from localhost ([::1]:44408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiG5o-00026h-O9
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiG2s-0001Dg-6S
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiG2p-0001wQ-BL
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:06:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606392398;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mN/n+CnSMcOkY4R5sv8giQPuR7sjSZtBfPz4DC6XvHM=;
 b=c70VTbYwTF8iplOjD1kNVYziJJeK8+FLxhXv6dWSuMgZ5BULdE1gUqFyfmpycu766MiUfC
 kP65E/UPBp/l+S27LFfOOdYbcB4kIeQ1oDiejkafI4zt6uXBp6On0WWEuvg1cBV7AQYi1n
 JjK8h0d6NVJwPYm236A33rQn6+ghBDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-juHihixdOoeHSnuY7nsBzg-1; Thu, 26 Nov 2020 07:06:33 -0500
X-MC-Unique: juHihixdOoeHSnuY7nsBzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A756E835B48;
 Thu, 26 Nov 2020 12:06:31 +0000 (UTC)
Received: from redhat.com (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE1260C05;
 Thu, 26 Nov 2020 12:06:27 +0000 (UTC)
Date: Thu, 26 Nov 2020 12:06:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 02/13] qemu/atomic: Drop special case for unsupported
 compiler
Message-ID: <20201126120624.GE1122957@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-3-marcandre.lureau@redhat.com>
 <CAFEAcA8QY_rt_JXy+O-3nOJUvbeAz7QMfXU3uDm78JigNvogiA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8QY_rt_JXy+O-3nOJUvbeAz7QMfXU3uDm78JigNvogiA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 11:49:28AM +0000, Peter Maydell wrote:
> On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Philippe Mathieu-Daudé <philmd@redhat.com>
> >
> > Since commit efc6c070aca ("configure: Add a test for the
> > minimum compiler version") the minimum compiler version
> > required for GCC is 4.8, which has the GCC BZ#36793 bug fixed.
> >
> > We can safely remove the special case introduced in commit
> > a281ebc11a6 ("virtio: add missing mb() on notification").
> >
> > With clang 3.8 (xenial amd64) __ATOMIC_RELAXED is defined, so the chunk
> > to remove (which is x86-specific), isn't reached.
> 
> The minimum clang version enforced by configure is 3.4, not 3.8.
> (Or Apple XCode clang 5.1 -- they use a different versioning scheme!)

We picked clang 3.4 based on fact that is what ships in EPEL7, and
Debian Jessie 3.5.  We then picked the XCode version to match.

Based on our platform support matrix we no longer support Debian
Jessie, and IMHO we also don't really need to consider 3rd party
add-on repos shipping non-default toolschains. So IMHO we could
entirely ignore clang in EPEL7 when picking min versions.

IOW, we are likely justified in picking a new clang version if
someone wants to research what is a suitable min version across
our intended supported distros.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


