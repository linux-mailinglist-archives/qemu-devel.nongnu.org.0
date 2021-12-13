Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E6D473465
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:55:50 +0100 (CET)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqUG-0003IS-Qe
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwqT5-0002Yh-KZ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mwqT2-0001gX-7r
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639421669;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQP+GdA4IbXb+AEvH8uFRnRhzf2xbmagykOtQLU315Y=;
 b=JgtXvaVMhCTFnvaJhVJ8+AJ4r/bxrWnO95423C9gfcIV49y6w2IOfmiRNpZWzUsvgq6U9F
 N2sqDdob3GVCfD2N+7kw4E3ZESXL/hDH1LytCo4woO9a1InAhTBUyBorTLTmodIlSBSQtS
 z2jIwnN3IGYMQHgkhIkBK/vyNhQLsxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-Lm5ZJsfpOkW6QLAh70Zt3A-1; Mon, 13 Dec 2021 13:54:21 -0500
X-MC-Unique: Lm5ZJsfpOkW6QLAh70Zt3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D05DD1018723;
 Mon, 13 Dec 2021 18:54:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD0A60C9F;
 Mon, 13 Dec 2021 18:53:59 +0000 (UTC)
Date: Mon, 13 Dec 2021 18:53:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbeWxAn6Zw7rH+5K@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
 <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 13, 2021 at 07:37:49PM +0100, Paolo Bonzini wrote:
> On 12/13/21 19:07, Daniel P. Berrangé wrote:
> >    - /usr/bin/qemu (or /usr/bin/qemu-vm) - for a high level binary that
> >      targets humans and uses a templating system to expose a friendly
> >      simple config, that internally invokes whichever target specific
> >      /usr/bin/qemu-buildvm-$TARGET is implied, plus any other vhost-user
> >      backends, or whatever other helper processes it needs
> 
> Adding vhost-user backends and helper processes means one of two things:
> either you are not going to support hotplug, or you are going to redo
> libvirtd with a QMP-based RPC.

I can't say I thought about the helper process idea too much. I was not
trying to imply anything beyond the fact that I think at the high level
human users should only have interact with a single QEMU binary, not
per-target binaries, and also not worry about helper binaries if they
happen to be used as impl details.

If it were possible to keep auto-spawning of helpers at the high level
that feels cleaner, so that the low level only has to worry about a
single way of doing things. If that is too hard for hotplug though,
so be it, leave auto-spawning in the low level.

Any high level thing would need a monitor of some kind since there'll
always be a need for humans to interrogate the QEMU to some degree. If
we're trying to keep the monitor high level though, we'd want something
closer to HMP. Perhaps again have an HMP that's based around a template
engine that spits out QMP commands, and can extract bits of the reply
for pretty printing, so again we're not writing C code for each new
command that we care to support, just simple template snippets, that
users can again customize if needed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


