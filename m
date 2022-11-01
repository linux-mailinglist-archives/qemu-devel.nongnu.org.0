Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D6614A46
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 13:04:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppz6-000298-Aj; Tue, 01 Nov 2022 08:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oppz4-00028Q-EA
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 08:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oppz2-0003Q7-LW
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 08:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667304187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Bn2/dCEwdACpfO3kNz94ohdcM4RA8F/SPluQ9hGN7/k=;
 b=DCTJqdX3oBQlfswaitbu9kP3Rh6Nsf5PTw3QTMQnal85pzyW41xScq3nwpHyunbYynBwwM
 oc3ZaLHq1TT8UXksNHEOzYCJfW1kQu3y5RzDqZVkoLpZAqMQM8ymmEzCsrMf/BcsIZ6axs
 ZBcS6/W5AMYNCE1tecopeiQkRU1jaBw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-y5GsXJ0rNM-NmrSzgENXvw-1; Tue, 01 Nov 2022 08:03:03 -0400
X-MC-Unique: y5GsXJ0rNM-NmrSzgENXvw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74CDA381A729;
 Tue,  1 Nov 2022 12:03:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7095E492B0B;
 Tue,  1 Nov 2022 12:03:02 +0000 (UTC)
Date: Tue, 1 Nov 2022 12:03:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 1/3] util/main-loop: Fix maximum number of wait
 objects for win32
Message-ID: <Y2EK9D2z4TkLb3+M@redhat.com>
References: <20221019102015.2441622-1-bmeng.cn@gmail.com>
 <CAEUhbmUmE12maezBm9x0EJQnTQkavMa8EcoNPd8LcHTawFQzYg@mail.gmail.com>
 <CAEUhbmWNRpZp0EvNC9snrpqTVDx13EhBzSWxiKta_ZAjcfkDDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEUhbmWNRpZp0EvNC9snrpqTVDx13EhBzSWxiKta_ZAjcfkDDA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 01, 2022 at 09:14:55AM +0800, Bin Meng wrote:
> Hi Daniel,
> 
> On Wed, Oct 26, 2022 at 12:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Wed, Oct 19, 2022 at 6:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > The maximum number of wait objects for win32 should be
> > > MAXIMUM_WAIT_OBJECTS, not MAXIMUM_WAIT_OBJECTS + 1.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > > Changes in v4:
> > > - make the out of bounds access protection explicit
> > >
> > > Changes in v3:
> > > - move the check of adding the same HANDLE twice to a separete patch
> > >
> > > Changes in v2:
> > > - fix the logic in qemu_add_wait_object() to avoid adding
> > >   the same HANDLE twice
> > >
> > >  util/main-loop.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> >
> > Ping?
> 
> Would you queue this series? Thanks!

The main loop is not my area as maintainer - it would normally be
Paolo IIRC.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


