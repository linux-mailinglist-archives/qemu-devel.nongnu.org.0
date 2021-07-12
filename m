Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FA23C5F5C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:35:15 +0200 (CEST)
Received: from localhost ([::1]:53882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xxj-00082q-2O
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2xsv-00012z-8f
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:30:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m2xst-0001tt-7J
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103814;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=z6fF/nBWOh1laue+Q0aU0p25/NNU08nyV5zfr7tioJw=;
 b=TzEE0YU/awG9OQ7nZiprDDuMvhUIjNq2nPhp2w9bbqb8qy7sS99lJYT1WxYIha6+SunnHg
 I4mKslgdRJMY0QznAeS6d/5lqtjlaEKljTkrR/rcaQZkcUwV5qYoSu7vV4K4hjvWBWtSUe
 ecm23jLNpNmGOgI6QHVg+DdxgEokpDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-4b2cZgt8PqiKETEW0svE9w-1; Mon, 12 Jul 2021 11:30:13 -0400
X-MC-Unique: 4b2cZgt8PqiKETEW0svE9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA60B100976B;
 Mon, 12 Jul 2021 15:30:11 +0000 (UTC)
Received: from redhat.com (ovpn-114-105.ams2.redhat.com [10.36.114.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E965C1D1;
 Mon, 12 Jul 2021 15:30:05 +0000 (UTC)
Date: Mon, 12 Jul 2021 16:30:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [RFC PATCH 2/6] machine: Perform zero-check for the computed
 value of sockets
Message-ID: <YOxf+sxzUSJdbY+j@redhat.com>
References: <20210702100739.13672-1-wangyanan55@huawei.com>
 <20210702100739.13672-3-wangyanan55@huawei.com>
 <20210712150048.mstqbseixgdxakkf@gator>
MIME-Version: 1.0
In-Reply-To: <20210712150048.mstqbseixgdxakkf@gator>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 05:00:48PM +0200, Andrew Jones wrote:
> On Fri, Jul 02, 2021 at 06:07:35PM +0800, Yanan Wang wrote:
> > We currently perform zero-check (default the value to 1 if zeroed)
> > for the computed values of cores/threads, to make sure they are at
> > least 1. For consistency, we probably should also default sockets
> > to 1 if the computed value is zero. Note that this won't affect
> > any existing working cmdlines but will improve the error reporting
> > of the invalid ones such as "-smp 8,maxcpus=9,cores=10,threads=1".
> 
> How does this help error checking? If the user input values that compute a
> fractional (rounded down to zero with integer division) value, then we'll
> catch that with the sockets*cores*threads == maxcpus test now, but we may
> not catch that after this patch.

Since we're having alot of debates about what should be valid scenarios
vs invalid scenarios, I think this points towards introducing a tests
for the smp_parse function, that enumerates both the correct and
incorrect scenarios based on the current implementation.

This series should then update the test cases for scenarios that we
think are currently wrongly handled.

> 
> Thanks,
> drew
> 
> > 
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > ---
> >  hw/core/machine.c | 1 +
> >  hw/i386/pc.c      | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index f17bbe3275..1e194677cd 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -761,6 +761,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
> >          } else {
> >              maxcpus = maxcpus > 0 ? maxcpus : cpus;
> >              sockets = maxcpus / (cores * threads);
> > +            sockets = sockets > 0 ? sockets : 1;
> >          }
> >      } else if (cores == 0) {
> >          threads = threads > 0 ? threads : 1;
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index a9b22fdc01..a44511c937 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -729,6 +729,7 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
> >          } else {
> >              maxcpus = maxcpus > 0 ? maxcpus : cpus;
> >              sockets = maxcpus / (dies * cores * threads);
> > +            sockets = sockets > 0 ? sockets : 1;
> >          }
> >      } else if (cores == 0) {
> >          threads = threads > 0 ? threads : 1;
> > -- 
> > 2.19.1
> > 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


