Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA936B3A5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:57:53 +0200 (CEST)
Received: from localhost ([::1]:49334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0oC-0002e5-05
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lb0nN-00027O-6D
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lb0nI-0006CI-EB
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619441813;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hmzmh+c2sdvX7a9qaEc8dNpAzXlV7tj57Xh5aFswm0=;
 b=P5co/9O5jTcEsh7Lt6n0yH8HEPf4KqDo8mdCe+xAMKltBRjmJIj+7AbjTqxvbiz7JyTnI4
 VesWyZF0dxX0jcnof1sowOLSyLj9VIdJctSxZwpJl6g3YE51f7gDLZW2kbe4AAvyMvadEi
 1ENv0Fp2RXjY00HU6aWCeecaAOGL8Wc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-0aTFzX9ZOmqPOJoxJx9pkg-1; Mon, 26 Apr 2021 08:56:50 -0400
X-MC-Unique: 0aTFzX9ZOmqPOJoxJx9pkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED6751009E27;
 Mon, 26 Apr 2021 12:56:48 +0000 (UTC)
Received: from redhat.com (ovpn-113-42.ams2.redhat.com [10.36.113.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B214310016DB;
 Mon, 26 Apr 2021 12:56:43 +0000 (UTC)
Date: Mon, 26 Apr 2021 13:56:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <YIa4iGzTl+ecfbzH@redhat.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth> <YIL0Ehmfgc1J9Ci9@redhat.com>
 <20210423185408.6d5d14f0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210423185408.6d5d14f0@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Ralph Schmieder <ralph.schmieder@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 06:54:08PM +0200, Stefano Brivio wrote:
> On Fri, 23 Apr 2021 17:21:38 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > The current IP socket impl for the net socket backend uses SOCK_DGRAM,
> > so from a consistency POV it feels sensible todo the same for UNIX
> > sockets too.
> 
> That's just for UDP though -- it also supports TCP with the "connect="
> parameter, and given that a stream-oriented AF_UNIX socket behaves very
> similarly, I recycled that parameter and just extended that bit of
> documentation.
> 
> > None the less, your last point in particular about wanting to know
> > about disconnects feels valid, and if its useful to you for UNIX
> > sockets, then it ought to be useful for IP sockets too.
> > 
> > IOW, I wonder if  we should use DGRAM for UNIX sockets too by default
> > to match current behaviour, but then also add a CLI option that allows
> > choice of DGRAM vs STREAM, and wire that up for IP & UNIX sockets.
> 
> The choice would only apply to AF_UNIX (that is, not to TCP and UDP).
> 
> The current situation isn't entirely consistent, because for TCP you
> have "connect=", for UDP it's "udp=" or "mcast=", and I'm extending the
> "connect=" case to support stream-oriented AF_UNIX, which I think is
> consistent.
> 
> However, to have it symmetric for the datagram-oriented case
> (UDP and AF_UNIX), ideally it should be changed to
> "dgram=host:port|path" -- which I guess we can't do.
> 
> I see two alternatives:
> 
> 1.
>   - "connect=" (TCP only)
>   - "unix=path,type=dgram|stream"
>   - "udp=" (UDP only)

This doesn't work when you need the UNIX server to be a
listener socket, as we've no way to express that, without
adding yet another parameter.

> 2.
>   - "connect=" (TCP and AF_UNIX stream)
>   - "unix_dgram="
>   - "udp=" (UDP only)

Also needs

   "listen=" (TCP and AF_UNIX stream)

"udp" has a corresponding optional "localaddr" for the sending
address.

Also overloading "connect" means we have to parse the value
to guess whether its a UNIX path or a IP addr:port pair.

I doubt people will have UNIX paths called "127.0.0.1:3333"
but if we can avoid such ambiguity by design, it is better.

> The major thing I like of 2. is that we save some code and a further
> option, but other than that I don't have a strong preference.

The pain we're feeling is largely because the design of the net
option syntax is one of the oldest parts of QEMU and has only
been very partially improved upon. It is certainly not using
QAPI best practice, if we look at this:

  { 'struct': 'NetdevSocketOptions',
    'data': {
      '*fd':        'str',
      '*listen':    'str',
      '*connect':   'str',
      '*mcast':     'str',
      '*localaddr': 'str',
      '*udp':       'str' } }

Then some things come to mind

 - We're not provinding a way to say what kind of "fd" is
   passed in - is it a UDP/TCP FD, is it a listener or
   client FD, is it unicast or multicast FD. Though QEMU
   can interogate the socket to discover this I guess.

 - All of the properties there except "fd" are encoding two values
   in a single property - address + port. This is an anti-pattern

 - No support for ipv4=on|off and ipv6=on|off flags to control
   dual-stack usage.

 - Redundancy of separate parameters for "mcast" and "udp" when
   it is distinguishable based on the address given AFAIR.

 - No support for UNIX sockets


The "right" way to fix most of this long term is a radical change
to introduce use of the SocketAddress struct.

I could envisage something like this

  { 'enum': 'NetdevSocketMode',
    'data':  ['dgram', 'client', 'server'] }

  { 'struct': 'NetdevSocketOptions',
    'data': {
      'addr':      'SocketAddress',
      '*localaddr': 'SocketAddress',
      '*mode':      'NetdevSocketMode' } }


 - A TCP client

      addr.type = inet
      addr.host = 192.168.1.1
      mode = client

 - A TCP server on all interfaces

      addr.type = inet
      addr.host = 
      mode = server

 - A TCP server on a specific interface

      addr.type = inet
      addr.host = 192.168.1.1
      mode = server

 - A TCP server on all interfaces, without IPv4

      addr.type = inet
      addr.host = 
      addr.has_ipv4 = true
      addr.ipv4 = false
      mode = server

 - A UDP unicast transport

      addr.type = inet
      addr.host = 192.168.1.1
      mode = dgram

 - A UDP unicast transport with local addr

      addr.type = inet
      addr.host = 192.168.1.1
      localaddr.type = inet
      localaddr.host = 192.168.1.2
      mode = dgram

 - A UDP multicast transport

     addr.type = inet
     addr.host = 224.0.23.166
     mode = dgram

 - A UNIX stream client

      addr.type = unix
      addr.path = /some/socket
      mode = client

 - A UNIX stream server

      addr.type = unix
      addr.path = /some/socket
      mode = server

 - A UNIX dgram transport

      addr.type = unix
      addr.path = /some/socket
      mode = dgram


Now, of course you're just interested in adding UNIX socket support.

This design I've outlined above is very much "boiling the ocean".
Thus I'm not requesting you implement this, unless you have a strong
desire to get heavily involved in some QEMU refactoring work.

The key question is whether we try to graft UNIX socket support onto
the existing args ("connect"/"listen") or try to do something more
explicit.

Given the desire to have both dgram + stream support, I'd be inclined
to do something more explicit, that's slightly more aligned with a
possible future best praactice QAPI design


IOW, we could take a simplified variant of the above as follows:


  { 'enum': 'NetdevSocketMode',
    'data':  ['dgram', 'client', 'server'] }

  { 'struct': 'NetdevSocketOptions',
    'data': {
      '*fd':        'str',
      '*listen':    'str',
      '*connect':   'str',
      '*mcast':     'str',
      '*localaddr': 'str',
      '*udp':       'str',
      '*path':      'str' } }
      '*localpath': 'str' } }


Cli examples:

 * Unix stream client

  -netdev socket,path=/wibble,mode=client


 * Unix stream server
 
  -netdev socket,path=/wibble,mode=server

 * Unix datagram 

  -netdev socket,path=/wibble,mode=dgram
  -netdev socket,path=/wibble,localpath=/fish,mode=dgram




Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


