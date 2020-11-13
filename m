Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D642B1BC6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:22:16 +0100 (CET)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZ1r-00050t-JH
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:22:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdZ0F-0004Sv-BU
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:20:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdZ0C-000334-Nf
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605273631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dqLia43OEXo9fxmLPSN3UFv/I8ItLN4YL6Dbn67mWA=;
 b=EAUlv5uDOnvPGrLwWZIMBC4OOGohMwD1CU4UKqsdOFTfeWMOupbwWPdEwJI6A15z7jLno7
 bZwMBqCzJa0HSpkCsKdvbJ3vetIyD3mWrZmCX/qOnzVzV7APa9ydNRaPN3NwTkTRmpIjjc
 C83KtGvoT8R+pqig73V1mKm+odMzykY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-UJSnO0ZOP3yikN_XHZOnSA-1; Fri, 13 Nov 2020 08:20:28 -0500
X-MC-Unique: UJSnO0ZOP3yikN_XHZOnSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A3726D246
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 13:20:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 607E660BE2;
 Fri, 13 Nov 2020 13:20:23 +0000 (UTC)
Date: Fri, 13 Nov 2020 14:20:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 08/13] char: Add mux option to ChardevOptions
Message-ID: <20201113132021.GE5834@merkur.fritz.box>
References: <20201112175905.404472-1-kwolf@redhat.com>
 <20201112175905.404472-9-kwolf@redhat.com>
 <f2f96454-5cbf-ae74-25dc-4d509a88faf4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f2f96454-5cbf-ae74-25dc-4d509a88faf4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.11.2020 um 12:50 hat Paolo Bonzini geschrieben:
> On 12/11/20 18:59, Kevin Wolf wrote:
> > The final missing piece to achieve compatibility between
> > qemu_chr_parse_cli_str()/qemu_chr_new_cli() and the legacy command line
> > is support for the 'mux' option. Implement it.
> > 
> > Signed-off-by: Kevin Wolf<kwolf@redhat.com>
> > ---
> >   qapi/char.json |  4 +++-
> >   chardev/char.c | 41 +++++++++++++++++++++++++++++++++++------
> >   2 files changed, 38 insertions(+), 7 deletions(-)
> > 
> > diff --git a/qapi/char.json b/qapi/char.json
> > index e1f9347044..d6733a5473 100644
> > --- a/qapi/char.json
> > +++ b/qapi/char.json
> > @@ -453,12 +453,14 @@
> >   #
> >   # @id: the chardev's ID, must be unique
> >   # @backend: backend type and parameters
> > +# @mux: enable multiplexing mode (default: false)
> >   #
> >   # Since: 6.0
> >   ##
> >   { 'struct': 'ChardevOptions',
> >     'data': { 'id': 'str',
> > -            'backend': 'ChardevBackend' },
> > +            'backend': 'ChardevBackend',
> > +            '*mux': 'bool' },
> >     'aliases': [ { 'source': ['backend'] } ] }
> 
> I think this shows that -chardev and chardev-add are both kind of
> unrepairable.  The right way to do a mux with a serial and monitor on
> top should be explicit:
> 
>             stdio
>                ↑
>          mux-controller
>           ↑        ↑
>          mux      mux
>           ↑        ↑
>        serial   monitor
> 
> 	-object chardev-stdio,id=stdio
> 	-object chardev-mux-controller,id=mux,backend=stdio
> 	-object chardev-mux,id=serial-chardev,controller=mux
> 	-object chardev-mux,id=mon-chardev,controller=mux
> 	-serial chardev:serial-chardev
> 	-monitor chardev:mon-chardev

I don't think these "mux" chardevs plugged to a "mux-controller"
actually exist, at least today. You can directly plug serial and monitor
to a mux chardev that sits on top of stdio.

This is the current syntax for explicitly configuring things:

    -chardev stdio,id=stdio
    -chardev mux,chardev=stdio,id=mux
    -mon chardev=mux
    -serial chardev:mux

And of course this is still possible after my series, and it is what
management tools should be using.

> Adding automagic "mux" creation to -chardev is wrong.

I'm not really adding it, it's already there.

While the code is temporarily duplicated and it looks like an addition
here, at the end of the series it's effectively just some preexisting
code moved (and QAPIfied) from qemu_chr_new_from_opts().

Of course, we can deprecate it, but I don't think it's really in the way
because it just desugars to two normal chardev definitions. On the other
hand, I've never used it (apart from testing this patch), so I don't
really care in practice if it exists or not.

> I don't entirely object to the series since it's quite nice, but I see
> it as more of a cleanup than the final stage.  It hinges on what
> Markus thinks of aliases, I guess.

Yes, I completely agree that this is mostly a cleanup. Most QAPIfication
actually is, because QemuOpts and hand written parsers do work and we
have been successfully using them for years. They just work in less
consistent ways and take a bit more code.

I never said it has to be the final stage, but I think whatever the
final stage is, having external interfaces that are consistent and use
the QAPI schema as the one source of truth will be helpful.

This is basically what I meant when I said your QOM conversion and my
QAPIfication work aren't conflicting (conceptually), but addressing
separate problems.

Kevin


