Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEAF583F85
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:05:03 +0200 (CEST)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3CI-0002UW-Gw
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH36e-0008Fm-9g
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:59:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oH36b-0008UB-MV
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659013147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sUJe/Q6qoXWNKZeH7IgdkIpjnMr+m+tfRsCNVlroJs=;
 b=iFeaHTmdaCY4a0Jaf1hQw4xn43DasZ7pItPnyXOzrtshfoa1HXfYC2Lv+D842S87Lpwc1y
 mvG4FucTJbVMzgfsafhO7dmloR9Hj/tsaQ8sUmhOuAM9r2aKAmGJZu2ua0OL5yE02Z4fP7
 Z17a08nmliobcEzmUp7+NOt+gIVhBfY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-yi31JiBzOYeQpyi8SWUTvA-1; Thu, 28 Jul 2022 08:59:04 -0400
X-MC-Unique: yi31JiBzOYeQpyi8SWUTvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4F1585A581;
 Thu, 28 Jul 2022 12:59:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 850B52166B29;
 Thu, 28 Jul 2022 12:59:02 +0000 (UTC)
Date: Thu, 28 Jul 2022 13:59:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 mst@redhat.com, t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org,
 dgilbert@redhat.com, agraf@suse.de
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
Message-ID: <YuKIFKtK0XkOLBM1@redhat.com>
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com> <20220728140037.4b1456ae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728140037.4b1456ae@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 28, 2022 at 02:00:37PM +0200, Igor Mammedov wrote:
> On Thu, 28 Jul 2022 11:23:00 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Thu, Jul 28, 2022 at 11:05:13AM +0100, Peter Maydell wrote:
> > > On Thu, 28 Jul 2022 at 10:48, Daniel P. Berrangé <berrange@redhat.com> wrote:  
> > > >
> > > > On Thu, Jul 28, 2022 at 05:35:58AM -0400, Igor Mammedov wrote:  
> > > > > QEMU probably can't carry OSK key[1] for legal reasons so it
> > > > > can't supply the valid default key. However when tests are run
> > > > > applesmc will pollute test log with distracting warning,
> > > > > silence that warning so it won't distract maintainers/CI.  
> > > >
> > > > What test is causing this problem ?  
> > > 
> > > bios-tables-test -- see here for the relevant bit of the log:
> > > 
> > > https://lore.kernel.org/qemu-devel/CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=qxqptZpwTp=TkcXrhg@mail.gmail.com/  
> > 
> > The right fix is for bios-tables-tests to pass an explicit 'osk' value
> > then. As its a test it doesn't have to be a genuine OSK, jsut any old
> > 64-byte string
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 359916c228..f6b5adf200 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1632,7 +1632,7 @@ static void test_acpi_q35_applesmc(void)
> >          .variant = ".applesmc",
> >      };
> >  
> > -    test_acpi_one("-device isa-applesmc", &data);
> > +    test_acpi_one("-device isa-applesmc,osk=iamalsonottherealoskimjustheretostopbiostablestestspammingstderr", &data);
> >      free_test_data(&data);
> >  }
> 
> that will work, care tho send a formal patch or should I take over?

Could you spin something up, as I'm not in a position to do formal
testing today.

> However we still have bogus default_osk, yes it will cause warning which
> typically nobody will see and end user will still end up with upset guest.
> Right thing would be to require osk explicitly and drop default completely.
> Users who actually run MacOS guest must be providing OSK explicitly already
> so they won't be affected and anyone else using default is broken anyways
> (whether QEMU started directly or through mgmt layer)

There are other patches onlist to make QEMU extract an osk from the
host hardware, which is ok because IIUC macOS allows you to run macOS
as a VM, provided the host is Apple hardware. 


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


