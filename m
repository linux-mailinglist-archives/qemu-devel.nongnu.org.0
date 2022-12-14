Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9164C809
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 12:32:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Pz4-0002Kj-97; Wed, 14 Dec 2022 06:31:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5Pyl-0002JM-LL
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5Pyj-00062O-Tx
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:31:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671017472;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4J58rsfRVQad+uxiP3edDoD9MOaylfdRXUM/Lyi50Ro=;
 b=XXsUGzArLMAeyyJ3nqjLNYexprQX6Os9nDKpF1OSLG2CHat5C3tM7D8/SOejkjGtv8EI7X
 g9fhS2QIax8KCvxTY+7KOwm3Oe5VFsAFzwMTibBCfcLdIEfcqKDLQZI23kJIcnLqDSlhHJ
 7jZwjnk4GZNb/q5Q6Evk0l2IRfWdpGM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-vKl1k4tGOD2YgPFO3Zx5-g-1; Wed, 14 Dec 2022 06:31:09 -0500
X-MC-Unique: vKl1k4tGOD2YgPFO3Zx5-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B66A1871CDB;
 Wed, 14 Dec 2022 11:31:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FF3F79A1;
 Wed, 14 Dec 2022 11:31:08 +0000 (UTC)
Date: Wed, 14 Dec 2022 11:31:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] tpm: add backend for mssim
Message-ID: <Y5mz96wJN9+nxLs8@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <bbe14f32fcf19ba4c800953c7db6486a340d5b14.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbe14f32fcf19ba4c800953c7db6486a340d5b14.camel@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 12, 2022 at 05:06:05PM -0500, James Bottomley wrote:
> On Mon, 2022-12-12 at 15:47 +0000, Daniel P. Berrangé wrote:
> > Copy'ing Markus for QAPI design feedback.
> > 
> > On Sat, Dec 10, 2022 at 12:10:18PM -0500, James Bottomley wrote:
> [...]
> > > +##
> > > +# @TPMmssimOptions:
> > > +#
> > > +# Information for the mssim emulator connection
> > > +#
> > > +# @host: host name or IP address to connect to
> > > +# @port: port for the standard TPM commands
> > > +# @ctrl: control port for TPM state changes
> > > +#
> > > +# Since: 7.2.0
> > > +##
> > > +{ 'struct': 'TPMmssimOptions',
> > > +  'data': {
> > > +      'host': 'str',
> > > +      'port': 'str',
> > > +      'ctrl': 'str' },
> > > +  'if': 'CONFIG_TPM' }
> > 
> > We don't want to be adding new code using plain host/port combos,
> > as that misses extra functionality for controlling IPv4 vs IPv6
> > usage.
> > 
> > The existing 'emulator' backend references a chardev, but I'm
> > not especially in favour of using the chardev indirection either,
> > when all we should really need is a SocketAddress
> > 
> > IOW, from a QAPI design POV, IMHO the best practice would be
> > 
> >  { 'struct': 'TPMmssimOptions',
> >    'data': {
> >        'command': 'SocketAddress',
> >        'control': 'SocketAddress' },
> >    'if': 'CONFIG_TPM' }
> > 
> > 
> > The main wrinkle with this is that exprssing nested struct fields
> > with QemuOpts is a disaster zone, and -tpmdev doesn't yet support
> > JSON syntax.
> > 
> > IMHO we should just fix the latter problem, as I don't think it
> > ought to be too hard. Probably a cut+paste / search/replace job
> > on the chanmge we did for -device in:
> > 
> >   commit 5dacda5167560b3af8eadbce5814f60ba44b467e
> >   Author: Kevin Wolf <kwolf@redhat.com>
> >   Date:   Fri Oct 8 15:34:42 2021 +0200
> > 
> >     vl: Enable JSON syntax for -device
> > 
> > This would mean we could use plain -tpmdev for a local instance
> > 
> >    -tpmdev mssim,id=tpm0 \
> >     -device tpm-crb,tpmdev=tpm0 \
> > 
> > but to use a remote emulator we would use
> > 
> >     -tpmdev "{'backend': 'mssim', 'id': 'tpm0',
> >               'command': {
> >                  'type': 'inet',
> >                  'host': 'remote',
> >                  'port': '4455'
> >                },
> >               'control': {
> >                  'type': 'inet',
> >                  'host': 'remote',
> >                  'port': '4456'
> >                }}"
> > 
> > (without the whitepace/newlines, which i just used for sake of
> > clarity)
> 
> Just on this, might it not be easier for the commandline to do what
> gluster does?  just use the '.' as a separator and subqdict extraction,
> so you'd specify
> 
> -tpmdev mssim,id=tpm0,command.type=inet,command.host=remote,command.port=4455,control.type=inet,control.host=remote,control.port=4456
> 
> With the added bonus that X.type could be defaulted to inet and
> control.host could follow command.host and so on?

These days, we have a policy of not tyring to map nested data onto the
flat QemuOpts. This has been done in several areas and we've ended up
with a mess of ever so slightly different impls each with their own
flaws. This is why our preferred approach these days is to add support
for JSON syntax to enable non-flat config.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


