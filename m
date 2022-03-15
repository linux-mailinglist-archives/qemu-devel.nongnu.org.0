Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C94D9A00
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 12:08:16 +0100 (CET)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU52F-0002PY-BT
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 07:08:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU50E-0000rK-BQ
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nU507-0005Jk-PF
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 07:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647342361;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X1dpqV1ZsBxGN1qkghuGPdGe3qVIXtKlbZE6Mc0vkPw=;
 b=M4a995biRKMfK+BT+Qa5oBDQE1257f2oXuG8TzidASFGV0DoeT9GJKr6hkaAEOt3838/Vo
 xyg0p3AS0JUTjDVaS51GiZS/pcZ+HKtd0bmjGdR3Fnhe1MuUSv/8WBTqybCZYt4+CzAAM8
 weCW4GdI7Y6aTT4E1IMQ4NCS/mv4aaU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-cu-ZvjdlNHqwsWpPWPp9LQ-1; Tue, 15 Mar 2022 07:05:56 -0400
X-MC-Unique: cu-ZvjdlNHqwsWpPWPp9LQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0781E38025E4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:05:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F46B7D2BA8;
 Tue, 15 Mar 2022 11:05:54 +0000 (UTC)
Date: Tue, 15 Mar 2022 11:05:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: Time to introduce a migration protocol negotiation (Re: [PATCH
 v2 00/25] migration: Postcopy Preemption)
Message-ID: <YjBzD4V3iG4EMjTU@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
 <Yh3mo5VFQ3gT1Gd7@redhat.com> <Yh3yzbmOqAVV9iM9@xz-m1.local>
 <Yh30/nPtWyvqp8xo@redhat.com> <Yh37hLn5Dlffm13P@xz-m1.local>
 <Yh5O/eq4If4MYpTq@work-vm> <Yi+ONfiZlQD2LoHX@redhat.com>
 <YjBt4XqD1bg/JJx1@work-vm>
MIME-Version: 1.0
In-Reply-To: <YjBt4XqD1bg/JJx1@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 10:43:45AM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > Almost every time we add a new feature to migration, we end up
> > having to define at least one new migration parameter, then wire
> > it up in libvirt, and then the mgmt app too, often needing to
> > ensure it is turn on for both client and server at the same time.
> > 
> > 
> > For some features, requiring an explicit opt-in could make sense,
> > because we don't know for sure that the feature is always a benefit.
> > These are things that can be thought of as workload sensitive
> > tunables.
> > 
> > 
> > For other features though, it feels like we would be better off if
> > we could turn it on by default with no config. These are things
> > that can be thought of as migration infrastructre / transport
> > architectural designs.
> > 
> > 
> > eg it would be nice to be able to use multifd by default for
> > migration. We would still want a tunable to control the number
> > of channels, but we ought to be able to just start with a default
> > number of channels automatically, so the tunable is only needed
> > for special cases.
> 
> Right, I agree in part - but we do need those tunables to exist; we rely
> on being able to turn things on or off, or play with the tunables
> to debug and get performance.  We need libvirt to enumerate the tunables
> from qemu rather than having to add code to libvirt every time.
> They're all in QAPI definitions anyway - libvirt really shouldn't be
> adding code each time.   Then we could have a  virsh migrate --tunable
> rather than having loads of extra options which all have different names
> from qemu's name for the same feature.

Provided tunables are strictl just tunables, that would be viable.
Right now our tunables are a mixture of tunables and low level
data transport architectural knobs.

> > This post-copy is another case.  We should start off knowing
> > we can switch to post-copy at any time. We should further be
> > able to add pre-emption if we find it available. IOW, we should
> > not have required anything more than 'switch to post-copy' to
> > be exposed to mgmtm apps.
> 
> Some of these things are tricky; for example knowing whether or not you
> can do postcopy depends on your exact memory configuration; some of that
> is tricky to probe.

I'm just refering to the postcopy capability that we nneed to
set upfront before starting the migration on both sides.  IIUC
that should be possible for QEMU to automatically figure out,
if it could negotiate with dst QEMU.

Whether we ever switch from precopy to postcopy mode once
running can remain under mgmt app control.

> > Or enabling zero copy on either send or receive side.
> > 
> > Or enabling kernel-TLS offload
> 
> Will kernel-TLS be something you'd want to automatically turn on?
> We don't know yet whether it's a good idea if you don't have hardware
> support.

I'm pretty sure kTLS will always be a benefit, because even without
hardware offload you still benefit from getting the TLS encryption
onto a separate CPU core from QEMU's migration thread. We've measured
this already with NBD and I've no reason to suspect it will differ
for migration. 


> > Now define a protocol handshake. A 5 minute thought experiment
> > starts off with something simple:
> > 
> >    dst -> src:  Greeting Message:
> >                   Magic: "QEMU-MIGRATE"  12 bytes
> >                   Num Versions: 1 byte
> >                   Version list: 1 byte * num versions
> >                   Num features: 4 bytes
> >                   Feature list: string * num features
> > 
> >    src -> dst:  Greeting Reply:
> >                   Magic: "QEMU-MIGRATE" 12 bytes
> >                   Select version: 1 byte
> >                   Num select features: 4 bytes
> >                   Selected features: string * num features   
> > 
> >    .... possibly more src <-> dst messages depending on
> >         features negotiated....
> > 
> >    src -> dst:  start migration
> >  
> >     ...traditional migration stream runs now for the remainder
> >        of this connection ...
> 
> Don't worry about designing the bytes; we already have a command
> structure; we just need to add a MIG_CMD_FEATURES and a 
> MIG_RP_MSG_FEATURES
> (I'm not sure what we need to do for RDMA; or what we do for exec: or
> savevm)

For RDMA there are two options

 - Drop RDMA support (preferred ;-)

 - Use a regular TCP channel for the migration protocol
   handshake todo all the feature negotiation.  Open a
   second channel using RDMA just for the migration payload

Before considering "exec", lets think about "fd" as that's more
critical.

How can be get an arbitrary number of bi-directional channels
open when the user is passing in pre-opened FDs individual and
does not know upfront how many QEMU wants ?

We could have an event that QEMU emits whenever it wants to be
given a new "fd" channel. The mgmt app would watch for that and
pass in more pre-opened FDs in response. Not too difficult

Back to "exec" we have two options

 - Drop exec support, and just let the user spawn the
   program externally and pass in a pre-opened socket
   FDs for talking to it

 - Keep exec and make it use a socketpair instead of
   pipe FDs. Connect the socketpair to both stdin+stdout.
   Exec the program many times if needing many channels.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


