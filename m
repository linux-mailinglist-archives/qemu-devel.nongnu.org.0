Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762EE443F74
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 10:33:14 +0100 (CET)
Received: from localhost ([::1]:49022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miCdt-00051V-LL
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 05:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miCYS-0002oU-4L
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miCYO-0002f3-Jz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 05:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635931652;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B3sPZQ5tVplpsbRk34AlP1qqKN6NEzo5etkDmTQGvxk=;
 b=ZgWiRHVj/WYHdSj2vcD5G/s22q4imTDfJdGuNJrS2cJWt3qxX40TquFti+lCD5qyZpapMs
 gMPPgfwZxC9IgkRqMPFGa2LYd/5/2tXy/D5nn3Yj7sy1VkwwYGL2Wn6XPCSbFZ6gNIUqqa
 pbcBHkYFBXYSYUyatwOwpgS51fsJx4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-OJo5C4WYPjGjsEsZZdCbbA-1; Wed, 03 Nov 2021 05:27:21 -0400
X-MC-Unique: OJo5C4WYPjGjsEsZZdCbbA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99E64362F9
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 09:27:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4946A19733;
 Wed,  3 Nov 2021 09:27:13 +0000 (UTC)
Date: Wed, 3 Nov 2021 09:27:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qmp: Stabilize preconfig
Message-ID: <YYJV3ZIA7kNaqORB@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87zgqlzmxi.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 09:02:49AM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Nov 01, 2021 at 03:37:58PM +0100, Michal Prívozník wrote:
> >> On 10/25/21 2:19 PM, Markus Armbruster wrote:
> >> > Michal Privoznik <mprivozn@redhat.com> writes:
> >> > 
> >> >> The -preconfig option and exit-preconfig command are around for
> >> >> quite some time now. However, they are still marked as unstable.
> >> >> This is suboptimal because it may block some upper layer in
> >> >> consuming it. In this specific case - Libvirt avoids using
> >> >> experimental features.
> >> >>
> >> >> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> >> > 
> >> > If I remember correctly, the motivation for -preconfig was NUMA
> >> > configuration via QMP.  More uses may have appeared since.
> >> > 
> >> > Back then, I questioned the need for yet another option and yet another
> >> > state: why not -S?
> >> > 
> >> > The answer boiled down to
> >> > 
> >> > 0. Yes, having just one would be a simpler and cleaner interface, but
> >> > 
> >> > 1. the godawful mess QEMU startup has become makes -S unsuitable for
> >> >    some things we want to do, so we need -preconfig,
> >> > 
> >> > 2. which is in turn unsuitable for other things we want to do, so we
> >> >    still need -S".
> >> > 
> >> > 3. Cleaning up the mess to the point where "simpler and cleaner" becomes
> >> >    viable again is not in the cards right now.
> >> 
> >> I see a difference between the two. -preconfig starts QEMU in such a way
> >> that its configuration can still be changed (in my particular use case
> >> vCPUs can be assigned to NUMA nodes), while -S does not allow that. If
> >> we had one state for both, then some commands must be forbidden from
> >> executing as soon as 'cont' is issued. Moreover, those commands would
> >> need to do much more than they are doing now (e.g. regenerate ACPI table
> >> after each run). Subsequently, validating configuration would need to be
> >> postponed until the first 'cont' because with just one state QEMU can't
> >> know when the last config command was issued.
> 
> Doesn't all this apply to x-exit-preconfig already?
> 
> * Some commands are only allowed before x-exit-preconfig,
>   e.g. set-numa-node.
> 
> * The complete (pre-)configuration is only available at
>   x-exit-preconfig.  In particular, ACPI tables can be fixed only then.
> 
> >> Having said all of that, I'm not sure if -preconfig is the way to go or
> >> we want to go the other way. I don't have a strong opinion.
> >
> > It feels like the scenario here is really just a specialization of the
> > more general problem we want to be able to solve. Namely, we want to be
> > able to start a bare QEMU and configure it entirely on the fly. IOW, we
> > are really targetting for -preconfig to be able to do /all/ configuration,
> > and with a new ELF binary, at which point -preconfig wouldn't exist, it
> > would be the implicit default.
> 
> Whether -preconfig is the default or an option doesn't matter for
> discussing the state machine.
> 
> > Libvirt primarily uses -S because it needs to query various aspects of
> > QEMU's config before CPUs start executing, while QEMU can still be
> > considered trustworthy (as it hasn't executed untrusted guest code 
> > yet). eg we query vCPU PIDs so that we can apply CPU pinning to them. 
> > We query the CPU model features so we can reflect what exact CPU 
> > features we got from KVM. There are various other examples.
> 
> Which of the queries you need work only between x-exit-preconfig and -S?

Well before x-exit-preconfig, QMP only permits a very small number
of commands - QEMU has loosened that up a bit, but I don't think anyone
has checked whether there's enough to cover libvirt's current usage yet.

> Which of them could be made to work before x-exit-preconfig?

Quite a few i expect.


> > The secondary reason we use -S is that sometimes the mgmt app does
> > not actually want the guest CPUs to start running - they actively
> > want it in a paused state initially and will manually start CPUs
> > later. One reason is to enable them to open the serial console
> > backend before CPUs start, to guarantee that no console output is
> > lost in that small startup window.  This is really the original
> > purpose of -S.  This doesn't imply a need for -S. I'd say that
> > -preconfig should essentially imply -S by default. If you're
> > already doing lots of things via QMP, being required to issue
> > a 'cont' command is no hardship.
> 
> I wonder whether we really have to step through three states
> 
>          x-exit-preconfig  cont
>     preconfig ---> pre run ---> run
> 
> and not two
> 
>             cont
>     pre run ---> run

Looking at it from POV of configuration we have two states, with
a unidirectional transition permitted

  unconfigured   --->  configured

Then from the POV of guest CPUs we have two states, with a
bi-directional transition permitted.

   stopped   <----->  running


During QEMU start process we have two end goals we need to satisfy

 *  configured + running (the 95+% common case)
 *  configured + stopped (the rarer case)


So in terms of QEMU internal state transitions it feels like we do
likely need to distinguish pre-config separately from stopped, but
from a CLI arg POV I think it is redundant to distinguish them as
"stopped" can be reasonably implied as a default

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


