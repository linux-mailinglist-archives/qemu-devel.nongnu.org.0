Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81E151BFB0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 14:44:45 +0200 (CEST)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmaqa-0001o0-UO
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 08:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmafs-000276-5M
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:33:40 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmafp-0004h3-0p
 for qemu-devel@nongnu.org; Thu, 05 May 2022 08:33:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651754015;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vd/8/s1xVQHiqDGw35XC/0dAK5lApFYPNCLJrvhOY9U=;
 b=H5QOwrTadOof6xccs9JZDc+P9a2CEQbTFTAx01DSsIjA1zaaZxH2S3wu0oYqMw/vyh/Rsm
 9V0nAzX/+a3rIPDhrT2YYtisOVrIGvQWlDN31dj3GhW1aYe3K2Dxw81ac2YbBGxPHCMZjC
 9ocGNfAaZAg66DioPUEZBiI/X6qfrf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-cdHWXjsnPrqWQYu7QFI78Q-1; Thu, 05 May 2022 08:33:34 -0400
X-MC-Unique: cdHWXjsnPrqWQYu7QFI78Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A051811E75;
 Thu,  5 May 2022 12:33:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0255FC27E97;
 Thu,  5 May 2022 12:33:32 +0000 (UTC)
Date: Thu, 5 May 2022 13:33:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: iotests and python dependencies
Message-ID: <YnPEGrwa9KVyup6T@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
 <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, May 05, 2022 at 08:08:42AM -0400, John Snow wrote:
> On Thu, May 5, 2022, 4:09 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Wed, May 04, 2022 at 03:38:45PM -0400, John Snow wrote:
> > > Howdy!
> > >
> > > So, I want to finally delete python/qemu/qmp from qemu.git, and this
> > > creates a small problem -- namely, iotests needs access to it in order
> > > to run the python-based tests.
> > >
> > > What I think needs to happen is that we create a virtual environment
> > > that installs python/qemu/. The reason this cannot be done with
> > > PYTHONPATH alone anymore is because the qmp package itself won't be
> > > there anymore, we need an installer like `pip` to actually fetch it
> > > for us and put it somewhere. (i.e., we need to process the
> > > dependencies of python/qemu now and can't treat it as a pre-installed
> > > location.)
> >
> > Having pip fetch it on the fly creates a problem for RPM builds,
> > because the koji build env has no network access. We will, however,
> > have an RPM of python-qemu-qmp installed on the host system though.
> > IOW we need to be able to run iotests using system python and its
> > installed libs, not a virtual env.  So if we do anything with a
> > virtual env, it will need to be optional I believe.
> >
> 
> Hm, do we need iotests during an rpm build? Is it because of "make check"?

Yes, and this is good, because it prevents us from outputting an
RPM build that has a broken QEMU in it. 

> It's possible to create a venv and run pip in no-network mode, too. If the
> package we want is installed on the system or otherwise in pip's cache,
> it'll succeed without network. If the dependencies require a qemu.qmp
> that's too new, the pip install will just fail instead.
> 
> I have to test a way to craft a pip statement that's network *optional*
> though. i.e. try to fetch and fall back to local otherwise. I think it's
> worth trying to keep the environment setup code unified, and always use a
> venv.

As long as it is no-network, that's good enough.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


