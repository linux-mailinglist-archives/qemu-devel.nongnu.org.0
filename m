Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E34761AF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:27:03 +0100 (CET)
Received: from localhost ([::1]:54778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZva-0000tD-Rk
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:27:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxZMx-0005Gd-CF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxZMu-0007wa-6P
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:51:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639594270;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsRQc0G3qGU7azfT2jwdyHrPN2Ez67XUWW0UglJ/9RE=;
 b=g4kgKY9NHPYFurW7Ji5r8MBSBGMKfn903XyFfIAIRAoe/tZkTp7WV72K3rpJ0Ux0p5Wa1O
 9PgP6Z7uaFt+YBjGDkrw3jjo+MfEgOimmu97lEuZhhViMz/347pau3RJQy5UXmL94Zciv2
 /69f/bL06Ho7xH/jUy+mvvRjUqIMDvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-q3nzrZNaMKe8TkgDAmoHQw-1; Wed, 15 Dec 2021 13:51:02 -0500
X-MC-Unique: q3nzrZNaMKe8TkgDAmoHQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDC25100CCC1;
 Wed, 15 Dec 2021 18:51:00 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85AB65ED4C;
 Wed, 15 Dec 2021 18:50:29 +0000 (UTC)
Date: Wed, 15 Dec 2021 18:50:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <Ybo48hqxlWvOosjT@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
 <YbeWxAn6Zw7rH+5K@redhat.com>
 <26f9bac3-07a2-6152-94e9-596426616f55@redhat.com>
MIME-Version: 1.0
In-Reply-To: <26f9bac3-07a2-6152-94e9-596426616f55@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 07:46:37PM +0100, Paolo Bonzini wrote:
> On 12/13/21 19:53, Daniel P. Berrangé wrote:
> > > Adding vhost-user backends and helper processes means one of two things:
> > > either you are not going to support hotplug, or you are going to redo
> > > libvirtd with a QMP-based RPC.
> > 
> > If it were possible to keep auto-spawning of helpers at the high level
> > that feels cleaner, so that the low level only has to worry about a
> > single way of doing things. If that is too hard for hotplug though,
> > so be it, leave auto-spawning in the low level.
> 
> OTOH, autospawning in the low-level saves hotplugging but it kills
> sandboxing; the seccomp filter prohibits forking.


I think the kind of users we expect to leverage the high level interface
don't especially need sandboxing. They're more the people doing adhoc
virtualization or emulation tasks, not production deployments of VMs.
If they need strong security they'd be better off using a layer like
libvirt. 

> The libvirt model is the only good one once you care about separation of
> privilege.  The idea of moving large parts of libvirt's domain driver into a
> new QEMU-level binary was floated around in the past by Andrea Bolognani,
> and I don't dislike it; but I don't believe anybody will have time to
> actually realize it, much less to bring it to feature parity.

Yep, lets not create masses more work for ourselves, by expanding the
scope of this new design. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


