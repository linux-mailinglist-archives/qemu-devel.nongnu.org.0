Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327143F1E40
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:45:36 +0200 (CEST)
Received: from localhost ([::1]:55066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGlAd-0000ml-91
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mGl9C-0008US-J9
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mGl9A-000478-Rg
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629391443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aWYGPohmWdaUsfAPhePaKNxnw6/agshmgqLcjUL5i5M=;
 b=Tv2KBYHdEC32C/4UpyA5xoqs3/QMUP9qmTeGJAvNs5VskImSUNz3H7MSWSAksAS8t3yxTs
 WeG253gNxFwztoMwG1G4Ldp/3h28o2QORQhMNoqhDuTYF60ajHiZFxdWvOKZAiyYNrd8UT
 jTyQD2M+klaBs1YAAXUMlnOZhtMPDH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-0Kf75JutMfGzD2l5HX2r1w-1; Thu, 19 Aug 2021 12:44:00 -0400
X-MC-Unique: 0Kf75JutMfGzD2l5HX2r1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359FC760C5;
 Thu, 19 Aug 2021 16:43:59 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A79C710016F7;
 Thu, 19 Aug 2021 16:43:47 +0000 (UTC)
Date: Thu, 19 Aug 2021 12:43:47 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 09/25] python/aqmp: add AsyncProtocol.accept() method
Message-ID: <20210819164347.bgejegblqb4pejgm@habkost.net>
References: <20210803182941.504537-1-jsnow@redhat.com>
 <20210803182941.504537-10-jsnow@redhat.com>
 <20210817192949.cglc7ah2ohlmtf43@redhat.com>
 <CAFn=p-bhHBC2dxq3EiuVOo8UBTy5AhBMwDyzFu-c0L_o4=VsAg@mail.gmail.com>
 <20210819145009.4feupwleh4iyltkw@redhat.com>
 <CAFn=p-bq_7eD82hW67Gr5F6ff8HQsXDCkNSQZ7HqZ_wxfBd3Fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-bq_7eD82hW67Gr5F6ff8HQsXDCkNSQZ7HqZ_wxfBd3Fg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 11:48:16AM -0400, John Snow wrote:
> On Thu, Aug 19, 2021 at 10:50 AM Eric Blake <eblake@redhat.com> wrote:
> 
> > On Wed, Aug 18, 2021 at 10:24:52AM -0400, John Snow wrote:
> > > > >
> > > > > +    @upper_half
> > > > > +    @require(Runstate.IDLE)
> > > > > +    async def accept(self, address: Union[str, Tuple[str, int]],
> > > > > +                     ssl: Optional[SSLContext] = None) -> None:
> > > > > +        """
> > > > > +        Accept a connection and begin processing message queues.
> > > > > +
> > > > > +        If this call fails, `runstate` is guaranteed to be set back
> > to
> > > > `IDLE`.
> > > > > +
> > > > > +        :param address:
> > > > > +            Address to listen to; UNIX socket path or TCP
> > address/port.
> > > >
> > > > Can't TCP use a well-known port name instead of an int?  But limiting
> > > > clients to just int port for now isn't fatal to the patch.
> > > >
> > > >
> > > The old QMP library didn't support this, and I used the old library as my
> > > template here. I'm willing to change the address format and types to be
> > > more comprehensive, but I was thinking that it should probably try to
> > match
> > > or adhere to some standard; de-facto or otherwise. I wasn't sure which to
> > > pick, and we use a few different ones in QEMU itself. Any recommendations
> > > for me?
> >
> > I asked because I know QAPI specifies TCP as string/string (the
> > hostname as a string makes absolute sense, but the port number as a
> > string is because of the less-used feature of a well-known port name).
> > I'm fine if the initial patch uses an int for the port number here; we
> > can always add support for more formats down the road when someone
> > actually has a use for them.
> >
> >
> https://docs.python.org/3/library/socket.html#socket-families
> 
> "A pair (host, port) is used for the AF_INET address family, where host is
> a string representing either a hostname in Internet domain notation like '
> daring.cwi.nl' or an IPv4 address like '100.50.200.5', and port is an
> integer."
> 
> The docs seem to suggest that I am actually limited only to integers here.
> Do you have an example of using a string for a port number? I have to admit
> I am not well acquainted with it.

QEMU uses getaddrinfo() at inet_parse_connect_saddr() to translate the
string/string pair to a socket address.

Python equivalent:

>> socket.getaddrinfo('localhost', 'ssh')
[(<AddressFamily.AF_INET6: 10>, <SocketKind.SOCK_STREAM: 1>, 6, '', ('::1', 22, 0, 0)), (<AddressFamily.AF_INET6: 10>, <SocketKind.SOCK_DGRAM: 2>, 17, '', ('::1', 22, 0, 0)), (<AddressFamily.AF_INET6: 10>, <SocketKind.SOCK_STREAM: 1>, 132, '', ('::1', 22, 0, 0)), (<AddressF
amily.AF_INET6: 10>, <SocketKind.SOCK_SEQPACKET: 5>, 132, '', ('::1', 22, 0, 0)), (<AddressFamily.AF_INET: 2>, <SocketKind.SOCK_STREAM: 1>, 6, '', ('127.0.0.1', 22)), (<AddressFamily.AF_INET: 2>, <SocketKind.SOCK_DGRAM: 2>, 17, '', ('127.0.0.1', 22)), (<AddressFamily.AF_INE
T: 2>, <SocketKind.SOCK_STREAM: 1>, 132, '', ('127.0.0.1', 22)), (<AddressFamily.AF_INET: 2>, <SocketKind.SOCK_SEQPACKET: 5>, 132, '', ('127.0.0.1', 22))]

Translating this to the correct arguments to socket.socket() and
socket.socket.connect() seems overly complicated, though.

-- 
Eduardo


