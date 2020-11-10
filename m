Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5862AD33E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:13:43 +0100 (CET)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQel-0002YO-0J
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcQdj-00028K-D7
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcQdf-0000Mn-J9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605003153;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=y+LSGCgrVGO/w1fBrB/STOF5FzIFLIkTPP3uaoge5ho=;
 b=Vhd+cz/kpDDKH7XM+kPw66ARf1H9vDY0d3PI664dVfLmxmtBV4er6LZeXad2qY2yT68E2l
 oW3REbcKSt8RqJMUn4MaQl1ucx9++nHqYOSbQLCIaBmW8SFcjaNJ1X6gtcsa5oepdg8EkF
 7mkid89fHm25PtdC9YwkcPy4yUvDX7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-WFWNlBpbN9CbDLdwFjXqHA-1; Tue, 10 Nov 2020 05:12:32 -0500
X-MC-Unique: WFWNlBpbN9CbDLdwFjXqHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB1C96123E;
 Tue, 10 Nov 2020 10:12:30 +0000 (UTC)
Received: from redhat.com (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE19D5C5FD;
 Tue, 10 Nov 2020 10:12:26 +0000 (UTC)
Date: Tue, 10 Nov 2020 10:12:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v2] migration/multifd: close TLS channel before socket
 finalize
Message-ID: <20201110101223.GA869656@redhat.com>
References: <1604660094-123959-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1604660094-123959-1-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Nov 06, 2020 at 06:54:54PM +0800, Chuan Zheng wrote:
> Since we now support tls multifd, when we cancel migration, the TLS
> sockets will be left as CLOSE-WAIT On Src which results in socket
> leak.
> Fix it by closing TLS channel before socket finalize.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/multifd.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 68b171f..a6838dc 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -523,6 +523,19 @@ static void multifd_send_terminate_threads(Error *err)
>      }
>  }
>  
> +static void multifd_tls_socket_close(QIOChannel *ioc, Error *err)
> +{
> +    if (ioc &&
> +        object_dynamic_cast(OBJECT(ioc),
> +                            TYPE_QIO_CHANNEL_TLS)) {
> +        /*
> +         * TLS channel is special, we need close it before
> +         * socket finalize.
> +         */
> +        qio_channel_close(ioc, &err);
> +    }
> +}

This doesn't feel quite right to me.  Calling qio_channel_close will close
both the TLS layer, and the underlying QIOChannelSocket. If the latter
is safe to do, then we don't need the object_dynamic_cast() check, we can
do it unconditionally whether we're using TLS or not.

Having said that, I'm not sure if we actually want to be using
qio_channel_close or not ?

I would have expected that there is already code somewhere else in the
migration layer that is closing these multifd channels, but I can't
actually find where that happens right now.  Assuming that code does
exist though, qio_channel_shutdown(ioc, BOTH) feels like the right
answer to unblock waiting I/O ops.

> +
>  void multifd_save_cleanup(void)
>  {
>      int i;
> @@ -542,6 +555,7 @@ void multifd_save_cleanup(void)
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>          Error *local_err = NULL;
>  
> +        multifd_tls_socket_close(p->c, NULL);
>          socket_send_channel_destroy(p->c);
>          p->c = NULL;
>          qemu_mutex_destroy(&p->mutex);
> -- 
> 1.8.3.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


