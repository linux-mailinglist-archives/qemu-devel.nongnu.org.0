Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6D25EE13E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:12:44 +0200 (CEST)
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZft-0005T2-Iy
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odZ1l-0000vX-Ry
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1odZ1b-0000sz-1t
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664379059;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkKlJGkQoCpm+3CPCA4+XR4A8rC+/6N5P4McUxbJ5VU=;
 b=h0WP4jUgN2R8Jf35izPqIcrHMGNL7z0yGMA6gQvh1NLHk8iP5mK2Fou8wN36PWQa34Iadi
 6nz0XlipDlFMS6a+qYy9hsQ0XA2/MJnQpSv1FZSeK/YvITqwd95uD9V8dnxHQI59P0aPXn
 xlxwX0L3rrXWn+09nYhmvTlOZEVHqEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-EEPs4vkTOEKWPvLcX90weg-1; Wed, 28 Sep 2022 11:30:57 -0400
X-MC-Unique: EEPs4vkTOEKWPvLcX90weg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B906B882827;
 Wed, 28 Sep 2022 15:30:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 146D9C15BA4;
 Wed, 28 Sep 2022 15:30:47 +0000 (UTC)
Date: Wed, 28 Sep 2022 16:30:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Ani Sinha <ani@anisinha.ca>, Bandan Das <bsd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Coiby Xu <Coiby.Xu@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
Message-ID: <YzRopeuYNDFBI7AO@redhat.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
 <4cb2dea7-6c3d-4b4c-647d-979889bddc9c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cb2dea7-6c3d-4b4c-647d-979889bddc9c@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 28, 2022 at 05:24:56PM +0200, Thomas Huth wrote:
> On 28/09/2022 12.31, Thomas Huth wrote:
> > On 27/09/2022 13.05, Bin Meng wrote:
> > > In preparation to adding virtio-9p support on Windows, this series
> > > enables running qtest on Windows, so that we can run the virtio-9p
> > > tests on Windows to make sure it does not break accidently.
> > 
> > Thanks for your patches - I've picked many of them for my pull request
> > that I sent out earlier today, so you don't have to carry them along
> > anymore once the PR got merged.
> > 
> > For the patches that are not directly related to tests/ ... could you
> > maybe ask the corresponding maintainers to pick those up? I'm not sure
> > whether they should go through my testing branch, too...
> > 
> > Anyway, there seems to be one more issue: The migration test sometimes
> > seems to be failing on aarch64 with all your patches applied:
> > 
> > 87/470 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
> > ERROR          261.71s   killed by signal 6 SIGABRT
> >  >>> MALLOC_PERTURB_=171 QTEST_QEMU_BINARY=./qemu-system-aarch64
> > QTEST_QEMU_IMG=./qemu-img
> > G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh
> > QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> > /home/thuth/tmp/qemu-build/tests/qtest/migration-test --tap -k
> > ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> > stderr:
> > **
> > ERROR:../../devel/qemu/tests/qtest/migration-helpers.c:205:wait_for_migration_status:
> > assertion failed: (g_test_timer_elapsed() <
> > MIGRATION_STATUS_WAIT_TIMEOUT)
> > ../../devel/qemu/tests/qtest/libqtest.c:201: kill_qemu() tried to
> > terminate QEMU process but encountered exit status 1 (expected 0)
> > 
> > (test program exited with status code -6)
> > ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> > 
> > Not sure whether it's really related to your patches or whether it's
> > something else that has been merged recently, I'm having problems to
> > reproduce it reliably, but it's definitely something we should keep an
> > eye on...
> 
> Seems like somebody also ran into this issue with a vanilla QEMU:
> 
>  https://gitlab.com/qemu-project/qemu/-/issues/1230
> 
> So it's not related to your patch series.

This status timeout was something we merged in last cycle. We've
long had wierd hangs in the migration tests and this timeout change
was an attempt to turn the test suite hangs into explicit failures
for greater visibility. I guess this is working as intended, but
we're not really closer to understanding what the root problem is
we're hitting.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


