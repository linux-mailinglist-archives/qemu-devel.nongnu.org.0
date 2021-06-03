Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1DF39AB02
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 21:38:04 +0200 (CEST)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lotAI-0007xl-Tv
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 15:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lot9T-0007Hj-W3
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:37:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lot9R-0007xE-G7
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622749028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t2QcYsDgqTYIg9n72+RiaujyqYZClfuLtY1VpUESuvw=;
 b=cXIi5m+QU+YPDYPmeO+9tOQ/iyqWZNfqb8aBvlEc3dUKWSlX19ZDHIQ1++aG7+b9jbGiNN
 e5mwM+8Shm+mdogrPz7OfRkbiN+9MLpDT/f9qxKtdEwS3vOK07CIakPnHMqHWBbR33ffY/
 O6dJd66c91KX8LrE8njH6qEe1udm3Lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-qacKAtX2OlOzcvSogQNaMA-1; Thu, 03 Jun 2021 15:37:01 -0400
X-MC-Unique: qacKAtX2OlOzcvSogQNaMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35949803F50;
 Thu,  3 Jun 2021 19:37:00 +0000 (UTC)
Received: from work-vm (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2088460622;
 Thu,  3 Jun 2021 19:36:44 +0000 (UTC)
Date: Thu, 3 Jun 2021 20:36:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 00/22] Live Update [restart]
Message-ID: <YLkvShM1MMLh6NpG@work-vm>
References: <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
 <YKZgZELudL9HobEe@work-vm>
 <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com>
 <YKuCbujlfOCEYUP3@work-vm>
 <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com>
MIME-Version: 1.0
In-Reply-To: <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steven Sistare (steven.sistare@oracle.com) wrote:
> On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
> > * Steven Sistare (steven.sistare@oracle.com) wrote:
> >> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
> >>> On the 'restart' branch of questions; can you explain,
> >>> other than the passing of the fd's, why the outgoing side of
> >>> qemu's 'migrate exec:' doesn't work for you?
> >>
> >> I'm not sure what I should describe.  Can you be more specific?
> >> Do you mean: can we add the cpr specific bits to the migrate exec code?
> > 
> > Yes; if possible I'd prefer to just keep the one exec mechanism.
> > It has an advantage of letting you specify the new command line; that
> > avoids the problems I'd pointed out with needing to change the command
> > line if a hotplug had happened.  It also means we only need one chunk of
> > exec code.
> 
> How/where would you specify a new command line?  Are you picturing the usual migration
> setup where you start a second qemu with its own arguments, plus a migrate_incoming
> option or command?  That does not work for live update restart; the old qemu must exec
> the new qemu.  Or something else?

The existing migration path allows an exec - originally intended to exec
something like a compressor or a store to file rather than a real
migration; i.e. you can do:

  migrate "exec:gzip > mig"

and that will save the migration stream to a compressed file called mig.
Now, I *think* we can already do:

  migrate "exec:path-to-qemu command line parameters -incoming 'hmmmmm'"
(That's probably cleaner via the QMP interface).

I'm not quite sure what I want in the incoming there, but that is
already the source execing the destination qemu - although I think we'd
probably need to check if that's actually via an intermediary.

> We could shoehorn cpr restart into the migrate exec path by defining a new migration 
> capability that the client would set before issuing the migrate command.  However, the
> implementation code would be sprinkled with conditionals to suppress migrate-only bits
> and call cpr-only bits.  IMO that would be less maintainable than having a separate
> cprsave function.  Currently cprsave does not duplicate any migration functionality.
> cprsave calls qemu_save_device_state() which is used by xen.

To me it feels like cprsave in particular is replicating more code.

It's also jumping through hoops in places to avoid changing the
commandline;  that's going to cause more pain for a lot of people - not
just because it's hacks all over for that, but because a lot of people
are actually going to need to change the commandline even in a cpr like
case (e.g. due to hotplug or changing something else about the
environment, like auth data or route to storage or networking that
changed).

There are hooks for early parameter parsing, so if we need to add extra
commandline args we can; but for example the case of QEMU_START_FREEZE
to add -S just isn't needed as soon as you let go of the idea of needing
an identical commandline.

Dave

> - Steve
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


