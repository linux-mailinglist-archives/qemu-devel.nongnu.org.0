Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127C589F7E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:42:56 +0200 (CEST)
Received: from localhost ([::1]:45350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdvx-0002q6-VU
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJduM-0000ni-SZ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJduI-0002YZ-Jd
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659631269;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fwv1n8F5bKWWEtaZ0uAck0Pb7YmqAU5CknMfF90ICP0=;
 b=NyOMz1rR0nt5QF//Qs5qWfDZaJUNV09PP01fiaIHYomIAtLEU4sx6Nh1vwDijaWz6BuqYM
 NINv4BD/xHcZ154JlseQvL4crow8j/91x9hzHvPxjWBGGfkarcJxpUlI4m7e3VkBEYyZIC
 1j9iH5z2r0YvQ4FjMslH0Xyh85Stwzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-41qNgNT0P-2R6qIcrf5CnA-1; Thu, 04 Aug 2022 12:41:06 -0400
X-MC-Unique: 41qNgNT0P-2R6qIcrf5CnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A37C18A6524;
 Thu,  4 Aug 2022 16:41:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69AE91121314;
 Thu,  4 Aug 2022 16:41:04 +0000 (UTC)
Date: Thu, 4 Aug 2022 17:41:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <Yuv2nW57bSGdK/1d@redhat.com>
References: <20220803173141.52711-1-imbrenda@linux.ibm.com>
 <YuqxtV1O8IqRAuDu@redhat.com> <YuuDc8nsLtPvtrQ7@redhat.com>
 <20220804164929.2ae0d34e@p-imbrenda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220804164929.2ae0d34e@p-imbrenda>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 04, 2022 at 04:49:29PM +0200, Claudio Imbrenda wrote:
> On Thu, 4 Aug 2022 09:29:39 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Wed, Aug 03, 2022 at 06:34:45PM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Aug 03, 2022 at 07:31:41PM +0200, Claudio Imbrenda wrote:  
> > > > This patch adds support for asynchronously tearing down a VM on Linux.
> > > > 
> > > > When qemu terminates, either naturally or because of a fatal signal,
> > > > the VM is torn down. If the VM is huge, it can take a considerable
> > > > amount of time for it to be cleaned up. In case of a protected VM, it
> > > > might take even longer than a non-protected VM (this is the case on
> > > > s390x, for example).
> > > > 
> > > > Some users might want to shut down a VM and restart it immediately,
> > > > without having to wait. This is especially true if management
> > > > infrastructure like libvirt is used.
> > > > 
> > > > This patch implements a simple trick on Linux to allow qemu to return
> > > > immediately, with the teardown of the VM being performed
> > > > asynchronously.
> > > > 
> > > > If the new commandline option -async-teardown is used, a new process is
> > > > spawned from qemu at startup, using the clone syscall, in such way that
> > > > it will share its address space with qemu.
> > > > 
> > > > The new process will then simpy wait until qemu terminates, and then it
> > > > will exit itself.
> > > > 
> > > > This allows qemu to terminate quickly, without having to wait for the
> > > > whole address space to be torn down. The teardown process will exit
> > > > after qemu, so it will be the last user of the address space, and
> > > > therefore it will take care of the actual teardown.
> > > > 
> > > > The teardown process will share the same cgroups as qemu, so both
> > > > memory usage and cpu time will be accounted properly.
> > > > 
> > > > This feature can already be used with libvirt by adding the following
> > > > to the XML domain definition:
> > > > 
> > > >   <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
> > > >   <arg value='-async-teardown'/>
> > > >   </commandline>  
> > > 
> > > How does this work in practice ?  Libvirt should be blocking until
> > > all processes in the cgroup have exited, including this cloned
> > > child process.  
> > 
> > Also, have you disabled use of seccomp with QEMU when testing this,
> > as the seccomp filter that libivrt enables is supposed to block
> > any use of clone() except for the creation of threads.
> 
> it was just a vanilla libvirt 8.0.0 as found on ubuntu 22.04; I have no
> idea how it is configured by default

Ok, so the reason it is working is because the extra process is
cloned() right in middle of processing argv. This is before the
seccomp filter is applied to the process, so clone() is not blocked.

One think I note about this in practice is that (unsurprisingly)
if you do a process listing, users now see 2 QEMU processes instead
of one.

I wonder if we should consider overwriting argv in the child
process with "[qemu async teardown]" to give users a hint as to
why this duplicate process exists.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


