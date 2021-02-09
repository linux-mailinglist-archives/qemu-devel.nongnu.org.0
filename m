Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72B314C7A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:08:10 +0100 (CET)
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PwH-0002kh-Cw
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:08:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9Pu2-0001dX-Qf
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:05:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9Pty-0001fA-RZ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612865145;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m1ATGORjSYoa5Irk7cab3sknr+41uFATDT/NQg6BQ5A=;
 b=ZmhzfDrVxEj5FpK1n3hWqeKVJFv4J+OTvu81jQMVEjabiHDuMjJDotDKKH8A7pYZRqWnlM
 7eVKYKVzj4yfvY5l5NFixD8ohLG+tNn3nNLY05F+DuwPv1vxMeBMkQVNkLaJePOW55Os0Z
 QtCiJXR3sVCfq+S7NbbH3e6uh0Ws9O8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-gGjDTrAEMeCvqEgM2Fx1kQ-1; Tue, 09 Feb 2021 05:05:42 -0500
X-MC-Unique: gGjDTrAEMeCvqEgM2Fx1kQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A364284E244;
 Tue,  9 Feb 2021 10:05:40 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 568E061461;
 Tue,  9 Feb 2021 10:05:38 +0000 (UTC)
Date: Tue, 9 Feb 2021 10:05:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hao Wang <wanghao232@huawei.com>
Subject: Re: [PATCH] migration/tls: add error handling in
 multifd_tls_handshake_thread
Message-ID: <20210209100535.GD1166421@redhat.com>
References: <20210209075251.1428743-1-wanghao232@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210209075251.1428743-1-wanghao232@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org,
 alex.chen@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 03:52:51PM +0800, Hao Wang wrote:
> If any error happens during multifd send thread creating (e.g. channel broke
> because new domain is destroyed by the dst), multifd_tls_handshake_thread
> may exit silently, leaving main migration thread hanging (ram_save_setup ->
> multifd_send_sync_main -> qemu_sem_wait(&p->sem_sync)).
> Fix that by adding error handling in multifd_tls_handshake_thread.
> 
> Signed-off-by: Hao Wang <wanghao232@huawei.com>
> ---
>  migration/multifd.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 45c690aa11..df29cdd26a 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -736,7 +736,16 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
>      } else {
>          trace_multifd_tls_outgoing_handshake_complete(ioc);
>      }
> -    multifd_channel_connect(p, ioc, err);
> +
> +    if (multifd_channel_connect(p, ioc, err)) {

Urgh, this method is rather confusing usng "true" to indicate failure.
In include/qapi/error.h we document

  • bool-valued functions return true on success / false on failure,

Admittedly this problem is pre-existing before this patch, but I
would none the less like to see a patch that fixes thse inverted
semantics first, and then this as a subsequent patch on top.

> +        /*
> +         * Error happen, mark multifd_send_thread status as 'quit' although it
> +         * is not created, and then tell who pay attention to me.
> +         */
> +        p->quit = true;
> +        qemu_sem_post(&multifd_send_state->channels_ready);
> +        qemu_sem_post(&p->sem_sync);
> +    }
>  }
>  
>  static void *multifd_tls_handshake_thread(void *opaque)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


