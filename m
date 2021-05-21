Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD00A38CBD6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:18:05 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk8mi-0006Zm-Vz
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk8km-0003p1-FG
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lk8ki-0001G5-Py
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621617360;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Tf8STVDoIjzZ3MuxtZBYhquEQSrJy7cunQ4K5pNV3E=;
 b=D1Dt8g4zfjrGFpJCn3+p/yy3Hhy/3A7Q5uGO5PCOKixayuqCJcdKE6LVh2raS1FiaI1fp+
 A4hoaQRfP5oUuQzIuQh/GTdaoq4fyBJtS4iboHJOa4vUZt91FNevWQ1/xWSX5ETCtbm1qB
 4XNAma2DWp9WBITTRB6frWIGlVxL1JU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-WQw74YfRMyW-PK9er7TYLA-1; Fri, 21 May 2021 13:15:56 -0400
X-MC-Unique: WQw74YfRMyW-PK9er7TYLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ABB1802B4F;
 Fri, 21 May 2021 17:15:55 +0000 (UTC)
Received: from redhat.com (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F8B05D6DC;
 Fri, 21 May 2021 17:15:49 +0000 (UTC)
Date: Fri, 21 May 2021 18:15:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: A bug of Monitor Chardev ?
Message-ID: <YKfqw/dKNMSVIX4Q@redhat.com>
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com> <87lf88pmyn.fsf@dusky.pond.sub.org>
 <YKfHGC79w0uv41Zd@t490s> <YKfg6j4mPjvjSrcF@redhat.com>
 <YKfmLgz59nv5Ef5u@redhat.com> <YKfpPYQbAgZgQU08@t490s>
MIME-Version: 1.0
In-Reply-To: <YKfpPYQbAgZgQU08@t490s>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: chenjiashang@huawei.com, Markus Armbruster <armbru@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 01:09:17PM -0400, Peter Xu wrote:
> On Fri, May 21, 2021 at 05:56:14PM +0100, Daniel P. Berrangé wrote:
> > On Fri, May 21, 2021 at 05:33:46PM +0100, Daniel P. Berrangé wrote:
> > > On Fri, May 21, 2021 at 10:43:36AM -0400, Peter Xu wrote:
> > > > 
> > > > I think the original problem was that if qemu_chr_fe_set_handlers() is called
> > > > in main thread, it can start to race somehow within execution of the function
> > > > qemu_chr_fe_set_handlers() right after we switch context at:
> > > > 
> > > >     qemu_chr_be_update_read_handlers(s, context);
> > > > 
> > > > Then the rest code in qemu_chr_fe_set_handlers() will continue to run in main
> > > > thread for sure, but the should be running with the new iothread context, which
> > > > introduce a race condition.
> > > > 
> > > > Running qemu_chr_be_update_read_handlers() in BH resolves that because then all
> > > > things run in the monitor iothread only and natually serialized.
> > > 
> > > The first message in this thread, however, claims that it is *not*
> > > in fact serialized, when using the BH. 
> > > 
> > > > So the new comment looks indeed not fully right, as the chr device should be
> > > > indeed within main thread context before qemu_chr_fe_set_handlers(), it's just
> > > > that the race may start right away if without BH when context switch happens
> > > > for the chr.
> > > 
> > > It sounds like both the comment and the code are potentially wrong.
> > 
> > 
> > I feel like our root cause problem that the original code was trying to
> > workaround, is that the chardev is "active" from the very moment it is
> > created, regardless of whether the frontend is ready to use it.
> > 
> > IIUC, in this case the socket chardev is already listen()ing and
> > accept()ing incoming clients off the network, before the monitor
> > has finished configuring its hooks into the chardev. This means
> > that the initial listen()/accept() I/O watches are using the
> > default GMainContext, and the monitor *has* to remove them and
> > put in new watches on the thread private GMainContext.
> > 
> > To eliminate any risk of races, we need to make it possible for the
> > monitor to configure the GMainContext on the chardevs *before* any
> > I/O watches are configured.
> > 
> > This in turn suggests that we need to split the chardev initialization
> > into two phases. First we have the basic chardev creation, with object
> > creation, option parsing/sanity checking, socket creation, and then
> > second we have the actual activation where the I/O watches are added.
> 
> When we are still running the monitor_init() code IIUC the main thread is still
> occupied so it won't be able to handle any listen()/accept() even if there's
> event already, so IIUC race can only happen when main thread started the event
> loop then run concurrently with the BH in the other iothread.
> 
> So, besides above split of chardev init (which sounds like a bigger
> surgery)... would it also work if we let the main thread wait until that BH
> executed in monitor iothread?  Then all pending listen()/accept() event will
> directly be done in the monitor thread.

My concern is what happens when we add support for monitor hotplug
in the future. A client wanting to add a second monitor to a running
QEMU will run "chardev-add" followed by a hypothetical "monitor-add"
command. Both of these will be processed in the monitor thread, so
the main thread will have already started handling I/O events for
the chardev before "monitor-add" gets processed. Thus I think the
only long term safe solution is to have a design that guarantees
no I/O events are registered by *any* chardev impl, until the
frontend connects to the chardev.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


