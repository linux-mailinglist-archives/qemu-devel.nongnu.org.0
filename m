Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F0F4702DE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:31:39 +0100 (CET)
Received: from localhost ([::1]:55332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgvw-0002ft-Gt
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:31:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvgrl-00005x-UF
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvgrj-0007ll-7H
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:27:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639146434;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Cjy8ZWuPFAST5Htg1nVako+dEqOUHhihmJNmgm7jNg=;
 b=Evd9J/CMYxbr1+71je8o9XZqU8Gh08DlTLwi6lXa6DlX7Qm6ysLqV5gFlWqoHyfFztx7Io
 rehxzvB6eK1MqNozc4VKb7iLw8EtLF7APDoNopjGzEseNqqfvlVL/645j4VAHYinvMCXpi
 g2nBg0Pqhrx+EMsCJgcHTYiemH2EU/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-ErmBsI38OCCZVl9REY1wKQ-1; Fri, 10 Dec 2021 09:27:11 -0500
X-MC-Unique: ErmBsI38OCCZVl9REY1wKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45493593A8;
 Fri, 10 Dec 2021 14:27:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DFED6A023;
 Fri, 10 Dec 2021 14:27:02 +0000 (UTC)
Date: Fri, 10 Dec 2021 14:26:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbNjsq6hUWSIDtVt@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <YbM5Q+gq89rWoPt8@redhat.com>
 <A220E257-3378-4E43-86B6-4ED84E3CA3E8@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <A220E257-3378-4E43-86B6-4ED84E3CA3E8@greensocs.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 03:15:50PM +0100, Mark Burton wrote:
> 
> 
> > On 10 Dec 2021, at 12:25, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Fri, Dec 10, 2021 at 09:34:41AM +0100, Paolo Bonzini wrote:
> >> On 12/9/21 20:11, Daniel P. Berrangé wrote:
> >>>>    They still need to bootstrap a QMP monitor, and for that, CLI is fine
> >>>>    as long as it's simple and stable.
> >> 
> >> I would go a step further and say that the QMP monitor socket should be
> >> created by whoever invoked QEMU and passed down via systemd's socket
> >> activation protocol, with a fallback to stdin/stdout.
> 
> Could we take one more small step …. 
> (Sorry - I’m sure you’ll all hate me for pointing at the elephant in the room….)
> 
> Why should QEMU itself handle this? You may want to use systemd
> socket activation, I may be happier with a different approach.
> The commonality is surely at the level of the underlying QAPI.
> Being able to build QEMU as a ….. library, with a single entry
> point to access the QAPI would allow the QEMU community to focus
> on it’s key ‘kernel’, while others are able to propose integrated
> solutions like activation through systemd an/or whatever libvirt
> does etc etc…. By all means there can be a systemd-qemu project….
> But does that have to be baked into QEMU?

Systemd activation doesn't really tie QEMU into systemd at
all. The socket passing scheme is trivial and both sides are
easily implemented by any application. It is reasonable to
use in QEMU on any UNIX platform at least. Windows is probably
the only complication here.

> I know there’s a history on the use of the “Library” word - equally
> there is a notion of a library needing a static interface etc - I
> propose we agree upon a single access mechanism to the QAPI - who’s
> existence and stability we have already (I think) agreed upon.

A stable/static interface is not hard - it doesn't require all
that much more than exposing a few APIs related to input and
output of QAPI based JSON docs. This all exists already, you
wwould just get skipping thue sockets serialization of QMP.

The biggest stumbling block for QEMU as a library is actually
the licensing mess. Too much of our code is GPLv2-only, which
makes it impractical to use as a library in too many use cases.
Any app that is not GPLv2-only compatible would have to isolate
QEMU in its own process and talk to it over RPC, at which point
it has just reinventing QMP again.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


