Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D08B2AD460
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:02:59 +0100 (CET)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRQQ-0004aC-Lr
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcROz-0003hw-Ek
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:01:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcROx-0000kd-CC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006085;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcTxR47XHgSb2TmbjIWDtYacQvcSkd9bPQBNNvRcsOI=;
 b=f4cyxj0qZsZRjVCRVfaeGZkxBEjQy1l32+y3gK2MsCmv1L3WUxFBgGFqRjBmJn+avY5jBW
 zXbL7IT9ZWwCfMEOP3eCxMTWMa6q1xamxjGKeL6V3oROn4XLb+Jd1jzODY/N2mIvB7Pdlg
 u394X2YP9oSEk2pvs2wMRIX9usA1SHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-kz4RSRgRMuWNUHipkcnNpw-1; Tue, 10 Nov 2020 06:01:14 -0500
X-MC-Unique: kz4RSRgRMuWNUHipkcnNpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB25B1074654;
 Tue, 10 Nov 2020 11:01:12 +0000 (UTC)
Received: from redhat.com (ovpn-115-68.ams2.redhat.com [10.36.115.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CB6F6EF4B;
 Tue, 10 Nov 2020 11:01:09 +0000 (UTC)
Date: Tue, 10 Nov 2020 11:01:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH v2] migration/multifd: close TLS channel before socket
 finalize
Message-ID: <20201110110106.GB869656@redhat.com>
References: <1604660094-123959-1-git-send-email-zhengchuan@huawei.com>
 <20201110101223.GA869656@redhat.com>
 <2dbfc8d0-a426-93bc-a4e0-a7e813d34dce@huawei.com>
MIME-Version: 1.0
In-Reply-To: <2dbfc8d0-a426-93bc-a4e0-a7e813d34dce@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
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

On Tue, Nov 10, 2020 at 06:45:45PM +0800, Zheng Chuan wrote:
> 
> 
> On 2020/11/10 18:12, Daniel P. Berrangé wrote:
> > On Fri, Nov 06, 2020 at 06:54:54PM +0800, Chuan Zheng wrote:
> >> Since we now support tls multifd, when we cancel migration, the TLS
> >> sockets will be left as CLOSE-WAIT On Src which results in socket
> >> leak.
> >> Fix it by closing TLS channel before socket finalize.
> >>
> >> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> >> ---
> >>  migration/multifd.c | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >>
> >> diff --git a/migration/multifd.c b/migration/multifd.c
> >> index 68b171f..a6838dc 100644
> >> --- a/migration/multifd.c
> >> +++ b/migration/multifd.c
> >> @@ -523,6 +523,19 @@ static void multifd_send_terminate_threads(Error *err)
> >>      }
> >>  }
> >>  
> >> +static void multifd_tls_socket_close(QIOChannel *ioc, Error *err)
> >> +{
> >> +    if (ioc &&
> >> +        object_dynamic_cast(OBJECT(ioc),
> >> +                            TYPE_QIO_CHANNEL_TLS)) {
> >> +        /*
> >> +         * TLS channel is special, we need close it before
> >> +         * socket finalize.
> >> +         */
> >> +        qio_channel_close(ioc, &err);
> >> +    }
> >> +}
> > 
> > This doesn't feel quite right to me.  Calling qio_channel_close will close
> > both the TLS layer, and the underlying QIOChannelSocket. If the latter
> > is safe to do, then we don't need the object_dynamic_cast() check, we can
> > do it unconditionally whether we're using TLS or not.
> > 
> > Having said that, I'm not sure if we actually want to be using
> > qio_channel_close or not ?
> > 
> > I would have expected that there is already code somewhere else in the
> > migration layer that is closing these multifd channels, but I can't
> > actually find where that happens right now.  Assuming that code does
> > exist though, qio_channel_shutdown(ioc, BOTH) feels like the right
> > answer to unblock waiting I/O ops.
> > 
> Hi, Daniel.
> Actually, I have tried to use qio_channel_shutdown at the same place,
> but it seems not work right.
> the socket connection is closed by observing through 'ss' command but
> the socket fds in /proc/$(qemu pid)/fd are still residual.
> 
> The underlying QIOChannelSocket will be closed by
> qio_channel_socket_finalize() through object_unref(QIOChannel) later
> in socket_send_channel_destroy(),
> does that means it is safe to close both of TLS and tcp socket?

Hmm, that makes me even more confused, because the object_unref
should be calling qio_channel_close() already.

eg with your patch we have:

       multifd_tls_socket_close(p->c, NULL);
           -> qio_channel_close(p->c)
	        -> qio_channel_tls_close(p->c)
                     -> qio_channel_close(master)

       socket_send_channel_destroy(p->c)
           -> object_unref(p->c)
	         -> qio_channel_tls_socket_finalize(p->c)
		      -> object_unref(master)
		              -> qio_channel_close(master)

so the multifd_tls_socket_close should not be doing anything
at all *assuming* we releasing the last reference in our
object_unref call.

Given what you describe, I think we are *not* releasing the
last reference. There is an active reference being held
somewhere else, and that is preventing the QIOChannelSocket
from being freed and thus the socket remains open.

If that extra active reference is a bug, then we have a memory
leak of the QIOChannelSocket object, that needs fixing somewhere.

If that extra active reference is intentional, then we do indeed
need to explicitly close the socket. That is possibly better
handled by putting a qio_channel_close() call into the
socket_send_channel_destroy() method.

I wonder if we're leaking a reference to the underlying QIOChannelSocket,
when we create the QIOChannelTLS wrapper ? That could explain a problem
that only happens when using TLS.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


