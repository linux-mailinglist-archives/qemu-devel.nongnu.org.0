Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED761D1073
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:03:19 +0200 (CEST)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpAU-0005Pc-Ho
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jYp1g-0001BP-EC
 for qemu-devel@nongnu.org; Wed, 13 May 2020 06:54:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35364
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jYp1f-0000SU-3m
 for qemu-devel@nongnu.org; Wed, 13 May 2020 06:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589367250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqJXiN+PdfS8xromZICVfI+F4lLOy/cM/pAkimnUkFo=;
 b=XXkygtHwxKOcoFtd0ALmfpmUCj8ZjB+H+Y/QM7Uwwy6SQfHmC4jTk69ARbYEn6uoxkq90Z
 wpv07Lgmzo7VaFJM7ELOoWO3YS5ovcupbMvVoyZz/KetLjs5J73bycUiQZssP2I2ijT0CQ
 swjth0Ka4bzNyymbExNtM8+h1TJnPhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-IU6NwSJIMriJ87seo_IpFg-1; Wed, 13 May 2020 06:54:08 -0400
X-MC-Unique: IU6NwSJIMriJ87seo_IpFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 018DC1054F91;
 Wed, 13 May 2020 10:54:07 +0000 (UTC)
Received: from work-vm (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D19B10023A6;
 Wed, 13 May 2020 10:54:02 +0000 (UTC)
Date: Wed, 13 May 2020 11:53:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 0/5] Introduce 'yank' oob qmp command to recover from
 hanging qemu
Message-ID: <20200513105359.GF3225@work-vm>
References: <cover.1589193717.git.lukasstraub2@web.de>
 <20200511114947.GJ1135885@redhat.com>
 <20200511120718.GD2811@work-vm>
 <20200511121714.GL1135885@redhat.com>
 <20200511154645.GI2811@work-vm> <20200512113206.62836e44@luklap>
 <20200512094337.GK1191162@redhat.com>
 <20200513103245.GD6202@linux.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200513103245.GD6202@linux.fritz.box>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 03:05:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_HK_NAME_DR=0.01 autolearn=_AUTOLEARN
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> Am 12.05.2020 um 11:43 hat Daniel P. Berrangé geschrieben:
> > On Tue, May 12, 2020 at 11:32:06AM +0200, Lukas Straub wrote:
> > > On Mon, 11 May 2020 16:46:45 +0100
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > 
> > > > * Daniel P. BerrangÃ© (berrange@redhat.com) wrote: 
> > > > > ...
> > > > > That way if QEMU does get stuck, you can start by tearing down the
> > > > > least distruptive channel. eg try tearing down the migration connection
> > > > > first (which shouldn't negatively impact the guest), and only if that
> > > > > doesn't work then, move on to tear down the NBD connection (which risks
> > > > > data loss)  
> > > > 
> > > > I wonder if a different way would be to make all network connections
> > > > register with yank, but then make yank take a list of connections to
> > > > shutdown(2).
> > > 
> > > Good Idea. We could name the connections (/yank callbacks) in the
> > > form "nbd:<node-name>", "chardev:<chardev-name>" and "migration"
> > > (and add "netdev:...", etc. in the future). Then make yank take a
> > > list of connection names as you suggest and silently ignore connections
> > > that don't exist. And maybe even add a 'query-yank' oob command returning
> > > a list of registered connections so the management application can do
> > > pattern matching if it wants.
> 
> I'm generally not a big fan of silently ignoring things. Is there a
> specific requirement to do it in this case, or can management
> applications be expected to know which connections exist?
> 
> > Yes, that would make the yank command much more flexible in how it can
> > be used.
> > 
> > As an alternative to using formatted strings like this, it could be
> > modelled more explicitly in QAPI
> > 
> >   { 'struct':  'YankChannels',
> >     'data': { 'chardev': [ 'string' ],
> >               'nbd': ['string'],
> > 	      'migration': bool } }
> > 
> > In this example, 'chardev' would accept a list of chardev IDs which
> > have it enabled, 'nbd' would accept a list of block node IDs which
> > have it enabled, and migration is a singleton on/off.
> 
> Of course, it also means that the yank code needs to know about every
> single object that supports the operation, whereas if you only have
> strings, the objects could keep registering their connection with a
> generic function like yank_register_function() in this version.
> 
> I'm not sure if the additional complexity is worth the benefits.

I tend to agree; although we do have to ensure we either use an existing
naming scheme (e.g. QOM object names?) or make sure we've got a well
defined list of prefixes.

Dave

> 
> > The benefit of this modelling is that you can introspect QEMU
> > to discover what classes of channels support being yanked by
> > this QEMU build, as well as what instances are configured to
> > be yanked. ie you can distinguish between a QEMU that doesn't
> > support yanking network devices, from a QEMU that does support
> > yanking network devices, but doesn't have it enabled for any
> > network device instances.
> 
> This is true, though I think Lukas' suggestion with query-yank should be
> as good in practice (you can't check before creating the NBD device
> then, but would you actually want to do this?).
> 
> And if all else fails, we can still add a few more feature flags to the
> schema...
> 
> Kevin
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


