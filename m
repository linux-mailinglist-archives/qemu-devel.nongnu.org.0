Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EF75BB05F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 17:40:09 +0200 (CEST)
Received: from localhost ([::1]:40492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDRo-0005rz-Gx
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 11:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZDOO-0001Ki-MY
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oZDOI-0002cD-NO
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 11:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663342587;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eOJWSuCyOmMVwmTx+fl2GXD9uGZB4CNFCvIlsNd/DAU=;
 b=fXmEmfGq1Z/tuwRz08ZxWG4RwqWQZm2npL4iIJF+9B8QyESUNNnzzrPFALIoVasRpX+62W
 g6LZrxeEttzsuuzDCXR41O6o2bYfH4arcrHdlOiH0jzOWf3E/MVNISjy4PrIh3MN5gmOfR
 eJzKfuRm3yB4/H3CaX3/hMkdeqZO8kE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-ZVkcDgaEOaKyOkdes6QdEQ-1; Fri, 16 Sep 2022 11:36:24 -0400
X-MC-Unique: ZVkcDgaEOaKyOkdes6QdEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C5D53C1105D;
 Fri, 16 Sep 2022 15:36:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD68CC5B2A6;
 Fri, 16 Sep 2022 15:36:22 +0000 (UTC)
Date: Fri, 16 Sep 2022 16:36:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Maximum QMP reply size
Message-ID: <YySX9BCEoJ/sARn6@redhat.com>
References: <CAFn=p-ZkKLQtYAwzkQb7srFf_fF8ij+g5wkZiRofx4U+kSZ7Rw@mail.gmail.com>
 <CAFEAcA8Zy3RpTZM-gJk6ZZaUEf6huTuuK3C4-uSo6pYz8KCrMQ@mail.gmail.com>
 <YyNDCDH71oytYujr@work-vm>
 <CAFEAcA9=hY57=7mXrcs3MHZuGR0HdXwQh-thW8zW=hMmxck2Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9=hY57=7mXrcs3MHZuGR0HdXwQh-thW8zW=hMmxck2Ng@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Fri, Sep 16, 2022 at 04:12:00PM +0100, Peter Maydell wrote:
> On Thu, 15 Sept 2022 at 16:21, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> > > On Tue, 6 Sept 2022 at 20:41, John Snow <jsnow@redhat.com> wrote:
> > > > Hi, I suspect I have asked this before, but I didn't write it down in
> > > > a comment, so I forget my justification...
> > > >
> > > > In the QMP lib, we need to set a buffering limit for how big a QMP
> > > > message can be -- In practice, I found that the largest possible
> > > > response was the QAPI schema reply, and I set the code to this:
> > > >
> > > >     # Maximum allowable size of read buffer
> > > >     _limit = (64 * 1024)
> > > >
> > > > However, I didn't document if this was a reasonable limit or just a
> > > > "worksforme" one. I assume that there's no hard limit for the protocol
> > > > or the implementation thereof in QEMU. Is there any kind of value here
> > > > that would be more sensible than another?
> > > >
> > > > I'm worried that if replies get bigger in the future (possibly in some
> > > > degenerate case I am presently unaware of) that the library default
> > > > will become nonsensical.
> > >
> > > There are some QMP commands which return lists of things
> > > where we put no inherent limit on how many things there
> > > are in the list, like qom-list-types. We'd have to be getting
> > > a bit enthusiastic about defining types for that to get
> > > up towards 64K's worth of response, but it's not inherently
> > > impossible. I think using human-monitor-command to send
> > > an 'xp' HMP command is also a way to get back an arbitrarily
> > > large string (just ask for a lot of memory to be dumped).
> >
> > We could put size limits on xp; most Humans will only dump a few kB
> > maximum like that, any larger and you can dump to file.
> 
> Sure, we could, but why? It's not clear to me why a consumer
> of QMP needs to impose a maximum message size limit on it:
> I thought it was just JSON. Fixed buffer sizes are very 1980s :-)

Well even if they parse the JSON as it streams in, rather than
reading the whole doc and then parsing it in one go, you still
need to have limits on any sane QMP client.

The QEMU process is an untrusted component in the stack, talking
to a trusted mgmt layer. If the QEMU process sends a 1 TB JSON
message as a QMP reply, the mgmt layer must not try to parse
that as they'll let loose the kraken^H^H^H^H^H OOM killer.

To be robust against either a malicious or mis-behaving QEMU
they need to impose a limit on the size of QMP response they'll
be willing to process. The challenge is figuring out what limit
is big enough to handle any conceivable valid message, while
being small enough to minimize denial of service risks.

NB, that's not the only thing clients need todo to protect from
a bad QEMU. Rate limiting consumption is potentially important too
lest a bad QEMU inflict a DoS on the CPU by sending such frequent
messages that the QMP client is burning 100% CPU just parsing
them.  I've not seen any QMP client do this in practice though,
not even libvirt has attempted it.

> If this is a common requirement then should we define something
> in the protocol where the client says "I can support messages
> up to this big" and then the server has to split things up?

Splitting doesn't help protect against the DoS, because the QMP
client would have to reassemble the pieces afterwards to process
the reply / async event.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


