Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78A737282A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 11:42:55 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrZu-0005XC-EM
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 05:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ldrYi-00056Y-5s
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ldrYa-0007UA-Ey
 for qemu-devel@nongnu.org; Tue, 04 May 2021 05:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620121289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRyNgHmeiVLnCy3xSzPJgEm6g2N/NC87u2gGhSbkvEQ=;
 b=VAxEg4u3f9XLvLKY2/croyVCiqoSh/tWMg758M7YzicTN06wUy0WG9yBBEZVCR6xmg8M6X
 SMBMos0qs9mWL40wjF0oH6MdxsBTyz6UtkfFx20Rk+AtzaAhvcSGyYXK5vnq3tu+DLMp0Z
 jYklMKkn1kXWD0kkxemGqTiHYIAygaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-d3cuCxvqMROlMRmZo_1IcQ-1; Tue, 04 May 2021 05:41:27 -0400
X-MC-Unique: d3cuCxvqMROlMRmZo_1IcQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6505D107ACC7;
 Tue,  4 May 2021 09:41:26 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E67D817A8B;
 Tue,  4 May 2021 09:41:24 +0000 (UTC)
Date: Tue, 4 May 2021 10:41:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 4/6] migration-test: Make sure that multifd and cancel
 works
Message-ID: <YJEWwlpOTLAHNUev@work-vm>
References: <20200122111517.33223-1-quintela@redhat.com>
 <20200122111517.33223-5-quintela@redhat.com>
 <CAFEAcA8XG2ATagb=ed5oDW=PsMBzAYoQK3DN6Os3_oMusYkAuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8XG2ATagb=ed5oDW=PsMBzAYoQK3DN6Os3_oMusYkAuA@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 22 Jan 2020 at 11:20, Juan Quintela <quintela@redhat.com> wrote:
> >
> > Test that this sequerce works:
> >
> > - launch source
> > - launch target
> > - start migration
> > - cancel migration
> > - relaunch target
> > - do migration again
> >
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> A year-old commit, but we've just got around to running Coverity
> on the tests/ directory, and it spotted this one:
> 
> >  static void migrate_set_capability(QTestState *who, const char *capability,
> >                                     bool value)
> 
> The 3rd argument to migrate_set_capability() is a bool...

oops

> 
> > +static void test_multifd_tcp_cancel(void)
> > +{
> 
> > +    migrate_set_parameter_int(from, "downtime-limit", 1);
> > +    /* 300MB/s */
> > +    migrate_set_parameter_int(from, "max-bandwidth", 30000000);
> > +
> > +    migrate_set_parameter_int(from, "multifd-channels", 16);
> > +    migrate_set_parameter_int(to, "multifd-channels", 16);
> > +
> > +    migrate_set_capability(from, "multifd", "true");
> > +    migrate_set_capability(to, "multifd", "true");
> 
> ...but here you pass it the character string '"true"' rather than
> the boolean value 'true'.
> 
> This works by fluke since the implicit comparison of the literal string
> against NULL will evaluate to true, but it isn't really right :-)
> 
> CID 1432373, 1432292, 1432288.
> 
> There seem to be 7 uses of the string "true" when the boolean
> was intended; I don't know why Coverity only found 3 issues.

I'll send a patch.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


