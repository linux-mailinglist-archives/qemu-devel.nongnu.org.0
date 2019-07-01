Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6353C91A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 12:39:17 +0200 (CEST)
Received: from localhost ([::1]:56106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haeBR-0003SI-2a
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 06:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34921)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hae9a-0002Sj-8W
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:37:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hae9Z-0001cz-6V
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:37:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59816)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hae9Z-0001MU-0b
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 06:37:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B1703082A98
 for <qemu-devel@nongnu.org>; Tue, 11 Jun 2019 10:36:57 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4562460BEE;
 Tue, 11 Jun 2019 10:36:53 +0000 (UTC)
Date: Tue, 11 Jun 2019 11:36:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190611103650.GE2777@work-vm>
References: <20190610184402.7090-1-dgilbert@redhat.com>
 <20190610184402.7090-2-dgilbert@redhat.com>
 <272867fd-1a3a-3cc2-9774-0feb694cd773@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <272867fd-1a3a-3cc2-9774-0feb694cd773@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 11 Jun 2019 10:36:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 1/4] net/announce: Allow optional list
 of interfaces
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laine@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eric Blake (eblake@redhat.com) wrote:
> On 6/10/19 1:43 PM, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Allow the caller to restrict the set of interfaces that announces are
> > sent on.  The default is still to send on all interfaces.
> > 
> > e.g.
> > 
> >   { "execute": "announce-self", "arguments": { "initial": 50, "max": 550, "rounds": 5, "step": 50, "interfaces": ["vn2","vn1"] } }
> > 
> > This doesn't affect the behaviour of migraiton announcments.
> > 
> > Note: There's still only one timer for the qmp command, so that
> > performing an 'announce-self' on one list of interfaces followed
> > by another 'announce-self' on another list will stop the announces
> > on the existing set.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> 
> > +++ b/qapi/net.json
> > @@ -699,6 +699,9 @@
> >  #
> >  # @step: Delay increase (in ms) after each self-announcement attempt
> >  #
> > +# @interfaces: An optional list of interface names, which restrict the
> 
> restricts

Done

> > +#        announcment to the listed interfaces. (Since 4.1)
> 
> announcement

Done

> > +#
> >  # Since: 4.0
> >  ##
> >  
> > @@ -706,7 +709,8 @@
> >    'data': { 'initial': 'int',
> >              'max': 'int',
> >              'rounds': 'int',
> > -            'step': 'int' } }
> > +            'step': 'int',
> > +            '*interfaces': ['str'] } }
> >  
> >  ##
> >  # @announce-self:
> > @@ -718,9 +722,10 @@
> >  #
> >  # Example:
> >  #
> > -# -> { "execute": "announce-self"
> > +# -> { "execute": "announce-self",
> 
> Embarrassing that we didn't notice that one earlier.

The way to avoid it I guess would be to parse the example code.

> >  #      "arguments": {
> > -#          "initial": 50, "max": 550, "rounds": 10, "step": 50 } }
> > +#          "initial": 50, "max": 550, "rounds": 10, "step": 50,
> > +#          "interfaces": ["vn2","vn3"] } }
> 
> Worth a space after the comma? Not required, but I think it looks nicer.

Added

> As I only focused on doc issues, I'll leave the full review to others.

Thanks,

Dave

> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
> 



--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

