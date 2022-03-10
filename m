Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626044D454D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:02:46 +0100 (CET)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSGZB-0004Kz-5Z
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSGXI-0003Zm-ES
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSGXB-0003Zb-QO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646910039;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAKS0Xv0YDZMH53sr9NqYoM0X8IFyh6SZuGRiiuv2Qo=;
 b=EMHqGiV9lbIaiBFUhvec0dekEliqRYT9+rSNj5Ai6urfxVXuTShtjJ1XQDvpLYiROz7sCi
 Vn1WuKbDzW0L2ygIJp15PHscI1sZT0gvIvGP4dDVRAqK9/GYGBnpleESppgCbClo72huSZ
 guvi5p9asOWi96e/yaMOOsLU+t47zXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-sAEoYnbsOOivW6F2lfz3og-1; Thu, 10 Mar 2022 06:00:38 -0500
X-MC-Unique: sAEoYnbsOOivW6F2lfz3og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EDAD5200
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 11:00:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CE3F1F2E5;
 Thu, 10 Mar 2022 11:00:08 +0000 (UTC)
Date: Thu, 10 Mar 2022 11:00:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 08/18] tests: merge code for UNIX and TCP migration
 pre-copy tests
Message-ID: <YinaNTUzZJpepoVz@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-9-berrange@redhat.com>
 <e4a80a6d-ab9b-8d9d-11d4-dd395ac7d347@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e4a80a6d-ab9b-8d9d-11d4-dd395ac7d347@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 11:11:07AM +0100, Thomas Huth wrote:
> On 02/03/2022 18.49, Daniel P. Berrangé wrote:
> > The test cases differ only in the URI they provide to the migration
> > commands, and the ability to set the dirty_ring mode. This code is
> > trivially merged into a common helper.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   roms/seabios                 |  2 +-
> >   tests/qtest/migration-test.c | 86 ++++++++++++++++--------------------
> >   2 files changed, 40 insertions(+), 48 deletions(-)
> > 
> > diff --git a/roms/seabios b/roms/seabios
> > index 6a62e0cb0d..2dd4b9b3f8 160000
> > --- a/roms/seabios
> > +++ b/roms/seabios
> > @@ -1 +1 @@
> > -Subproject commit 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9
> > +Subproject commit 2dd4b9b3f84019668719344b40dba79d681be41c
> 
> Did you really want to update the submodule here?

Of course not :-(

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


