Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6811939ABF0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 22:46:29 +0200 (CEST)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1louEV-0003dH-OS
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 16:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1louD6-0002rT-FP
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:45:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1louD3-0003CF-Jk
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622753096;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=94rcF0LBindzcq9vsfSCicnbMqTAXL7V6eU+BfmEQ30=;
 b=BQE0JE7Sb6c+ZN4fMRdlUIkVMh/lZ1SdMj49TISczWPafeXSszUyjTDph86c+/hEfrDs+F
 4SvY0RfYdF5f4z5ntPbThFCsfpBuSOHKMq/3G29gQTrUI3H3QAx+b+9hINn6RHtucYl2hh
 bJmUSl2UXt2WsaNlT1c1ZGtnLurk2x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-pnva9GtPNJKmSbDWzaEXew-1; Thu, 03 Jun 2021 16:44:54 -0400
X-MC-Unique: pnva9GtPNJKmSbDWzaEXew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B53D5101371F;
 Thu,  3 Jun 2021 20:44:53 +0000 (UTC)
Received: from redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82CCE5D6AB;
 Thu,  3 Jun 2021 20:44:37 +0000 (UTC)
Date: Thu, 3 Jun 2021 21:44:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH V3 00/22] Live Update [restart]
Message-ID: <YLk/MoR2Wa20/gU/@redhat.com>
References: <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
 <YKZgZELudL9HobEe@work-vm>
 <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com>
 <YKuCbujlfOCEYUP3@work-vm>
 <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com>
 <YLkvShM1MMLh6NpG@work-vm>
MIME-Version: 1.0
In-Reply-To: <YLkvShM1MMLh6NpG@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steven Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 08:36:42PM +0100, Dr. David Alan Gilbert wrote:
> * Steven Sistare (steven.sistare@oracle.com) wrote:
> > On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
> > > * Steven Sistare (steven.sistare@oracle.com) wrote:
> > >> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
> > >>> On the 'restart' branch of questions; can you explain,
> > >>> other than the passing of the fd's, why the outgoing side of
> > >>> qemu's 'migrate exec:' doesn't work for you?
> > >>
> > >> I'm not sure what I should describe.  Can you be more specific?
> > >> Do you mean: can we add the cpr specific bits to the migrate exec code?
> > > 
> > > Yes; if possible I'd prefer to just keep the one exec mechanism.
> > > It has an advantage of letting you specify the new command line; that
> > > avoids the problems I'd pointed out with needing to change the command
> > > line if a hotplug had happened.  It also means we only need one chunk of
> > > exec code.
> > 
> > How/where would you specify a new command line?  Are you picturing the usual migration
> > setup where you start a second qemu with its own arguments, plus a migrate_incoming
> > option or command?  That does not work for live update restart; the old qemu must exec
> > the new qemu.  Or something else?
> 
> The existing migration path allows an exec - originally intended to exec
> something like a compressor or a store to file rather than a real
> migration; i.e. you can do:
> 
>   migrate "exec:gzip > mig"
> 
> and that will save the migration stream to a compressed file called mig.
> Now, I *think* we can already do:
> 
>   migrate "exec:path-to-qemu command line parameters -incoming 'hmmmmm'"
> (That's probably cleaner via the QMP interface).
> 
> I'm not quite sure what I want in the incoming there, but that is
> already the source execing the destination qemu - although I think we'd
> probably need to check if that's actually via an intermediary.

I don't think you can dirctly exec  qemu in that way, because the
source QEMU migration code is going to wait for completion of the
QEMU you exec'd and that'll never come on success. So you'll end
up with both QEMU's running forever. If you pass the daemonize
option to the new QEMU then it will immediately detach itself,
and the source QEMU will think the migration command has finished
or failed.

I think you can probably do it if you use a wrapper script though.
The wrapper would have to fork QEMU in the backend, and then the
wrapper would have to monitor the new QEMU to see when the incoming
migration has finished/aborted, at which point the wrapper can
exit, so the source QEMU sees a successful cleanup of the exec'd
command. </hand waving>

> > We could shoehorn cpr restart into the migrate exec path by defining a new migration 
> > capability that the client would set before issuing the migrate command.  However, the
> > implementation code would be sprinkled with conditionals to suppress migrate-only bits
> > and call cpr-only bits.  IMO that would be less maintainable than having a separate
> > cprsave function.  Currently cprsave does not duplicate any migration functionality.
> > cprsave calls qemu_save_device_state() which is used by xen.
> 
> To me it feels like cprsave in particular is replicating more code.
> 
> It's also jumping through hoops in places to avoid changing the
> commandline;  that's going to cause more pain for a lot of people - not
> just because it's hacks all over for that, but because a lot of people
> are actually going to need to change the commandline even in a cpr like
> case (e.g. due to hotplug or changing something else about the
> environment, like auth data or route to storage or networking that
> changed).

Management apps that already support migration, will almost certainly
know how to start up a new QEMU with a different command line that
takes account of hotplugged/unplugged devices. IOW avoiding changing
the command line only really addresses the simple case, and the hard
case is likely already solved for purposes of handling regular live
migration.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


