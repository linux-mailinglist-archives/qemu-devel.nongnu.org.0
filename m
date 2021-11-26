Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A445F280
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:53:02 +0100 (CET)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqeT7-0005YO-HU
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqeRn-0004rn-8K
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:51:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqeRj-0005rc-Nq
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637945493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04B7MY2ITEocVr/yaPYQzVTAnojIM+JuSgdsVfqMkCM=;
 b=AsWg+/NH+hWy/gM7+D05iWZ030tvIrX08cvshGIksQUc44TM7ryE4kumxEWgQXlHBiKm2m
 oYoQe/ISsL6c4Asr0CrZ9qwOVok0G70THKrTTfW5h4eT5/hnr0E0fjWCZXvVQPgAV4L5iH
 +5Azw60LuNpJWr1WD3zuhotHjYdlzXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-gpCsXXjZOv6ps5TIVspHYg-1; Fri, 26 Nov 2021 11:51:30 -0500
X-MC-Unique: gpCsXXjZOv6ps5TIVspHYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 925408024C7;
 Fri, 26 Nov 2021 16:51:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF2119D9F;
 Fri, 26 Nov 2021 16:51:24 +0000 (UTC)
Date: Fri, 26 Nov 2021 16:51:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
Message-ID: <YaEQiiplMQqL/ur5@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de>
 <YaECIGJAPAtB+n8/@redhat.com>
 <1dc6d75c-022d-6900-c556-79929b13eada@suse.de>
MIME-Version: 1.0
In-Reply-To: <1dc6d75c-022d-6900-c556-79929b13eada@suse.de>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, cfontana@suse.de, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 26, 2021 at 05:44:04PM +0100, Li Zhang wrote:
> 
> On 11/26/21 4:49 PM, Daniel P. Berrangé wrote:
> > On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
> > > When doing live migration with multifd channels 8, 16 or larger number,
> > > the guest hangs in the presence of the network errors such as missing TCP ACKs.
> > > 
> > > At sender's side:
> > > The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> > > is called because one thread fails on qio_channel_write_all when
> > > the network problem happens and other send threads are blocked on sendmsg.
> > > They could not be terminated. So the main thread is blocked on qemu_thread_join
> > > to wait for the threads terminated.
> > Isn't the right answer here to ensure we've called 'shutdown' on
> > all the FDs, so that the threads get kicked out of sendmsg, before
> > trying to join the thread ?
> 
> If we shutdown the channels at sender's side, it could terminate send
> threads. The receive threads are still waiting there.
> 
> From receiver's side, if wait semaphore is timeout, the channels can be
> terminated at last. And the sender threads also be terminated at last.

If something goes wrong on the sender side, the mgmt app should be
tearing down the destination QEMU entirely, so I'm not sure we need
to do anything special to deal with received threads.

Using semtimedwait just feels risky because it will introduce false
failures if the system/network is under high load such that the
connections don't all establish within 1 second.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


