Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36663FDD21
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:23:22 +0200 (CEST)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQD3-00075o-2C
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLQBd-0005Wc-3l
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:21:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLQBa-0003rl-DX
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630502509;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNno79i5fYpT1fEtDo/8L6+fT+mZCC3AktglZ6ssLOQ=;
 b=TdiOw820Ih4/9nLYCWyfD05h0qhAFIve/XOVZgHvjlvKqlijOB3qYmq4YwQX7OwIeBfQEy
 crc0JyJ7vq1XUEDvHIB8ciY7qfqnUL0pmEGePhcx7C7tgV5AZqvntepziXHwsT76ZaO0GI
 WeuFq6kJP6+kzSoJ3KGhV5elRgNdcuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-dySwL2_0M-yWF0GtH8h4pA-1; Wed, 01 Sep 2021 09:21:42 -0400
X-MC-Unique: dySwL2_0M-yWF0GtH8h4pA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D61810B7455;
 Wed,  1 Sep 2021 13:21:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4CE85D9DC;
 Wed,  1 Sep 2021 13:21:35 +0000 (UTC)
Date: Wed, 1 Sep 2021 14:21:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH v3] qemu-sockets: fix unix socket path copy (again)
Message-ID: <YS9+XUamI1Nl7lwf@redhat.com>
References: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 01, 2021 at 04:16:24PM +0300, Michael Tokarev wrote:
> Commit 4cfd970ec188558daa6214f26203fe553fb1e01f added an
> assert which ensures the path within an address of a unix
> socket returned from the kernel is at least one byte and
> does not exceed sun_path buffer. Both of this constraints
> are wrong:
> 
> A unix socket can be unnamed, in this case the path is
> completely empty (not even \0)
> 
> And some implementations (notable linux) can add extra
> trailing byte (\0) _after_ the sun_path buffer if we
> passed buffer larger than it (and we do).
> 
> So remove the assertion (since it causes real-life breakage)
> but at the same time fix the usage of sun_path. Namely,
> we should not access sun_path[0] if kernel did not return
> it at all (this is the case for unnamed sockets),
> and use the returned salen when copyig actual path as an
> upper constraint for the amount of bytes to copy - this
> will ensure we wont exceed the information provided by
> the kernel, regardless whenever there is a trailing \0
> or not. This also helps with unnamed sockets.
> 
> Note the case of abstract socket, the sun_path is actually
> a blob and can contain \0 characters, - it should not be
> passed to g_strndup and the like, it should be accessed by
> memcpy-like functions.
> 
> Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f
> Fixes: http://bugs.debian.org/993145
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> CC: qemu-stable@nongnu.org
> ---
>  util/qemu-sockets.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


