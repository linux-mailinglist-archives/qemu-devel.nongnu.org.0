Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637D485563
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 16:06:07 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n57ra-0005Yv-G7
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 10:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n57hy-0004Fr-UT
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:56:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n57hw-0006TR-Bw
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641394567;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MwjPy4MIdFIVG5v9epn/tIirI7eyoHJO32Af3UI9wDM=;
 b=NJ8hYXQNEum2PqDKgzOXqIyWAHQaBebFf6fOdFwYAmJUbho/tls8ORhDfVRy9VRW0C1P2W
 yhQ+z4QcW9Lkbw5tijl5w1wWOOns/VuKMOyeEvzZi/VvIJIQJzlMxlgpVSoPdl8tq6BWos
 iWaq9+eCUYb3lAPrmj8/bSZ5YG2Eftc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-GZ58Mn0XNvWjXp8agmCexQ-1; Wed, 05 Jan 2022 09:56:01 -0500
X-MC-Unique: GZ58Mn0XNvWjXp8agmCexQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15E608031E6;
 Wed,  5 Jan 2022 14:55:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 454987DE22;
 Wed,  5 Jan 2022 14:55:38 +0000 (UTC)
Date: Wed, 5 Jan 2022 14:55:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 1/1] softmmu: fix device deletion events with -device
 JSON syntax
Message-ID: <YdWxZ0DYZT0zDuWP@redhat.com>
References: <20220105123847.4047954-1-berrange@redhat.com>
 <20220105123847.4047954-2-berrange@redhat.com>
 <a2a94c4c-190f-9be6-eadf-bd1404a2e272@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a2a94c4c-190f-9be6-eadf-bd1404a2e272@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 03:49:12PM +0100, Laurent Vivier wrote:
> On 05/01/2022 13:38, Daniel P. Berrangé wrote:
> > The -device JSON syntax impl leaks a reference on the created
> > DeviceState instance. As a result when you hot-unplug the
> > device, the device_finalize method won't be called and thus
> > it will fail to emit the required DEVICE_DELETED event.
> > 
> > A 'json-cli' feature was previously added against the
> > 'device_add' QMP command QAPI schema to indicated to mgmt
> > apps that -device supported JSON syntax. Given the hotplug
> > bug that feature flag is no unusable for its purpose, so
> 
> Not sure to understand: do you mean "now unusable"?

An application wants to known whether QEMU can support JSON
syntax with -device. If they look for the 'json-cli' feature
as a witness, they'll end up using JSON with QEMU 6.2 which
is giving them broken hotplug. This is unusable for any
non-trivial use cases. So we need a new witness to indicate
whether JSON is viable with -device, that only the newly
fixed QEMU will report.

> 
> > we add a new 'json-cli-hotplug' feature to indicate the
> > -device supports JSON without breaking hotplug.
> > 
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/802
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   qapi/qdev.json                 |  5 ++++-
> >   softmmu/vl.c                   |  4 +++-
> >   tests/qtest/device-plug-test.c | 19 +++++++++++++++++++
> >   3 files changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/qdev.json b/qapi/qdev.json
> > index 69656b14df..26cd10106b 100644
> > --- a/qapi/qdev.json
> > +++ b/qapi/qdev.json
> > @@ -44,6 +44,9 @@
> >   # @json-cli: If present, the "-device" command line option supports JSON
> >   #            syntax with a structure identical to the arguments of this
> >   #            command.
> > +# @json-cli-hotplug: If present, the "-device" command line option supports JSON
> > +#                    syntax without the reference counting leak that broke
> > +#                    hot-unplug
> >   #
> >   # Notes:
> >   #
> > @@ -74,7 +77,7 @@
> >   { 'command': 'device_add',
> >     'data': {'driver': 'str', '*bus': 'str', '*id': 'str'},
> >     'gen': false, # so we can get the additional arguments
> > -  'features': ['json-cli'] }
> > +  'features': ['json-cli', 'json-cli-hotplug'] }
> >   ##
> >   # @device_del:
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index d9e4c619d3..b1fc7da104 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -2684,6 +2684,7 @@ static void qemu_create_cli_devices(void)
> >       qemu_opts_foreach(qemu_find_opts("device"),
> >                         device_init_func, NULL, &error_fatal);
> >       QTAILQ_FOREACH(opt, &device_opts, next) {
> > +        DeviceState *dev;
> >           loc_push_restore(&opt->loc);
> >           /*
> >            * TODO Eventually we should call qmp_device_add() here to make sure it
> > @@ -2692,7 +2693,8 @@ static void qemu_create_cli_devices(void)
> >            * from the start, so call qdev_device_add_from_qdict() directly for
> >            * now.
> >            */
> > -        qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
> > +        dev = qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
> > +        object_unref(OBJECT(dev));
> >           loc_pop(&opt->loc);
> >       }
> >       rom_reset_order_override();
> > diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
> > index 559d47727a..ad79bd4c14 100644
> > --- a/tests/qtest/device-plug-test.c
> > +++ b/tests/qtest/device-plug-test.c
> > @@ -77,6 +77,23 @@ static void test_pci_unplug_request(void)
> >       qtest_quit(qtest);
> >   }
> > +static void test_pci_unplug_json_request(void)
> > +{
> > +    QTestState *qtest = qtest_initf(
> > +        "-device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'");
> > +
> > +    /*
> > +     * Request device removal. As the guest is not running, the request won't
> > +     * be processed. However during system reset, the removal will be
> > +     * handled, removing the device.
> > +     */
> > +    device_del(qtest, "dev0");
> > +    system_reset(qtest);
> 
> You can use qpci_unplug_acpi_device_test() to process the request... but I
> see this is done like that too in test_pci_unplug_request()
> 
> > +    wait_device_deleted_event(qtest, "dev0");
> > +
> > +    qtest_quit(qtest);
> > +}
> > +
> >   static void test_ccw_unplug(void)
> >   {
> >       QTestState *qtest = qtest_initf("-device virtio-balloon-ccw,id=dev0");
> > @@ -145,6 +162,8 @@ int main(int argc, char **argv)
> >        */
> >       qtest_add_func("/device-plug/pci-unplug-request",
> >                      test_pci_unplug_request);
> > +    qtest_add_func("/device-plug/pci-unplug-json-request",
> > +                   test_pci_unplug_json_request);
> >       if (!strcmp(arch, "s390x")) {
> >           qtest_add_func("/device-plug/ccw-unplug",
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


