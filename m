Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64175AEE53
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 17:06:35 +0200 (CEST)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVa9q-00048v-MB
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 11:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVZ5K-0002wy-4R
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVZ5G-0005LI-KK
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 09:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662472665;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cG9nfLFO2S2Tj8C/iBnbuZqajJRnPD9paiXiXx0XAuk=;
 b=T/J61BiTgG8GKjO+NVLYMTzlUUaOGrheDeKGflzQczur/5TGG2iij16bLIOP8Z9jcVqXwf
 lYnzfsbclEWlZEZdx4H62Z/9FAiNI6OP3f8DMUXFv0fOAp5MrAEh/NjcLvl+T+IFnl9v8/
 5VwaYDcHpylrZ4ioudDzUUBCzDmvcOc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-wE7uCIXgOGahLCzkIzgsrA-1; Tue, 06 Sep 2022 09:57:41 -0400
X-MC-Unique: wE7uCIXgOGahLCzkIzgsrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54C6785A589;
 Tue,  6 Sep 2022 13:57:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8071D4C816;
 Tue,  6 Sep 2022 13:57:40 +0000 (UTC)
Date: Tue, 6 Sep 2022 14:57:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: sphinx-build is really slow, any way to improve that?
Message-ID: <YxdR0W0rFoBjkYcI@redhat.com>
References: <53b94520-f02b-aef5-b372-0460531b566f@suse.de>
 <CAFEAcA_ed-ny6eodA=9fK6Y5WpUaRO0jPfbKHYCB6uLikiyiHQ@mail.gmail.com>
 <Yxb86Fz8XVW3uW1p@redhat.com>
 <CAFEAcA8DZZe2XKntbrg2mOrmWmepPAVvgBKTvO9vMAE2tVq2hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA8DZZe2XKntbrg2mOrmWmepPAVvgBKTvO9vMAE2tVq2hg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Sep 06, 2022 at 02:41:13PM +0100, Peter Maydell wrote:
> On Tue, 6 Sept 2022 at 08:55, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Sep 05, 2022 at 10:21:55PM +0100, Peter Maydell wrote:
> > > On Mon, 5 Sept 2022 at 20:51, Claudio Fontana <cfontana@suse.de> wrote:
> > > > when I build qemu, there is a lot of time spent at the end of the build where one cpu goes 100% on sphinx-build.
> > > >
> > > > Is there some way to parallelize that? It seems it is the current bottleneck for rebuilds for me..
> > >
> > > It's a big fat python program, so I suspect not, but
> > > maybe I'm wrong.
> >
> > It annoys me too and I've had a look at what it is doing in the past and
> > failed to find an obvious way to improve it. I fear this could be an
> > inherant limitation of the way we use sphinx to build the docs as a
> > complete manual, as compared to say treating each docs source file as
> > a distinct standalone web page.
> 
> IIRC sphinx really really wants to process the whole document tree
> in one go. You can see this in the way that for example the
> HTML build process creates HTML files for the top-level rst
> files that are supposed to be only for the manpage -- it will
> suck in and process everything, not just the files reachable
> via whatever top level file you point it at.

Yeah, thats why I think we're limited by what sphinx upstream can do
for us. They need to be able to parallelize stuff in their loading
and generation code.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


