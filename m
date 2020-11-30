Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1973E2C8B81
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 18:41:35 +0100 (CET)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnB7-0001n5-Gf
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 12:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjn6H-00089s-KS
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:36:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kjn6F-0003u2-HC
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 12:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606757789;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EK5KK6HTMrAvEMZyJnwV1NBumb5L5dn5AGOM6lDKcd8=;
 b=LAPldTLp8ezt4r2vR55PItKkAvwxZRim17C2PI2B7RRGFP+1ooBY1Yj3xQnMoNYs8A4tS2
 7fpbSWawLPBWJuTcj/sHDS3pdhlWY0vr9IbXKYE+6WK8r7hnjyv61nfDggkiYhkUKBwJ9Z
 xlu8QP8Vp6Pc/Uy6pnvwYTp8CWutb5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-cEWjqCzUNg-VoPdDHFnptQ-1; Mon, 30 Nov 2020 12:36:24 -0500
X-MC-Unique: cEWjqCzUNg-VoPdDHFnptQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1560F100A641;
 Mon, 30 Nov 2020 17:36:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-242.ams2.redhat.com [10.36.114.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CC525B4A7;
 Mon, 30 Nov 2020 17:36:20 +0000 (UTC)
Date: Mon, 30 Nov 2020 17:36:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: ImageInfo oddities regarding compression
Message-ID: <20201130173617.GJ2039965@redhat.com>
References: <87r1ofru4z.fsf@dusky.pond.sub.org>
 <20201127101405.GA1596141@redhat.com>
 <20201127103216.GA4736@merkur.fritz.box>
 <87ft4vq9c1.fsf@dusky.pond.sub.org>
 <20201127152534.GC4736@merkur.fritz.box>
 <87eeken3nq.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87eeken3nq.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Denis Plotnikov <dplotnikov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 05:52:09PM +0100, Markus Armbruster wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 27.11.2020 um 13:21 hat Markus Armbruster geschrieben:
> >> >> I fell down this (thankfully shallow) rabbit hole because we also have
> >> >> 
> >> >>     { 'enum': 'MultiFDCompression',
> >> >>       'data': [ 'none', 'zlib',
> >> >>                 { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> >> >> 
> >> >> I wonder whether we could merge them into a common type.
> >> 
> >> Looks like we could: current code would never report the additional
> >> value 'none'.  Introspection would show it, though.  Seems unlikely to
> >> cause trouble.  Observation, not demand.
> >
> > Forgot to comment on this one...
> >
> > Technically we could probably, but would it make sense? Support for
> > compression formats has to be implemented separately for both cases, so
> > that they currently happen to support the same list is more of a
> > coincidence.
> >
> > If we ever add a third compression format to qcow2, would we add the
> > same format to migration, too, or would we split the schema into two
> > types again?
> 
> I figure if a compression method is worth adding to one, it's probably
> worth adding to the other.

I'm not entirely sure about that, as compression algorithms have different
tradeoffs.

For migration compression we're streaming large volumes of data in a live
session, both compression and decompression speed is very important.

For qcow2 we're handling relative small discrete blocks (a qcow2
cluster at a time) and decompression speed is much more important that
compression speed, since we generally compress once out of band, and
decompress many times while live.

So we could see new compression methods desired for migration that are
not relevant for qcow2, or vica-verca.

> Having two separate enums isn't too bad.  A third has been proposed[*],
> but I hope we can reuse migration's existing enum there.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


