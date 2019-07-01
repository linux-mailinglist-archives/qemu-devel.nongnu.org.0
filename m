Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9384E2D8AF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 11:10:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50337 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVubP-00025a-PW
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 05:10:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48958)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVuaO-0001mX-6G
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:09:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hVuaM-0004hX-98
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:09:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hVuaM-0004h0-3m
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:09:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F06F68831E
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 09:09:19 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E325D784;
	Wed, 29 May 2019 09:09:15 +0000 (UTC)
Date: Wed, 29 May 2019 10:09:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190529090912.GC2882@work-vm>
References: <20190523145840.11774-1-dgilbert@redhat.com>
	<20190523145840.11774-2-dgilbert@redhat.com>
	<87k1ehgm39.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k1ehgm39.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 29 May 2019 09:09:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] net/announce: Allow optional list of
 interfaces
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laine@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> writes:
> 
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Allow the caller to restrict the set of interfaces that announces are
> > sent on.  The default is still to send on all interfaces.
> >
> > e.g.
> >
> >   { "execute": "announce-self", "arguments": { "initial": 50, "max": 550, "rounds": 5, "step": 50, "ifaces": ["vn2","vn1"] } }
> >
> > Note: There's still only one timer for the qmp command, so that
> > performing an 'announce-self' on one list of interfaces followed
> > by another 'announce-self' on another list will stop the announces
> > on the existing set.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> [...]
> > diff --git a/qapi/net.json b/qapi/net.json
> > index 5f7bff1637..871cfa7405 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -706,7 +706,8 @@
> >    'data': { 'initial': 'int',
> >              'max': 'int',
> >              'rounds': 'int',
> > -            'step': 'int' } }
> > +            'step': 'int',
> > +            '*ifaces': ['str'] } }
> 
> QMP traditionally eschews abbreviations like "iface".

OK, renamed 'interfaces'

Dave

> >  
> >  ##
> >  # @announce-self:
> > @@ -718,9 +719,10 @@
> >  #
> >  # Example:
> >  #
> > -# -> { "execute": "announce-self"
> > +# -> { "execute": "announce-self",
> >  #      "arguments": {
> > -#          "initial": 50, "max": 550, "rounds": 10, "step": 50 } }
> > +#          "initial": 50, "max": 550, "rounds": 10, "step": 50,
> > +#          "ifaces": ["vn2","vn3"] } }
> >  # <- { "return": {} }
> >  #
> >  # Since: 4.0
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

