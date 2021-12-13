Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DAF4733A6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:09:54 +0100 (CET)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwplo-0004qi-VE
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwpjr-0003zj-0B
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:07:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwpjo-0001sG-73
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639418867;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XvE05KRtOIjpaxAUjwZUgo/8jNmKBSMcYlndcMQstW4=;
 b=dVSzCiYVFfjkBREn+fdbAVPGxu7/KnBzCMymU8GyI3lr9uwDzTk+4Axb/yCYxypgwuIkiF
 ayHb8qltn38zEh5odlZSCiJgmMAsqiJe2L9mjQV5TP2Ke65exwLct/gUN86yw4LNWSJdMZ
 5yS8e+TpsVpie/1w545tEZIiNuyhDlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-9Khayhr5Or63kPme-A7n_Q-1; Mon, 13 Dec 2021 13:07:46 -0500
X-MC-Unique: 9Khayhr5Or63kPme-A7n_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D442C10144E3;
 Mon, 13 Dec 2021 18:07:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 157B94ABA2;
 Mon, 13 Dec 2021 18:07:42 +0000 (UTC)
Date: Mon, 13 Dec 2021 18:07:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbeL7EjoTtrUrGa2@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 06:37:44PM +0100, Paolo Bonzini wrote:
> On 12/13/21 16:28, Markus Armbruster wrote:
> > Would you object to me expanding the CLI here to the point where I think
> > we can deprecate the old binary?
> > 
> > If yes, why?
> 
> Yes, for two reasons.
> 
> First, because there will be usually differences between the command lines
> as mentioned elsewhere in the thread.  qemu-system-* is a good name, but one
> that is already taken by 15 years of docs using the existing command line.

T

Lets pick naming to make it clearer who/what each binary is targetted
towards. e.g.

  - /usr/bin/qemu-buildvm-$TARGET   for the low level binary that just
    speaks QMP on stdio / passed in pre-opened socket, targetted
    at mgmt apps and needs a series of commands to build a VM up
    from scratch

  - /usr/bin/qemu (or /usr/bin/qemu-vm) - for a high level binary that
    targets humans and uses a templating system to expose a friendly
    simple config, that internally invokes whichever target specific
    /usr/bin/qemu-buildvm-$TARGET is implied, plus any other vhost-user
    backends, or whatever other helper processes it needs

> Second, because a command line is really hard to get right as complexity
> increases.  QMP is the way to go to get as clean as possible a configuration
> mechanism.  There *will* be a second set of warts layered on top of the
> above code, and I don't want that.

Turning the high level / short config into a general purpose templating
problem, strictly separated from the low level binary using QMP, means
gives us a more flexible way to live with the warts IMHO.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


