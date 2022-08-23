Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4274159E8AB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 19:13:47 +0200 (CEST)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQXTF-0006PQ-TZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 13:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQXPQ-0002B8-8y
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 13:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQXPN-0000gq-5x
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 13:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661274583;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OACk1+YvVtXtSMWo3Wg0+JybYjcr8PJiRyDjuq+qks=;
 b=BhN8Nysx0B5PUfDaoJUXyDHUnbpSFHKg2L9A0wrKwdINJLt3DCgM6sj3d6VgltSG0kw3sL
 wdl0+rE4HCI1US9XDJcfsaqRz71eXHpFjmKbXR6gi963cpJDQbvTkGy5sSzBb18KhZTSwb
 UCZ4QStMfPy93rSMWcmLc3i0wnKeGwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-_rkI8IrbMniUsZIpfKXoKA-1; Tue, 23 Aug 2022 13:09:40 -0400
X-MC-Unique: _rkI8IrbMniUsZIpfKXoKA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B845318188A1;
 Tue, 23 Aug 2022 17:09:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7FA5492CA4;
 Tue, 23 Aug 2022 17:09:37 +0000 (UTC)
Date: Tue, 23 Aug 2022 18:09:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Murilo Opsfelder =?utf-8?Q?Ara=C3=BAjo?= <muriloo@linux.ibm.com>,
 pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Message-ID: <YwUJz0ldXjcPdmDF@redhat.com>
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
 <YvT1wC0vi2juO5n3@redhat.com> <20220811155623.25f0d4b4@p-imbrenda>
 <YvUL2+Y6td7Ak0N/@redhat.com>
 <42b6bfa1-1983-b065-6b0d-9b5d89465f9b@linux.ibm.com>
 <20220812092623.19058f32@p-imbrenda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220812092623.19058f32@p-imbrenda>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Aug 12, 2022 at 09:26:23AM +0200, Claudio Imbrenda wrote:
> On Thu, 11 Aug 2022 23:05:52 -0300
> Murilo Opsfelder Araújo <muriloo@linux.ibm.com> wrote:
> 
> > On 8/11/22 11:02, Daniel P. Berrangé wrote:
> > [...]
> > >>> Hmm, I was hoping you could just use SIGKILL to guarantee that this
> > >>> gets killed off.  Is SIGKILL delivered too soon to allow for the
> > >>> main QEMU process to have exited quickly ?  
> > >>
> > >> yes, I tried. qemu has not finished exiting when the signal is
> > >> delivered, the cleanup process dies before qemu, which defeats the
> > >> purpose  
> > >
> > > Ok, too bad.
> > >  
> > >>> If so I wonder what happens when systemd just delivers SIGKILL to
> > >>> all processes in the cgroup - I'm not sure there's a guarantee it
> > >>> will SIGKILL the main qemu before it SIGKILLs this helper  
> > >>
> > >> I'm afraid in that case there is no guarantee.
> > >>
> > >> for what it's worth, both virsh shutdown and destroy seem to do things
> > >> properly.  
> > >
> > > Hmm, probably because libvirt tells QEMU to exit before systemd comes
> > > along and tells everything in the cgroup to die with SIGKILL.  
> > 
> > It seems Libvirt sends SIGKILL if qemu process doesn't terminate within 10
> > seconds after Libvirt sent SIGTERM:
> > 
> > https://gitlab.com/libvirt/libvirt/-/blob/0615df084ec9996b5df88d6a1b59c557e22f3a12/src/util/virprocess.c#L375
> 
> but this is fine.
> 
> with asynchronous teardown, qemu will exit almost immediately when
> receiving SIGTERM, and the cleanup process will start cleaning up.

Note, when you have PCI host devices attahced it can take a very
long time for QEMU to exit. For this reason, the 10 second wait
before switching to SIGKILL is extended by 2 seconds for each
attachec PCI hostdev.

I think the main time we will have problems is where there are
storage failures that cause QEMU to get stuck in an uninterruptible
sleep in kernel space.  The classic example of this is an NFS server
that goes away, QEMU will get stuck waiting for the NFS server to
come back to life and be unkillable in this time even with SIGKILL.

That said, this call to virProcessKillPainfully shouldn't impact
the cleanmup process, becaused the SIGTERM/KILL are both directed
to the QEMU PID alone, not the process group.

The cleanup process should only get any signal later once libvirt
has finished sending SIGTERM/KILL, it then asks systemd to cleanup
the cgroups and at that time systemd can send SIGKILL to the
cleanup process. So in fact I think we should be fine in all
respects, except for the unkillable sleeps in kernel space.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


