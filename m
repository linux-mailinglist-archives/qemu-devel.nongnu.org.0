Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382205247E1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 10:28:48 +0200 (CEST)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np4Bj-0003Rt-AX
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 04:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np3yy-0001CV-Rg
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np3yt-0003kt-PY
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652343329;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0hPRLMc2ErNYW/vKtm79G/gK7PHjvaR2XhEwVjwJ+JA=;
 b=ZL+EhC6UIvVDx6yy475TeqawARuMpbxwlGx704RyOwTN/vqcOxvFGwWzn+NpJGXkkzew1G
 Os/43QCbxe9iaGCK37vVkdz76f79y6nUeZisPNTu4R/LqKqZVN1I3ra6kf6M9QIJnFJirL
 tX1Rk+XSLR92pqDZmHtnFwRREbaEpV4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-hSylL1pIN463hP70glpiMg-1; Thu, 12 May 2022 04:15:28 -0400
X-MC-Unique: hSylL1pIN463hP70glpiMg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 443A4101A52C
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E44141617B;
 Thu, 12 May 2022 08:15:26 +0000 (UTC)
Date: Thu, 12 May 2022 09:15:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <YnzCGh3psZgK8tUw@redhat.com>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
 <YnuDONrdbMcJT08p@redhat.com>
 <a11ca582-3d17-b064-6736-bd66ed5a5ec4@redhat.com>
 <YnuLe7cVlEYsw78o@redhat.com>
 <5374a249-8389-3d11-1b30-b0b6e6910a51@redhat.com>
 <YnvqYO8p/Z/7/DrO@redhat.com>
 <04938ba0-7ff4-df3c-348d-b679eac4fbac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04938ba0-7ff4-df3c-348d-b679eac4fbac@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Thu, May 12, 2022 at 09:41:29AM +0200, Paolo Bonzini wrote:
> On 5/11/22 18:54, Daniel P. Berrangé wrote:
> > On Wed, May 11, 2022 at 01:07:47PM +0200, Paolo Bonzini wrote:
> > > On 5/11/22 12:10, Daniel P. Berrangé wrote:
> > > > I expect creating/deleting I/O threads is cheap in comparison to
> > > > the work done for preallocation. If libvirt is using -preconfig
> > > > and object-add to create the memory backend, then we could have
> > > > option of creating the I/O threads dynamically in -preconfig mode,
> > > > create the memory backend, and then delete the I/O threads again.
> > > 
> > > I think this is very overengineered.  Michal's patch is doing the obvious
> > > thing and if it doesn't work that's because Libvirt is trying to micromanage
> > > QEMU.
> > 
> > Calling it micromanaging is putting a very negative connotation on
> > this. What we're trying todo is enforce a host resource policy for
> > QEMU, in a way that a compromised QEMU can't escape, which is a
> > valuable protection.
> 
> I'm sorry if that was a bit exaggerated, but the negative connotation was
> intentional.
> 
> > > As mentioned on IRC, if the reason is to prevent moving around threads in
> > > realtime (SCHED_FIFO, SCHED_RR) classes, that should be fixed at the kernel
> > > level.
> > 
> > We use cgroups where it is available to us, but we don't always have
> > the freedom that we'd like.
> 
> I understand.  I'm thinking of a new flag to sched_setscheduler that fixes
> the CPU affinity and policy of the thread and prevents changing it in case
> QEMU is compromised later.  The seccomp/SELinux sandboxes can prevent
> setting the SCHED_FIFO class without this flag.
> 
> In addition, my hunch is that this works only because the RT setup of QEMU
> is not safe against priority inversion.  IIRC the iothreads are set with a
> non-realtime priority, but actually they should have a _higher_ priority
> than the CPU threads, and the thread pool I/O bound workers should have an
> even higher priority; otherwise you have a priority inversion situation
> where an interrupt is pending that would wake up the CPU, but the iothreads
> cannot process it because they have a lower priority than the CPU.

At least for RHEL deployments of KVM-RT, IIC the expectation is that
the VCPUs with RT priority never do I/O, and that there is at least 1
additional non-RT vCPU from which the OS performs I/O. IOW, the RT
VCPU works in a completely self contained manner with no interaction
to any other QEMU threads. If that's not the case, then you would
have to make sure those other threads have priority / schedular
adjustments to avoid priority inversion

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


