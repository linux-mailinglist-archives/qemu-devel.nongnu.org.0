Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16E568514
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:18:59 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o927W-0006Qr-Eu
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o924P-0003bf-7V
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:15:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o924M-0006Lf-9r
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657102541;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enIdt+XAWt6FU4WEmdNaHI7eQDjqzYqizLAFUYCt6qc=;
 b=Brt+Ono7/90bZd3iGANxUQiiJW9i65a2Uf9IoVR7UREQFrnoEpMrkNvaf3jI7f3Nj+82uz
 HmJ9/AWb9GO0Boo8Q2ywEEecJQxWfQu7Cn3Wz4r39yX1wsxOiRAQW2syfZP60NkC6MGGWp
 iDncXiEnsl8m/Iq7K79/QgeZaHfXdVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-0XlwXybONumKBiBU-lXHEg-1; Wed, 06 Jul 2022 06:15:32 -0400
X-MC-Unique: 0XlwXybONumKBiBU-lXHEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34A5D811E76;
 Wed,  6 Jul 2022 10:15:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DD4740CF8E7;
 Wed,  6 Jul 2022 10:15:28 +0000 (UTC)
Date: Wed, 6 Jul 2022 11:15:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alberto Garcia <berto@igalia.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
Message-ID: <YsVgvYXt967wscOA@redhat.com>
References: <20220702113331.2003820-1-afaria@redhat.com>
 <YsMVJLqNYmmpqjGc@redhat.com>
 <CAELaAXymGtALk+ZeMqWJX0mvj1_2p4MbaS4A+eY8V51KDNOddg@mail.gmail.com>
 <YsPlP6t0ALDkF4MU@redhat.com>
 <CAELaAXxdBvtxf2fXu1OxerBH+dTY_iti8CF-GMgGZpaWxgK_Gg@mail.gmail.com>
 <YsRi0SfAK3SVwQ2H@redhat.com>
 <CAELaAXz_xmBDQzCK3SdkryoAnynE0CRUBg4TNv6ZwntuenANkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAELaAXz_xmBDQzCK3SdkryoAnynE0CRUBg4TNv6ZwntuenANkA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 06, 2022 at 10:54:51AM +0100, Alberto Faria wrote:
> On Tue, Jul 5, 2022 at 5:12 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Tue, Jul 05, 2022 at 12:28:55PM +0100, Alberto Faria wrote:
> > > On Tue, Jul 5, 2022 at 8:16 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Overall I think a libclang based analysis tool will be useful, but
> > I can't see us enabling it as a standard part of 'make check'
> > given the time penalty.
> >
> >
> > Feels like something that'll have to be opt-in to a large degree
> > for regular contributors. In terms of gating CI though, it is less
> > of an issue, since we massively parallelize jobs. As long as we
> > have a dedicated build job just for running this static analysis
> > check in isolation, and NOT as 'make check' in all existing jobs,
> > it can happen in parallel with all the other build jobs, and we
> > won't notice the speed.
> >
> > In summary, I think this approach is viable despite the speed
> > penalty provided we dont wire it into 'make check' by default.
> 
> Agreed. Thanks for gathering these numbers.
> 
> Making the script use build dependency information, to avoid
> re-analyzing translation units that weren't modified since the last
> analysis, should make it fast enough to be usable iteratively during
> development. Header precompilation could also be worth looking into.
> Doing that + running a full analysis in CI should be good enough.

For clang-tidy, I've been trying it out integrated into emacs
via eglot and clangd. This means I get clang-tidy errors reported
interactively as I write code, so wouldn't need to run a full
tree analysis. Unfortunately, unless I'm missing something, there's
no way to extend clangd to plugin extra checks.  So it would need
to re-implement something equivalent to clangd for our custom checks,
and then integrate that into eglot (or equiv for other editors).


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


