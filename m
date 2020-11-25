Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70F2C4808
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 20:04:33 +0100 (CET)
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ki05f-00019Y-Mg
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 14:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ki04i-0000fq-9w
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ki04g-0006Rg-AU
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 14:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606331009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KkUSHwcc8lRn83gyboN2a9R1PnTcD0ULjCI0+4iMbM=;
 b=L+GC2QRG9WTQiYPCVBHLSHA3z9pgCeEGjeABqi5a+rejMoY9bfPTsWbZti3M83b6ZEHrWQ
 l7z6BFhlC/PeQK5n/kFeT+48G5SCk1hhVPSwtXGXT1c6LbXIUa0iQ2HEgjHkE2HeANo13u
 C774XvECD6M4rlW9DB3n9xpy0Ktzd7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-gLB0ywzANtqRVHCV4-EwOA-1; Wed, 25 Nov 2020 14:03:25 -0500
X-MC-Unique: gLB0ywzANtqRVHCV4-EwOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CEB2185E48A;
 Wed, 25 Nov 2020 19:03:24 +0000 (UTC)
Received: from work-vm (ovpn-115-12.ams2.redhat.com [10.36.115.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24FB560936;
 Wed, 25 Nov 2020 19:03:09 +0000 (UTC)
Date: Wed, 25 Nov 2020 19:03:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 1/1] Fix to show vfio migration stat in migration status
Message-ID: <20201125190307.GL3222@work-vm>
References: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
 <20201125093036.GA3222@work-vm>
 <debd3545-1d63-f0e4-784f-a968119f0137@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <debd3545-1d63-f0e4-784f-a968119f0137@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: alex.williamson@redhat.com, cjia@nvidia.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kirti Wankhede (kwankhede@nvidia.com) wrote:
> 
> 
> On 11/25/2020 3:00 PM, Dr. David Alan Gilbert wrote:
> > * Kirti Wankhede (kwankhede@nvidia.com) wrote:
> > > Header file where CONFIG_VFIO is defined is not included in migration.c
> > > file. Include config devices header file in migration.c.
> > > 
> > > Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
> > > stats")
> > > 
> > > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > 
> > Given it's got build problems; I suggest actually something cleaner
> > would be to swing populate_vfio_info into one of the vfio specific
> > files, add a stubs/ entry somewhere and then migration.c doesn't need
> > to include the device or header stuff.
> > 
> 
> Still function prototype for populate_vfio_info() and its stub has to be
> placed in some header file.

Which header file isn't that important; and the stub goes in a file in
stubs/

> Earlier I used CONFIG_LINUX instead of CONFIG_VFIO which works here. Should
> I change it back to CONFIG_LINUX?

No.

> I'm not very much aware of meson build system, I tested by configuring
> specific target, but I think by default if target build is not specified
> during configuration, it builds for multiple target that's where this build
> is failing. Any help on how to fix it would be helpful.

With my suggestion you don't have to do anything clever to meson
(which I don't know much about either).

Dave

> Thanks,
> Kirti
> 
> > Dave
> > 
> > > ---
> > >   meson.build           | 1 +
> > >   migration/migration.c | 1 +
> > >   2 files changed, 2 insertions(+)
> > > 
> > > diff --git a/meson.build b/meson.build
> > > index 7ddf983ff7f5..24526499cfb5 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -1713,6 +1713,7 @@ common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
> > >   common_all = common_ss.apply(config_all, strict: false)
> > >   common_all = static_library('common',
> > > +                            c_args:'-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target) ,
> > >                               build_by_default: false,
> > >                               sources: common_all.sources() + genh,
> > >                               dependencies: common_all.dependencies(),
> > > diff --git a/migration/migration.c b/migration/migration.c
> > > index 87a9b59f83f4..650efb81daad 100644
> > > --- a/migration/migration.c
> > > +++ b/migration/migration.c
> > > @@ -57,6 +57,7 @@
> > >   #include "qemu/queue.h"
> > >   #include "multifd.h"
> > > +#include CONFIG_DEVICES
> > >   #ifdef CONFIG_VFIO
> > >   #include "hw/vfio/vfio-common.h"
> > >   #endif
> > > -- 
> > > 2.7.0
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


