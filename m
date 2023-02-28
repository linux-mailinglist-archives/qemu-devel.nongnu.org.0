Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E16A5A08
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX08B-0007Q6-Ul; Tue, 28 Feb 2023 08:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX089-0007Om-Ky
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:34:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pX083-0008E0-2N
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677591289;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AuCK/12rqoa8bzo+vg7qWvEMiiaw5s5DCZFUm+V/ep8=;
 b=J/dc2ETWFtK9sMZH6hTn5VkcALWll/jz16W/q/X15mIoOmOdENN/GmfGP84MY1IJERZ74M
 CO8ipW5Im2RaxSEQt26SvrYAQf2rbuWwTQIemtNAHBpYbieI/4uH8ZkOqw5nv5UeBtAfU3
 EZGoI4RHFuHbkEkpPzkkFJS0bFuNxoY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-5CqE96AzPnyU8oI1ujw-pg-1; Tue, 28 Feb 2023 08:34:46 -0500
X-MC-Unique: 5CqE96AzPnyU8oI1ujw-pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D419A8828C0;
 Tue, 28 Feb 2023 13:34:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9117A43FBB;
 Tue, 28 Feb 2023 13:34:41 +0000 (UTC)
Date: Tue, 28 Feb 2023 13:34:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Message-ID: <Y/4C74k7QTuIwz7v@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
 <Y/36fmORLIjpldXn@redhat.com>
 <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 28, 2023 at 02:29:12PM +0100, Philippe Mathieu-Daudé wrote:
> On 28/2/23 13:58, Daniel P. Berrangé wrote:
> > On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 24/2/23 19:08, Alex Bennée wrote:
> > > > This series attempts to remove our dependence on the docker.py script
> > > > and build things directly with the appropriate tool. I've been
> > > > noodling around with how we build images on gitlab to see if they can
> > > > cache better because the normal case should be we don't need to
> > > > rebuild everything if the upstream distro hasn't updated its package
> > > > list.
> > > > 
> > > > Anyway what do people think?
> > > 
> > > Removing dind limitation is interesting.
> > > 
> > > Unrelated, can we tag registry.gitlab.com/qemu-project's
> > > docker images along with releases?
> > 
> > Can you elaborate on this ?
> > 
> > We're only using the images for CI purposes and they must always reflect
> > the current state of git master. We're using a fixed docker tag 'latest',
> > as that avoids the container registry growing arbitrarily large.
> > 
> > Our CI rules should prevent the pipelines running on stable branches,
> > so we shouldn't need container tags for stable.
> 
> I'm not suggesting keeping jobs to build, but doing a snapshot of the
> released containers.
> 
> I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
> it again. This is useful when bisecting pre-v8, but also to build pre-v8
> and do performance comparison. One shouldn't have to upgrade such
> container (in particular when package mirror disappear), since it
> already contains all we need.

The main risk with this is the impact on our storage quota. With the
OSS Program membership IIUC we get Ultimate level features which
is 250 GB of storage, across git repos, pipeline cache/artifacts/logs,
container registry.

Currently they have no way to enforce that since their accounting of
usage is not accurate enough. They're working on fixing that so at
somepoint we'll be subject to the 250 GB limit.

What I don't know is how much storage we're currently using across
the /qemu-project namespace, and what extra is implied by taking
a snapshot of our container registry 3 times a year. I'm expecting
it to probably be in the high 10's of GB though for the container
registry.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


