Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C115C2FCD8B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:47:07 +0100 (CET)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2A4w-0008OS-T1
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2A3k-0007wQ-AI
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2A3h-0002as-0N
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611135948;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYYtu+RTF1CcrtLtZ/kJ89yLwVMdzk0F0B02V77W3/A=;
 b=BTJxO4sdvr3jNn/qqP4K/CZ87dD+RAB0GX9Y4+5s4I/NrwvaRZW9sTNfGUkrC8TzwSNb2J
 dejAjL+9rXppSXdQIGtIpnWAcCCfLWJvbpnfPnAXRecvN300Tc4tN7vmMvlDPL0UNnpGtg
 eV+qWB3gmWfSbOvTLB0am5hJjeFTTPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-k-pLgZHVMRKGajejgEDM9A-1; Wed, 20 Jan 2021 04:45:45 -0500
X-MC-Unique: k-pLgZHVMRKGajejgEDM9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFCE71800D41;
 Wed, 20 Jan 2021 09:45:44 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2563D6F99D;
 Wed, 20 Jan 2021 09:45:42 +0000 (UTC)
Date: Wed, 20 Jan 2021 09:45:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.vnet.ibm.com>
Subject: Re: [PATCH] qmp-shell: Suppress banner and prompt when stdin is not
 a TTY
Message-ID: <20210120094539.GC3015589@redhat.com>
References: <20210117072742.119377-1-dovmurik@linux.vnet.ibm.com>
 <f6b88346-9dac-2679-385c-17d4a0e245c4@redhat.com>
 <1d63a097-27d5-5b3a-2ce6-f6a2402e135e@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1d63a097-27d5-5b3a-2ce6-f6a2402e135e@linux.vnet.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 10:25:25AM +0200, Dov Murik wrote:
> Hi John,
> 
> On 19/01/2021 22:02, John Snow wrote:
> > On 1/17/21 2:27 AM, Dov Murik wrote:
> > > Detect whether qmp-shell's standard input is not a TTY; in such case,
> > > assume a non-interactive mode, which suppresses the welcome banner and
> > > the "(QEMU)" prompt.  This allows for easier consumption of qmp-shell's
> > > output in scripts.
> > > 
> > > Example usage before this change:
> > > 
> > >      $ printf "query-status\nquery-kvm\n" | sudo
> > > scripts/qmp/qmp-shell qmp-unix-sock
> > >      Welcome to the QMP low-level shell!
> > >      Connected to QEMU 5.1.50
> > > 
> > >      (QEMU) {"return": {"status": "running", "singlestep": false,
> > > "running": true}}
> > >      (QEMU) {"return": {"enabled": true, "present": true}}
> > >      (QEMU)
> > > 
> > > Example usage after this change:
> > > 
> > >      $ printf "query-status\nquery-kvm\n" | sudo
> > > scripts/qmp/qmp-shell qmp-unix-sock
> > >      {"return": {"status": "running", "singlestep": false,
> > > "running": true}}
> > >      {"return": {"enabled": true, "present": true}}
> > > 
> > > Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> > 
> > Hiya! I've been taking lead on modernizing a lot of our python
> > infrastructure, including our QMP library and qmp-shell.
> > 
> > (Sorry, not in MAINTAINERS yet; but I am in the process of moving these
> > scripts and tools over to ./python/qemu/qmp.)
> 
> Thanks for this effort.
> 
> > 
> > This change makes me nervous, because qmp-shell is not traditionally a
> > component we've thought of as needing to preserve backwards-compatible
> > behavior. Using it as a script meant to be consumed in a headless
> > fashion runs a bit counter to that assumption.
> > 
> > I'd be less nervous if the syntax of qmp-shell was something that was
> > well thought-out and rigorously tested, but it's a hodge-podge of
> > whatever people needed at the moment. I am *very* reluctant to cement
> > it.
> 
> Yes, I understand your choice.
> 
> 
> > 
> > Are you trying to leverage the qmp.py library from bash?
> 
> Yes, I want to send a few QMP commands and record their output.  If I use
> socat to the unix-socket I need to serialize the JSON request myself, so
> using qmp-shell saves me that; also not sure if there's any negotiation done
> at the beginning by qmp-shell.

There is a handshake, but it is just a single json message.

See docs/interop/qmp-intro.txt and qmp-spec.txt for guidance.

> Is there an easier way to script qmp commands, short of writing my own
> python program which uses the qmp.py library?

Yes, writing your own python program is probably best. Doing anything
complex is shell is almost always a mistake, as it is a very crude
and poor language compared to something like managing QEMU/QMP.

Note that I don't believe that we've declared qmp.py to be a long
term stable interface for users outside of QEMU either. An alternative
is to just use the python sockets APIs directly to speak to QEMU/QMP

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


