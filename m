Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CBA60CCC5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:58:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJQ0-0000Tv-97; Tue, 25 Oct 2022 08:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onJPn-0007W5-TA
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1onJPl-0004MO-Uf
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666702333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=STergkrSlGfKID0//+ZuY6so5V7MGJWWojf1Ft6DV/8=;
 b=QzCp0XFVfGH9sl/7f6laiMPLmj0P8xy2DNPz4j268z1aD6ZAelF8sEG8FnzQwNnZ01c8J9
 LHIUyp3a5HlsP8M2NTrmkm4/VenwERNh7sG/WL/yMGqMcTNh+PL4uyXQriyjt804lOQ688
 olFNEN9UjzW3sk+8Ud+9UgZ7UIFZSfw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-ycgb0XMZNiKoOm1UO6cgCw-1; Tue, 25 Oct 2022 08:52:09 -0400
X-MC-Unique: ycgb0XMZNiKoOm1UO6cgCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA39C185A7AD;
 Tue, 25 Oct 2022 12:52:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 432BC10197;
 Tue, 25 Oct 2022 12:52:06 +0000 (UTC)
Date: Tue, 25 Oct 2022 13:52:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, qemu-devel@nongnu.org,
 david@redhat.com, cohuck@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, alex.bennee@linaro.org, armbru@redhat.com,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Subject: Re: [PATCH v4 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Message-ID: <Y1fb9OAKTgUXC/w6@redhat.com>
References: <20220812133453.82671-1-imbrenda@linux.ibm.com>
 <c60fa9e2-b5c4-6765-da23-e6cc31746f53@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c60fa9e2-b5c4-6765-da23-e6cc31746f53@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 02:42:11PM +0200, Paolo Bonzini wrote:
> On 8/12/22 15:34, Claudio Imbrenda wrote:
> > This patch adds support for asynchronously tearing down a VM on Linux.
> > 
> > When qemu terminates, either naturally or because of a fatal signal,
> > the VM is torn down. If the VM is huge, it can take a considerable
> > amount of time for it to be cleaned up. In case of a protected VM, it
> > might take even longer than a non-protected VM (this is the case on
> > s390x, for example).
> > 
> > Some users might want to shut down a VM and restart it immediately,
> > without having to wait. This is especially true if management
> > infrastructure like libvirt is used.
> > 
> > This patch implements a simple trick on Linux to allow qemu to return
> > immediately, with the teardown of the VM being performed
> > asynchronously.
> > 
> > If the new commandline option -async-teardown is used, a new process is
> > spawned from qemu at startup, using the clone syscall, in such way that
> > it will share its address space with qemu.The new process will have the
> > name "cleanup/<QEMU_PID>". It will wait until qemu terminates
> > completely, and then it will exit itself.
> > 
> > This allows qemu to terminate quickly, without having to wait for the
> > whole address space to be torn down. The cleanup process will exit
> > after qemu, so it will be the last user of the address space, and
> > therefore it will take care of the actual teardown. The cleanup
> > process will share the same cgroups as qemu, so both memory usage and
> > cpu time will be accounted properly.
> > 
> > If possible, close_range will be used in the cleanup process to close
> > all open file descriptors. If it is not available or if it fails, /proc
> > will be used to determine which file descriptors to close.
> > 
> > If the cleanup process is forcefully killed with SIGKILL before the
> > main qemu process has terminated completely, the mechanism is defeated
> > and the teardown will not be asynchronous.
> > 
> > This feature can already be used with libvirt by adding the following
> > to the XML domain definition to pass the parameter to qemu directly:
> > 
> >    <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
> >    <arg value='-async-teardown'/>
> >    </commandline>
> > 
> > Signed-off-by: Claudio Imbrenda<imbrenda@linux.ibm.com>
> > Reviewed-by: Murilo Opsfelder Araujo<muriloo@linux.ibm.com>
> > Tested-by: Murilo Opsfelder Araujo<muriloo@linux.ibm.com>
> > ---
> 
> Nice trick indeed!
> 
> The only question I have is whether it would make sense to do this in
> Libvirt instead.

Hmm, interesting idea, that hadn't occurred to me.

Current flow is

  libvirtd -> fork -> fork -> execve(qemu)
                                 \-> clone(async handler)

Due to CLONE_VM, both main QEMU PID and async handler PID are sharing
the memory mappings of code being executed. Everything is fine.


If doing it in libvirt the flow would be

  libvirtd -> fork -> fork -> execve(qemu)
                        \-> clone(async handler)

In the latter case the async handler would be running code from
the libvirt binary. When the parent calls execve that will load
the code from QEMU, and because of CLONE_VM, this affect the
memory mappings in the async handler proces too. I think that
will end up quite explody, no ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


