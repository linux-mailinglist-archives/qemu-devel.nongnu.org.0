Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE70B5BDFE9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 10:23:40 +0200 (CEST)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaYXb-0000Mn-Tx
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 04:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oaYOm-00037D-1O
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oaYOi-0006c6-Kx
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 04:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663661666;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9b2qM/6LsxYKN+tzd+yky46nxK6rtB3jsF/awBXAMi0=;
 b=U+NSCjcF3+bBn5rihx47uf65bJKwfSJJ/ecU3104FWnz1HAihQu1VpD14HFmfI4cZLK/3I
 yd7fODmYyYQlwq6EoePdC0mcN5js1P45KgUmJSOt6+77GFf41HuvwRC3Ug2kkIiOSRmGk9
 nFYWSK8NH9NnSZoSq/BxFsONPM3KRa4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-sI47HJqbPL-PoNXEK6Ipkw-1; Tue, 20 Sep 2022 04:14:25 -0400
X-MC-Unique: sI47HJqbPL-PoNXEK6Ipkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DD26185A7AA;
 Tue, 20 Sep 2022 08:14:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2797F40C6EC4;
 Tue, 20 Sep 2022 08:14:24 +0000 (UTC)
Date: Tue, 20 Sep 2022 09:14:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Maximum QMP reply size
Message-ID: <Yyl2XZ5F1NIKW64C@redhat.com>
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
 <YyNDCDH71oytYujr@work-vm>
 <CAFEAcA9=hY57=7mXrcs3MHZuGR0HdXwQh-thW8zW=hMmxck2Ng@mail.gmail.com>
 <YySX9BCEoJ/sARn6@redhat.com> <87a66vammk.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a66vammk.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 19, 2022 at 08:45:07AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Sep 16, 2022 at 04:12:00PM +0100, Peter Maydell wrote:
> >> On Thu, 15 Sept 2022 at 16:21, Dr. David Alan Gilbert
> >> <dgilbert@redhat.com> wrote:
> >> >
> >> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> > > On Tue, 6 Sept 2022 at 20:41, John Snow <jsnow@redhat.com> wrote:
> >> > > > Hi, I suspect I have asked this before, but I didn't write it down in
> >> > > > a comment, so I forget my justification...
> >> > > >
> >> > > > In the QMP lib, we need to set a buffering limit for how big a QMP
> >> > > > message can be -- In practice, I found that the largest possible
> >> > > > response was the QAPI schema reply, and I set the code to this:
> >> > > >
> >> > > >     # Maximum allowable size of read buffer
> >> > > >     _limit = (64 * 1024)
> >> > > >
> >> > > > However, I didn't document if this was a reasonable limit or just a
> >> > > > "worksforme" one. I assume that there's no hard limit for the protocol
> >> > > > or the implementation thereof in QEMU. Is there any kind of value here
> >> > > > that would be more sensible than another?
> >> > > >
> >> > > > I'm worried that if replies get bigger in the future (possibly in some
> >> > > > degenerate case I am presently unaware of) that the library default
> >> > > > will become nonsensical.
> >> > >
> >> > > There are some QMP commands which return lists of things
> >> > > where we put no inherent limit on how many things there
> >> > > are in the list, like qom-list-types. We'd have to be getting
> >> > > a bit enthusiastic about defining types for that to get
> >> > > up towards 64K's worth of response, but it's not inherently
> >> > > impossible. I think using human-monitor-command to send
> >> > > an 'xp' HMP command is also a way to get back an arbitrarily
> >> > > large string (just ask for a lot of memory to be dumped).
> >> >
> >> > We could put size limits on xp; most Humans will only dump a few kB
> >> > maximum like that, any larger and you can dump to file.
> >> 
> >> Sure, we could, but why? It's not clear to me why a consumer
> >> of QMP needs to impose a maximum message size limit on it:
> >> I thought it was just JSON. Fixed buffer sizes are very 1980s :-)
> >
> > Well even if they parse the JSON as it streams in, rather than
> > reading the whole doc and then parsing it in one go, you still
> > need to have limits on any sane QMP client.
> >
> > The QEMU process is an untrusted component in the stack, talking
> > to a trusted mgmt layer. If the QEMU process sends a 1 TB JSON
> > message as a QMP reply, the mgmt layer must not try to parse
> > that as they'll let loose the kraken^H^H^H^H^H OOM killer.
> >
> > To be robust against either a malicious or mis-behaving QEMU
> > they need to impose a limit on the size of QMP response they'll
> > be willing to process. The challenge is figuring out what limit
> > is big enough to handle any conceivable valid message, while
> > being small enough to minimize denial of service risks.
> 
> Yes.
> 
> QEMU does this for QMP input.
> 
> Trying to defend against malicious QMP input would of course be
> pointless; if you can send QMP input, you "own" QEMU anyway.  It's
> defense against *accidents*.
> 
> The limits are extremely (overly?) generous: each command is limited to
> 1024 levels of nesting to protect the stack, 64MiB of total token size
> and 2Mi[*] tokens to protect the heap.
> 
> > NB, that's not the only thing clients need todo to protect from
> > a bad QEMU. Rate limiting consumption is potentially important too
> > lest a bad QEMU inflict a DoS on the CPU by sending such frequent
> > messages that the QMP client is burning 100% CPU just parsing
> > them.  I've not seen any QMP client do this in practice though,
> > not even libvirt has attempted it.
> 
> What could a management application do when it detects it can't /
> doesn't want to keep up with QMP output?

Gratuitously killing the VM is an option, but likely too harsh for
most scenarios.

Another option is to disconnect from QMP and then immediately connect
again, in the hope it was just a transient confused QEMU.

Another option would be to simply mark the VM as "broken", leave it
running but stop talking to QMP entirely. THe guest owner can still
use their VM, but can't make mgmt app changes and loose some monitoring
features. Possibly allow user to attempt a "repair" - ie disconnect
and reconnect.

Another option is to have a dedicated OS thread for handling the QMP
client side, and ensure that thread is under the same CPU usage limits
as the VM as a whole, so any excess CPU usage is accounted to the VM.

> >> If this is a common requirement then should we define something
> >> in the protocol where the client says "I can support messages
> >> up to this big" and then the server has to split things up?
> >
> > Splitting doesn't help protect against the DoS, because the QMP
> > client would have to reassemble the pieces afterwards to process
> > the reply / async event.
> 
> Yes.
> 
> Can we estimate limits that should suffice?  Documenting them could help
> management applications.

FWIW, libvirt uses 10 MB as an arbitrarily picked large limit. I'm
not aware of us having bug reports complaining this is too low thus
far.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


