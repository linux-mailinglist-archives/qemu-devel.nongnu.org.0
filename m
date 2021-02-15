Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA631BC70
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:29:58 +0100 (CET)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfoz-00075B-CC
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfnm-00062L-9F
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfnj-0003t6-Pl
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613402918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRHebAgC3rWL6oHz7pdfsOEO3FhvF4IPv8wtzGe8+Gg=;
 b=HPYBOlAR3cpaZHWOXzGI1KSgkV0ACaU79ZPZ9/ZCvX6NSrb6dx6EYZqeCa0TwyTSbQpDAg
 eMCAWeDpkLuJdflUnZvEyAgry8f0j0zvQYCtt6gaIKBX73fwVHBlUAKffnQQ/jt+MOTo6P
 ICJs5wpivbpopjuYo5NU4zkdkT9E3ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-1wyFjqylOiqqlSVJSqWnHA-1; Mon, 15 Feb 2021 10:28:34 -0500
X-MC-Unique: 1wyFjqylOiqqlSVJSqWnHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F6921007317;
 Mon, 15 Feb 2021 15:28:33 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13CB85D9C0;
 Mon, 15 Feb 2021 15:28:28 +0000 (UTC)
Date: Mon, 15 Feb 2021 16:28:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] monitor: Fix order in monitor_cleanup()
Message-ID: <20210215152827.GR7226@merkur.fritz.box>
References: <20201013125027.41003-1-kwolf@redhat.com>
 <12ad27f6-99f7-5c0f-c24a-f6784da67683@redhat.com>
MIME-Version: 1.0
In-Reply-To: <12ad27f6-99f7-5c0f-c24a-f6784da67683@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: f4bug@amsat.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.2021 um 16:08 hat Paolo Bonzini geschrieben:
> On 13/10/20 14:50, Kevin Wolf wrote:
> > We can only destroy Monitor objects after we're sure that they are not
> > in use by the dispatcher coroutine any more. This fixes crashes like the
> > following where we tried to destroy a monitor mutex while the dispatcher
> > coroutine still holds it:
> > 
> >   (gdb) bt
> >   #0  0x00007fe541cf4bc5 in raise () at /lib64/libc.so.6
> >   #1  0x00007fe541cdd8a4 in abort () at /lib64/libc.so.6
> >   #2  0x000055c24e965327 in error_exit (err=16, msg=0x55c24eead3a0 <__func__.33> "qemu_mutex_destroy") at ../util/qemu-thread-posix.c:37
> >   #3  0x000055c24e9654c3 in qemu_mutex_destroy (mutex=0x55c25133e0f0) at ../util/qemu-thread-posix.c:70
> >   #4  0x000055c24e7cfaf1 in monitor_data_destroy_qmp (mon=0x55c25133dfd0) at ../monitor/qmp.c:439
> >   #5  0x000055c24e7d23bc in monitor_data_destroy (mon=0x55c25133dfd0) at ../monitor/monitor.c:615
> >   #6  0x000055c24e7d253a in monitor_cleanup () at ../monitor/monitor.c:644
> >   #7  0x000055c24e6cb002 in qemu_cleanup () at ../softmmu/vl.c:4549
> >   #8  0x000055c24e0d259b in main (argc=24, argv=0x7ffff66b0d58, envp=0x7ffff66b0e20) at ../softmmu/main.c:51
> > 
> > Reported-by: Alex Bennée<alex.bennee@linaro.org>
> > Signed-off-by: Kevin Wolf<kwolf@redhat.com>
> 
> Is this a race, or is there a chance of adding a reliable reproducer to
> qtest?

It is a race, but it's a fix for a bug that was caught by one of the
acceptance tests quite reliably. Alex reported it here:

https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03124.html

So I think to the extent that we can have a reliable test case, we
probably have one, even if it wasn't written specifically for this bug.
But it's not run during 'make check' if this is what you had in mind.

Kevin


