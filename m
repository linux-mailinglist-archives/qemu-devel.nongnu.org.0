Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB86683749
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:08:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMwub-00047K-2E; Tue, 31 Jan 2023 15:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMwuY-00047A-Ig
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:07:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMwuW-0000Tw-N3
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675195639;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avpGgQqoFQa4fiTgGq9B54qpFQLPpkLC4uu6Dixp8Ow=;
 b=BaUGKZP1kWGxmfv/t44/6ctK0fcrXVyoV01Mh2k/CBo8hnUxFd/RwvavA5Y5swGiR58MIk
 iLEbDF2VjBAJBX/fGfJIMErFNSKRmP89PAZ6mDsKL57OW2na/yERgRKsr1uefnNFdyCnJ0
 l4FA/gajkSSX7szNwQLr/xFM8p3kPIs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288--c2-KVkkO9Sl4Wqw7VvLXw-1; Tue, 31 Jan 2023 15:07:15 -0500
X-MC-Unique: -c2-KVkkO9Sl4Wqw7VvLXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B295C29AB3F4
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:07:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCFDA2026D4B;
 Tue, 31 Jan 2023 20:07:08 +0000 (UTC)
Date: Tue, 31 Jan 2023 20:06:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 0/3] util/userfaultfd: Support /dev/userfaultfd
Message-ID: <Y9l0328Sp3HJ948a@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
 <0f8ad497-202d-ae55-e468-77bb726a2699@redhat.com>
 <Y9KK72k8dZU7Ccau@work-vm> <Y9KbUaMo8DaH0YKv@x1n>
 <Y9KjZeu9t37XyZ3q@redhat.com> <Y9K31a04dTChnaOV@x1n>
 <Y9lwphMDs+Q3aVMr@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9lwphMDs+Q3aVMr@x1n>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 31, 2023 at 02:48:54PM -0500, Peter Xu wrote:
> On Thu, Jan 26, 2023 at 12:26:45PM -0500, Peter Xu wrote:
> > On Thu, Jan 26, 2023 at 03:59:33PM +0000, Daniel P. Berrangé wrote:
> > > On Thu, Jan 26, 2023 at 10:25:05AM -0500, Peter Xu wrote:
> > > > On Thu, Jan 26, 2023 at 02:15:11PM +0000, Dr. David Alan Gilbert wrote:
> > > > > * Michal Prívozník (mprivozn@redhat.com) wrote:
> > > > > > On 1/25/23 23:40, Peter Xu wrote:
> > > > > > > The new /dev/userfaultfd handle is superior to the system call with a
> > > > > > > better permission control and also works for a restricted seccomp
> > > > > > > environment.
> > > > > > > 
> > > > > > > The new device was only introduced in v6.1 so we need a header update.
> > > > > > > 
> > > > > > > Please have a look, thanks.
> > > > > > 
> > > > > > I was wondering whether it would make sense/be possible for mgmt app
> > > > > > (libvirt) to pass FD for /dev/userfaultfd instead of QEMU opening it
> > > > > > itself. But looking into the code, libvirt would need to do that when
> > > > > > spawning QEMU because that's when QEMU itself initializes internal state
> > > > > > and queries userfaultfd caps.
> > > > > 
> > > > > You also have to be careful about what the userfaultfd semantics are; I
> > > > > can't remember them - but if you open it in one process and pass it to
> > > > > another process, which processes address space are you trying to
> > > > > monitor?
> > > > 
> > > > Yes it's a problem.  The kernel always fetches the current mm_struct* which
> > > > represents the current context of virtual address space when creating the
> > > > uffd handle (for either the syscall or the ioctl() approach).
> > > 
> > > At what point does the process address space get associated ? When
> > > the /dev/userfaultfd is opened, or only when ioctl(USERFAULTFD_IOC_NEW)
> > > is called ?  If it is the former, then we have no choice, QEMU must open
> > > it. if it is the latter, then libvirt can open /dev/userfaultfd, pass
> > > it to QEMU which can then do the ioctl(USERFAULTFD_IOC_NEW).
> > 
> > Good point.. It should be the latter, so should be doable.
> > 
> > What should be the best interface for QEMU to detect the fd passing over to
> > it?  IIUC qemu_open() requires the name to be /dev/fdset/*, but there's no
> > existing cmdline that QEMU can know which fd number to fetch from fdset to
> > be used as the /dev/userfaultfd descriptor.
> > 
> > monitor_get_fd() seems more proper, where we can define an unique string so
> > Libvirt can preset the descriptor with the same string attached to it, then
> > I can opt-in monitor_get_fd() before trying to open() or doing the syscall.
> 
> Daniel/Michal, any input here from Libvirt side?
> 
> I just noticed that monitor_get_fd() is bound to a specific monitor, then
> it seems not clear which one is from Libvirt.  If to use qemu_open() and
> add-fd I think we need another QEMU cmdline to set the fd path, iiuc.
> 
> I can also leave that for later if opening /dev/userfaultfd is already
> resolving the immediate problem in containers.

I don't have any great ideas really. If we assume the /dev/userfaultfd
is accessible to QEMU we can ignore it.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


