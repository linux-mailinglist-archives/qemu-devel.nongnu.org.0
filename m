Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870582AEE55
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:59:52 +0100 (CET)
Received: from localhost ([::1]:55552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmut-0000fZ-Ku
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcmu1-0000D6-DU
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:58:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcmtz-0002jl-N6
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605088734;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X1JgI6fGJphdijElC76Isova7XEzK+UIVTIXnTv0N+w=;
 b=f2gMo/PjaXkzbRpTU8LnK65ZyaVe2Aw5SnVV2gPTXmOxa9kyXVCJ5I10mysO/ShwV8YIxZ
 Fsoj39P/aKMfxyUgHAoAdt4klkDzIu7uTZlzlfbVr82yuLvBGeF56FrDEApvim/kddjgOv
 nRpZWP3PerQ0MSUJnLki4KA72hwQ2hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-cHBz2MKXNfaJ3CDADr5Fmg-1; Wed, 11 Nov 2020 04:58:51 -0500
X-MC-Unique: cHBz2MKXNfaJ3CDADr5Fmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0950EC1A0;
 Wed, 11 Nov 2020 09:58:49 +0000 (UTC)
Received: from redhat.com (ovpn-114-221.ams2.redhat.com [10.36.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 336FF6EF7F;
 Wed, 11 Nov 2020 09:58:47 +0000 (UTC)
Date: Wed, 11 Nov 2020 09:58:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [RESEND][PATCH] multifd/tls: fix memoryleak of the
 QIOChannelSocket object when canceling migration
Message-ID: <20201111095843.GC906488@redhat.com>
References: <1605078858-114607-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1605078858-114607-1-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 03:14:18PM +0800, Chuan Zheng wrote:
> When creating new tls client, the tioc->master will be referenced, we need dereferenced
> it after tls handshake.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 68b171f..df76a8e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -728,7 +728,8 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
>                                             gpointer opaque)
>  {
>      MultiFDSendParams *p = opaque;
> -    QIOChannel *ioc = QIO_CHANNEL(qio_task_get_source(task));
> +    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(qio_task_get_source(task));
> +    QIOChannel *ioc = QIO_CHANNEL(tioc);
>      Error *err = NULL;
>  
>      if (qio_task_propagate_error(task, &err)) {
> @@ -737,6 +738,7 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
>          trace_multifd_tls_outgoing_handshake_complete(ioc);
>      }
>      multifd_channel_connect(p, ioc, err);
> +    object_unref(OBJECT(tioc->master));
>  }

I think this should be done earlier, at the time where we wrap the channel.
eg in multifd_tls_channel_connect(), immediately after the call to
migration_tls_client_create, as that's where the double reference starts
from.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


