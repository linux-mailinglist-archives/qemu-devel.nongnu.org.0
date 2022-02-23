Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7859E4C1636
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 16:12:27 +0100 (CET)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMtJa-0006yN-1v
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 10:12:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMtGM-0005md-2S
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMtGA-0003O7-14
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 10:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645628932;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h1Xtv2VJKLfP1DOvdMGVgIXh9U1GaLyR63us0IlG46I=;
 b=d8pqB/TgGKjIJHRktD5AO89XOxKC0zeMV2upf+9I9SWV4rwHbLpDUpeBgbjnllVAFegs4h
 8K3CMsUlNwJRZoCR3XaxmjvAftFAV2+ZK/9xux2AyASsbc8RYvq3m0XAPTPHHz9Rz+YXZY
 eGex/BkVri22YU84BnJY/94P+48RlQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-dufXJlcYM_quGjWZDKFDyg-1; Wed, 23 Feb 2022 10:08:39 -0500
X-MC-Unique: dufXJlcYM_quGjWZDKFDyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D3DE1091DA0;
 Wed, 23 Feb 2022 15:08:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C165804D6;
 Wed, 23 Feb 2022 15:08:22 +0000 (UTC)
Date: Wed, 23 Feb 2022 15:08:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
Message-ID: <YhZN43USKlRCUPEJ@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
 <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
 <YhSrD/gmlMkumkah@redhat.com>
 <c3fb1a44-29ac-00a0-47f4-7f152977f4a5@greensocs.com>
 <YhS7nE+6++YN4exZ@redhat.com>
 <eb1d52ef-d358-57bd-1468-cff84ace8d20@greensocs.com>
 <YhYW562k1IBTlHag@redhat.com>
 <CAFn=p-aQhj4xgPq9fkz5f34vWdJQraPsXY33Qw1KmebdMFsDog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aQhj4xgPq9fkz5f34vWdJQraPsXY33Qw1KmebdMFsDog@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 23, 2022 at 10:01:05AM -0500, John Snow wrote:
> On Wed, Feb 23, 2022 at 6:13 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Feb 23, 2022 at 10:57:29AM +0100, Damien Hedde wrote:
> > >
> > >
> > > On 2/22/22 11:31, Daniel P. Berrangé wrote:
> > > > On Tue, Feb 22, 2022 at 10:38:09AM +0100, Damien Hedde wrote:
> > > > >
> > > > >
> > > > > Here I just wanted to propose a simple way to just send a
> > > > > bunch of commands from a source file and stop if something unexpected
> > > > > happens.
> > > > > Only goal is to be able to share a file on the ml and allow people to
> > > > > reproduce easily.
> > > > > We can already redirect the input, but it is almost impossible to see
> > > > > if something failed.
> > > >
> > > > Yes, I see what you mean. So the problem with using 'socat' or similar
> > > > is that we fill the input with commands and response appear asynchronously,
> > > > so we can't match them up easily. This is actually a problem seen in the
> > > > block I/O tests which just send QMP stuff in a batch.
> > > >
> > > > While you could do this by invoking socat once for each command, that
> > > > gets silly with the repeated QMP handshake for each command.
> > > >
> > > > The thing about using qmp-shell is that it does a bunch of extra stuff
> > > > targetted at humans on top, and history tells us it isn't a good idea
> > > > to mix stuff for humans and machines in the same tool/interface.
> > > >
> > > > How about instead creating a separate 'qmp-send' command that is not
> > > > much more than a "QMP-aware socat".  By which I mean, it just reads
> > > > raw QMP commands from stdin, sends each one to the server, but
> > > > crucially waits for a reply after sending each, and stops on first
> > > > error reponse.
> > >
> > > By 'qmp-send' command, you mean another script in scripts/qmp ?
> > > Yes
> >
> > Yep.
> >
> > > If we go for another script, I would rather do one with wrap
> > > feature (like your series) to start qemu as well.
> >
> > Sure, that would certainly make sense.  I actually wanted to add
> > the wrap feature directly into the existing qmp-shell, but it was
> > not viable while maintaining back compat. With a new qmp-send
> > command you can easily make "wrap mode" supported from the start.
> >
> 
> I'm also wary of adding scriptable interfaces to qmp-shell, but I can
> see them having some value.
> 
> I'm not against the ability to add some kind of "load commands from
> file" interactive command to qmp-shell, for instance. (/LOAD or /PLAY
> or something?) ... but then we need to worry about what the format of
> the file is and how exactly that scripting language works. It's a
> design minefield.

My concern is that qmp-shell takes command input in a high level data
format. I don't want to see that format turn into something that
machines use, which is what is proposed initially here.

For this reason I prefer to see a separate qmp-send that solves
the automation problems, without introducing a new data format,
just directly passing raw QMP messages to/fro.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


