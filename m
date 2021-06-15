Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081363A893C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 21:07:35 +0200 (CEST)
Received: from localhost ([::1]:47730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltEPN-0004Jy-KM
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 15:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ltENw-0003c8-Dz
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ltENs-0005gY-Ep
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623783958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arjqkf+tJSdTkEiup9XZ1HpDutKDzj0FN3SB0wt47qE=;
 b=jLJxN+yiLhViTsBqwAfFhZ+xmg6ESbgRCTMXTgWl6Mw26q58p6PNgrKTXiXe8u1zzJEZG3
 OkiKjj5tMyF44Wqu2JaYH19wIGu8r8g0BAxN6BI4DrbgtHBMjZtSw3M0W0E0sSD008mvkj
 wISXFbwIiyc82lvDOfRQJwFWpR5leHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Cmbx1_7QO3CAtKTlbRB6AA-1; Tue, 15 Jun 2021 15:05:57 -0400
X-MC-Unique: Cmbx1_7QO3CAtKTlbRB6AA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553D31084F42;
 Tue, 15 Jun 2021 19:05:55 +0000 (UTC)
Received: from work-vm (ovpn-112-179.ams2.redhat.com [10.36.112.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C60F05C1C2;
 Tue, 15 Jun 2021 19:05:31 +0000 (UTC)
Date: Tue, 15 Jun 2021 20:05:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update [restart] : exec
Message-ID: <YMj5+MLAtOncJuKS@work-vm>
References: <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
 <YKZgZELudL9HobEe@work-vm>
 <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com>
 <YKuCbujlfOCEYUP3@work-vm>
 <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com>
 <YLkvShM1MMLh6NpG@work-vm> <YLk/MoR2Wa20/gU/@redhat.com>
 <b8d0689d-7a54-de55-7cac-695812265d9f@oracle.com>
MIME-Version: 1.0
In-Reply-To: <b8d0689d-7a54-de55-7cac-695812265d9f@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steven Sistare (steven.sistare@oracle.com) wrote:
> On 6/3/2021 4:44 PM, Daniel P. Berrangé wrote:
> > On Thu, Jun 03, 2021 at 08:36:42PM +0100, Dr. David Alan Gilbert wrote:
> >> * Steven Sistare (steven.sistare@oracle.com) wrote:
> >>> On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
> >>>> * Steven Sistare (steven.sistare@oracle.com) wrote:
> >>>>> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
> >>>>>> On the 'restart' branch of questions; can you explain,
> >>>>>> other than the passing of the fd's, why the outgoing side of
> >>>>>> qemu's 'migrate exec:' doesn't work for you?
> >>>>>
> >>>>> I'm not sure what I should describe.  Can you be more specific?
> >>>>> Do you mean: can we add the cpr specific bits to the migrate exec code?
> >>>>
> >>>> Yes; if possible I'd prefer to just keep the one exec mechanism.
> >>>> It has an advantage of letting you specify the new command line; that
> >>>> avoids the problems I'd pointed out with needing to change the command
> >>>> line if a hotplug had happened.  It also means we only need one chunk of
> >>>> exec code.
> >>>
> >>> How/where would you specify a new command line?  Are you picturing the usual migration
> >>> setup where you start a second qemu with its own arguments, plus a migrate_incoming
> >>> option or command?  That does not work for live update restart; the old qemu must exec
> >>> the new qemu.  Or something else?
> >>
> >> The existing migration path allows an exec - originally intended to exec
> >> something like a compressor or a store to file rather than a real
> >> migration; i.e. you can do:
> >>
> >>   migrate "exec:gzip > mig"
> >>
> >> and that will save the migration stream to a compressed file called mig.
> >> Now, I *think* we can already do:
> >>
> >>   migrate "exec:path-to-qemu command line parameters -incoming 'hmmmmm'"
> >> (That's probably cleaner via the QMP interface).
> >>
> >> I'm not quite sure what I want in the incoming there, but that is
> >> already the source execing the destination qemu - although I think we'd
> >> probably need to check if that's actually via an intermediary.
> > 
> > I don't think you can dirctly exec  qemu in that way, because the
> > source QEMU migration code is going to wait for completion of the
> > QEMU you exec'd and that'll never come on success. So you'll end
> > up with both QEMU's running forever. If you pass the daemonize
> > option to the new QEMU then it will immediately detach itself,
> > and the source QEMU will think the migration command has finished
> > or failed.
> > 
> > I think you can probably do it if you use a wrapper script though.
> > The wrapper would have to fork QEMU in the backend, and then the
> > wrapper would have to monitor the new QEMU to see when the incoming
> > migration has finished/aborted, at which point the wrapper can
> > exit, so the source QEMU sees a successful cleanup of the exec'd
> > command. </hand waving>
> 
> cpr restart does not work for any scheme that involves the old qemu process co-existing with
> the new qemu process.  To preserve descriptors and anonymous memory, cpr restart requires 
> that old qemu directly execs new qemu.  Not fork-exec.  Same pid.
> 
> So responding to Dave's comment, "keep the one exec mechanism", that is not possible.
> We still need the qemu_exec_requested mechanism to cause a direct exec after state is
> saved.

OK, note if you can find anyway to make kernel changes to avoid this
kexec, life is going to get *much* better; starting a separate qemu at
the management layer would be so much easier.

> >>> We could shoehorn cpr restart into the migrate exec path by defining a new migration 
> >>> capability that the client would set before issuing the migrate command.  However, the
> >>> implementation code would be sprinkled with conditionals to suppress migrate-only bits
> >>> and call cpr-only bits.  IMO that would be less maintainable than having a separate
> >>> cprsave function.  Currently cprsave does not duplicate any migration functionality.
> >>> cprsave calls qemu_save_device_state() which is used by xen.
> >>
> >> To me it feels like cprsave in particular is replicating more code.
> >>
> >> It's also jumping through hoops in places to avoid changing the
> >> commandline;  that's going to cause more pain for a lot of people - not
> >> just because it's hacks all over for that, but because a lot of people
> >> are actually going to need to change the commandline even in a cpr like
> >> case (e.g. due to hotplug or changing something else about the
> >> environment, like auth data or route to storage or networking that
> >> changed).
> > 
> > Management apps that already support migration, will almost certainly
> > know how to start up a new QEMU with a different command line that
> > takes account of hotplugged/unplugged devices. IOW avoiding changing
> > the command line only really addresses the simple case, and the hard
> > case is likely already solved for purposes of handling regular live
> > migration. 
> 
> Agreed, with the caveat that for cpr, the management app must communicate the new arguments
> to the qemu-exec trampoline, rather than passing the args on the command line to a new 
> qemu process.
> 
> >> There are hooks for early parameter parsing, so if we need to add extra
> >> commandline args we can; but for example the case of QEMU_START_FREEZE
> >> to add -S just isn't needed as soon as you let go of the idea of needing
> >> an identical commandline.
> 
> I'll delete QEMU_START_FREEZE.  
> 
> I still need to preserve argv_main and pass it to the qemu-exec trampoline, though, as 
> the args contain identifying information that the management app needs to modify the 
> arguments based the the instances's hot plug history.
> 
> Or, here is another possibility.  We could redefine cprsave to leave the VM in a
> stopped state, and add a cprstart command to be called subsequently that performs 
> the exec.  It takes a single string argument: a command plus arguments to exec.  
> The command may be qemu or a trampoline like qemu-exec.  I like that the trampoline
> name is no longer hardcoded.  The management app can derive new qemu args for the
> instances as it would with migration, and pass them to the command, instead of passing
> them to qemu-exec via some side channel.  cprload finishes the job and does not change.
> I already like this scheme better.

Right, that's sounding better; now the other benefit you get is you
don't need to play with environment variables; you can define a command
line option that takes all the extra data it needs.

Dave

> - Steve
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


