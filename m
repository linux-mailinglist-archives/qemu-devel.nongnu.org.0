Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E61D4BF61E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 11:36:21 +0100 (CET)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMSWp-0006Dw-GY
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 05:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMSTF-0004bz-QT
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:32:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMSTC-0006nw-3c
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645525953;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W0DJP8GGrYGMbpy5fDDtXPfRVMVniwOeQc9J7gaen7Y=;
 b=LL5hjDVxH+7Ry/xQRV0/8cpKAuZ9ziI/GqTu2pyO7IhPdUTurqgf0f2eHRzdoTKg///LHW
 5NNrs1GzNhQSUvH747RKGjTKcvrGdX6ChH6j8abGsjVnCDjqtD6tzrxuKLF5pVDRo4IH+4
 OPqi6WT8l/6GmYVxz4oSqdJqGmHdPr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-1ijjD9DANyu4EQ_y7ccnbA-1; Tue, 22 Feb 2022 05:32:20 -0500
X-MC-Unique: 1ijjD9DANyu4EQ_y7ccnbA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 913722D4;
 Tue, 22 Feb 2022 10:32:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B7FC83079;
 Tue, 22 Feb 2022 10:32:04 +0000 (UTC)
Date: Tue, 22 Feb 2022 10:31:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH 0/5] qmp-shell modifications for non-interactive use
Message-ID: <YhS7nE+6++YN4exZ@redhat.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
 <87bkyzzb1q.fsf@pond.sub.org>
 <3656609c-522d-a0e8-e6ef-465cdc9d6c88@greensocs.com>
 <YhSrD/gmlMkumkah@redhat.com>
 <c3fb1a44-29ac-00a0-47f4-7f152977f4a5@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <c3fb1a44-29ac-00a0-47f4-7f152977f4a5@greensocs.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 10:38:09AM +0100, Damien Hedde wrote:
> 
> 
> On 2/22/22 10:21, Daniel P. Berrangé wrote:
> > On Tue, Feb 22, 2022 at 08:57:03AM +0100, Damien Hedde wrote:
> > > 
> > > 
> > > On 2/22/22 07:10, Markus Armbruster wrote:
> > > > Damien Hedde <damien.hedde@greensocs.com> writes:
> > > > 
> > > > > Hi,
> > > > > 
> > > > > The main idea of this series is to be a bit more user-friendly when
> > > > > using qmp-shell in a non-interactive way: with an input redirection
> > > > > from a file containing a list of commands.
> > > > > 
> > > > > I'm working on dynamic qapi config of a qemu machine, this would
> > > > > be very useful to provide and reproduce small examples.
> > > > 
> > > > Why not use plain QMP for that?
> > > > 
> > > > [...]
> > > > 
> > > What do you mean by plain QMP ?
> > 
> > Directly connect to the socket and send the QMP JSON commands you have.
> > 
> > Essentially qmp-shell is designed for adhoc interactive human usage.
> > For automated / scripted, non-interactive usage, it is expected that
> > QMP is simple enough that tools just directly connect to the QMP
> > socket instead of using a wrapper layer.
> > 
> > What is the reason you want to use qmp-shell for this instead of
> > directly using the socket from your scripts ?
> > 
> > Regards,
> > Daniel
> 
> We have such scripts that interface with QMP directly for our own use.
> 
> Here I just wanted to propose a simple way to just send a
> bunch of commands from a source file and stop if something unexpected
> happens.
> Only goal is to be able to share a file on the ml and allow people to
> reproduce easily.
> We can already redirect the input, but it is almost impossible to see
> if something failed.

Yes, I see what you mean. So the problem with using 'socat' or similar
is that we fill the input with commands and response appear asynchronously,
so we can't match them up easily. This is actually a problem seen in the
block I/O tests which just send QMP stuff in a batch.

While you could do this by invoking socat once for each command, that
gets silly with the repeated QMP handshake for each command.

The thing about using qmp-shell is that it does a bunch of extra stuff
targetted at humans on top, and history tells us it isn't a good idea
to mix stuff for humans and machines in the same tool/interface.

How about instead creating a separate 'qmp-send' command that is not
much more than a "QMP-aware socat".  By which I mean, it just reads
raw QMP commands from stdin, sends each one to the server, but
crucially waits for a reply after sending each, and stops on first
error reponse.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


