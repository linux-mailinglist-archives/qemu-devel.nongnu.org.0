Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF96372765
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:41:21 +0200 (CEST)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqcK-0002jd-E1
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ldqZt-0001OT-5N
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ldqZp-0005Dg-Af
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620117524;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+Q58dpgPacHikQSplFMBdjAR5od0VFE2VUEpdirUZA=;
 b=DZWc9kZnECxRRHh0waflN815KwNqg6g0Tbzl6VZTzdbh/7pLTnMGt5jMPlrk+exHCw53dO
 PKYva7wW6OwC3tI7lHMpxfRLr62mcMmo3RCuwRyJM+CN2+uA8c40Zi2Bvu8xOoiV+8WgCv
 cmeuLbvxvc43cO3oaJ1ChuzOBKufzPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-EhycuRrgN-u-sLieJJy3Qg-1; Tue, 04 May 2021 04:38:33 -0400
X-MC-Unique: EhycuRrgN-u-sLieJJy3Qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC19E100A24D;
 Tue,  4 May 2021 08:38:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A97C61156;
 Tue,  4 May 2021 08:38:28 +0000 (UTC)
Date: Tue, 4 May 2021 09:38:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Subject: Re: [PATCHv2 1/1] Support monitor chardev hotswap with QMP
Message-ID: <YJEIAfs4tNRN52K4@redhat.com>
References: <20210413213459.629963-1-li.zhang@cloud.ionos.com>
 <875z0m4733.fsf@dusky.pond.sub.org>
 <CAJ+F1CKFzgp=ndDER4p4v-_uz0gf0ydzYcxtay7Zz7wwUQUueg@mail.gmail.com>
 <CAJ+F1CLW1rCV1rnxxhtAMEoVttA+nbWetbQkd7C3G16NTR2NRw@mail.gmail.com>
 <87blad2v9x.fsf@dusky.pond.sub.org>
 <CAM9Jb+g0jUy5uEYmpu0nTYogRoDN1VZayLD_0xQ2ZZqB5tr21Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9Jb+g0jUy5uEYmpu0nTYogRoDN1VZayLD_0xQ2ZZqB5tr21Q@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Li Zhang <li.zhang@cloud.ionos.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Li Zhang <zhlcindy@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 08:29:50AM +0200, Pankaj Gupta wrote:
> +CC Danpb
> 
> > >>> Marc-André, I'd like your opinion for this one, in particular the use of
> > >>> g_source_remove().
> > >>>
> > >>
> > >> My opinion isn't really worth much, my review would have a bit more value.
> > >>
> > >> GSource has indeed some peculiar lifetime management, that I got wrong in
> > >> the past. So I would be extra careful.
> > >>
> > >> But before spending time on review, I would also clarify the motivation
> > >> and ask for testing.
> > >>
> > >> Markus, hot-adding/removing monitors isn't supported?
> > >>
> > >>
> > > I realize you answered my question below. That's surprising me. Wouldn't it
> > > make more sense to support it rather than having a pre-opened null-based
> > > monitor that can have its chardev swapped?
> >
> > Yes, it would.  Patches welcome.
> >
> > This patch is a somewhat ham-fisted and limited solution to the problem
> > stated in the commit message.  However, it might *also* be a reasonable
> > improvement to chardev-change on its own.  Not for me to judge.
> >
> > chardev-change comes with a number of restrictions.  Let's have a closer
> > look.  It fails
> >
> > 1. when no such character device exists (d'oh)
> >
> > 2. for chardev-mux devices
> >
> > 3. in record/replay mode
> >
> > 4. when a backend is connected that doesn't implement the chr_be_change()
> >    method
> >
> > 5. when chr_be_change() fails
> >
> > 6. when creating the new chardev fails[*]
> >
> > Items 2, 3, 4 are restrictions.  I figure 2 and 4 are simply not
> > implemented, yet.  I'm not sure about 3.
> >
> > Whether we want to accept patches lifting restrictions is up to the
> > chardev maintainers.
> 
> Maybe we can handle or already handle the restrictions at libvirt side?

From the libvirt side I'd just like to see the real problem addressed.
ie actally implement monitor hotplug/unplug, instead of this hack
where you pre-create a monitor with null backend.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


