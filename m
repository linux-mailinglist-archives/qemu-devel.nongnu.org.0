Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647AF3FC833
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:27:32 +0200 (CEST)
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3nX-0006VN-GU
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL3dP-0007Ss-E7
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL3dM-0004cC-0H
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630415819;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w90QN2CKkG6KRhzyWnX/qADimZ4lijH3lsVftohbFZQ=;
 b=bPknZ0FWMchqGSpooP7r9XjzuEXb6qWbaBJ5hAp5Y2ZgSXuqRzj4FFhvkkdq/1nQ4wggHP
 cCBZIkw46iOtSrUCHa1S6zCrFPJ74+FlF+God8ltKyZbUoe1YW5jJCyqldfvvYeU/woYyT
 e7zCO75eETCEZ8kCBfyKEi8zWhfwbtA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-SphMBlcdMK27mviMh_ULeQ-1; Tue, 31 Aug 2021 09:16:58 -0400
X-MC-Unique: SphMBlcdMK27mviMh_ULeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFEF880198A;
 Tue, 31 Aug 2021 13:16:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 250482CB37;
 Tue, 31 Aug 2021 13:16:45 +0000 (UTC)
Date: Tue, 31 Aug 2021 14:16:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YS4rulGV9eueB04H@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210831110238.299458-4-leobras@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
> 
> Change the send_write() interface of multifd, allowing it to pass down
> flags for qio_channel_write*().
> 
> Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> other data being sent at the default copying approach.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd-zlib.c | 7 ++++---
>  migration/multifd-zstd.c | 7 ++++---
>  migration/multifd.c      | 9 ++++++---
>  migration/multifd.h      | 3 ++-
>  4 files changed, 16 insertions(+), 10 deletions(-)

> @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
>              }
>  
>              if (used) {
> -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
> +                                                          &local_err);

I don't think it is valid to unconditionally enable this feature due to the
resource usage implications

https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html

  "A zerocopy failure will return -1 with errno ENOBUFS. This happens 
   if the socket option was not set, the socket exceeds its optmem 
   limit or the user exceeds its ulimit on locked pages."

The limit on locked pages is something that looks very likely to be
exceeded unless you happen to be running a QEMU config that already
implies locked memory (eg PCI assignment)


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


