Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D1946FFCB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 12:29:17 +0100 (CET)
Received: from localhost ([::1]:56780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mve5U-0005Dj-9u
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 06:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mve2d-0002qb-Ck
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mve2W-0000lc-RC
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 06:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639135570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kyI9I3wcdy9WwJhFjMSHKlfAbXr6diljWB3WpCJTpE=;
 b=PBWJ/WpO69o+uPZF/YAkYO+HPueelFKbhYVruXV0812HZwcRgfcMDwLHzSDyqxzcrhbJAE
 tzPc/Z6iCTzAWiNHipn9NUKyu+rJmr0JA8khJP2XlKCmR6tnRblsA3iTRw3iVdEj3+tiN/
 NBh4b0GKqhsXVdz1o+gc3NrUBSNyAAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-E_wWlvDdP7mdhlvukv-XxA-1; Fri, 10 Dec 2021 06:26:07 -0500
X-MC-Unique: E_wWlvDdP7mdhlvukv-XxA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84BEA64140;
 Fri, 10 Dec 2021 11:26:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E06E100E125;
 Fri, 10 Dec 2021 11:25:58 +0000 (UTC)
Date: Fri, 10 Dec 2021 11:25:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbM5Q+gq89rWoPt8@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 09:34:41AM +0100, Paolo Bonzini wrote:
> On 12/9/21 20:11, Daniel P. Berrangé wrote:
> > >     They still need to bootstrap a QMP monitor, and for that, CLI is fine
> > >     as long as it's simple and stable.
> 
> I would go a step further and say that the QMP monitor socket should be
> created by whoever invoked QEMU and passed down via systemd's socket
> activation protocol, with a fallback to stdin/stdout.

That's an interesting idea, firmly relegating any "human friendly"
targetted CLI to a separate program, that in turn invokes this
low level QEMU binary. I do like the simplicity of this and the
strict division of the layers it provides us, as it will help keep
us honest when designing human friendly interfaces.

To be clear, I do think the QEMU project should be delivering a
nice simple human targetted interface, and ideally using the
'/usr/bin/qemu' binary name, and able to deliver users a machines
with a modern hardware config that can evolve over time.

> > > = Appendix: Why further incremental change feels impractical =
> > > 
> > > Crafting a big change in small steps sounds great.  It isn't when we
> > > have to make things worse before they can get better, and every step is
> > > painfully slow because it's just too hard, and the end state we aim for
> > > isn't really what we want.
> > 
> > I can't disagree with this. If we carry on trying to evolve vl.c
> > incrementally we are doomed to be stuck with a horrible starstup
> > process for enternity (or at least as long as I'll still be
> > working as QEMU maintainer).
> 
> ... and if you compare vl.c in 5.2 and now, and consider current vl.c to be
> horrible, my knowedge of English does not include an adjective to describe
> the 5.2 state.  Some incremental work _is_ possible or even necessary, and
> has been done already.

Right, I'm not saying vl.c hasn't improved, but we're never going
to get out of the peculiar historical startup ordering rules we
have today by incremental fixes, without breaking people.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


