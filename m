Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F9A33D2DB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 12:21:37 +0100 (CET)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM7lY-0000RZ-Aa
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 07:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lM7kk-0008Qn-G1
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lM7ki-0002hU-2L
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 07:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615893642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIs5Yq2a/iJ8dkDlOJcHXAz0Hzzj3hRzNNLHaGQd8Hc=;
 b=LU+6bn+vi1cF8E4+yBypnHVzoBR+2FjMYfUOYMpziVNYG+LnCw+acBQnCGQR/i4Gkl29B9
 qN3OJyGXFXM9IWahCgr/NN+DSlplF37LmqBp+BJpP9NWUJq+5836Z+kb5U7ndsGS37RKoA
 wLakC030pNY47lSsk1OR5Jf9upaurG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-MfXkgxe8Oxe82AkRUJEB2g-1; Tue, 16 Mar 2021 07:20:40 -0400
X-MC-Unique: MfXkgxe8Oxe82AkRUJEB2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D97E818D6A2A;
 Tue, 16 Mar 2021 11:20:39 +0000 (UTC)
Received: from work-vm (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FD7E5D768;
 Tue, 16 Mar 2021 11:20:35 +0000 (UTC)
Date: Tue, 16 Mar 2021 11:20:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] migration: Move populate_vfio_info() into a separate file
Message-ID: <YFCUgJZXe0HxHbDn@work-vm>
References: <20210315190756.317710-1-thuth@redhat.com>
 <f26d3ce6-b51a-7c44-2ec1-21a6bd2d4a46@redhat.com>
 <2e455379-15de-835c-014f-8ae2c26639a6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2e455379-15de-835c-014f-8ae2c26639a6@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> On 15/03/2021 22.05, Philippe Mathieu-Daudé wrote:
> > Hi Thomas,
> > 
> > +Alex
> > 
> > On 3/15/21 8:07 PM, Thomas Huth wrote:
> > > The CONFIG_VFIO switch only works in target specific code. Since
> > > migration/migration.c is common code, the #ifdef does not have
> > > the intended behavior here. Move the related code to a separate
> > > file now which gets compiled via specific_ss instead.
> > > 
> > > Fixes: 3710586caa ("qapi: Add VFIO devices migration stats in Migration stats")
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   migration/meson.build |  3 ++-
> > >   migration/migration.c | 15 ---------------
> > >   migration/migration.h |  2 ++
> > >   migration/special.c   | 25 +++++++++++++++++++++++++
> > >   4 files changed, 29 insertions(+), 16 deletions(-)
> > >   create mode 100644 migration/special.c
> > > 
> > > diff --git a/migration/meson.build b/migration/meson.build
> > > index 9645f44005..e1f72f6ba0 100644
> > > --- a/migration/meson.build
> > > +++ b/migration/meson.build
> > > @@ -30,4 +30,5 @@ softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
> > >   softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
> > >   softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
> > > -specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files('dirtyrate.c', 'ram.c'))
> > > +specific_ss.add(when: 'CONFIG_SOFTMMU',
> > > +                if_true: files('dirtyrate.c', 'ram.c', 'special.c'))
> > 
> > Why not simply name this migration/vfio.c? That way we do not start
> > mixed bag of everything target specific.
> 
> I don't mind ... well, if we have other small functions there in the future
> that depend on CONFIG switches, a mixed bag file might not be such a bad
> idea instead of having lots and lots of small other files ... OTOH, if there
> is more vfio migration code in the works that might fit here, a name like
> vfio.c would be better, of course. What do the maintainers think?

Could this be done with stubs instead of an ifdef; i.e. a stub of
'vfio_mig_active' and 'vfio_mig_bytes_transferred'?

As for naming 'special' is too generic.
'vfio' is too specific (especially since most vfio code ends up under
hw/vfio)

how about migration/target.c  as something which is explicit about why
it's done that way.

Dave

>  Thomas
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


